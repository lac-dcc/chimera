// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ps;
`include "define.v"

`include "mov.v"
`include "load.v"
`include "hub.v"

module cpu(
    input clk,
    input rst_n,

    input [15:0] instruction,

    input [15:0] in_mem_data,   // from memory
    input read_mem_valid,       // the response from memory
    input read_mem_finish,
    output read_mem_req,        // the request to read from memory

    output [15:0] addr,         // address to memory 

    input write_mem_valid,      // the response from memory
    input write_mem_finish,
    output [15:0] out_mem_data, // to memory
    output write_mem_req,       // the request to write to memory

    output [15:0] pc
);

reg [15:0] IR, PC, SP, SR;
reg [15:0] X, Y, MAR, MDR;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        IR <= 16'b0;
        PC <= 16'b0;
        SP <= 16'b0;
        SR <= 16'b0;
        X <= 16'b0;
        Y <= 16'b0;
        MAR <= 16'b0;
        MDR <= 16'b0;
    end else begin
        IR <= instruction;
    end
end

wire [15:0] mov_out_x, mov_out_y, mov_out_mar, mov_out_mdr;
mov mov_inst(
    .instruction(IR),
    .X(X),
    .Y(Y),
    .MAR(MAR),
    .MDR(MDR),
    .Xout(mov_out_x),
    .Yout(mov_out_y),
    .MARout(mov_out_mar),
    .MDRout(mov_out_mdr)
);

wire [15:0] load_to_mdr;
wire is_loaded;
load load_inst(
    .clk(clk),
    .rst_n(rst_n),

    .instruction(IR),
    .MDR(MDR),
    .in_mem_data(in_mem_data),

    .read_mem_valid(read_mem_valid),
    .read_mem_finish(read_mem_finish),
    .read_mem_req(read_mem_req),

    .load_out(load_to_mdr),
    .is_loaded(is_loaded)
);

wire [15:0] final_x, final_y, final_mar, final_mdr;
wire [15:0] final_pc;
hub hub_inst(
    .instruction(IR),
    .pc_in(PC),

    .mov_in_x(mov_out_x),
    .mov_in_y(mov_out_y),
    .mov_in_mar(mov_out_mar),
    .mov_in_mdr(mov_out_mdr),

    .load_to_mdr(load_to_mdr),
    .is_loaded(is_loaded),

    .final_x(final_x),
    .final_y(final_y),
    .final_mar(final_mar),
    .final_mdr(final_mdr),
    .pc_out(final_pc)
);

always @(posedge clk) begin 
    X <= final_x;
    Y <= final_y;
    MAR <= final_mar;
    MDR <= final_mdr;
    PC <= final_pc;
end 

assign pc = PC;
assign addr = MAR;

endmodule