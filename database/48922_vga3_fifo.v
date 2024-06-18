// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// First In First Out

module fifo #(
    parameter BUFSIZE = 16, // buffer size
    parameter IWIDTH = 4,   // buffer index width
    parameter WWIDTH = 8    // memory word width
) (
    input wire[WWIDTH-1:0] DataIn,
    output reg[WWIDTH-1:0] DataOut,
    
    input wire ClkIn,
    input wire ClkOut,

    output wire IsFull,
    output wire IsEmpty
);

reg[WWIDTH-1:0] Buffer[BUFSIZE-1:0];
reg[IWIDTH-1:0] IndexIn = 1'b0, IndexOut = 1'b0;

assign IsFull = IndexIn + 1'b1 == IndexOut;
assign IsEmpty = IndexIn == IndexOut;

always @(posedge ClkIn) begin
    if (!IsFull) begin
        Buffer[IndexIn] <= DataIn;
        IndexIn <= (IndexIn == BUFSIZE-1) ? 1'b0 : IndexIn + 1'b1;
    end
end

always @(posedge ClkOut) begin
    if (!IsEmpty) begin
        DataOut <= Buffer[IndexOut];
        IndexOut <= (IndexOut == BUFSIZE-1) ? 1'b0 : IndexOut + 1'b1;
    end
end

endmodule
