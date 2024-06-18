// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0


module pkt_insert(
   clk,
   //wr_clk,
   reset,
   
   in0_pkt_wrreq,
   in0_pkt,
   in0_pkt_usedw,
   in0_valid_wrreq,
   in0_valid,
   
   out2_pkt_wrreq,
   out2_pkt,
   out2_pkt_usedw,
   out2_valid_wrreq,
   out2_valid,
   
   insert_N,
   timer
  );
   input clk;
   //input wr_clk;
   input reset;
   
   input in0_pkt_wrreq;//port0 input pkt;
   input [138:0]in0_pkt;
   output [7:0]in0_pkt_usedw;
   input in0_valid_wrreq;
   input in0_valid;
   
   output out2_pkt_wrreq;//output to port2;
   output [138:0]out2_pkt;
   input [7:0]out2_pkt_usedw;
   output out2_valid_wrreq;
   output out2_valid;
   
   input [31:0]insert_N;//insert n;
   input [31:0]timer;//TS;
   
   reg out2_pkt_wrreq;
   reg [138:0]out2_pkt;
   reg out2_valid_wrreq;
   reg out2_valid;
   
   reg [31:0]counter;//N:10 in 1;
   reg [15:0]pkt_id;//ID;
   reg [138:0]data_reg;//ip data storage;
   reg [138:0]nonip_data_reg;//non ip data storage;
   
   reg flag;
   reg [31:0]insert_N_r;
   reg [3:0]current_state;
   parameter idle=4'b0,
             pkt_identify=4'b0001,
             append_pkt_id=4'b0010,
             ip_transmit=4'b0011,
             over_4B=4'b0100,
             append_ref_pkt=4'b0101,
             ref_pkt_second=4'b0110,
             ref_pkt_third=4'b0111,
             ref_pkt_forth=4'b1000,
             discard=4'b1001,
             nonip_transmit=4'b1010,
             nonip_over_4B=4'b1011;
   
