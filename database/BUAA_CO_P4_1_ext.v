`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:05 11/15/2018 
// Design Name: 
// Module Name:    ext 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ext(
    input [15:0] in,
    output[31:0] out,
    input ExtOp
    );

	//always@(*) begin
	//	case(ExtOp) 
	//		1'b1: out <= {{16{1'b0}},in};
	//		1'b0: out <= {{16{in[15]}},in};
	//	endcase
	//end
	
	assign out = ExtOp ? {{16{1'b0}},in} : {{16{in[15]}},in};
endmodule
