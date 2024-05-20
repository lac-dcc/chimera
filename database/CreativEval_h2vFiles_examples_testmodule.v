// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(In,Out,En);
input [7:0]In;
output [2:0]Out;
input En;

reg [2:0]Out;
reg [2:0]i;

always @( En or In )
	if(En)
		for(i=0;i<7;i=i+1)
			if ( In[i] ) 
				Out=i;
	else 
		Out=2'b00;

endmodule