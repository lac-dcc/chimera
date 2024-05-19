// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns

module inputStabilizer(
        input i,
        input clock,
        output o
    );

wire DFF1Output,DFF0Output;
wire SPin;

clockDiv cd(outClk,clock);
DFlipFlop DFF1(DFF1Output,clock,i);
DFlipFlop DFF0(DFF0Output,clock,DFF1Output);

assign SPin = (DFF1Output && ~DFF0Output);

singlePulser SP2(SPin,clock,o);

endmodule
