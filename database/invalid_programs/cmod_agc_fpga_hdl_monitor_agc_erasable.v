// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

`include "monitor_defs.v"

module agc_erasable(
    input wire clk,
    input wire rst_n,

    input wire read_en,
    output wire read_done,
    input wire write_en,
    output wire write_done,
    input wire [15:0] addr,
    input wire [15:0] data_in,
    output wire [15:0] data_out,

    output reg periph_read,
    output reg periph_load,
    output reg [12:1] periph_s,
    output reg [15:1] periph_bb,
    output reg [16:1] periph_data,
    input wire [16:1] periph_read_data,
    input wire periph_read_parity,
    input wire periph_complete
);

localparam IDLE = 0,
           READ_ERASABLE = 1,
           WRITE_ERASABLE = 2,
           SEND_DATA = 3;

reg [1:0] state;
reg [1:0] next_state;

assign read_done = (state == READ_ERASABLE) & periph_complete;
assign write_done = (state == WRITE_ERASABLE) & periph_complete;
assign data_out = (state == SEND_DATA) ? {periph_read_data[16], periph_read_data[14:1], periph_read_parity} : 16'b0;

wire [11:9] cmd_eb;
wire [12:1] cmd_s;
erasable_addr_encoder erasable_addr(addr[10:0], cmd_eb, cmd_s);

always @(*) begin
    next_state = state;
    periph_read = 1'b0;
    periph_load = 1'b0;
    periph_bb = 15'b0;
    periph_s = 12'b0;
    periph_data = 16'b0;

    case (state)
    IDLE: begin
        if (read_en) begin
            next_state = READ_ERASABLE;
        end else if (write_en) begin
            next_state = WRITE_ERASABLE;
        end
    end

    READ_ERASABLE: begin
        periph_read = 1'b1;
        periph_bb = {13'b0, cmd_eb};
        periph_s = cmd_s;

        if (periph_complete) begin
            next_state = SEND_DATA;
        end
    end

    WRITE_ERASABLE: begin
        periph_load = 1'b1;
        periph_bb = {13'b0, cmd_eb};
        periph_s = cmd_s;
        periph_data = {data_in[15], data_in[15:1]};

        if (periph_complete) begin
            next_state = IDLE;
        end
    end

    SEND_DATA: begin
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
