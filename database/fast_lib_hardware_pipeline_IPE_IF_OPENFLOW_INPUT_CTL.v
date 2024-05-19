// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// ****************************************************************************
// Copyright		: 	NUDT.
// ============================================================================
// FILE NAME		:	INPUT_CTL.v
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
// PURPOSE 			: 	
// ----------------------------------------------------------------------------
// ============================================================================
// REUSE ISSUES
// Reset Strategy	:	Async clear,active high
// Clock Domains	:	clk
// Critical TiminG	:	N/A
// Instantiations	:	N/A
// Synthesizable	:	N/A
// Others			:	N/A
// ****************************************************************************



module INPUT_CTL(
clk,
reset,
pkt_send_count,

//-------From MUX0 FIFO--------------------
in_xaui0_pkt_wr,
in_xaui0_pkt,
out_xaui0_pkt_almostfull,
in_xaui0_pkt_valid_wr,
in_xaui0_pkt_valid,
//-------From MUX1 FIFO--------------------
in_xaui1_pkt_wr,
in_xaui1_pkt,
out_xaui1_pkt_almostfull,
in_xaui1_pkt_valid_wr,
in_xaui1_pkt_valid,
//-------To ingress FIFO--------------------
out_xaui_pkt_wr,
out_xaui_pkt,
in_xaui_pkt_almostfull,
out_xaui_valid_wr,
out_xaui_valid,

inputctl_receive_pkt_add);

input 				clk;
input 				reset;
input 				in_xaui0_pkt_wr;
input 	[133:0]	in_xaui0_pkt;
output 				out_xaui0_pkt_almostfull;
input 				in_xaui0_pkt_valid_wr;
input 	[11:0]	in_xaui0_pkt_valid;
					
input 				in_xaui1_pkt_wr;
input 	[133:0]	in_xaui1_pkt;
output 				out_xaui1_pkt_almostfull;
input 				in_xaui1_pkt_valid_wr;
input 	[11:0]	in_xaui1_pkt_valid;					
					
output 				out_xaui_pkt_wr;
output 	[133:0]	out_xaui_pkt;
input 				in_xaui_pkt_almostfull;
output 				out_xaui_valid_wr;
output 				out_xaui_valid;
				
output				inputctl_receive_pkt_add;	
reg					inputctl_receive_pkt_add;
									
reg 					out_xaui_pkt_wr;
reg 		[133:0]	out_xaui_pkt;
reg 					out_xaui_valid_wr;
reg 					out_xaui_valid;
										
reg 					in_xaui0_pkt_rd;
reg 					in_xaui0_pkt_valid_rd;
wire 					in_xaui0_pkt_valid_empty;
					
reg 					in_xaui1_pkt_rd;
reg 					in_xaui1_pkt_valid_rd;
wire 					in_xaui1_pkt_valid_empty;	
	
reg 					turner;
					
reg 		[1:0]		current_state;//receive pkts from two paths,add necessary message for other module and transmit these processed pkt
output 	[31:0]	pkt_send_count;
reg 		[31:0]	pkt_send_count;//sum of the pkt have send

parameter 			idle_s			=	2'b00,
						transmit_s		=	2'b01,
						transmit1_s		= 	2'b10;


