// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

/*-----------------------------------------------\
 -- 

 The program counter is used to provide the address of instructions, 
 which are stored in memory in address order. Two generation paths are included:

(1) The case of sequential execution
(2) Where the order needs to be changed, e.g. JMP instructions

rst reset signal, address is cleared when high;
clock Clock signal, system clock;
ir_addr target address, output this address when the load signal is valid;
pc_addr program counter address
load address load signal

--
\-----------------------------------------------*/

module counter (
	input 	  		  clk    , // Clock
	input 	  		  rst    , // Asynchronous reset active high
	  
	input 	  [12:0]  ir_addr, //program address
	input 	  		  load	 , // load up signal

	output reg [12:0] pc_addr  // insert program address
	
);

	always @(posedge clk or negedge rst) begin
		if (rst) begin
			pc_addr <= 13'b0_0000_0000_0000 ;
		end
		else if (load) begin
			pc_addr <= ir_addr ;
		end else begin
			pc_addr <= pc_addr + 1'b1 ;
		end
	end

endmodule
