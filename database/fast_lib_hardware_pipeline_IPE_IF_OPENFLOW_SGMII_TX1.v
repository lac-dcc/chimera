/*
134bit pkt format transform MAC core  need 8bit pkt format
*/
// ****************************************************************************
// Copyright		: 	NUDT.
// ============================================================================
// FILE NAME		:	SGMII_TX.v
// CREATE DATE		:	2013-12-03 
// AUTHOR			:	ZengQiang
// AUTHOR'S EMAIL	:	13973184419@163.com
// AUTHOR'S TEL		:	
// ============================================================================
// RELEASE 	HISTORY		-------------------------------------------------------
// VERSION 			DATE				AUTHOR				DESCRIPTION
// 1.0	   		2013-12-03		ZengQiang			Original Verison
// ============================================================================
// KEYWORDS 		: 	N/A
// ----------------------------------------------------------------------------
// PURPOSE 			: 	134bit pkt format transform MAC core  need 8bit pkt format
// ----------------------------------------------------------------------------
// ============================================================================
// REUSE ISSUES
// Reset Strategy	:	Async clear,active high
// Clock Domains	:	ff_rx_clk
// Critical TiminG	:	N/A
// Instantiations	:	N/A
// Synthesizable	:	N/A
// Others			:	N/A
// ****************************************************************************


module SGMII_TX1(
clk,
reset,
ff_tx_clk,
ff_tx_data,//
ff_tx_sop,
ff_tx_eop,
ff_tx_err,	
ff_tx_wren,
ff_tx_crc_fwd,//CRC ADD 
tx_ff_uflow,
ff_tx_rdy,//core ready 
ff_tx_septy,	
ff_tx_a_full,
ff_tx_a_empty,

pkt_send_add,

data_in_wrreq,
data_in,
data_in_almostfull,
data_in_valid_wrreq,
data_in_valid  );

input					clk;
input					reset;
input					ff_tx_clk;
output	[7:0]		ff_tx_data;
output				ff_tx_sop;
output				ff_tx_eop;
output				ff_tx_err;	
output				ff_tx_wren;
output				ff_tx_crc_fwd;
input					tx_ff_uflow;
input					ff_tx_rdy;
input					ff_tx_septy;	
input					ff_tx_a_full;
input					ff_tx_a_empty;

output				pkt_send_add;

input					data_in_wrreq;
input		[133:0]	data_in;
output				data_in_almostfull;
input					data_in_valid_wrreq;
input					data_in_valid; 

reg		[7:0]		ff_tx_data;
reg					ff_tx_sop;
reg					ff_tx_eop;
reg					ff_tx_err;	
reg					ff_tx_wren;
reg					ff_tx_crc_fwd;

reg					pkt_send_add;

reg		[133:0]	data_in_q_r;
reg [4:0]current_state;
parameter 	idle_s				=	5'b00000,
				transmit_byte0_s	=	5'b00001,
				transmit_byte1_s	=	5'b00010,
				transmit_byte2_s	=	5'b00011,
				transmit_byte3_s	=	5'b00100,
				transmit_byte4_s	=	5'b00101,
				transmit_byte5_s	=	5'b00110,
				transmit_byte6_s	=	5'b00111,
				transmit_byte7_s	=	5'b01000,
				transmit_byte8_s	=	5'b01001,
				transmit_byte9_s	=	5'b01010,
				transmit_byte10_s	=	5'b01011,
				transmit_byte11_s	=	5'b01100,
				transmit_byte12_s	=	5'b01101,
				transmit_byte13_s	=	5'b01110,
				transmit_byte14_s	=	5'b01111,
				transmit_byte15_s	=	5'b10000,
				discard_s			=	5'b10001;

