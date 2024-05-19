// This program was cloned from: https://github.com/micro-FPGA/engine-V
// License: Apache License 2.0


module MF8A18_SoC
   (CLK,
    RSTn,
    FLASH_CS,
    FLASH_MISO,
    FLASH_MOSI,
    FLASH_SCK,
    UART_TXD
	);
	
  
  input CLK;
  input RSTn;
  
  output FLASH_CS;
  input FLASH_MISO;
  output FLASH_MOSI;
  output FLASH_SCK;
  output UART_TXD;

  wire Clk_0_1;
  wire [7:0]RAM32K_0_dout;
  wire RSTn_0_1;
  wire SPI_MISO_0_1;
  wire [15:0]rom1200_0_D;
  wire top_0_DEBUG_LED;
  wire top_0_LED;
  wire top_0_SPI_CS;
  wire top_0_SPI_MOSI;
  wire top_0_SPI_SCK;
  wire top_0_UART_TXD;
  wire [15:0]top_0_maddr;
  wire [7:0]top_0_mwdata;
  wire top_0_mwrite;
  wire [9:0]top_0_rom_addr;

  assign Clk_0_1 = CLK;
  assign RSTn_0_1 = RSTn;
  assign FLASH_CS = top_0_SPI_CS;
  assign SPI_MISO_0_1 = FLASH_MISO;
  assign FLASH_MOSI = top_0_SPI_MOSI;
  assign FLASH_SCK = top_0_SPI_SCK;
  
  assign UART_TXD = top_0_UART_TXD;  
 
	
  RAM32K RAM32K_0	(
		.addr		(top_0_maddr[14:0]),
        .clk		(Clk_0_1),
        .din		(top_0_mwdata),
        .dout		(RAM32K_0_dout),
        .we			(top_0_mwrite));
  
  ROM512K16 mc_rom        (.addr(top_0_rom_addr[8:0]),         .clk(Clk_0_1),         .dout(rom1200_0_D));
		
		
  MF8A18 top_0       (
		.CLK		(Clk_0_1),
        .RSTn		(RSTn_0_1),
        .SPI_CS		(top_0_SPI_CS),
        .SPI_MISO	(SPI_MISO_0_1),
        .SPI_MOSI	(top_0_SPI_MOSI),
        .SPI_SCK	(top_0_SPI_SCK),
        .UART_TXD	(top_0_UART_TXD),
        .maddr		(top_0_maddr),
        .mwdata		(top_0_mwdata),
        .mwrite		(top_0_mwrite),
        .ramdata	(RAM32K_0_dout),
        .rom_addr	(top_0_rom_addr),
        .rom_data	(rom1200_0_D)
		);
endmodule
