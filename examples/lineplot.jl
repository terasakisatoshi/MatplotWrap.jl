using MatplotWrap

x = -pi:0.01:pi
y = sin.(x)

plot(x, y, "-r") # matplot::plot(x, y)
matplot_show() # matplot::show()
