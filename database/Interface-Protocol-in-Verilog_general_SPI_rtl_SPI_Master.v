// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: halftop
// Github: https://github.com/halftop
// Email: yu.zh@live.com
// Description: SPI_Master module
// Dependencies: 
// Since: 2019-06-20 11:16:25
// LastEditors: halftop
// LastEditTime: 2019-06-20 11:16:25
// ********************************************************************
// Module Function:
`timescale 1ns/1ps

module spi_master
#(
	parameter	CLK_FREQUENCE	= 50_000_000		,	//system clk frequence
				SPI_FREQUENCE	= 5_000_000			,	//spi clk frequence
				DATA_WIDTH		= 8					,	//serial word length
				CPOL			= 0					,	//SPI mode selection (mode 0 default)
				CPHA			= 0					 	//CPOL = clock polarity, CPHA = clock phase
)
(
	input								clk			,	//system clk
	input								rst_n		,	//system reset
	input		[DATA_WIDTH-1:0]		data_in		,	//the data sent by mosi
	input								start		,	//a pluse to start the SPI transmission
	input								miso		,	//spi bus miso input
	output	reg							sclk		,	//spi bus sclk
	output	reg							cs_n		,	//spi bus slave select line
	output								mosi		,	//spi bus mosi output
	output	reg							finish		,	//a pluse to indicate the SPI transmission finish and the data_out valid
	output	reg [DATA_WIDTH-1:0]		data_out	 	//the data received by miso,valid when the finish is high
);

localparam	FREQUENCE_CNT	= CLK_FREQUENCE/SPI_FREQUENCE - 1	,
			SHIFT_WIDTH		= log2(DATA_WIDTH)					,
			CNT_WIDTH		= log2(FREQUENCE_CNT)				;

localparam	IDLE	=	3'b000	,
			LOAD	=	3'b001	,
			SHIFT	=	3'b010	,
			DONE	=	3'b100	;

reg		[2:0]				cstate		;	//FSM current state
reg		[2:0]				nstate		;	//FSM next state
reg							clk_cnt_en	;	//start clk_cnt to generate sclk
reg							sclk_a		;	//sclk register to capture the edge of sclk
reg							sclk_b		;	//sclk register to capture the edge of sclk
wire						sclk_posedge;	//posedge of sclk
wire						sclk_negedge;	//negedge of sclk
wire						shift_en	;	//the signal to enable shift register to generate mosi
wire						sampl_en	;	//the signal to sample the data from miso
reg		[CNT_WIDTH-1:0]		clk_cnt		;	//the counter to generate sclk
reg		[SHIFT_WIDTH-1:0]	shift_cnt	;	//the counter to count the number of shifts
reg		[DATA_WIDTH-1:0]	data_reg	;	//the register to latch the data_in,also the shift register
//the counter to generate the sclk
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		clk_cnt <= 'd0;
	else if (clk_cnt_en) 
		if (clk_cnt == FREQUENCE_CNT) 
			clk_cnt <= 'd0;
		else
			clk_cnt <= clk_cnt + 1'b1;
	else
		clk_cnt <= 'd0;
end
//generate the sclk
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		sclk <= CPOL;
	else if (clk_cnt_en) 
		if (clk_cnt == FREQUENCE_CNT)  	
			sclk <= ~sclk; 
		else 
			sclk <= sclk;
	else
		sclk <= CPOL;
end
//------------------------------------------
//to capture the edge of sclk
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		sclk_a <= CPOL;
		sclk_b <= CPOL;
	end else if (clk_cnt_en) begin
		sclk_a <= sclk;
		sclk_b <= sclk_a;
	end
end

assign sclk_posedge = ~sclk_b & sclk_a;
assign sclk_negedge = ~sclk_a & sclk_b;
//----------------------------------------
//==============================================
//==============GENERATE BLOCKS=================
generate
	case (CPHA)
		0: assign sampl_en = sclk_posedge;
		1: assign sampl_en = sclk_negedge;
		default: assign sampl_en = sclk_posedge;
	endcase
endgenerate

generate
 	case (CPHA)
		0: assign shift_en = sclk_negedge;
 		1: assign shift_en = sclk_posedge;
		default: assign shift_en = sclk_posedge;
	endcase
endgenerate
//=============================================
//FSM-1
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		cstate <= IDLE;
	else 
		cstate <= nstate;
end
//FSM-2
always @(*) begin
	case (cstate)
		IDLE	: nstate = start ? LOAD : IDLE;
		LOAD	: nstate = SHIFT;
		SHIFT	: nstate = (shift_cnt == DATA_WIDTH) ? DONE : SHIFT;
		DONE	: nstate = IDLE;
		default: nstate = IDLE;
	endcase
end
//FSM-3
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		clk_cnt_en	<= 1'b0	;
		data_reg	<= 'd0	;
		cs_n		<= 1'b1	;
		shift_cnt	<= 'd0	;
		finish <= 1'b0	;
	end else begin
		case (nstate)
			IDLE	: begin
				clk_cnt_en	<= 1'b0	;
				data_reg	<= 'd0	;
				cs_n		<= 1'b1	;
				shift_cnt	<= 'd0	;
				finish 		<= 1'b0	;
			end
			LOAD	: begin
				clk_cnt_en	<= 1'b1		;
				data_reg	<= data_in	;
				cs_n		<= 1'b0		;
				shift_cnt	<= 'd0		;
				finish 		<= 1'b0		;
			end
			SHIFT	: begin
				if (shift_en) begin
					shift_cnt	<= shift_cnt + 1'b1 ;
					data_reg	<= {data_reg[DATA_WIDTH-2:0],1'b0};
				end else begin
					shift_cnt	<= shift_cnt	;
					data_reg	<= data_reg		;
				end
				clk_cnt_en	<= 1'b1	;
				cs_n		<= 1'b0	;
				finish 		<= 1'b0	;
			end
			DONE	: begin
				clk_cnt_en	<= 1'b0	;
				data_reg	<= 'd0	;
				cs_n		<= 1'b1	;
				data_reg	<= 'd0	;
				finish 		<= 1'b1	;
			end
			default	: begin
				clk_cnt_en	<= 1'b0	;
				data_reg	<= 'd0	;
				cs_n		<= 1'b1	;
				data_reg	<= 'd0	;
				finish 		<= 1'b0	;
			end
		endcase
	end
end
//mosi output MSB first
assign mosi = data_reg[DATA_WIDTH-1];
//sample data from the miso line
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		data_out <= 'd0;
	else if (sampl_en) 
		data_out <= {data_out[DATA_WIDTH-1:0],miso};
	else
		data_out <= data_out;
end
//the function to get the width of data 
function integer log2(input integer v);
  begin
	log2=0;
	while(v>>log2) 
	  log2=log2+1;
  end
endfunction

endmodule