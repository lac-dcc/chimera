module Sync_W2R #(

	parameter ADDR_WIDTH = 4
	
)(

// Inputs 
	input  wire 				 R_CLK,					// Read side Clock
	input  wire 				 R_rst_n,				// Active-Low reset Signal
	input  wire [ADDR_WIDTH : 0] W_ptr,					// Write Pointer that needs be synchronized
	
	
// Outputs	
	output reg [ADDR_WIDTH : 0] Rq2_wptr				// Synchronnized write pointer

);

	// Output of the 1st stage flipflop
	reg [ADDR_WIDTH : 0] Rq1_wptr;
	
	
	// Double FlipFlop synchronizer Behavior
	always @(posedge R_CLK or negedge R_rst_n)
	begin
	
		if(!R_rst_n)
		begin
		
			Rq1_wptr <= 5'b0;
			Rq2_wptr <= 5'b0;
			
		end
		
		else 
		begin
		
			Rq1_wptr <= W_ptr;
			Rq2_wptr <= Rq1_wptr;
		
		end
	end
	
endmodule 