#=
@author : PseudoCodeNerd

Description:
Create a Makie.jl program utilizing as many attributes as possible.
Some of the docs for Makie.jl reference attributes that you can use. However, the actual usage of those attributes may not be clear to some people. Create an example Makie.jl program and corresponding blog post/GitHub gist(or just comments in the code) that explain the code and utilizes as many possible different parts of Makie as possible. The overarching goal is to show how to reference and use as many attributes as possible available in Makie.jl.

Attributes utilised are listed below : 
backgroundcolor, algorithm, colormap, linewidth, visible
textcolor, color, align, textsize, save (for saving image.)

=#


using Makie



# Defining the Range of Values for our object.
R = LinRange(-4, 4, 100);  

# Declaring our coloring function
# Here, I'm using the charge density function because it was taught 
# to us in school today. 
charge_den(x, y, z) = exp(-(abs(x))) 

# Creating a scene for our plot and setting a dark background.
scene = Scene(backgroundcolor = "#2d3436")

# http://makie.juliaplots.org/dev/functions-overview.html#volume-1
#Creating our volume object using several attributes. The algorithm used is MaximumIntensityProjection.
# You can play around with the colormaps from here http://makie.juliaplots.org/dev/colors.html#
volume!(scene, R, R, R, charge_den, algorithm = :mip, colormap = :dense, linewidth = 4, visible = true)

# Giving a title to our scene. It is also controlled by several attributes like :
# alignment, size of text, fontFamily
scene_title = title(scene, "Example of Volume plot using MIP Algorithm.", backgroundcolor = "#2d3436", color = "#fdcb6e", align = (:center, :center), font = :Tahoma, textsize = 20)

#Changing color of axis to white so that it is visible on our background.
scene[Axis].names.textcolor = "#fdcb6e" 

scene # show scene
scene_title # show the scene_title
