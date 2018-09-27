**[Features](#features)** |
**[Requirements](#requirements)** |
**[Installation](#installation)** |
**[Configuration](#configuration)** |
**[Getting help](#getting-help)** |
**[License](#license)** |
**[Resources](#resources)**

# h2ospawner #

A systemdspawner subclass which spawning h2o flow.

## Features ##

spawning h2o flow.


## Requirements ##

same as systemdspawner


## Installation ##

You can install it from PyPI with:

```bash
pip install h2ospawner
```

You can enable it for your jupyterhub with the following lines in your
`jupyterhub_config.py` file

```python
c.JupyterHub.spawner_class = 'h2ospawner.H2OSpawner'
```

## Configuration ##

Lots of configuration options for you to choose! You should put all of these
in your `jupyterhub_config.py` file:


cmd = []



## Getting help ##

We encourage you to ask questions on the [mailing list](https://groups.google.com/forum/#!forum/jupyter).
You can also participate in development discussions or get live help on [Gitter](https://gitter.im/jupyterhub/jupyterhub).

## License ##

We use a shared copyright model that enables all contributors to maintain the
copyright on their contributions.

All code is licensed under the terms of the revised BSD license.

## Resources

#### JupyterHub and systemdspawner

- [Reporting Issues](https://github.com/jupyterhub/systemdspawner/issues)
- [Documentation for JupyterHub](http://jupyterhub.readthedocs.io/en/latest/) | [PDF (latest)](https://media.readthedocs.org/pdf/jupyterhub/latest/jupyterhub.pdf) | [PDF (stable)](https://media.readthedocs.org/pdf/jupyterhub/stable/jupyterhub.pdf)
- [Documentation for JupyterHub's REST API](http://petstore.swagger.io/?url=https://raw.githubusercontent.com/jupyter/jupyterhub/master/docs/rest-api.yml#/default)

#### Jupyter

- [Documentation for Project Jupyter](http://jupyter.readthedocs.io/en/latest/index.html) | [PDF](https://media.readthedocs.org/pdf/jupyter/latest/jupyter.pdf)
- [Project Jupyter website](https://jupyter.org)
