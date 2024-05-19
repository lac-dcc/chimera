// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for combinational logic  in Axiline
//
`include "comb_reco.v"

module comb_reco_stage#(
    parameter bitwidth  =32,
	parameter inputBitwidth =16
)(
	input clk,
	input rst,
    input [bitwidth-1:0]data_in,
    input [inputBitwidth-1:0]bias,
	input [inputBitwidth-1:0]rate,
	input [inputBitwidth-1:0]mu,
    input valid,
    output reg[bitwidth-1:0]grad_r
);
	wire [bitwidth-1:0]grad;
    comb_reco #(
            .bitwidth(bitwidth),
            .inputBitwidth(inputBitwidth)
        )
        comb1(
            .data_in(data_in),
            .bias(bias),
			.rate(rate),
			.mu(mu),
            .valid(valid),
            .data_out(grad)
        );

	always @(posedge clk or posedge rst) begin
        if (rst) grad_r<=0;
        else if (valid)grad_r<=grad;
        else grad_r<=grad_r;
    end
endmodule
