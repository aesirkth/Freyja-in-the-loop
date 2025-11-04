% Configure Fjalar In The Loop
setup_FIL
my_rocket = Mjollnir_FIL();

% Define simulation job
job = struct(); job.t_max = 60; job.ode_solver = @realtime_ode;

% Run and store simulations
rocket_historian = run_simulation(my_rocket, job);

% Log
if isfile(".\Output\flight.csv")
    delete(".\Output\flight.csv");
end
obj2csv(".\Output\flight.csv", query_historian(rocket_historian, 0:1/60:job.t_max))

plots

