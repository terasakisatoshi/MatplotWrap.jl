using MatplotWrap

N = 10
x = rand(N)
y = rand(N)

scatter(x, y) # matplot::scatter(x, y)
matplot_show() # matplot::show()
