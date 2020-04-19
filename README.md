# Template Python Project

## How to use:

- Clone this repository
- Run `rename.sh new_project_name` script to rename things automatically (E.g. `rename.sh
 superproj` - this will replace all occurrences of boilerplate names "****template_app****" to
 "****superproj****")
- *Optionally* configure local machine environment - this step enables pre-commit hooks
, `black` tool
 for automatic formatting and `pylint` for linting:
    - Initialize and activate virtualenv (e.g `python3 -m venv proj_env; source ./proj_env/bin
    /activate`)
    - Install requirements: `pip install -r dev.requirements.txt`.
    Note that there is also `requirements.txt` - this file contains project dependencies of the app
    and aimed to be ran in a docker container so it does not contain any linting, formatting tools.

> **WARNING**:
The project is supposed to be ran in docker. But linting, auto formatting and git hooks have to be
executed locally, so it's recommended to sync Python versions of Dockerfile and the local one.

## Running app

#### Using (Local) Python Interpreter:
`make local-run`

#### Using Docker:
`make run`

## Testing

Tests automatically are ran every time you (re)build _dev_ or _prod_ image. You can also run tests
 using:

`make test` - to run in docker container

`make local-test` - to run locally

## Cleaning

`make clean` - This will remove docker not running contaiers, <none> images and _pytest_,
 _coverage_ cache/files
