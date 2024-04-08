module FIFO_TOP #(

	parameter ADDR_WIDTH = 4,				// Address Width
	parameter DATA_WIDTH = 8				// Data Width
)(

/////////////////
// Input Ports //
/////////////////
	input  wire 			 W_CLK,
	input  wire 			 R_CLK,
	input  wire 			 W_rst_n,
	input  wire 			 R_rst_n,
	input  wire 			 W_inc,
	input  wire 			 R_inc,
	input  wire [DATA_WIDTH - 1 : 0] W_Data,


//////////////////
// Output Ports //
//////////////////
	output wire                      Full,
	output wire                      Empty,
	output wire [DATA_WIDTH - 1 : 0] R_Data,



//////////////////
//  DFT Ports   //
//////////////////

input  wire scan_in,
input  wire scan_en,
input  wire scan_CLK,
input  wire scan_mode,
input  wire scan_rst,
output wire scan_out


);




//-----------------
// Internal Wires
//-----------------
	wire [ADDR_WIDTH - 1 : 0] W_Addr, R_Addr;
	wire [ADDR_WIDTH     : 0] W_ptr, R_ptr, Wq2_rptr, Rq2_wptr;

	wire 			  scan_W_CLK;
	wire 			  scan_R_CLK;
	wire 			  scan_W_RST;
	wire 			  scan_R_RST;




//---------------------------------------------------------------
// 		Internal Modules Connections
//---------------------------------------------------------------



//////////////////////////////////
// 	CLOCK MUXing for DFT 	//
//////////////////////////////////


MUX_2X1 CLK_MUX_1(.in0(W_CLK), .in1(scan_CLK), .sel(scan_mode), .out(scan_W_CLK));
MUX_2X1 CLK_MUX_2(.in0(R_CLK), .in1(scan_CLK), .sel(scan_mode), .out(scan_R_CLK));



//////////////////////////////////
// 	RESET MUXing for DFT 	//
//////////////////////////////////


MUX_2X1 W_RST_MUX(.in0(W_rst_n), .in1(scan_rst), .sel(scan_mode), .out(scan_W_RST));
MUX_2X1 R_RST_MUX(.in0(R_rst_n), .in1(scan_rst), .sel(scan_mode), .out(scan_R_RST));



///////////////////////////////
//     1. Write Pointer	     //
///////////////////////////////

FIFO_Write_Pointer #(.ADDR_WIDTH(ADDR_WIDTH)) FIFO_Write_Pointer_F1(

	.W_CLK(scan_W_CLK), 
	.W_rst_n(scan_W_RST),
	.W_inc(W_inc),
	.Wq2_rptr(Wq2_rptr),						 
	
	.W_Full(Full),
	.W_ptr(W_ptr),								
	.W_Addr(W_Addr)
	
);




///////////////////////////////
//	2. Read Pointer      //
///////////////////////////////

FIFO_R_Pointer #(.ADDR_WIDTH(ADDR_WIDTH)) FIFO_R_Pointer_F2(

	.R_CLK(scan_R_CLK),
	.R_rst_n(scan_R_RST),
	.R_inc(R_inc),
	.Rq2_wptr(Rq2_wptr),
	
	.R_empty(Empty),
	.R_ptr(R_ptr),
	.R_Addr(R_Addr)
	
);


///////////////////////////////
// 	3. FIFO Memory       //
///////////////////////////////

ASYNC_FIFO_RAM #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH) )  ASYNC_FIFO_RAM_F3(

	.W_CLK(scan_W_CLK),					
	.W_CLK_en(W_inc & ~Full),				
	.W_Data(W_Data),				
	.W_Addr(W_Addr),				
	.R_Addr(R_Addr),				
	
	.R_Data(R_Data)					

);

//////////////////////////////////////////////////////////////
//        4. Read Pointer Synchronizer to Write Clk         //
//////////////////////////////////////////////////////////////
Sync_R2W #(.ADDR_WIDTH(ADDR_WIDTH)) Sync_R2W_F4(

	.W_CLK(scan_W_CLK),					
	.W_rst_n(scan_W_RST),				
	.R_ptr(R_ptr),					
	
	.Wq2_rptr(Wq2_rptr)				

);


//////////////////////////////////////////////////////////////
//        4. Write Pointer Synchronizer to Read Clk         //
//////////////////////////////////////////////////////////////

Sync_W2R #(.ADDR_WIDTH(ADDR_WIDTH)) Sync_W2R_F5(
 
	.R_CLK(scan_R_CLK),					
	.R_rst_n(scan_R_RST),				
	.W_ptr(W_ptr),					
	
	.Rq2_wptr(Rq2_wptr)				
	
);

endmodule
