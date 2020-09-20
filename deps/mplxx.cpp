#include <jlcxx/jlcxx.hpp>
#include <matplot/matplot.h>
#include <vector>

using namespace jlcxx;

void plot_wrap(std::vector<double> x, std::vector<double> y, std::string opt)
{
  matplot::plot(x, y, opt);
}

void scatter_wrap(std::vector<double> x, std::vector<double> y)
{
  matplot::scatter(x, y);
}

void matplot_show()
{
  matplot::show();
}

JLCXX_MODULE define_julia_module(Module &mod)
{
  mod.method("plot", plot_wrap);
  mod.method("scatter", scatter_wrap);
  mod.method("matplot_show", matplot_show);
}
