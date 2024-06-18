// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Maxnet(
    input clk, rst,
    input start,
    output ready
);

wire mem_en, selA, result_signal,isDone;

DataPath dp (
    .clk(clk),
    .rst(rst),
    .selA(selA),
    .mem_en(mem_en),
    .result_signal(result_signal),
    .done(isDone),
    .ready_sig(ready)
);

Controller ctrl (
    .clk(clk),
    .rst(rst),
    .start_signal(start),
    .ready(ready),
    .mem_en(mem_en),
    .selA(selA),
    .result_signal(result_signal),
    .isdone(isDone)
);

endmodule