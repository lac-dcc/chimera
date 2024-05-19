// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//139 to rx crc,16 FIFO;
//by jzc 20101020;
`timescale 1ns/1ns
module rx_crc(
    clk,
    reset,
    
    crc_result_wrreq,
    crc_result,
    
    crc_check_wrreq,
    crc_check_data,
    usedw,
    
    crc_data_valid0,//bp0
    crc_data0,
    pkt_usedw0,
    pkt_valid_wrreq0,
    pkt_valid0,
    
    crc_data_valid1,//bp1
    crc_data1,
    pkt_usedw1,
    pkt_valid_wrreq1,
    pkt_valid1,
    crc_data_valid2,//bp2
    crc_data2,
    pkt_usedw2,
    pkt_valid_wrreq2,
    pkt_valid2,
    crc_data_valid3,//bp3
    crc_data3,
    pkt_usedw3,
    pkt_valid_wrreq3,
    pkt_valid3,
    crc_data_valid4,//bp4
    crc_data4,
    pkt_usedw4,
    pkt_valid_wrreq4,
    pkt_valid4,
    crc_data_valid5,//bp5
    crc_data5,
    pkt_usedw5,
    pkt_valid_wrreq5,
    pkt_valid5,
    crc_data_valid6,//bp6
    crc_data6,
    pkt_usedw6,
    pkt_valid_wrreq6,
    pkt_valid6,
    crc_data_valid7,//bp7
    crc_data7,
    pkt_usedw7,
    pkt_valid_wrreq7,
    pkt_valid7,
    
    gmii_rxclk0,
    gmii_rxclk1,
    gmii_rxclk2,
    gmii_rxclk3,
    gmii_rxclk4,
    gmii_rxclk5,
    gmii_rxclk6,
    gmii_rxclk7,

    
    port_error0,
    port_error1,
    port_error2,
    port_error3,
    port_error4,
    port_error5,
    port_error6,
    port_error7

 );
    input clk;
    input reset;
    
    output crc_result_wrreq;//to flag fifo;
    output crc_result;
    
    output crc_check_wrreq;//to data fifo;
    output [138:0] crc_check_data;
    input [7:0] usedw;
///////////////////////////////16 rgmii///////////////////////////
    input crc_data_valid0;//bp0
    input [138:0]crc_data0;
    output [7:0]pkt_usedw0;
    input pkt_valid_wrreq0;
    input pkt_valid0;
    input crc_data_valid1;//bp1
    input [138:0]crc_data1;
    output [7:0]pkt_usedw1;
    input pkt_valid_wrreq1;
    input pkt_valid1;
    input crc_data_valid2;//bp2
    input [138:0]crc_data2;
    output [7:0]pkt_usedw2;
    input pkt_valid_wrreq2;
    input pkt_valid2;
    input crc_data_valid3;//bp3
    input [138:0]crc_data3;
    output [7:0]pkt_usedw3;
    input pkt_valid_wrreq3;
    input pkt_valid3;
    input crc_data_valid4;//bp4
    input [138:0]crc_data4;
    output [7:0]pkt_usedw4;
    input pkt_valid_wrreq4;
    input pkt_valid4;
    input crc_data_valid5;//bp5
    input [138:0]crc_data5;
    output [7:0]pkt_usedw5;
    input pkt_valid_wrreq5;
    input pkt_valid5;
    input crc_data_valid6;//bp6
    input [138:0]crc_data6;
    output [7:0]pkt_usedw6;
    input pkt_valid_wrreq6;
    input pkt_valid6;
    input crc_data_valid7;//bp7
    input [138:0]crc_data7;
    output [7:0]pkt_usedw7;
    input pkt_valid_wrreq7;
    input pkt_valid7;

    input gmii_rxclk0;
    input gmii_rxclk1;
    input gmii_rxclk2;
    input gmii_rxclk3;
    input gmii_rxclk4;
    input gmii_rxclk5;
    input gmii_rxclk6;
    input gmii_rxclk7;

    
    output port_error0;
    output port_error1;
    output port_error2;
    output port_error3;
    output port_error4;
    output port_error5;
    output port_error6;
    output port_error7;

    reg port_error0;
    reg port_error1;
    reg port_error2;
    reg port_error3;
    reg port_error4;
    reg port_error5;
    reg port_error6;
    reg port_error7;

    
    reg crc_rdreq0;
    reg crc_rdreq1;
    reg crc_rdreq2;
    reg crc_rdreq3;
    reg crc_rdreq4;
    reg crc_rdreq5;
    reg crc_rdreq6;
    reg crc_rdreq7;

    wire [138:0] crc_q0;
    wire [138:0] crc_q1;
    wire [138:0] crc_q2;
    wire [138:0] crc_q3;
    wire [138:0] crc_q4;
    wire [138:0] crc_q5;
    wire [138:0] crc_q6;
    wire [138:0] crc_q7;

    reg pkt_valid_rdreq0;
    reg pkt_valid_rdreq1;
    reg pkt_valid_rdreq2;
    reg pkt_valid_rdreq3;
    reg pkt_valid_rdreq4;
    reg pkt_valid_rdreq5;
    reg pkt_valid_rdreq6;
    reg pkt_valid_rdreq7;

    wire pkt_valid_q0;
    wire pkt_valid_q1;
    wire pkt_valid_q2;
    wire pkt_valid_q3;
    wire pkt_valid_q4;
    wire pkt_valid_q5;
    wire pkt_valid_q6;
    wire pkt_valid_q7;

    wire pkt_empty0;
    wire pkt_empty1;
    wire pkt_empty2;
    wire pkt_empty3;
    wire pkt_empty4;
    wire pkt_empty5;
    wire pkt_empty6;
    wire pkt_empty7;

    
    
   wire [7:0] pkt_usedw0;
   wire [7:0] pkt_usedw1;
   wire [7:0] pkt_usedw2;
   wire [7:0] pkt_usedw3;
   wire [7:0] pkt_usedw4;
   wire [7:0] pkt_usedw5;
   wire [7:0] pkt_usedw6;
   wire [7:0] pkt_usedw7;

///////////////////////////////end 16 rgmii///////////////////////    
    reg crc_result_wrreq;
    reg crc_result;
    
    reg crc_check_wrreq;
    reg [138:0] crc_check_data;
    
    reg pkt_valid_reg;//register the pkt_valid signal;
    
    reg [127:0] data_to_crc;//the following is the signals of CRC_chenck_IP ;
    reg data_valid;

    reg [3:0] empty;
    reg end_of_pkt;
    reg start_of_pkt;

    wire crc_bad;
    wire crc_valid;
    
    reg [2:0]counter;//flag which fifo is work;
    reg [3:0]flag;//flag which fifo should have the bad signal;
    reg [4:0] current_state;
    parameter idle=5'b0,
              transmit_check=5'b00001,
              wait_bad=5'b00010,
              discard=5'b00011,
              fifo1=5'b00100,
              fifo2=5'b00101,
              fifo3=5'b00110,
              fifo4=5'b00111,
              fifo5=5'b01000,
              fifo6=5'b01001,
              fifo7=5'b01010;
          
always@(posedge clk or negedge reset)//send the data to fifo,and CRC IP core;
    if(!reset)
      begin
          crc_check_wrreq<=1'b0;
          crc_result_wrreq<=1'b0;
          
          counter<=3'b0;
          data_valid<=1'b0;
          data_to_crc<=128'b0;
          empty<=4'b0;
          end_of_pkt<=1'b0;
          start_of_pkt<=1'b0;
          
          crc_rdreq0<=1'b0;//read data from data fifo;
          crc_rdreq1<=1'b0;
          crc_rdreq2<=1'b0;
          crc_rdreq3<=1'b0;
          crc_rdreq4<=1'b0;
          crc_rdreq5<=1'b0;
          crc_rdreq6<=1'b0;
          crc_rdreq7<=1'b0;

          
          pkt_valid_rdreq0<=1'b0;//read valid from flag fifo;
          pkt_valid_rdreq1<=1'b0;
          pkt_valid_rdreq2<=1'b0;
          pkt_valid_rdreq3<=1'b0;
          pkt_valid_rdreq4<=1'b0;
          pkt_valid_rdreq5<=1'b0;
          pkt_valid_rdreq6<=1'b0;
          pkt_valid_rdreq7<=1'b0;

          
          port_error0<=1'b0;
          port_error1<=1'b0;
          port_error2<=1'b0;
          port_error3<=1'b0;
          port_error4<=1'b0;
          port_error5<=1'b0;
          port_error6<=1'b0;
          port_error7<=1'b0;

          
          current_state<=idle;
      end
    else
      begin
          case(current_state)
             idle:
                 begin
                     crc_check_wrreq<=1'b0;//to data fifo;
                     crc_check_data<=139'b0;
                     crc_result_wrreq<=1'b0;
                     counter<=3'b0;      
                     start_of_pkt<=1'b0;
                     end_of_pkt<=1'b0;
                     empty<=4'b0;
                     data_valid<=1'b0;
                     data_to_crc<=128'b0;
                     crc_rdreq0<=1'b0;
                     crc_rdreq1<=1'b0;
                     port_error7<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty0==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q0==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq0<=1'b1;
                               crc_rdreq0<=1'b1;
                               counter<=3'b0;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq0<=1'b1;
                               crc_rdreq0<=1'b1;
                               counter<=3'b0;
                               port_error0<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo1;
                             //current_state<=idle;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=idle;
                       end
                 end//end idle;    
             fifo1:
                 begin
                     crc_rdreq0<=1'b0;
                     crc_result_wrreq<=1'b0;
                     port_error0<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty1==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q1==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq1<=1'b1;
                               crc_rdreq1<=1'b1;/////////////////////////////////
                               counter<=3'd1;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq1<=1'b1;
                               crc_rdreq1<=1'b1;
                               counter<=3'd1;
                               port_error1<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo2;
                             //current_state<=idle;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo1;
                       end
                 end//end fifo1;
             fifo2:
                 begin
                     crc_rdreq1<=1'b0;
                     crc_result_wrreq<=1'b0;
                     port_error1<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty2==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q2==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq2<=1'b1;
                               crc_rdreq2<=1'b1;
                               counter<=3'd2;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq2<=1'b1;
                               crc_rdreq2<=1'b1;
                               counter<=3'd2;
                               port_error2<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo3;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo2;
                       end
                 end//end fifo2;        
             fifo3:
                 begin
                     crc_result_wrreq<=1'b0;
                     crc_rdreq2<=1'b0;
                     port_error2<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty3==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q3==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq3<=1'b1;
                               crc_rdreq3<=1'b1;
                               counter<=3'd3;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq3<=1'b1;
                               crc_rdreq3<=1'b1;
                               counter<=3'd3;
                               port_error3<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo4;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo3;
                       end
                 end//end fifo3;    
             fifo4:
                 begin
                     crc_result_wrreq<=1'b0;
                     crc_rdreq3<=1'b0;
                     port_error3<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty4==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q4==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq4<=1'b1;
                               crc_rdreq4<=1'b1;
                               counter<=3'd4;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq4<=1'b1;
                               crc_rdreq4<=1'b1;
                               counter<=3'd4;
                               port_error4<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo5;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo4;
                       end
                 end//end fifo4;    
             fifo5:
                 begin
                     crc_result_wrreq<=1'b0;
                     crc_rdreq4<=1'b0;
                     port_error4<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty5==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q5==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq5<=1'b1;
                               crc_rdreq5<=1'b1;
                               counter<=3'd5;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq5<=1'b1;
                               crc_rdreq5<=1'b1;
                               counter<=3'd5;
                               port_error5<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo6;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo5;
                       end
                 end//end fifo5;    
             fifo6:
                 begin
                     crc_result_wrreq<=1'b0;
                     crc_rdreq5<=1'b0;
                     port_error5<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty6==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q6==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq6<=1'b1;
                               crc_rdreq6<=1'b1;
                               counter<=3'd6;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq6<=1'b1;
                               crc_rdreq6<=1'b1;
                               counter<=3'd6;
                               port_error6<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=fifo7;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo6;
                       end
                 end//end fifo6;    
             fifo7:
                 begin
                     crc_result_wrreq<=1'b0;
                     crc_rdreq6<=1'b0;
                     port_error6<=1'b0;
                     if(usedw<8'd161)//level2 fifo can storage a full pkt;
                       if(pkt_empty7==1'b0)//flag fifo is not empty;
                         if(pkt_valid_q7==1'b1)//data fifo is valid;
                           begin
                               pkt_valid_rdreq7<=1'b1;
                               crc_rdreq7<=1'b1;
                               counter<=3'd7;
                               current_state<=transmit_check;
                           end
                         else//data fifo is invalid;
                           begin
                               pkt_valid_rdreq7<=1'b1;
                               crc_rdreq7<=1'b1;
                               counter<=3'd7;
                               port_error7<=1'b1;
                               current_state<=discard;
                           end
                       else//level2 fifo can't storage a full pkt;
                         begin
                             current_state<=idle;
                         end
                     else//fifo is not a full pkt,so go to check next fifo;
                       begin
                           current_state<=fifo7;
                       end
                 end//end fifo7;    
              // end
             transmit_check:
                 begin
                     if(counter==3'b0)//bp0:0000;
                       begin
                           pkt_valid_rdreq0<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q0[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq0<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q0;
                                 crc_check_data[131:128]<=4'b0;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q0[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q0[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq0<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q0;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q0[135:132];
                                 data_to_crc<=crc_q0[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq0<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q0;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q0[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp0;
                     else if(counter==3'd1)//bp1:0001;
                       begin
                           pkt_valid_rdreq1<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q1[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq1<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q1;
                                 crc_check_data[131:128]<=4'd1;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q1[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q1[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq1<=1'b0;//////////////////////////////////////
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q1;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q1[135:132];
                                 data_to_crc<=crc_q1[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq1<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q1;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q1[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp1;
                     else if(counter==3'd2)//bp2:0010;
                       begin
                           pkt_valid_rdreq2<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q2[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq2<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q2;
                                 crc_check_data[131:128]<=4'd2;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q2[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q2[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq2<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q2;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q2[135:132];
                                 data_to_crc<=crc_q2[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq2<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q2;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q2[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp2;
                     else if(counter==3'd3)//bp3:0011;
                       begin
                           pkt_valid_rdreq3<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q3[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq3<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q3;
                                 crc_check_data[131:128]<=4'd3;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q3[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q3[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq3<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q3;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q3[135:132];
                                 data_to_crc<=crc_q3[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq3<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q3;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q3[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp3;
                     else if(counter==3'd4)//bp4:0100;
                       begin
                           pkt_valid_rdreq4<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q4[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq4<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q4;
                                 crc_check_data[131:128]<=4'd4;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q4[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q4[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq4<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q4;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q4[135:132];
                                 data_to_crc<=crc_q4[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq4<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q4;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q4[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp4;
                     else if(counter==3'd5)//bp5:0101;
                       begin
                           pkt_valid_rdreq5<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q5[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq5<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q5;
                                 crc_check_data[131:128]<=4'd5;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q5[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q5[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq5<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q5;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q5[135:132];
                                 data_to_crc<=crc_q5[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq5<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q5;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q5[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp5;
                     else if(counter==3'd6)//bp6:0110;
                       begin
                           pkt_valid_rdreq6<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q6[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq6<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q6;
                                 crc_check_data[131:128]<=4'd6;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q6[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q6[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq6<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q6;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q6[135:132];
                                 data_to_crc<=crc_q6[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq6<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q6;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q6[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp6;  
                     else 
                       begin
                           pkt_valid_rdreq7<=1'b0;
                           start_of_pkt<=1'b0;
                           if(crc_q7[138:136]==3'b101)//header;
                             begin
                                 crc_rdreq7<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q7;
                                 crc_check_data[131:128]<=4'd7;
                                 start_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q7[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                           else if(crc_q7[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq7<=1'b0;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q7;
                                 end_of_pkt<=1'b1;//to crc check ip core;
                                 data_valid<=1'b1;
                                 empty<=4'b1111-crc_q7[135:132];
                                 data_to_crc<=crc_q7[127:0];
                                 
                                 current_state<=wait_bad;
                             end
                           else//middle;
                             begin
                                 crc_rdreq7<=1'b1;
                                 crc_check_wrreq<=1'b1;//to level2 data fifo;
                                 crc_check_data<=crc_q7;
                                 data_valid<=1'b1;
                                 data_to_crc<=crc_q7[127:0];
                                 
                                 current_state<=transmit_check;
                             end
                       end//end bp7;  
                     end
 
             wait_bad:
                 begin
                     empty<=4'b0;
                     end_of_pkt<=1'b0;
                     data_valid<=1'b0;
                     crc_check_wrreq<=1'b0;
                     if(counter==3'd0)
                       begin
                           crc_rdreq0<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error0<=crc_bad;
                                 
                                 current_state<=fifo1;///////////////////
                             end
                           else
                             current_state<=wait_bad;
                       end
                     else if(counter==3'd1)
                       begin
                           crc_rdreq1<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error1<=crc_bad;
                                 current_state<=fifo2;
                                 //current_state<=idle;
                             end
                           else
                             current_state<=wait_bad;
                       end
                    else if(counter==3'd2)
                       begin
                           crc_rdreq2<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error2<=crc_bad;
                                 current_state<=fifo3;
                             end
                           else
                             current_state<=wait_bad;
                       end
                     else if(counter==3'd3)
                       begin
                           crc_rdreq3<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error3<=crc_bad;
                                 current_state<=fifo4;
                             end
                           else
                             current_state<=wait_bad;
                       end
                     else if(counter==3'd4)
                       begin
                           crc_rdreq4<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error4<=crc_bad;
                                 current_state<=fifo5;
                             end
                           else
                             current_state<=wait_bad;
                       end
                     else if(counter==3'd5)
                       begin
                           crc_rdreq5<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error5<=crc_bad;
                                 current_state<=fifo6;
                             end
                           else
                             current_state<=wait_bad;
                       end
                     else if(counter==3'd6)
                       begin
                           crc_rdreq6<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error6<=crc_bad;
                                 current_state<=fifo7;
                             end
                           else
                             current_state<=wait_bad;
                       end
                     else 
                       begin
                           crc_rdreq7<=1'b0;
                           if(crc_valid==1'b1)//crc_bad is coming;
                             begin
                                 crc_result_wrreq<=1'b1;
                                 crc_result<=~crc_bad;
                                 port_error7<=crc_bad;
                                 current_state<=idle;
                             end
                           else
                             current_state<=wait_bad;
                       end
                  end
                     

             discard:
                 begin
                     if(counter==3'd0)
                       begin
                           pkt_valid_rdreq0<=1'b0;
                           port_error0<=1'b0;
                           if(crc_q0[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq0<=1'b0;
                                 current_state<=fifo1;
                             end
                           else if(crc_q0[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq0<=1'b0;
                               current_state<=fifo1;
                             end                               
                           else
                             begin
                                 crc_rdreq0<=1'b1;
                                 current_state<=discard;
                             end
                       end
                    else if(counter==3'd1)
                       begin
                           pkt_valid_rdreq1<=1'b0;
                           port_error1<=1'b0;
                           if(crc_q1[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq1<=1'b0;
                                 current_state<=fifo2;
                                 //current_state<=idle;
                             end
                           else if(crc_q1[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq1<=1'b0;
                               current_state<=fifo2;
                             end
                           else
                             begin
                                 crc_rdreq1<=1'b1;
                                 current_state<=discard;
                             end
                       end
                    else if(counter==3'd2)
                       begin
                           pkt_valid_rdreq2<=1'b0;
                           port_error2<=1'b0;
                           if(crc_q2[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq2<=1'b0;
                                 current_state<=fifo3;
                             end
                           else if(crc_q2[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq2<=1'b0;
                               current_state<=fifo3;
                             end
                           else
                             begin
                                 crc_rdreq2<=1'b1;
                                 current_state<=discard;
                             end
                       end
                     else if(counter==3'd3)
                       begin
                           pkt_valid_rdreq3<=1'b0;
                           port_error3<=1'b0;
                           if(crc_q3[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq3<=1'b0;
                                 current_state<=fifo4;
                             end
                           else if(crc_q3[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq3<=1'b0;
                               current_state<=fifo4;
                             end
                           else
                             begin
                                 crc_rdreq3<=1'b1;
                                 current_state<=discard;
                             end
                       end
                     else if(counter==3'd4)
                       begin
                           pkt_valid_rdreq4<=1'b0;
                           port_error4<=1'b0;
                           if(crc_q4[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq4<=1'b0;
                                 current_state<=fifo5;
                             end
                           else if(crc_q4[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq4<=1'b0;
                               current_state<=fifo5;
                             end
                           else
                             begin
                                 crc_rdreq4<=1'b1;
                                 current_state<=discard;
                             end
                       end
                     else if(counter==3'd5)
                       begin
                           pkt_valid_rdreq5<=1'b0;
                           port_error5<=1'b0;
                           if(crc_q5[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq5<=1'b0;
                                 current_state<=fifo6;
                             end
                           else if(crc_q5[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq5<=1'b0;
                               current_state<=fifo6;
                             end
                           else
                             begin
                                 crc_rdreq5<=1'b1;
                                 current_state<=discard;
                             end
                       end
                     else if(counter==3'd6)
                       begin
                           pkt_valid_rdreq6<=1'b0;
                           port_error6<=1'b0;
                           if(crc_q6[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq6<=1'b0;
                                 current_state<=fifo7;
                             end
                           else if(crc_q6[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq6<=1'b0;
                               current_state<=fifo7;
                             end
                           else
                             begin
                                 crc_rdreq6<=1'b1;
                                 current_state<=discard;
                             end
                       end
                     else 
                       begin
                           pkt_valid_rdreq7<=1'b0;
                           port_error7<=1'b0;
                           if(crc_q7[138:136]==3'b110)//tail;
                             begin
                                 crc_rdreq7<=1'b0;
                                 current_state<=idle;
                             end
                           else if(crc_q7[138:136]==3'b111)// header and tail;
                             begin
                               crc_rdreq7<=1'b0;
                               current_state<=idle;
                             end
                           else
                             begin
                                 crc_rdreq7<=1'b1;
                                 current_state<=discard;
                             end
                       end
                   end             
				 default:
                     current_state<=idle;
          endcase
      end    
        
crc_check my_crc_check(//rx crc check IP;
	.clk(clk),
	.reset_n(reset),
	
	.data(data_to_crc),
	.datavalid(data_valid),
	.empty(empty),
	.endofpacket(end_of_pkt),
	
	.startofpacket(start_of_pkt),
	.crcbad(crc_bad),
	.crcvalid(crc_valid)
  );
  

asyn_256_139 asyn_256_1390(//bp0;
	.aclr(!reset),
//	.wrclk(gmii_rxclk0),
	.wrclk(clk),											//data has been synchronized to clk_125m_core, changed by mxl 1108;
	.wrreq(crc_data_valid0),
	.data(crc_data0),
	.rdclk(clk),
	.rdreq(crc_rdreq0),
	.q(crc_q0),
	.wrusedw(pkt_usedw0)
   );
asyn_64_1 asyn_64_10(
	.aclr(!reset),
//	.wrclk(gmii_rxclk0),//write;
	.wrclk(clk),											//data has been synchronized to clk_125m_core, changed by mxl 1108;
	.wrreq(pkt_valid_wrreq0),
	.data(pkt_valid0),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq0),
	.q(pkt_valid_q0),
	.rdempty(pkt_empty0)
    );
asyn_256_139 asyn_256_1391(//bp1;
	.aclr(!reset),
	.wrclk(gmii_rxclk1),
	.wrreq(crc_data_valid1),
	.data(crc_data1),
	.rdclk(clk),
	.rdreq(crc_rdreq1),
	.q(crc_q1),
	.wrusedw(pkt_usedw1)
   );
asyn_64_1 asyn_64_11(
	.aclr(!reset),
	.wrclk(gmii_rxclk1),//write;
	.wrreq(pkt_valid_wrreq1),
	.data(pkt_valid1),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq1),
	.q(pkt_valid_q1),
	.rdempty(pkt_empty1)
    );
asyn_256_139 asyn_256_1392(//bp2;
	.aclr(!reset),
	.wrclk(gmii_rxclk2),
	.wrreq(crc_data_valid2),
	.data(crc_data2),
	.rdclk(clk),
	.rdreq(crc_rdreq2),
	.q(crc_q2),
	.wrusedw(pkt_usedw2)
   );
asyn_64_1 asyn_64_12(
	.aclr(!reset),
	.wrclk(gmii_rxclk2),//write;
	.wrreq(pkt_valid_wrreq2),
	.data(pkt_valid2),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq2),
	.q(pkt_valid_q2),
	.rdempty(pkt_empty2)
    );
asyn_256_139 asyn_256_1393(//bp3;
	.aclr(!reset),
	.wrclk(gmii_rxclk3),
	.wrreq(crc_data_valid3),
	.data(crc_data3),
	.rdclk(clk),
	.rdreq(crc_rdreq3),
	.q(crc_q3),
	.wrusedw(pkt_usedw3)
   );
asyn_64_1 asyn_64_13(
	.aclr(!reset),
	.wrclk(gmii_rxclk3),//write;
	.wrreq(pkt_valid_wrreq3),
	.data(pkt_valid3),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq3),
	.q(pkt_valid_q3),
	.rdempty(pkt_empty3)
    );
asyn_256_139 asyn_256_1394(//bp4;
	.aclr(!reset),
	.wrclk(gmii_rxclk4),
	.wrreq(crc_data_valid4),
	.data(crc_data4),
	.rdclk(clk),
	.rdreq(crc_rdreq4),
	.q(crc_q4),
	.wrusedw(pkt_usedw4)
   );
asyn_64_1 asyn_64_14(
	.aclr(!reset),
	.wrclk(gmii_rxclk4),//write;
	.wrreq(pkt_valid_wrreq4),
	.data(pkt_valid4),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq4),
	.q(pkt_valid_q4),
	.rdempty(pkt_empty4)
    );
asyn_256_139 asyn_256_1395(//bp5;
	.aclr(!reset),
	.wrclk(gmii_rxclk5),
	.wrreq(crc_data_valid5),
	.data(crc_data5),
	.rdclk(clk),
	.rdreq(crc_rdreq5),
	.q(crc_q5),
	.wrusedw(pkt_usedw5)
   );
asyn_64_1 asyn_64_15(
	.aclr(!reset),
	.wrclk(gmii_rxclk5),//write;
	.wrreq(pkt_valid_wrreq5),
	.data(pkt_valid5),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq5),
	.q(pkt_valid_q5),
	.rdempty(pkt_empty5)
    );
asyn_256_139 asyn_256_1396(//bp6;
	.aclr(!reset),
	.wrclk(gmii_rxclk6),
	.wrreq(crc_data_valid6),
	.data(crc_data6),
	.rdclk(clk),
	.rdreq(crc_rdreq6),
	.q(crc_q6),
	.wrusedw(pkt_usedw6)
   );
asyn_64_1 asyn_64_16(
	.aclr(!reset),
	.wrclk(gmii_rxclk6),//write;
	.wrreq(pkt_valid_wrreq6),
	.data(pkt_valid6),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq6),
	.q(pkt_valid_q6),
	.rdempty(pkt_empty6)
    );
asyn_256_139 asyn_256_1397(//bp7;
	.aclr(!reset),
	.wrclk(gmii_rxclk7),
	.wrreq(crc_data_valid7),
	.data(crc_data7),
	.rdclk(clk),
	.rdreq(crc_rdreq7),
	.q(crc_q7),
	.wrusedw(pkt_usedw7)
   );
asyn_64_1 asyn_64_17(
	.aclr(!reset),
	.wrclk(gmii_rxclk7),//write;
	.wrreq(pkt_valid_wrreq7),
	.data(pkt_valid7),
	.rdclk(clk),//read;
	.rdreq(pkt_valid_rdreq7),
	.q(pkt_valid_q7),
	.rdempty(pkt_empty7)
    );

endmodule
