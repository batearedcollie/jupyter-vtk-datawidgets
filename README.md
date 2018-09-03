
# jupyter-vtk-datawidgets

Fork from 

https://github.com/vidartf/jupyter-vtk-datawidgets

For purpose of testign Jupyter lab build


## Docker build

```bash 
docker build . -t jupyter-vtk-datawidgets:0
```

## Docker run

Deefult command is to run Jupyter lab
```bash 
docker run -p 8888:8888 -it jupyter-vtk-datawidgets:0
```

Or run notebook server using 
```bash 
docker run -p 8888:8888 -it jupyter-vtk-datawidgets:0 jupyter notebook --ip=0.0.0.0 --allow-root
```

Connect to the server on https://localhost:8888

## Installation

A typical installation requires the following commands to be run:

```bash
pip install vtkdatawidgets
```

Or, if you use jupyterlab:

```bash
pip install vtkdatawidgets
```

If you are using notebook less than version 5.3, you will probably also need to run:

```bash
jupyter nbextension enable --py [--sys-prefix|--user|--system] vtkdatawidgets
```

, or

```bash
jupyter labextension install @jupyter-widgets/jupyterlab-manager
```

, as appropriate.


