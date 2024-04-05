//
//      verilog template for combinational logic  in Axiline
//

module sgd#(
    parameter bitwidth =8
)(
    input [bitwidth-1:0] x,
    input [bitwidth-1:0] w,
    input [bitwidth-1:0]data_in,
    input [bitwidth-1:0]mu,
    output [bitwidth-1:0]data_out,
);
    assign data_out=w-data_in*mu*x;

endmodule : comb
