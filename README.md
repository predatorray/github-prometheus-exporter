# github-prometheus-exporter

![GitHub top language](https://img.shields.io/github/languages/top/predatorray/github-prometheus-exporter)
[![GitHub](https://img.shields.io/github/license/predatorray/github-prometheus-exporter)](./LICENSE)
[![Docker Build](https://img.shields.io/docker/cloud/build/zetaplusae/github-prometheus-exporter.svg)](https://hub.docker.com/repository/docker/zetaplusae/github-prometheus-exporter)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/zetaplusae/github-prometheus-exporter)](https://hub.docker.com/repository/docker/zetaplusae/github-prometheus-exporter)

A docker image that exposes metrics about your Github repository in Prometheus format.

```sh
docker pull zetaplusae/github-prometheus-exporter
```

## Metrics

Metric Name | Help
--- | ---
`github_repo_stars` | Repository Stars
`github_assets_download_count` | Release Assets Download Count
`github_assets_size` | Release Assets Size
`github_assets_count` | Release Assets Count


## Example

```sh
# <your-repository-name>
# e.g. predatorray/github-prometheus-exporter

docker run -d \
    -e GITHUB_REPO='<your-repository-name>' \
    -p 80:80 \
    zetaplusae/github-prometheus-exporter
```

By running the command above, an HTTP server will be started on port `80`.

`curl http://localhost/metrics` will output,

```sh
# HELP github_assets_download_count Github Assets download count.
# TYPE github_assets_download_count counter
github_assets_download_count{asset_state="uploaded",target_commitish="master",draft="false",release_id="123",uploader="<author>",repo="<your-repository-name>",asset_id="456",content_type="application/x-gzip",tag_name="v1.0",release_name="v1.0",asset_name="foobar-1.0.tar.gz",prerelease="false",} 99

# HELP github_assets_size Github Assets size.
# TYPE github_assets_size gauge
github_assets_size{asset_state="uploaded",target_commitish="master",draft="false",release_id="123",uploader="<author>",repo="<your-repository-name>",asset_id="456",content_type="application/x-gzip",tag_name="v1.0",release_name="v1.0",asset_name="foobar-1.0.tar.gz",prerelease="false",} 99

# HELP github_assets_count Github Assets count.
# TYPE github_assets_count counter
github_assets_count{repo="<your-repository-name>",} 1

# HELP github_repo_stars Github Repository Stars
# TYPE github_repo_stars counter
github_repo_stars{repo="<your-repository-name>",} 99

# HELP github_api_request_duration_seconds Github API Request Duration (sec).
# TYPE github_api_request_duration_seconds gauge
github_api_request_duration_seconds{http_status="200",path="/repos/<your-repository-name>/releases",repo="<your-repository-name>",} 1
github_api_request_duration_seconds{http_status="200",path="/repos/<your-repository-name>/stargazers",repo="<your-repository-name>",} 1
```

## Configuration

This image relies on the following environment variables:


Env Name                | Required | Help
------------------------| -------- | ---
`GITHUB_REPO`           | true     | The name of your Github repository.<br>(e.g. `predatorray/github-prometheus-exporter`)
`GITHUB_API_SERVER`     | false    | The URL to the Github API Server.<br>(Default: `https://api.github.com`)
`GITHUB_USER`           | false    | The Github user. <br>(See the [Authentication Wiki](https://github.com/predatorray/github-prometheus-exporter/wiki/Authentication))
`GITHUB_ACCESS_TOKEN`   | false    | The Github access token of the user.<br>(See the [Authentication Wiki](https://github.com/predatorray/github-prometheus-exporter/wiki/Authentication))

## Links

This project is developed with the help of these two open-sourced project:

 - [prometheus-bash-exposition](https://github.com/predatorray/prometheus-bash-exposition): a command line tool, written in Bash, that prints Prometheus exposition format file.

 - [lighttpd-cgi-docker](https://github.com/predatorray/lighttpd-cgi-docker): an out-of-the-box lighttpd image for CGI scripts based HTTP server.

## Support

You can ask me anything about this project by [creating an issue](https://github.com/predatorray/github-prometheus-exporter/issues).
