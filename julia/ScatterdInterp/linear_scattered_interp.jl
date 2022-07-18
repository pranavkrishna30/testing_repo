using ScatteredInterpolation
using Revise
using Plots


altitude = [0, 0, 0, 0, 0, 0, 5000, 5000, 5000, 5000, 5000, 5000, 10000, 10000, 10000, 10000, 10000, 20000, 20000, 20000, 20000, 20000, 20000, 25000, 25000, 25000]
mach = [0, 0.1, 0.2, 0.4, 0.6, 0.8, 0.1, 0.2, 0.4, 0.6, 0.8, 0.86, 0.2, 0.4, 0.6, 0.75, 0.88, 0.36, 0.46, 0.62, 0.75, 0.8, 0.9, 0.46, 0.62, 0.77]
thrust = [5000, 5200, 5400, 5600, 5300, 5100, 4500, 4700, 4900, 5100, 4800, 4600, 4100, 4300, 4500, 4700, 4400, 3300, 3500, 3700, 3900, 3600, 3400, 3000, 3100, 3200]
f1 = scatter(mach, altitude, label = "Data Points", legend=:topleft)
xlabel!("Mach")
ylabel!("Altitude (ft)")
display(f1)
itp = interpolate(Linear(), transpose(hcat(mach,altitude)), thrust)
#test = evaluate(itp, [0.36; 20000])
test = evaluate(itp,transpose(hcat(mach,altitude))) 