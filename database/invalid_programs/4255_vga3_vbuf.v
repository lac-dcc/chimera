// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps
`include "decomp3to4.v"

// Video Buffer

module vbuf #(
    parameter AWIDTH = 18,
    parameter DWIDTH = 8,
    parameter CDEPTH = 2
) (
    input wire PixelClk,
    input wire Blank,
     
    input wire[DWIDTH-1:0] ByteIn,
    input wire ByteClkIn,
    output wire[PWIDTH-1:0] VideoOut
);

localparam PWIDTH = CDEPTH * 3; // pixel width (number of video output pins)

wire[PWIDTH-1:0] PixelOut;

decomp3to4 #(
    .IWIDTH(8),
    .OWIDTH(6)
) DecompByteToPixel (
    .DataIn(ByteIn),
    .DataOut(PixelOut),

    .ClkIn(ByteClkIn),
    .ClkOut(PixelClk),

    .IsFull(),
    .IsEmpty()
);

assign VideoOut = !Blank ? PixelOut : 6'b00_00_00;

endmodule
