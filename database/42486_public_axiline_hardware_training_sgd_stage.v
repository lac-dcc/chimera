// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for combinational logic  in Axiline
//

module sgd_stage#(
    parameter bitwidth =16,
	parameter inputBitwidth=8,
    parameter stage = 0
)(
	input clk,
	input rst,
    input [inputBitwidth-1:0] x,
    input [bitwidth-1:0] w,
    input [bitwidth-1:0]data_in,
    //input [inputBitwidth-1:0]mu,
    output reg[bitwidth-1:0]data_out_r
);
	wire [bitwidth-1:0]data_out;
    wire [bitwidth-1:0]data;

    assign data=w-data_in*x;

	pipeline_reg #(
        .bitwidth(bitwidth),
        .num_stage(stage)
    )pipe_reg_sgd(
        .clk(clk),
        .rst(rst),
        .data_in(data),
        .data_out(data_out)
    );

	always @(posedge clk or posedge rst) begin
        if(rst)begin
         	data_out_r<=0;
        end else begin
    		data_out_r<=data_out;
		end
    end
endmodule
