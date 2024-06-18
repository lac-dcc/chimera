// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Hegazy <github.com/ahegazy> <ahegazipro@gmail.com>
*
*	Date: October 2018
* 
* Description: Mix columns step in AES encryption/Decryption.
* Language: Verilog
*
*/

module MixColumns(
	input wire [127:0] state,
	input  clk,enable, rst,
	output reg  [127:0]state_out,
	output reg done);

function reg [7:0] MultiplyByTwo;
	input [7:0] x;
	begin 
			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ MSB, xor the result with 0001 1011*/
			if(x[7] == 1) MultiplyByTwo = ((x << 1) ^ 8'h1b);
			else MultiplyByTwo = x << 1; 
	end 	
endfunction

function reg [7:0] MultiplyByThree;
	input [7:0] x;
	begin 
			/* multiplication by 3 ,= 01 ^ 10 = (NUM * 01) XOR (NUM * 10) = (NUM) XOR (NUM Muliplication by 2) */
			MultiplyByThree = MultiplyByTwo(x) ^ x;
	end 
endfunction
 
integer i; 
	always@(posedge clk) 
begin
	if (rst)
	begin
		state_out<=128'd0;
		i<= 0;
		done <= 0;
	end 
	else if (enable)
	begin 
			for(i=0;i<=3;i=i+1)
			begin 
			 /* 
			 * Mix columns is a matrices muliplication: polynomial matrix state matrix .
			 * for example 
			 *	2	3	1 1     63 09 cd ba
			 *	1	2	3 1     53 60 70 ca
			 *	1	1	2 3     e0 e1 b7 d0
			 * 	3	1	1 2     8c 04 51 e7
			 * But the state bits as input comes serially in a reg [127:0] : 63 53 e0 8c 09 60 e1 04 cd 70 b7 51 ba ca d0 e7  
			 * so instead of multiplying row * column we multiply row * row  and putting the bits in the output state in a column per iteration
			 * 
			 */
			 
				state_out[i*32+:8]  <= MultiplyByTwo(state[(i*32)+:8])^(state[(i*32 + 8)+:8])^(state[(i*32 + 16)+:8])^MultiplyByThree(state[(i*32 + 24)+:8]);
				state_out[(i*32 + 8)+:8] <= MultiplyByThree(state[(i*32)+:8])^MultiplyByTwo(state[(i*32 + 8)+:8])^(state[(i*32 + 16)+:8])^(state[(i*32 + 24)+:8]);
				state_out[(i*32 + 16)+:8] <= (state[(i*32)+:8])^MultiplyByThree(state[(i*32 + 8)+:8])^MultiplyByTwo(state[(i*32 + 16)+:8])^(state[(i*32 + 24)+:8]);
				state_out[(i*32 + 24)+:8]  <= (state[(i*32)+:8])^(state[(i*32 + 8)+:8])^MultiplyByThree(state[(i*32 + 16)+:8])^MultiplyByTwo(state[(i*32 + 24)+:8]);
			end 
			
			done <= 1;
			end else done <= 0;
end
endmodule
