// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

module heart_beat ( 
input                CLK ,
input [31:0]         CLK_FREQ ,
output reg  			CK_1HZ
) ;

//---50MHZ CLOCK1 TEST---
reg  [31:0] CLK_DELAY ; 
//--
always @(posedge CLK )  
begin
	if (CLK_DELAY> CLK_FREQ/2) 
	begin 
		CLK_DELAY<=0;  
		CK_1HZ <=~CK_1HZ ;
	end
	else   
		CLK_DELAY <=CLK_DELAY+1;
end		
	
endmodule 

