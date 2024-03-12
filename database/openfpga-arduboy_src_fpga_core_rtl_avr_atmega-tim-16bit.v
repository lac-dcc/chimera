/*
 * This IP is the ATMEGA 16bit TIMER implementation.
 * 
 * Copyright (C) 2020  Iulian Gheorghiu (morgoth@devboard.tech)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

`timescale 1ns / 1ps

//`define TIFR0	('h00)
`define TOV0 0
`define OCF0A 1
`define OCF0B 2
`define OCF0C 3
`define OCF0D 4

//`define GTCCR	('h00)
`define PSRSYNC 0
`define PSRASY 	1
`define TSM 	7

//`define TCCR0A	('h00)
`define WGM00 	0
`define WGM01 	1
`define COM0C0 	2
`define COM0C1 	3
`define COM0B0 	4
`define COM0B1 	5
`define COM0A0 	6
`define COM0A1 	7

`undef COM0D0
`undef COM0D1
`define COM0D0 	0
`define COM0D1 	1

//`define TCCR0B	('h00)
`define CS00 	0
`define CS01 	1
`define CS02 	2
`define WGM02 	3
`define WGM03 	4
`define FOC0B 	6
`define FOC0A 	7

//`define TCNT0	('h00)
//`define OCR0A	('h00)
//`define OCR0B	('h00)
//`define OCR0C	('h00)
//`define OCR0D	('h00)

//`define TIMSK0	('h00)
`undef TOIE0
`undef OCIE0A
`undef OCIE0B
`undef OCIE0C
`undef OCIE0D
`define TOIE0 	0
`define OCIE0A 	1
`define OCIE0B 	2
`define OCIE0C 	3
`define OCIE0D 	4



module atmega_tim_16bit # (
	parameter PLATFORM = "XILINX",
	parameter USE_SIMPLE_COUNTER = "TRUE",
	parameter USE_OCRA_OUT = "FALSE",
	parameter USE_OCRB = "TRUE",
	parameter USE_OCRB_OUT = "FALSE",
	parameter USE_OCRC = "TRUE",
	parameter USE_OCRC_OUT = "FALSE",
	parameter USE_OCRD = "FALSE",
	parameter USE_OCRD_OUT = "FALSE",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter GTCCR_ADDR = 'h43,
	parameter TCCRA_ADDR = 'h80,
	parameter TCCRB_ADDR = 'h81,
	parameter TCCRC_ADDR = 'h82,
	parameter TCCRD_ADDR = 'h0,
	parameter TCNTL_ADDR = 'h84,
	parameter TCNTH_ADDR = 'h85,
	parameter ICRL_ADDR = 'h86,
	parameter ICRH_ADDR = 'h87,
	parameter OCRAL_ADDR = 'h88,
	parameter OCRAH_ADDR = 'h89,
	parameter OCRBL_ADDR = 'h8A,
	parameter OCRBH_ADDR = 'h8B,
	parameter OCRCL_ADDR = 'h8C,
	parameter OCRCH_ADDR = 'h8D,
	parameter OCRDL_ADDR = 'h0,
	parameter OCRDH_ADDR = 'h0,
	parameter TIMSK_ADDR = 'h6F,
	parameter TIFR_ADDR = 'h36,
	parameter INCREMENT_VALUE = 1
)(
	input rst_i,
	input clk_i,
	input clk8_i,
	input clk64_i,
	input clk256_i,
	input clk1024_i,
	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [7:0]bus_i,
	output reg [7:0]bus_o,
	
	output tov_int_o,
	input tov_int_ack_i,
	output ocra_int_o,
	input ocra_int_ack_i,
	output ocrb_int_o,
	input ocrb_int_ack_i,
	output ocrc_int_o,
	input ocrc_int_ack_i,
	output ocrd_int_o,
	input ocrd_int_ack_i,
	
	input t_i,
	output reg oca_o,
	output reg ocb_o,
	output reg occ_o,
	output reg ocd_o,
	output oca_io_connect_o,
	output ocb_io_connect_o,
	output occ_io_connect_o,
	output ocd_io_connect_o
	);

//reg [7:0]GTCCR;
reg [7:0]TCCRA;
reg [7:0]TCCRB;
//reg [7:0]TCCRC;
//reg [7:0]TCCRD;
reg [7:0]TCNTL;
reg [7:0]TCNTH;
reg [7:0]OCRAL;
reg [7:0]OCRAH;
reg [7:0]OCRBL;
reg [7:0]OCRBH;
reg [7:0]OCRCL;
reg [7:0]OCRCH;
reg [7:0]OCRDL;
reg [7:0]OCRDH;
//reg [7:0]ICRL;
//reg [7:0]ICRH;
reg [15:0]OCRA_int;
reg [15:0]OCRB_int;
reg [15:0]OCRC_int;
reg [15:0]OCRD_int;
reg [7:0]TIMSK;
reg [7:0]TIFR;

reg [7:0]TMP_REG_rd;
reg [7:0]TMP_REG_wr;

reg tov_p;
reg tov_n;
reg ocra_p;
reg ocra_n;
reg ocrb_p;
reg ocrb_n;
reg ocrc_p;
reg ocrc_n;
reg ocrd_p;
reg ocrd_n;

//reg l1;
//reg l2;
wire t0_fall = 0;
wire t0_rising = 0;
reg clk_int;
reg clk_int_del;

reg up_count;

wire clk_active = |TCCRB[`CS02:`CS00];

/* Sampling implementation */
// Accourding to timer sampling module.
/*always @ *
begin
	if(rst)
	begin
		l1 = 1'b0;
	end
	else
	if(clk)
	begin
		l1 = t;
	end
end

always @ (posedge clk)
begin
	if(rst)
	begin
		l2 = 1'b0;
	end
	else
	if(clk)
	begin
		l2 = l1;
	end
end*/
/* !Sampling implementation */

