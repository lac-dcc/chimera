// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// ****************************************************************************
// Copyright		: 	NUDT.
// ============================================================================
// FILE NAME		:	SGMII_MUX.v
// CREATE DATE		:	2013-12-03 
// AUTHOR			:	ZengQiang
// AUTHOR'S EMAIL	:	13973184419@163.com
// AUTHOR'S TEL		:	
// ============================================================================
// RELEASE 	HISTORY		-------------------------------------------------------
// VERSION 			DATE				AUTHOR				DESCRIPTION
// 1.0	   		2013-12-03		ZengQiang			Original Verison
// ============================================================================
// KEYWORDS 		: 	N/A
// ----------------------------------------------------------------------------
// PURPOSE 			: 	(1) from 5*SGMII port pkt to 1*pkt to input_ctl.
//							(2) add two metadata data	
// ----------------------------------------------------------------------------
// ============================================================================
// REUSE ISSUES
// Reset Strategy	:	Async clear,active high
// Clock Domains	:	clk
// Critical TiminG	:	N/A
// Instantiations	:	N/A
// Synthesizable	:	N/A
// Others			:	N/A
// ****************************************************************************


module SGMII_MUX(
clk,
wrclk0,
wrclk1,
wrclk2,
wrclk3,
wrclk4,
reset,
//sgmii0
in_xaui0_pkt_wrreq,
in_xaui0_pkt,
out_xaui0_pkt_almostfull,
in_xaui0_pkt_valid_wrreq,
in_xaui0_pkt_valid,

//sgmii1
in_xaui1_pkt_wrreq,
in_xaui1_pkt,
out_xaui1_pkt_almostfull,
in_xaui1_pkt_valid_wrreq,
in_xaui1_pkt_valid,

//sgmii2
in_xaui2_pkt_wrreq,
in_xaui2_pkt,
out_xaui2_pkt_almostfull,
in_xaui2_pkt_valid_wrreq,
in_xaui2_pkt_valid,

//sgmii3
in_xaui3_pkt_wrreq,
in_xaui3_pkt,
out_xaui3_pkt_almostfull,
in_xaui3_pkt_valid_wrreq,
in_xaui3_pkt_valid,

//sgmii4
in_xaui4_pkt_wrreq,
in_xaui4_pkt,
out_xaui4_pkt_almostfull,
in_xaui4_pkt_valid_wrreq,
in_xaui4_pkt_valid,
//to input_ctl
out_xaui_pkt_wrreq,
out_xaui_pkt,
in_xaui_pkt_almostfull,
out_xaui_pkt_valid_wrreq,
out_xaui_pkt_valid,

pkt_inport0,
pkt_inport1,
pkt_inport2,
pkt_inport3,
pkt_inport4,
slot_ID,
card_ID,
receive_pkt_add,
discard_error_pkt_add
);

input 						clk;
input 						wrclk0;//sgmii0 FIFO wr clk
input 						wrclk1;//sgmii1 FIFO wr clk
input 						wrclk2;//sgmii2 FIFO wr clk
input 						wrclk3;//sgmii3 FIFO wr clk
input 						wrclk4;//sgmii4 FIFO wr clk

input 						reset;
//sgmii0
input 						in_xaui0_pkt_wrreq;
input 	[133:0] 			in_xaui0_pkt;
output 						out_xaui0_pkt_almostfull;
input 						in_xaui0_pkt_valid_wrreq;
input 						in_xaui0_pkt_valid;

//sgmii1
input 						in_xaui1_pkt_wrreq;
input 	[133:0] 			in_xaui1_pkt;
output 						out_xaui1_pkt_almostfull;
input 						in_xaui1_pkt_valid_wrreq;
input  						in_xaui1_pkt_valid;

//sgmii2
input 						in_xaui2_pkt_wrreq;
input 	[133:0] 			in_xaui2_pkt;
output 						out_xaui2_pkt_almostfull;
input 						in_xaui2_pkt_valid_wrreq;
input 						in_xaui2_pkt_valid;

//sgmii3
input 						in_xaui3_pkt_wrreq;
input 	[133:0] 			in_xaui3_pkt;
output 						out_xaui3_pkt_almostfull;
input 						in_xaui3_pkt_valid_wrreq;
input  						in_xaui3_pkt_valid;

