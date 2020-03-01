# benchmark-openCV-JuliaImage-scikitImage

## 👨‍💻 Code Task 👨‍💻

## Deliverables

1. ### Benchmark Notebooks
   - [JuliaImages](./JuliaImage-bench.ipynb)
   - [OpenCV](./bench-2.ipynb)
   - [PIL / sciki-image](./bench-3.ipynb)

<hr>

### Using:
[BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) | `jl`

[timeit](https://docs.python.org/3/library/timeit.html) | `py`
### Against :
1. OpenCV
    - Version used : **4.1.0**

2. scikit-image
    - Version used : **0.16.2**
3. PIL using Pillow
    - Version used : **6.1.0**

#### Machine on which Benchmarks were carried out : 
64Bit Windows 10 with 16 GB of RAM and i5-7200U@2.5Ghz

Sample image from https://testimages.juliaimages.org/

**Note :** Compared mean times by timing only one sample in timeit.

<hr>

## Benchmarking JuliaImages against other image frameworks

### Task description

[JuliaImages](https://juliaimages.org/latest/) provides high-quality implementations of many algorithms; however, as of yet there is no set of benchmarks that compares our code against that of other image-processing frameworks. Developing such benchmarks would allow us to advertise our strengths and/or identify opportunities for further improvement. See also the OpenCV project.

Some knowledge of other image processing tools (OpenCV, ImageMagick) would be useful for this task.

<hr>