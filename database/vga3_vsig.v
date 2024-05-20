// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// Video Signalling Generator - generate HSync, VSync, blanks video RGB output

module vsig #(
    parameter XWIDTH = 10,
    parameter YWIDTH = 10,
    parameter HSMIN = 661,
    parameter HSMAX = 757,
    parameter VSMIN = 491,
    parameter VSMAX = 493
) (
    input wire PixelClk,
    input wire[XWIDTH-1:0] PixelCnt,
    input wire[YWIDTH-1:0] LineCnt,
    input wire IsActHorz,
    input wire IsActVert,
    output reg HSync,
    output reg VSync,
    output wire Blank
);

assign Blank = !IsActHorz || !IsActVert;

always @(posedge PixelClk) begin
    if (PixelCnt == HSMIN) HSync <= 0;
    if (PixelCnt == HSMAX) HSync <= 1;

    if (LineCnt == VSMIN) VSync <= 0;
    if (LineCnt == VSMAX) VSync <= 1;
end

endmodule