always@(posedge clk or negedge reset)
   if(!reset)
     begin
       out2_pkt_wrreq<=1'b0;
       out2_valid_wrreq<=1'b0;
       in0_pkt_rdreq<=1'b0;
       in0_valid_rdreq<=1'b0;
       counter<=31'b0;
       pkt_id<=16'b0;
       data_reg<=139'b0;
       flag <= 1'b0;
       current_state<=idle;
     end
   else
     begin
       case(current_state)
         idle:
           begin
             out2_pkt_wrreq<=1'b0;
             out2_valid_wrreq<=1'b0;
             if(flag==1'b0)begin
                insert_N_r <= insert_N;
                flag <= 1'b1;
                end
             else begin
               flag <= flag;
               insert_N_r <= insert_N_r;
               end
             if(out2_pkt_usedw<=8'd161)//port2 output fifo can save a max pkt;
               begin
                 if(in0_valid_empty==1'b0)
                   begin
                     if(in0_valid_q==1'b1)//the pkt is valid;
                       begin
                         in0_pkt_rdreq<=1'b1;
                         in0_valid_rdreq<=1'b1;
                         counter<=counter+1'b1;
                         pkt_id<=pkt_id+1'b1;
                         
                         current_state<=pkt_identify;
                       end
                     else//invalid pkt;
                       begin
                         in0_pkt_rdreq<=1'b1;
                         in0_valid_rdreq<=1'b1;
                         
                         current_state<=discard;
                       end
                   end
                 else//empty;
                   begin
                     current_state<=idle;
                   end
               end
             else
               begin
                 current_state<=idle;
               end//end usedw else;
           end//end idle;
         pkt_identify:
           begin
             in0_valid_rdreq<=1'b0;
             in0_pkt_rdreq<=1'b1;
             if(in0_pkt_q[31:16]==16'h0800)//IP pkt;
               begin
                 out2_pkt_wrreq<=1'b0;
                 data_reg<=in0_pkt_q;
                 data_reg[15:0]<=16'h0001;//experimet pkt;
                 
                 current_state<=append_pkt_id;
               end
             else//non IP pkt;
               begin
                 out2_pkt_wrreq<=1'b0;
                 nonip_data_reg<=in0_pkt_q;
                 //out2_pkt<=in0_pkt_q;
                 
                 current_state<=nonip_transmit;
               end
           end//end pkt_identify;
         nonip_transmit:
           begin
             in0_pkt_rdreq<=1'b1;
             if(in0_pkt_q[138:136]==3'b110)//tail;
               begin 
                 in0_pkt_rdreq<=1'b0;
                 nonip_data_reg<=in0_pkt_q;
                 if(in0_pkt_q[135:132]>4'b0011)//>4B;
                   begin
                     out2_pkt_wrreq<=1'b1;
                     out2_pkt<=nonip_data_reg;
                     
                     current_state<=nonip_over_4B;
                   end
                 else if(in0_pkt_q[135:132]==4'b0011)//==4B;
                   begin
                     out2_pkt_wrreq<=1'b1;
                     out2_pkt<=nonip_data_reg;
                     out2_pkt[138:136]<=3'b110;//tail;
                     out2_pkt[135:132]<=4'b1111;
                     out2_valid_wrreq<=1'b1;
                     out2_valid<=1'b1;
                     if(counter==insert_N_r)//
                       current_state<=append_ref_pkt;
                     else
                       current_state<=idle;
                   end
                 else
                   begin
                     out2_pkt_wrreq<=1'b1;
                     out2_pkt<=nonip_data_reg;
                     out2_pkt[138:136]<=3'b110;
                     out2_pkt[135:132]<=4'b1111-(4'b0011-in0_pkt_q[135:132]);
                     out2_valid_wrreq<=1'b1;
                     out2_valid<=1'b1;
                     if(counter==insert_N_r)//
                       current_state<=append_ref_pkt;
                     else
                       current_state<=idle;
                   end
               end
             else//middle;
               begin
                 out2_pkt_wrreq<=1'b1;
                 nonip_data_reg<=in0_pkt_q;
                 out2_pkt<=nonip_data_reg;
                 
                 current_state<=nonip_transmit;
               end
           end//end nonip_transmit;
         append_pkt_id:
           begin
             out2_pkt_wrreq<=1'b1;
             out2_pkt<=data_reg;
             
             in0_pkt_rdreq<=1'b1;
             data_reg<=in0_pkt_q;
             data_reg[47:16]<=timer;//TS;
             data_reg[15:0]<=pkt_id;//ID;
             
             current_state<=ip_transmit;
           end//end append_pkt_id;
         ip_transmit:
           begin
             if(in0_pkt_q[138:136]==3'b110)//tail;
               begin
                 in0_pkt_rdreq<=1'b0;
                 data_reg<=in0_pkt_q;
                 if(in0_pkt_q[135:132]>4'b0011)//>4B;
                   begin
                     out2_pkt_wrreq<=1'b1;
                     out2_pkt<=data_reg;
                     
                     current_state<=over_4B;
                   end
                 else if(in0_pkt_q[135:132]==4'b0011)//==4B;
                   begin
                     out2_pkt_wrreq<=1'b1;
                     out2_pkt<=data_reg;
                     out2_pkt[138:136]<=3'b110;//tail;
                     out2_pkt[135:132]<=4'b1111;
                     out2_valid_wrreq<=1'b1;
                     out2_valid<=1'b1;
                     if(counter==insert_N_r)//
                       current_state<=append_ref_pkt;
                     else
                       current_state<=idle;
                   end
                 else
                   begin
                     out2_pkt_wrreq<=1'b1;
                     out2_pkt<=data_reg;
                     out2_pkt[138:136]<=3'b110;
                     out2_pkt[135:132]<=4'b1111-(4'b0011-in0_pkt_q[135:132]);
                     out2_valid_wrreq<=1'b1;
                     out2_valid<=1'b1;
                     if(counter==insert_N_r)//
                       current_state<=append_ref_pkt;
                     else
                       current_state<=idle;
                   end
               end
             else//third and last middle;
               begin
                 out2_pkt_wrreq<=1'b1;
                 out2_pkt<=data_reg;
                 
                 in0_pkt_rdreq<=1'b1;
                 data_reg<=in0_pkt_q;
                 
                 current_state<=ip_transmit;
               end
           end//end ip_transmit;
         over_4B:
           begin
             out2_valid_wrreq<=1'b1;
             out2_valid<=1'b1;
             out2_pkt_wrreq<=1'b1;
             out2_pkt<=data_reg;
             out2_pkt[135:132]<=data_reg[135:132]-4'b0100;
             
             if(counter==insert_N_r)//
               current_state<=append_ref_pkt;
             else
               current_state<=idle;
           end//end over_4B;
         nonip_over_4B:
           begin
             out2_valid_wrreq<=1'b1;
             out2_valid<=1'b1;
             out2_pkt_wrreq<=1'b1;
             out2_pkt<=nonip_data_reg;
             out2_pkt[135:132]<=nonip_data_reg[135:132]-4'b0100;
             
             if(counter==insert_N_r)//
               current_state<=append_ref_pkt;
             else
               current_state<=idle;
           end//end nonip_over_4B;
         append_ref_pkt:
           begin
             out2_valid_wrreq<=1'b0;
             
             out2_pkt_wrreq<=1'b1;//the first data of ref pkt;
             out2_pkt[138:136]<=3'b101;//header;
             out2_pkt[135:132]<=4'b1111;//valid byte;
             out2_pkt[131:128]<=4'b0;
             out2_pkt[127:80]<=48'h112233445566;//DMAC;
             out2_pkt[79:32]<=48'h665544332211;//SMAC;
             out2_pkt[31:16]<=16'h0800;//DMAC;
             out2_pkt[15:0]<=16'h02;//ref identify;
             pkt_id<=pkt_id+1'b1;
             counter<=32'b0;
             
             current_state<=ref_pkt_second;
           end//end append_ref_pkt;
         ref_pkt_second:
           begin
             out2_pkt_wrreq<=1'b1;//the second data of ref pkt;
             out2_pkt[138:136]<=3'b100;//middle;
             out2_pkt[135:132]<=4'b1111;//valid byte;
             out2_pkt[131:128]<=4'b0;
             out2_pkt[127:112]<=16'h02e;//ip length;
             out2_pkt[111:96]<=pkt_id;//;ID
             out2_pkt[95:80]<=16'h0;//skew;
             out2_pkt[79:72]<=8'd125;//TTL;
             out2_pkt[71:64]<=8'd253;//PROtocol;
             out2_pkt[63:48]<=16'b0;//checksum;
             out2_pkt[47:16]<=timer;//TS;
             out2_pkt[15:0]<=pkt_id;//ID,unused;
             
             current_state<=ref_pkt_third;
           end//end ref_pkt_second;
         ref_pkt_third:
           begin
             out2_pkt_wrreq<=1'b1;//the third data of ref pkt;
             out2_pkt[138:136]<=3'b100;//middle;
             out2_pkt[135:132]<=4'b1111;//valid byte;
             out2_pkt[131:128]<=4'b0;
             out2_pkt[127:110]<=16'd02;//ref identify;
             out2_pkt[111:0]<=112'b0;
             
             current_state<=ref_pkt_forth;
           end//end ref_pkt_third;
         ref_pkt_forth:
           begin
             out2_pkt_wrreq<=1'b1;//the forth and last data of ref pkt;
             out2_pkt[138:136]<=3'b110;//tail;
             out2_pkt[135:132]<=4'hb;//valid byte;
             out2_pkt[131:128]<=4'b0;
             out2_pkt[127:0]<=128'b0;
             out2_valid_wrreq<=1'b1;
             out2_valid<=1'b1;
             flag <= 1'b0;        
             current_state<=idle;
           end//end ref_pkt_forth; 
         discard:
           begin
             in0_pkt_rdreq<=1'b1;
             in0_valid_rdreq<=1'b0;
             if(in0_pkt_q[138:136]==3'b110)//tail;
               begin
                 in0_pkt_rdreq<=1'b0;
                 
                 current_state<=idle;
               end
             else if(in0_pkt_q[138:136]==3'b111)//tail;
               begin
                 in0_pkt_rdreq<=1'b0;
                 
                 current_state<=idle;
               end
             else
               begin
                 current_state<=discard;
               end
           end
         default:
           begin
             current_state<=idle;
           end//end default;
       endcase
     end//end reset else;
     
    reg in0_pkt_rdreq;
    wire [138:0]in0_pkt_q;
    wire [7:0]in0_pkt_usedw;
fifo_256_139 fifo_256_1394(
	.aclr(!reset),
	.clock(clk),
	.data(in0_pkt),
	.rdreq(in0_pkt_rdreq),
	.wrreq(in0_pkt_wrreq),
	.q(in0_pkt_q),
	.usedw(in0_pkt_usedw)
   );     
    reg in0_valid_rdreq;
    wire in0_valid_q;
    wire in0_valid_empty;
fifo_64_1 fifo_64_14(
	.aclr(!reset),
	.clock(clk),
	.data(in0_valid),
	.rdreq(in0_valid_rdreq),
	.wrreq(in0_valid_wrreq),
	.empty(in0_valid_empty),
	.q(in0_valid_q)
   );     
     
endmodule
