// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns/ 1ps
// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		数码管 显示
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
module seg4
#(
	parameter CNT_TIME = 2400_000 //0.1s
)
( 
	input	wire       clk_24m,
    output	wire [7:0] sm_seg,
    output	wire [3:0] sm_bit
);

wire 		rst_n;
reg [24:0] 	cnt;
reg [3:0]  	addr;
reg [3:0] 	sm_bit1_num;
reg [3:0] 	sm_bit2_num;
reg [3:0] 	sm_bit3_num;
reg [3:0] 	sm_bit4_num;
//计数器，约为10ms扫描一次
reg [17:0] 	cnt_w;
//数码管位选
reg [3:0] 	sm_bit_reg;
reg [3:0] 	sm_seg_num ;
reg [7:0]	sm_seg_reg;	
localparam
			S0 = 4'b0000 ,
			S1 = 4'b0001 ,
			S2 = 4'b0010 ,
			S3 = 4'b0011 ,
			S4 = 4'b0100 ,
			S5 = 4'b0101 ,
			S6 = 4'b0110 ,
			S7 = 4'b0111 ,
			S8 = 4'b1000 ,
			S9 = 4'b1001 ;

rst_n ux_rst
(
	.clk	(clk_24m	),
	.rst_n	(rst_n		)
);			

always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		cnt  <= 0;
	else if(cnt == CNT_TIME)//0.1Hz
		cnt <= 0;
	else
		cnt <= cnt + 1'b1;
end

always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		sm_bit1_num <= 4'h0;
	else if(cnt == CNT_TIME)//0.1Hz
	begin
		if(sm_bit1_num == 9)
			sm_bit1_num <= 4'h0;
		else
			sm_bit1_num <= sm_bit1_num + 1'b1;
	end
	else
		sm_bit1_num <= sm_bit1_num;
end
	
always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		sm_bit2_num <= 4'h0;
	else if(cnt == CNT_TIME && sm_bit1_num == 9)
	begin		
		if(sm_bit2_num == 10 )
			sm_bit2_num <= 4'h0;
		else 
			sm_bit2_num <= sm_bit2_num + 1;
	end
	else
		sm_bit2_num <= sm_bit2_num;
end	
		
always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		sm_bit3_num <= 4'h0;
	else if(cnt == CNT_TIME && sm_bit2_num == 9 && sm_bit1_num == 9)
	begin		
		if(sm_bit3_num == 10 )
			sm_bit3_num <= 4'h0;
		else
			sm_bit3_num <= sm_bit3_num + 1;
	end
	else
		sm_bit3_num <= sm_bit3_num;
end	
	
always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		sm_bit4_num <= 4'h0;
	else if(cnt == CNT_TIME && sm_bit3_num == 9 && sm_bit2_num == 9 && sm_bit1_num == 9)
	begin		
		if(sm_bit4_num == 10)
			sm_bit4_num <= 4'h0;
		else
			sm_bit4_num <= sm_bit4_num + 1;
	end
	else
		sm_bit4_num <= sm_bit4_num;
end							
		
always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		cnt_w <= 18'd0;
	else if(cnt_w == 18'b111_111_111_111_111_111)  
	// else if(&cnt_w)  
		cnt_w <= 18'd0;
	else
		cnt_w <= cnt_w + 1;
end

always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		sm_seg_num   <= 4'h0;
	else
	begin
		case( cnt_w[17:16] )
		2'b00:sm_seg_num   <= sm_bit1_num; 
		2'b01:sm_seg_num   <= sm_bit2_num; 
		2'b10:sm_seg_num   <= sm_bit3_num; 
		2'b11:sm_seg_num   <= sm_bit4_num; 
		endcase
	end
end

always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		sm_bit_reg <= 4'b1111;
	else
	begin
		case( cnt_w[17:16] )
		2'b00:sm_bit_reg <= 4'b1110; 
		2'b01:sm_bit_reg <= 4'b1101; 
		2'b10:sm_bit_reg <= 4'b1011; 
		2'b11:sm_bit_reg <= 4'b0111; 
		endcase
	end
end
			
always@(*)
begin
	case ( sm_seg_num )
	S0:
		sm_seg_reg <= 8'hc0;
	S1:               
		sm_seg_reg <= 8'hf9;
	S2:               
		sm_seg_reg <= 8'ha4;
	S3:               
		sm_seg_reg <= 8'hb0;
	S4:               
		sm_seg_reg <= 8'h99;
	S5:               
		sm_seg_reg <= 8'h92;
	S6:               
		sm_seg_reg <= 8'h82;
	S7:               
		sm_seg_reg <= 8'hf8;
	S8:               
		sm_seg_reg <= 8'h80;
	S9:               
		sm_seg_reg <= 8'h90;
	default:sm_seg_reg <= 8'hc0;
	endcase
end	
					
assign sm_seg = sm_seg_reg;	
assign sm_bit = sm_bit_reg;	
	
endmodule
