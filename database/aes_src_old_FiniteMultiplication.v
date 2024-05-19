// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Adel <github.com/ahmadadel8>
*						Dina  Elsokary <github.com/dinaelsokary>
*
*	Date: September 2018
* 
* Description: finite multiplication used in MixColumns.
* Language: Verilog
*
*/
task finite_multiplication;
input [7:0] A ;
input [7:0] B ;
output[14:0] AB ;
reg [14:0] temp [7:0] ;
integer i;
begin 
for(i=0; i<=7; i=i+1)
begin
	if (A[i]==1)
	temp[i]=B*(2**i);
	else 
	temp[i]=8'd0;
end


AB=temp[0]^temp[1]^temp[2]^temp[3]^temp[4]^temp[5]^temp[6]^temp[7];
end
endtask
