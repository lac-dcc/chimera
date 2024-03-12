/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */

module MF8A18 (
   CLK,
   RSTn,
   rom_addr,
   rom_data,
   maddr,
   mwdata,
   ramdata,
   mwrite,
   mread,
   SPI_MISO,
   SPI_MOSI,
   SPI_SCK,
   SPI_CS,
   UART_TXD);
 

input   CLK; 
input   RSTn; 
output   [9:0] rom_addr; 
input   [15:0] rom_data; 
output   [15:0] maddr; 
output   [7:0] mwdata; 
input   [7:0] ramdata; 
output   mwrite; 
output   mread; 
input   SPI_MISO; 
output   SPI_MOSI; 
output   SPI_SCK; 
output   SPI_CS; 
output   UART_TXD; 


// 
wire    [9:0] rom_addr; 
wire    [15:0] maddr; 
wire    [7:0] mwdata; 
wire    mwrite; 
wire    mread; 
reg     SPI_MOSI; 
reg     SPI_SCK; 
reg     SPI_CS; 
reg     UART_TXD; 
reg     Reset_s_n; 
wire    Reset_s_n_i; 
wire    IO_Rd; 
wire    IO_Wr; 
wire    [5:0] IO_Addr; 
wire    [7:0] IO_WData; 
wire    [7:0] IO_RData; 

wire    [15:0] Z; 
wire    [7:0] ram_datain; 
wire    ram_write; 

wire    [15:0] maddr_i; 
wire    [15:0] maddr_s; 
wire    mread_i; 
wire    mwrite_i; 

assign maddr = maddr_i; 
assign mread = mread_i; 
assign mwrite = mwrite_i; 

always @(posedge CLK)
begin : process_1
	Reset_s_n <= RSTn;   
end

always @(posedge CLK or negedge Reset_s_n)
begin : process_2
	if (Reset_s_n === 1'b 0)
	begin
		UART_TXD <= 1'b 1;   
		SPI_CS   <= 1'b 1;   
		SPI_SCK  <= 1'b 1;   
		SPI_MOSI <= 1'b 1;   
	end else
	begin
	if (IO_Wr === 1'b 1)
	begin
        	if (IO_Addr[4:3] === 2'b 00) begin  UART_TXD <= IO_WData[0]; end //  00 xxxxx 0x20
		if (IO_Addr[4:3] === 2'b 01) begin  SPI_CS <= IO_WData[7];   end //  01 xxxx 0x10
		if (IO_Addr[4:3] === 2'b 10) begin  SPI_SCK <= IO_WData[0];  end //  11 xxxx 0x20
		if (IO_Addr[4:3] === 2'b 11) begin  SPI_MOSI <= IO_WData[7]; end //  10 xxxx 0x30
         end
      end
 end

assign mwdata = IO_WData; 

mf8_core core (
	.Clk		(CLK),
        .Reset_n	(Reset_s_n),
        .ROM_Addr	(rom_addr[9:0]),
        .ROM_Data	(rom_data),
        .ZZ		(maddr_i),
        .ram_datain	(ramdata),
        .ram_write	(mwrite_i),
        .ram_read	(mread_i),
        .IO_Rd		(IO_Rd),
        .IO_Wr		(IO_Wr),
        .IO_Addr	(IO_Addr),
        .IO_RData	(IO_RData),
        .IO_WData	(IO_WData)
);

assign IO_RData = {7'b 0000000, SPI_MISO}; 

endmodule //

