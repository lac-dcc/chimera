// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for combinational logic  in Axiline
//

module comb#(
    parameter bitwidth  =8
)(
    input [bitwidth-1:0]data_in,
    input [bitwidth-1:0]bias,
    input valid,
    output [bitwidth-1:0]data_out
);
    wire [bitwidth-1:0] data;
    /*combination logic*/

    $comb$

    assign data_out=data&valid;

endmodule