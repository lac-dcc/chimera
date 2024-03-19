//tx crc genetator module,crc_gen and pkt copy;
//by jzc 20101025;
`timescale 1ns/1ns
module tx_gen(
     clk,
     reset,
     
     pkt_valid_wrreq,//flag fifo,to crc gen;
     pkt_valid,//[18:0],[18:17]:10-valid pkt and normal forward(depend on data[131:128]);
                              //11-valid pkt and copy;
                              //0x-invalid pkt and discard;
               //[16:0]:if this pkt need copy([18:17]=2'b11),every bit is one rgmii output interface;
     pkt_data_wrreq,//data fifo;
     pkt_data,
     pkt_data_usedw,
   
   crc_gen_valid0,//bp0;
   crc_gen_data0,
   output_data_usedw0,
   
   pkt_output_valid_wrreq0,
   pkt_output_valid0,
   
   crc_gen_valid1,//bp1;
   crc_gen_data1,
   output_data_usedw1,
   
   pkt_output_valid_wrreq1,
   pkt_output_valid1,
   
   crc_gen_valid2,//bp2;
   crc_gen_data2,
   output_data_usedw2,
   
   pkt_output_valid_wrreq2,
   pkt_output_valid2,
   
   crc_gen_valid3,//bp3;
   crc_gen_data3,
   output_data_usedw3,
   
   pkt_output_valid_wrreq3,
   pkt_output_valid3,
   
   crc_gen_valid4,//bp4;
   crc_gen_data4,
   output_data_usedw4,
   
   pkt_output_valid_wrreq4,
   pkt_output_valid4,
   
   crc_gen_valid5,//bp5;
   crc_gen_data5,
   output_data_usedw5,
   
   pkt_output_valid_wrreq5,
   pkt_output_valid5,
   
   crc_gen_valid6,//bp6;
   crc_gen_data6,
   output_data_usedw6,
   
   pkt_output_valid_wrreq6,
   pkt_output_valid6,
   
   crc_gen_valid7,//bp7;
   crc_gen_data7,
   output_data_usedw7,
   
   pkt_output_valid_wrreq7,
   pkt_output_valid7  
   );
    input clk;
    input reset;
    
    input pkt_valid_wrreq;
    input [18:0]pkt_valid;
    
    input pkt_data_wrreq;
    input [138:0]pkt_data;
    output [7:0]pkt_data_usedw;
    
    output crc_gen_valid0;//to crc generator;bp0
    output [138:0]crc_gen_data0;
    input [7:0]output_data_usedw0;//output data fifo;
   
    output pkt_output_valid_wrreq0;//pkt flag fifo,when the end of a pkt,give this signal;
    output pkt_output_valid0;
   
   
    output crc_gen_valid1;//bp1;
    output [138:0]crc_gen_data1;
    input [7:0]output_data_usedw1;
   
    output pkt_output_valid_wrreq1;
    output pkt_output_valid1;
   
    output crc_gen_valid2;//bp2;
    output [138:0]crc_gen_data2;
    input [7:0]output_data_usedw2;
   
    output pkt_output_valid_wrreq2;
    output pkt_output_valid2;
   
    output crc_gen_valid3;//bp3;
    output [138:0]crc_gen_data3;
    input [7:0]output_data_usedw3;
   
    output pkt_output_valid_wrreq3;
    output pkt_output_valid3;
   
    output crc_gen_valid4;//bp4;
    output [138:0]crc_gen_data4;
    input [7:0]output_data_usedw4;
   
    output pkt_output_valid_wrreq4;
    output pkt_output_valid4;
   
    output crc_gen_valid5;//bp5;
    output [138:0]crc_gen_data5;
    input [7:0]output_data_usedw5;
   
    output pkt_output_valid_wrreq5;
    output pkt_output_valid5;
   
    output crc_gen_valid6;//bp6;
    output [138:0]crc_gen_data6;
    input [7:0]output_data_usedw6;
   
    output pkt_output_valid_wrreq6;
    output pkt_output_valid6;
   
    output crc_gen_valid7;//bp7;
    output [138:0]crc_gen_data7;
    input [7:0]output_data_usedw7;
   
    output pkt_output_valid_wrreq7;
    output pkt_output_valid7;
   
   
    reg crc_gen_valid0;//bp0;
    reg [138:0]crc_gen_data0;
   
    reg pkt_output_valid_wrreq0;
    reg pkt_output_valid0;
   
   
    reg crc_gen_valid1;//bp1;
    reg [138:0]crc_gen_data1;
   
    reg pkt_output_valid_wrreq1;
    reg pkt_output_valid1;
   
    reg crc_gen_valid2;//bp2;
    reg [138:0]crc_gen_data2;
   
    reg pkt_output_valid_wrreq2;
    reg pkt_output_valid2;
   
    reg crc_gen_valid3;//bp3;
    reg [138:0]crc_gen_data3;
   
    reg pkt_output_valid_wrreq3;
    reg pkt_output_valid3;
   
    reg crc_gen_valid4;//bp4;
    reg [138:0]crc_gen_data4;
   
    reg pkt_output_valid_wrreq4;
    reg pkt_output_valid4;
   
    reg crc_gen_valid5;//bp5;
    reg [138:0]crc_gen_data5;
   
    reg pkt_output_valid_wrreq5;
    reg pkt_output_valid5;
   
    reg crc_gen_valid6;//bp6;
    reg [138:0]crc_gen_data6;
   
    reg pkt_output_valid_wrreq6;
    reg pkt_output_valid6;
   
    reg crc_gen_valid7;//bp7;
    reg [138:0]crc_gen_data7;
   
    reg pkt_output_valid_wrreq7;
    reg pkt_output_valid7;
      
    reg [16:0]output_port_reg;//storage the output port number;
    reg [4:0]counter;//flag,which one have the checksum;
    //reg data_fifo_usedw_flag;//whether all the 16 TX data fifo can save a full pkt;
    reg [138:0]data_reg;//storage the data;
    reg [31:0]crc_checksum_reg;
    reg [18:0]flag_q_reg;
    reg [7:0]full_flag;//the data fifo full flag;
    reg [7:0]bit_and;//at bit &;
    
    reg level2_rdreq;
   wire [138:0]level2_data_q;
   wire [7:0]pkt_data_usedw;
   reg flag_rdreq;
   wire [18:0]flag_q;
   wire flag_empty;
   reg start_of_pkt;
   reg data_to_gen_valid;
   reg [127:0]data_to_gen;
   reg [3:0]data_to_gen_empty;
   reg end_of_pkt;
   wire crc_valid;
   wire [31:0]crc_checksum;
    
    reg [3:0]current_state;
    parameter idle=4'b0,
              wait_rule=4'b0001,
              copy=4'b0010,
              wait_checksum=4'b0011,
              last1=4'b0100,
              last2=4'b0101,
              last3=4'b0110,
              last4=4'b0111,
              discard=4'b1000,
              fifo_usedw=4'b1001,
              fifo_usedw1=4'b1010;
   
always@(posedge clk or negedge reset)
    if(!reset)
      begin
          level2_rdreq<=1'b0;
          flag_rdreq<=1'b0;
          data_to_gen_valid<=1'b0;
          start_of_pkt<=1'b0;
          end_of_pkt<=1'b0;
          data_to_gen_empty<=4'b0;
          
          crc_gen_valid0<=1'b0;//bp0;
          pkt_output_valid_wrreq0<=1'b0;
          crc_gen_valid1<=1'b0;//bp1;
          pkt_output_valid_wrreq1<=1'b0;
          crc_gen_valid2<=1'b0;//bp2;
          pkt_output_valid_wrreq2<=1'b0;
          crc_gen_valid3<=1'b0;//bp3;
          pkt_output_valid_wrreq3<=1'b0;
          crc_gen_valid4<=1'b0;//bp4;
          pkt_output_valid_wrreq4<=1'b0;
          crc_gen_valid5<=1'b0;//bp5;
          pkt_output_valid_wrreq5<=1'b0;
          crc_gen_valid6<=1'b0;//bp6;
          pkt_output_valid_wrreq6<=1'b0;
          crc_gen_valid7<=1'b0;//bp7;
          pkt_output_valid_wrreq7<=1'b0;
          
          current_state<=idle;
      end
    else
      begin
          case(current_state)
              idle:
                  begin
                      crc_gen_valid0<=1'b0;//bp0;
                      pkt_output_valid_wrreq0<=1'b0;
                      crc_gen_valid1<=1'b0;//bp1;
                      pkt_output_valid_wrreq1<=1'b0;
                      crc_gen_valid2<=1'b0;//bp2;
                      pkt_output_valid_wrreq2<=1'b0;
                      crc_gen_valid3<=1'b0;//bp3;
                      pkt_output_valid_wrreq3<=1'b0;
                      crc_gen_valid4<=1'b0;//bp4;
                      pkt_output_valid_wrreq4<=1'b0;
                      crc_gen_valid5<=1'b0;//bp5;
                      pkt_output_valid_wrreq5<=1'b0;
                      crc_gen_valid6<=1'b0;//bp6;
                      pkt_output_valid_wrreq6<=1'b0;
                      crc_gen_valid7<=1'b0;//bp7;
                      pkt_output_valid_wrreq7<=1'b0;

                      level2_rdreq<=1'b0;
                      if(flag_empty==1'b0)//data fifo is not empty;
                        begin
                            //flag_rdreq<=1'b1;
                            flag_q_reg<=flag_q;
                            current_state<=fifo_usedw;
                            //current_state<=wait_rule;
                        end
                      else//data fifo is empty;
                        begin
                            current_state<=idle;
                        end
                     if(output_data_usedw0>=8'd161)
                       begin
                           full_flag[0]<=1'b1;
                       end
                     else
                       begin
                           full_flag[0]<=1'b0;
                       end
                     if(output_data_usedw1>=8'd161)
                       begin
                           full_flag[1]<=1'b1;
                       end
                     else
                       begin
                           full_flag[1]<=1'b0;
                       end
                     if(output_data_usedw2>=8'd161)
                       begin
                           full_flag[2]<=1'b1;
                       end
                     else
                       begin
                           full_flag[2]<=1'b0;
                       end
                     if(output_data_usedw3>=8'd161)
                       begin
                           full_flag[3]<=1'b1;
                       end
                     else
                       begin
                           full_flag[3]<=1'b0;
                       end
                     if(output_data_usedw4>=8'd161)
                       begin
                           full_flag[4]<=1'b1;
                       end
                     else
                       begin
                           full_flag[4]<=1'b0;
                       end
                     if(output_data_usedw5>=8'd161)
                       begin
                           full_flag[5]<=1'b1;
                       end
                     else
                       begin
                           full_flag[5]<=1'b0;
                       end
                     if(output_data_usedw6>=8'd161)
                       begin
                           full_flag[6]<=1'b1;
                       end
                     else
                       begin
                           full_flag[6]<=1'b0;
                       end
                     if(output_data_usedw7>=8'd161)
                       begin
                           full_flag[7]<=1'b1;
                       end
                     else
                       begin
                           full_flag[7]<=1'b0;
                       end                    

                  end//end idle;
              wait_rule:
                  begin
                      flag_rdreq<=1'b0;
                      if(flag_q_reg[18]==1'b1)//copy pkt;
                        begin
                            output_port_reg<=flag_q_reg[7:0];
                            level2_rdreq<=1'b1;
                            current_state<=copy;
                        end
                      else
                        begin
                            current_state<=discard;
                        end
                  end//end wait_rule;
              copy:
                  begin
                      start_of_pkt<=1'b0;
                      if(level2_data_q[138:136]==3'b101)//head;
                        begin
                            level2_rdreq<=1'b1;
                            start_of_pkt<=1'b1;
                            data_to_gen_valid<=1'b1;
                            data_to_gen<=level2_data_q[127:0];
                            current_state<=copy;
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b1;//data fifo;
                                  crc_gen_data0<=level2_data_q;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b1;//data fifo;
                                  crc_gen_data1<=level2_data_q;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b1;//data fifo;
                                  crc_gen_data2<=level2_data_q;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b1;//data fifo;
                                  crc_gen_data3<=level2_data_q;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b1;//data fifo;
                                  crc_gen_data4<=level2_data_q;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b1;//data fifo;
                                  crc_gen_data5<=level2_data_q;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b1;//data fifo;
                                  crc_gen_data6<=level2_data_q;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b1;//data fifo;
                                  crc_gen_data7<=level2_data_q;
                              end
                            else
                              crc_gen_valid7<=1'b0;                            
                        end//end head;
                      else if(level2_data_q[138:136]==3'b110)//tail;
                        begin
                            level2_rdreq<=1'b0;
                            end_of_pkt<=1'b1;
                            data_to_gen_valid<=1'b1;
                            data_to_gen<=level2_data_q[127:0];
                            data_to_gen_empty<=4'b1111-level2_data_q[135:132];
                            data_reg<=level2_data_q;
                            current_state<=wait_checksum;
                            
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b0;//data fifo;
                                  crc_gen_data0<=level2_data_q;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b0;//data fifo;
                                  crc_gen_data1<=level2_data_q;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b0;//data fifo;
                                  crc_gen_data2<=level2_data_q;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b0;//data fifo;
                                  crc_gen_data3<=level2_data_q;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b0;//data fifo;
                                  crc_gen_data4<=level2_data_q;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b0;//data fifo;
                                  crc_gen_data5<=level2_data_q;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b0;//data fifo;
                                  crc_gen_data6<=level2_data_q;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b0;//data fifo;
                                  crc_gen_data7<=level2_data_q;
                              end
                            else
                              crc_gen_valid7<=1'b0;
                         end  
                      else//middle;
                        begin
                            level2_rdreq<=1'b1;//data to crc gen;
                            data_to_gen_valid<=1'b1;
                            data_to_gen<=level2_data_q[127:0];
                            current_state<=copy;
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b1;//data fifo;
                                  crc_gen_data0<=level2_data_q;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b1;//data fifo;
                                  crc_gen_data1<=level2_data_q;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b1;//data fifo;
                                  crc_gen_data2<=level2_data_q;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b1;//data fifo;
                                  crc_gen_data3<=level2_data_q;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b1;//data fifo;
                                  crc_gen_data4<=level2_data_q;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b1;//data fifo;
                                  crc_gen_data5<=level2_data_q;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b1;//data fifo;
                                  crc_gen_data6<=level2_data_q;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b1;//data fifo;
                                  crc_gen_data7<=level2_data_q;
                              end
                            else
                              crc_gen_valid7<=1'b0;                            
                        end
                  end//end copy;
              wait_checksum:
                  begin
                      end_of_pkt<=1'b0;
                      level2_rdreq<=1'b0;
                      data_to_gen_valid<=1'b0;
                      data_to_gen_empty<=4'b0;
                      if(crc_valid==1'b1)//the checksum is coming;
                        begin
                            crc_checksum_reg<=crc_checksum;
                            if(data_reg[135:132]==4'b0)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:120],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{11{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                 
                              end//end 1;
                            else if(data_reg[135:132]==4'd1)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:112],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{10{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd2)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:104],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{9{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd3)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:96],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{8{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                              end    
                            else if(data_reg[135:132]==4'd4)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:88],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{7{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                 
                              end
                            else if(data_reg[135:132]==4'd5)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:80],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{6{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd6)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:72],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{5{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd7)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:64],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{4{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd8)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:56],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{3{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd9)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:48],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],{2{8'b0}}};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd10)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:40],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24],8'b0};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd11)//
                              begin
                                  current_state<=idle;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                          crc_gen_data0[135:132]<=crc_gen_data0[135:132]+4'b0100;
                                          pkt_output_valid_wrreq0<=1'b1;
                                          pkt_output_valid0<=1'b1;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data1[135:132]<=crc_gen_data1[135:132]+4'b0100;
                                        pkt_output_valid_wrreq1<=1'b1;
                                        pkt_output_valid1<=1'b1;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data2[135:132]<=crc_gen_data2[135:132]+4'b0100;
                                        pkt_output_valid_wrreq2<=1'b1;
                                        pkt_output_valid2<=1'b1;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data3[135:132]<=crc_gen_data3[135:132]+4'b0100;
                                        pkt_output_valid_wrreq3<=1'b1;
                                        pkt_output_valid3<=1'b1;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data4[135:132]<=crc_gen_data4[135:132]+4'b0100;
                                        pkt_output_valid_wrreq4<=1'b1;
                                        pkt_output_valid4<=1'b1;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data5[135:132]<=crc_gen_data5[135:132]+4'b0100;
                                        pkt_output_valid_wrreq5<=1'b1;
                                        pkt_output_valid5<=1'b1;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data6[135:132]<=crc_gen_data6[135:132]+4'b0100;
                                        pkt_output_valid_wrreq6<=1'b1;
                                        pkt_output_valid6<=1'b1;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:32],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16],crc_checksum[31:24]};
                                        crc_gen_data7[135:132]<=crc_gen_data7[135:132]+4'b0100;
                                        pkt_output_valid_wrreq7<=1'b1;
                                        pkt_output_valid7<=1'b1;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                            else if(data_reg[135:132]==4'd12)//
                              begin
                                  current_state<=last1;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                          crc_gen_data0[135:132]<=4'b1111;
                                          crc_gen_data0[138:136]<=3'b100;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data1[135:132]<=4'b1111;
                                        crc_gen_data1[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data2[135:132]<=4'b1111;
                                        crc_gen_data2[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data3[135:132]<=4'b1111;
                                        crc_gen_data3[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data4[135:132]<=4'b1111;
                                        crc_gen_data4[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data5[135:132]<=4'b1111;
                                        crc_gen_data5[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data6[135:132]<=4'b1111;
                                        crc_gen_data6[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:24],crc_checksum[7:0],crc_checksum[15:8],crc_checksum[23:16]};
                                        crc_gen_data7[135:132]<=4'b1111;
                                        crc_gen_data7[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                 
                              end
                            else if(data_reg[135:132]==4'd13)//
                              begin
                                  current_state<=last2;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                          crc_gen_data0[135:132]<=4'b1111;
                                          crc_gen_data0[138:136]<=3'b100;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data1[135:132]<=4'b1111;
                                        crc_gen_data1[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data2[135:132]<=4'b1111;
                                        crc_gen_data2[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data3[135:132]<=4'b1111;
                                        crc_gen_data3[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data4[135:132]<=4'b1111;
                                        crc_gen_data4[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data5[135:132]<=4'b1111;
                                        crc_gen_data5[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data6[135:132]<=4'b1111;
                                        crc_gen_data6[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:16],crc_checksum[7:0],crc_checksum[15:8]};
                                        crc_gen_data7[135:132]<=4'b1111;
                                        crc_gen_data7[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                 
                              end
                            else if(data_reg[135:132]==4'd14)//
                              begin
                                  current_state<=last3;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<={crc_gen_data0[127:8],crc_checksum[7:0]};
                                          crc_gen_data0[135:132]<=4'b1111;
                                          crc_gen_data0[138:136]<=3'b100;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<={crc_gen_data1[127:8],crc_checksum[7:0]};
                                        crc_gen_data1[135:132]<=4'b1111;
                                        crc_gen_data1[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<={crc_gen_data2[127:8],crc_checksum[7:0]};
                                        crc_gen_data2[135:132]<=4'b1111;
                                        crc_gen_data2[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<={crc_gen_data3[127:8],crc_checksum[7:0]};
                                        crc_gen_data3[135:132]<=4'b1111;
                                        crc_gen_data3[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<={crc_gen_data4[127:8],crc_checksum[7:0]};
                                        crc_gen_data4[135:132]<=4'b1111;
                                        crc_gen_data4[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<={crc_gen_data5[127:8],crc_checksum[7:0]};
                                        crc_gen_data5[135:132]<=4'b1111;
                                        crc_gen_data5[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<={crc_gen_data6[127:8],crc_checksum[7:0]};
                                        crc_gen_data6[135:132]<=4'b1111;
                                        crc_gen_data6[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<={crc_gen_data7[127:8],crc_checksum[7:0]};
                                        crc_gen_data7[135:132]<=4'b1111;
                                        crc_gen_data7[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                 
                              end
                            else if(data_reg[135:132]==4'd15)//
                              begin
                                  current_state<=last4;
                                  if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                                      begin
                                          crc_gen_valid0<=1'b1;//data fifo;
                                          crc_gen_data0[127:0]<=crc_gen_data0[127:0];
                                          crc_gen_data0[135:132]<=4'b1111;
                                          crc_gen_data0[138:136]<=3'b100;
                                      end
                                  else
                                    crc_gen_valid0<=1'b0;
                                  if(output_port_reg[1]==1'b1)
                                    begin
                                        crc_gen_valid1<=1'b1;//data fifo;
                                        crc_gen_data1[127:0]<=crc_gen_data1[127:0];
                                        crc_gen_data1[135:132]<=4'b1111;
                                        crc_gen_data1[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid1<=1'b0;
                                  if(output_port_reg[2]==1'b1)
                                    begin
                                        crc_gen_valid2<=1'b1;//data fifo;
                                        crc_gen_data2[127:0]<=crc_gen_data2[127:0];
                                        crc_gen_data2[135:132]<=4'b1111;
                                        crc_gen_data2[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid2<=1'b0;
                                  if(output_port_reg[3]==1'b1)
                                    begin
                                        crc_gen_valid3<=1'b1;//data fifo;
                                        crc_gen_data3[127:0]<=crc_gen_data3[127:0];
                                        crc_gen_data3[135:132]<=4'b1111;
                                        crc_gen_data3[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid3<=1'b0;
                                  if(output_port_reg[4]==1'b1)
                                    begin
                                        crc_gen_valid4<=1'b1;//data fifo;
                                        crc_gen_data4[127:0]<=crc_gen_data4[127:0];
                                        crc_gen_data4[135:132]<=4'b1111;
                                        crc_gen_data4[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid4<=1'b0;
                                  if(output_port_reg[5]==1'b1)
                                    begin
                                        crc_gen_valid5<=1'b1;//data fifo;
                                        crc_gen_data5[127:0]<=crc_gen_data5[127:0];
                                        crc_gen_data5[135:132]<=4'b1111;
                                        crc_gen_data5[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid5<=1'b0;
                                  if(output_port_reg[6]==1'b1)
                                    begin
                                        crc_gen_valid6<=1'b1;//data fifo;
                                        crc_gen_data6[127:0]<=crc_gen_data6[127:0];
                                        crc_gen_data6[135:132]<=4'b1111;
                                        crc_gen_data6[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid6<=1'b0;
                                  if(output_port_reg[7]==1'b1)
                                    begin
                                        crc_gen_valid7<=1'b1;//data fifo;
                                        crc_gen_data7[127:0]<=crc_gen_data7[127:0];
                                        crc_gen_data7[135:132]<=4'b1111;
                                        crc_gen_data7[138:136]<=3'b100;
                                    end
                                  else
                                    crc_gen_valid7<=1'b0;
                                  
                              end
                        end      
                      else
                        begin
                            current_state<=wait_checksum;
                        end
                  end//end wait_checksum;
              last1:
                  begin
                            current_state<=idle;
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b1;
                                  crc_gen_data0[135:132]<=4'd0;
                                  crc_gen_data0[138:136]<=3'b110;
                                  crc_gen_data0[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq0<=1'b1;
                                  pkt_output_valid0<=1'b1;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b1;
                                  crc_gen_data1[135:132]<=4'd0;
                                  crc_gen_data1[138:136]<=3'b110;
                                  crc_gen_data1[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq1<=1'b1;
                                  pkt_output_valid1<=1'b1;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b1;
                                  crc_gen_data2[135:132]<=4'd0;
                                  crc_gen_data2[138:136]<=3'b110;
                                  crc_gen_data2[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq2<=1'b1;
                                  pkt_output_valid2<=1'b1;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b1;
                                  crc_gen_data3[135:132]<=4'd0;
                                  crc_gen_data3[138:136]<=3'b110;
                                  crc_gen_data3[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq3<=1'b1;
                                  pkt_output_valid3<=1'b1;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b1;
                                  crc_gen_data4[135:132]<=4'd0;
                                  crc_gen_data4[138:136]<=3'b110;
                                  crc_gen_data4[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq4<=1'b1;
                                  pkt_output_valid4<=1'b1;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b1;
                                  crc_gen_data5[135:132]<=4'd0;
                                  crc_gen_data5[138:136]<=3'b110;
                                  crc_gen_data5[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq5<=1'b1;
                                  pkt_output_valid5<=1'b1;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b1;
                                  crc_gen_data6[135:132]<=4'd0;
                                  crc_gen_data6[138:136]<=3'b110;
                                  crc_gen_data6[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq6<=1'b1;
                                  pkt_output_valid6<=1'b1;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b1;
                                  crc_gen_data7[135:132]<=4'd0;
                                  crc_gen_data7[138:136]<=3'b110;
                                  crc_gen_data7[127:120]<=crc_checksum_reg[31:24];
                                  pkt_output_valid_wrreq7<=1'b1;
                                  pkt_output_valid7<=1'b1;
                              end
                            else
                              crc_gen_valid7<=1'b0;
                            
                  end//end last1;
              last2:
                  begin
                            current_state<=idle;
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b1;
                                  crc_gen_data0[135:132]<=4'd1;
                                  crc_gen_data0[138:136]<=3'b110;
                                  crc_gen_data0[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq0<=1'b1;
                                  pkt_output_valid0<=1'b1;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b1;
                                  crc_gen_data1[135:132]<=4'd1;
                                  crc_gen_data1[138:136]<=3'b110;
                                  crc_gen_data1[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq1<=1'b1;
                                  pkt_output_valid1<=1'b1;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b1;
                                  crc_gen_data2[135:132]<=4'd1;
                                  crc_gen_data2[138:136]<=3'b110;
                                  crc_gen_data2[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq2<=1'b1;
                                  pkt_output_valid2<=1'b1;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b1;
                                  crc_gen_data3[135:132]<=4'd1;
                                  crc_gen_data3[138:136]<=3'b110;
                                  crc_gen_data3[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq3<=1'b1;
                                  pkt_output_valid3<=1'b1;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b1;
                                  crc_gen_data4[135:132]<=4'd1;
                                  crc_gen_data4[138:136]<=3'b110;
                                  crc_gen_data4[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq4<=1'b1;
                                  pkt_output_valid4<=1'b1;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b1;
                                  crc_gen_data5[135:132]<=4'd1;
                                  crc_gen_data5[138:136]<=3'b110;
                                  crc_gen_data5[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq5<=1'b1;
                                  pkt_output_valid5<=1'b1;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b1;
                                  crc_gen_data6[135:132]<=4'd1;
                                  crc_gen_data6[138:136]<=3'b110;
                                  crc_gen_data6[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq6<=1'b1;
                                  pkt_output_valid6<=1'b1;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b1;
                                  crc_gen_data7[135:132]<=4'd1;
                                  crc_gen_data7[138:136]<=3'b110;
                                  crc_gen_data7[127:112]<={crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq7<=1'b1;
                                  pkt_output_valid7<=1'b1;
                              end
                            else
                              crc_gen_valid7<=1'b0;
                            
                  end//end last1;
              last3:
                  begin
                            current_state<=idle;
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b1;
                                  crc_gen_data0[135:132]<=4'd2;
                                  crc_gen_data0[138:136]<=3'b110;
                                  crc_gen_data0[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq0<=1'b1;
                                  pkt_output_valid0<=1'b1;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b1;
                                  crc_gen_data1[135:132]<=4'd2;
                                  crc_gen_data1[138:136]<=3'b110;
                                  crc_gen_data1[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq1<=1'b1;
                                  pkt_output_valid1<=1'b1;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b1;
                                  crc_gen_data2[135:132]<=4'd2;
                                  crc_gen_data2[138:136]<=3'b110;
                                  crc_gen_data2[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq2<=1'b1;
                                  pkt_output_valid2<=1'b1;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b1;
                                  crc_gen_data3[135:132]<=4'd2;
                                  crc_gen_data3[138:136]<=3'b110;
                                  crc_gen_data3[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq3<=1'b1;
                                  pkt_output_valid3<=1'b1;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b1;
                                  crc_gen_data4[135:132]<=4'd2;
                                  crc_gen_data4[138:136]<=3'b110;
                                  crc_gen_data4[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq4<=1'b1;
                                  pkt_output_valid4<=1'b1;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b1;
                                  crc_gen_data5[135:132]<=4'd2;
                                  crc_gen_data5[138:136]<=3'b110;
                                  crc_gen_data5[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq5<=1'b1;
                                  pkt_output_valid5<=1'b1;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b1;
                                  crc_gen_data6[135:132]<=4'd2;
                                  crc_gen_data6[138:136]<=3'b110;
                                  crc_gen_data6[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq6<=1'b1;
                                  pkt_output_valid6<=1'b1;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b1;
                                  crc_gen_data7[135:132]<=4'd2;
                                  crc_gen_data7[138:136]<=3'b110;
                                  crc_gen_data7[127:104]<={crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq7<=1'b1;
                                  pkt_output_valid7<=1'b1;
                              end
                            else
                              crc_gen_valid7<=1'b0;
                            
                  end//end last1;
              last4:
                  begin
                            current_state<=idle;
                            if(output_port_reg[0]==1'b1)//the pkt should send to bp0:rgmii0;
                              begin
                                  crc_gen_valid0<=1'b1;
                                  crc_gen_data0[135:132]<=4'd3;
                                  crc_gen_data0[138:136]<=3'b110;
                                  crc_gen_data0[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq0<=1'b1;
                                  pkt_output_valid0<=1'b1;
                              end
                            else
                              crc_gen_valid0<=1'b0;
                            if(output_port_reg[1]==1'b1)
                              begin
                                  crc_gen_valid1<=1'b1;
                                  crc_gen_data1[135:132]<=4'd3;
                                  crc_gen_data1[138:136]<=3'b110;
                                  crc_gen_data1[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq1<=1'b1;
                                  pkt_output_valid1<=1'b1;
                              end
                            else
                              crc_gen_valid1<=1'b0;
                            if(output_port_reg[2]==1'b1)
                              begin
                                  crc_gen_valid2<=1'b1;
                                  crc_gen_data2[135:132]<=4'd3;
                                  crc_gen_data2[138:136]<=3'b110;
                                  crc_gen_data2[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq2<=1'b1;
                                  pkt_output_valid2<=1'b1;
                              end
                            else
                              crc_gen_valid2<=1'b0;
                            if(output_port_reg[3]==1'b1)
                              begin
                                  crc_gen_valid3<=1'b1;
                                  crc_gen_data3[135:132]<=4'd3;
                                  crc_gen_data3[138:136]<=3'b110;
                                  crc_gen_data3[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq3<=1'b1;
                                  pkt_output_valid3<=1'b1;
                              end
                            else
                              crc_gen_valid3<=1'b0;
                            if(output_port_reg[4]==1'b1)
                              begin
                                  crc_gen_valid4<=1'b1;
                                  crc_gen_data4[135:132]<=4'd3;
                                  crc_gen_data4[138:136]<=3'b110;
                                  crc_gen_data4[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq4<=1'b1;
                                  pkt_output_valid4<=1'b1;
                              end
                            else
                              crc_gen_valid4<=1'b0;
                            if(output_port_reg[5]==1'b1)
                              begin
                                  crc_gen_valid5<=1'b1;
                                  crc_gen_data5[135:132]<=4'd3;
                                  crc_gen_data5[138:136]<=3'b110;
                                  crc_gen_data5[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq5<=1'b1;
                                  pkt_output_valid5<=1'b1;
                              end
                            else
                              crc_gen_valid5<=1'b0;
                            if(output_port_reg[6]==1'b1)
                              begin
                                  crc_gen_valid6<=1'b1;
                                  crc_gen_data6[135:132]<=4'd3;
                                  crc_gen_data6[138:136]<=3'b110;
                                  crc_gen_data6[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq6<=1'b1;
                                  pkt_output_valid6<=1'b1;
                              end
                            else
                              crc_gen_valid6<=1'b0;
                            if(output_port_reg[7]==1'b1)
                              begin
                                  crc_gen_valid7<=1'b1;
                                  crc_gen_data7[135:132]<=4'd3;
                                  crc_gen_data7[138:136]<=3'b110;
                                  crc_gen_data7[127:96]<={crc_checksum_reg[7:0],crc_checksum_reg[15:8],crc_checksum_reg[23:16],crc_checksum_reg[31:24]};
                                  pkt_output_valid_wrreq7<=1'b1;
                                  pkt_output_valid7<=1'b1;
                              end
                            else
                              crc_gen_valid7<=1'b0;
                            
                  end//end last1;
              discard:
                  begin
                      if(level2_data_q[138:136]==3'b110)//tail;
                        begin
                            level2_rdreq<=1'b1;
                            current_state<=idle;
                        end
                      else
                        begin
                            level2_rdreq<=1'b1;
                        end
                  end
              fifo_usedw://bit and;
                  begin
                      flag_rdreq<=1'b0;
                      bit_and[7:0]<=flag_q_reg[7:0]&full_flag[7:0];
                      current_state<=fifo_usedw1;
                  end
              fifo_usedw1:
                  begin
                      if(bit_and[0]|bit_and[1]|bit_and[2]|bit_and[3]|bit_and[4]|bit_and[5]|bit_and[6]|bit_and[7])
                        begin
                            full_flag<=7'b0;
                            bit_and<=7'b0;
                            flag_q_reg<=17'b0;
                            current_state<=idle;
                        end
                      else
                        begin
                            flag_rdreq<=1'b1;
                            current_state<=wait_rule;
                        end
                  end
              default:
                  begin
                      current_state<=idle;
                  end
          endcase
      end   
 
   
crc_gen crc_gen(
	.clk(clk),
	.reset_n(reset),
	.startofpacket(start_of_pkt),
	.datavalid(data_to_gen_valid),
	.data(data_to_gen),
	.empty(data_to_gen_empty),
	.endofpacket(end_of_pkt),
	.crcvalid(crc_valid),
	.checksum(crc_checksum)
   );
level2_256_139 level2_256_139(
	.aclr(!reset),
	.clock(clk),
	.data(pkt_data),
	.rdreq(level2_rdreq),
	.wrreq(pkt_data_wrreq),
	.q(level2_data_q),
	.usedw(pkt_data_usedw)
   );
level2_64_19 level2_64_19(
	.aclr(!reset),
	.clock(clk),
	.data(pkt_valid),
	.rdreq(flag_rdreq),
	.wrreq(pkt_valid_wrreq),
	.empty(flag_empty),
	.q(flag_q)
   );
endmodule
