
module info_gather(
   clk,
   reset,
   
   in4_pkt_wrreq,
   in4_pkt,
   in4_pkt_usedw,
   in4_valid_wrreq,
   in4_valid,
   
   out1_pkt_wrreq,
   out1_pkt,
   out1_pkt_usedw,
   out1_valid_wrreq,
   out1_valid,
   
   info_pkt_wrreq,
   info_pkt,
   info_pkt_usedw,
   info_valid_wrreq,
   info_valid,
   
   timer
  );
   input clk;
   input reset;
   
   input in4_pkt_wrreq;
   input [138:0]in4_pkt;
   output [7:0]in4_pkt_usedw;
   input in4_valid_wrreq;
   input in4_valid;
   
   output out1_pkt_wrreq;
   output [138:0]out1_pkt;
   input [7:0]out1_pkt_usedw;
   output out1_valid_wrreq;
   output out1_valid;
   
   output info_pkt_wrreq;
   output [138:0]info_pkt;
   input [7:0]info_pkt_usedw;
   output info_valid_wrreq;
   output info_valid;
   
   input [31:0]timer;
   
   reg out1_pkt_wrreq;
   reg [138:0]out1_pkt;
   reg out1_valid_wrreq;
   reg out1_valid;
   
   reg info_pkt_wrreq;
   reg [138:0]info_pkt;
   reg info_valid_wrreq;
   reg info_valid;
   
   reg flag;//the FSM is starting;1:reset,first pre-ref-pkt should be wrote;
   reg flag_exper;//the info pkt have exper pkt;>64B;0:no;1:yes;
   reg [138:0]expre_dada_reg;//
   reg [138:0]nonip_data_reg;//
   reg [138:0]pre_ref_pkt_reg;//the refpkt is the next pre refpkt;
   reg [7:0] counter_ref;
   reg [4:0]current_state;
   parameter idle=5'b0,
             exper_collect=5'b0001,
             exper_collect1=5'b0010,
             transmit=5'b0011,
             ref_collect=5'b0100,
             ref_collect1=5'b0101,
             add_pre_ref=5'b0110,
             pass_throgh=5'b0111,
             discard=5'b1000,
             expre_over_4B=5'b1001,
             nonip_over_4B=5'b1010,
             add_exper_mac=5'b1011,
             add_ref_mac=5'b1100,
             add_pre_mac2=5'b1101,
             exper_collect2=5'b1110,
             pass_add_exper_mac1=5'b01111,
             pass_add_exper_mac2=5'b10000,
             pass_add_exper_mac3=5'b10001;
             
