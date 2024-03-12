
//
// module: b_bop_ftb
//
//  Formal checker for the correctness of the bitwise bop module.
//
module b_bop_ftb(

input clock,
input reset

);

reg  [31:0]  rd      = $anyseq; // Left hand input
reg  [31:0]  rs1     = $anyseq; // Right hand input.
reg  [31:0]  rs2     = $anyseq; // Pack width to operate on
reg  [ 7:0]  lut     = $anyseq; // Subtract if set, else add.

wire [31:0]  result     ; // Output from DUT
wire [31:0]  expectation; // Output from Checker


always @(posedge clock) begin

    assert(result == expectation);

end


//
// Checker instantation
//
fml_b_bop_checker i_b_bop_checker (
.rd         (rd         ),
.rs1        (rs1        ),
.rs2        (rs2        ),
.lut        (lut        ),
.expectation(expectation) 
);


//
// DUT instantation
//
b_bop i_b_bop(
.rd         (rd         ),
.rs1        (rs1        ),
.rs2        (rs2        ),
.lut        (lut        ),
.result     (result     ) 
);

endmodule


//
// module: fml_b_bop_checker
//
//  Checker module, which produces a reference output for the given
//  inputs against which an implementaiton of the bop function can
//  be checked.
//
//  This checker just re-implements the naieve RTL implementation. There
//  isn't really a simpler way to do this!
//
module fml_b_bop_checker (

input  wire [31:0] rd       ,
input  wire [31:0] rs1      ,
input  wire [31:0] rs2      ,
input  wire [ 7:0] lut      ,

output wire [31:0] expectation

);

genvar i;

generate for(i = 0; i < 32; i = i + 1) begin

    wire [2:0] idx = {
        rd[i], rs2[i], rs1[i]
    };

    assign expectation[i] = lut[idx];

end endgenerate

endmodule


