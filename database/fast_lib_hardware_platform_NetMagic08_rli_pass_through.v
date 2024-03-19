
module pass_through(
   clk,
   reset,
   
   in_pkt_wrreq,
   in_pkt,
   in_pkt_usedw,
   in_valid_wrreq,
   in_valid,
   
   out_pkt_wrreq,
   out_pkt,
   out_pkt_usedw,
   out_valid_wrreq,
   out_valid
  );
   input clk;
   input reset;
   
   input in_pkt_wrreq;
   input [138:0]in_pkt;
   output [7:0]in_pkt_usedw;
   input in_valid_wrreq;
   input in_valid;
   
   output out_pkt_wrreq;
   output [138:0]out_pkt;
   input [7:0]out_pkt_usedw;
   output out_valid_wrreq;
   output  out_valid;
   
   reg out_pkt_wrreq;
   reg [138:0]out_pkt;
   reg out_valid_wrreq;
   reg  out_valid;
   
   reg [1:0]current_state;
   parameter idle=2'b0,
             transmit=2'b01,
             discard=2'b10;
   
always@(posedge clk or negedge reset)
   if(!reset)
     begin
       in_pkt_rdreq<=1'b0;
       in_valid_rdreq<=1'b0;
       out_pkt_wrreq<=1'b0;
       out_valid_wrreq<=1'b0;
       
       current_state<=idle;
     end
   else
     begin
       case(current_state)
         idle:
           begin
             out_pkt_wrreq<=1'b0;
             out_valid_wrreq<=1'b0;
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
             in_pkt_rdreq<=1'b1;
             in_valid_rdreq<=1'b0;
             if(in_pkt_q[138:136]==3'b110)//tail;
               begin
                 in_pkt_rdreq<=1'b0;
                 out_pkt_wrreq<=1'b1;
                 out_pkt<=in_pkt_q;
                 out_valid_wrreq<=1'b1;
                 out_valid<=1'b1;
                 
                 current_state<=idle;
               end
             else
               begin
                 out_pkt_wrreq<=1'b1;
                 out_pkt<=in_pkt_q;
                 
                 current_state<=transmit;
               end
           end//end transmit;
         discard:
           begin
             in_pkt_rdreq<=1'b1;
             in_valid_rdreq<=1'b0;
             if(in_pkt_q[138:136]==3'b110)//tail;
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
             
           end//end defult;
       endcase
     end
   
    reg in_pkt_rdreq;
    wire [138:0]in_pkt_q;
    wire [7:0]in_pkt_usedw;
fifo_256_139 fifo_256_1393(
	.aclr(!reset),
	.clock(clk),
	.data(in_pkt),
	.rdreq(in_pkt_rdreq),
	.wrreq(in_pkt_wrreq),
	.q(in_pkt_q),
	.usedw(in_pkt_usedw)
   );     
    reg in_valid_rdreq;
    wire in_valid_q;
    wire in_valid_empty;
fifo_64_1 fifo_64_13(
	.aclr(!reset),
	.clock(clk),
	.data(in_valid),
	.rdreq(in_valid_rdreq),
	.wrreq(in_valid_wrreq),
	.empty(in_valid_empty),
	.q(in_valid_q)
   );
  
endmodule
