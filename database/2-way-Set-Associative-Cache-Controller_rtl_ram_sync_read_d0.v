/*
============================
Parameterized Single Port RAM
============================
*/

// File Name:		ram_sync_read_d0.v
// Version:		0.0v
//
// Author:		Prasad Pandit & Radhika Mandlekar
// Contact:		prasad@pdx.edu, radhika@pdx.edu
//
// Date created:	11/10/2015
// Date modified:	NA
//
// Text-editor used:	Gvim 7v4
//
// Related filelist:	
//
// Description:		IP to infer single address and seperate read and write
// 			data port Synchronous Read RAM
// 			Width of Address & Data bus as well Depth of Data RAM can be
// 			configured
// 			Latching of data while writing is done at rising edge
// 			of clock
// 
// NOTE:		Printing this file to PDF may create parsing
// 			error, do verify PDF with this file for correctness of code and
// 			indentation
// ******************************************************************************************************


module ram_sync_read_d0(
				input 	clock,			//Input signal for clock
				input 	[AWIDTH-1:0] addr,	//Parameterized Address bus input
				input 	[DWIDTH-1:0] din,	//Parameterized Data bus input
				input 	we,			//Write Enable (input HIGH = write, LOW = read)
				output  	[DWIDTH-1:0] dout	//Parameterized Data bus output
				);

// Configuration Parameters

parameter AWIDTH = 3;		// Address Width Parameter, also used to calculate depth
parameter DWIDTH = 32;		// Data width parameter
localparam DEPTH  = 1 << AWIDTH;
// Memory Array Decaration

reg [DWIDTH-1:0] mem_array [0:DEPTH-1];

// Memory initialization
initial
begin
	$readmemb("dram0.txt", mem_array);
end

// Internal Register to latch address for synchronous read operation
reg [AWIDTH-1:0] rd_addr;

// Sequential Block to write data in memory as well as latch read address
// depending on 'we' write enable signal
always@(posedge clock)
begin
	if(we)
		mem_array[addr] <= din;	

rd_addr <= addr;		
end

// Data out during read operation with latched address to keep output stable
assign dout = mem_array[rd_addr];

endmodule
