// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: b_bop
//
//  Implements the ternary bitwise `bop` instruction
//
module b_bop (

input  wire [31:0] rd       ,
input  wire [31:0] rs1      ,
input  wire [31:0] rs2      ,
input  wire [ 7:0] lut      ,

output wire [31:0] result    

);

genvar i;

generate for(i = 0; i < 32; i = i + 1) begin

    wire [2:0] idx = {
        rd[i], rs2[i], rs1[i]
    };

    assign result[i] = lut[idx];

end endgenerate


endmodule
