// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//GMII interface:1 byte to 139bits data,output to crc;
//by jzc 20101020;
`timescale 1ns/1ns
module gmii_139_1000(
   clk,
   reset,
   
   gmii_rxd,
   gmii_rxdv,
   gmii_rxer,
   
   crc_data_valid,
   crc_data,
   pkt_usedw,
   
   pkt_valid_wrreq,
   pkt_valid,
   
   port_receive,
   port_discard,
   port_pream
 );
   input reset;
   input clk;
   input [7:0] gmii_rxd;//from rgmii_gmii module;
   input gmii_rxdv;
   input gmii_rxer;
   
   output crc_data_valid;//to data fifo(crc check module);
   output [138:0] crc_data;
   input [7:0]pkt_usedw;
   
   output port_receive;
   output port_discard;
   output port_pream;
   output pkt_valid_wrreq;//a full pkt,to flag fifo;
   output pkt_valid;//
   
   reg crc_data_valid;
   reg [138:0] crc_data;
   
   reg pkt_valid_wrreq;
   reg pkt_valid;
   reg port_receive;
   reg port_discard;
   reg port_pream;
   
   reg [7:0] data_reg;//GMII数据缓冲一拍，便于判断首尾；
   reg [10:0] counter;//统计报文字节数，标志第一个139位数据；
   reg [3:0] counter_preamble;//对前导符进行计数；
   
   reg [5:0] current_state;
 parameter idle=6'h0,
           preamble=6'h01,  
           
           byte1=6'h02,
           byte2=6'h03,
           byte3=6'h04,
           byte4=6'h05,
           byte5=6'h06,
           byte6=6'h07,
           byte7=6'h08,
           byte8=6'h09,
           byte9=6'h0a,
           byte10=6'h0b,
           byte11=6'h0c,
           byte12=6'h0d,
           byte13=6'h0e,
           byte14=6'h0f,
           byte15=6'h10,
           byte16=6'h11,
           discard=6'h12;
           

           
 always@(posedge clk or negedge reset) 
   if(!reset)
      begin
          crc_data_valid<=1'b0;
          counter<=11'b0;
          counter_preamble<=4'b0;
          pkt_valid_wrreq<=1'b0;
          port_receive<=1'b0;
          port_discard<=1'b0;
          port_pream<=1'b0;
          
          current_state<=idle;
      end
   else
      begin
          case(current_state)
             idle:
                 begin
                     crc_data_valid<=1'b0;
                     pkt_valid_wrreq<=1'b0;
                     counter<=11'b0;
                     port_pream<=1'b0;
                     port_receive<=1'b0;
                     if((gmii_rxdv==1'b1)&&(gmii_rxd==8'h55))
                         begin
                             counter_preamble<=counter_preamble+1'b1;

                             current_state<=preamble;
                         end
                     else if(gmii_rxdv==1'b1)
                       begin
                         port_pream<=1'b1;
                         current_state<=discard;
                       end
                    else
                       current_state<=idle;
                 end
             preamble:
                 begin
                     port_receive<=1'b0;
                     if((gmii_rxdv==1'b1)&&(gmii_rxd==8'h55)&&(counter_preamble<4'h7))
                       begin
                           counter_preamble<=counter_preamble+1'b1;
                           
                           current_state<=preamble;
                       end
                     else if((gmii_rxdv==1'b1)&&(gmii_rxd==8'hd5)&&(counter_preamble >= 4'h4)&&(counter_preamble<=4'h7))/////gmii_rxd==8'hd5 
                       begin
                         if(pkt_usedw<8'd162)//data fifo can save a full pkt;
                           begin
                             counter_preamble<=4'b0;
                             
                             current_state<=byte1;
                           end
                         else//data fifo can't save a full pkt,so discard;
                          begin
                             port_discard<=1'b1;
                             
                             current_state<=discard;
                          end
                       end
                     else
                       begin
                           counter_preamble<=4'b0;
                           port_pream<=1'b1;
                           
                           current_state<=discard;
                       end
                 end
             byte1:
                 begin
                      if(gmii_rxdv==1'b1)
                        begin
                            data_reg<=gmii_rxd;
                            if(counter==11'd15)//the first 139bits;
                              begin
                                  crc_data_valid<=1'b1;
                                  crc_data[138:136]<=3'b101;
                                  crc_data[135:132]<=4'b1111;
                                  crc_data[131:128]<=4'b0;
                                  crc_data[7:0]<=data_reg;
                                  counter<=counter+1'b1;
                                  
                                  current_state<=byte2;
                              end
                            else if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[7:0]<=data_reg;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                
                                current_state<=discard;
                              end
                            else if(counter>11'd15)//the middle;
                              begin
                                  crc_data_valid<=1'b1;
                                  crc_data[138:136]<=3'b100;
                                  crc_data[135:132]<=4'b1111;
                                  crc_data[131:128]<=4'b0;
                                  crc_data[7:0]<=data_reg;
                                  counter<=counter+1'b1;
                                  
                                  current_state<=byte2;
                              end
                            else
                              current_state<=byte2;
                        end
                      else//end of pkt;
                        begin
                            crc_data_valid<=1'b1;
                            crc_data[7:0]<=data_reg;
                            if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1111;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                        end
                 end//end byte1;
             byte2:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[127:120]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte3;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[127:120]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte2;  
             byte3:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[119:112]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte4;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[119:112]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0001;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte3;
             byte4:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[111:104]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte5;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[111:104]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0010;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte4;
             byte5:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[103:96]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte6;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[103:96]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0011;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte5;
             byte6:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[95:88]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte7;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[95:88]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0100;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte6;
             byte7:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[87:80]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte8;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[87:80]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0101;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte7;
             byte8:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[79:72]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte9;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[79:72]<=data_reg;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0110;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                                port_receive<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte8;
             byte9:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[71:64]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte10;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[71:64]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0111;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte9;
             byte10:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[63:56]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte11;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[63:56]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1000;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte10;
             byte11:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[55:48]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte12;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[55:48]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1001;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte11;
             byte12:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[47:40]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte13;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[47:40]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1010;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte12;
             byte13:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[39:32]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte14;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[39:32]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1011;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte13;
             byte14:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[31:24]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte15;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[31:24]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1100;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte14;
             byte15:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[23:16]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte16;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[23:16]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1101;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte15;
             byte16:
                 begin
                     crc_data_valid<=1'b0;
                     if(gmii_rxdv==1'b1)
                       begin
                           crc_data[15:8]<=data_reg;
                           data_reg<=gmii_rxd;
                           if(counter>11'd1516)//long pkt,write tail and discard;
                              begin
                                crc_data_valid<=1'b1;
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                                port_receive<=1'b1;
                                current_state<=discard;
                              end
                            else
                              begin
                                counter<=counter+1'b1;
                           
                                current_state<=byte1;
                              end
                       end
                     else
                       begin
                           crc_data_valid<=1'b1;
                           crc_data[15:8]<=data_reg;
                           port_receive<=1'b1;
                           if(counter<11'd16)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b111;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                           else if(counter<11'd63)//the short pkt,only one clock data;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b0;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b0;
                              end
                            else//normal pkt;
                              begin
                                crc_data[138:136]<=3'b110;
                                crc_data[135:132]<=4'b1110;
                                crc_data[131:128]<=4'b0;
                                pkt_valid_wrreq<=1'b1;
                                pkt_valid<=1'b1;
                              end
                            current_state<=idle;
                       end
                 end//end byte16;
             discard:
                 begin
                     port_discard<=1'b0;
                     port_receive<=1'b0;
                     port_pream<=1'b0;
                     crc_data_valid<=1'b0;
                     pkt_valid_wrreq<=1'b0;
                     if(gmii_rxdv==1'b1)
                       current_state<=discard;
                     else
                       current_state<=idle;
                 end
 
             default:
                 begin
                     crc_data_valid<=1'b0;
                     pkt_valid_wrreq<=1'b0;
                     counter<=11'b0;
                     
                     current_state<=idle;
                 end
         endcase
      end
endmodule
   