##################################################################
# Create a path using turtle graphics and render it using Simple #
# Inkscape Scripting.                                            #
##################################################################

from inkex import turtle as pturtle

# Draw the picture using inkex's turtle-graphics module.
t = pturtle.pTurtle()
t.pendown()
t.right(28)
for dist in range(500, 0, -10):
    t.forward(dist)
    t.right(121)

# Use Simple Inkscape Scripting to plot the turtle's path.
path(t.getPath(), transform='translate(600, 600)')
