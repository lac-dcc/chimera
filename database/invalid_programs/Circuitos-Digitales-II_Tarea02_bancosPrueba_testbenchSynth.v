// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

`include "PM_synth.v"
`include "cmos/cmos_cells.v" // Se usa rula relativa a directorio de Makefile

module testbench;

    wire clk, sensorA, sensorB,
    gateState, blockAlarm, wrongPinAlarm; 
    wire [7:0] pass;
    
test source(
    .clk(clk),
    .sensorA(sensorA),
    .sensorB(sensorB),
    .pass(pass),
    .gateState(gateState),
    .blockAlarm(blockAlarm),
    .wrongPinAlarm(wrongPinAlarm)
);

parkingmanager Uutmain(
    .clk(clk),
    .sensorA(sensorA),
    .sensorB(sensorB),
    .pass(pass),
    .gateState(gateState),
    .blockAlarm(blockAlarm),
    .wrongPinAlarm(wrongPinAlarm)
);


endmodule