//sgmii4
input 						in_xaui4_pkt_wrreq;
input 	[133:0] 			in_xaui4_pkt;
output 						out_xaui4_pkt_almostfull;
input 						in_xaui4_pkt_valid_wrreq;
input  						in_xaui4_pkt_valid;
//to input_ctl
output 						out_xaui_pkt_wrreq;
output 	[133:0] 			out_xaui_pkt;
input 						in_xaui_pkt_almostfull;
output 						out_xaui_pkt_valid_wrreq;
output 	[11:0]			out_xaui_pkt_valid;
input 	[3:0]				pkt_inport0;
input 	[3:0]				pkt_inport1;
input 	[3:0]				pkt_inport2;
input 	[3:0]				pkt_inport3;
input 	[3:0]				pkt_inport4;
input 	[2:0]				slot_ID;
input 	[3:0]				card_ID;
output						receive_pkt_add;
output						discard_error_pkt_add;
reg							receive_pkt_add;
reg							discard_error_pkt_add;

reg 							out_xaui_pkt_wrreq;
reg 		[133:0] 			out_xaui_pkt;
reg 							out_xaui_pkt_valid_wrreq;
reg 		[11:0]			out_xaui_pkt_valid;
reg		[31:0]			port0_pkt_id;
reg		[31:0]			port1_pkt_id;
reg		[31:0]			port2_pkt_id;
reg		[31:0]			port3_pkt_id;
reg		[31:0]			port4_pkt_id;
reg  		[2:0]				xaui_num;
reg  							xaui_channel;
reg 		[10:0] 			pkt_length;
reg 		[3:0] 			current_state;
parameter 					idle0_s       =	4'b0000,
								idle1_s       =	4'b0001,
								idle2_s       =	4'b0010,
								idle3_s       =	4'b0011,
								idle4_s       =	4'b0100,
								add_pkt_s0    =	4'b0101,
								add_pkt_s1    =	4'b0110,
								discard_s     =	4'b0111,
								transmit_s    =	4'b1000;


always@(posedge clk or negedge reset)
if(!reset)
begin
 out_xaui_pkt_wrreq       		<=	1'b0;
 out_xaui_pkt             		<=	134'b0;
 out_xaui_pkt_valid_wrreq 		<=	1'b0;
 out_xaui_pkt_valid       		<=	12'b0;
 
 in_xaui0_pkt_rdreq       		<=	1'b0;
 in_xaui0_pkt_valid_rdreq 		<=	1'b0;
 
 in_xaui1_pkt_rdreq       		<=	1'b0;
 in_xaui1_pkt_valid_rdreq 		<=	1'b0;
 
 in_xaui2_pkt_rdreq       		<=	1'b0;
 in_xaui2_pkt_valid_rdreq 		<=	1'b0;
 
 in_xaui3_pkt_rdreq       		<=	1'b0;
 in_xaui3_pkt_valid_rdreq 		<=	1'b0;

 in_xaui4_pkt_rdreq       		<=	1'b0;
 in_xaui4_pkt_valid_rdreq 		<=	1'b0;
 
 port0_pkt_id						<=	32'b0;
 port1_pkt_id						<=	32'b0;
 port2_pkt_id						<=	32'b0;
 port3_pkt_id						<=	32'b0;
 port4_pkt_id						<=	32'b0;
 
 pkt_length							<= 11'b0;
 xaui_num							<=	3'b0;
 receive_pkt_add					<=	1'b0;
 discard_error_pkt_add			<=	1'b0;
 current_state 					<= idle0_s; 
