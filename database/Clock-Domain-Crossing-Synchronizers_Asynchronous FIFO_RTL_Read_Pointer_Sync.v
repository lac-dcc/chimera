module Sync_R2W #(

	parameter ADDR_WIDTH = 4
	
)(

// Inputs 
	input  wire 				 W_CLK,					// Write side Clock
	input  wire 				 W_rst_n,				// Active-Low reset Signal
	input  wire [ADDR_WIDTH : 0] R_ptr,					// Read Pointer that needs be synchronized
	
	
// Outputs	
	output reg [ADDR_WIDTH : 0] Wq2_rptr				// Synchronnized read pointer

);

	// Output of the 1st stage flipflop
	reg [ADDR_WIDTH : 0] Wq1_rptr;
	
	
	// Double FlipFlop synchronizer Behavior
	always @(posedge W_CLK or negedge W_rst_n)
	begin
	
		if(!W_rst_n)
		begin
		
			Wq1_rptr <= 5'b0;
			Wq2_rptr <= 5'b0;
			
		end
		
		else 
		begin
		
			Wq1_rptr <= R_ptr;
			Wq2_rptr <= Wq1_rptr;
		
		end
		
	end
	
endmodule 