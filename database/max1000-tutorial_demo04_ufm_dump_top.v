module top
(
	input wire CLK12M,
	input wire USER_BTN,
	
	inout [5:0] BDBUS
);

wire nreset = USER_BTN;

localparam ADDR_W = 17;

// Avalon MM bus signals
wire [ADDR_W-1:0] addr;
wire read_req;
wire [31:0] rdata;
wire waitrequest;
wire readdatavalid;

// UART TX Signals
wire uart_valid;
wire uart_ready;
wire [7:0] uart_data;

// VERY IMPORTANT. Flash initialization file (.hex) must be
// addressed in units of 8 bits (bytes). These are stored in
// the flash in little-endian mode:
// - Byte in address 0x00 from HEX file will appear in [7:0]
//   of the first 32 bit word of the flash (avmm_data_addr = 0)
// - Byte in address 0x01 in HEX file will appear in [15:8]
//   of the first 32 bit word of the flash (avmm_data_addr = 0)
// etc

// You must use the POF file to program UFM & CFM flash memory

// You must match the CONFIGURATION MODE in the settings of
// (a) Onchip Flash QSYS 
// (b) Assignments > Device > Device and Pin options > Configuration
//
// CONFIGURATION MODE can be one of:
//
// 1. Dual Compressed image
//    - Sectors 1,2 can be used as User Flash Memory
// 2. Single Uncompressed image
//    - Sectors 1,2,3 can be used as User Flash Memory
// 3. Single Compressed image
//    - Sectors 1,2,3,4 can be used as User Flash Memory
// 4. Single Uncompressed image with Memory Initialization
//    - Sector 3 contains initialization contents of RAM blocks.
//    - Sectors 1,2 can be used as User Flash Memory
// 5. Single Compressed image with Memory Initialization
//    - Sector 3 contains initialization contents of RAM blocks.
//    - Sectors 1,2 can be used as User Flash Memory
//

my_onchip_flash FLASH1 (
		.clock(CLK12M),
		
		.avmm_csr_addr(1'b0),			//    csr.address (1 bit: 0=status, 1=control)
		.avmm_csr_read(1'b0),			//       .read
		.avmm_csr_writedata(32'b0),	//       .writedata (32 bits)
		.avmm_csr_write(1'b0),			//       .write
		.avmm_csr_readdata(),			//       .readdata (32 bits)
		
		.avmm_data_addr(addr),          				//   data.address (17 bits)
		.avmm_data_read(read_req),          		//       .read
		.avmm_data_writedata(32'b0),     			//       .writedata (32 bits)
		.avmm_data_write(1'b0),         				//       .write
		.avmm_data_readdata(rdata),      			//       .readdata (32 bits)
		.avmm_data_waitrequest(waitrequest),   	//       .waitrequest
		.avmm_data_readdatavalid(readdatavalid), 	//       .readdatavalid
		
		.avmm_data_burstcount(4'b0001),    			//       .burstcount (4 bits)
		
		.reset_n(nreset)
);

uart_mem_dump U1 (
	.clk(CLK12M),
	.nreset(nreset),
	
	.mem_addr(addr),
	.mem_data(rdata),
	
	.mem_read(read_req),
	.mem_waitrequest(waitrequest),
	.mem_readdatavalid(readdatavalid),
	
	.uart_valid(uart_valid),
	.uart_ready(uart_ready),
	.uart_data(uart_data)
);

uart_tx U2 (
	.clk(CLK12M),
	.nreset(nreset),
	
	.tx_valid(uart_valid),
	.tx_ready(uart_ready),
	.tx_data(uart_data),
	
	.tx(BDBUS[1])
);

endmodule
