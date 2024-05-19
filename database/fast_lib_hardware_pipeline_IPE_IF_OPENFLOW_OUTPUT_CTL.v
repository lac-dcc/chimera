// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// ****************************************************************************
// Copyright		: 	NUDT.
// ============================================================================
// FILE NAME		:	outPUT_CTL.v
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
// PURPOSE 			: 	SLOTid determine PKT to slot?
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


module OUTPUT_CTL(
clk,
reset,

in_egress_pkt_wr,
in_egress_pkt,
in_egress_pkt_valid_wr,
in_egress_pkt_valid,
out_egress_pkt_almostfull,

out_slot0_pkt,
out_slot0_pkt_wr,
out_slot0_pkt_valid,
out_slot0_pkt_valid_wr,
in_slot0_pkt_almostfull,

out_slot1_pkt,
out_slot1_pkt_wr,
out_slot1_pkt_valid,
out_slot1_pkt_valid_wr,
in_slot1_pkt_almostfull,

output_receive_pkt_add,
output_discard_error_pkt_add,
output_send_slot0_pkt_add,
output_send_slot1_pkt_add
);

input							clk;
input							reset;

input							in_egress_pkt_wr;
input		[133:0]			in_egress_pkt;
input							in_egress_pkt_valid_wr;
input							in_egress_pkt_valid;
output	wire				out_egress_pkt_almostfull;

output	reg	[133:0]	out_slot0_pkt;
output	reg				out_slot0_pkt_wr;
output	reg				out_slot0_pkt_valid;
output	reg				out_slot0_pkt_valid_wr;
input							in_slot0_pkt_almostfull;

output	reg	[133:0]	out_slot1_pkt;
output	reg				out_slot1_pkt_wr;
output	reg				out_slot1_pkt_valid;
output	reg				out_slot1_pkt_valid_wr;
input							in_slot1_pkt_almostfull;

output	reg				output_receive_pkt_add;
output	reg				output_discard_error_pkt_add;
output	reg				output_send_slot0_pkt_add;
output	reg				output_send_slot1_pkt_add;
reg				[2:0]		xaui_channel;

reg [2:0] 			current_state;//transmit processed pkt to 4 paths by the outport in the metadata of pkt
 parameter idle_s           	= 3'b000,
			  discard_s	         = 3'b001,
           transmit_s        	= 3'b010,
			  wait_s           	= 3'b011,
			  pkt_cut_s				= 3'b100;


always@(posedge clk or negedge reset)
if(!reset)
begin
out_slot0_pkt_wr        		<=	1'b0;
out_slot0_pkt              	<=	134'b0;
out_slot0_pkt_valid_wr  		<=	1'b0;
out_slot0_pkt_valid        	<=	1'b0;

out_slot1_pkt_wr        		<=	1'b0;
out_slot1_pkt              	<=	134'b0;
out_slot1_pkt_valid_wr  		<=	1'b0;
out_slot1_pkt_valid        	<=	1'b0;

in_egress_pkt_valid_rd			<=	1'b0;
in_egress_pkt_rd					<=	1'b0;
xaui_channel						<=	3'b0;//slot ID

output_receive_pkt_add			<=	1'b0;	
output_discard_error_pkt_add	<=	1'b0;
output_send_slot0_pkt_add		<=	1'b0;
output_send_slot1_pkt_add		<=	1'b0;

