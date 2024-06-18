// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Hegazy <github.com/ahegazy> <ahegazipro@gmail.com>
*
*	Date: September 2018
* 
* Description: Expand only a single key in AES encryption/Decryption.
* Language: Verilog
*
*/
module singleKeyExpansion( 
  input  [127:0] keyInput ,
	input clk,
	input enable,
	input reset,
	input [3:0] keyNum,
  output  reg [127:0] keyOutput);
  
	reg [31:0] stp1 ;
  wire [31:0] stp2 ;
  wire [31:0]Rcon ;

 	 rcon uut1 (.r(keyNum),.rcon(Rcon));
   subByte uut2 (.state(stp1) , .state_out(stp2));
	 
	 always @(negedge clk)
	 begin 
		if(enable)
			stp1 	<= { keyInput[25:0] , keyInput[31:24] }; 
	 end 

always @(posedge clk) 
 begin
	if ( reset == 1 )
	begin 
	keyOutput = 0;
		/* donothing */
	end 
	else 
	begin 
		if(enable)
			begin 
				keyOutput[127:96] = keyInput[127:96] ^ stp2 ^ Rcon; 	
				keyOutput[95:64] = keyInput[95:64] ^ keyOutput[127:96];
				keyOutput[63:32] = keyInput[63:32] ^ keyOutput[95:64];
				keyOutput[31:0] = keyInput[31:0] ^ keyOutput[63:32];
			end
	end 
end
 endmodule

