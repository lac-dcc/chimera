module top (
	input CLK12M,
	input USER_BTN,
	output [7:0] LED,
	output SEN_SDI,
	output SEN_SPC,
	input SEN_SDO,
	output SEN_CS,
	output [8:1] PIO
);

parameter div_coef = 32'd5000;

wire nrst;
assign nrst = USER_BTN;

wire [31:0] spi_mosi_data;
wire [31:0] spi_miso_data;
wire [5:0] spi_nbits;
wire spi_request;
wire spi_ready;

sequencer U1 (
	.clk_in(CLK12M),
	.nrst(nrst),
	
	.spi_mosi_data(spi_mosi_data),
	.spi_miso_data(spi_miso_data),
	.spi_nbits(spi_nbits),
	
	.spi_request(spi_request),
	.spi_ready(spi_ready),
	
	.led_out(LED)
);
	
spi_master U2 (
	.clk_in(CLK12M),
	.nrst(nrst),
	
	.spi_sck(SEN_SPC),
	.spi_mosi(SEN_SDI),
	.spi_miso(SEN_SDO),
	.spi_csn(SEN_CS),
	
	.mosi_data(spi_mosi_data),
	.miso_data(spi_miso_data),
	.nbits(spi_nbits),
	
	.request(spi_request),
	.ready(spi_ready)
);

// Just for debugging SPI comms
assign PIO[1] = SEN_SPC;
assign PIO[2] = SEN_SDI;
assign PIO[3] = SEN_SDO;
assign PIO[4] = SEN_CS;

endmodule
