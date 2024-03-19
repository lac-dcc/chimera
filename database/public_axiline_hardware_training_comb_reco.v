//
//      verilog template for combinational logic  in Axiline
//

module comb_reco#(
    parameter bitwidth  =32,
	parameter inputBitwidth =16
)(
    input [bitwidth-1:0]data_in,
    input [inputBitwidth-1:0]bias,
	input [inputBitwidth-1:0]rate,
	input [inputBitwidth-1:0]mu,
    input valid,
    output [bitwidth-1:0]data_out
);

    wire [bitwidth-1:0] data;
    /*combination logic*/

    assign data=(data_in*rate-bias)*mu;


    //assign data_out=data&valid;
	assign data_out=data;
endmodule
