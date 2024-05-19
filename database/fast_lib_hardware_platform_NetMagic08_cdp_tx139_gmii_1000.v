// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//139-GMII;
//by jzc 20100929;
`timescale 1ns/1ns
module tx139_gmii_1000(
      clk,
      reset,
      gmii_txclk,
      
      crc_gen_to_txfifo_wrreq,
      crc_gen_to_txfifo_data,
      
      pkt_output_valid_wrreq,
      pkt_output_valid,
      
      gmii_txd,
      gmii_txen,
      gmii_txer,
      
      txfifo_data_usedw,//output_data_usedw0;
      port_send
   );
      input clk;//system clk;
      input reset;
      input gmii_txclk;
      input crc_gen_to_txfifo_wrreq;//data to txfifo;
      input [138:0]crc_gen_to_txfifo_data;
   
      input pkt_output_valid_wrreq;//flag to flagfifo;
      input pkt_output_valid;
      
      output [7:0]gmii_txd;//1 btye gmii data;
      output gmii_txen;
      output gmii_txer;
      
      output [7:0]txfifo_data_usedw;//data fifo usedw;
      output port_send;
      reg port_send;
      reg [7:0]gmii_txd;
      reg gmii_txen;
      reg gmii_txer;
      reg [138:0]data_reg;//storage data,so can split it to 16 bytes;
      
      reg [3:0]preamble_counter;//preamble counter,1000M:7 '55',1 'd5';100M:15 '5', 1'd'
      reg [3:0]counter;//the 12 clock latency between tow pkt;
      
wire [5:0] txfifo_flag_rdusedw;   //added by litao,
		
reg txfifo_flag_rdreq;
wire txfifo_flag;
wire empty;
wire [7:0]txfifo_data_usedw;
reg txfifo_data_rdreq;
wire [138:0]txfifo_data;
      
      reg [5:0]current_state;
      parameter 
           idle=6'h0,
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

                
always@(posedge gmii_txclk or negedge reset)
      if(!reset)
        begin
            txfifo_data_rdreq<=1'b0;
            txfifo_flag_rdreq<=1'b0;
            gmii_txen<=1'b0;
            gmii_txer<=1'b0;
            preamble_counter<=4'b0;
            port_send<=1'b0;
            counter<=4'b0;
            
            current_state<=idle;
        end
      else
        begin
            case(current_state)
                idle:
                    begin 
                        txfifo_data_rdreq<=1'b0;
                        txfifo_flag_rdreq<=1'b0;
                        gmii_txen<=1'b0;
                        gmii_txer<=1'b0;
                        preamble_counter<=4'b0;
                        if(counter==4'd11)begin
                        if((!empty)&&(txfifo_data_usedw!=1'b0))//flag fifo no empty;  //added by litao
                          begin
                              counter<=4'b0;
                              if(txfifo_flag==1'b1)//data fifo have a valid pkt;
                                begin
                                    txfifo_flag_rdreq<=1'b1;
                                    if(txfifo_data[138:136]==3'b101)//head;
                                      begin
                                          port_send<=1'b1;
                                          txfifo_data_rdreq<=1'b1;
                                          data_reg<=txfifo_data;
                                           current_state<=preamble;
                                      end
                                    else//if the first is not head ,so discard it;
                                      begin
                                          current_state<=discard;
                                      end
                                end
                              else//data fifo have a invalid pkt;
                                begin
                                    txfifo_flag_rdreq<=1'b1;
                                    
                                    current_state<=discard;
                                end
                          end
                        else//data fifo empty;
                          begin
                              current_state<=idle;
                          end
                        end//end counter;
                      else
                        begin
                          counter<=counter+1'b1;
                          current_state<=idle;
                        end
                    end//end idle;
                byte1:
                    begin
                        txfifo_flag_rdreq<=1'b0;
                        txfifo_data_rdreq<=1'b0;
                        if(data_reg[138:136]==3'b101)//head;
                          begin
                              gmii_txen<=1'b1;
                              gmii_txd<=data_reg[127:120];
                              
                              current_state<=byte2;
                          end
                        else if(data_reg[138:136]==3'b110)//tail;
                          begin
                              if(data_reg[135:132]==4'b0)//only one valid byte;
                                begin
                                    gmii_txen<=1'b1;
                                    gmii_txd<=data_reg[127:120];
                                    
                                    current_state<=idle;
                                end
                              else//more than one byte;
                                begin
                                    gmii_txen<=1'b1;
                                    gmii_txd<=data_reg[127:120];
                                    
                                    current_state<=byte2;
                                end
                          end
                        else//middle;
                          begin
                              gmii_txen<=1'b1;
                              gmii_txd<=data_reg[127:120];
                              
                              current_state<=byte2;
                          end
                    end//end byte1;
                byte2:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[119:112];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0001)//two valid byte;
                            current_state<=idle;
                          else//>2 valid byte;
                            current_state<=byte3;
                        else
                          current_state<=byte3;  
                    end//byte2;
                byte3:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[111:104];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0010)//3 valid byte;
                            current_state<=idle;
                          else//>3 valid byte;
                            current_state<=byte4;
                        else
                          current_state<=byte4;  
                    end//byte3;
                byte4:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[103:96];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0011)//4 valid byte;
                            current_state<=idle;
                          else//>4 valid byte;
                            current_state<=byte5;
                        else
                          current_state<=byte5;  
                    end//byte4;
                byte5:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[95:88];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0100)//5 valid byte;
                            current_state<=idle;
                          else//>5 valid byte;
                            current_state<=byte6;
                        else
                          current_state<=byte6;  
                    end//byte5;
                byte6:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[87:80];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0101)//6 valid byte;
                            current_state<=idle;
                          else//>6 valid byte;
                            current_state<=byte7;
                        else
                          current_state<=byte7;  
                    end//byte6;
                byte7:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[79:72];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0110)//7 valid byte;
                            current_state<=idle;
                          else//>7 valid byte;
                            current_state<=byte8;
                        else
                          current_state<=byte8;  
                    end//byte7;
                byte8:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[71:64];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b0111)//8 valid byte;
                            current_state<=idle;
                          else//>8 valid byte;
                            current_state<=byte9;
                        else
                          current_state<=byte9;  
                    end//byte8;
                byte9:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[63:56];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1000)//9 valid byte;
                            current_state<=idle;
                          else//>9 valid byte;
                            current_state<=byte10;
                        else
                          current_state<=byte10;  
                    end//byte9;
                byte10:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[55:48];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1001)//10 valid byte;
                            current_state<=idle;
                          else//>10 valid byte;
                            current_state<=byte11;
                        else
                          current_state<=byte11;  
                    end//byte10;
                byte11:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[47:40];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1010)//11 valid byte;
                            current_state<=idle;
                          else//>11 valid byte;
                            current_state<=byte12;
                        else
                          current_state<=byte12;  
                    end//byte11;
                byte12:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[39:32];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1011)//12 valid byte;
                            current_state<=idle;
                          else//>12 valid byte;
                            current_state<=byte13;
                        else
                          current_state<=byte13;  
                    end//byte12;
                byte13:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[31:24];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1100)//13 valid byte;
                            current_state<=idle;
                          else//>13 valid byte;
                            current_state<=byte14;
                        else
                          current_state<=byte14;  
                    end//byte13;
                byte14:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[23:16];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1101)//14 valid byte;
                            current_state<=idle;
                          else//>14 valid byte;
                            current_state<=byte15;
                        else
                          current_state<=byte15;  
                    end//byte14;
                byte15:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[15:8];
                        if(data_reg[138:136]==3'b110)//tail;
                          if(data_reg[135:132]==4'b1110)//15 valid byte;
                            current_state<=idle;
                          else//>15 valid byte;
                            current_state<=byte16;
                        else
                          current_state<=byte16;  
                    end//byte15;
                byte16:
                    begin
                        gmii_txen<=1'b1;
                        gmii_txd<=data_reg[7:0];
                        if(data_reg[138:136]==3'b110)//tail;
                            current_state<=idle;
                        else
                          begin
                              txfifo_data_rdreq<=1'b1;
                              data_reg<=txfifo_data;
                              
                              current_state<=byte1; 
                          end 
                    end//byte16;
                discard:
                    begin
						  txfifo_flag_rdreq <= 1'b0; //modified by litao, 20120321
                         txfifo_data_rdreq<=1'b1;
                         if(txfifo_data[138:136]==3'b110)
                           begin
                               txfifo_data_rdreq<=1'b0;
                               current_state<=idle; 
                           end
                         else
                           current_state<=discard;
                    end//end discard;
                preamble:
                    begin
                        txfifo_flag_rdreq<=1'b0;
                        txfifo_data_rdreq<=1'b0;
                        port_send<=1'b0;
                        if(preamble_counter<4'b0111)//7 '55';
                          begin
                              gmii_txen<=1'b1;
                              gmii_txd<=8'h55;
                              preamble_counter<=preamble_counter+1'b1;
                              
                              current_state<=preamble;
                          end
                        else//'d5';
                          begin
                              gmii_txen<=1'b1;
                              gmii_txd<=8'hd5;
                              preamble_counter <= 4'b0;
                              current_state<=byte1;
                          end
                    end//end preamble;

                default:
                    begin
                        current_state<=idle;
                    end//end default;
            endcase
        end//end else;
        

asyn_256_139 asyn_256_139(
	.aclr(!reset),
	.wrclk(clk),
	.wrreq(crc_gen_to_txfifo_wrreq),
	.data(crc_gen_to_txfifo_data),
	.rdclk(gmii_txclk),
	.rdreq(txfifo_data_rdreq),
	.q(txfifo_data),
	.wrusedw(txfifo_data_usedw)
   ); 

asyn_64_1 asyn_64_1(  
	.aclr(!reset),
	.wrclk(clk),
	.wrreq(pkt_output_valid_wrreq),
	.data(pkt_output_valid),
	
	.rdclk(gmii_txclk),
	.rdreq(txfifo_flag_rdreq),
	.q(txfifo_flag),
	.rdempty(empty),
	.rdusedw(txfifo_flag_rdusedw)  //added by litao
   );
endmodule
   