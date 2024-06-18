// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/*
main function:
1)get and store pkt from PCIE TX module
2)offset left the body of pkt by the offset bytes in the metadata

tips: all fifo are showahead mode
*/
`timescale 1 ps / 1 ps
module EGRESS_OFFSET(
input clk,
input reset,

input in_tdma_pkt_wr,
input [133:0] in_tdma_pkt,
input in_tdma_valid_wr,
input in_tdma_valid,
output out_tdma_pkt_almostfull,

output reg out_outputctrl_pkt_wr,
output reg [133:0] out_outputctrl_pkt,
output reg out_outputctrl_valid_wr,
output reg out_outputctrl_valid,
input in_outputctrl_pkt_almostfull
);


reg [2:0] prepad_discard_count;//the cycle of pkt can be discard that all of 16 bytes should be offset 
reg [3:0] switch_offset_count;//the sum of bytes that the body of pkt should be offset(must <16)
reg [127:0] shift_reg;//store the data that leave by front cycle offset
reg [3:0] tail_valid;//valid bytes of last cycle 
reg [1:0] tail_mode;//the process mode of tail of pkt  0:last cycle of pkt will be remain    1:last cycle of pkt will be delete  2: send straight

wire 	in_tdma_valid_q;
wire 	in_tdma_valid_empty;
reg	out_tdma_valid_rd;		

wire [7:0] out_tdma_pkt_usedw;
wire out_tdma_pkt_empty;
assign out_tdma_pkt_almostfull = out_tdma_pkt_usedw[7];//lxj0107
reg 	out_tdma_pkt_rd;
wire [133:0]in_tdma_pkt_q;

reg [3:0] current_state;

parameter  idle_s	=	4'd0,
			metadata0_s	=	4'd1,
			metadata1_s	=	4'd2,
			discard_prepad_s	=	4'd3,
			send_s	=	4'd4,
			shift_s	= 4'd5,
			tail_remain_s = 4'd6;

always@(posedge clk or negedge reset) begin		//asynchronous reset
	if(!reset) begin
		out_outputctrl_pkt_wr<=1'b0;
		out_outputctrl_pkt<=134'b0;
		out_outputctrl_valid_wr<=1'b0;
		out_outputctrl_valid<=1'b0;
		
		switch_offset_count<=4'b0;
		prepad_discard_count<=3'b0;
		shift_reg<=128'b0;
		tail_valid<=4'b0;
		tail_mode<=2'd0;
		
		out_tdma_valid_rd<=1'b0;
		out_tdma_pkt_rd<=1'b0;
		current_state<=idle_s;
	end
	else begin
		case(current_state)		
			idle_s: begin//wait a complete pkt 	
				out_outputctrl_pkt_wr<=1'b0;
				out_outputctrl_valid_wr<=1'b0;		
				out_outputctrl_valid<=1'b0;				
				if((in_tdma_valid_empty==1'b0)&&(in_outputctrl_pkt_almostfull==1'b0))begin
					out_tdma_valid_rd<=1'b1;
					out_tdma_pkt_rd<=1'b1;
					prepad_discard_count<=in_tdma_pkt_q[38:36];//the cycle of pkt that all of 16 bytes should be offset 
					switch_offset_count<=in_tdma_pkt_q[35:32];//the sum of bytes that the body of pkt should be offset
					out_outputctrl_pkt[123:113]<=in_tdma_pkt_q[123:113]-in_tdma_pkt_q[38:32];//the length of pkt have offset
					current_state<=metadata0_s;			
				end
				else begin
					out_tdma_valid_rd<=1'b0;
					out_tdma_pkt_rd<=1'b0;
					current_state<=idle_s;
				end
			end
			
			metadata0_s: begin//send metadata0(length bytes have process in the idle_s state)
				out_tdma_valid_rd<=1'b0;
				out_outputctrl_pkt_wr<=1'b1;
				out_outputctrl_pkt[133:124]<=in_tdma_pkt_q[133:124];
				out_outputctrl_pkt[112:0]<=in_tdma_pkt_q[112:0];
				if(in_tdma_pkt_q[35:32]!=4'b0) begin//
					if(in_tdma_pkt_q[116:113]!=4'b0) begin
						if(in_tdma_pkt_q[35:32]<in_tdma_pkt_q[116:113]) begin//last cycle of pkt will be remain
							tail_valid<=4'd15-(in_tdma_pkt_q[116:113]-in_tdma_pkt_q[35:32])+4'd1;//valid value of last cycle of pkt
							tail_mode<=2'd0;
						end
						else begin//last cycle of pkt will be delete
							tail_valid<=in_tdma_pkt_q[35:32]-in_tdma_pkt_q[116:113];
							tail_mode<=2'd1;
						end
					end
					else begin
						tail_valid<=in_tdma_pkt_q[35:32];//valid value of last cycle of pkt
						tail_mode<=2'd0;
					end
				end
				else begin//pkt send straight
					tail_mode<=2'd2;
				end
				
				current_state<=metadata1_s;
			end
			
			metadata1_s: begin//send the metadata1
				out_outputctrl_pkt<=in_tdma_pkt_q;
				current_state<=discard_prepad_s;
			end
			
			discard_prepad_s: begin//discard one full cycle of offset bytes; and register first cycle of pkt body
				prepad_discard_count<=prepad_discard_count-3'd1;
				if(prepad_discard_count==3'b0) begin
					if(tail_mode[1]==1'd1) begin
						out_outputctrl_pkt_wr<=1'b1;
						out_outputctrl_pkt<=in_tdma_pkt_q;
						current_state<=send_s;////pkt send straight(no need offset,maybe need discard full cycle )
					end
					else begin
						out_outputctrl_pkt_wr<=1'b0;
						shift_reg<=in_tdma_pkt_q[127:0];//register first cycle of pkt body 
						current_state<=shift_s;//store 1 cycle pkt for left shift
					end
				end
				else begin
					out_outputctrl_pkt_wr<=1'b0;
					current_state<=discard_prepad_s;
				end
			end
			
			send_s: begin//pkt send straight(no need offset,maybe need discard full cycle )
				out_outputctrl_pkt_wr<=1'b1;
				out_outputctrl_pkt<=in_tdma_pkt_q;
				if(in_tdma_pkt_q[133:132]==2'b10) begin
					out_tdma_pkt_rd<=1'b0;
					out_outputctrl_valid_wr<=1'b1;
					out_outputctrl_valid<=1'b1;
					current_state<=idle_s;
				end
				else begin
					out_tdma_pkt_rd<=1'b1;
					out_outputctrl_valid_wr<=1'b0;
					out_outputctrl_valid<=1'b0;
					current_state<=send_s;
				end
			end
			
			shift_s: begin//shift body of pkt
				shift_reg<=in_tdma_pkt_q[127:0];//store the data that leave by front cycle offset
				out_outputctrl_pkt_wr<=1'b1;
				if(in_tdma_pkt_q[133:132]==2'b10) begin//pkt tail
					out_tdma_pkt_rd<=1'b0;
					if(tail_mode==1'b0) begin//last cycle of pkt will be remain
						out_outputctrl_pkt[133:128]<=6'b110000;
						out_outputctrl_valid_wr<=1'b0;
						out_outputctrl_valid<=1'b0;
						current_state<=tail_remain_s;
					end
					else begin//last cycle of pkt will be delete
						out_outputctrl_pkt[133:132]<=2'b10;
						out_outputctrl_pkt[131:128]<=tail_valid[3:0];
						out_outputctrl_valid_wr<=1'b1;
						out_outputctrl_valid<=1'b1;
						current_state<=idle_s;
					end
				end
				else begin
					out_tdma_pkt_rd<=1'b1;
					out_outputctrl_pkt[133:128]<=6'b110000;
					out_outputctrl_valid_wr<=1'b0;
					out_outputctrl_valid<=1'b0;
					current_state<=shift_s;
				end
				
				case(switch_offset_count)
					4'd1: begin
						out_outputctrl_pkt[127:1*8]<=shift_reg[127-1*8:0];//put the data leave from front cycle to the high site of current cycle pkt 
						out_outputctrl_pkt[1*8-1:0]<= in_tdma_pkt_q[127:128-1*8];
					end
					
					4'd2: begin
						out_outputctrl_pkt[127:2*8]<=shift_reg[127-2*8:0];
						out_outputctrl_pkt[2*8-1:0]<= in_tdma_pkt_q[127:128-2*8];
					end
					
					4'd3: begin
						out_outputctrl_pkt[127:3*8]<=shift_reg[127-3*8:0];
						out_outputctrl_pkt[3*8-1:0]<= in_tdma_pkt_q[127:128-3*8];
					end
					
					4'd4: begin
						out_outputctrl_pkt[127:4*8]<=shift_reg[127-4*8:0];
						out_outputctrl_pkt[4*8-1:0]<= in_tdma_pkt_q[127:128-4*8];
					end
					
					4'd5: begin
						out_outputctrl_pkt[127:5*8]<=shift_reg[127-5*8:0];
						out_outputctrl_pkt[5*8-1:0]<= in_tdma_pkt_q[127:128-5*8];
					end
					
					4'd6: begin
						out_outputctrl_pkt[127:6*8]<=shift_reg[127-6*8:0];
						out_outputctrl_pkt[6*8-1:0]<= in_tdma_pkt_q[127:128-6*8];
					end
					
					4'd7: begin
						out_outputctrl_pkt[127:7*8]<=shift_reg[127-7*8:0];
						out_outputctrl_pkt[7*8-1:0]<= in_tdma_pkt_q[127:128-7*8];
					end
					
					4'd8: begin
						out_outputctrl_pkt[127:8*8]<=shift_reg[127-8*8:0];
						out_outputctrl_pkt[8*8-1:0]<= in_tdma_pkt_q[127:128-8*8];
					end
					
					4'd9: begin
						out_outputctrl_pkt[127:9*8]<=shift_reg[127-9*8:0];
						out_outputctrl_pkt[9*8-1:0]<= in_tdma_pkt_q[127:128-9*8];
					end
					
					4'd10: begin
						out_outputctrl_pkt[127:10*8]<=shift_reg[127-10*8:0];
						out_outputctrl_pkt[10*8-1:0]<= in_tdma_pkt_q[127:128-10*8];
					end
					
					4'd11: begin
						out_outputctrl_pkt[127:11*8]<=shift_reg[127-11*8:0];
						out_outputctrl_pkt[11*8-1:0]<= in_tdma_pkt_q[127:128-11*8];
					end
					
					4'd12: begin
						out_outputctrl_pkt[127:12*8]<=shift_reg[127-12*8:0];
						out_outputctrl_pkt[12*8-1:0]<= in_tdma_pkt_q[127:128-12*8];
					end
					
					4'd13: begin
						out_outputctrl_pkt[127:13*8]<=shift_reg[127-13*8:0];
						out_outputctrl_pkt[13*8-1:0]<= in_tdma_pkt_q[127:128-13*8];
					end
					
					4'd14: begin
						out_outputctrl_pkt[127:14*8]<=shift_reg[127-14*8:0];
						out_outputctrl_pkt[14*8-1:0]<= in_tdma_pkt_q[127:128-14*8];
					end
					
					4'd15: begin
						out_outputctrl_pkt[127:15*8]<=shift_reg[127-15*8:0];
						out_outputctrl_pkt[15*8-1:0]<= in_tdma_pkt_q[127:128-15*8];
					end
					
					default: begin
						out_outputctrl_pkt[127:0]<=128'b0;
					end
				endcase
			end
			
			tail_remain_s: begin//the last cycle of pkt can't be offset over,so must modify it and send it.
				out_outputctrl_pkt_wr<=1'b1;
				out_outputctrl_valid_wr<=1'b1;
				out_outputctrl_valid<=1'b1;
				out_outputctrl_pkt[133:132]<=2'b10;
				out_outputctrl_pkt[131:128]<=tail_valid[3:0];//the sum of invalid bytes
				current_state<=idle_s;
				case(switch_offset_count)
					4'd1: begin
						out_outputctrl_pkt[127:1*8]<=shift_reg[127-1*8:0];
					end
					
					4'd2: begin
						out_outputctrl_pkt[127:2*8]<=shift_reg[127-2*8:0];
					end
					
					4'd3: begin
						out_outputctrl_pkt[127:3*8]<=shift_reg[127-3*8:0];
					end
					
					4'd4: begin
						out_outputctrl_pkt[127:4*8]<=shift_reg[127-4*8:0];
					end
					
					4'd5: begin
						out_outputctrl_pkt[127:5*8]<=shift_reg[127-5*8:0];
					end
					
					4'd6: begin
						out_outputctrl_pkt[127:6*8]<=shift_reg[127-6*8:0];
					end
					
					4'd7: begin
						out_outputctrl_pkt[127:7*8]<=shift_reg[127-7*8:0];
					end
					
					4'd8: begin
						out_outputctrl_pkt[127:8*8]<=shift_reg[127-8*8:0];
					end
					
					4'd9: begin
						out_outputctrl_pkt[127:9*8]<=shift_reg[127-9*8:0];
					end
					
					4'd10: begin
						out_outputctrl_pkt[127:10*8]<=shift_reg[127-10*8:0];
					end
					
					4'd11: begin
						out_outputctrl_pkt[127:11*8]<=shift_reg[127-11*8:0];
					end
					
					4'd12: begin
						out_outputctrl_pkt[127:12*8]<=shift_reg[127-12*8:0];
					end
					
					4'd13: begin
						out_outputctrl_pkt[127:13*8]<=shift_reg[127-13*8:0];
					end
					
					4'd14: begin
						out_outputctrl_pkt[127:14*8]<=shift_reg[127-14*8:0];
					end
					
					4'd15: begin
						out_outputctrl_pkt[127:15*8]<=shift_reg[127-15*8:0];
					end
					
					default: begin
						out_outputctrl_pkt[127:0]<=128'b0;
					end
				endcase
			end
		
			default: begin
				out_outputctrl_pkt_wr<=1'b0;
				out_outputctrl_pkt<=134'b0;
				out_outputctrl_valid_wr<=1'b0;
				out_outputctrl_valid<=1'b0;
				out_tdma_valid_rd<=1'b0;
				out_tdma_pkt_rd<=1'b0;
				current_state<=idle_s;
			end
		endcase
	end
end


//----------------From PCIE_TX Module-----------------
//----------------VALID FIFO-----------------
fifo_64_1 FIFO_VALID_pcietx  (
											.aclr(!reset),
											.data(in_tdma_valid),
											.clock(clk),
											.rdreq(out_tdma_valid_rd),
											.wrreq(in_tdma_valid_wr),
											.q(in_tdma_valid_q),
											.empty(in_tdma_valid_empty)
										);
									
//-------------- DATA FIFO-----------------	
fifo_256_134	FIFO_PKT_pcietx (
											.aclr(!reset),
											.data(in_tdma_pkt),
											.clock(clk),
											.rdreq(out_tdma_pkt_rd),
											.wrreq(in_tdma_pkt_wr),
											.q(in_tdma_pkt_q),
											.usedw(out_tdma_pkt_usedw),
											.empty(out_tdma_pkt_empty)
										);	



endmodule

