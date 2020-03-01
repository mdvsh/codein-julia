#=
@author: PseudoCodeNerd
GCI | Julia | Task : Introduction to the Julia community

In elementary algebra, the quadratic formula is a formula which provides the
 solution to a quadratic equation.
Our aim is to find the roots a quadratic equation (if they exist) which is in
the form :

aX^2 + bX + c = 0

where a, b, c are given.
 =#

 function quadraticFormula(a, b, c)
     discr = b^2 - 4*a*c
     discr >= 0 ?   ( (-b + sqrt(discr))/(2a), (-b - sqrt(discr))/(2a) ) :
     error("Only complex roots")
 end

println(quadraticFormula(6, 11, -35))
println(quadraticFormula(2, -4, -2))
println(quadraticFormula(-4, -7, 12))
println(quadraticFormula(20, -15, -10))
println(quadraticFormula(1, -1, -3))


#=
Equations | Julia Results
6x² + 11x - 35 = 0  |   (1.6666666666666667, -3.5)
2x² - 4x - 2 = 0    |   (2.414213562373095, -0.41421356237309515)
-4x² - 7x +12 = 0   |    (-2.8155218370325032, 1.065521837032503)
20x² -15x - 10 = 0  |   (1.175390529679106, -0.42539052967910607)
x² -x - 3 = 0       |   (2.302775637731995, -1.3027756377319946)
=#
