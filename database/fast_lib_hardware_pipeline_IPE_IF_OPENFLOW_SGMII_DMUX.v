// ****************************************************************************
// Copyright		: 	NUDT.
// ============================================================================
// FILE NAME		:	DMUX.v
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
// PURPOSE 			: 	output port determine the pkt is transmitted ouput channel
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

module SGMII_DMUX(
clk,
reset,
//-------To path0-------------------
out_xaui0_pkt_wr,
out_xaui0_pkt,
in_xaui0_pkt_almostfull,
out_xaui0_pkt_valid_wr,
out_xaui0_pkt_valid,
//-------To path1-------------------
out_xaui1_pkt_wr,
out_xaui1_pkt,
in_xaui1_pkt_almostfull,
out_xaui1_pkt_valid_wr,
out_xaui1_pkt_valid,
//-------To path2-------------------
out_xaui2_pkt_wr,
out_xaui2_pkt,
in_xaui2_pkt_almostfull,
out_xaui2_pkt_valid_wr,
out_xaui2_pkt_valid,
//-------To path3-------------------
out_xaui3_pkt_wr,
out_xaui3_pkt,
in_xaui3_pkt_almostfull,
out_xaui3_pkt_valid_wr,
out_xaui3_pkt_valid,
//-------To path4-------------------
out_xaui4_pkt_wr,
out_xaui4_pkt,
in_xaui4_pkt_almostfull,
out_xaui4_pkt_valid_wr,
out_xaui4_pkt_valid,

//-------From EGRESS -------------------
in_egress_pkt_wr,
in_egress_pkt,
out_egress_pkt_almostfull,
in_egress_pkt_valid_wr,
in_egress_pkt_valid,

dmux_receive_pkt_add,
dmux_discard_error_pkt_add,
dmux_send_port0_pkt_add,
dmux_send_port1_pkt_add,
dmux_send_port2_pkt_add,
dmux_send_port3_pkt_add,
dmux_send_port4_pkt_add);

input 				clk;
input 				reset;
//path0
output 				out_xaui0_pkt_wr;
output [133:0] 	out_xaui0_pkt;
input 				in_xaui0_pkt_almostfull;
output 				out_xaui0_pkt_valid_wr;
output 				out_xaui0_pkt_valid;
//path1
output 				out_xaui1_pkt_wr;
output [133:0] 	out_xaui1_pkt;
input 				in_xaui1_pkt_almostfull;
output 				out_xaui1_pkt_valid_wr;
output 				out_xaui1_pkt_valid;
 
 //path2
output 				out_xaui2_pkt_wr;
output [133:0] 	out_xaui2_pkt;
input 				in_xaui2_pkt_almostfull;
output 				out_xaui2_pkt_valid_wr;
output 				out_xaui2_pkt_valid;
//path3
output 				out_xaui3_pkt_wr;
output [133:0] 	out_xaui3_pkt;
input 				in_xaui3_pkt_almostfull;
output 				out_xaui3_pkt_valid_wr;
output 				out_xaui3_pkt_valid;
//path4
output 				out_xaui4_pkt_wr;
output [133:0] 	out_xaui4_pkt;
input 				in_xaui4_pkt_almostfull;
output 				out_xaui4_pkt_valid_wr;
output 				out_xaui4_pkt_valid;
// egress
input 				in_egress_pkt_wr;
input [133:0] 		in_egress_pkt;
output 				out_egress_pkt_almostfull;
input 				in_egress_pkt_valid_wr;
input  				in_egress_pkt_valid;


reg 					out_xaui0_pkt_wr;
reg [133:0] 		out_xaui0_pkt;
reg 					out_xaui0_pkt_valid_wr;
reg 					out_xaui0_pkt_valid;

reg 					out_xaui1_pkt_wr;
reg [133:0] 		out_xaui1_pkt;
reg 					out_xaui1_pkt_valid_wr;
reg 					out_xaui1_pkt_valid;
 
 
reg 					out_xaui2_pkt_wr;
reg [133:0] 		out_xaui2_pkt;
reg 					out_xaui2_pkt_valid_wr;
reg 					out_xaui2_pkt_valid;

reg 					out_xaui3_pkt_wr;
reg [133:0] 		out_xaui3_pkt;
reg 					out_xaui3_pkt_valid_wr;
reg 					out_xaui3_pkt_valid;