/* Prescaller selection implementation */
always @ *
begin
	case(TCCRB[`CS02:`CS00])
	3'b001: clk_int = clk_i;
	3'b010: clk_int = clk8_i;
	3'b011: clk_int = clk64_i;
	3'b100: clk_int = clk256_i;
	3'b101: clk_int = clk1024_i;
	//3'b110: clk_int = t0_fall;
	//3'b111: clk_int = t0_rising;
	default: clk_int = 1'b0;
	endcase
	// The RTC counter and interrupt signal are synchronously reset using counter clock, we need to provide a clock during reset.
	if(USE_SIMPLE_COUNTER == "TRUE") begin
		if(rst_i)
			clk_int = clk_i;
	end
end

wire io_select = (addr_i[BUS_ADDR_DATA_LEN-1:4] == TCCRA_ADDR[BUS_ADDR_DATA_LEN-1:4]);
// Read registers.
always @ *
begin
	if(rst_i)
	begin
		bus_o = 8'h00;
	end
	else
	begin
		bus_o = 8'h00;
		if(rd_i & addr_i == TIFR_ADDR)
			bus_o = TIFR;
		if(rd_i & addr_i == TIMSK_ADDR)
			bus_o = TIMSK;
		
		if(rd_i & io_select)
		begin
			case(addr_i[3:0])
				//TCCRA_ADDR[3:0]: bus_o = TCCRA;
				TCCRB_ADDR[3:0]: bus_o = TCCRB;
				//TCCRC_ADDR[3:0]: bus_o = TCCRC;
				//TCCRD_ADDR[3:0]: bus_o = TCCRD;
				TCNTL_ADDR[3:0]: bus_o = TCNTL;
				TCNTH_ADDR[3:0]: bus_o = TMP_REG_rd;
				//ICRL_ADDR[3:0]: bus_dat_o = ICRL;
				//ICRH_ADDR[3:0]: bus_dat_o = TMP_REG_rd;
				OCRAL_ADDR[3:0]: bus_o = OCRAL;
				OCRAH_ADDR[3:0]: bus_o = OCRAH;
				OCRBL_ADDR[3:0]:
				begin
					if(USE_OCRB == "TRUE")
						bus_o = OCRBL;
				end
				OCRBH_ADDR[3:0]:
				begin
					if(USE_OCRB == "TRUE")
						bus_o = OCRBH;
				end
				OCRCL_ADDR[3:0]:
				begin
					if(USE_OCRC == "TRUE")
						bus_o = OCRCL;
				end
				OCRCH_ADDR[3:0]:
				begin
					if(USE_OCRC == "TRUE")
						bus_o = OCRCH;
				end
				OCRDL_ADDR[3:0]:
				begin
					if(USE_OCRD == "TRUE")
						bus_o = OCRDL;
				end
				OCRDH_ADDR[3:0]:
				begin
					if(USE_OCRD == "TRUE")
						bus_o = OCRDH;
				end
			endcase
		end
	end
