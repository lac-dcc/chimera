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
	input	wire       	clk_24m,
	input   wire       rst_n,
	input   wire [31:0] sm_bit_num,     
    output	wire [7:0] 	sm_seg,
    output	wire [3:0] 	sm_bit
);

wire 		rst_n;
reg [24:0] 	cnt;
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

always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		cnt  <= 0;
	else if(cnt == CNT_TIME)//0.1Hz
	begin
		cnt <= 0;
		sm_bit1_num   <= sm_bit_num[3:0]; 
		sm_bit2_num   <= sm_bit_num[7:4]; 
		sm_bit3_num   <= sm_bit_num[11:8]; 
		sm_bit4_num   <= sm_bit_num[15:12]; 
	end	
	else
		cnt <= cnt + 1'b1;
end



		
always@(posedge clk_24m or negedge rst_n)
begin
	if(!rst_n)
		cnt_w <= 18'd0;
	else if(cnt_w == 18'b111_111_111_111_111_111)  
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


module bin2bcd(
input wire [7:0]b,
output reg [9:0]p
);
reg [17:0]z;
integer i;
always@(*)
begin
	for(i=0;i<=17;i=i+1)
		z[i]=0;
		
	z[10:3]=b;	
	repeat(5)
	begin
		if(z[11:8]>4)
			z[11:8]=z[11:8]+3;
		if(z[15:12]>4)
			z[15:12]=z[15:12]+3;
		z[17:1]=z[16:0];
	end
	p=z[17:8];
end

endmodule