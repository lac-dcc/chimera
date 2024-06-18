// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// 6-bit wide, 256*240-entry framebuffer, read/write dual-port
module nes_fb(
    input clk_r,        // DP clock
    input ren,
    input [15:0] raddr,
    output reg [5:0] dout,
    
    input clk_w,        // PPU clock
    input wen,
    input [15:0] waddr,
    input [5:0] din);
    
(* ram_style = "block" *) reg [5:0] fb [256*240-1:0];    // frame buffer of 256*240, 45KB

always @(posedge clk_r) begin
    if (ren) begin
        dout <= fb[raddr]; 
    end
end
    
always @(posedge clk_w) begin
    if (wen) begin
        fb[waddr] <= din;
    end
end

endmodule
