// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

`include "monitor_defs.v"

module output_counter(
    input wire clk,
    input wire rst_n,

    input wire e_cycle_starting,
    input wire [11:1] e_cycle_addr,

    input wire mt11,
    input wire minkl,
    input wire mwchg,
    input wire [16:1] g,
    input wire [9:1] ch,
    input wire [16:1] mwl,

    input wire read_en,
    input wire [15:0] addr,

    output reg started,
    output reg [15:1] latched_value
);

parameter ADDRESS = 0;
parameter REGISTER = 0;
parameter CHANNEL = 0;
parameter BIT = 0;
parameter SERIAL = 0;

reg active;
reg changed;
reg change_latched;
reg [15:1] agc_value;
wire [15:1] integrated_value;

ones_comp_adder adder(agc_value, latched_value, integrated_value);

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        active <= 1'b0;
        changed <= 1'b0;
        agc_value <= 15'b0;
    end else begin
        if (change_latched) begin
            changed <= 1'b0;
        end

        if (~active) begin
            if (e_cycle_starting & (e_cycle_addr == ADDRESS)) begin
                active <= 1'b1;
            end
        end else begin
            if (mt11) begin
                active <= 1'b0;
                if (~minkl) begin
                    changed <= 1'b1;
                    agc_value <= {g[16], g[14:1]};
                end
            end
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        latched_value <= 15'b0;
        started <= 1'b0;
        change_latched <= 1'b0;
    end else begin
        change_latched <= 1'b0;
        if (mwchg & (ch == CHANNEL) & mwl[BIT]) begin
            if (changed & ~change_latched) begin
                change_latched <= 1'b1;
                if (started & ~SERIAL) begin
                    latched_value <= integrated_value;
                end else begin
                    latched_value <= agc_value;
                end
                started <= 1'b1;
            end
        end else if (read_en & (addr == REGISTER)) begin
            started <= 1'b0;
        end
    end
end

endmodule
`default_nettype wire
