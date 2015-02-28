# Hugo Deploy

This is an starting point for a [Hugo](http://gohugo.io/) blog with deployment to [Amazon S3](http://aws.amazon.com/s3/) via [CircleCI](https://circleci.com/).

This is how I deploy [Edmonton Go](https://edmontongo.org/), [fsnotify.org](https://fsnotify.org/) and [Lua Nova](https://luanova.org/).

Deploys happen automatically whenever changes are merged to the master branch on GitHub. In my experience, deploys take about 30 seconds to complete.

## Requirements

Local development:

* Install the `hugo` binary, download it at [gohugo.io](http://gohugo.io/).
* Install [sassc](https://github.com/sass/sassc) to use [Sass](http://sass-lang.com/) for stylesheets.
  * On Mac use: `brew install sassc`
  * SassC doesn't watch for file changes, but if you have Go installed, you can use [Reflex](https://github.com/cespare/reflex).
* Install [Pygments](http://pygments.org/) if you want to use [syntax highlighting](http://gohugo.io/extras/highlighting/).

Remote:

* A GitHub account with the contents of your website (free).
* A CircleCI account authorized with GitHub (free).
* An Amazon account to create an S3 bucket (pennies).
* DNS configured to point to S3. 
    * [CloudFlare](https://www.cloudflare.com/) is recommend for HTTPS (free).

## What Is Provided?

* `hugo new site <mysite>` creates a config.toml and a few empty folders. I've added .gitkeep files so those folders are checked in.
* A sass folder with `all.sass` that will be converted to `static/css/all.css`.
* A script to watch for file changes in development and include drafts in the output. Run `./watch.sh`.
* `.gitignore` to avoid committing the generated sass or static files.
* Various files that CircleCI uses during deployment (`circle.yml`, `ci-install-hugo.sh`, `ci-install-sassc`, `requirements.txt`)
