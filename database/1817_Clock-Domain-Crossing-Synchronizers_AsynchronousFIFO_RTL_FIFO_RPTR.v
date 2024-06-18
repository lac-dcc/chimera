// This program was cloned from: https://github.com/MahmouodMagdi/Clock-Domain-Crossing-Synchronizers
// License: MIT License

module FIFO_R_Pointer #(

	parameter ADDR_WIDTH = 4

)(

//////////////////
// 	  INPUTs 	//
//////////////////
	input  wire 		      R_CLK,
	input  wire 		      R_rst_n,
	input  wire 		      R_inc,
	input  wire [ADDR_WIDTH  : 0] Rq2_wptr,						// Synchronized Write Pointer (synchronized to Read CLK) 


//////////////////
// 	 OUTPUTs	//
//////////////////
	output reg 			 R_empty,
	output reg  [ADDR_WIDTH     : 0] R_ptr,
	output wire [ADDR_WIDTH - 1 : 0] R_Addr
	
);

//------------------------------
// Internal Registers and Wires
//------------------------------

	reg  [ADDR_WIDTH : 0] Binary_R_ptr;
	wire [ADDR_WIDTH : 0] Gray_R_ptr, Binary_R_ptr_next;
	wire 				  Empty_Value;
	
	
//---------------------------------------------------------------------------
// FIFO is Empty when the next rptr == synchronized write pointer or on reset
//---------------------------------------------------------------------------
	
	assign Empty_Value = (Gray_R_ptr == Rq2_wptr);



//---------------------------------------------------------------
// Behavioral Modelling of Read Pointer
//---------------------------------------------------------------	
	always @(posedge R_CLK or negedge R_rst_n)
	begin 
	
		if (!R_rst_n)
		begin
		
			R_empty      <= 1'b1;
			R_ptr 		 <= 4'b0000;
			Binary_R_ptr <= 4'b0000;
			
		end
		
		else
		begin
			
			R_empty 	 <= Empty_Value;
			R_ptr 		 <= Gray_R_ptr;
			Binary_R_ptr <= Binary_R_ptr_next;
	
		end
	end
	

assign R_Addr            = Binary_R_ptr[ADDR_WIDTH - 1 : 0];							// Binary Memory read address
assign Gray_R_ptr 		 = (Binary_R_ptr_next >> 1) ^ Binary_R_ptr_next;				// Converting the Read Pointer from Binary to Gray
assign Binary_R_ptr_next = Binary_R_ptr + (R_inc & ~R_empty);							// Counting the value of the binary read pointer 

endmodule
