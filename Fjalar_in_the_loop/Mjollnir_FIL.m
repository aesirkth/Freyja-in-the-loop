function rocket = Mjollnir_FIL()
% Define rocket
rocket = Mjollnir();
rocket.models = {rocket.models{:}, @send_to_fjalar};

% rocket.HIL is just a struct that manages protobuff
% The protobuff object is defined by a schema
% In the schema we have defined messages like HILIn, HILOut, FjalarData,
% and FjalarMessage, ...
rocket.HIL = struct();
rocket.HIL.protobuf = py.importlib.import_module('schema_pb2');
rocket.serialport = serialport('COM7', 115200);

% Clean up persistent variables
clear send_to_fjalar
end