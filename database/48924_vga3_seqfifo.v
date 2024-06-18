// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// Sequence generator - First In First Out

module seqfifo #( 
    parameter BUFSIZE = 16, // buffer size
    parameter STRIDE = 1'b1, // stride of range elements
    parameter IWIDTH = 4, // buffer index width
    parameter WWIDTH = 8 // memory word width
) (
    input wire[WWIDTH-1:0] DataIn,
    output reg[WWIDTH-1:0] DataOut,
    
    input wire ClkIn,
    input wire ClkOut,

    output wire IsFull,
    output wire IsEmpty
);

reg[WWIDTH-1:0] DataStart;
reg[IWIDTH-1:0] IndexOut = 1'b0;

assign IsFull = IndexOut == 1'b0;
assign IsEmpty = IndexOut == BUFSIZE;

always @(posedge ClkIn) DataStart <= DataIn;

always @(posedge ClkIn or posedge ClkOut) begin
    if (ClkIn) begin
        IndexOut <= 1'b0;
    end else if (ClkOut && !IsEmpty) begin
        DataOut <= IndexOut ? DataOut + STRIDE : DataStart;
        IndexOut <= IndexOut + 1'b1;
    end
end

endmodule
