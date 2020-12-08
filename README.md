# Template Python repository

This is a template Python repository.

Repository structure:

* .github: Github Actions for Continuous Integration
* docs: Sphinx (auto-generated) documentation
* notebooks: Jupyter notebooks
* requirements: Python requirement files and their pinned versions
* src: The main codebase
* tests: Unit and Integration tests
* tools: Tools for managing the repository


Features:
* [Sphinx](https://www.sphinx-doc.org): Documentation generator
* [pip-compile-multi](https://pip-compile-multi.readthedocs.io/): Python requirement and dependency locking
* Git [pre-commit](https://pre-commit.com/) hooks
  * [codespell](https://github.com/codespell-project/codespell): Check for common misspellings in text files.
  * [black](https://github.com/psf/black): Automatic code formatting
  * [isort](https://pycqa.github.io/isort/): Automatic sorting of Python imports
  * [nbstripout](https://github.com/kynan/nbstripout): Automatic stripping of notebook output
  * License checking, which uses:
    * [pip-licenses](https://github.com/raimon49/pip-licenses): Get license info using pip
    * [pipdeptree](https://github.com/naiquevin/pipdeptree): Get pip dependency tree
  * [and more](https://github.com/pre-commit/pre-commit-hooks): File size checking, remove trailing whitespace, ..
* Continuous Integration based on [Github Actions](https://github.com/features/actions), using:
  * [mypy](https://mypy.readthedocs.io/): Python type checker
  * [pytest](https://docs.pytest.org/) unit and integration testing
    * [pytest-cov](https://github.com/pytest-dev/pytest-cov): Pytest coverage checker
    * [pytest-clarity](https://github.com/darrenburns/pytest-clarity): Pytest improved readability
  * [pycodestyle](https://pycodestyle.pycqa.org/): Python PEP8 style checker
  * [pylint](https://www.pylint.org): Python linter
  * Docstring checkers/linters
    * [darglint](https://github.com/terrencepreilly/darglint): Python docstring linter
    * [interrogate](https://interrogate.readthedocs.io/): Python docstring coverage checker
    * [pydocstyle](https://github.com/PyCQA/pydocstyle): Python docstring style checker
  * [shellcheck](https://github.com/koalaman/shellcheck): Shell file linter

Future enhancements:
* [MyST](https://myst-parser.readthedocs.io): Markdown support for sphinx documentation

# Development

## Setup after cloning this repository
1. Setup a conda environment (replace `<env_name>` with a suitable name):
```conda env create -n <env_name> -f requirements.yml```
This sets up an environment to track and encapsulate the dependencies of the project.
When working on this project switch to the environment first, using:
```conda activate <env_name>```
To exit the environment use: `conda deactivate <env_name>`

2. Install the git pre-commit hooks:
```pre-commit install```
This will perform sanity checks and format your code before git adds the (updated) files to the git repository.

## Workflow

## Tracking requirements and their dependencies
To keep track of requirements, add them to the `requirements/base.in` file in the appropriate section.
After adding or removing requirements, the requirements and their dependencies can be pinned to specific versions by running:
```pip-compile-multi```
This will pin all requirements and dependencies to specific versions in the `requirements/*.txt` files for reproducibility.
The `base` file contains deployment dependencies, while the `dev` file contains development dependencies.

## Style and Continuous Integration checks/formatters

### Local (pre-commit) checks and formatters
To run the local pre-commit checks, execute:
```pre-commit run```
Note: Only _staged_ files will be checked.

To run on all git-tracked files in the repository: `pre-commit run --all-files` or `pre-commit run -a`.
Note: This will still _not_ run on _untracked_ files. First stage any untracked/modified files you which to check.
The local pre-commit checks are run using `pre-commit` based on the configuration in `.pre-commit-config.yaml`.

For convenience, it is possible to run a single check, for example, for `pylint` use `pre-commit run pylint`.

### Continuous Integration checks and formatters
To run all CI checks, run:
```./tools/ci_checks.sh```
The script will check all files in the git repository.

For convenience, it is possible to run a single check, for example, for `mypy`:
```./tools/ci_checks.sh mypy```

The CI checks are run using `pre-commit` based on the configuration in `tools/ci-pre-commit-config.yaml`.

## Building the documentation
To build the documentation run:
```
cd docs
make html
```
The documentation will be output in `docs/build/html`.
