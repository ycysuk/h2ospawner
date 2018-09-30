**[Features](#features)** |
**[Requirements](#requirements)** |
**[Installation](#installation)** |
**[Configuration](#configuration)** |
**[Getting help](#getting-help)** |
**[License](#license)** |
**[Resources](#resources)**

# h2ospawner #

A derived class from [systemdspawner](https://github.com/jupyterhub/systemdspawner) which spawning h2o flow.

reference : https://github.com/c2j/h2ospawner/

## Features ##

spawning h2o flow.

This simple project do 2 things:

1. override *get_args()*, add param so that the url matches

```
'--context_path=/user/%s' % self.user.name
```

2. write a java wrapper which using *getopt* to convert args style

```
--arg=val  -->  -arg val
```

## Requirements ##

same as systemdspawner


## Installation ##

You can install it from src with:

```bash
pip install h2ospawner.zip
```

You can enable it for your jupyterhub with the following lines in your
`jupyterhub_config.py` file

```python
c.JupyterHub.spawner_class = 'h2ospawner.H2OSpawner'
```

## Configuration ##

Modify `jupyterhub_config.py` file:

```python
c.Spawner.cmd = ['/[somewhere]/h2o.sh', '/[somewhere]/h2o.jar']
```

In order to avoid slow init of h2o which leads to a timeout err, maybe you should also set timeout a larger value:

```python
c.Spawner.http_timeout = 300  # default value 30
```

h2o.sh

```
#!/bin/bash
options=$(getopt -q -o hi:p:c:n:x: --long help,ip:,port:,context_path:,nthreads:,Xmx: -- "$@")
eval set -- "$options"
while true; do
    case "$1" in
    -h|--help)
        echo "a java wrapper for h2o.jar"
        ;;
    -i|--ip)
        shift; # The arg is next in position args
        OPT_IP="-ip $1"
        ;;
    -p|--port)
        shift;
        OPT_PORT="-port $1"
        ;;
    -c|--context_path)
        shift;
        OPT_PATH="-context_path $1"
        ;;
    -n|--nthreads)
        shift;
        OPT_NTHREADS="-nthreads $1"
        ;;
    -x|--Xmx)
        shift; # e.g. -Xmx1g
        JVM_OPT_XMX="-Xmx$1"
        ;;
    --)
        shift;
        break
        ;;
    *)
        echo "$1 is not an option"
        ;;
    esac
    shift
done

for param in "$@"
do
    JAR_PATH="$1"
    break
done

# The arguments use the following format: java <JVM Options> -jar h2o.jar <H2O Options>.
java $JVM_OPT_XMX -jar $JAR_PATH $OPT_IP $OPT_PORT $OPT_PATH $OPT_NTHREADS
```

## Getting help ##

We encourage you to ask questions on the [mailing list](https://groups.google.com/forum/#!forum/jupyter).
You can also participate in development discussions or get live help on [Gitter](https://gitter.im/jupyterhub/jupyterhub).

## License ##

We use a shared copyright model that enables all contributors to maintain the
copyright on their contributions.

All code is licensed under the terms of the revised BSD license.

## Resources

#### JupyterHub and systemdspawner

- [Reporting Issues](https://github.com/ycysuk/h2ospawner/issues)
- [Documentation for JupyterHub](http://jupyterhub.readthedocs.io/en/latest/) | [PDF (latest)](https://media.readthedocs.org/pdf/jupyterhub/latest/jupyterhub.pdf) | [PDF (stable)](https://media.readthedocs.org/pdf/jupyterhub/stable/jupyterhub.pdf)
- [Documentation for JupyterHub's REST API](http://petstore.swagger.io/?url=https://raw.githubusercontent.com/jupyter/jupyterhub/master/docs/rest-api.yml#/default)

#### Jupyter

- [Documentation for Project Jupyter](http://jupyter.readthedocs.io/en/latest/index.html) | [PDF](https://media.readthedocs.org/pdf/jupyter/latest/jupyter.pdf)
- [Project Jupyter website](https://jupyter.org)
