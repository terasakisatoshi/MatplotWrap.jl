#include <vector>

#include <jlcxx/jlcxx.hpp>
#include <matplot/matplot.h>

using namespace jlcxx;

void plot_wrap(std::vector<double> &x, std::vector<double> &y, std::string line_spec = "")
{
  std::string_view view{ line_spec }; //convert string to string_view
  matplot::plot(x, y, view);
}

void plot3_wrap(std::vector<double> &x, std::vector<double> &y, std::vector<double> &z)
{
  matplot::plot3(x, y, z);
}

void scatter_wrap(std::vector<double> &x, std::vector<double> &y)
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
  mod.method("plot3", plot3_wrap);
  mod.method("scatter", scatter_wrap);
  mod.method("matplot_show", matplot_show);
}
