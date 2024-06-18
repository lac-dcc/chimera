// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for combinational logic  in Axiline
//

module sgd_unit#(
    parameter bitwidth =16,
	parameter inputBitwidth=8
)(
    input [inputBitwidth-1:0] x,
    input [bitwidth-1:0] w,
    input [bitwidth-1:0]data_in,
    input [inputBitwidth-1:0]mu,
    output [bitwidth-1:0]data_out
);
    assign data_out=w-data_in*mu*x;

endmodule

