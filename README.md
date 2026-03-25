# SpiceDB Validate GitHub Action

[![Docs](https://img.shields.io/badge/docs-authzed.com-%234B4B6C "Authzed Documentation")](https://docs.authzed.com)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg "Apache 2.0 License")](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://github.com/authzed/action-spicedb-validate/workflows/test/badge.svg "GitHub Actions")](https://github.com/authzed/action-spicedb-validate/actions)
[![Discord Server](https://img.shields.io/discord/844600078504951838?color=7289da&logo=discord "Discord Server")](https://discord.gg/jTysUaxXzM)
[![Twitter](https://img.shields.io/twitter/follow/authzed?color=%23179CF0&logo=twitter&style=flat-square "@authzed on Twitter")](https://twitter.com/authzed)

This project is a [GitHub Action] that runs the [zed] `validate` command for a SpiceDB schema and test data.

A compatible file can be produced by downloading from the [Authzed Playground].

[zed]: https://github.com/authzed/zed
[GitHub Action]: https://github.com/features/actions
[Authzed Playground]: https://play.authzed.com

## Usage

Add the following to any workflow:

```yaml
steps:
- uses: "actions/checkout@v4"
- uses: "authzed/action-spicedb-validate@v1"
  with:
    validationfile: "myschema.zaml"
    zed-version: "latest" # optional, defaults to latest
```

> **Note:** The `actions/checkout` step is required before running this action.
> Without it, your repository files won't be available and validation will fail with "no such file or directory".

The `validationfile` path should be relative to the repository root.

The `zed` CLI is copied into the image at **build time** from [`quay.io/authzed/zed`](https://quay.io/repository/authzed/zed). The tag is controlled by `ARG ZED_VERSION` in `Dockerfile` (default `latest`). To pin a version when building this action image yourself, run `docker build --build-arg ZED_VERSION=v0.27.0 .` (use a tag that exists for that registry image).

The `zed-version` action input sets `ZED_VERSION` at runtime and defaults to `latest` when omitted.

See [test-schema.zaml] for an example of an input file.

[test-schema.zaml]: test-schema.zaml