end
else 
begin
 case(current_state)
	idle0_s:begin//SGMII0
					out_xaui_pkt_wrreq       	<=	1'b0;
					out_xaui_pkt_valid_wrreq 	<=	1'b0;
					pkt_length						<= 11'b0;
					receive_pkt_add				<=	1'b0;
					discard_error_pkt_add		<=	1'b0;
					if(in_xaui_pkt_almostfull	==	1'b1)
						current_state 				<= idle0_s;
						else begin
							if(in_xaui0_pkt_valid_empty	==	1'b1)//no pkt
								current_state <= idle1_s; 
								else
								begin
								xaui_num							<=	3'b000;//SGMII channl
								if(in_xaui0_pkt_valid_q		==	1'b0)	begin//error pkt										
									in_xaui0_pkt_valid_rdreq	<=	1'b1;
									in_xaui0_pkt_rdreq			<=1'b1;
									current_state 				<= discard_s; 
									end
								else	
								begin
									in_xaui0_pkt_valid_rdreq	<=	1'b1;
									in_xaui0_pkt_rdreq			<=	1'b0;
									current_state 				<= add_pkt_s0;
									end
								end
							end
						end
	idle1_s:begin//SGMII1
            out_xaui_pkt_wrreq       	<=		1'b0;
            out_xaui_pkt_valid_wrreq 	<=		1'b0;
				pkt_length						<= 	11'b0;
				receive_pkt_add				<=		1'b0;
				discard_error_pkt_add		<=		1'b0;
				if(in_xaui_pkt_almostfull	==		1'b1)
				 current_state 				<= 	idle1_s;
				else begin
           if(in_xaui1_pkt_valid_empty	==		1'b1)//no pkt
			   current_state 					<= 	idle2_s; 
			  else
			  begin
			   xaui_num							<=		3'b001;
			   if(in_xaui1_pkt_valid_q		==		1'b0)//error pkt
				begin
				 in_xaui1_pkt_valid_rdreq	<=		1'b1;
				 in_xaui1_pkt_rdreq			<=		1'b1;
				 current_state 				<= discard_s; 
				end
				else
				 begin
					 in_xaui1_pkt_valid_rdreq	<=	1'b1;
					 in_xaui1_pkt_rdreq			<=	1'b0;
					 current_state 				<= add_pkt_s0;
				 end
			  end
          end
			 end
	idle2_s:begin//SGMII2
            out_xaui_pkt_wrreq       	<=		1'b0;
            out_xaui_pkt_valid_wrreq 	<=		1'b0;
				pkt_length						<= 	11'b0;
				receive_pkt_add				<=		1'b0;
				discard_error_pkt_add		<=		1'b0;
				if(in_xaui_pkt_almostfull	==		1'b1)
				 current_state 				<= 	idle2_s;
				else begin
           if(in_xaui2_pkt_valid_empty	==		1'b1)//no pkt
			   current_state 					<= 	idle3_s; 
			  else
			  begin
			   xaui_num							<=		3'b010;//error pkt
				if(in_xaui2_pkt_valid_q		==		1'b0)//error pkt
				begin
				 in_xaui2_pkt_valid_rdreq	<=		1'b1;
				 in_xaui2_pkt_rdreq			<=		1'b1;
				 current_state 				<= discard_s; 
				end
				else
				 begin
					 in_xaui2_pkt_valid_rdreq	<=	1'b1;
					 in_xaui2_pkt_rdreq			<=	1'b0;
					 current_state 				<= add_pkt_s0;
				 end
			  end
          end
			 end
	idle3_s:begin//SGMII3
            out_xaui_pkt_wrreq       	<=		1'b0;
            out_xaui_pkt_valid_wrreq 	<=		1'b0;
				pkt_length						<= 	11'b0;
				receive_pkt_add				<=		1'b0;
				discard_error_pkt_add		<=		1'b0;
				if(in_xaui_pkt_almostfull	==		1'b1)
				 current_state 				<= 	idle3_s;
				else begin
           if(in_xaui3_pkt_valid_empty	==		1'b1)//no pkt
			   current_state 					<= 	idle4_s; 
			  else
			  begin
			   xaui_num							<=		3'b011;
			   if(in_xaui3_pkt_valid_q		==		1'b0)//error pkt
				begin
				 in_xaui3_pkt_valid_rdreq	<=		1'b1;
				 in_xaui3_pkt_rdreq			<=		1'b1;
				 current_state 				<= discard_s; 
				end
				else
				 begin
					 in_xaui3_pkt_valid_rdreq	<=	1'b1;
					 in_xaui3_pkt_rdreq			<=	1'b0;
					 current_state 				<= add_pkt_s0;
				 end
			  end
          end
			 end
	idle4_s:begin//SGMII4
            out_xaui_pkt_wrreq       	<=		1'b0;
            out_xaui_pkt_valid_wrreq 	<=		1'b0;
				pkt_length						<= 	11'b0;
				receive_pkt_add				<=		1'b0;
				discard_error_pkt_add		<=		1'b0;
				if(in_xaui_pkt_almostfull	==		1'b1)
				 current_state 				<= 	idle4_s;
				else begin
           if(in_xaui4_pkt_valid_empty	==		1'b1)//no pkt
			   current_state 					<= 	idle0_s; 
			  else
			  begin
			   xaui_num							<=		3'b100;
			   if(in_xaui4_pkt_valid_q		==		1'b0)//error pkt
				begin
				 in_xaui4_pkt_valid_rdreq	<=		1'b1;
				 in_xaui4_pkt_rdreq			<=		1'b1;
				 current_state 				<= discard_s; 
				end
				else
				 begin
					 in_xaui4_pkt_valid_rdreq	<=	1'b1;
					 in_xaui4_pkt_rdreq			<=	1'b0;
					 current_state 				<= add_pkt_s0;
				 end
			  end
          end
			 end
	discard_s:begin
            in_xaui0_pkt_valid_rdreq	<=	1'b0;
				in_xaui1_pkt_valid_rdreq	<=	1'b0;
				in_xaui2_pkt_valid_rdreq	<=	1'b0;
				in_xaui3_pkt_valid_rdreq	<=	1'b0;
				in_xaui4_pkt_valid_rdreq	<=	1'b0;
				case(xaui_num[2:0])//
				3'b000:begin				       
				       if(in_xaui0_pkt_q[133:132]==2'b10)
						 begin
						  discard_error_pkt_add	<=	1'b1;
						  in_xaui0_pkt_rdreq		<=	1'b0;
						  current_state 			<= idle1_s;
						 end
						 else
						 begin
						  in_xaui0_pkt_rdreq<=1'b1;
						  current_state <= discard_s;
						 end
				      end
				3'b001: begin				       
				       if(in_xaui1_pkt_q[133:132]==2'b10)
						 begin
						  discard_error_pkt_add		<=		1'b0;
						  in_xaui1_pkt_rdreq			<=		1'b0;
						  current_state 				<= 	idle2_s;
						 end
						 else
						 begin
						  in_xaui1_pkt_rdreq<=1'b1;
						  current_state <= discard_s;
						 end
				      end	
				3'b010: begin				       
				       if(in_xaui2_pkt_q[133:132]==2'b10)
						 begin
						  discard_error_pkt_add		<=		1'b0;
						  in_xaui2_pkt_rdreq			<=		1'b0;
						  current_state 				<= 	idle3_s;
						 end
						 else
						 begin
						  in_xaui2_pkt_rdreq<=1'b1;
						  current_state <= discard_s;
						 end
				      end
				3'b011: begin				       
				       if(in_xaui3_pkt_q[133:132]==2'b10)
						 begin
						  discard_error_pkt_add		<=		1'b0;
						  in_xaui3_pkt_rdreq			<=		1'b0;
						  current_state 				<= 	idle4_s;
						 end
						 else
						 begin
						  in_xaui3_pkt_rdreq<=1'b1;
						  current_state <= discard_s;
						 end
				      end
				default: begin				       
				       if(in_xaui4_pkt_q[133:132]==2'b10)
						 begin
						  discard_error_pkt_add		<=		1'b0;
						  in_xaui4_pkt_rdreq			<=		1'b0;
						  current_state 				<= 	idle0_s;
						 end
						 else
						 begin
						  in_xaui4_pkt_rdreq<=1'b1;
						  current_state <= discard_s;
						 end
				      end
				endcase
           end
	add_pkt_s0:begin//matedata 0
            in_xaui0_pkt_valid_rdreq	<=	1'b0;
				in_xaui1_pkt_valid_rdreq	<=	1'b0;
				in_xaui2_pkt_valid_rdreq	<=	1'b0;
				in_xaui3_pkt_valid_rdreq	<=	1'b0;
				in_xaui4_pkt_valid_rdreq	<=	1'b0;
				pkt_length 						<= pkt_length + 11'd32;//pkt length count
				out_xaui_pkt_wrreq			<=	1'b1;
				out_xaui_pkt[133:132]		<=	2'b01;
				out_xaui_pkt[131:128]		<=	4'b0;
				out_xaui_pkt[127:125]		<=	3'b0;//ctl
				out_xaui_pkt[124]				<=	1'b0;//Encrypt
				out_xaui_pkt[123:113]		<=	11'b0;//pkt length
				out_xaui_pkt[112:110]		<=	slot_ID;//slot ID
				out_xaui_pkt[109:78]			<=	32'b0;//
				out_xaui_pkt[77:74]			<=	card_ID;//card ID
				out_xaui_pkt[73:64]			<=	10'b0;//output port
				out_xaui_pkt[63]				<=	1'b1;//busy
				out_xaui_pkt[57:32]			<= 26'b0;//
				current_state 					<= add_pkt_s1;
				case(xaui_num[2:0])
					3'b000:	begin
						in_xaui0_pkt_rdreq	<=1'b0;
						out_xaui_pkt[31:0]	<= port0_pkt_id;// port0 sequence ID
						port0_pkt_id			<=	port0_pkt_id	+1'b1;
						out_xaui_pkt[62:58]	<= pkt_inport0;//input port num
						end
					3'b001:	begin
						in_xaui1_pkt_rdreq	<=1'b0;
						out_xaui_pkt[31:0]	<= port1_pkt_id;// port1 sequence ID
						port1_pkt_id			<=	port1_pkt_id	+1'b1;
						out_xaui_pkt[62:58]	<= pkt_inport1;//input port num
						end
					3'b010:	begin
						in_xaui2_pkt_rdreq	<=1'b0;
						out_xaui_pkt[31:0]	<= port2_pkt_id;// port2 sequence ID
						port2_pkt_id			<=	port2_pkt_id	+1'b1;
						out_xaui_pkt[62:58]	<= pkt_inport2;//input port num
						end
					3'b011:	begin
						in_xaui3_pkt_rdreq	<=1'b0;
						out_xaui_pkt[31:0]	<= port3_pkt_id;// port3 sequence ID
						port3_pkt_id			<=	port3_pkt_id	+1'b1;
						out_xaui_pkt[62:58]	<= pkt_inport3;//input port num
						end
					default:	begin
						in_xaui4_pkt_rdreq	<=1'b0;
						out_xaui_pkt[31:0]	<= port4_pkt_id;// port4 sequence ID
						port4_pkt_id			<=	port4_pkt_id	+1'b1;
						out_xaui_pkt[62:58]	<= pkt_inport4;//input port num
						end
				endcase
		end
	add_pkt_s1:begin//matadata 1

				out_xaui_pkt_wrreq			<=	1'b1;
				out_xaui_pkt[133:132]		<=	2'b11;
				out_xaui_pkt[131:128]		<=	4'b0;
				out_xaui_pkt[127:0]			<=	128'b0;				
				case(xaui_num[2:0])
					3'b000:	in_xaui0_pkt_rdreq	<=1'b1;
					3'b001:	in_xaui1_pkt_rdreq	<=1'b1;
					3'b010:	in_xaui2_pkt_rdreq	<=1'b1;												
					3'b011:	in_xaui3_pkt_rdreq	<=1'b1;												
					default:	in_xaui4_pkt_rdreq	<=1'b1;												
				endcase
				current_state 					<= transmit_s;
		end
  transmit_s:begin//pkt 
				case(xaui_num)
					3'b000:begin
				        if(in_xaui0_pkt_q[133:132]	==	2'b01)//header
						   begin
							 in_xaui0_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:132]	<= 2'b11;
							 out_xaui_pkt[131:0]		<=	in_xaui0_pkt_q[131:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state 			<= transmit_s;
							end
							else if(in_xaui0_pkt_q[133:132]	==	2'b10)//tail
							begin
							 receive_pkt_add				<=	1'b1;
							 in_xaui0_pkt_rdreq			<=	1'b0;
							 out_xaui_pkt_wrreq			<=	1'b1;
							 out_xaui_pkt[133:0]			<=	in_xaui0_pkt_q[133:0];
							 out_xaui_pkt_valid_wrreq	<=	1'b1;
							 out_xaui_pkt_valid[11]		<=	1'b1;
							 out_xaui_pkt_valid[10:0]	<=	pkt_length + 11'd16 - in_xaui0_pkt_q[131:128];
							 current_state 				<= idle1_s;
							end
							else//midle
							begin
							 in_xaui0_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:0]		<=	in_xaui0_pkt_q[133:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state 			<= transmit_s;
							end
				       end
					3'b001: begin
				        if(in_xaui1_pkt_q[133:132]	==	2'b01)//header
						   begin
							 in_xaui1_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:132]	<= 2'b11;
							 out_xaui_pkt[131:0]		<=	in_xaui1_pkt_q[131:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state 			<= transmit_s;
							end
							else if(in_xaui1_pkt_q[133:132]	==	2'b10)//tail
							begin
							 receive_pkt_add				<=	1'b1;
							 in_xaui1_pkt_rdreq			<=	1'b0;
							 out_xaui_pkt_wrreq			<=	1'b1;
							 out_xaui_pkt[133:0]			<=	in_xaui1_pkt_q[133:0];
							 out_xaui_pkt_valid_wrreq	<=	1'b1;
							 out_xaui_pkt_valid[11]		<=	1'b1;
							 out_xaui_pkt_valid[10:0]	<=	pkt_length + 11'd16 - in_xaui1_pkt_q[131:128];
							 current_state 				<= idle2_s;
							end
							else//midle
							begin
							 in_xaui1_pkt_rdreq	<=	1'b1;
							 out_xaui_pkt_wrreq	<=	1'b1;
							 out_xaui_pkt[133:0]	<=	in_xaui1_pkt_q[133:0];
							 pkt_length 			<= pkt_length +11'd16;
							 current_state 		<= transmit_s;
							end
				       end
					3'b010: begin
				        if(in_xaui2_pkt_q[133:132]	==	2'b01)//header
						   begin
							 in_xaui2_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:132]	<= 2'b11;
							 out_xaui_pkt[131:0]		<=	in_xaui2_pkt_q[131:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state 			<= transmit_s;
							end
							else if(in_xaui2_pkt_q[133:132]	==	2'b10)//tail
							begin
								receive_pkt_add				<=	1'b1;
							 in_xaui2_pkt_rdreq				<=	1'b0;
							 out_xaui_pkt_wrreq				<=	1'b1;
							 out_xaui_pkt[133:0]				<=	in_xaui2_pkt_q[133:0];
							 out_xaui_pkt_valid_wrreq		<=	1'b1;
							 out_xaui_pkt_valid[11]			<=	1'b1;
							 out_xaui_pkt_valid[10:0]		<=	pkt_length + 11'd16 - in_xaui2_pkt_q[131:128];
							 current_state 					<= idle3_s;
							end
							else//midle
							begin
							 in_xaui2_pkt_rdreq				<=	1'b1;
							 out_xaui_pkt_wrreq				<=	1'b1;
							 out_xaui_pkt[133:0]				<=	in_xaui2_pkt_q[133:0];
							 pkt_length 						<= pkt_length +11'd16;
							 current_state 					<= transmit_s;
							end
				       end
					3'b011: begin
				        if(in_xaui3_pkt_q[133:132]	==	2'b01)//header
						   begin
							 in_xaui3_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:132]	<= 2'b11;
							 out_xaui_pkt[131:0]		<=	in_xaui3_pkt_q[131:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state				<= transmit_s;
							end
							else if(in_xaui3_pkt_q[133:132]==	2'b10)//tail
							begin
								receive_pkt_add				<=	1'b1;
							 in_xaui3_pkt_rdreq				<=	1'b0;
							 out_xaui_pkt_wrreq				<=	1'b1;
							 out_xaui_pkt[133:0]				<=	in_xaui3_pkt_q[133:0];
							 out_xaui_pkt_valid_wrreq		<=	1'b1;
							 out_xaui_pkt_valid[11]			<=	1'b1;
							 out_xaui_pkt_valid[10:0]		<=	pkt_length + 11'd16 - in_xaui3_pkt_q[131:128];
							 current_state 					<= idle4_s;
							end
							else//midle
							begin
							 in_xaui3_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:0]		<=	in_xaui3_pkt_q[133:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state 			<= transmit_s;
							end
				       end 
					default: begin
				        if(in_xaui4_pkt_q[133:132]	==	2'b01)//header
						   begin
							 in_xaui4_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:132]	<= 2'b11;
							 out_xaui_pkt[131:0]		<=	in_xaui4_pkt_q[131:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state				<= transmit_s;
							end
							else if(in_xaui4_pkt_q[133:132]==	2'b10)//tail
							begin
								receive_pkt_add				<=	1'b1;
							 in_xaui4_pkt_rdreq				<=	1'b0;
							 out_xaui_pkt_wrreq				<=	1'b1;
							 out_xaui_pkt[133:0]				<=	in_xaui4_pkt_q[133:0];
							 out_xaui_pkt_valid_wrreq		<=	1'b1;
							 out_xaui_pkt_valid[11]			<=	1'b1;
							 out_xaui_pkt_valid[10:0]		<=	pkt_length + 11'd16 - in_xaui4_pkt_q[131:128];
							 current_state 					<= idle0_s;
							end
							else//midle
							begin
							 in_xaui4_pkt_rdreq		<=	1'b1;
							 out_xaui_pkt_wrreq		<=	1'b1;
							 out_xaui_pkt[133:0]		<=	in_xaui4_pkt_q[133:0];
							 pkt_length 				<= pkt_length +11'd16;
							 current_state 			<= transmit_s;
							end
				       end      	 
					endcase
				end
	endcase
end
//xaui0
reg 					in_xaui0_pkt_rdreq;
wire [133:0] 		in_xaui0_pkt_q;
wire 					out_xaui0_pkt_almostfull;
wire [7:0] 			fifo0_na_wrusedw;
reg 					in_xaui0_pkt_valid_rdreq;
wire  				in_xaui0_pkt_valid_q;
wire 					in_xaui0_pkt_valid_empty;
assign 				out_xaui0_pkt_almostfull =	fifo0_na_wrusedw[7];

asyn_256_134 xaui0_pkt(
								.aclr(!reset),
								.data(in_xaui0_pkt),
								.rdclk(clk),
								.rdreq(in_xaui0_pkt_rdreq),
								.wrclk(wrclk0),
								.wrreq(in_xaui0_pkt_wrreq),
								.q(in_xaui0_pkt_q),
								.wrusedw(fifo0_na_wrusedw)
								);	

asyn_64_1 xaui0_pkt_valid(
	.aclr(!reset),
	.data(in_xaui0_pkt_valid),
	.rdclk(clk),
	.rdreq(in_xaui0_pkt_valid_rdreq),
	.wrclk(wrclk0),
	.wrreq(in_xaui0_pkt_valid_wrreq),
	.q(in_xaui0_pkt_valid_q),
	.rdempty(in_xaui0_pkt_valid_empty));

//xaui1
reg 					in_xaui1_pkt_rdreq;
wire [133:0] 		in_xaui1_pkt_q;
wire 					out_xaui1_pkt_almostfull;
wire [7:0] 			fifo1_na_wrusedw;
reg 					in_xaui1_pkt_valid_rdreq;
wire  				in_xaui1_pkt_valid_q;
wire 					in_xaui1_pkt_valid_empty;
assign 				out_xaui1_pkt_almostfull =	fifo1_na_wrusedw[7];

asyn_256_134 xaui1_pkt(
								.aclr(!reset),
								.data(in_xaui1_pkt),
								.rdclk(clk),
								.rdreq(in_xaui1_pkt_rdreq),
								.wrclk(wrclk1),
								.wrreq(in_xaui1_pkt_wrreq),
								.q(in_xaui1_pkt_q),
								.wrusedw(fifo1_na_wrusedw)
								);	

asyn_64_1 xaui1_pkt_valid(
	.aclr(!reset),
	.data(in_xaui1_pkt_valid),
	.rdclk(clk),
	.rdreq(in_xaui1_pkt_valid_rdreq),
	.wrclk(wrclk1),
	.wrreq(in_xaui1_pkt_valid_wrreq),
	.q(in_xaui1_pkt_valid_q),
	.rdempty(in_xaui1_pkt_valid_empty));
//xaui2
reg 					in_xaui2_pkt_rdreq;
wire [133:0] 		in_xaui2_pkt_q;
wire 					out_xaui2_pkt_almostfull;
wire [7:0] 			fifo2_na_wrusedw;
reg 					in_xaui2_pkt_valid_rdreq;
wire  				in_xaui2_pkt_valid_q;
wire 					in_xaui2_pkt_valid_empty;
assign 				out_xaui2_pkt_almostfull =	fifo2_na_wrusedw[7];

asyn_256_134 xaui2_pkt(
								.aclr(!reset),
								.data(in_xaui2_pkt),
								.rdclk(clk),
								.rdreq(in_xaui2_pkt_rdreq),
								.wrclk(wrclk2),
								.wrreq(in_xaui2_pkt_wrreq),
								.q(in_xaui2_pkt_q),
								.wrusedw(fifo2_na_wrusedw)
								);	

asyn_64_1 xaui2_pkt_valid(
	.aclr(!reset),
	.data(in_xaui2_pkt_valid),
	.rdclk(clk),
	.rdreq(in_xaui2_pkt_valid_rdreq),
	.wrclk(wrclk2),
	.wrreq(in_xaui2_pkt_valid_wrreq),
	.q(in_xaui2_pkt_valid_q),
	.rdempty(in_xaui2_pkt_valid_empty));

//xaui3
reg 					in_xaui3_pkt_rdreq;
wire [133:0] 		in_xaui3_pkt_q;
wire 					out_xaui3_pkt_almostfull;
wire [7:0] 			fifo3_na_wrusedw;
reg 					in_xaui3_pkt_valid_rdreq;
wire  				in_xaui3_pkt_valid_q;
wire 					in_xaui3_pkt_valid_empty;
assign 				out_xaui3_pkt_almostfull =	fifo3_na_wrusedw[7];

asyn_256_134 xaui3_pkt(
								.aclr(!reset),
								.data(in_xaui3_pkt),
								.rdclk(clk),
								.rdreq(in_xaui3_pkt_rdreq),
								.wrclk(wrclk3),
								.wrreq(in_xaui3_pkt_wrreq),
								.q(in_xaui3_pkt_q),
								.wrusedw(fifo3_na_wrusedw)
								);	

asyn_64_1 xaui3_pkt_valid(
	.aclr(!reset),
	.data(in_xaui3_pkt_valid),
	.rdclk(clk),
	.rdreq(in_xaui3_pkt_valid_rdreq),
	.wrclk(wrclk3),
	.wrreq(in_xaui3_pkt_valid_wrreq),
	.q(in_xaui3_pkt_valid_q),
	.rdempty(in_xaui3_pkt_valid_empty));
	
//xaui4
reg 					in_xaui4_pkt_rdreq;
wire [133:0] 		in_xaui4_pkt_q;
wire 					out_xaui4_pkt_almostfull;
wire [7:0] 			fifo4_na_wrusedw;
reg 					in_xaui4_pkt_valid_rdreq;
wire  				in_xaui4_pkt_valid_q;
wire 					in_xaui4_pkt_valid_empty;
assign 				out_xaui4_pkt_almostfull =	fifo4_na_wrusedw[7];

asyn_256_134 xaui4_pkt(
								.aclr(!reset),
								.data(in_xaui4_pkt),
								.rdclk(clk),
								.rdreq(in_xaui4_pkt_rdreq),
								.wrclk(wrclk4),
								.wrreq(in_xaui4_pkt_wrreq),
								.q(in_xaui4_pkt_q),
								.wrusedw(fifo4_na_wrusedw)
								);	

asyn_64_1 xaui4_pkt_valid(
	.aclr(!reset),
	.data(in_xaui4_pkt_valid),
	.rdclk(clk),
	.rdreq(in_xaui4_pkt_valid_rdreq),
	.wrclk(wrclk4),
	.wrreq(in_xaui4_pkt_valid_wrreq),
	.q(in_xaui4_pkt_valid_q),
	.rdempty(in_xaui4_pkt_valid_empty));
endmodule 