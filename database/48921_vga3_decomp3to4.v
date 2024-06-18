// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// Decompositor 3 words to 4 output words

module decomp3to4 #(
    parameter IWIDTH = 8, // input word width
    parameter OWIDTH = 6  // decomposed word width
) (
    input wire[IWIDTH-1:0] DataIn,
    output reg[OWIDTH-1:0] DataOut,
    
    input wire ClkIn,
    input wire ClkOut,

    output wire IsFull,
    output wire IsEmpty
);

reg[IWIDTH-1:0] BufferIn[2:0];
reg[1:0] IndexIn = 1'b0, IndexOut = 1'b0;

assign IsFull = IndexIn == 2;
assign IsEmpty = !IndexOut[1] ? 
    (IndexOut == IndexIn) : 
    (IndexOut - 1'b1 == IndexIn);

always @(posedge ClkIn) begin
    if (!IsFull) begin
        BufferIn[IndexIn] <= DataIn;
        IndexIn <= IndexIn == 2 ? 1'b0 : IndexIn + 1'b1;
    end
end

always @(posedge ClkOut) begin
    if (!IsEmpty) begin
        // TODO: decomposition not paramterized
        case (IndexOut)
            2'b00: DataOut <= BufferIn[0][2 +: OWIDTH];
            2'b01: DataOut <= { BufferIn[0][0 +: 2], BufferIn[1][4 +: 4] };
            2'b10: DataOut <= { BufferIn[1][0 +: 4], BufferIn[2][6 +: 2] };
            2'b11: DataOut <= BufferIn[2][0 +: OWIDTH];
        endcase
        IndexOut <= IndexOut + 1'b1;
    end
end

endmodule
