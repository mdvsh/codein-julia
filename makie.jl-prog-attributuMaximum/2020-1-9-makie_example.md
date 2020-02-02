---
layout: post
title: Volume Plot using Makie.jl (GCI'19)
---

This is my submission for the task *Create a Makie.jl program utilizing as many attributes as possible.* for the Julia Programming Language during
Google Code-In'19.

## Task Statement

Some of the [docs for Makie.jl](http://makie.juliaplots.org/dev/) reference attributes that you can use. However, the actual usage of those [attributes](http://makie.juliaplots.org/dev/plot-attributes.html#List-of-attributes-1) may not be clear to some people. Create an example Makie.jl program and corresponding blog post/GitHub gist(or just comments in the code) that explain the code and utilizes as many possible different parts of Makie as possible. The overarching goal is to show how to reference and use as many attributes as possible available in Makie.jl.

Attributes utilised are listed below :

- backgroundcolor,
- algorithm,
- colormap,
- linewidth,
- visible,
textcolor,
- color,
- align,
- textsize,
- save (for saving image.)

Getting the Makie.jl package.If you don't have that installed in your environment go into the `pkg` mode in Julia Command prompt and do `add Makie`.

```julia
using Makie
```

Defining the Range of Values for our object.

```julia
R = LinRange(-4, 4, 100);
```

Declaring our coloring function
Here, I'm using the charge density function because it was taught
to us in school today.

```julia
charge_den(x, y, z) = exp(-(abs(x)))
```

Now, creating a scene for our plot and setting a dark background for easy visualisation.

```julia
scene = Scene(backgroundcolor = "#2d3436")
```

**Reference --> [Makie.jl Docs : Volume](http://makie.juliaplots.org/dev/functions-overview.html#volume-1)**
Creating our volume object using several attributes. The algorithm used is MaximumIntensityProjection.(*mip*)

You can play around with the colormaps by seeing available colormaps [here.](http://makie.juliaplots.org/dev/colors.html)

```julia
volume!(scene, R, R, R, charge_den, algorithm = :mip, colormap = :dense, linewidth = 4, visible = true)
```

Now, I'd giving a title to our scene. It is also controlled by several attributes like :`alignment`, `size of text `and `fontFamily`

```julia
scene_title = title(scene, "Example of Volume plot using MIP Algorithm.", backgroundcolor = "#2d3436", color = "#fdcb6e", align = (:center, :center), font = :Tahoma, textsize = 20)
```

This is followed by changing color of axis *to white* so that it is visible on our background.

```julia
scene[Axis].names.textcolor = "#fdcb6e"
```

Finalluy, we would output our `scene` followed by the `scene_title` by writing...

```julia
scene # show scene
scene_title # show the scene_title
```

### Summing Everything Up.

```julia
using Makie


# Defining the Range of Values for our object.
R = LinRange(-4, 4, 100);  

# Declaring our coloring function
# Here, I'm using the charge density function because it was taught 
# to us in school today. 
charge_den(x, y, z) = exp(-(abs(x))) 

# Creating a scene for our plot and setting a dark background.
scene = Scene(backgroundcolor = "#2d3436")

# Creating our volume object using several attributes. The algorithm used is MaximumIntensityProjection. (This can also be changed. See available algorithms in the Volume Makie.jl Docs link I gave in the blog.)

# You can play around with the colormaps from the link mentioned above in the blog.
volume!(scene, R, R, R, charge_den, algorithm = :mip, colormap = :dense, linewidth = 4, visible = true)

# Giving a title to our scene. It is also controlled by several attributes like : alignment, size of text, fontFamily
scene_title = title(scene, "Example of Volume plot using MIP Algorithm.", backgroundcolor = "#2d3436", color = "#fdcb6e", align = (:center, :center), font = :Tahoma, textsize = 20)

#Changing color of axis to white so that it is visible on our background.
scene[Axis].names.textcolor = "#fdcb6e" 

scene # show scene
scene_title # show the scene_title
```

## Result

So, after running this code, a `Makie.jl` window pops up, displaying our plot. Here's how it looks like...

<amp-img width="700" height="500" layout="responsive" src="/assets/images/output.png"></amp-img>

I hope you were able to get atleast a gist of plotting in Makie.jl.

That's it from me here ! Have a great day ahead.
