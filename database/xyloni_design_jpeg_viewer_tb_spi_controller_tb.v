`timescale 1ns/1ns

module spi_controller_tb();

localparam	SCLK_FREQ		= 6'd1;
localparam	ADDR_WIDTH		= 24;
localparam	NUM_OF_JPG		= 16;
localparam	START_ADDR		= 'h00000;
localparam	ADDR_OFFSET		= 'h00200;

reg		r_arst;
reg		r_sysclk;

reg		r_next;
reg		r_back;
reg		r_interrupt;
reg		r_flush;

wire	w_WPn;
wire	w_HOLDn;
wire	w_miso;
wire	w_DIO;
wire	w_nss;
wire	w_sclk;
wire	w_mosi;
wire	w_mosi_oe;

wire	w_ready;
wire	w_byte_en;
wire	[7:0]w_byte;

assign	w_WPn	= 1'b1;
assign	w_HOLDn	= 1'b1;
assign	w_ready	= 1'b1;

spi_controller
#(
	.SCLK_FREQ		(SCLK_FREQ),
	.ADDR_WIDTH		(ADDR_WIDTH),
	.NUM_OF_JPG		(NUM_OF_JPG),
	.START_ADDR		(START_ADDR),
	.ADDR_OFFSET	(ADDR_OFFSET)
)
inst_spi_controller
(
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_next		(r_next),
	.i_back		(r_back),
	.i_interrupt(r_interrupt),
	.i_flush	(r_flush),
	
	.i_miso		(w_miso),
	.i_miso_1	(w_DIO),
	.o_nss		(w_nss),
	.o_sclk		(w_sclk),
	.o_mosi		(w_mosi),
	.o_mosi_oe	(w_mosi_oe),
	
	.i_ready	(w_ready),
	.o_byte_en	(w_byte_en),
	.o_byte		(w_byte)
);

W25Q32JV
inst_w25q32jv
(
	.DIO	(w_DIO),
	.WPn	(w_WPn),
	.HOLDn	(w_HOLDn),
	.DO		(w_miso),
	.CSn	(w_nss),
	.CLK	(w_sclk)
);

pullup(w_DIO);
pullup(w_miso);
assign	w_DIO	= (w_mosi_oe)?
					w_mosi:1'bz;

initial
begin
	r_arst	<= 1'b1;
	#10	r_arst	<= 1'b0;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#2.5	r_sysclk	<= ~r_sysclk;
end

always@(posedge r_arst or posedge r_sysclk)
begin
	if (r_arst)
	begin
		r_next		<= 1'b0;
		r_back		<= 1'b0;
		r_interrupt	<= 1'b0;
		r_flush		<= 1'b0;
	end
	else
	begin
		r_next		<= 1'b0;
		r_back		<= 1'b0;
		r_interrupt	<= 1'b0;
		r_flush		<= 1'b0;
	end
end

endmodule
