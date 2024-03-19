// ****************************************************************************
// Copyright		: 	NUDT.
// ============================================================================
// FILE NAME		:	SGMII_RX.v
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
// PURPOSE 			: 	MAC core  output 8bit pkt format transform 134bit pkt format
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


module SGMII_RX1
(reset,
ff_rx_clk,	
ff_rx_rdy,
ff_rx_data,
ff_rx_sop,
ff_rx_eop,
rx_err,	
rx_err_stat,
rx_frm_type,
ff_rx_dsav,
ff_rx_dval,
ff_rx_a_full,
ff_rx_a_empty,

pkt_receive_add,
pkt_discard_add,

out_pkt_wrreq,
out_pkt,
out_pkt_almostfull,
out_valid_wrreq,
out_valid
);

input					reset;
input					ff_rx_clk;
output				ff_rx_rdy;
input		[7:0]		ff_rx_data;
input					ff_rx_sop;
input					ff_rx_eop;
input		[5:0]		rx_err;
input		[17:0]	rx_err_stat;
input		[3:0]		rx_frm_type;
input					ff_rx_dsav;
input					ff_rx_dval;
input					ff_rx_a_full;
input					ff_rx_a_empty;

output				pkt_receive_add;
output				pkt_discard_add;

output				out_pkt_wrreq;
output	[133:0]	out_pkt;
input					out_pkt_almostfull;
output				out_valid_wrreq;
output				out_valid;

reg					ff_rx_rdy;

reg					pkt_receive_add;
reg					pkt_discard_add;

reg					out_pkt_wrreq;
reg		[133:0]	out_pkt;
reg					out_valid_wrreq;
reg					out_valid;
reg [4:0]current_state;
parameter 	//idle_s				=	5'b00000,
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

				
always@(posedge ff_rx_clk or negedge reset)
if(!reset)	begin
	ff_rx_rdy				<=	1'b0;
	out_pkt_wrreq			<=	1'b0;
	out_pkt					<=	134'b0;
	out_valid_wrreq		<=	1'b0;
	out_valid				<=	1'b0;
	pkt_receive_add		<=	1'b0;
	pkt_discard_add		<=	1'b0;
	current_state			<=	transmit_byte0_s;
	end
	else begin
		ff_rx_rdy				<=	1'b1;
		case(current_state)
			transmit_byte0_s:	begin
				out_valid_wrreq	<=	1'b0;
				out_valid			<=	1'b0;
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin//data valid 
					out_pkt[127:120]	<=	ff_rx_data;
					if(ff_rx_sop	==	1'b1)	begin	//pkt head					
						if(!out_pkt_almostfull)	begin//FIFO can receive a 1518B pkt
							out_pkt[133:132]	<=	2'b01;
							pkt_receive_add	<=	1'b1;
							current_state		<=	transmit_byte1_s;
							end
							else begin
								pkt_discard_add		<=	1'b1;
								current_state			<=	discard_s;
								end
							
						end
						else if(ff_rx_eop	==	1'b1)	begin//pkt tail
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1111;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin//pkt error
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte1_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte0_s;
						end											
				end
			transmit_byte1_s:	begin
				out_pkt_wrreq		<=	1'b0;
				pkt_receive_add	<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin//data valid
					out_pkt[119:112]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin//pkt head
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1110;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin//pkt error
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte2_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte1_s;
						end											
				end
			transmit_byte2_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[111:104]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1101;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte3_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte2_s;
						end											
				end
			transmit_byte3_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[103:96]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1100;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte4_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte3_s;
						end											
				end
			transmit_byte4_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[95:88]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1011;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte5_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte4_s;
						end											
				end
			transmit_byte5_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[87:80]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1010;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte6_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte5_s;
						end											
				end
			transmit_byte6_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[79:72]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1001;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte7_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte6_s;
						end											
				end
			transmit_byte7_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[71:64]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b1000;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte8_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte7_s;
						end											
				end
			transmit_byte8_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[63:56]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0111;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte9_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte8_s;
						end											
				end
			transmit_byte9_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[55:48]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0110;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte10_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte9_s;
						end											
				end
			transmit_byte10_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[47:40]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0101;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte11_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte10_s;
						end											
				end
			transmit_byte11_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[39:32]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0100;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte12_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte11_s;
						end											
				end
			transmit_byte12_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[31:24]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0011;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte13_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte12_s;
						end											
				end
			transmit_byte13_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[23:16]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0010;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte14_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte13_s;
						end											
				end
			transmit_byte14_s:	begin
				out_pkt_wrreq		<=	1'b0;
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt[15:8]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0001;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte15_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte14_s;
						end											
				end
			transmit_byte15_s:	begin
				
				if(ff_rx_dval	==	1'b1)	begin
					out_pkt_wrreq		<=	1'b1;
					out_pkt[7:0]	<=	ff_rx_data;
					if(ff_rx_eop	==	1'b1)	begin
							out_pkt[133:132]	<=	2'b10;
							out_pkt[131:128]	<=	4'b0000;
							out_pkt_wrreq		<=	1'b1;
							if(rx_err	==	6'b0)	begin
								out_valid_wrreq	<=	1'b1;
								out_valid			<=	1'b1;
								end
								else	begin
									out_valid_wrreq	<=	1'b1;
									out_valid			<=	1'b0;
									end
							current_state		<=	transmit_byte0_s;
							end
							else	begin
								//out_pkt[133:132]	<=	2'b11;
								current_state		<=	transmit_byte0_s;
								end
							
					end
					else	begin
						current_state			<=	transmit_byte15_s;
						end											
				end
			discard_s:begin
				out_pkt_wrreq		<=	1'b0;
				pkt_discard_add	<=	1'b0;
				if((ff_rx_dval	==	1'b1)&&(ff_rx_eop	==	1'b1))begin
					current_state		<=	transmit_byte0_s;
					end
					else	begin
						current_state		<=	discard_s;
						end
				end
			endcase
		end
endmodule	