// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module final_design_wrapper_tb;
reg A0, A1, A2, A3;
reg B0, B1, B2, B3;
reg clk;

wire [7:0] Register_Output;


final_design_wrapper uut (
    .A0_0(A0),
    .A1_0(A1),
    .A2_0(A2),
    .A3_0(A3),
    .B0_0(B0),
    .B1_0(B1),
    .B2_0(B2),
    .B3_0(B3),
    .clk_0(clk),
    .Register_Output_0(Register_Output)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    A3 = 1; A2 = 0; A1 = 1; A0 = 0;
    B3 = 0; B2 = 1; B1 = 0; B0 = 1;

    #1000;
end


endmodule
