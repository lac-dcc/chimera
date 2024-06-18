// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

`include "monitor_defs.v"

module agc_fixed(
    input wire clk,
    input wire rst_n,

    input wire read_en,
    output wire read_done,
    input wire [15:0] addr,
    output wire [15:0] data_out,

    output reg periph_read,
    output reg periph_loadch,
    output reg [12:1] periph_s,
    output reg [15:1] periph_bb,
    output reg [16:1] periph_data,
    input wire [16:1] periph_read_data,
    input wire periph_read_parity,
    input wire periph_complete,

    input wire [7:5] fext
);

localparam IDLE = 0,
           SET_FEXT = 1,
           READ_FIXED = 2,
           COMPLETE = 3;

reg [1:0] state;
reg [1:0] next_state;

assign read_done = (state == READ_FIXED) & periph_complete;;
assign data_out = (state == COMPLETE) ? {periph_read_data[16], periph_read_data[14:1], periph_read_parity} : 16'b0;

wire [7:5] cmd_fext;
wire [15:11] cmd_fb;
wire [12:1] cmd_s;
fixed_addr_encoder fixed_addr(addr, cmd_fext, cmd_fb, cmd_s);

always @(*) begin
    next_state = state;
    periph_read = 1'b0;
    periph_loadch = 1'b0;
    periph_bb = 15'b0;
    periph_s = 12'b0;
    periph_data = 16'b0;

    case (state)
    IDLE: begin
        if (read_en) begin
            if (cmd_fext != fext) begin
                next_state = SET_FEXT;
            end else begin
                next_state = READ_FIXED;
            end
        end
    end

    SET_FEXT: begin
        periph_loadch = 1'b1;
        periph_s = 12'o7;
        periph_data = {9'b0, cmd_fext, 4'b0};

        if (periph_complete) begin
            next_state = READ_FIXED;
        end
    end

    READ_FIXED: begin
        periph_read = 1'b1;
        periph_bb = {cmd_fb, 10'b0};
        periph_s = cmd_s;

        if (periph_complete) begin
            next_state = COMPLETE;
        end
    end

    COMPLETE: begin
        next_state = IDLE;
    end

    endcase
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

endmodule
`default_nettype wire
