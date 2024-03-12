
// This module makes mapping z80 memory accesses into FPGA EABs

module zmaps(

// Z80 controls
	input wire clk,
	input wire memwr_s,
	input wire [15:0] a,
	input wire [7:0] d,
	
// config data
	input wire [4:0] fmaddr,
	
// FPRAM data
	output wire [15:0] zmd,
	output wire [7:0] zma,
	
// DMA
	input wire [15:0] dma_data,
	input wire [7:0] dma_wraddr,
    input wire dma_cram_we,
    input wire dma_sfile_we,

// FPRAM controls
	output wire cram_we,
	output wire sfile_we

);


// addresses of files withing zmaps
	localparam CRAM	= 3'b000;
	localparam SFYS	= 3'b001;
	

// control signals
	wire hit = (a[15:12] == fmaddr[3:0]) && fmaddr[4] && memwr_s;
	

// write enables
	assign cram_we = dma_req ? dma_cram_we : (a[11:9] == CRAM) && a[0] && hit;
	assign sfile_we = dma_req ? dma_sfile_we : (a[11:9] == SFYS) && a[0] && hit;

	
// LSB fetching
    assign zma = dma_req ? dma_wraddr : a[8:1];
    assign zmd = dma_req ? dma_data : {d, zmd0};
    
	reg [7:0] zmd0;
    always @(posedge clk)
		if (!a[0] && hit)
			zmd0 <= d;

// DMA
    wire dma_req = dma_cram_we || dma_sfile_we;

            
endmodule
