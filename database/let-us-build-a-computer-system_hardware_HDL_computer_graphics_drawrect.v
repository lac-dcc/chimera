// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

// Draw a solid rectangle on the screen
module drawrect#(
    parameter BURST_BITS = 10'd10,
    parameter SCREEN_WIDTH = 10'd640,
    parameter SCREEN_HEIGHT = 10'd480,
    parameter MAX_WRITE_BURST_LEN = 10'd128,
    parameter BIT_SIZE = 10'd10
)
(
    input clk,
    input rst_n,
    input enable,

    input [BIT_SIZE - 1 : 0] x_pixel,
    input [BIT_SIZE - 1 : 0] y_pixel,
    input [BIT_SIZE - 1 : 0] width,
    input [BIT_SIZE - 1 : 0] height, 
    input [15 : 0] color,

    input write_burst_data_req,
    input write_burst_data_finish,
    output write_burst_req,
    output [15 : 0] rgb,
    output [21 : 0] addr,
    output [BURST_BITS - 1 : 0] write_burst_len,
    output  done
);

localparam STATE_IDLE = 2'b00;
localparam STATE_DRAW = 2'b01;
reg [1:0] state; 

reg done_r;
reg [BIT_SIZE - 1 : 0] delta_x;
reg [BIT_SIZE - 1 : 0] delta_y;

wire [BIT_SIZE - 1 : 0] current_x;
wire [BIT_SIZE - 1 : 0] current_y;

wire [BIT_SIZE - 1 : 0] x_limit;
wire [BIT_SIZE - 1 : 0] y_limit;

assign current_x = x_pixel + delta_x;
assign current_y = y_pixel + delta_y;

assign x_limit = (x_pixel + width) < SCREEN_WIDTH ? (x_pixel + width) : SCREEN_WIDTH;
assign y_limit = (y_pixel + height) < SCREEN_HEIGHT ? (y_pixel + height) : SCREEN_HEIGHT;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= STATE_IDLE;

        delta_x <= 0;
        delta_y <= 0;
        done_r <= 0;
    end else begin
        case (state)
        STATE_IDLE: begin 
            if (enable && write_burst_data_req) begin
                state <= STATE_DRAW;
                delta_x <= 0;
                delta_y <= 0;
                done_r <= 0;
            end else begin
                done_r <= 0;
            end 
        end
        STATE_DRAW: begin
            if (write_burst_data_finish) begin
                if (current_y >= y_limit) begin
                    done_r <= 1;
                    delta_x <= 0;
                    delta_y <= 0;

                    state <= STATE_IDLE;
                end
            end else begin 
                if (current_x < x_limit) begin
                    delta_x <= delta_x + 1;
                end else begin
                    if (current_y < y_limit) begin
                        delta_x <= 0;
                        delta_y <= delta_y + 1;
                    end
                end
            end 
        end
        default: begin
            state <= STATE_IDLE;
        end 
        endcase
    end
end

assign addr = (current_y * SCREEN_WIDTH) + current_x;
assign write_burst_req = (state == STATE_IDLE) & enable; 
assign rgb = color;
assign write_burst_len = width < MAX_WRITE_BURST_LEN ? width : MAX_WRITE_BURST_LEN;
assign done = done_r;

endmodule