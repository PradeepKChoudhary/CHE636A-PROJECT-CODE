# CHE636A-PROJECT-CODE
PROBLEM STATETMENT
Oil recovery from an oil reservoir can be broadly divided into three categories:
primary recovery, secondary recovery and tertiary recovery. Primary recovery is due to
depressurization of an oil reservoir and is a relatively simple process. In this process, wells are drilled
at various locations in an oil field and fluids are allowed to flow. When doing this, the reservoir
pressure is decreased as fluids continue to flow until the pressure is low enough to bring fluids from
the subsurface to the surface on its own. At this stage, no more or very little fluid is produced and other
techniques such as secondary and tertiary recovery are required. In this simulation, we will develop a
program to simulate primary recovery. We will treat primary recovery as a single-phase flow where
only oil is mobile; water is often present in the reservoir but does not flow due to its low saturation.
Further, we will limit ourself to one-dimension and ignore gravity effects.
To simulation primary recovery, develop a one-dimensional code for single phase flow through porous
media using implicit finite difference. The code should include at least two wells at both the ends of
the reservoir (that is, at gridblocks 1 & Nx). The user should have the option to use these wells for
production at constant flow or constant pressure conditions (and switch between the two as desired).
(a) Use the following reservoir & fluid properties to run the simulation.
Permeability: 9.6x10-14 m2
Initial pressure: 13x106 MPa
Porosity: 0.1 viscosity of oil: 0.001 Pa.s
Length: 1000 m Productivity index: 1.3x10-10 m3
/s/Pa
Width: 100 m Total compressibility: 2x10-9 Pa-1
Thickness: 10 m PBHP: 0.1 x 106 MPa
Assume that only one well, at the last gridblock, is active (other is shut off) and is producing at constant
pressure. Take Nx=100, Ny=1 and dt = 50 seconds (dx=L/Nx), run the simulations for 300,000
seconds: (a) obtain the pressure profile of this gridblock (that is, the last gridblock which has the well)
as a function of time (b) at the end of 300,000 seconds, obtain the pressure profile of the reservoir (c)
plot the pressure profiles (part a & b) when the viscosity is increased by 10 times and compare your
result with part (a) & (b)
(b) Solve part (a) assuming that the permeability of gridblocks varies according to the following:
𝑘𝑛𝑒𝑤 = 𝑘 (1 − 0.9 ∗
𝑛𝑥
𝑁𝑥
)
Where knew is the new permeability of a gridblock, k is the original permeability, and nx is the gridblock
number (take Nx=100).
(c) Solve part (b) for tmax=100,000 seconds assuming that both the wells (at nx=1 and nx=100) are
producing at constant pressure (PBHB and J same as given in the table above).
(d) Assuming that only one well, at the last gridblock, is producing at a constant flow of Q=5 m3
/s for
tmax = 60,000 seconds. Plot the pressure of the gridblock as a function of time.
