using MatplotWrap

N = 10
x = rand(N)
y = rand(N)

plot(x, y) # line plot
matplot_show()

x = -pi:0.01:pi
y = sin.(x)

plot(x, y)
matplot_show()

