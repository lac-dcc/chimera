// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： axis_master

	input  ： data AXIS output

	output ： M_AXIS protocol
	
	M_AXIS+FIFO protocol模組，將data的結果以AXIS回傳至DMA

*/
`timescale  10ns / 10ns

	module axis_master #
	(
		parameter integer FIFO_DEPTH = 4,
		parameter integer C_M_AXIS_TDATA_WIDTH	= 32

	)
	(
		input wire M_AXIS_ACLK,
    	input wire M_AXIS_ARESETN,

		input wire [C_M_AXIS_TDATA_WIDTH-1:0]        TDATA_in,
		input wire 							         TVALID_in,
		input wire 							         TLAST_in,
		
		//protocol port
		input wire  								 M_AXIS_TREADY,

		output reg	[C_M_AXIS_TDATA_WIDTH-1:0]       M_AXIS_TDATA,
		output reg                                   M_AXIS_TVALID,
		output reg 						             M_AXIS_TLAST,
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB                     
	);
	//=================================================================================
	
	///////////////////function//////////////////////////
	function integer clogb2 (input integer bit_depth);                                   
	  begin                                                                              
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
	      bit_depth = bit_depth >> 1;                                                    
	  end                                                                                
	endfunction  
	///////////////////localparam////////////////////////
	localparam FIFO_ADDR_BIT = 2;

	///////////////////reg//////////////////////////
	//MSB is tlast bit
	reg [C_M_AXIS_TDATA_WIDTH:0] fifo [0:FIFO_DEPTH-1];
	reg [FIFO_ADDR_BIT-1:0]        fifo_write_ptr;
	reg [FIFO_ADDR_BIT-1:0]        fifo_read_ptr;
	///////////////////wire//////////////////////////
	wire 						   fifo_write;
	wire 						   fifo_read;
	wire [C_M_AXIS_TDATA_WIDTH:0]  fifo_out;
	wire 						   fifo_empty;
	/////////////////////assign////////////////////////
	assign fifo_write = TVALID_in;
	assign fifo_read  = (!fifo_empty && M_AXIS_TREADY);
	assign fifo_out   = fifo[fifo_read_ptr];
	assign fifo_empty = (fifo_write_ptr==fifo_read_ptr);
	///////////////////output//////////////////////////
	assign M_AXIS_TSTRB = {((C_M_AXIS_TDATA_WIDTH/8)){1'd1}};

	always @(posedge M_AXIS_ACLK or negedge M_AXIS_ARESETN) begin
		if(!M_AXIS_ARESETN) begin
			M_AXIS_TDATA <= {C_M_AXIS_TDATA_WIDTH{1'd0}};
		end
		else begin
			M_AXIS_TDATA <= fifo_read ? fifo_out[C_M_AXIS_TDATA_WIDTH-1:0] : M_AXIS_TDATA;
		end
	end

	always @(posedge M_AXIS_ACLK or negedge M_AXIS_ARESETN) begin
		if(!M_AXIS_ARESETN) begin
			M_AXIS_TVALID <= 1'd0;
		end
		else begin
			M_AXIS_TVALID <= (!fifo_empty && M_AXIS_TREADY);
		end
	end

	always @(posedge M_AXIS_ACLK or negedge M_AXIS_ARESETN) begin
		if(!M_AXIS_ARESETN) begin
			M_AXIS_TLAST <= 1'd0;
		end
		else begin
			M_AXIS_TLAST <= fifo_out[C_M_AXIS_TDATA_WIDTH];
		end
	end


	/////////////////////FIFO///////////////////////
	integer i;
	always @(posedge M_AXIS_ACLK or negedge M_AXIS_ARESETN) begin
		if(!M_AXIS_ARESETN) begin
			for(i=0;i<FIFO_DEPTH;i=i+1) begin
				fifo[i] <= {1'd0,{C_M_AXIS_TDATA_WIDTH{1'd0}}};
			end
		end
		else begin
			fifo[fifo_write_ptr] <= fifo_write ? {TLAST_in,TDATA_in} : fifo[fifo_write_ptr];
		end
	end

	always @(posedge M_AXIS_ACLK or negedge M_AXIS_ARESETN) begin
		if(!M_AXIS_ARESETN) begin
			fifo_write_ptr <= {FIFO_ADDR_BIT{1'd0}};
		end
		else begin
			fifo_write_ptr <= fifo_write ? fifo_write_ptr+1 : fifo_write_ptr;
		end
	end

	always @(posedge M_AXIS_ACLK or negedge M_AXIS_ARESETN) begin
		if(!M_AXIS_ARESETN) begin
			fifo_read_ptr <= {FIFO_ADDR_BIT{1'd0}};
		end
		else begin
			fifo_read_ptr <= fifo_read ? fifo_read_ptr+1 : fifo_read_ptr;
		end
	end

	//=================================================================================
endmodule
