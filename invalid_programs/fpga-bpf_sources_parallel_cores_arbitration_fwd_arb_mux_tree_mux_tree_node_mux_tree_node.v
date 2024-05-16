//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

mux_tree_node.v

Basically just a 4-MUX, but you can configure whether or not the delay is 
enabled.

Meant to be part of a pipelined multiplexer

*/

`define genif generate if
`define endgen end endgenerate

//I use logic where I intend combinational behaviour, but verilog forces me to
//use reg for syntax
`define logic reg

module mux_tree_node # (
    parameter WIDTH = 32,
    parameter ENABLE_DELAY = 0
) (
    input wire [1:0] sel,
    input wire [WIDTH-1:0] A, 
    input wire [WIDTH-1:0] B, 
    input wire [WIDTH-1:0] C, 
    input wire [WIDTH-1:0] D,
    output wire [WIDTH-1:0] result,
    
    //Only used if delay is enabled
    input wire clk,
    input wire rst
);
    
    `logic [WIDTH-1:0] result_i;
    
    always @(*) begin
        case(sel)
            2'b00:
                result_i <= A;
            2'b01:
                result_i <= B;
            2'b10:
                result_i <= C;
            2'b11:
                result_i <= D;
        endcase
    end
    
`genif (ENABLE_DELAY) begin
    reg [WIDTH-1:0] result_r = 0;
    always @(posedge clk) begin
        if (rst) begin
            result_r <= 0;
        end else begin
            result_r <= result_i;
        end
    end
    assign result = result_r;
end else begin
    assign result = result_i;
`endgen
    
endmodule

`undef genif
`undef endgen
