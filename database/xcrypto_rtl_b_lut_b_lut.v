// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: b_lut
//
//  Implements the core logic for the xc.lut instruction.
//
module b_lut (

input  wire [31:0] crs1  , // Source register 1 (LUT input)
input  wire [31:0] crs2  , // Source register 2 (LUT bottom half)
input  wire [31:0] crs3  , // Source register 3 (LUT top half)

output wire [31:0] result  //

);


wire [ 3:0] lut_arr [15:0];
wire [63:0] lut_con = {crs1, crs2};

genvar i;
generate for (i = 0; i < 16; i = i + 1) begin

    assign lut_arr[i] = lut_con[4*i+3:4*i];

end endgenerate


genvar j;
generate for (j = 0; j < 8; j = j + 1) begin

    assign result[4*j+3:4*j] = lut_arr[crs3[4*j+3:4*j]];

end endgenerate

endmodule
