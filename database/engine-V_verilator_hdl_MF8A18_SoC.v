/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */


module MF8A18_SoC (
	clk,
	resetn,
	FLASH_SCK,
	FLASH_CS,
	FLASH_MISO,
	FLASH_MOSI,
	UART_TXD
	);

	output FLASH_SCK;
	output FLASH_CS;
	input FLASH_MISO;
	output FLASH_MOSI;

	input clk;
	input resetn;	
	output UART_TXD;

	wire [9:0] rom_addr;
	wire [15:0] rom_data;
	
	wire [15:0] maddr;
	wire [7:0]  mwdata;
	wire [7:0]  mrdata;
	wire        mwrite;

	MF8A18 cpu (
		.CLK		(clk),
        	.RSTn		(resetn),
	        .SPI_CS		(FLASH_CS),
	        .SPI_MISO	(FLASH_MISO),
	        .SPI_MOSI	(FLASH_MOSI),
	        .SPI_SCK	(FLASH_SCK),
	        .UART_TXD	(UART_TXD),
	        .maddr		(maddr),
	        .mread		(),
	        .mwdata		(mwdata),
	        .mwrite		(mwrite),
	        .ramdata	(mrdata),
	        .rom_addr	(rom_addr),
	        .rom_data	(rom_data)
	);

	ROM1K16 rom (
		.addr		(rom_addr),
	        .clk		(clk),
        	.dout		(rom_data)
	);

	RAM32K ram (
		.addr		(maddr[14:0]),
	        .clk		(clk),
        	.din		(mwdata),
	        .dout		(mrdata),
	        .we		(mwrite)
	);

endmodule