end

generate

if (USE_SIMPLE_COUNTER == "TRUE")
begin : SIMPLE_16BIT_CNT


wire tov_int;
wire ocra_int;
wire ocrb_int;
wire ocrc_int;

always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		TMP_REG_rd <= 8'h00;
		TMP_REG_wr <= 8'h00;
		//GTCCR <= 8'h00;
		//TCCRA <= 8'h00;
		TCCRB <= 8'h00;
		//TCCRC <= 8'h00;
		//TCCRD <= 8'h00;
		TCNTL <= 8'h00;
		TCNTH <= 8'h00;
		OCRAL <= 8'h00;
		OCRAH <= 8'h00;
		OCRBL <= 8'h00;
		OCRBH <= 8'h00;
		OCRCL <= 8'h00;
		OCRCH <= 8'h00;
		OCRDL <= 8'h00;
		OCRDH <= 8'h00;
		//ICRL <= 8'h00;
		//ICRH <= 8'h00;
		OCRA_int <= 16'h0000;
		OCRB_int <= 16'h0000;
		OCRC_int <= 16'h0000;
		OCRD_int <= 16'h0000;
		TIMSK <= 8'h00;
		TIFR <= 8'h00;
	end
	else
	begin
		// Write registers
		if(wr_i & addr_i == TIFR_ADDR)
			TIFR <= TIFR & ~bus_i;
		if(wr_i & addr_i == TIMSK_ADDR)
			TIMSK <= bus_i;
		if(wr_i & io_select)
		begin
			case(addr_i[3:0])
				//GTCCR_ADDR[3:0]: GTCCR <= bus_dat_i;
				//TCCRA_ADDR[3:0]: TCCRA <= bus_i;
				TCCRB_ADDR[3:0]: TCCRB <= bus_i;
				//TCCRC_ADDR[3:0]: TCCRC <= bus_i;
				//TCCRD_ADDR[3:0]: TCCRD <= bus_i;
				TCNTL_ADDR[3:0]:
				begin
					TCNTL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
					TCNTH <= TMP_REG_wr;
				end
				/*ICRL_ADDR[3:0]:
				begin
					ICRL <= bus_dat_in;
					ICRH <= TMP_REG_wr;
				end*/
				OCRAL_ADDR[3:0]:
				begin
					OCRAL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
					OCRAH <= TMP_REG_wr;
				end
				OCRBL_ADDR[3:0]:
				begin
					if(USE_OCRB == "TRUE")
					begin
						OCRBL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
						OCRBH <= TMP_REG_wr;
					end
				end
				OCRCL_ADDR[3:0]:
				begin
					if(USE_OCRC == "TRUE")
					begin
						OCRCL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
						OCRCH <= TMP_REG_wr;
					end
				end
				OCRDL_ADDR[3:0]:
				begin
					if(USE_OCRD == "TRUE")
					begin
						OCRDL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
						OCRDH <= TMP_REG_wr;
					end
				end
				TCNTH_ADDR[3:0], /*ICRH_ADDR, */OCRAH_ADDR[3:0], OCRBH_ADDR[3:0], OCRCH_ADDR[3:0], OCRDH_ADDR[3:0]:
					TMP_REG_wr <= bus_i;
			endcase
		end
		if(rd_i & addr_i == TCNTL_ADDR)
			TMP_REG_rd <= TCNTH;
		//if(rd_dat & addr_dat == ICRL_ADDR)
		//	TMP_REG_rd <= ICRH;
		TIFR[`TOV0] <= TIFR[`TOV0] | tov_int;
		TIFR[`OCF0A] <= TIFR[`OCF0A] | ocra_int;
		if(USE_OCRB == "TRUE")
			TIFR[`OCF0B] <= TIFR[`OCF0B] | ocrb_int;
		if(USE_OCRC == "TRUE")
			TIFR[`OCF0C] <= TIFR[`OCF0C] | ocrc_int;
	end
