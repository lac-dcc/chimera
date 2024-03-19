
module nmac_crc_check(
   clk,
   wr_clk,
   reset,
   
   in_pkt_wrreq,
   in_pkt,
   in_pkt_usedw,
   in_valid_wrreq,
   in_valid,
   
   port_error,
   
   out_pkt_wrreq,
   out_pkt,
   out_pkt_usedw,
   out_valid_wrreq,
   out_valid
  );
   input clk;
   input wr_clk;
   input reset;
   
   input in_pkt_wrreq;
   input [138:0]in_pkt;
   output [7:0]in_pkt_usedw;
   input in_valid_wrreq;
   input in_valid;
   
   output port_error;
   
   output out_pkt_wrreq;
   output [138:0]out_pkt;
   input [7:0]out_pkt_usedw;
   output out_valid_wrreq;
   output out_valid;
   
   reg out_pkt_wrreq;
   reg [138:0]out_pkt;
   reg out_valid_wrreq;
   reg out_valid;
   reg port_error;
   reg [2:0]current_state;
   parameter idle=3'b0,
             transmit=3'b001,
             wait_crcbad=3'b010,
             discard=3'b011;
   
always@(posedge clk or negedge reset)
   if(!reset)
     begin
       crc_data_valid<=1'b0;
       crc_empty<=4'b0;
       start_of_pkt<=1'b0;
       end_of_pkt<=1'b0;
       in_pkt_rdreq<=1'b0;
       in_valid_rdreq<=1'b0;
       out_pkt_wrreq<=1'b0;
       out_valid_wrreq<=1'b0;
       port_error <= 1'b0;
       current_state<=idle;
     end
   else
     begin
       case(current_state)
         idle:
           begin
             out_valid_wrreq<=1'b0;
             port_error <= 1'b0;
             if(out_pkt_usedw<8'd161)
               begin
                 if(!in_valid_empty)
                   begin
                     if(in_valid_q==1'b1)
                       begin
                         in_pkt_rdreq<=1'b1;
                         in_valid_rdreq<=1'b1;
                         
                         current_state<=transmit;
                       end
                     else
                       begin
                         in_pkt_rdreq<=1'b1;
                         in_valid_rdreq<=1'b1;
                         
                         current_state<=discard;
                       end
                   end
                 else
                   begin
                     current_state<=idle;
                   end
               end
             else
               begin
                 current_state<=idle;
               end
           end//end idle;
         transmit:
           begin
             in_valid_rdreq<=1'b0;
             if(in_pkt_q[138:136]==3'b101)//header;
               begin
                 in_pkt_rdreq<=1'b1;
                 crc_data_valid<=1'b1;
                 crc_data<=in_pkt_q[127:0];
                 start_of_pkt<=1'b1;
                 out_pkt_wrreq<=1'b1;
                 out_pkt<=in_pkt_q;
                 
                 current_state<=transmit;
               end
             else if(in_pkt_q[138:136]==3'b110)//tail;
               begin
                 in_pkt_rdreq<=1'b0;
                 crc_data_valid<=1'b1;
                 crc_data<=in_pkt_q[127:0];
                 end_of_pkt<=1'b1;
                 crc_empty<=4'b1111-in_pkt_q[135:132];
                 out_pkt_wrreq<=1'b1;
                 out_pkt<=in_pkt_q;
                 
                 current_state<=wait_crcbad;
               end
             else//middle;
               begin
                 in_pkt_rdreq<=1'b1;
                 start_of_pkt<=1'b0;
                 crc_data_valid<=1'b1;
                 crc_data<=in_pkt_q[127:0];
                 out_pkt_wrreq<=1'b1;
                 out_pkt<=in_pkt_q;
                 
                 current_state<=transmit;
               end
           end//end transmit;
         wait_crcbad:
           begin
             end_of_pkt<=1'b0;
             crc_empty<=4'b0;
             crc_data_valid<=1'b0;
             out_pkt_wrreq<=1'b0;
             if(crc_bad_valid==1'b1)
               begin
                 if(crc_bad==1'b1)//error;
                   begin
                     out_valid_wrreq<=1'b1;
                     out_valid<=1'b0;
                     port_error <= 1'b1;
                   end
                 else
                   begin
                     out_valid_wrreq<=1'b1;
                     out_valid<=1'b1;
                   end
                 current_state<=idle;
               end
             else
               begin
                 current_state<=wait_crcbad;
               end
           end//end wait_crcbad;
         discard:
           begin
             in_valid_rdreq<=1'b0;
             in_pkt_rdreq<=1'b1;
             if(in_pkt_q[138:136]==3'b110)//tail;
               begin
                 in_pkt_rdreq<=1'b0;
                 
                 current_state<=idle;
               end
             else if(in_pkt_q[138:136]==3'b111)//tail;
               begin
                 in_pkt_rdreq<=1'b0;
                 
                 current_state<=idle;
               end
             else
               begin
                 current_state<=discard;
               end
           end//end discard;
         default:
           begin
             current_state<=idle;
           end
       endcase
     end
   
    reg [127:0]crc_data;
    reg crc_data_valid;
    reg [3:0]crc_empty;
    reg start_of_pkt;
    reg end_of_pkt;
    wire crc_bad_valid;
    wire crc_bad;
check_ip check_ip0(
	.clk(clk),
	.data(crc_data),
	.datavalid(crc_data_valid),
	.empty(crc_empty),
	.endofpacket(end_of_pkt),
	.reset_n(reset),
	.startofpacket(start_of_pkt),
	.crcbad(crc_bad),
	.crcvalid(crc_bad_valid)
   ); 
    reg in_pkt_rdreq;
    wire [138:0]in_pkt_q;
    wire [7:0]in_pkt_usedw;
asy_256_139 asy_256_1391(
	.aclr(!reset),
	.data(in_pkt),
	.rdclk(clk),
	.rdreq(in_pkt_rdreq),
	.wrclk(wr_clk),
	.wrreq(in_pkt_wrreq),
	.q(in_pkt_q),
	.wrusedw(in_pkt_usedw)
  );
    reg in_valid_rdreq;
    wire in_valid_q;
    wire in_valid_empty;
asy_64_1 asy_64_11(
	.aclr(!reset),
	.data(in_valid),
	.rdclk(clk),
	.rdreq(in_valid_rdreq),
	.wrclk(wr_clk),
	.wrreq(in_valid_wrreq),
	.q(in_valid_q),
	.rdempty(in_valid_empty)
   );  
  
endmodule
