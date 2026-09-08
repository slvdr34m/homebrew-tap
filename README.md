# slvdr34m/homebrew-tap

Personal Homebrew tap.

```sh
brew tap slvdr34m/tap
brew install arthas
```

## arthas

[Alibaba Arthas](https://arthas.aliyun.com/) — Java diagnostic tool.
Self-contained install: `as.sh` and all jars live in the keg's `libexec`, so
nothing is downloaded into `~/.arthas` at runtime.

The `autobump` workflow checks `alibaba/arthas` releases daily and commits the
bumped formula straight to `main`, so `brew update && brew upgrade` picks up new
upstream releases with no manual step.

To bump and upgrade immediately without waiting for the workflow:

```sh
brew arthas-update          # bump the formula to the newest release, then upgrade
brew arthas-update --check  # only report whether a newer release exists
```
