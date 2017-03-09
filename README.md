# Overview
This is a DRAFT and but gives you the overview of how to do it. Future updates will go into more details. I also do not cover how to deploy your release after it's created and copied to a bucket.

We are going to create a container with elixir and mix that gets our dependencies, compiles our app and creates the release using distillery. The resulting tar.gz file is then going to get copied to a release bucket and named with :appname-version-git_hash.tar.gz.

The domain globaldomination.co is used here as an example, when you see it, you'll know you need to change something.

I don't cover how to link your repository to container build, see the docs for directions.

-Start with a stock Phoenix 1.2 application.

-Add Distillery, mix release.init, and update config/prod.exs

-Comment out prod.secrets.exs in config/prod.exs

-Add docker/Dockerfile for elixir-mix container

-Add distillery plugin to rel/plugins/plugin.exs. Plugin will copy the resulting .tar.gz files to the _build/prod/rel/artifacts directory.

-Change version in rel/config.exs to append git hash to end of version string

-Add cloudbuild.yaml with steps to build and copy artifact

# Build Dockerfile
The first thing lets send the docker/Dockerfile to be built and sent to storage.

Replace $PROJECT with your gcloud project name:
```
gcloud container builds submit --tag gcr.io/$PROJECT/elixir-mix .
```

# Edit cloudbuild.yaml
At a minimum you'll need to change the destination on the very last line to your own bucket.

# Steps

## 1. Get Elixir dependencies
Brunch in step 2 has dependencies on phoenix and phoenix_html, so we need to get the Elixir dependencies first.

## 2. Brunch
Install the npm dependencies and do a brunch build to compile the static assets.

## 3. Compile & Release
Compile everything and create a release using distillery.

## 4. Copy output artifacts
Copy the .tar.gz files created by distillery to a bucket.