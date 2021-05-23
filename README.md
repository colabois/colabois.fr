<h1 align="center">Colabois.fr</h1>

<p align="center">
    <a href="https://colabois.fr">
        <img src="https://jenkins.colabois.fr/buildStatus/icon?job=Colabois%2Fcolabois.fr%2Fmain&subject=production&style=flat">
    </a>
    <a href="https://www-dev.colabois.fr">
        <img src="https://jenkins.colabois.fr/buildStatus/icon?job=Colabois%2Fcolabois.fr%2Fdev&subject=www-dev&style=flat">
    </a>
    <a href="http://weblate.colabois.fr/engage/colabois-fr/">
        <img src="http://weblate.colabois.fr/widgets/colabois-fr/-/svg-badge.svg" alt="État de la traduction" />
    </a>
</p>

<p align="center">
    <img src=".readme/screenshots/1.jpg">
</p>

## Contributing

### Building

#### Dependencies

This site relies on Jekyll so you will need to [install it](https://jekyllrb.com/docs/installation/)

You will also need `make` if you don't want to run Jekyll commands manually

#### Build

`make build` or `bundle exec jekyll build`

#### Run

`make run` or `bundle exec jekyll serve`

### Translation

I make all the translations with the VSCode plugin [i18n Ally](https://marketplace.visualstudio.com/items?itemName=Lokalise.i18n-ally) and I highly recommend to do so

You just need to install the plugin and it should automatically be configured following the configuration files in the `.vscode/` folder.

If you really don't want to use VSCode or i18n Ally at all you can just edit the yml files manually in _i18n/
