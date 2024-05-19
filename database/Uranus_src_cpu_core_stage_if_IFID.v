// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"

module IFID(
    input clk,
    input rst,
    input flush,
    input stall_current_stage,
    input stall_next_stage,
    input [`ADDR_BUS] addr_in,
    input [`INST_BUS] inst_in,
    output [`ADDR_BUS] addr_out,
    output [`INST_BUS] inst_out
);

    PipelineDeliver #(`ADDR_BUS_WIDTH) ff_addr(
        clk, rst, flush,
        stall_current_stage, stall_next_stage,
        addr_in, addr_out
    );

    PipelineDeliver #(`INST_BUS_WIDTH) ff_inst(
        clk, rst, flush,
        stall_current_stage, stall_next_stage,
        inst_in, inst_out
    );

endmodule // IFID
