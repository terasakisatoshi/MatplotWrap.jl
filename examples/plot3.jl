using MatplotWrap

t = 0:0.01:10π
x = cos.(t)
y = sin.(t)
z = t
plot3(x, y, z)
matplot_show()