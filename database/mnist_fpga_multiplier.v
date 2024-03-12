`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:18 08/08/2017 
// Design Name: 
// Module Name:    multiplier 
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
module multiplier(
			input cnn_clk,     
			
			input [11:0] dina,   //unsigned
			input [11:0] dinb,   //signed
			
			
			output reg [22:0] dout
    );


wire [21:0] dout_reg;

assign dout_reg = dina[10:0]*dinb[10:0];

always @ ( posedge cnn_clk )
begin
	dout <= dinb[11] ? {1'b1,~dout_reg}+1'b1 : dout_reg;

end


endmodule
