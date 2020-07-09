"""
    plot_cumulative!(p, N, σ=1)
- `p` is prob to decay at each time step
- `N` is total number of time steps
- `σ` is time between steps

Prob mass function is ``f_x(n) = p(1-p)^(n-1)``
"""
function plot_cumulative!(p, N, σ=1; label="")
    ps = [p * (1-p)^(n-1) for n in 1:N]
    cumulative = cumsum(ps)

    ys = [0; reduce(vcat, [ [cumulative[n], cumulative[n]] for n in 1:N] )]

    pop!(ys)
    pushfirst!(ys, 0)

    xs = [0; reduce(vcat, [ [n*σ, n*σ] for n in 1:N] )]

    plot!(xs, ys, label=label)
    scatter!([n*σ for n in 1:N], cumulative, label="")
end

using Plots
plot_cumulative!(0.1, 20)
xlabel!("n")
ylabel!("cum prob. <= n")

using WebIO
# WebIO.install_jupyter_nbextension()
using Interact
p = 0.1
N = 100
σ = 0.4

@manipulate for p2 in 0.01:0.01:1.0
    plot()
    plot_cumulative!(p, 40, 1.0, label="delta = 1")
    plot_cumulative!(p2, N, σ, label="delta = $(σ)")

    xlims!(0, 40)
    ylims!(0, 1)
end
