// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

`include "monitor_defs.v"

module agc_channels(
    input wire clk,
    input wire rst_n,

    input wire read_en,
    output wire read_done,
    input wire write_en,
    output wire write_done,
    input wire [15:0] addr,
    input wire [15:0] data_in,
    output wire [15:0] data_out,

    output reg periph_readch,
    output reg periph_loadch,
    output reg [12:1] periph_s,
    output reg [16:1] periph_data,
    input wire [16:1] periph_read_data,
    input wire periph_complete
);

localparam IDLE = 0,
           READ_CHANNEL = 1,
           WRITE_CHANNEL = 2,
           SEND_DATA = 3;

reg [1:0] state;
reg [1:0] next_state;

assign read_done = (state == READ_CHANNEL) & periph_complete;
assign write_done = (state == WRITE_CHANNEL) & periph_complete;
assign data_out = (state == SEND_DATA) ? periph_read_data : 16'b0;

always @(*) begin
    next_state = state;
    periph_readch = 1'b0;
    periph_loadch = 1'b0;
    periph_s = 12'b0;
    periph_data = 16'b0;

    case (state)
    IDLE: begin
        if (read_en) begin
            next_state = READ_CHANNEL;
        end else if (write_en) begin
            next_state = WRITE_CHANNEL;
        end
    end

    READ_CHANNEL: begin
        periph_readch = 1'b1;
        periph_s = {3'b0, addr[8:0]};

        if (periph_complete) begin
            next_state = SEND_DATA;
        end
    end

    WRITE_CHANNEL: begin
        periph_loadch = 1'b1;
        periph_s = {3'b0, addr[8:0]};
        periph_data = data_in;

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
