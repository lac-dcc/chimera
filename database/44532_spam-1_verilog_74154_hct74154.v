// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// 4-16 decoder
// https://assets.nexperia.com/documents/data-sheet/74HC_HCT154.pdf
               
`ifndef hct74154
`define hct74154

`timescale 1ns/1ns

module hct74154(_E0, _E1, A, Y);
    input _E0, _E1;
    input [3:0] A;
    output [15:0] Y;

    wire [15:0] x = 16'hffff ^ (2**A);
    
    assign #(13) Y = !_E0 & !_E1 ? x: 16'hffff;

endmodule


`endif