reg 					out_xaui4_pkt_wr;
reg [133:0] 		out_xaui4_pkt;
reg 					out_xaui4_pkt_valid_wr;
reg 					out_xaui4_pkt_valid;

output				dmux_receive_pkt_add;
output				dmux_discard_error_pkt_add;
output				dmux_send_port0_pkt_add;
output				dmux_send_port1_pkt_add;
output				dmux_send_port2_pkt_add;
output				dmux_send_port3_pkt_add;
output				dmux_send_port4_pkt_add;

reg					dmux_receive_pkt_add;
reg					dmux_discard_error_pkt_add;
reg					dmux_send_port0_pkt_add;
reg					dmux_send_port1_pkt_add;
reg					dmux_send_port2_pkt_add;
reg					dmux_send_port3_pkt_add;
reg					dmux_send_port4_pkt_add;

reg [2:0] 			xaui_channel;//outport extract from metadata  000:port0   001:port1   010:port2    011:port3  100:port4      
reg [133:0] 		in_egress_pkt_q_r;//store the metadata pkt for reverse it easily
reg               flag;//turn current pat data to head flag of pkt   0:current pat data is pkt body   1:current pat data is pkt head

reg [2:0] 			current_state;//transmit processed pkt to 4 paths by the outport in the metadata of pkt
 parameter idle_s           	= 3'b000,
			  discard_s	         = 3'b001,
           transmit_s        	= 3'b010,
			  wait_s           	= 3'b011,
			  pkt_cut_s				= 3'b100;


always@(posedge clk or negedge reset)
if(!reset)
begin
out_xaui0_pkt_wr        		<=	1'b0;
out_xaui0_pkt              	<=	134'b0;
out_xaui0_pkt_valid_wr  		<=	1'b0;
out_xaui0_pkt_valid        	<=	1'b0;

out_xaui1_pkt_wr        		<=	1'b0;
out_xaui1_pkt              	<=	134'b0;
out_xaui1_pkt_valid_wr  		<=	1'b0;
out_xaui1_pkt_valid        	<=	1'b0;

out_xaui2_pkt_wr        		<=	1'b0;
out_xaui2_pkt              	<=	134'b0;
out_xaui2_pkt_valid_wr  		<=	1'b0;
out_xaui2_pkt_valid        	<=	1'b0;

out_xaui3_pkt_wr        		<=	1'b0;
out_xaui3_pkt              	<=	134'b0;
out_xaui3_pkt_valid_wr  		<=	1'b0;
out_xaui3_pkt_valid        	<=	1'b0;

out_xaui4_pkt_wr        		<=	1'b0;
out_xaui4_pkt              	<=	134'b0;
out_xaui4_pkt_valid_wr  		<=	1'b0;
out_xaui4_pkt_valid        	<=	1'b0;


in_egress_pkt_valid_rd			<=	1'b0;
in_egress_pkt_rd					<=	1'b0;
in_egress_pkt_q_r					<=	134'b0;

flag	 								<= 1'b0;
xaui_channel						<=	3'b0;

dmux_receive_pkt_add			<=	1'b0;
dmux_discard_error_pkt_add	<=	1'b0;
dmux_send_port0_pkt_add		<=	1'b0;
dmux_send_port1_pkt_add		<=	1'b0;
dmux_send_port2_pkt_add		<=	1'b0;
dmux_send_port3_pkt_add		<=	1'b0;
dmux_send_port4_pkt_add		<=	1'b0;