always@(posedge ff_tx_clk or negedge reset)
if(!reset) begin
	ff_tx_data					<=	8'b0;
	ff_tx_sop					<=	1'b0;
	ff_tx_eop					<=	1'b0;
	ff_tx_err					<=	1'b0;
	ff_tx_wren					<=	1'b0;
	ff_tx_crc_fwd				<=	1'b1;
	data_in_rdreq				<=	1'b0;
	data_in_valid_rdreq		<=	1'b0;
	pkt_send_add				<=	1'b0;
	data_in_q_r					<=	134'b0;
	current_state				<=	idle_s;
	end
	else	begin
		case(current_state)
			idle_s:	begin
				ff_tx_crc_fwd				<=	1'b1;
				ff_tx_wren					<=	1'b0;
				ff_tx_eop					<=	1'b0;
				if(ff_tx_rdy	==	1'b1)	begin
					if(!data_in_valid_empty)	begin//0:has pkt 1:no pkt
						if(data_in_valid_q	==	1'b1)	begin//pkt valid
							data_in_rdreq				<=	1'b1;
							data_in_valid_rdreq		<=	1'b1;
							pkt_send_add				<=	1'b1;
							data_in_q_r					<=	data_in_q;
							current_state				<=	transmit_byte0_s;
							end
							else	begin//pkt error
								data_in_rdreq				<=	1'b1;
								data_in_valid_rdreq		<=	1'b1;
								current_state				<=	discard_s;
								end
						end
						else	begin
							current_state				<=	idle_s;
							end
					end
					else	begin
						current_state				<=	idle_s;
						end					
				end
			transmit_byte0_s:	begin
				data_in_rdreq				<=	1'b0;
				data_in_valid_rdreq		<=	1'b0;
				pkt_send_add				<=	1'b0;
				if(ff_tx_rdy	==	1'b0)	begin//MAC core don't ready need wait
					current_state				<=	transmit_byte0_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[127:120];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b01)	begin//pkt head
							ff_tx_sop					<=	1'b1;
							current_state				<=	transmit_byte1_s;
							end
							else if(data_in_q_r[133:132]	==	2'b10)	begin//pkt tail
								if(data_in_q_r[131:128]	==	4'b1111)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte1_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte1_s;
									end
						end
					end
			transmit_byte1_s:	begin
				ff_tx_sop					<=	1'b0;
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte1_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[119:112];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1110)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte2_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte2_s;
									end
							end
					end
			transmit_byte2_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte2_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[111:104];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1101)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte3_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte3_s;
									end
						end
				end
			transmit_byte3_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte3_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[103:96];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1100)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte4_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte4_s;
									end
						end
				end
			transmit_byte4_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte4_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[95:88];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1011)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte5_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte5_s;
									end
						end
				end
			transmit_byte5_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte5_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[87:80];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1010)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte6_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte6_s;
									end
						end
				end
			transmit_byte6_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte6_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[79:72];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1001)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte7_s;
										end
								end
								else	begin

									current_state				<=	transmit_byte7_s;
									end
						end
				end
			transmit_byte7_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte7_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[71:64];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b1000)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte8_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte8_s;
									end
						end
				end
			transmit_byte8_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte8_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[63:56];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0111)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte9_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte9_s;
									end
						end
				end
			transmit_byte9_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte9_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[55:48];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0110)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte10_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte10_s;
									end
						end
				end
			transmit_byte10_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte10_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[47:40];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0101)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte11_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte11_s;
									end
						end
				end
			transmit_byte11_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte11_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[39:32];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0100)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte12_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte12_s;
									end
						end
				end
			transmit_byte12_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte12_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[31:24];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0011)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte13_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte13_s;
									end
						end
				end
			transmit_byte13_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte13_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[23:16];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0010)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte14_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte14_s;
									end
						end
				end
			transmit_byte14_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte14_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[15:8];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0001)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state				<=	transmit_byte15_s;
										end
								end
								else	begin
									current_state				<=	transmit_byte15_s;
									end
						end
				end
			transmit_byte15_s:	begin
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte15_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[7:0];
						ff_tx_err					<=	1'b0;
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
								if(data_in_q_r[131:128]	==	4'b0000)	begin							
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									current_state				<=	idle_s;
									end
									else	begin
										data_in_rdreq				<=	1'b1;
										data_in_q_r					<=	data_in_q;
										current_state				<=	transmit_byte0_s;
										end
								end
								else	begin
									data_in_rdreq				<=	1'b1;
									data_in_q_r					<=	data_in_q;
									current_state				<=	transmit_byte0_s;
									end
						end
				end
			discard_s:	begin
				data_in_valid_rdreq		<=	1'b0;
				if(data_in_q[133:132]==2'b10)	begin
					data_in_rdreq				<=	1'b0;
					current_state				<=	idle_s;
					end
					else	begin
						data_in_rdreq				<=	1'b1;
						current_state				<=	discard_s;
						end
				end
			endcase
		end

reg data_in_rdreq;
wire [7:0] data_in_usedw;
assign data_in_almostfull = data_in_usedw[7];
wire 	[133:0]	data_in_q;
  asyn_256_134 asyn_256_134(
	.aclr(!reset),
	.wrclk(clk),
	.wrreq(data_in_wrreq),
	.data(data_in),
	.rdclk(ff_tx_clk),
	.rdreq(data_in_rdreq),
	.q(data_in_q),
	.wrusedw(data_in_usedw)
   ); 
	reg data_in_valid_rdreq;
	wire data_in_valid_q;
	wire data_in_valid_empty;
asyn_64_1 asyn_64_1(
	.aclr(!reset),
	.wrclk(clk),
	.wrreq(data_in_valid_wrreq),
	.data(data_in_valid),	
	.rdclk(ff_tx_clk),
	.rdreq(data_in_valid_rdreq),
	.q(data_in_valid_q),
	.rdempty(data_in_valid_empty)
   );	
endmodule 