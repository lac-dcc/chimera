// This program was cloned from: https://github.com/MahmouodMagdi/Clock-Domain-Crossing-Synchronizers
// License: MIT License

module FIFO_Write_Pointer #(

	parameter ADDR_WIDTH = 4
	
)(

	input  wire 					 W_CLK, 
	input  wire 					 W_rst_n,
	input  wire 					 W_inc,
	input  wire [ADDR_WIDTH     : 0] Wq2_rptr,						// Synchronized Read pointer  
	
	output reg 						 W_Full,
	output reg  [ADDR_WIDTH     : 0] W_ptr,							// Binary write pointer that needs to be converted to Gray one		
	output      [ADDR_WIDTH - 1 : 0] W_Addr
	
);

	reg  [ADDR_WIDTH: 0] Binary_W_ptr;								// Binary Value of the Write Pointer 
	wire [ADDR_WIDTH: 0] Gray_W_ptr , Binary_W_ptr_next;			// Gray Value of the Write Pointer
	wire 				 FULL_VALUE;
	
	always @(posedge W_CLK or negedge W_rst_n)
	begin
	
		if (!W_rst_n)
		begin
		
			W_Full       <= 1'b0;
			W_ptr 		 <= 4'b0000;
			Binary_W_ptr <= 4'b0000;
			
			
		end
		
		else
		begin
			W_Full       <= FULL_VALUE;
			W_ptr 		 <= Gray_W_ptr;
			Binary_W_ptr <= Binary_W_ptr_next;
		end
	end
	
	assign FULL_VALUE        = (Gray_W_ptr[ADDR_WIDTH]!= Wq2_rptr[ADDR_WIDTH])&&                           // MSB of Write Pointer differs from MSB of the Read Pointer
							   (Gray_W_ptr[ADDR_WIDTH-1]!= Wq2_rptr[ADDR_WIDTH - 1]) &&                    
							   (Gray_W_ptr[ADDR_WIDTH-2 : 0] == Wq2_rptr[ADDR_WIDTH - 2 : 0]);
							   
	assign W_Addr 			 = Binary_W_ptr[ADDR_WIDTH - 1 : 0];					// Binary Memory Address
	assign Binary_W_ptr_next = Binary_W_ptr + (W_inc & !W_Full);					
	assign Gray_W_ptr 	     = (Binary_W_ptr_next >> 1) ^ Binary_W_ptr_next;		// Binary to Gray Conversion
	
	
	

endmodule