end

rtc #(
	.PERIOD_STATIC(0),
	.CNT_SIZE(INCREMENT_VALUE == 2 ? 15 : 16)
)tim_16bit_ovf_inst(
	.rst_i(rst_i),
	.clk_i(clk_i),
	.clk_cnt_i(clk_int),
	.top_i(16'hFFFF),
	.int_o(tov_int),
	.int_ack_i(tov_int_ack_i)
	);
assign tov_int_o = tov_int & TIMSK[`TOIE0];

rtc #(
	.PERIOD_STATIC(0),
	.CNT_SIZE(INCREMENT_VALUE == 2 ? 15 : 16)
)tim_16bit_ocra_inst(
	.rst_i(rst_i),
	.clk_i(clk_i),
	.clk_cnt_i(clk_int),
	.top_i(INCREMENT_VALUE == 2 ? {OCRAH,OCRAL[7:1]} : {OCRAH,OCRAL}),
	.int_o(ocra_int),
	.int_ack_i(ocra_int_ack_i)
	);

assign ocra_int_o = ocra_int & TIMSK[`OCIE0A];

if(USE_OCRB == "TRUE")
begin
rtc #(
	.PERIOD_STATIC(0),
	.CNT_SIZE(INCREMENT_VALUE == 2 ? 15 : 16)
)tim_16bit_ocrb_inst(
	.rst_i(rst_i),
	.clk_i(clk_i),
	.clk_cnt_i(clk_int),
	.top_i(INCREMENT_VALUE == 2 ? {OCRBH,OCRBL[7:1]} : {OCRBH,OCRBL}),
	.int_o(ocrb_int),
	.int_ack_i(ocrb_int_ack_i)
	);

assign ocrb_int_o = ocrb_int & TIMSK[`OCIE0B];
end
else /* USE_OCRB != TRUE */
begin
assign ocrb_int = 1'b0;
assign ocrb_int_o = 1'b0;
end /* USE_OCRB == TRUE */

if(USE_OCRC == "TRUE")
begin
rtc #(
	.PERIOD_STATIC(0),
	.CNT_SIZE(INCREMENT_VALUE == 2 ? 15 : 16)
)tim_16bit_ocrc_inst(
	.rst_i(rst_i),
	.clk_i(clk_i),
	.clk_cnt_i(clk_int),
	.top_i(INCREMENT_VALUE == 2 ? {OCRCH,OCRCL[7:1]} : {OCRCH,OCRCL}),
	.int_o(ocrc_int),
	.int_ack_i(ocrc_int_ack_i)
	);

assign ocrc_int_o = ocrc_int & TIMSK[`OCIE0C];
end
else /* USE_OCRC != TRUE */
begin
assign ocrc_int = 1'b0;
assign ocrc_int_o = 1'b0;
end /* USE_OCRC == TRUE */

end
else /* USE_SIMPLE_COUNTER != "TRUE" */
begin : DEFAULT_16BIT_CNT

reg updt_ocr_on_top;
reg updt_ocr_on_bottom;
always @ *
begin
	case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
		4'd0, 4'd4, 4'd12: // Imediate.
		begin
			updt_ocr_on_top = 1'b0;
			updt_ocr_on_bottom = 1'b0;
		end
		4'd8, 4'd9: // On bottom.
		begin
			updt_ocr_on_top = 1'b0;
			updt_ocr_on_bottom = 1'b1;
		end
		default: // On TOP.
		begin
			updt_ocr_on_top = 1'b1;
			updt_ocr_on_bottom = 1'b0;
		end
	endcase
end

