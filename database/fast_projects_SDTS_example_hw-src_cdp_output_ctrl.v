// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//output control module;
//by jzc 20101022;
`timescale 1ns/1ns
module output_ctrl(
     clk,
     reset,
     
     input2output_wrreq,//to input2output fifo;
     input2output_data,
     input2output_usedw,
    
     um2cdp_rule,						//rule, from user module;
	  //added by guotengfei 20120322, to CDP rule_fifo;
	  um2cdp_rule_wrreq,
	  cdp2um_rule_usedw, 
	  
     cdp2um_tx_enable,		//data ,from user module;
     um2cdp_data_valid,
     um2cdp_data,
     
     pkt_valid_wrreq,//flag fifo,to crc gen;
     pkt_valid,//[18:0],[18:17]:10-valid pkt and normal forward(depend on data[131:128]);
                              //11-valid pkt and copy;
                              //0x-invalid pkt and discard;
               //[16:0]:if this pkt need copy([18:17]=2'b11),every bit is one rgmii output interface;
     pkt_data_wrreq,//data fifo;
     pkt_data,
     pkt_data_usedw
    );
	 
     input clk;
     input reset;
     
     input input2output_wrreq;
     input [138:0]input2output_data;
     output [7:0]input2output_usedw;
     
     input [29:0]um2cdp_rule;
     
     output cdp2um_tx_enable;
     input um2cdp_data_valid;
     input [138:0]um2cdp_data;
     
     output pkt_valid_wrreq;
     output [18:0]pkt_valid;
     output pkt_data_wrreq;
     output [138:0]pkt_data;
     input [7:0]pkt_data_usedw;
	  
	  //added by guotengfei
	  input um2cdp_rule_wrreq;
	  output [4:0]cdp2um_rule_usedw;
     
     reg pkt_valid_wrreq;
     reg [18:0]pkt_valid;
     reg pkt_data_wrreq;
     reg [138:0]pkt_data;
     
     reg cdp2um_tx_enable;
	  
	  //added by guotengfei
	  wire [4:0]cdp2um_rule_usedw;
	  reg um2cdp_rule_rdreq;
	  wire [29:0]um2cdp_rule_q;
     
     reg input2output_rdreq;
     wire [138:0]input2output_q;
     wire [7:0]input2output_usedw;
     
	  wire um2cdp_rule_empty,um2cdp_rule_full;
     reg [3:0]output_port_reg;//storage the output port number;
     reg [7:0]cutter;//the cut number;
     reg [7:0]counter;//cut number counter;
     reg flag;//indicate the data come from where,user module or input2output fifo;
     
     reg [2:0]current_state;
     parameter idle=3'b0,
               wait_rule=3'b001,
               discard=3'b011,
               copy=3'b010,
               cut=3'b101;
     
always@(posedge clk or negedge reset)
     if(!reset)
       begin
           input2output_rdreq<=1'b0;
           cdp2um_tx_enable<=1'b0;
           pkt_valid_wrreq<=1'b0;
           pkt_data_wrreq<=1'b0;
           counter<=8'b0;
           cutter<=8'b0;
			  
			  um2cdp_rule_rdreq <= 1'b0;//added
           
           current_state<=idle;
       end
     else
       begin
           case(current_state)
               idle:
                   begin
                       pkt_data_wrreq<=1'b0;
                       pkt_valid_wrreq<=1'b0;
                       input2output_rdreq<=1'b0;

							  um2cdp_rule_rdreq <= 1'b0; //added
                       if(pkt_data_usedw<8'd161)//data fifo can storage a full pkt,so need a rule;
                         begin
                             current_state<=wait_rule;
                         end
                       else							//data fifo can't storage a full pkt;
                         begin
                             current_state<=idle;
                         end
                   end//end idle;
               wait_rule:
                   begin
							 if(um2cdp_rule_empty != 1'b1)//the rule is coming;
                         begin
									  um2cdp_rule_rdreq <= 1'b1; //added
                             if(um2cdp_rule_q[29]==1'b0)//the data comes from user module;  //modified by gtf changing um2cdp_rule to um2cdp_rule
                               begin
                                   flag<=1'b0;
                                   cdp2um_tx_enable<=1'b1;
                               end
                             else//the data comes from input2output fifo;
                               begin
                                   flag<=1'b1;
                                   input2output_rdreq<=1'b1;
                               end
                             case(um2cdp_rule_q[28:25])//the control command;     
                               4'b0000://direct output;
                                   begin
                                       if(um2cdp_rule_q[0]==1'b1)//bp0:0000;
                                         output_port_reg<=4'b0;
                                       else if(um2cdp_rule_q[1]==1'b1)//bp1:0001;
                                         output_port_reg<=4'd1;
                                       else if(um2cdp_rule_q[2]==1'b1)//bp2:0010;
                                         output_port_reg<=4'd2;
                                       else if(um2cdp_rule_q[3]==1'b1)//bp3:0011;
                                         output_port_reg<=4'd3;
                                       else if(um2cdp_rule_q[4]==1'b1)//
                                         output_port_reg<=4'd4;
                                       else if(um2cdp_rule_q[5]==1'b1)//
                                         output_port_reg<=4'd5;
                                       else if(um2cdp_rule_q[6]==1'b1)//
                                         output_port_reg<=4'd6;
                                       else if(um2cdp_rule_q[7]==1'b1)//
                                         output_port_reg<=4'd7;
                                       else if(um2cdp_rule_q[8]==1'b1)//fp0;
                                         output_port_reg<=4'd8;
                                       else if(um2cdp_rule_q[9]==1'b1)//
                                         output_port_reg<=4'd9;
                                       else if(um2cdp_rule_q[10]==1'b1)//
                                         output_port_reg<=4'd10;
                                       else if(um2cdp_rule_q[11]==1'b1)//
                                         output_port_reg<=4'd11;
                                       else if(um2cdp_rule_q[12]==1'b1)//
                                         output_port_reg<=4'd12;
                                       else if(um2cdp_rule_q[13]==1'b1)//
                                         output_port_reg<=4'd13;
                                       else if(um2cdp_rule_q[14]==1'b1)//
                                         output_port_reg<=4'd14;
                                       else if(um2cdp_rule_q[15]==1'b1)//
                                         output_port_reg<=4'd15;
                                       else//the 17 100M interface;
                                         output_port_reg<=4'd0;
                                       pkt_valid[16:0]<=um2cdp_rule_q[16:0];
                                       current_state<=copy;
                                   end
                               4'b0001://discard the pkt;
                                   begin
                                       current_state<=discard;
                                   end
                              /* 4'b0010://send to main control;
                                   begin
                                       current_state<=idle;//unused;
                                   end*/
                               /*
                               4'b0011://copy;
                                   begin
                                       pkt_valid[16:0]<=um2cdp_rule_q[16:0];//the output port;
                                       pkt_valid[18:17]<=2'b11;
                                       current_state<=copy;
                                   end*/
                               4'b0010://cut the pkt;
                                   begin
                                       if(um2cdp_rule_q[0]==1'b1)//bp0:0000;
                                         output_port_reg<=4'b0;
                                       else if(um2cdp_rule_q[1]==1'b1)//bp1:0001;
                                         output_port_reg<=4'd1;
                                       else if(um2cdp_rule_q[2]==1'b1)//bp2:0010;
                                         output_port_reg<=4'd2;
                                       else if(um2cdp_rule_q[3]==1'b1)//bp3:0011;
                                         output_port_reg<=4'd3;
                                       else if(um2cdp_rule_q[4]==1'b1)//
                                         output_port_reg<=4'd4;
                                       else if(um2cdp_rule_q[5]==1'b1)//
                                         output_port_reg<=4'd5;
                                       else if(um2cdp_rule_q[6]==1'b1)//
                                         output_port_reg<=4'd6;
                                       else if(um2cdp_rule_q[7]==1'b1)//
                                         output_port_reg<=4'd7;
                                       else if(um2cdp_rule_q[8]==1'b1)//fp0;
                                         output_port_reg<=4'd8;
                                       else if(um2cdp_rule_q[9]==1'b1)//
                                         output_port_reg<=4'd9;
                                       else if(um2cdp_rule_q[10]==1'b1)//
                                         output_port_reg<=4'd10;
                                       else if(um2cdp_rule_q[11]==1'b1)//
                                         output_port_reg<=4'd11;
                                       else if(um2cdp_rule_q[12]==1'b1)//
                                         output_port_reg<=4'd12;
                                       else if(um2cdp_rule_q[13]==1'b1)//
                                         output_port_reg<=4'd13;
                                       else if(um2cdp_rule_q[14]==1'b1)//
                                         output_port_reg<=4'd14;
                                       else if(um2cdp_rule_q[15]==1'b1)//
                                         output_port_reg<=4'd15;
                                       else//the 17 100M interface;
                                         output_port_reg<=4'd0;
                                       /*if(um2cdp_rule_q[24:17]==8'b0)//discard;
                                         begin
                                             current_state<=discard;
                                         end
                                       else if(um2cdp_rule_q[24:17]==8'hff)//normal output;
                                         begin
                                             pkt_valid[16:0]<=um2cdp_rule_q[16:0];
                                             current_state<=normal_output;
                                         end
                                       else
                                         begin*/
                                             cutter<=um2cdp_rule_q[24:17];
                                             pkt_valid[16:0]<=um2cdp_rule_q[16:0];
                                             current_state<=cut;
                                        // end
                                   end
                               default://discard?
                                   begin
                                       current_state<=discard;
                                   end
                             endcase
                          end
                       else//the rule is not coming;
                         begin
                             current_state<=wait_rule;
                         end
                   end//end wait_state;

               discard:
                   begin
                       pkt_data_wrreq<=1'b0;
                       pkt_valid_wrreq<=1'b0;
							  um2cdp_rule_rdreq <= 1'b0;
                       if(flag==1'b0)//the data come from user module;
                         begin
                             if(um2cdp_data_valid==1'b1)//the data is coming;
                               begin
                                   cdp2um_tx_enable<=1'b0;
                                   if(um2cdp_data[138:136]==3'b110)//tail;
                                     begin
                                         current_state<=idle;
                                     end
                                   else
                                     begin
                                         current_state<=discard;
                                     end 
                               end
                             else
                               begin
                                   current_state<=discard;
                               end
                         end
                       else//the data come from input2output fifo;
                         begin
                             if(input2output_q[138:136]==3'b110)//tail;
                               begin
                                   input2output_rdreq<=1'b0;
                                   current_state<=idle;
                               end
                             else
                               begin
                                   input2output_rdreq<=1'b1;
                                   current_state<=discard;
                               end
                         end
                   end//end discard;
               copy:
                   begin
						 um2cdp_rule_rdreq <= 1'b0;
                       if(flag==1'b0)//the data from user module;
                         begin
                             if(um2cdp_data_valid==1'b1)//the data is coming;
                               begin
                                   cdp2um_tx_enable<=1'b0;
                                   if(um2cdp_data[138:136]==3'b110)//tail;
                                     begin
                                         pkt_data_wrreq<=1'b1;
                                         pkt_data<=um2cdp_data;
                                         pkt_valid_wrreq<=1'b1;
                                         pkt_valid[18:17]<=2'b11;
                                         
                                         current_state<=idle;
                                     end
                                   else//middle;
                                     begin
                                         pkt_data_wrreq<=1'b1;
                                         pkt_data<=um2cdp_data;
                                         
                                         current_state<=copy;
                                     end
                               end
                             else
                               begin
                                   current_state<=copy;
                               end
                         end
                       else//the data from input2output fifo;
                         begin
                             if(input2output_q[138:136]==3'b101)//header;
                               begin
                                   pkt_data_wrreq<=1'b1;
                                   pkt_data<=input2output_q;
                                   input2output_rdreq<=1'b1;
                                   
                                   current_state<=copy;                 //header?middle????????????
                               end
                             else if(input2output_q[138:136]==3'b110)//tail;
                               begin
                                   pkt_data_wrreq<=1'b1;
                                   pkt_data<=input2output_q;
                                   pkt_valid_wrreq<=1'b1;
                                   pkt_valid[18:17]<=2'b11;
                                   input2output_rdreq<=1'b0;
                                   
                                   current_state<=idle;
                               end
                             else// middle;
                               begin
                                   pkt_data_wrreq<=1'b1;
                                   pkt_data<=input2output_q;
                                   input2output_rdreq<=1'b1;
                                   
                                   current_state<=copy;
                               end
                         end
                   end//end copy;
               cut:
                   begin
						 um2cdp_rule_rdreq <= 1'b0;
                       if(flag==1'b0)//the data from user module;
                         begin
                             if(um2cdp_data_valid==1'b1)//the data is coming;
                               begin
                                   cdp2um_tx_enable<=1'b0;
                                   if(counter==cutter+2'b11)//equal the need number;
                                     begin
                                         pkt_data_wrreq<=1'b1;
                                         pkt_data<=um2cdp_data;
                                         pkt_data[138:136]<=3'b110;
                                         pkt_data[135:132]<=4'b1111;
                                         pkt_valid_wrreq<=1'b1;
                                         pkt_valid[18:17]<=2'b10;
                                         //pkt_valid[16:0]<=17'b0;
                                         counter<=8'b0;
                                         cutter<=8'b0;
                                         
                                         current_state<=discard;
                                     end
                                   else//
                                     begin
                                         if(um2cdp_data[138:136]==3'b101)//head;
                                           begin
                                               counter<=counter+1'b1;
                                               pkt_data_wrreq<=1'b1;
                                               pkt_data<=um2cdp_data;
                                               pkt_data[131:128]<=output_port_reg;
                                               
                                               current_state<=cut;
                                           end
                                         else
                                           begin
                                               counter<=counter+1'b1;
                                               pkt_data_wrreq<=1'b1;
                                               pkt_data<=um2cdp_data;
                                               
                                               current_state<=cut;
                                           end
                                     end
                               end
                             else
                               begin
                                   current_state<=cut;
                               end
                         end
                       else//the data from input2output fifo;
                         begin
                             if(counter==cutter+2'b11)
                               begin
                                   pkt_data_wrreq<=1'b1;
                                   pkt_data<=input2output_q;
                                   pkt_data[138:136]<=3'b110;
                                   pkt_valid_wrreq<=1'b1;
                                   pkt_valid[18:17]<=2'b10;
                                   //pkt_valid[16:0]<=17'b0;
                                   counter<=8'b0;
                                   cutter<=8'b0;
                                   input2output_rdreq<=1'b1;
                                         
                                   current_state<=discard;
                               end
                             else
                               begin
                                   if(input2output_q[138:136]==3'b101)//head;
                                     begin
                                         counter<=counter+1'b1;
                                         pkt_data_wrreq<=1'b1;
                                         pkt_data<=input2output_q;
                                         pkt_data[131:128]<=output_port_reg;
                                         input2output_rdreq<=1'b1;
                                         
                                         current_state<=cut;
                                     end
                                   else
                                     begin
                                         counter<=counter+1'b1;
                                         pkt_data_wrreq<=1'b1;
                                         pkt_data<=input2output_q;
                                         input2output_rdreq<=1'b1;
                                         
                                         current_state<=cut;
                                     end
                             end
                       end
                   end//end cut;
               default:
                   begin
                       current_state<=idle;
                   end
           endcase//endcase;
       end

input2output_128_139 input2output_128_139(
	.aclr(!reset),
	.clock(clk),
	.data(input2output_data),
	.rdreq(input2output_rdreq),
	//.wrreq(1'b0),
	.wrreq(input2output_wrreq),  //changed by litao, 20120320
	.q(input2output_q),
	.usedw(input2output_usedw)
   ); 
//added by guotengfei 20120322
rule_32_30_fifo rule_32_30(
	.aclr(!reset),
	.clock(clk),
	.data(um2cdp_rule),
	.rdreq(um2cdp_rule_rdreq),
	.wrreq(um2cdp_rule_wrreq),  
	.q(um2cdp_rule_q),
	.usedw(cdp2um_rule_usedw),
	.empty(um2cdp_rule_empty),
	.full(um2cdp_rule_full)
   );	
endmodule
