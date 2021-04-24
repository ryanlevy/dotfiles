# Updating Julia releases

1. Move installed packages to new version  
2. update packages
3. rebuild packages
4. reinstall kernels

```
$ cd ~/.julia/environments
$ cp v1.old/* v1.new/*
```

Remove old kernels
```
$ jupyter kernelspec uninstall julia-1.old
$ jupyter kernelspec uninstall julia_itensor-1.old
```
`julia`
```julia
julia> ]
pkg> up
pkg> build "IJulia"
pkg> build "Plots"
Ctl-C
julia> using ITensors; ITensors.compile()
julia> using IJulia; installkernel("Julia_itensor","--sysimage=/home/ryan/.julia/sysimages/sys_itensors.so")
```
