`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:58 09/30/2020 
// Design Name: 
// Module Name:    fsm_id 
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
`define S0 2'b00//match nothing
`define S1 2'b01//math tile characters
`define S2 2'b10//match tile numbers

module id_fsm(
    input clk,
    input [7:0] char,
    output out
    );
reg[2:0] status;

initial begin
	status <= `S0;// be set to match nothing , or it would random
end
assign out = (status == `S2)? 1:0;

always @(posedge clk)
begin
	case(status)
	`S0 : begin
		if (((char >="A")&&(char <="Z")||(char >= "a")&&(char <="z")))
			status <= `S1;
		else if ((char >= "0") && (char <= "9"))
			status <= `S0;
		else 
			status<= `S0;
	end
	`S1 : begin
		if (((char >="A")&&(char <="Z")||(char >= "a")&&(char <="z")))
			status <= `S1;
		else if ((char >= "0") && (char <= "9"))
			status <= `S2;
		else 
			status<= `S0; 
	end
	`S2 : begin
		if (((char >="A")&&(char <="Z")||(char >= "a")&&(char <="z")))
			status <= `S1;
		else if ((char >= "0") && (char <= "9"))
			status <= `S2;
		else 
			status<= `S0;
	end
	default : 
		status <= `S0;// don't forget it
	endcase
end
endmodule
