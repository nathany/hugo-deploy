# Hugo Deploy

This is an starting point for a [Hugo](https://gohugo.io/) blog with deployment to [Amazon S3](https://aws.amazon.com/s3/) via [GitHub Actions](https://github.com/features/actions) and [s3deploy](https://github.com/bep/s3deploy).

It's how I deploy [nathany.com](https://nathany.com/), [Edmonton Go](https://edmontongo.org/), and [fsnotify.org](https://fsnotify.org/).

## Requirements

Local development:

* Install the `hugo` binary, download it at [gohugo.io](https://gohugo.io/).
  * On Mac use [Homebrew](https://brew.sh/): `brew install hugo`

Remote:

* A GitHub account with the contents of your website (free).
* An Amazon account to create an S3 bucket (pennies).
* DNS configured to point to S3. 
    * [CloudFlare](https://www.cloudflare.com/) is recommend for HTTPS (free).

## What Is Provided?

* `hugo new site <mysite>` creates a config.toml and a few empty folders. I've added .gitkeep files so those folders are checked in.
* An `assets/sass` folder with `all.sass` that will be converted to css.
* A script to watch for file changes in development and include drafts in the output. Run `./watch.sh`.
* `.gitignore` to avoid committing the generated files.
* Various files that GitHub Actions uses during deployment (`.github/workflows/build.yml`, `ci-install-hugo.sh`, `ci-install-s3deploy.sh`).

### Deployment
GitHub Actions automatically deploy the website when changes are merged to the master branch on GitHub. In my experience, deploys take a few seconds to complete.

* [hugo-deploy-example.s3-website.ca-central-1.amazonaws.com](http://hugo-deploy-example.s3-website.ca-central-1.amazonaws.com) is the website endpoint on Amazon S3.