always@(posedge clk or negedge reset)
if(!reset)begin
		out_xaui_pkt_wr					<=	1'b0;
		out_xaui_pkt						<=	134'b0;
		out_xaui_valid_wr					<=	1'b0;
		out_xaui_valid						<=	1'b0;
		in_xaui0_pkt_rd					<=	1'b0;
		in_xaui0_pkt_valid_rd			<=	1'b0;
		in_xaui1_pkt_rd					<=	1'b0;
		in_xaui1_pkt_valid_rd			<=	1'b0;
		turner								<=	1'b0;
		pkt_send_count						<=	32'b0;
		inputctl_receive_pkt_add		<=	1'b0;
		current_state						<=	idle_s;
		end	
		else begin 
			case(current_state)
				idle_s: begin//receive pkt by poll fifo of two paths
					out_xaui_pkt_wr				<=	1'b0;
					out_xaui_valid_wr				<=	1'b0;
					in_xaui0_pkt_rd				<=	1'b0;
					in_xaui0_pkt_valid_rd		<=	1'b0;  
					in_xaui1_pkt_rd				<=	1'b0;
					in_xaui1_pkt_valid_rd		<=	1'b0; 
					inputctl_receive_pkt_add	<=	1'b0;
					case({in_xaui0_pkt_valid_empty,in_xaui1_pkt_valid_empty})//which fifo have complete pkt   0:have  1:have not
						2'b01:begin
							if(in_xaui_pkt_almostfull	==	1'b0) begin
								in_xaui0_pkt_rd				<=	1'b1;
								in_xaui0_pkt_valid_rd		<=	1'b1;
								inputctl_receive_pkt_add	<=	1'b1;
								current_state					<=	transmit_s;				
								end
								else begin
									current_state			<=	idle_s;
									end
							end
						2'b10:begin
							if(in_xaui_pkt_almostfull	==	1'b0) begin
								in_xaui1_pkt_rd				<=	1'b1;
								in_xaui1_pkt_valid_rd		<=	1'b1;
								inputctl_receive_pkt_add	<=	1'b1;
								current_state					<=	transmit1_s;				
								end
								else begin
									current_state			<=	idle_s;
									end
							end
						2'b00:begin
							if(turner	==	1'b0)begin
								if(in_xaui_pkt_almostfull	==	1'b0) begin
										in_xaui0_pkt_rd				<=	1'b1;
										in_xaui0_pkt_valid_rd		<=	1'b1;
										inputctl_receive_pkt_add	<=	1'b1;
										turner							<=	1'b1;
										current_state					<=	transmit_s;				
										end
										else begin
											if(in_xaui_pkt_almostfull	==	1'b0) begin
												in_xaui1_pkt_rd				<=	1'b1;
												in_xaui1_pkt_valid_rd		<=	1'b1;
												inputctl_receive_pkt_add	<=	1'b1;
												current_state					<=	transmit1_s;				
												end
												else begin
													current_state			<=	idle_s;
													end
											end
								end
								else begin
									if(in_xaui_pkt_almostfull	==	1'b0) begin
										in_xaui1_pkt_rd					<=	1'b1;
										in_xaui1_pkt_valid_rd			<=	1'b1;
										inputctl_receive_pkt_add		<=	1'b1;
										turner								<=	1'b0;										
										current_state						<=	transmit1_s;				
										end
										else begin
											if(in_xaui_pkt_almostfull	==	1'b0) begin
												in_xaui0_pkt_rd				<=	1'b1;
												in_xaui0_pkt_valid_rd		<=	1'b1;
												inputctl_receive_pkt_add	<=	1'b1;
												current_state					<=	transmit_s;				
												end
												else begin
													current_state			<=	idle_s;
													end
											end								
									end
								end				
						default:begin
							current_state	<=	idle_s;
							end
					endcase
					end			
		   
				transmit_s:begin//add outport to the metadata
					if(in_xaui0_pkt_q[133:132]	==	2'b01) begin
						in_xaui0_pkt_rd				<=	1'b1;
						in_xaui0_pkt_valid_rd		<=	1'b0;
						inputctl_receive_pkt_add	<=	1'b0;
						out_xaui_pkt_wr				<=	1'b1;
						out_xaui_pkt					<=	in_xaui0_pkt_q;
						//out_xaui_pkt[77:64]			<=	14'h0000;
						out_xaui_pkt[55:47]			<=	9'b0;//output port 
						out_xaui_pkt[123:113]	<=	in_xaui0_pkt_valid_q[10:0];//pkt length						
						current_state				<=	transmit_s;
						end
						else if(in_xaui0_pkt_q[133:132]	==	2'b10)begin
							in_xaui0_pkt_rd						<=	1'b0;
							out_xaui_pkt							<=	in_xaui0_pkt_q; 	
							pkt_send_count					<=	pkt_send_count+32'd1;//lxj0107
							out_xaui_valid_wr				<=	1'b1;
							out_xaui_valid					<=	1'b1;
							current_state					<=	idle_s;
							end
							else begin
								out_xaui_pkt						<=	in_xaui0_pkt_q;
								current_state						<=	transmit_s;
							end
					end 		
				transmit1_s:begin//transmit current pkt to the next module 
					out_xaui_pkt									<=	in_xaui1_pkt_q;
					if(in_xaui1_pkt_q[133:132]	==	2'b01) begin
						in_xaui1_pkt_rd							<=	1'b1;
						in_xaui1_pkt_valid_rd					<=	1'b0;
						inputctl_receive_pkt_add				<=	1'b0;
						out_xaui_pkt_wr							<=	1'b1; 
						out_xaui_pkt[55:47]						<= 9'b0;//lxj0605
						//out_xaui_pkt[77:64]						<=	14'h0000;
						out_xaui_pkt[123:113]					<=	in_xaui1_pkt_valid_q[10:0];//pkt length 
						current_state								<=	transmit1_s;
						end
						else if(in_xaui1_pkt_q[133:132]	==	2'b10)begin
							in_xaui1_pkt_rd						<=	1'b0;
							out_xaui_pkt							<=	in_xaui1_pkt_q; 	
							pkt_send_count					<=	pkt_send_count+32'd1;//lxj0107
							out_xaui_valid_wr				<=	1'b1;
							out_xaui_valid					<=	1'b1;
							current_state					<=	idle_s;					
							end
							else begin
								out_xaui_pkt						<=	in_xaui1_pkt_q;
								current_state					<=	transmit1_s;
								end
						end 		  											  
				default:current_state							<=	idle_s;
				endcase
			end

  wire [133:0] in_xaui0_pkt_q;
  wire [7:0] out_xaui0_pkt_usedw;
  assign out_xaui0_pkt_almostfull =	out_xaui0_pkt_usedw[7];
fifo_256_134 FIFO_XAUI0_PKT(
										.aclr(!reset),
										.data(in_xaui0_pkt),
										.clock(clk),
										.rdreq(in_xaui0_pkt_rd),
										.wrreq(in_xaui0_pkt_wr),
										.q(in_xaui0_pkt_q),
										.usedw(out_xaui0_pkt_usedw)
								);		
		
wire [11:0]	in_xaui0_pkt_valid_q;
		
fifo_64_12 FIFO_XAUI0_VALID(
	.aclr(!reset),
	.data(in_xaui0_pkt_valid),
	.clock(clk),
	.rdreq(in_xaui0_pkt_valid_rd),
	.wrreq(in_xaui0_pkt_valid_wr),
	.q(in_xaui0_pkt_valid_q),
	.empty(in_xaui0_pkt_valid_empty));	
	
	
  wire [133:0] in_xaui1_pkt_q;
  wire [7:0] out_xaui1_pkt_usedw;
  assign out_xaui1_pkt_almostfull =	out_xaui1_pkt_usedw[7];
fifo_256_134 FIFO_XAUI1_PKT(
										.aclr(!reset),
										.data(in_xaui1_pkt),
										.clock(clk),
										.rdreq(in_xaui1_pkt_rd),
										.wrreq(in_xaui1_pkt_wr),
										.q(in_xaui1_pkt_q),
										.usedw(out_xaui1_pkt_usedw)
								);		
		
wire [11:0]	in_xaui1_pkt_valid_q;
		
fifo_64_12 FIFO_XAUI1_VALID(
	.aclr(!reset),
	.data(in_xaui1_pkt_valid),
	.clock(clk),
	.rdreq(in_xaui1_pkt_valid_rd),
	.wrreq(in_xaui1_pkt_valid_wr),
	.q(in_xaui1_pkt_valid_q),
	.empty(in_xaui1_pkt_valid_empty));	
			

endmodule