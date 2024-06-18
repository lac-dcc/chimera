// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0


module tx_crc_gen(
   clk,
   reset,
   
   out2_pkt_wrreq,
   out2_pkt,
   out2_pkt_usedw,
   out2_valid_wrreq,
   out2_valid,
   
   out2fifo_pkt_wrreq,
   out2fifo_pkt,
   out2fifo_pkt_usedw,
   out2fifo_valid_wrreq,
   out2fifo_valid
  );
   input clk;
   input reset;
   
   input out2_pkt_wrreq;//output to port2;
   input [138:0]out2_pkt;
   output [8:0]out2_pkt_usedw;
   input out2_valid_wrreq;
   input out2_valid;
   
   output out2fifo_pkt_wrreq;//output to port2;
   output [138:0]out2fifo_pkt;
   input [7:0]out2fifo_pkt_usedw;
   output out2fifo_valid_wrreq;
   output out2fifo_valid;
   
   reg out2fifo_pkt_wrreq;//output to port2;
   reg [138:0]out2fifo_pkt;
   wire [7:0]out2fifo_pkt_usedw;
   reg out2fifo_valid_wrreq;
   reg out2fifo_valid;
   
   reg [31:0]checksum_reg;//storage crc checksum;
   
   reg [3:0]current_state;
   parameter idle=4'b0,
             transmit=4'b0001,
             wait_checksum=4'b0010,
             last1=4'b0011,
             last2=4'b0100,
             last3=4'b0101,
             last4=4'b0110,
             discard=4'b0111;
   
