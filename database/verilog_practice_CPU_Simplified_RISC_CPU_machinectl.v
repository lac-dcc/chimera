// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

/*-----------------------------------------------\
 --         

The state controller receives the reset signal rst, 
which is valid to control the output ena to 0, 
and fetch, which is valid to control ena to 1.

--
\-----------------------------------------------*/

module machinectl (
 	input clk,    // Clock
 	input rst,  
 	input fetch,

 	output reg ena 
 );
	always @(posedge clk) begin : proc_ena
		if(rst) begin
			ena <= 0;
		end else if (fetch) begin
			ena <= 1;
		end 
	end
 
 endmodule 
