// This program was cloned from: https://github.com/menesesj6/DigitalesII
// License: MIT License

/* 
Testbench para controlador automatizado de compuerta

Hecho por: Jorge Meneses Garro
Fecha de entrega: 13 de Abril de 2024
*/

// Importar modulos necesarios
`include "tester.v"
`include "modules.v"

// Definir el testbench
module testbench1;

// Cables de conexion entre modulos
wire arrive_sensor, leave_sensor, validation, 
    pinAlarm, blockAlarm, gate_open, 
    gate_close, gate_block, enter;

// Net de 8 bits para la contrasena
wire [7:0] password;

// Dumps para el GTKWave
initial begin
    $dumpfile("simulacion.vcd");
    $dumpvars;
end

// Instanciar el probador
Tester tester (
    .password (password),
    .asensor (arrive_sensor),
    .lsensor (leave_sensor),
    .p_alarm (pinAlarm),
    .b_alarm (blockAlarm),
    .gate_open (gate_open),
    .gate_close (gate_close),
    .gate_block (gate_block),
    .enter (enter)
);

// Instanciar el modulo de verificacion de contrasena 
passwordVer P1 (
    .password (password),
    .arrivalSensor (arrive_sensor),
    .validity (validation),
    .alarm (pinAlarm),
    .enter (enter)
);

// Instanciar el modulo de control de la compuerta
gateController G1 (
    .arrival_Sensor (arrive_sensor),
    .enterSensor (leave_sensor),
    .passValid (validation),
    .block (gate_block),
    .blockAlarm (blockAlarm),
    .gateOpen (gate_open),
    .gateClose (gate_close)
);

endmodule