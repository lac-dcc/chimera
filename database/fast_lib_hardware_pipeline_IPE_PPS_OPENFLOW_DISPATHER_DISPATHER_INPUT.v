/*
main function:
1)allocate cpuid for pkt by the key
2)only achive round robin mode in this version 

tips: all fifo are showahead mode
*/
`timescale 1 ps / 1 ps
module DISPATHER_INPUT(
input clk,
input reset,
//--------------------------------CPUID Manage Module-------------------------
input [4:0] in_cpuid,//id of cpu thread which pkt would be send to
input in_cpuid_ack,
input in_cpuid_valid,
output reg out_cpuid_ctl,
output reg [4:0] out_cpuid_key, 
//--------------------------------INGRESS Module<Data Input>-------------------------
input in_ingress_pkt_wr,
input [133:0] in_ingress_pkt,
input in_ingress_valid_wr,
input in_ingress_valid,
output out_ingress_pkt_almostfull,
//--------------------------------OUTPUT Module<Data Output Path 1>-------------------------
output reg out_output_pkt_wr,
output reg [133:0] out_output_pkt,
output reg out_output_valid_wr,
output reg out_output_valid,
input in_output_pkt_almostfull,
//--------------------------------PPC_SUBSYS Module<Data Output Path 2>-------------------------
output reg out_ppc_pkt_wr,
output reg [133:0] out_ppc_pkt,
output reg out_ppc_valid_wr,
output reg out_ppc_valid,
input in_ppc_pkt_almostfull
);

wire 	in_ingress_valid_q;
wire 	in_ingress_valid_empty;
reg	out_ingress_valid_rd;				
									
wire [7:0] out_ingress_pkt_usedw;
wire out_ingress_pkt_empty;
assign out_ingress_pkt_almostfull = out_ingress_pkt_usedw[7];//lxj0107
reg 	out_ingress_pkt_rd;
wire [133:0]in_ingress_pkt_q;

reg [2:0] current_state;

parameter	idle_s	=	3'd0,
			wait_s	=	3'd1,
			send_output_s	=	3'd2,
			send_ppc_s	=	3'd3,
			discard_s	=	3'd4;

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		out_cpuid_ctl<=1'b0;
		out_cpuid_key<=5'b0;
		
		out_output_pkt_wr<=1'b0;
		out_output_pkt<=134'b0;
		out_output_valid_wr<=1'b0;
		out_output_valid<=1'b0;
		
		out_ppc_pkt_wr<=1'b0;
		out_ppc_pkt<=134'b0;
		out_ppc_valid_wr<=1'b0;
		out_ppc_valid<=1'b0;
		
		out_ingress_valid_rd<=1'b0;
		out_ingress_pkt_rd<=1'b0;
		
		current_state <= idle_s;
	end
	else begin
		case(current_state)
			idle_s: begin
				out_output_pkt_wr<=1'b0;
				out_output_valid_wr<=1'b0;
				out_output_valid<=1'b0;
				out_ppc_pkt_wr<=1'b0;
				out_ppc_valid_wr<=1'b0;
				out_ppc_valid<=1'b0;
				out_ingress_pkt_rd<=1'b0;
				out_ingress_valid_rd<=1'b0;
				if((out_ingress_pkt_empty == 1'b0)&&(in_ingress_pkt_q[133:132]==2'b01)) begin
						out_cpuid_ctl<=1'b1;
						if(in_ingress_pkt_q[111:110]==2'b0)//slot_id
							out_cpuid_key<=in_ingress_pkt_q[62:58];//inport
						else
							out_cpuid_key<=in_ingress_pkt_q[62:58]+5'd5;
						current_state <= wait_s;
				end
				else begin
					out_cpuid_ctl<=1'b0;
					current_state <= idle_s;
				end
			end
			
			wait_s: begin
				out_cpuid_ctl<=1'b1;
				if((in_cpuid_ack==1'b1) &&(in_ingress_valid_empty==1'b0)) begin
					if((in_ingress_valid_q == 1'b1)&&(in_cpuid_valid==1'b1)) begin//pkt is valid && the sum of pkt which mount in it's cpuid have too more ,so discard this pkt
						if((in_ingress_pkt_q[124]==1'b0)&&(in_output_pkt_almostfull==1'b0))begin//send to OUTPUT Module && OUTPUT Moudle can receive this pkt
							out_ingress_pkt_rd<=1'b1;
							out_ingress_valid_rd<=1'b1;
							current_state <= send_output_s;
						end
						else if((in_ingress_pkt_q[124]==1'b1)&&(in_ppc_pkt_almostfull==1'b0)) begin //send to PPC Module && PPC Moudle can receive this pkt
							out_ingress_pkt_rd<=1'b1;
							out_ingress_valid_rd<=1'b1;
							current_state <= send_ppc_s;
						end
						else begin
							out_ingress_pkt_rd<=1'b0;
							out_ingress_valid_rd<=1'b0;
							current_state <= wait_s;
						end
					end
					else begin
						out_ingress_pkt_rd<=1'b1;
						out_ingress_valid_rd<=1'b1;
						current_state <= discard_s;
					end	
				end
				else begin
					
					out_ingress_pkt_rd<=1'b0;
					out_ingress_valid_rd<=1'b0;
					current_state <= wait_s;
				end
			end
			
			send_output_s: begin
				out_cpuid_ctl<=1'b0;
				out_ingress_valid_rd<=1'b0;
				out_output_pkt_wr<=1'b1;
				out_output_pkt<=in_ingress_pkt_q;
				if(in_ingress_pkt_q[133:132]==2'b01) begin
					out_output_valid_wr<=1'b0;
					out_output_valid<=1'b0;
					out_output_pkt[55:47]<={4'b0,in_cpuid};
					out_ingress_pkt_rd<=1'b1;
					current_state <= send_output_s;
				end
				else if(in_ingress_pkt_q[133:132]==2'b10) begin
					out_output_valid_wr<=1'b1;
					out_output_valid<=1'b1;
					out_ingress_pkt_rd<=1'b0;
					current_state <= idle_s;
				end
				else begin
					out_output_valid_wr<=1'b0;
					out_output_valid<=1'b0;
					out_ingress_pkt_rd<=1'b1;
					current_state <= send_output_s;
				end
			end
			
			send_ppc_s: begin
				out_cpuid_ctl<=1'b0;
				out_ingress_valid_rd<=1'b0;
				out_output_pkt_wr<=1'b1;
				out_ppc_pkt<=in_ingress_pkt_q;
				if(in_ingress_pkt_q[133:132]==2'b01) begin
					out_ppc_valid_wr<=1'b0;
					out_ppc_valid<=1'b0;
					out_ppc_pkt[55:47]<={4'b0,in_cpuid};
					out_ingress_pkt_rd<=1'b1;
					current_state <= send_ppc_s;
				end
				else if(in_ingress_pkt_q[133:132]==2'b10) begin
					out_ppc_valid_wr<=1'b1;
					out_ppc_valid<=1'b1;
					out_ingress_pkt_rd<=1'b0;
					current_state <= idle_s;
				end
				else begin
					out_ppc_valid_wr<=1'b0;
					out_ppc_valid<=1'b0;
					out_ingress_pkt_rd<=1'b1;
					current_state <= send_ppc_s;
				end
			end
			
			discard_s: begin
				out_ingress_valid_rd<=1'b0;
				if(in_ingress_pkt_q[133:132]==2'b10) begin
					out_ingress_pkt_rd<=1'b0;
					current_state <= idle_s;
				end
				else begin
					out_ingress_pkt_rd<=1'b1;
					current_state <= discard_s;
				end
			end
			
			default: begin
				out_output_pkt_wr<=1'b0;
				out_output_valid_wr<=1'b0;
				out_output_valid<=1'b0;
				out_ppc_pkt_wr<=1'b0;
				out_ppc_valid_wr<=1'b0;
				out_ppc_valid<=1'b0;
				out_ingress_pkt_rd<=1'b0;
				out_ingress_valid_rd<=1'b0;
				out_cpuid_ctl<=1'b0;
				current_state <= idle_s;
			end
		
		endcase
	end
end






//--------------------------------From INGRESS Module-------------------------

fifo_64_1 FIFO_VALID_INGRESS  (
											.aclr(!reset),
											.data(in_ingress_valid),
											.clock(clk),
											.rdreq(out_ingress_valid_rd),
											.wrreq(in_ingress_valid_wr),
											.q(in_ingress_valid_q),
											.empty(in_ingress_valid_empty)
										);
		

fifo_256_134	FIFO_PKT_INGRESS (
											.aclr(!reset),
											.data(in_ingress_pkt),
											.clock(clk),
											.rdreq(out_ingress_pkt_rd),
											.wrreq(in_ingress_pkt_wr),
											.q(in_ingress_pkt_q),
											.usedw(out_ingress_pkt_usedw),
											.empty(out_ingress_pkt_empty)
										);	

endmodule