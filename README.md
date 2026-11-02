# jeffarese/tap

Homebrew formulae for [herdr-pool](https://github.com/jeffarese/herdr-pool).

```sh
brew install jeffarese/tap/herdr-pool
herdr-pool init
```

Update with `brew upgrade herdr-pool`, then `herdr-pool skill install` to refresh
the agent skill.

## Releasing

`scripts/release.sh X.Y.Z` in herdr-pool tags the release and opens the formula
update here. CI (`brew test-bot`) builds bottles for macOS 15 and 26 on Apple
silicon and for Linux; the script then runs the `brew pr-pull` workflow, which
uploads them and merges the update. Intel Macs build from source.