always@(posedge clk or negedge reset)
   if(!reset)
     begin
       out2fifo_pkt_wrreq<=1'b0;
       out2fifo_valid_wrreq<=1'b0;
       out2_pkt_rdreq<=1'b0;
       out2_valid_rdreq<=1'b0;
       crc_data_valid<=1'b0;
       crc_empty<=4'b0;
       end_of_pkt<=1'b0;
       start_of_pkt<=1'b0;
       
       current_state<=idle;
     end
   else
     begin
       case(current_state)
         idle:
           begin
             out2fifo_pkt_wrreq<=1'b0;
             out2fifo_valid_wrreq<=1'b0;
             if(out2fifo_pkt_usedw<8'd161)//output fifo can save a max pkt;
               begin
                 if(!out2_valid_empty)//not empty;
                   begin
                     if(out2_valid_q==1'b1)//valid pkt;
                       begin
                         out2_pkt_rdreq<=1'b1;
                         out2_valid_rdreq<=1'b1;
                         
                         current_state<=transmit;
                       end
                     else
                       begin
                         out2_pkt_rdreq<=1'b1;
                         out2_valid_rdreq<=1'b1;
                         
                         current_state<=discard;
                       end
                   end
                 else//empty;
                   begin
                     current_state<=idle;
                   end
               end
             else//can not save a max pkt;
               begin
                 current_state<=idle;
               end
           end//end idle;
       transmit:
         begin
           out2_valid_rdreq<=1'b0;
           out2_pkt_rdreq<=1'b1;
           if(out2_pkt_q[138:136]==3'b101)//header;
             begin
               out2fifo_pkt_wrreq<=1'b1;
               out2fifo_pkt<=out2_pkt_q;
               
               crc_data_valid<=1'b1;
               crc_data<=out2_pkt_q[127:0];
               start_of_pkt<=1'b1;
               
               current_state<=transmit;
             end
           else if(out2_pkt_q[138:136]==3'b110)//tail;
             begin
               crc_data_valid<=1'b1;
               crc_data<=out2_pkt_q[127:0];
               end_of_pkt<=1'b1;
               crc_empty<=4'b1111-out2_pkt_q[135:132];
               
               out2fifo_pkt_wrreq<=1'b0;
               out2fifo_pkt<=out2_pkt_q;
               
               out2_pkt_rdreq<=1'b0;
               
               current_state<=wait_checksum;
             end
           else
             begin
               start_of_pkt<=1'b0;
               crc_data_valid<=1'b1;
               crc_data<=out2_pkt_q[127:0];
               out2fifo_pkt_wrreq<=1'b1;
               out2fifo_pkt<=out2_pkt_q;
               
               current_state<=transmit;
             end
         end//end transmit;
       wait_checksum:
         begin
           crc_data_valid<=1'b0;
           end_of_pkt<=1'b0;
           crc_empty<=4'b0;
           if(crc_checksum_valid==1'b1)//checksum is coming;
                begin
                  checksum_reg<=crc_checksum;
                  case(out2fifo_pkt[135:132])
                    4'b0000:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        
                        current_state<=idle;
                      end
                    4'b0001:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b0010:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b0011:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b0100:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b0101:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b0110:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b0111:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b1000:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b1001:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b1010:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{1{8'b0}}};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b1011:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                        out2fifo_pkt[135:132]<=out2fifo_pkt[135:132]+4'b0100;
                        out2fifo_valid_wrreq<=1'b1;
                        out2fifo_valid<=1'b1;
                        current_state<=idle;
                      end
                    4'b1100:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                        out2fifo_pkt[135:132]<=4'b1111;
                        out2fifo_pkt[138:136]<=3'b100;
                                                
                        current_state<=last1;
                      end
                    4'b1101:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                        out2fifo_pkt[135:132]<=4'b1111;
                        out2fifo_pkt[138:136]<=3'b100;
                                                
                        current_state<=last2;
                      end
                    4'b1110:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt[127:0]<={out2fifo_pkt[127:8],crc_checksum[7:0]};
                        out2fifo_pkt[135:132]<=4'b1111;
                        out2fifo_pkt[138:136]<=3'b100;
                                                
                        current_state<=last3;
                      end
                    default:
                      begin
                        out2fifo_pkt_wrreq<=1'b1;
                        out2fifo_pkt<=out2fifo_pkt;
                        out2fifo_pkt[135:132]<=4'b1111;
                        out2fifo_pkt[138:136]<=3'b100;
                                                
                        current_state<=last4;
                    end
                  endcase
                end
           else
             begin
               current_state<=wait_checksum;
             end
         end//end wait_checksum;
         last1:
            begin
              out2fifo_pkt_wrreq<=1'b1;
              out2fifo_pkt[127:120]<=checksum_reg[31:24];
              out2fifo_pkt[135:132]<=4'b0;
              out2fifo_pkt[138:136]<=3'b110;
              out2fifo_valid_wrreq<=1'b1;
              out2fifo_valid<=1'b1;
              current_state<=idle;
            end//end last1;
          last2:
            begin
              out2fifo_pkt_wrreq<=1'b1;
              out2fifo_pkt[127:112]<={checksum_reg[23:16],checksum_reg[31:24]};
              out2fifo_pkt[135:132]<=4'b0001;
              out2fifo_pkt[138:136]<=3'b110;
              out2fifo_valid_wrreq<=1'b1;
              out2fifo_valid<=1'b1;
              current_state<=idle;
            end//end last2;
          last3:
            begin
              out2fifo_pkt_wrreq<=1'b1;
              out2fifo_pkt[127:104]<={checksum_reg[15:8],checksum_reg[23:16],checksum_reg[31:24]};
              out2fifo_pkt[135:132]<=4'b0010;
              out2fifo_pkt[138:136]<=3'b110;
              out2fifo_valid_wrreq<=1'b1;
              out2fifo_valid<=1'b1;
              current_state<=idle;
            end//end last3;
          last4:
            begin
              out2fifo_pkt_wrreq<=1'b1;
              out2fifo_pkt[127:96]<={checksum_reg[7:0],checksum_reg[15:8],checksum_reg[23:16],checksum_reg[31:24]};
              out2fifo_pkt[135:132]<=4'b0011;
              out2fifo_pkt[138:136]<=3'b110;
              out2fifo_valid_wrreq<=1'b1;
              out2fifo_valid<=1'b1;
              current_state<=idle;
            end//end last4;
       discard:
         begin
           out2_pkt_rdreq<=1'b1;
           out2_valid_rdreq<=1'b0;
           if(out2_pkt_q[138:136]==3'b110)//tail;
             begin
               out2_pkt_rdreq<=1'b0;
                 
               current_state<=idle;
             end
           else
             begin
               current_state<=discard;
             end
         end//end last4;
       default:
         begin
           current_state<=idle;
         end//end default;
       endcase
     end//end reset else;
   wire [8:0]out2_pkt_usedw;
   reg out2_pkt_rdreq;
   wire [138:0]out2_pkt_q;
fifo_512_139 fifo_512_1390(
	.aclr(!reset),
	.clock(clk),
	.data(out2_pkt),
	.rdreq(out2_pkt_rdreq),
	.wrreq(out2_pkt_wrreq),
	.q(out2_pkt_q),
	.usedw(out2_pkt_usedw)
   );
    reg out2_valid_rdreq;
    wire out2_valid_empty;
    wire out2_valid_q;
fifo_128_1 fifo_128_10(
	.aclr(!reset),
	.clock(clk),
	.data(out2_valid),
	.rdreq(out2_valid_rdreq),
	.wrreq(out2_valid_wrreq),
	.empty(out2_valid_empty),
	.q(out2_valid_q)
   );
    
    reg [127:0]crc_data;
    reg crc_data_valid;
    reg [3:0]crc_empty;
    reg end_of_pkt;
    reg start_of_pkt;
    wire [31:0]crc_checksum;
    wire crc_checksum_valid;
crc_gen crc_gen0(
	.clk(clk),
	.data(crc_data),
	.datavalid(crc_data_valid),
	.empty(crc_empty),
	.endofpacket(end_of_pkt),
	.reset_n(reset),
	.startofpacket(start_of_pkt),
	.checksum(crc_checksum),
	.crcvalid(crc_checksum_valid)
  );
endmodule
