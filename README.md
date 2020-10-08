# MatplotWrap.jl

- This repository aims to [Matplot++](https://github.com/alandefreitas/matplotplusplus) for [Julialang](https://julialang.org/) users, where
  - Matplot++: A C++ Graphics Library for Data Visualization
  - Julia: A fresh approach to technical computing
  
- It is tested on my macOS/Ubuntu(18.04) with Julia v1.5.1

# Prerequisite

## Prepare environment

- install `gnuplot` via e.g. `brew install ...` or `apt-get install ...` etc..
  - See [this instruction](https://github.com/alandefreitas/matplotplusplus#build-from-source) to learn more.

## Install this repository

```console
$ git clone https://github.com/terasakisatoshi/MatplotWrap.jl
$ cd MatplotWrap
$ julia --project=@. -e 'using Pkg; Pkg.instantiate(); Pkg.build()'
```

# Usage

See [examples](examples) directory

### Line Plot

![img](docs/readme_assets/line_plot.png)

### Scatter Plot

![img](docs/readme_assets/scatter_plot.png)


