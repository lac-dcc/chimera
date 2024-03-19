/*
main function:
1)add tail padding for pkt,make the length of pkt to 64byte align
2)insert 4 cycles head padding get from Classify module in the back of metadata
3)offset right the body of pkt 2 bytes  

tips: all fifo are showahead mode
*/
`timescale 1 ps / 1 ps
module INGRESS_OFFSET(
input clk,
input reset,

input in_class_key_wr,
input [133:0] in_class_key,
input in_class_valid_wr,
input in_class_valid,
output out_class_key_almostfull,

input in_ingress_pkt_wr,
input [133:0] in_ingress_pkt,
input in_ingress_valid_wr,
input in_ingress_valid,
output out_ingress_pkt_almostfull,

output reg out_dispather_pkt_wr,
output reg [133:0] out_dispather_pkt,
output reg out_dispather_valid_wr,
output reg out_dispather_valid,
input in_dispather_pkt_almostfull
);

wire 	in_ingress_valid_q;
wire 	in_ingress_valid_empty;
reg	out_ingress_valid_rd;		
									
wire [7:0] out_ingress_pkt_usedw;
wire out_ingress_pkt_empty;
assign out_ingress_pkt_almostfull = out_ingress_pkt_usedw[7];//lxj0107
reg 	out_ingress_pkt_rd;
wire [133:0]in_ingress_pkt_q;

wire 	in_class_valid_q;
wire 	in_class_valid_empty;
reg	out_class_valid_rd;		
									
wire [7:0] out_class_key_usedw;
wire out_class_key_empty;
assign out_class_key_almostfull = out_class_key_usedw[7];//lxj0107
reg 	out_class_key_rd;
wire [133:0]in_class_key_q;

reg [15:0] shift_reg;//register offset 2 byte from pkt
reg [6:0] align_count;//num of pkt's cycle after offset and prepad
reg [4:0] current_state;

parameter  	idle_s	=	5'd0,
			metadata1_s	=	5'd1,
			metadata2_s	=	5'd2,
			wait_s	=	5'd3,
			front_pad_s	=	5'd4,
			shift_s	=	5'd5,
			align_pad_s	=	5'd6;
always@(posedge clk or negedge reset) begin
	if(!reset) begin
		out_dispather_pkt_wr<=1'b0;
		out_dispather_pkt<=134'b0;
		out_dispather_valid_wr<=1'b0;
		out_dispather_valid<=1'b0;
		
		out_ingress_valid_rd<=1'b0;
		out_ingress_pkt_rd<=1'b0;
		out_class_valid_rd<=1'b0;
		out_class_key_rd<=1'b0;
		
		align_count<=7'b0;
		shift_reg<=16'b0;
		current_state <= idle_s;
	end
	else begin
		case(current_state)
			idle_s: begin//wait for pkt from INGRESS CTRL Moudle
				out_dispather_pkt_wr<=1'b0;
				out_dispather_valid_wr<=1'b0;
				out_dispather_valid<=1'b0;
				out_class_valid_rd<=1'b0;
				out_class_key_rd<=1'b0;
				shift_reg<=16'b0;
				align_count<=7'b0;
				if((in_ingress_valid_empty==1'b0) &&(in_dispather_pkt_almostfull==1'b0))begin//have a complete pkt receive from INGRESS_CTRL Module 
					out_ingress_pkt_rd<=1'b1;
					out_ingress_valid_rd<=1'b1;
					current_state <= metadata1_s;
				end
				else begin
					out_ingress_valid_rd<=1'b0;
					out_ingress_pkt_rd<=1'b0;
					current_state <= idle_s;
				end
			end
		
			metadata1_s: begin//process the first cycle metadata --->add length of pkt
				out_ingress_valid_rd<=1'b0;
				out_dispather_pkt_wr<=1'b1;
				out_dispather_pkt[133:124]<=in_ingress_pkt_q[133:124];
				out_dispather_pkt[123:113]<=in_ingress_pkt_q[123:113]+11'd66;//64byte prepad +2 byte offset
				out_dispather_pkt[112:0]<=in_ingress_pkt_q[112:0];
				current_state <= metadata2_s;
			end
			
			metadata2_s: begin//process the first cycle metadata and wait for prepad pkt from CLASSIFY Module
				if(out_dispather_pkt[118:113]==6'b0) begin//count sum of cycle of pkt by it's 64bytes block
					align_count[6:2]<=out_dispather_pkt[123:119]-5'd2;//-1 64byte prepad block  -1 metadata block (2 cycle metadata)
				end
				else begin
					align_count[6:2]<=out_dispather_pkt[123:119]-5'd1;//+1 last block (need to be pad) -1 64byte prepad block  -1 metadata block (2 cycle metadata)
				end
				align_count[1:0]<=2'd2;
				out_ingress_pkt_rd<=1'b0;
				out_dispather_pkt[133:0]<=in_ingress_pkt_q[133:0];
				if(in_class_valid_empty==1'b0) begin//have a complete pkt receive from CLASSIFY Module 
					out_class_key_rd<=1'b1;
					out_class_valid_rd<=1'b1;
					current_state <= front_pad_s;
				end
				else begin
					out_class_valid_rd<=1'b0;
					out_class_key_rd<=1'b0;
					current_state <= wait_s;
				end
			end
			
			wait_s: begin//wait for pkt from CLASSIFY Moudle
				out_dispather_pkt_wr<=1'b0;
				if(in_class_valid_empty==1'b0) begin
					out_class_key_rd<=1'b1;
					out_class_valid_rd<=1'b1;
					current_state <= front_pad_s;
				end
				else begin
					out_class_valid_rd<=1'b0;
					out_class_key_rd<=1'b0;
					current_state <= wait_s;
				end
			end
			
			front_pad_s: begin//get 4 cycle prepad from CLASSIFY Module
				out_dispather_pkt_wr<=1'b1;
				out_dispather_pkt[133:132]<=2'b11;
				out_dispather_pkt[131:0]<=in_class_key_q[131:0];
				out_class_valid_rd<=1'b0;			
				if(in_class_key_q[133:132]==2'b10) begin
					out_ingress_pkt_rd<=1'b1;
					out_class_key_rd<=1'b0;
					current_state <= shift_s;
				end
				else begin
					out_ingress_pkt_rd<=1'b0;
					out_class_key_rd<=1'b1;
					current_state <= front_pad_s;
				end
			end
			
			shift_s: begin//OFFSET 2 byte in pkt body
				out_dispather_pkt[127:112]<=shift_reg[15:0];
				out_dispather_pkt[111:0]<=in_ingress_pkt_q[127:16];
				shift_reg[15:0]<=in_ingress_pkt_q[15:0];
				align_count<=align_count-7'd1;
				if(in_ingress_pkt_q[133:132]==2'b10) begin	
					out_ingress_pkt_rd<=1'b0;
					if(align_count==7'd1) begin
						out_dispather_valid_wr<=1'b1;
						out_dispather_valid<=1'b1;
						out_dispather_pkt[133:128]<=6'b100000;
						current_state <= idle_s;
					end
					else begin
						out_dispather_valid_wr<=1'b0;
						out_dispather_valid<=1'b0;
						out_dispather_pkt[133:128]<=6'b110000;
						current_state <= align_pad_s;
					end
				end
				else begin
					out_ingress_pkt_rd<=1'b1;
					current_state <= shift_s;
				end
			end
			
			
			align_pad_s: begin//64 byte align pad of pkt
				out_dispather_pkt[127:112]<=shift_reg[15:0];
				if(align_count>7'd1) begin
					align_count<=align_count-7'd1;
					out_dispather_valid_wr<=1'b0;
					out_dispather_valid<=1'b0;
					out_dispather_pkt[133:128]<=6'b110000;
					current_state <= align_pad_s;
				end
				else begin
					out_dispather_valid_wr<=1'b1;
					out_dispather_valid<=1'b1;
					out_dispather_pkt[133:128]<=6'b100000;
					current_state <= idle_s;
				end
			end
			
			default: begin
				out_dispather_pkt_wr<=1'b0;
				out_dispather_pkt<=134'b0;
				out_dispather_valid_wr<=1'b0;
				out_dispather_valid<=1'b0;
				
				out_ingress_valid_rd<=1'b0;
				out_ingress_pkt_rd<=1'b0;
				out_class_valid_rd<=1'b0;
				out_class_key_rd<=1'b0;
				
				current_state <= idle_s;
			end

		endcase
	end
end

//--------------------------------From INGRESS CTRL Module-------------------------
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

//--------------------------------From CLASS Module-------------------------
fifo_64_1 FIFO_VALID_CLASS  (
											.aclr(!reset),
											.data(in_class_valid),
											.clock(clk),
											.rdreq(out_class_valid_rd),
											.wrreq(in_class_valid_wr),
											.q(in_class_valid_q),
											.empty(in_class_valid_empty)
										);

fifo_256_134	FIFO_PKT_CLASS (
											.aclr(!reset),
											.data(in_class_key),
											.clock(clk),
											.rdreq(out_class_key_rd),
											.wrreq(in_class_key_wr),
											.q(in_class_key_q),
											.usedw(out_class_key_usedw),
											.empty(out_class_key_empty)
										);											
endmodule