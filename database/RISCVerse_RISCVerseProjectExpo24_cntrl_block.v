// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
// Code your design here
module cntrl_block(
input rst,
input [31:0] instr_reg_fetch,
output reg [31:0] cntrl_sig_decode);

// Control Block
/*
32 - bit 
0 -> imm
1 -> reg_read,
2 -> reg_write,
3 -> mem_read,
5 - mem_write,
6 -> branch,
7 -> jump
8 -> aluop0
9 -> aluop1
10 -> memtoreg
11 -> ALUsrc
*/
		/*												  98 	7654    3210
	r_type		0000	0000	0000	0000	0000	0010	0000	0110 //done    206
	i_type		0000	0000	0000	0000	0000	0000	0000	0111	      7
 	b_type		0000	0000	0000	0000	0000	0x01	0100	0011   //done 143 or 543
	s_type		0000	0000	0000	0000	0000	1x00	0010	0011    //done 823 or C23
	l_type		0000	0000	0000	0000	0000	1100	0000	1111   //done  C0F
  */

parameter r_type = 7'b0110011;
parameter i_type = 7'b0010011;
parameter b_type = 7'b1100011;
parameter s_type = 7'b0100011;
parameter l_type = 7'b0000011;
always@(*)
begin
	if(!rst)
		begin
			cntrl_sig_decode = 32'h0;
		end
	else
		begin
			case(instr_reg_fetch[6:0])
				r_type: cntrl_sig_decode = 32'h206;
				i_type: cntrl_sig_decode = 32'h7;
				b_type: cntrl_sig_decode = 32'h143;
				s_type: cntrl_sig_decode = 32'h823;
				l_type: cntrl_sig_decode = 32'hC0F;
				
				default: cntrl_sig_decode = 32'h0;
				
				
			endcase
		end
end

endmodule
