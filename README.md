# yakut

Yet Another KUbernetes Template

Dynamically configure your Kubernetes manifests with Jinja2 templates


## Build and install on Ubuntu/Debian
```shell
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54
sudo bash -c "echo 'deb https://dist.crystal-lang.org/apt crystal main' > /etc/apt/sources.list.d/crystal.list"
sudo apt-get update
sudo apt-get install crystal libxml2-dev libyaml-dev
git clone https://github.com/artworx/yakut.git yakut
cd yakut
shards build
sudo install bin/yakut /usr/local/bin/
```

## Installation

Install [crystal](https://crystal-lang.org/docs/installation/index.html)

Run `shards build` in the project directory.

## Usage

```
  yakut - Yet Another KUbernetes Template

  Usage:

    yakut [options] [arguments] ...

  Options:

    --help                           Show this help.
    -c config.yml, --config=config.yml
                                     Config file  [default:config.yml]
    -p profile, --profile=profile    The kubernetes profile  [required]
    -t templates, --templates-directory=/path/to/templates
                                     The directory path to the templates  [default:templates]
    -o outdir, --output-directory=k8s
                                     The directory path for output files  [default:k8s]
    -D DEFINE=VALUE                  define properties
```

Crinja Templates Documentation: https://github.com/straight-shoota/crinja/blob/master/TEMPLATE_SYNTAX.md

## Contributing

1. Fork it ( https://github.com/artworx/yakut/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [artworx](https://github.com/artworx) Alexandru Keszeg - creator, maintainer

Inspired by https://forge.sh/
