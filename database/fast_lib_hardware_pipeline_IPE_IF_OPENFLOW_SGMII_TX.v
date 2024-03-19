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


module SGMII_TX(
clk,
reset,
ff_tx_clk,
ff_tx_data,//
ff_tx_sop,
ff_tx_mod,
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
output	[31:0]	ff_tx_data;
output	[1:0]		ff_tx_mod;
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

reg		[31:0]	ff_tx_data;
reg		[1:0]		ff_tx_mod;
reg					ff_tx_sop;
reg					ff_tx_eop;
reg					ff_tx_err;	
reg					ff_tx_wren;
reg					ff_tx_crc_fwd;

reg					pkt_send_add;

reg		[133:0]	data_in_q_r;
reg 		[2:0]		current_state;
parameter 	idle_s				=	3'b000,
				transmit_byte0_s	=	3'b001,
				transmit_byte1_s	=	3'b010,
				transmit_byte2_s	=	3'b011,
				transmit_byte3_s	=	3'b100,
				discard_s			=	3'b101;

always@(posedge ff_tx_clk or negedge reset)
if(!reset) begin
	ff_tx_data					<=	32'b0;
	ff_tx_mod					<=	2'b0;
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
				ff_tx_sop					<=	1'b0;
				ff_tx_eop					<=	1'b0;
				ff_tx_mod					<=	2'b0;
				if(ff_tx_rdy	==	1'b1)	begin
					if(!data_in_valid_empty)	begin//0:has pkt 1:no pkt
						data_in_rdreq				<=	1'b1;
						data_in_valid_rdreq		<=	1'b1;
						if(data_in_valid_q	==	1'b1)	begin//pkt valid
							pkt_send_add				<=	1'b1;
							data_in_q_r					<=	data_in_q;
							
							ff_tx_sop					<=	1'b1;
							ff_tx_data					<=	data_in_q[127:96];
							ff_tx_wren					<=	1'b1;
							
							current_state				<=	transmit_byte1_s;
						end
						else begin//pkt error
							pkt_send_add				<=	1'b0;
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
				if(ff_tx_rdy	==	1'b0)	begin//MAC core don't ready need wait
					current_state				<=	transmit_byte0_s;
					ff_tx_wren					<=	1'b0;
				end
				else begin
					ff_tx_data					<=	data_in_q_r[127:96];
					ff_tx_wren					<=	1'b1;
					if(data_in_q_r[133:132]	==	2'b10)	begin//pkt tail
						if(data_in_q_r[131:130]	==	2'b11)begin
							ff_tx_eop					<=	1'b1;
							ff_tx_mod					<=	data_in_q_r[129:128];
							ff_tx_crc_fwd				<=	1'b0;
							current_state				<=	idle_s;
						end
						else 
							current_state				<=	transmit_byte1_s;	
					end
					else begin
						current_state				<=	transmit_byte1_s;
					end
				end
			end
			transmit_byte1_s:	begin
				ff_tx_sop					<=	1'b0;
				data_in_rdreq				<=	1'b0;
				data_in_valid_rdreq		<=	1'b0;
				pkt_send_add				<=	1'b0;
				if(ff_tx_rdy	==	1'b0)	begin
					current_state				<=	transmit_byte1_s;
					ff_tx_wren					<=	1'b0;
					end
					else begin
						ff_tx_data					<=	data_in_q_r[95:64];
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin	
								if(data_in_q_r[131:130]	==	2'b10)begin
									ff_tx_eop					<=	1'b1;
									ff_tx_crc_fwd				<=	1'b0;
									ff_tx_mod					<=	data_in_q_r[129:128];
									current_state				<=	idle_s;
								end
								else 
									current_state				<=	transmit_byte2_s;
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
						ff_tx_data					<=	data_in_q_r[63:32];
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin	
							if(data_in_q_r[131:130]	==	2'b01)begin
								ff_tx_eop					<=	1'b1;
								ff_tx_crc_fwd				<=	1'b0;
								ff_tx_mod					<=	data_in_q_r[129:128];
								current_state				<=	idle_s;
							end
							else 
								current_state				<=	transmit_byte3_s;
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
						ff_tx_data					<=	data_in_q_r[31:0];
						ff_tx_wren					<=	1'b1;
						if(data_in_q_r[133:132]	==	2'b10)	begin
							ff_tx_eop					<=	1'b1;
							ff_tx_crc_fwd				<=	1'b0;
							ff_tx_mod					<=	data_in_q_r[129:128];
							current_state				<=	idle_s;
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