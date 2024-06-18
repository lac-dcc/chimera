// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Adel <github.com/ahmadadel8>
*						Dina  Elsokary <github.com/dinaelsokary>
*
* Contributer: Ahmad Hegazy <github.com/ahegazy> <ahegazipro@gmail.com>
*
* Date: September 2018
* Modified : October 2018
*
* Description: AddRoundKey step in AES encryption/Decryption.
* Language: Verilog
*
*/

module AddRoundKey(
	input wire [127:0] key ,
	input wire [127:0] state,
	input  clk,enable, rst,
	output reg  [127:0]state_out,
	output reg done);

	integer i;

always@(posedge clk)
 begin
 if (rst) begin
 state_out=128'd0;
 done <= 0;
 i <= 0;
 end 
 else if (enable) begin 
	for ( i=0; i<=15; i=i+1)
		state_out[i*8  +:  8] <= key[i*8  +:  8] ^ state[i*8  +:  8];

	done = 1;
	end 
	else done <= 0;

end
endmodule

