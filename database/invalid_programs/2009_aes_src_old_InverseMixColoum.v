// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Adel <github.com/ahmadadel8>
*						Dina  Elsokary <github.com/dinaelsokary>
*
*	Date: September 2018
* 
* Description: Inverse Mix columns step in AES encryption/Decryption.
* Language: Verilog
*
*/

module InverseMixColumns
	#(parameter word_size =8 ,array_size =16)
	(
	input wire [word_size*array_size-1:0] state,
	input  clk,enable, rst,
	output reg  [word_size*array_size-1:0]state_out);

	integer i,j,ij,k;

  reg [word_size-1:0] state_2D [0:3] [0:3];
  reg [word_size-1:0] state_out_2D[0:3] [0:3];	
  reg [word_size-1:0] inv_trans_matrix[0:3] [0:3];	
  reg [14:0] temp_mul,temp_mod;
  
`include "FiniteMultiplication.v"
`include "mod.v"

		always@(posedge clk) 
begin
for ( i=0; i<=3; i=i+1)
	for ( j=0; j<=3; j=j+1)
		begin
		ij=15-(i*4+j);
		state_2D[j][i]=state[ij*word_size  +:  word_size];
		$display("state_2D[%d][%d]=%h,  state[%d]=%h",j,i, state_2D[j][i],ij, state[ij*word_size  +:  word_size]);
		end	





inv_trans_matrix[0][0]=8'd14;
inv_trans_matrix[0][1]=8'd11;
inv_trans_matrix[0][2]=8'd13;
inv_trans_matrix[0][3]=8'd09;
inv_trans_matrix[1][0]=8'd09;
inv_trans_matrix[1][1]=8'd14;
inv_trans_matrix[1][2]=8'd11;
inv_trans_matrix[1][3]=8'd13;
inv_trans_matrix[2][0]=8'd13;
inv_trans_matrix[2][1]=8'd09;
inv_trans_matrix[2][2]=8'd14;
inv_trans_matrix[2][3]=8'd11;
inv_trans_matrix[3][0]=8'd11;
inv_trans_matrix[3][1]=8'd13;
inv_trans_matrix[3][2]=8'd09;
inv_trans_matrix[3][3]=8'd14;
/////////////////////////////
if (rst)
begin
state_out<=128'd0;
temp_mul<=14'd0;
temp_mod<=14'd0;
end 
/////////////////////////////
else if (enable)

 begin 

 for(i=0;i <=3;i=i+1)
	for(j=0;j <=3;j=j+1)
	begin
		temp_mod=14'd0;
		for(k=0;k <=3;k=k+1)
		begin
			finite_multiplication( state_2D[k][j], inv_trans_matrix[i][k], temp_mul);
			temp_mod = temp_mod ^ temp_mul;
			Mod(temp_mod,state_out_2D[i][j]);
			end
			$display ("state_out_2D[%d][%d] = %h",i,j,state_out_2D[i][j]);
			end
			end 


//2D to 1D

for ( i=0; i<=3; i=i+1) 
	for ( j=0; j<=3; j=j+1)
		begin
		ij=15-(i*4+j);
		state_out[ij*word_size  +:  word_size]=state_out_2D[j][i];
		end	
				$display ("state_out = %h",state_out);

end 
endmodule
