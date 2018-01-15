
# jupyter-vtk-datawidgets

[![Build Status](https://travis-ci.org/vidartf/vtkdatawidgets.svg?branch=master)](https://travis-ci.org/vidartf/vtkdatawidgets)
[![codecov](https://codecov.io/gh/vidartf/vtkdatawidgets/branch/master/graph/badge.svg)](https://codecov.io/gh/vidartf/vtkdatawidgets)


Jupyter data-widget based on VTK sources

## Installation

A typical installation requires the following commands to be run:

```bash
pip install vtkdatawidgets
jupyter nbextension enable --py [--sys-prefix|--user|--system] vtkdatawidgets
```

Or, if you use jupyterlab:

```bash
pip install vtkdatawidgets
jupyter labextension install @jupyter-widgets/jupyterlab-manager
```
