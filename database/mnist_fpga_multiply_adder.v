`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:46 07/11/2017 
// Design Name: 
// Module Name:    multiply_adder 
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
module multiply(
			input cnn_clk,     
			
			input [8:0] dina,   //unsigned
			input [8:0] dinb,   //signed
			
			
			output reg [18:0] dout
    );


wire [16:0] dout_reg;

assign dout_reg = dina*dinb[7:0];

always @ ( posedge cnn_clk )
begin
	dout <= dinb[8] ? {2'b11,~dout_reg}+1'b1 : dout_reg;

end

endmodule