always@(posedge clk or negedge reset)
   if(!reset)
     begin
       in4_pkt_rdreq<=1'b0;
       in4_valid_rdreq<=1'b0;
       out1_pkt_wrreq<=1'b0;
       out1_valid_wrreq<=1'b0;
       info_pkt_wrreq<=1'b0;
       info_valid_wrreq<=1'b0;
       flag<=1'b1;
       flag_exper<=1'b0;
       expre_dada_reg<=139'b0;
       nonip_data_reg<=139'b0;
       counter_ref <= 8'b0;
       current_state<=idle;
     end
   else
     begin
       case(current_state)
         idle:
           begin
             info_pkt_wrreq<=1'b0;
             info_pkt<=139'b0;
             info_valid_wrreq<=1'b0;
             out1_pkt_wrreq<=1'b0;//to port2 output fifo;
             out1_valid_wrreq<=1'b0;
             in4_pkt_rdreq<=1'b0;
             if(!in4_valid_empty)//not empty;
               begin
                 if(in4_valid_q==1'b1)//valid pkt;
                   begin
                     if((in4_pkt_q[31:16]==16'h0800)&&(in4_pkt_q[15:0]==16'd01)&&(counter_ref < 8'd80))//experiment flow;
                       begin
                         if(info_pkt_usedw<8'd161)//info fifo can save a max pkt;
                           begin
                             if(flag==1'b1)
                               begin
                                 info_pkt_wrreq<=1'b1;              
                                 counter_ref <= counter_ref +1'b1; 
                                 info_pkt[138:136]<=3'b101;//MAC header;
                                 info_pkt[135:132]<=4'b1111;//valid byte;
                                 info_pkt[131:128]<=4'b0;
                                 info_pkt[127:80]<=48'h998877665544;//DMAC;
                                 info_pkt[79:32]<=48'h445566778899;//SMAC;
                                 current_state<=add_exper_mac;
                               end
                             else
                              current_state<=add_exper_mac;
                           end
                          
                         else
                           begin
                             current_state<=idle;
                           end
                       end
                    else if((in4_pkt_q[31:16]==16'h0800)&&(in4_pkt_q[15:0]==16'd01)&&(counter_ref >= 8'd80))//experiment flow to pass;
                       begin
                         if(info_pkt_usedw<8'd161)//info fifo can save a max pkt;
                           begin 
                           in4_pkt_rdreq<=1'b1;
                           in4_valid_rdreq<=1'b1;                          
                           current_state<=pass_add_exper_mac1;
                           end
                         else
                           begin
                             current_state<=idle;
                           end
                       end
                     else if((in4_pkt_q[31:16]==16'h0800)&&(in4_pkt_q[15:0]==16'd02))//ref pkt flow;
                       begin
                         if(info_pkt_usedw<8'd161)//info fifo can save a max pkt;
                           begin
                             if(flag==1'b1)
                               begin
                                 info_pkt_wrreq<=1'b1;
                                 counter_ref <= counter_ref +1'b1; 
                                 info_pkt[138:136]<=3'b101;//MAC header;
                                 info_pkt[135:132]<=4'b1111;//valid byte;
                                 info_pkt[131:128]<=4'b0;
                                 info_pkt[127:80]<=48'h998877665544;//DMAC;
                                 info_pkt[79:32]<=48'h445566778899;//SMAC;
                                 current_state<=add_ref_mac;
                               end
                             else
                               begin
                                 current_state<=add_ref_mac;
                               end
                           end
                         else
                           begin
                             current_state<=idle;
                           end
                       end
                     else//pass through;
                       begin
                         in4_pkt_rdreq<=1'b1;
                         in4_valid_rdreq<=1'b1;
                         
                         current_state<=pass_throgh;
                       end
                   end
                 else//error pkt;
                   begin
                     in4_pkt_rdreq<=1'b1;
                     in4_valid_rdreq<=1'b1;
                     
                     current_state<=discard;
                   end
               end
             else//empty;
               begin
                 current_state<=idle;
               end
           end//end idle;
         add_exper_mac:
           begin
             in4_pkt_rdreq<=1'b1;
             in4_valid_rdreq<=1'b1;
             flag_exper<=1'b1;
             if(flag==1'b1)//add pre ref pkt after the reset;
               begin
                 info_pkt_wrreq<=1'b1;
                 info_pkt[138:136]<=3'b100;//middle;
                 info_pkt[135:132]<=4'b1111;//valid byte;
                 info_pkt[131:128]<=4'b0;
                 info_pkt[95:64]<=32'hffffffff;//the received TS;
                 flag<=1'b0;
                 counter_ref <= counter_ref +1'b1;               
                 current_state<=exper_collect;
              end
            else
              begin
                current_state<=exper_collect;
              end
           end//end add_exper_mac;
         add_ref_mac:
           begin
             in4_pkt_rdreq<=1'b1;
             in4_valid_rdreq<=1'b1;
             if(flag==1'b1)
               begin
                 info_pkt_wrreq<=1'b1;
                 info_pkt[138:136]<=3'b100;//middle;
                 info_pkt[135:132]<=4'b1111;//valid byte;
                 info_pkt[131:128]<=4'b0;
                 info_pkt[95:64]<=32'hffffffff;//the received TS;
                 flag<=1'b0;
                 counter_ref <= counter_ref +1'b1;      
                 current_state<=ref_collect;
               end
             else
               begin
                 current_state<=ref_collect;
               end
           end//end add_exper_mac;
         exper_collect:
           begin
             in4_pkt_rdreq<=1'b1;
             in4_valid_rdreq<=1'b0;
             info_pkt_wrreq<=1'b0;
             info_pkt[138:136]<=3'b100;//middle;
             info_pkt[135:132]<=4'b1111;//valid byte;
             info_pkt[131:128]<=4'b0;
             info_pkt[127:112]<=in4_pkt_q[15:0];//the received exper pkt,01;firt 101;
             info_pkt[95:64]<=timer;
             
             out1_pkt_wrreq<=1'b0;//to port2 output fifo;
             expre_dada_reg<=in4_pkt_q;
             expre_dada_reg[15:0]<=16'h4500;//revert;
             
             current_state<=exper_collect1;
           end//end exper_collect;
         exper_collect1:
           begin
             in4_pkt_rdreq<=1'b1;
             
             info_pkt_wrreq<=1'b0;
             info_pkt[111:96]<=in4_pkt_q[15:0];//pkt ID;
             if(in4_pkt_q[47:16]<info_pkt[95:64])//timer is normal;
               info_pkt[63:32]<=info_pkt[95:64]-in4_pkt_q[47:16];//delay;
             else//over flow;
               info_pkt[63:32]<=32'hffffffff-in4_pkt_q[47:16]+info_pkt[95:64];//delay;
             info_pkt[31:16]<=in4_pkt_q[127:112];//length;
             
             out1_pkt_wrreq<=1'b1;//to port2 output fifo;
             out1_pkt<=expre_dada_reg;
             expre_dada_reg<=in4_pkt_q;
             expre_dada_reg[15:0]<=16'h0102;//DIP,high 2 byte;
             expre_dada_reg[47:16]<=32'h01020304;//SIP;
             
             current_state<=exper_collect2;
           end//end exper_collect1;
         exper_collect2://udp d_port;
           begin
             in4_pkt_rdreq<=1'b1;
             info_pkt_wrreq<=1'b1;
             info_pkt[15:0]<=in4_pkt_q[95:80];//udp dport;  
             out1_pkt_wrreq<=1'b1;
             out1_pkt<=expre_dada_reg;
             expre_dada_reg<=in4_pkt_q;
             counter_ref <= counter_ref +1'b1;
             
             current_state<=transmit;
           end//end exper_collect2;
         transmit:
		   begin
              info_pkt_wrreq<=1'b0;
              in4_pkt_rdreq<=1'b1;
              if(in4_pkt_q[138:136]==3'b110)//tail;
                begin
                  in4_pkt_rdreq<=1'b0;
                  if(in4_pkt_q[135:132]>4'b0011)//>4B;
                   begin
                     out1_pkt_wrreq<=1'b1;
                     out1_pkt<=expre_dada_reg;
                     expre_dada_reg<=in4_pkt_q;
                     
                     current_state<=expre_over_4B;
                   end
                 else if(in4_pkt_q[135:132]==4'b0011)//==4B;
                   begin
                     out1_pkt_wrreq<=1'b1;
                     out1_pkt<=expre_dada_reg;
                     out1_pkt[138:136]<=3'b110;//tail;
                     out1_pkt[135:132]<=4'b1111;
                     out1_valid_wrreq<=1'b1;
                     out1_valid<=1'b1;
                     
                     current_state<=idle;
                   end
                 else
                   begin
                     out1_pkt_wrreq<=1'b1;
                     out1_pkt<=expre_dada_reg;
                     out1_pkt[138:136]<=3'b110;
                     out1_pkt[135:132]<=4'b1111-(4'b0011-in4_pkt_q[135:132]);
                     out1_valid_wrreq<=1'b1;
                     out1_valid<=1'b1;
                     
                     current_state<=idle;
                   end
                end
              else
                begin
                  out1_pkt_wrreq<=1'b1;//to port2 output fifo;
                  out1_pkt<=expre_dada_reg;
                  expre_dada_reg<=in4_pkt_q;
                  
                  current_state<=transmit;
                end
           end//end transmit;
         ref_collect:
           begin
             info_pkt_wrreq<=1'b0;
             in4_pkt_rdreq<=1'b1;
             info_pkt[138:136]<=3'b110;//tail;
             info_pkt[135:132]<=4'b1111;//valid byte;
             info_pkt[131:128]<=4'b0;
             info_pkt[127:112]<=in4_pkt_q[15:0];//02:ref pkt;
             info_pkt[95:64]<=timer;//receive TS;
             
             current_state<=ref_collect1;
           end//end ref_collect;
         ref_collect1:
           begin
             info_pkt_wrreq<=1'b1;
             counter_ref <= 8'b0; 
             in4_pkt_rdreq<=1'b1;
             info_pkt[111:96]<=in4_pkt_q[111:96];//pkt ID;
             if(in4_pkt_q[47:16]<info_pkt[95:64])//timer is normal;
               info_pkt[63:32]<=info_pkt[95:64]-in4_pkt_q[47:16];//delay;
             else//over flow;
               info_pkt[63:32]<=32'hffffffff-in4_pkt_q[47:16]+info_pkt[95:64];//delay;
             info_pkt[31:16]<=16'd64;
             if(flag_exper==1'b1)//judge the abstract pkt if or not only contain pre-ref and last-ref;
               begin
                 info_valid_wrreq<=1'b1;
                 info_valid<=1'b1;
               end
             else
               begin
                 info_valid_wrreq<=1'b1;
                 info_valid<=1'b0;
               end
             current_state<=add_pre_mac2;
           end//end ref_collect1;
         add_pre_mac2://add MAC;
           begin
             info_valid_wrreq<=1'b0;
             info_pkt_wrreq<=1'b1;
             
             counter_ref <= counter_ref +1'b1;   
             in4_pkt_rdreq<=1'b1;
             info_pkt[138:136]<=3'b101;//MAC header;
             info_pkt[135:132]<=4'b1111;//valid byte;
             info_pkt[131:128]<=4'b0;
             info_pkt[127:80]<=48'h998877665544;//DMAC;
             info_pkt[79:32]<=48'h445566778899;//SMAC;
             pre_ref_pkt_reg<=info_pkt;
             current_state<=add_pre_ref;
           end//end add_pre_mac2;
         add_pre_ref:
           begin
             info_pkt_wrreq<=1'b1;
             
             counter_ref <= counter_ref +1'b1; 
             in4_pkt_rdreq<=1'b0;
             info_valid_wrreq<=1'b0;
             info_pkt<=pre_ref_pkt_reg;
             info_pkt[138:136]<=3'b100;
             flag_exper<=1'b0;
             
             current_state<=idle;
           end//end add_pre_ref;
         pass_throgh:
           begin
             in4_pkt_rdreq<=1'b1;
             in4_valid_rdreq<=1'b0;
             if(in4_pkt_q[138:136]==3'b101)//header;
               begin
                 out1_pkt_wrreq<=1'b0;
                 nonip_data_reg<=in4_pkt_q;
               end
             else if(in4_pkt_q[138:136]==3'b110)//tail;
               begin
                 in4_pkt_rdreq<=1'b0;
                 if(in4_pkt_q[135:132]>4'b0011)//>4B;
                   begin
                     out1_pkt_wrreq<=1'b1;
                     out1_pkt<=nonip_data_reg;
                     nonip_data_reg<=in4_pkt_q;
                     
                     current_state<=nonip_over_4B;
                   end
                 else if(in4_pkt_q[135:132]==4'b0011)//==4B;
                   begin
                     out1_pkt_wrreq<=1'b1;
                     out1_pkt<=nonip_data_reg;
                     out1_pkt[138:136]<=3'b110;//tail;
                     out1_pkt[135:132]<=4'b1111;
                     out1_valid_wrreq<=1'b1;
                     out1_valid<=1'b1;
                     
                     current_state<=idle;
                   end
                 else
                   begin
                     out1_pkt_wrreq<=1'b1;
                     out1_pkt<=nonip_data_reg;
                     out1_pkt[138:136]<=3'b110;
                     out1_pkt[135:132]<=4'b1111-(4'b0011-in4_pkt_q[135:132]);
                     out1_valid_wrreq<=1'b1;
                     out1_valid<=1'b1;
                     
                     current_state<=idle;
                   end
               end
             else
               begin
                 out1_pkt_wrreq<=1'b1;
                 out1_pkt<=nonip_data_reg;
                 nonip_data_reg<=in4_pkt_q;
                 
                 current_state<=pass_throgh;
               end
           end//end pass_throgh;
         discard:
           begin
             info_pkt_wrreq<=1'b0;
             if(in4_pkt_q[138:136]==3'b110)//tail;
               begin
                 in4_pkt_rdreq<=1'b0;
                 
                 current_state<=idle;
               end
             else if(in4_pkt_q[138:136]==3'b111)//only one clock data;
               begin
                 in4_pkt_rdreq<=1'b0;
                 
                 current_state<=idle;
               end
             else
               begin
                 in4_pkt_rdreq<=1'b1;
                 
                 current_state<=discard;
               end
           end//end discard;
         expre_over_4B:
           begin
             out1_valid_wrreq<=1'b1;
             out1_valid<=1'b1;
             out1_pkt_wrreq<=1'b1;
             out1_pkt<=expre_dada_reg;
             out1_pkt[135:132]<=expre_dada_reg[135:132]-4'b0100;
             
             current_state<=idle;
           end//end expre_over_4B;
         nonip_over_4B:
           begin
             out1_valid_wrreq<=1'b1;
             out1_valid<=1'b1;
             out1_pkt_wrreq<=1'b1;
             out1_pkt<=nonip_data_reg;
             out1_pkt[135:132]<=nonip_data_reg[135:132]-4'b0100;
             
             current_state<=idle;
           end//end expre_over_4B;
          pass_add_exper_mac1:
            begin
             in4_pkt_rdreq<=1'b1;
             in4_valid_rdreq<=1'b0;
             out1_pkt_wrreq<=1'b0;//to port2 output fifo;
             
             expre_dada_reg<=in4_pkt_q;
             expre_dada_reg[15:0]<=16'h4500;//revert;
             current_state<=pass_add_exper_mac2;
            end
         pass_add_exper_mac2:
            begin
             in4_pkt_rdreq<=1'b1;
             in4_valid_rdreq<=1'b0;
             out1_pkt_wrreq<=1'b1;//to port2 output fifo;
             out1_pkt<=expre_dada_reg;
             expre_dada_reg<=in4_pkt_q;
             expre_dada_reg[15:0]<=16'h0102;//DIP,high 2 byte;
             expre_dada_reg[47:16]<=32'h01020304;//SIP;
             current_state<=pass_add_exper_mac3;
            end
         pass_add_exper_mac3:
            begin
             in4_pkt_rdreq<=1'b1;
             out1_pkt_wrreq<=1'b1;
             out1_pkt<=expre_dada_reg;
             expre_dada_reg<=in4_pkt_q;
  //           counter_ref <= counter_ref +1'b1;
             
             current_state<=transmit;
            end
            
         default:
           begin
             current_state<=idle;
           end
       endcase
     end//end reset else;
     
    reg in4_pkt_rdreq;
    wire [138:0]in4_pkt_q;
    wire [7:0]in4_pkt_usedw;
fifo_256_139 fifo_256_1392(
	.aclr(!reset),
	.clock(clk),
	.data(in4_pkt),
	.rdreq(in4_pkt_rdreq),
	.wrreq(in4_pkt_wrreq),
	.q(in4_pkt_q),
	.usedw(in4_pkt_usedw)
   );     
    reg in4_valid_rdreq;
    wire in4_valid_q;
    wire in4_valid_empty;
fifo_64_1 fifo_64_12(
	.aclr(!reset),
	.clock(clk),
	.data(in4_valid),
	.rdreq(in4_valid_rdreq),
	.wrreq(in4_valid_wrreq),
	.empty(in4_valid_empty),
	.q(in4_valid_q)
   );     

endmodule
