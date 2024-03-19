`timescale 1ns / 1ps

module cookie #(
    parameter COOKIE_LEN = 32
)
(
    input clk,
    input rst_n,

    input [95:0]        time_stamp,
    output reg [31:0]   cookie_val
);

localparam COOKIE_BASE = 32'hf1ec234d;

wire [31:0] time_lsb;
reg  [31:0] cycle_cnt;

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cycle_cnt <= 0;
    end
    else begin
        if(cycle_cnt == 32'h8) begin
            cycle_cnt <= 0;
        end
        else begin
            cycle_cnt <= cycle_cnt + 1'b1;
        end
    end
end

assign time_lsb = time_stamp[31:0];

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cookie_val <= COOKIE_BASE;
    end
    else begin
        if (cycle_cnt == 32'h8) begin
            cookie_val <= cookie_val ^ (time_lsb>>16) ^ COOKIE_BASE;
        end
        else begin
            cookie_val <= cookie_val;
        end
    end
end

endmodule