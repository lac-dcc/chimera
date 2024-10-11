// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : EsraaGaber <github.com/EsraaGaber>
*
* Contributer: Ahmad Hegazy <github.com/ahegazy> <ahegazipro@gmail.com>
*
*	Date: September 2018
* 
* Description: Key Expansion step in AES encryption/Decryption.
* Language: Verilog
*
*/
module key_expansion( 
  input  [127:0] key_0 ,
	input clk,
	input reset,
  output  reg [127:0] key_Out);
  
	reg [31:0] stp1 ;
  wire [31:0] stp2 ;
  wire [31:0]Rcon ;
	reg [3:0] m; 
	reg [127:0] k [10:0];

 	 rcon uut1 (.r(m),.rcon(Rcon));
   subByte uut2 (.state(stp1) , .state_out(stp2));
	 
	 always @(negedge clk)
	 begin 
		if( reset == 1 )
		begin 
			m <= 0;
		end
		else 
		begin 		
	 $display("key %d : %h, %h",m,k[m],{ k[m][25:0] , k[m][31:24] });
 	  stp1 	<= { k[m][25:0] , k[m][31:24] }; 
		 key_Out <=	k[m];
	   m <= m + 1;        // m= 0 1 2 3 4 5 6 7 8 9
	   end 
		 end 

always @(posedge clk) 
 begin
	if ( reset == 1 )
	begin 
		k[0] <= key_0;
		k[1] <= 128'b0;
		k[2] <= 128'b0;
		k[3] <= 128'b0;
		k[4] <= 128'b0;
		k[5] <= 128'b0;
		k[6] <= 128'b0;
		k[7] <= 128'b0;
		k[8] <= 128'b0;
		k[9] <= 128'b0;
		k[10] <= 128'b0;
	end 
	else 
	begin 
		k[m][127:96] = k[m-1][127:96] ^ stp2 ^ Rcon; 	
		k[m][95:64] = k[m-1][95:64] ^ k[m][127:96];
		k[m] [63:32] = k[m-1][63:32] ^ k[m][95:64];
		k[m][31:0] = k[m-1][31:0] ^ k[m][63:32];
		
	end 
end
 endmodule

