/*main function
1)parsing packet header 
2)fetch the keys from packet header include  l3_protocol ,tos,l4_protocol,source ip,derection ip,source port derection port ,tcp_flag icmp layer_type and icmp code 
3)combine keys to prepad 
*/
/******************************* the prepad format********************************************/
/*
four pats prepad format: 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+
ipv4_uc|ipv4_mc|umknown|arp|rarp|mpls_uc|ttl 0or1|option|ppp_ctrl|ipv6_mc|fragment|subsequent|isis|ipv6_link_local|drop|out_vlan|in_vlan|L3infhandle|local__port_port_index|l2_stake|pad2|l3_stake|net_diagnosis|pad|timestamp_2B
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+
timestamp_6B|L3_protocol|Tos|L4_protocol|source ip|derection ip_2B
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+
derection ip_2B|source port|derection port|tcp_flag|pad_9B
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+
pad_16B
*/

//*********************the structure of packet parsing******************************************/
/*
                      |--->TCP
		   | --->IP----     
           |          |----ICMP         
ethernet----
           |        
           | --->unknown     
*/
`timescale 1 ps / 1 ps
module CLASSIFY(
input clk,
input reset,

input in_ingress_key_wr,// the key write request of inputctrl to classfy
input [133:0] in_ingress_key,// the key of inputctrl to classfy
input in_ingress_valid_wr,//the valid flag write request of inputctrl to classfy
input in_ingress_valid,//the valid flag of inputctrl to classfy
output out_ingress_key_almostfull,//the valid fifo almostfull signal of  classfy to inputctrl

output reg out_offset_key_wr,// the key write request of classfy to inputctrl 
output reg [133:0] out_offset_key,// the key of classfy to inputctrl 
output reg out_offset_valid,// the valid flag of classfy to inputctrl 
output reg out_offset_valid_wr,//the valid flag write request of classfy to inputctrl 
input in_offset_key_almostfull//the valid fifo almostfull signal of inputctrl to classfy 
);

reg [2:0] state;
wire 	in_ingress_valid_q; //the output valid flag from the valid flag fifo 
wire 	in_ingress_valid_empty;//the empty signal of the valid flag fifo 
reg	out_ingress_valid_rd;	//the read request of the valid flag fifo	
wire [7:0] out_ingress_key_usedw;//the usedw signal of the key fifo
assign out_ingress_key_almostfull = out_ingress_key_usedw[7];
reg 	out_ingress_key_rd;//the read request of the key fifo	
wire [133:0]in_ingress_key_q;//the output key from the valid flag fifo 

reg is_unknown;
reg [7:0]tos;
reg [15:0]l3_protocol;
reg [7:0]l4_protocol;
reg [31:0]sip;
reg [31:0]dip;
reg [15:0]sport;
reg [15:0]dport;
reg [7:0]tcp_flag;
reg [7:0]layer_type;
reg [7:0]code;
reg tcp_icmp;

parameter idle=3'd0,
          l2=3'd1,
          l3=3'd2,
          l4=3'd3,
          prepad1=3'd4,
          prepad2=3'd5,
          prepad3=3'd6,
          prepad4=3'd7;
          
always @(posedge clk or negedge reset) begin
  if(!reset)begin
    out_offset_key_wr<=1'b0;
    out_offset_key<=134'b0;
    out_offset_valid<=1'b0;
    out_offset_valid_wr<=1'b0;
    out_ingress_key_rd<=1'b0;
    out_ingress_valid_rd<=1'b0;
	  is_unknown<=1'b0;
	   tos<=8'b0;
	   l3_protocol<=16'b0;
    	l4_protocol<=8'b0;
    	sip<=32'b0;
    	dip<=32'b0;
    	sport<=16'b0;
    	dport<=16'b0;
    	tcp_flag<=8'b0;
    	layer_type<=8'b0;
    	code<=8'b0;
    	tcp_icmp<=1'b0;
    state<=idle;
  end
  else begin
    case(state) 
      idle:begin// according to the in_offset_key_almostfull and in_ingress_valid_empty signals to judge whether or not the classfy module can receive packet from inputctrl
        out_offset_key_wr<=1'b0;
        out_offset_key<=134'b0;
        out_offset_valid<=1'b0;
        out_offset_valid_wr<=1'b0;
        out_ingress_key_rd<=1'b0;
        out_ingress_valid_rd<=1'b0;
		    is_unknown<=1'b0;
		    tos<=8'b0;
		    l3_protocol<=16'b0;
		    l4_protocol<=8'b0;
		    sip<=32'b0;
		    dip<=32'b0;
		    sport<=16'b0;
		    dport<=16'b0;
		    tcp_flag<=8'b0;
		    layer_type<=8'b0;
		    code<=8'b0;
		    tcp_icmp<=1'b0;
        if(in_offset_key_almostfull==1'b0 && in_ingress_valid_empty==1'b0 )begin
          out_ingress_key_rd<=1'b1;
          out_ingress_valid_rd<=1'b1;
          state<=l2;
        end
        else begin
          state<=idle;
        end
       end 
      l2: begin//according to the layer_type field of the ethrnet hearder to parsing packet
        out_ingress_key_rd<=1'b1;
        out_ingress_valid_rd<=1'b0;
		state<=l3;
		if(in_ingress_key_q[31:16]==16'h0800 &&in_ingress_key_q[11:8] ==4'd5)//judge the packet whether or not a IP packet and its header length equal the 20bytes  
		begin
			l3_protocol<=in_ingress_key_q[31:16];
			tos<=in_ingress_key_q[7:0];			
		end
		else
		begin
			is_unknown<=1'b1;
		end
      end
      l3:begin//according to the protocol field of the IP hearder to judge the packet whether or not a TCP packet or ICMP packet
		out_ingress_key_rd<=1'b1;
        out_ingress_valid_rd<=1'b0;
		if(is_unknown==1'b1)
		begin
        state<=l4;
		end
		else if(in_ingress_key_q[71:64]==8'd6|| in_ingress_key_q[71:64]==8'd1)//judge the packet whether or not a TCP packet or ICMP packet
		begin
		l4_protocol<=in_ingress_key_q[71:64];
		sip<=in_ingress_key_q[47:16];
		dip[31:16]<=in_ingress_key_q[15:0];
        end
		else 
		begin
		is_unknown<=1'b1;
		end
		state<=l4;
      end
      l4:begin
        out_ingress_key_rd<=1'b1;
        out_ingress_valid_rd<=1'b0;
		if(is_unknown==1'b1)
		begin
        state<=prepad1;
		end
		else if(l4_protocol==8'd6)
		begin
		dip[15:0]<=in_ingress_key_q[127:112];
		sport<=in_ingress_key_q[111:96];
		dport<=in_ingress_key_q[95:80];
		tcp_flag<=in_ingress_key_q[7:0];
		state<=prepad1;
		end
		else if(l4_protocol==8'd1)
		begin
		dip[15:0]<=in_ingress_key_q[127:112];
		layer_type<=in_ingress_key_q[111:104];
		code<=in_ingress_key_q[103:96];
		tcp_flag<=8'b0;
		end
		else 
		begin
		is_unknown<=1'b1;
		end
		state<=prepad1;
      end
    prepad1:begin//to structure the first pat prepad 
		
        out_ingress_key_rd<=1'b0;
        out_ingress_valid_rd<=1'b0;
        out_offset_key_wr<=1'b1;
        out_offset_key<={6'b010000,3'b001,125'b0};
        state<=prepad2;
      end 
      prepad2:begin//to structure the second pat prepad 
        out_ingress_key_rd<=1'b0;
        out_ingress_valid_rd<=1'b0;
        out_offset_key_wr<=1'b1;
        out_offset_key<={6'b110000,48'b0,l3_protocol,tos,l4_protocol,sip,dip[31:16]};
        state<=prepad3;
      end 
      prepad3:begin//to structure the third pat prepad 
        out_ingress_key_rd<=1'b0;
        out_ingress_valid_rd<=1'b0;
        out_offset_key_wr<=1'b1;
		if(tcp_icmp==1'b0)
		begin
        out_offset_key<={6'b110000,dip[15:0],sport,dport,tcp_flag,72'b0};
		end
		else
		begin
		out_offset_key<={6'b110000,dip[15:0],layer_type,code,96'b0};
		end
		state<=prepad4;
      end     
      prepad4:begin//to structure the fourth pat prepad
        out_ingress_key_rd<=1'b0;
        out_ingress_valid_rd<=1'b0;
        out_offset_key_wr<=1'b1;
        out_offset_key<={6'b100000,128'b0};
        out_offset_valid<=1'b1;
        out_offset_valid_wr<=1'b1;
        state<=idle;
      end  
    endcase     
  end
    
end          




fifo_64_1 FIFO_VALID_input  (
							.aclr(!reset),
							.data(in_ingress_valid),
							.clock(clk),
							.rdreq(out_ingress_valid_rd),
							.wrreq(in_ingress_valid_wr),
							.q(in_ingress_valid_q),
							.empty(in_ingress_valid_empty)
						);
									

fifo_256_134	FIFO_key_input (
								.aclr(!reset),
								.data(in_ingress_key),
								.clock(clk),
								.rdreq(out_ingress_key_rd),
								.wrreq(in_ingress_key_wr),
								.q(in_ingress_key_q),
								.usedw(out_ingress_key_usedw)
								);	
endmodule								