current_state					<=	idle_s;
end
else
begin
 case(current_state)
  idle_s:begin//judge and poll pkt from pcietx and iace fifo,and reverse order metadata
				out_xaui0_pkt_wr        		<=	1'b0;
				out_xaui0_pkt              	<=	134'b0;
				out_xaui0_pkt_valid_wr  		<=	1'b0;
				out_xaui0_pkt_valid        	<=	1'b0;

				out_xaui1_pkt_wr        		<=	1'b0;
				out_xaui1_pkt              	<=	134'b0;
				out_xaui1_pkt_valid_wr  		<=	1'b0;
				out_xaui1_pkt_valid        	<=	1'b0;

				out_xaui2_pkt_wr        		<=	1'b0;
				out_xaui2_pkt              	<=	134'b0;
				out_xaui2_pkt_valid_wr  		<=	1'b0;
				out_xaui2_pkt_valid        	<=	1'b0;

				out_xaui3_pkt_wr        		<=	1'b0;
				out_xaui3_pkt              	<=	134'b0;
				out_xaui3_pkt_valid_wr  		<=	1'b0;
				out_xaui3_pkt_valid        	<=	1'b0;
			  
				out_xaui4_pkt_wr        		<=	1'b0;
				out_xaui4_pkt              	<=	134'b0;
				out_xaui4_pkt_valid_wr  		<=	1'b0;
				out_xaui4_pkt_valid        	<=	1'b0;

				dmux_discard_error_pkt_add	<=	1'b0;
				dmux_send_port0_pkt_add		<=	1'b0;
				dmux_send_port1_pkt_add		<=	1'b0;
				dmux_send_port2_pkt_add		<=	1'b0;
				dmux_send_port3_pkt_add		<=	1'b0;
				dmux_send_port4_pkt_add		<=	1'b0;
				if(in_egress_pkt_valid_empty	==	1'b0)	begin//judge and poll pkt from pcietx and iace fifo
					if(in_egress_pkt_valid_q	==	1'b1)	begin
						in_egress_pkt_rd			<=	1'b1;
						in_egress_pkt_valid_rd	<=	1'b1;	
						in_egress_pkt_q_r			<=	in_egress_pkt_q;
						current_state				<=	wait_s;	
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
	wait_s:begin//wait for head pkt from egress and generate xaui_channel and delete this metadata by outport in meatadata 
					in_egress_pkt_valid_rd<=1'b0;
					in_egress_pkt_rd<=1'b0;
					case(in_egress_pkt_q_r[73:64])//outport in metadata
				  10'h001:begin//port0
				           if(in_xaui0_pkt_almostfull==1'b1)
							  begin
								current_state<= wait_s;
							  end
							  else
							  begin
								xaui_channel<=3'b000;//port0
								in_egress_pkt_rd<=1'b1;
								current_state<= pkt_cut_s;
							  end
				          end
				  10'h002:begin//port1
				           if(in_xaui1_pkt_almostfull==1'b1)
							  begin								
								current_state<= wait_s;
							  end
							  else
							  begin
								xaui_channel<=3'b001;//port1
								in_egress_pkt_rd<=1'b1;
								current_state<= pkt_cut_s;
							  end
				          end
				  10'h004:begin//port2
				           if(in_xaui2_pkt_almostfull==1'b1)
							  begin
								current_state<= wait_s;
							  end
							  else
							  begin
								xaui_channel<=3'b010;//port2
								in_egress_pkt_rd<=1'b1;
								current_state<= pkt_cut_s;
							  end
				          end
				  10'h008:begin//port3
				           if(in_xaui3_pkt_almostfull==1'b1)
							  begin
								current_state<= wait_s;
							  end
							  else
							  begin
								xaui_channel<=3'b011;//port3
								in_egress_pkt_rd<=1'b1;
								current_state<= pkt_cut_s;
							  end
				          end
					10'h010:begin//port4
				           if(in_xaui4_pkt_almostfull==1'b1)
							  begin
								current_state<= wait_s;
							  end
							  else
							  begin
								xaui_channel<=3'b100;//port4
								in_egress_pkt_rd<=1'b1;
								current_state<= pkt_cut_s;
							  end
				          end					
				  default:begin//port0
					         if(in_xaui0_pkt_almostfull==1'b1)
							  begin
								current_state<= wait_s;
							  end
							  else
							  begin
								xaui_channel<=3'b000;//port0
								in_egress_pkt_rd<=1'b1;
								current_state<= pkt_cut_s;
							  end
					        end
				 endcase
	        end			  				  
  pkt_cut_s:begin//delete the second metadata from egress
				out_xaui0_pkt_wr			<=	1'b0;
				out_xaui1_pkt_wr			<=	1'b0;
				out_xaui2_pkt_wr			<=	1'b0;
				out_xaui3_pkt_wr			<=	1'b0;	
				out_xaui4_pkt_wr			<=	1'b0;	
				flag           			<= 1'b1;
				dmux_receive_pkt_add	<=	1'b1;
				current_state				<= transmit_s;
				end
  discard_s:begin//discard the error pkt from egress
					in_egress_pkt_valid_rd	<=	1'b0;
              if(in_egress_pkt_q[133:132]==2'b10)
				   begin
						dmux_discard_error_pkt_add	<=	1'b1;
						in_egress_pkt_rd 					<=	1'b0;
						current_state						<= idle_s;
					end
					else
					 begin
				     current_state<= discard_s;
					 end
             end				   
  transmit_s:begin//transmit pkt body from egress
					flag           			<= 1'b0;
					dmux_receive_pkt_add	<=	1'b0;
               case(xaui_channel[2:0])//outport(path)
					 3'b000:begin
					         out_xaui0_pkt_wr        <=1'b1;
								if(flag == 1'b0) begin//turn to body of pkt
									out_xaui0_pkt              <=in_egress_pkt_q;
								end
								else begin//turn to head of pkt
									out_xaui0_pkt              <={2'b01,in_egress_pkt_q[131:0]};
								end
					        if(in_egress_pkt_q[133:132]==2'b10)//pkt tail
							  begin
							   in_egress_pkt_rd <=1'b0;							   
                        out_xaui0_pkt_valid_wr  	<=	1'b1;
								dmux_send_port0_pkt_add	<=	1'b1;
                        out_xaui0_pkt_valid        <=	1'b1;
								current_state<= idle_s;
							  end
							  else
							  begin
							   in_egress_pkt_rd <=1'b1;
								current_state<= transmit_s;
							  end
					       end
					 3'b001:begin
					         out_xaui1_pkt_wr        <=1'b1;
                        if(flag == 1'b0) begin
                        out_xaui1_pkt              <=in_egress_pkt_q;
								end
								else begin
									out_xaui1_pkt              <={2'b01,in_egress_pkt_q[131:0]};
								end
					        if(in_egress_pkt_q[133:132]==2'b10)
							  begin
							   in_egress_pkt_rd 				<=	1'b0;							   
                        out_xaui1_pkt_valid_wr  	<=	1'b1;
								dmux_send_port1_pkt_add	<=	1'b1;
                        out_xaui1_pkt_valid        <=	1'b1;
								current_state					<= idle_s;
							  end
							  else
							  begin
							   in_egress_pkt_rd <=1'b1;
								current_state<= transmit_s;
							  end
					       end
					 3'b010:begin
					         out_xaui2_pkt_wr        <=1'b1;
                        if(flag == 1'b0) begin
                        out_xaui2_pkt              <=in_egress_pkt_q;
								end
								else begin
									out_xaui2_pkt              <={2'b01,in_egress_pkt_q[131:0]};
								end
					        if(in_egress_pkt_q[133:132]==2'b10)
							  begin
							   in_egress_pkt_rd 				<=	1'b0;							   
                        out_xaui2_pkt_valid_wr  	<=	1'b1;
								dmux_send_port2_pkt_add	<=	1'b1;
                        out_xaui2_pkt_valid        <=	1'b1;
								current_state<= idle_s;
							  end
							  else
							  begin
							   in_egress_pkt_rd <=1'b1;
								current_state<= transmit_s;
							  end
					       end
					 3'b011:begin
					         out_xaui3_pkt_wr        <=1'b1;
                        if(flag == 1'b0) begin
                        out_xaui3_pkt              <=in_egress_pkt_q;
								end
								else begin
									out_xaui3_pkt              <={2'b01,in_egress_pkt_q[131:0]};
								end
					        if(in_egress_pkt_q[133:132]==2'b10)
							  begin
							   in_egress_pkt_rd 				<=	1'b0;							   
                        out_xaui3_pkt_valid_wr  	<=	1'b1;
								dmux_send_port3_pkt_add	<=	1'b1;
                        out_xaui3_pkt_valid        <=	1'b1;
								current_state<= idle_s;
							  end
							  else
							  begin
							   in_egress_pkt_rd <=1'b1;
								current_state<= transmit_s;
							  end
					       end
						3'b100:begin
					         out_xaui4_pkt_wr        <=1'b1;
                        if(flag == 1'b0) begin
                        out_xaui4_pkt              <=in_egress_pkt_q;
								end
								else begin
									out_xaui4_pkt              <={2'b01,in_egress_pkt_q[131:0]};
								end
					        if(in_egress_pkt_q[133:132]==2'b10)
							  begin
							   in_egress_pkt_rd 				<=	1'b0;							   
                        out_xaui4_pkt_valid_wr  	<=	1'b1;
								dmux_send_port4_pkt_add	<=	1'b1;
                        out_xaui4_pkt_valid        <=	1'b1;
								current_state					<= idle_s;
							  end
							  else
							  begin
							   in_egress_pkt_rd <=1'b1;
								current_state<= transmit_s;
							  end
					       end							
					endcase
              end
 endcase
end

wire out_egress_pkt_almostfull;
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