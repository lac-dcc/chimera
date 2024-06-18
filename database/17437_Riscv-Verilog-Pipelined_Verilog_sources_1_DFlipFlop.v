// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps


module DFlipFlop(input clk, input rst, input D, output reg Q);

    always @ (posedge clk or posedge rst)
    if (rst) begin
        Q <= 1'b0;
    end else
        begin
            Q <= D;

        end

endmodule