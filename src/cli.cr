require "clim"
require "crinja"
require "colorize"
require "./yakut"

module Yakut
  class Cli < Clim
    # Following is difinition of main command.
    #
    main_command
    desc   "yakut - Yet Another KUbernetes Template"
    usage  "yakut [options] [arguments] ..."

    string "-c service.yaml", "--config=service.yaml", desc: "Config file", default: "service.yaml"
    string "-p profile", "--profile=profile", desc: "The kubernetes profile", required: true
    string "-t templates", "--templates-directory=/path/to/templates", desc: "The directory path to the templates", default: "k8s"
    string "-o outdir", "--output-directory=dist", desc: "The directory path for output files", default: "dist"

    array "-D DEFINE=VALUE", desc: "define properties"

    run do |opts, args|
      config_file = opts["config"].as(String)
      profile = opts["profile"].as(String)
      templates_dir = opts["templates-directory"].as(String)
      dist_dir = "#{opts["output-directory"]}/#{profile}"

      config = Configuration.parse(config_file)
      config.add_arguments(opts["D"].as(Array(String))) unless opts["D"].nil?

      batch_compiler = BatchCompiler.new(dist_dir, config.values_for_profile(profile))
      listing = Yakut::FileList.new(templates_dir: templates_dir)
      batch_compiler.run(listing)
    end
  end
end

begin
  Colorize.on_tty_only!
  Yakut::Cli.start(ARGV)
rescue e
  print e.message.colorize(:red)
  print "\n"
  exit 1
end
