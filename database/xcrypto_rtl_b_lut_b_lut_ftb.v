// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: b_lut_ftb
//
//  Formal checker for the correctness of the nibble-wise LUT module.
//
module b_lut_ftb(

input clock,
input reset

);

reg  [31:0]  crs1    = $anyseq;
reg  [31:0]  crs2    = $anyseq;
reg  [31:0]  crs3    = $anyseq;

wire [31:0]  result     ; // Output from DUT
wire [31:0]  expectation; // Output from Checker


always @(posedge clock) begin

    assert(result == expectation);

    if(crs1 == 32'h01234567 &&
       crs2 == 32'h76543210 &&
       crs2 == 32'hfedcba98 ) begin
        assert(result == 32'h76543210);
    end
    
    if(crs1 == 32'h012345a7 &&
       crs2 == 32'h76543210 &&
       crs2 == 32'hfedcb198 ) begin
        assert(result == 32'h76543210);
    end

end

// Checker
b_lut_checker i_b_lut_checker(
.crs1  (crs1  ), // Source register 1 (LUT input)
.crs2  (crs2  ), // Source register 2 (LUT bottom half)
.crs3  (crs3  ), // Source register 3 (LUT top half)
.result(expectation)  //
);

// DUT
b_lut i_b_lut(
.crs1  (crs1  ), // Source register 1 (LUT input)
.crs2  (crs2  ), // Source register 2 (LUT bottom half)
.crs3  (crs3  ), // Source register 3 (LUT top half)
.result(result)  //
);


endmodule

//
// module: b_lut_checker
//
//  Implements the core logic for the xc.lut instruction for checking
//
module b_lut_checker (

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
