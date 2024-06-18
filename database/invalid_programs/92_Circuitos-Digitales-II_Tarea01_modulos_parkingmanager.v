// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

`include "passmanager.v"
`include "gatemanager.v"

module parkingmanager (
    input wire clk,
    input wire sensorA,
    input wire sensorB,
    input wire [7:0] pass,
    output wire gateState,
    output wire blockAlarm,
    output wire wrongPinAlarm
);

wire authenticatedConection;
wire wrongPinAlarmConection;
wire gateStateConection;
wire blockAlarmConection;
wire [7:0] passConection;

passmanager Uut1 (
    .clk(clk),
    .sensorA(sensorA),
    .gateState(gateStateConection),
    .pass(passConection),
    .wrongPinAlarm(wrongPinAlarmConection),    
    .authenticated(authenticatedConection)
    );

gatemanager Uut2 (
    .clk(clk),
    .sensorA(sensorA),
    .sensorB(sensorB),
    .authenticated(authenticatedConection),
    .gateState(gateStateConection),
    .blockAlarm(blockAlarmConection)
);

assign passConection = pass;
assign gateState = gateStateConection;
assign blockAlarm = blockAlarmConection;
assign wrongPinAlarm =  wrongPinAlarmConection;


endmodule