current_state						<=	idle_s;
end
else
begin
 case(current_state)
  idle_s:begin//judge and poll pkt from pcietx and iace fifo,and reverse order metadata
				out_slot0_pkt_wr        		<=	1'b0;
				out_slot0_pkt              	<=	134'b0;
				out_slot0_pkt_valid_wr  		<=	1'b0;
				out_slot0_pkt_valid        	<=	1'b0;

				out_slot1_pkt_wr        		<=	1'b0;
				out_slot1_pkt              	<=	134'b0;
				out_slot1_pkt_valid_wr  		<=	1'b0;
				out_slot1_pkt_valid        	<=	1'b0;

				output_discard_error_pkt_add	<=	1'b0;
				output_send_slot0_pkt_add		<=	1'b0;
				output_send_slot1_pkt_add		<=	1'b0;
				if(in_egress_pkt_valid_empty	==	1'b0)	begin//judge and poll pkt from pcietx and iace fifo
					if(in_egress_pkt_valid_q	==	1'b1)	begin
						if(in_egress_pkt_q[110]	==	1'b0)	begin//SLOTid 
							if(in_slot0_pkt_almostfull	==	1'b1)	begin
									current_state				<=	idle_s;
								end
								else	begin
									in_egress_pkt_rd			<=	1'b1;
									in_egress_pkt_valid_rd	<=	1'b1;	
									xaui_channel				<=	in_egress_pkt_q[112:110];//slot ID
									output_receive_pkt_add	<=	1'b1;
									current_state				<=	transmit_s;
									end
							end
							else	begin
								if(in_slot1_pkt_almostfull	==	1'b1)	begin
									current_state				<=	idle_s;
									end
									else	begin
										in_egress_pkt_rd			<=	1'b1;
										in_egress_pkt_valid_rd	<=	1'b1;	
										xaui_channel				<=	in_egress_pkt_q[112:110];
										output_receive_pkt_add	<=	1'b1;
										current_state				<=	transmit_s;
										end
								end
						end
						else	begin
							in_egress_pkt_rd			<=	1'b1;
							in_egress_pkt_valid_rd	<=	1'b1;
							current_state				<=	discard_s;
							end
					end
					else
						current_state				<=	idle_s;
			end		 
  discard_s:begin//discard the error pkt from pcietx
					in_egress_pkt_valid_rd	<=	1'b0;
              if(in_egress_pkt_q[133:132]==2'b10)
				   begin
						output_discard_error_pkt_add	<=	1'b1;
						in_egress_pkt_rd 					<=	1'b0;
						current_state						<= idle_s;
					end
					else
					 begin
				     current_state<= discard_s;
					 end
             end				   
  transmit_s:begin//transmit pkt body from pcietx
					output_receive_pkt_add	<=	1'b0;
					in_egress_pkt_valid_rd	<=	1'b0;	
               case(xaui_channel[2:0])//slot
					 3'b000:begin
					         out_slot0_pkt_wr        <=1'b1;
								out_slot0_pkt              <=	in_egress_pkt_q;
					        if(in_egress_pkt_q[133:132]==2'b10)//pkt tail
							  begin
							   in_egress_pkt_rd 				<=	1'b0;							   
                        out_slot0_pkt_valid_wr  	<=	1'b1;
								output_send_slot0_pkt_add	<=	1'b1;
                        out_slot0_pkt_valid        <=	1'b1;
								current_state<= idle_s;
							  end
							  else//pkt head and pkt middle
							  begin
							   in_egress_pkt_rd 				<=	1'b1;								
								current_state<= transmit_s;
							  end
					       end
					 3'b001:begin
					         out_slot1_pkt_wr        <=1'b1;
                        out_slot1_pkt              <=in_egress_pkt_q;
					        if(in_egress_pkt_q[133:132]==2'b10)//pkt tail
							  begin
							   in_egress_pkt_rd 				<=	1'b0;							   
                        out_slot1_pkt_valid_wr  	<=	1'b1;
								output_send_slot1_pkt_add	<=	1'b1;
                        out_slot1_pkt_valid        <=	1'b1;
								current_state					<= idle_s;
							  end
							  else//pkt head and pkt middle
							  begin
							   in_egress_pkt_rd <=1'b1;
								current_state<= transmit_s;
							  end
					       end						
					endcase
              end
 endcase
end

wire [7:0] in_egress_pkt_usedw;
assign out_egress_pkt_almostfull = in_egress_pkt_usedw[7];

reg in_egress_pkt_rd;
wire [133:0] in_egress_pkt_q;		
fifo_256_134 egress_pkt(
	.aclr(!reset),
	.clock(clk),
	.data(in_egress_pkt),
	.rdreq(in_egress_pkt_rd),
	.wrreq(in_egress_pkt_wr),
	.q(in_egress_pkt_q),
	.usedw(in_egress_pkt_usedw)
   );     
 reg in_egress_pkt_valid_rd;
 wire in_egress_pkt_valid_empty;
 wire in_egress_pkt_valid_q; 
fifo_64_1 egress_pkt_valid(
	.aclr(!reset),
	.clock(clk),
	.data(in_egress_pkt_valid),
	.rdreq(in_egress_pkt_valid_rd),
	.wrreq(in_egress_pkt_valid_wr),
	.empty(in_egress_pkt_valid_empty),
	.q(in_egress_pkt_valid_q)
   );		
endmodule		