reg [15:0]top_value;
always @ *
begin
	case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
		4'd0: top_value = INCREMENT_VALUE == 2 ? 16'hFFFE : 16'hFFFF;
		4'd1, 4'd5: top_value = INCREMENT_VALUE == 2 ? 16'h00FE : 16'h00FF;
		4'd2, 4'd6: top_value = INCREMENT_VALUE == 2 ? 16'h01FE : 16'h01FF;
		4'd3, 4'd7: top_value = INCREMENT_VALUE == 2 ? 16'h03FE : 16'h03FF;
		//4'd8, 4'd10, 4'd12, 4'd14: top_value = {ICRH, ICRL};
		default: top_value = OCRA_int;
	endcase
end

reg [15:0]t_ovf_value;
always @ *
begin
	case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
		4'd5, 4'd6, 4'd7, 4'd14, 4'd15: t_ovf_value = top_value;
		4'd0, 4'd4, 4'd12: t_ovf_value = INCREMENT_VALUE == 2 ? 16'hFFFE : 16'hFFFF;
		default: t_ovf_value = 16'h0000;
	endcase
end
/* Set "oc" pin on specified conditions*/
always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		TMP_REG_rd <= 8'h00;
		TMP_REG_wr <= 8'h00;
		//GTCCR <= 8'h00;
		TCCRA <= 8'h00;
		TCCRB <= 8'h00;
		//TCCRC <= 8'h00;
		//TCCRD <= 8'h00;
		TCNTL <= 8'h00;
		TCNTH <= 8'h00;
		OCRAL <= 8'h00;
		OCRAH <= 8'h00;
		OCRBL <= 8'h00;
		OCRBH <= 8'h00;
		OCRCL <= 8'h00;
		OCRCH <= 8'h00;
		OCRDL <= 8'h00;
		OCRDH <= 8'h00;
		//ICRL <= 8'h00;
		//ICRH <= 8'h00;
		OCRA_int <= 16'h0000;
		OCRB_int <= 16'h0000;
		OCRC_int <= 16'h0000;
		OCRD_int <= 16'h0000;
		TIMSK <= 8'h00;
		TIFR <= 8'h00;
		tov_p <= 1'b0;
		tov_n <= 1'b0;
		ocra_p <= 1'b0;
		ocra_n <= 1'b0;
		ocrb_p <= 1'b0;
		ocrb_n <= 1'b0;
		ocrc_p <= 1'b0;
		ocrc_n <= 1'b0;
		ocrd_p <= 1'b0;
		ocrd_n <= 1'b0;
		oca_o <= 1'b0;
		ocb_o <= 1'b0;
		occ_o <= 1'b0;
		ocd_o <= 1'b0;
		up_count <= 1'b1;
		clk_int_del <= 1'b0;
	end
	else
	begin
		if(tov_p ^ tov_n)
		begin
			TIFR[`TOV0] <= 1'b1;
			tov_n <= tov_p;
		end	
		if(ocra_p ^ ocra_n)
		begin
			TIFR[`OCF0A] <= 1'b1;
			ocra_n <= ocra_p;
		end	
		if(ocrb_p ^ ocrb_n)
		begin
			TIFR[`OCF0B] <= 1'b1;
			ocrb_n <= ocrb_p;
		end
		if(ocrc_p ^ ocrc_n)
		begin
			TIFR[`OCF0C] <= 1'b1;
			ocrc_n <= ocrc_p;
		end
		if(ocrd_p ^ ocrd_n)
		begin
			TIFR[`OCF0D] <= 1'b1;
			ocrd_n <= ocrd_p;
		end
		if(tov_int_ack_i)
		begin
			TIFR[`TOV0] <= 1'b0;
		end
		if(ocra_int_ack_i)
		begin
			TIFR[`OCF0A] <= 1'b0;
		end
		if(ocrb_int_ack_i)
		begin
			TIFR[`OCF0B] <= 1'b0;
		end
		if(ocrc_int_ack_i)
		begin
			TIFR[`OCF0C] <= 1'b0;
		end
		if(ocrd_int_ack_i)
		begin
			TIFR[`OCF0D] <= 1'b0;
		end
		// Sample one IO core clock once every prescaller positive edge clock.
		clk_int_del <= clk_int; // Shift prescaller clock to a delay register every IO core positive edge clock to detect prescaller positive edges.
		if(((~clk_int_del & clk_int) || TCCRB[`CS02:`CS00] == 3'b001) && TCCRB[`CS02:`CS00] != 3'b000) // if prescaller clock = IO core clock disable prescaller positive edge detector.
		begin
			if(up_count)
				{TCNTH, TCNTL} <= {TCNTH, TCNTL} + INCREMENT_VALUE;
			else if(~up_count)
				{TCNTH, TCNTL} <= {TCNTH, TCNTL} - INCREMENT_VALUE;
			// OCRA
			if(updt_ocr_on_top ? ({TCNTH, TCNTL} == top_value) : (updt_ocr_on_bottom ? ({TCNTH, TCNTL} == 10'h000) : ({TCNTH, TCNTL} == OCRA_int)))
				OCRA_int <= {OCRAH, OCRAL};
			if({TCNTH, TCNTL} == OCRA_int)
			begin
				if(USE_OCRA_OUT == "TRUE")
				begin
					case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
						4'd4, 4'd12: oca_o <= ~oca_o;
						default:
						begin
							case(OCRA_int)
								16'h0000:	oca_o <= 1'b0;
								16'hFFFF:	oca_o <= 1'b1;
								default:
								begin
									if(up_count)
									begin
										case(TCCRA[`COM0A1:`COM0A0])
											2'h1: oca_o <= ~oca_o;
											2'h2: oca_o <= 1'b0;
											2'h3: oca_o <= 1'b1;
										endcase
									end
									else
									begin
										case(TCCRA[`COM0A1:`COM0A0])
											2'h1: oca_o <= ~oca_o;
											2'h2: oca_o <= 1'b1;
											2'h3: oca_o <= 1'b0;
										endcase
									end
								end
							endcase
						end
					endcase
				end
				if(TIMSK[`OCIE0A])
				begin
					if(ocra_p == ocra_n && clk_active == 1'b1)
						ocra_p <= ~ocra_p;
				end
				else
				begin
					ocra_p <= 1'b0;
					ocra_n <= 1'b0;
				end
			end
			// !OCRA
			if(USE_OCRB == "TRUE")
			begin
				// OCRB
				if(updt_ocr_on_top ? ({TCNTH, TCNTL} == top_value) : (updt_ocr_on_bottom ? ({TCNTH, TCNTL} == 10'h000) : ({TCNTH, TCNTL} == OCRB_int)))
					OCRB_int <= {OCRBH, OCRBL};
				if({TCNTH, TCNTL} == OCRB_int)
				begin
					if(USE_OCRB_OUT == "TRUE")
					begin
						case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
							4'd4, 4'd12: ocb_o <= ~ocb_o;
							default:
							begin
								case(OCRB_int)
									16'h0000:	ocb_o <= 1'b0;
									16'hFFFF:	ocb_o <= 1'b1;
									default:
									begin
										if(up_count)
										begin
											case(TCCRA[`COM0B1:`COM0B0])
												2'h1: ocb_o <= ~ocb_o;
												2'h2: ocb_o <= 1'b0;
												2'h3: ocb_o <= 1'b1;
											endcase
										end
										else
										begin
											case(TCCRA[`COM0B1:`COM0B0])
												2'h1: ocb_o <= ~ocb_o;
												2'h2: ocb_o <= 1'b1;
												2'h3: ocb_o <= 1'b0;
											endcase
										end
									end
								endcase
							end
						endcase
					end
					if(TIMSK[`OCIE0B])
					begin
						if(ocrb_p == ocrb_n && clk_active == 1'b1)
							ocrb_p <= ~ocrb_p;
					end
					else
					begin
						ocrb_p <= 1'b0;
						ocrb_n <= 1'b0;
					end
				end
			end // USE_OCRB != "TRUE"
			if(USE_OCRC == "TRUE")
			begin
				// OCRB
				if(updt_ocr_on_top ? ({TCNTH, TCNTL} == top_value) : (updt_ocr_on_bottom ? ({TCNTH, TCNTL} == 10'h000) : ({TCNTH, TCNTL} == OCRC_int)))
					OCRC_int <= {OCRCH, OCRCL};
				if({TCNTH, TCNTL} == OCRC_int)
				begin
					if(USE_OCRC_OUT == "TRUE")
					begin
						case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
							4'd4, 4'd12: occ_o <= ~occ_o;
							default:
							begin
								case(OCRC_int)
									16'h0000:	occ_o <= 1'b0;
									16'hFFFF:	occ_o <= 1'b1;
									default:
									begin
										if(up_count)
										begin
											case(TCCRA[`COM0C1:`COM0C0])
												2'h1: occ_o <= ~occ_o;
												2'h2: occ_o <= 1'b0;
												2'h3: occ_o <= 1'b1;
											endcase
										end
										else
										begin
											case(TCCRA[`COM0C1:`COM0C0])
												2'h1: occ_o <= ~occ_o;
												2'h2: occ_o <= 1'b1;
												2'h3: occ_o <= 1'b0;
											endcase
										end
									end
								endcase
							end
						endcase
					end
					if(TIMSK[`OCIE0C])
					begin
						if(ocrc_p == ocrc_n && clk_active == 1'b1)
							ocrc_p <= ~ocrc_p;
					end
					else
					begin
						ocrc_p <= 1'b0;
						ocrc_n <= 1'b0;
					end
				end
			end // USE_OCRC != "TRUE"
			if(USE_OCRD == "TRUE")
			begin
				// OCRB
				if(updt_ocr_on_top ? ({TCNTH, TCNTL} == top_value) : (updt_ocr_on_bottom ? ({TCNTH, TCNTL} == 10'h000) : ({TCNTH, TCNTL} == OCRD_int)))
					OCRD_int <= {OCRDH, OCRDL};
				if({TCNTH, TCNTL} == OCRD_int)
				begin
					if(USE_OCRD_OUT == "TRUE")
					begin
						case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
							4'd4, 4'd12: ocd_o <= ~ocd_o;
							default:
							begin
								case(OCRB_int)
									16'h0000:	ocd_o <= 1'b0;
									16'hFFFF:	ocd_o <= 1'b1;
									default:
									begin
										if(up_count)
										begin
											case(TCCRA[`COM0D1:`COM0D0])
												2'h1: ocd_o <= ~ocd_o;
												2'h2: ocd_o <= 1'b0;
												2'h3: ocd_o <= 1'b1;
											endcase
										end
										else
										begin
											case(TCCRA[`COM0D1:`COM0D0])
												2'h1: ocd_o <= ~ocd_o;
												2'h2: ocd_o <= 1'b1;
												2'h3: ocd_o <= 1'b0;
											endcase
										end
									end
								endcase
							end
						endcase
					end
					if(TIMSK[`OCIE0D])
					begin
						if(ocrd_p == ocrd_n && clk_active == 1'b1)
							ocrd_p <= ~ocrd_p;
					end
					else
					begin
						ocrd_p <= 1'b0;
						ocrd_n <= 1'b0;
					end
				end
			end // USE_OCRD != "TRUE"
			// TCNT overflow logick.
			if({TCNTH, TCNTL} == t_ovf_value)
			begin
				if(TIMSK[`TOIE0])
				begin
					if(tov_p == tov_n && clk_active == 1'b1)
						tov_p <= ~tov_p;
				end
				else
				begin
					tov_p <= 1'b0;
					tov_n <= 1'b0;
				end
			end
			if({TCNTH, TCNTL} == top_value)
			begin
				case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
					4'd1, 4'd2, 4'd3, 4'd8, 4'd9, 4'd10, 4'd11:
					begin
						up_count <= 1'b0;
						{TCNTH, TCNTL} <= {TCNTH, TCNTL} - INCREMENT_VALUE;
					end 
					default: {TCNTH, TCNTL} <= 16'h0000;
				endcase
			end
			else if({TCNTH, TCNTL} == 16'h0000)
			begin
				case({TCCRB[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]})
					4'd1, 4'd2, 4'd3, 4'd8, 4'd9, 4'd10, 4'd11: 
					begin
						up_count <= 1'b1;
						{TCNTH, TCNTL} <= {TCNTH, TCNTL} + INCREMENT_VALUE;
					end 
				endcase
			end		// Write registers
		if(wr_i & addr_i == TIFR_ADDR)
			TIFR <= TIFR & ~bus_i;
		if(wr_i & addr_i == TIMSK_ADDR)
			TIMSK <= bus_i;
		if(wr_i & io_select)
		begin
			case(addr_i[3:0])
				//GTCCR_ADDR[3:0]: GTCCR <= bus_dat_i;
				TCCRA_ADDR[3:0]: TCCRA <= bus_i;
				TCCRB_ADDR[3:0]: TCCRB <= bus_i;
				//TCCRC_ADDR[3:0]: TCCRC <= bus_i;
				//TCCRD_ADDR[3:0]: TCCRD <= bus_i;
				TCNTL_ADDR[3:0]:
				begin
					TCNTL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
					TCNTH <= TMP_REG_wr;
				end
				/*ICRL_ADDR[3:0]:
				begin
					ICRL <= bus_dat_in;
					ICRH <= TMP_REG_wr;
				end*/
				OCRAL_ADDR[3:0]:
				begin
					OCRAL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
					OCRAH <= TMP_REG_wr;
				end
				OCRBL_ADDR[3:0]:
				begin
					if(USE_OCRB == "TRUE")
					begin
						OCRBL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
						OCRBH <= TMP_REG_wr;
					end
				end
				OCRCL_ADDR[3:0]:
				begin
					if(USE_OCRC == "TRUE")
					begin
						OCRCL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
						OCRCH <= TMP_REG_wr;
					end
				end
				OCRDL_ADDR[3:0]:
				begin
					if(USE_OCRD == "TRUE")
					begin
						OCRDL <= INCREMENT_VALUE == 2 ? {bus_i[7:1], 1'b0} : bus_i;
						OCRDH <= TMP_REG_wr;
					end
				end
				TCNTH_ADDR[3:0], /*ICRH_ADDR, */OCRAH_ADDR[3:0], OCRBH_ADDR[3:0], OCRCH_ADDR[3:0], OCRDH_ADDR[3:0]:
					TMP_REG_wr <= bus_i;
			endcase
		end
		if(rd_i & addr_i == TCNTL_ADDR)
			TMP_REG_rd <= TCNTH;
		//if(rd_dat & addr_dat == ICRL_ADDR)
		//	TMP_REG_rd <= ICRH;

		end
	end
end

assign tov_int_o = TIFR[`TOV0];
assign ocra_int_o = TIFR[`OCF0A];
assign ocrb_int_o = TIFR[`OCF0B];
assign ocrc_int_o = TIFR[`OCF0C];
assign ocrd_int_o = TIFR[`OCF0D];

assign oca_io_connect_o = (TCCRA[`COM0A1:`COM0A0] == 2'b00) ? 1'b0 : (TCCRA[`COM0A1:`COM0A0] == 2'b01 ? (({TCCRA[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]} == 4'd14 || {TCCRA[`WGM03:`WGM02], TCCRA[`WGM01:`WGM00]} == 4'd15) ? 1'b1 : 1'b0) : 1'b1);
assign ocb_io_connect_o = USE_OCRB == "TRUE" ? ((TCCRA[`COM0B1:`COM0B0] == 2'b00 || TCCRA[`COM0B1:`COM0B0] == 2'b01) ? 1'b0 : 1'b1) : 1'b0;
assign occ_io_connect_o = USE_OCRC == "TRUE" ? ((TCCRA[`COM0C1:`COM0C0] == 2'b00 || TCCRA[`COM0C1:`COM0C0] == 2'b01) ? 1'b0 : 1'b1) : 1'b0;
assign ocd_io_connect_o = USE_OCRD == "TRUE" ? ((TCCRA[`COM0D1:`COM0D0] == 2'b00 || TCCRA[`COM0D1:`COM0D0] == 2'b01) ? 1'b0 : 1'b1) : 1'b0;

end /* USE_SIMPLE_COUNTER == "TRUE" */
endgenerate

endmodule
