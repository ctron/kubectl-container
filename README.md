# `kubectl` in a container

This repository provides a container with kubectl and jq in a container, because every now and then it comes
in handy.

## Tags

In general, the images get tagged as follows:

| Tag | Content |
| ----| --------|
| `a.b.c`  | Version `a.b.c` |
| `a.b`    | Highest version from `a.b.*` |
| `latest` | The highest overall version |

## Rebuilds

The repository automatically rebuilds the containers on a weekly schedule, for all released versions of kubectl.

For all? Not exactly. Some kubectl versions didn't get released, and some tags point to the wrong version of kubectl. So
the script will remove those broken versions, and not push them.
