// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <NULL>
*
* If there is no OPEN-SOURCE licenses are listed, it indicates none of
* content in this Code document is sourced from OPEN-SOURCE communities. 
*
* In this case, the document is protected by copyright, and any use of
* all or part of its content by individuals, organizations, or companies
* without authorization is prohibited, unless the project repository
* associated with this document has added relevant OPEN-SOURCE licenses
* by github.com/MongooseOrion. 
*
* Please make sure using the content of this document in accordance with 
* the respective OPEN-SOURCE licenses. 
* 
* THIS CODE IS PROVIDED BY https://github.com/MongooseOrion. 
* FILE ENCODER TYPE: GBK
* ========================================================================
*/
// 用于存储和读取字符数据的模块
//
module osd_display #(
parameter x_start1   =  12'd9,           //更改显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start1  =   12'd9,
parameter interval=     8'd100,                 //修改此处改变行间隔
parameter color_char  = 24'hff0000       //更改字符颜色
)
(
	input                       rst_n,   
	input                       pclk,
	input[23:0]                 wave_color,
	input                       adc_clk,
	input                        adc_buf_wr,
	input[11:0]                 adc_buf_addr,
	input[7:0]                  adc_buf_data,
	input                       i_hs,    
	input                       i_vs,    
	input                       i_de,	
	input[23:0]                 i_data,  
	output                      o_hs,    
	output                      o_vs,    
	output                      o_de,    
	output[23:0]                o_data,
    output [10:0]               ram_addr,
    input  [2:0]                channel_index,
    input [7:0]                 i_data_char,
    input [8:0]                 angle_num,     	// 输入的角度数字，3位十进制
    input [10:0]                scale_value, 	// 输入的比例数字，高7位是整数部分，低4位是小数部分
    input                       udp_rec_data_valid
);

// 以太网显示区域
parameter OSD_WIDTH1   =  12'd128;  // 更改ram显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT1  =  12'd32;

// 总输入源
parameter OSD_WIDTH   =  12'd152;  // 更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT  =  12'd45;
parameter x_start = x_start1;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start = y_start1+interval-4'd6;

//当前通道
parameter OSD_WIDTH2   =  12'd152;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT2  =  12'd45;
parameter x_start2   =  x_start;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start2  =  y_start+interval;

//通道数字显示区域
parameter OSD_WIDTH3   =  12'd16;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT3  =  12'd33;
parameter x_start3   =  x_start2+OSD_WIDTH2;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start3  =  y_start2+4'd6;

//旋转角度
parameter OSD_WIDTH4   =  12'd152;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT4  =  12'd45;
parameter x_start4   = x_start2 ;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start4  =  y_start2+interval;

//旋转角度数字显示区域
parameter OSD_WIDTH5   =  12'd48;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT5  =  12'd33;
parameter x_start5   = x_start3 ;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start5  =  y_start4+4'd4;

//度 显示区域
parameter OSD_WIDTH6   =  12'd32;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT6  =  12'd42;
parameter x_start6   = x_start5+OSD_WIDTH5+3'd3 ;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start6  =  y_start5-4'd4;

//缩放比例 显示区域
parameter OSD_WIDTH7   =  12'd152;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT7  =  12'd45;
parameter x_start7   = x_start4 ;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start7  =  y_start4+interval;

//缩放比例数字
parameter OSD_WIDTH8   =  12'd56;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT8  =  12'd33;
parameter x_start8   = x_start5 ;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start8  =  y_start5+interval;

//总输入源数字显示区域
parameter OSD_WIDTH9   =  12'd16;  //更改rom显示区域的大小，要和取的字模的大小一样
parameter OSD_HEGIHT9  =  12'd33;
parameter x_start9   = x_start+OSD_WIDTH;  //更改rom显示区域起始位置，要注意剩余的区域不能比显示区域小
parameter y_start9  =  y_start+4'd6;

wire[11:0] pos_x;
wire[11:0] pos_y;
wire       pos_hs;
wire       pos_vs;
wire       pos_de;
wire[3:0]  baiwei;   //百位，十位，个位
wire[3:0]  shiwei;
wire[3:0]  gewei;
wire[3:0]  shiwei1;
wire[3:0]  gewei1;
wire[23:0] pos_data;
reg[23:0]  v_data;
reg[11:0]  osd_x;
reg[11:0]  osd_y;
reg[15:0]  osd_ram_addr;
(* MARK_DEBUG="true" *)wire[7:0]  q1;
wire[7:0]  data;
wire[7:0]  data1;
wire[7:0]  data3;
wire[7:0]  data4;
wire[7:0]  data7;
reg        region_active;
reg        region_active_d0;
reg        region_active_d1;
reg        region_active_d2;
reg[9:0] osd_ram_addr3_reg;
reg        pos_vs_d0;
reg        pos_vs_d1;

reg[11:0]  osd_x1;
reg[11:0]  osd_y1;
reg[15:0]  osd_ram_addr1;
reg        region_active1;
reg        region_active1_d0;
reg        region_active1_d1;
reg        region_active1_d2;
reg[11:0]  osd_x2;
reg[11:0]  osd_y2;
reg[15:0]  osd_ram_addr2;
reg        region_active2;
reg        region_active2_d0;
reg        region_active2_d1;
reg        region_active2_d2;
reg[11:0]  osd_x3;
reg[11:0]  osd_y3;
reg[15:0]  osd_ram_addr3;
reg        region_active3;
reg        region_active3_d0;
reg        region_active3_d1;
reg        region_active3_d2;
reg[11:0]  osd_x4;
reg[11:0]  osd_y4;
reg[15:0]  osd_ram_addr4;
reg        region_active4;
reg        region_active4_d0;
reg        region_active4_d1;
reg        region_active4_d2;
reg[11:0]  osd_x5;
reg[11:0]  osd_y5;
reg[15:0]  osd_ram_addr5;
reg        region_active5;
reg        region_active5_d0;
reg        region_active5_d1;
reg        region_active5_d2;
reg[11:0]  osd_x6;
reg[11:0]  osd_y6;
reg[15:0]  osd_ram_addr6;
reg        region_active6;
reg        region_active6_d0;
reg        region_active6_d1;
reg        region_active6_d2;
reg[11:0]  osd_x7;
reg[11:0]  osd_y7;
reg[15:0]  osd_ram_addr7;
reg        region_active7;
reg        region_active7_d0;
reg        region_active7_d1;
reg        region_active7_d2;
reg[11:0]  osd_x8;
reg[11:0]  osd_y8;
reg[15:0]  osd_ram_addr8;
reg        region_active8;
reg        region_active8_d0;
reg        region_active8_d1;
reg        region_active8_d2;
reg[11:0]  osd_x9;
reg[11:0]  osd_y9;
reg[15:0]  osd_ram_addr9;
reg        region_active9;
reg        region_active9_d0;
reg        region_active9_d1;
reg        region_active9_d2;


assign baiwei=angle_num/100;
assign shiwei=(angle_num-baiwei*7'd100)/10;
assign gewei=angle_num%10;
assign shiwei1=scale_value[10:4]/10;
assign gewei1=scale_value[10:4]%10;
assign o_data = v_data;
assign o_hs = pos_hs;
assign o_vs = pos_vs;
assign o_de = pos_de;
assign ram_addr = osd_ram_addr1[13:3];
assign data = (udp_rec_data_valid==1)?i_data_char:8'd0; 
//两区域不能有交叉，否则交叉部分，rom区域会覆盖ram区域，ram区域显示不完整

wire[9:0] osd_ram_addr2_reg;
assign osd_ram_addr2_reg=(region_active2 == 1'b1)?osd_ram_addr2[12:3]:(osd_ram_addr2[12:3]+10'd855);

//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start && pos_y <= y_start + OSD_HEGIHT - 12'd1 && pos_x >= x_start && pos_x  <= x_start + OSD_WIDTH - 12'd1)
		region_active <= 1'b1;
	else
		region_active <= 1'b0;
end


always@(posedge pclk)
begin
	region_active_d0 <= region_active;
	region_active_d1 <= region_active_d0;
	region_active_d2 <= region_active_d1;
end

always@(posedge pclk)
begin
	pos_vs_d0 <= pos_vs;
	pos_vs_d1 <= pos_vs_d0;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active_d0 == 1'b1)
		osd_x <= osd_x + 12'd1;
	else
		osd_x <= 12'd0;
end


always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)
		osd_ram_addr <= 16'd0;
	else if(region_active == 1'b1)
		osd_ram_addr <= osd_ram_addr + 16'd1;
end


always@(posedge pclk)
begin
	if(region_active_d0 == 1'b1)
		if(q1[osd_x[2:0]] == 1'b1)
			v_data <= color_char; //  总输入
		else
			v_data <= pos_data;
	else if(region_active1_d0 == 1'b1)
		if(data[osd_x1[2:0]] == 1'b1)
			v_data <= color_char; //  以太网字符
		else
			v_data <= pos_data;
	else if(region_active9_d0 == 1'b1)
		if(data3[osd_x9[2:0]] == 1'b1)
			v_data <= color_char; //  总输入数字字符
		else
			v_data <= pos_data;
	else if(region_active2_d0 == 1'b1)
		if(data1[osd_x2[2:0]] == 1'b1)
			v_data <= color_char; //  当前通道字符
		else
			v_data <= pos_data;
	else if(region_active3_d0 == 1'b1)
		if(data3[osd_x3[2:0]] == 1'b1)
			v_data <= color_char; //  当前通道数字字符
		else
			v_data <= pos_data;
	else if(region_active4_d0 == 1'b1)
		if(data4[osd_x4[2:0]] == 1'b1)
			v_data <= color_char; //  旋转角度字符
		else
			v_data <= pos_data;
	else if(region_active5_d0 == 1'b1)
		if(data3[osd_x5[2:0]] == 1'b1)
			v_data <= color_char; //  旋转角度数字字符
		else
			v_data <= pos_data;
	else if(region_active6_d0 == 1'b1)
		if(data1[osd_x6[2:0]] == 1'b1)
			v_data <= color_char; //  度 字符
		else
			v_data <= pos_data;
	else if(region_active7_d0 == 1'b1)
		if(data7[osd_x7[2:0]] == 1'b1)
			v_data <= color_char; //  缩放比例 字符
		else
			v_data <= pos_data;
	else if(region_active8_d0 == 1'b1)
		if(data3[osd_x8[2:0]] == 1'b1)
			v_data <= color_char; //  旋转角度数字字符
		else
			v_data <= pos_data;
	else
		v_data <= pos_data;
end


osd_rom1 disp_total_input (
  .addr(osd_ram_addr[12:3]),          // input [9:0]
  .clk(pclk),            // input
  .rst(1'b0),            // input
  .rd_data(q1)     // output [7:0]
);

osd_rom2 disp_now_input (
  .addr(osd_ram_addr2_reg),          // input [9:0]
  .clk(pclk),            // input
  .rst(1'b0),            // input
  .rd_data(data1)     // output [7:0]
);

osd_rom3 disp_num (
  .addr(osd_ram_addr3_reg),          // input [9:0]
  .clk(pclk),            // input
  .rst(1'b0),            // input
  .rd_data(data3)     // output [7:0]
);

osd_rom4 disp_angle (
  .addr(osd_ram_addr4[12:3]),          // input [9:0]
  .clk(pclk),            // input
  .rst(1'b0),            // input
  .rd_data(data4)     // output [7:0]
);

osd_rom5 disp_scale (
  .addr(osd_ram_addr7[12:3]),          // input [9:0]
  .clk(pclk),            // input
  .rst(1'b0),            // input
  .rd_data(data7)     // output [7:0]
);


//osdrom2 the_instance_name2 (
//  .addr(osd_ram_addr[12:3]),          // input [9:0]
//  .clk(pclk),            // input
//  .rst(1'b0),            // input
//  .rd_data(q1)     // output [7:0]
//);
//以太网显示区域***************************************************************************************************************


//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start1 && pos_y <= y_start1 + OSD_HEGIHT1 - 12'd1 && pos_x >= x_start1 && pos_x  <= x_start1 + OSD_WIDTH1 - 12'd1)
		region_active1 <= 1'b1;
	else
		region_active1 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active1_d0 <= region_active1;
	region_active1_d1 <= region_active1_d0;
	region_active1_d2 <= region_active1_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active1_d0 == 1'b1)
		osd_x1 <= osd_x1 + 12'd1;

	else
		osd_x1 <= 12'd0;
end


always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)
		osd_ram_addr1 <= 16'd0;
	else if(region_active1 == 1'b1)
		osd_ram_addr1 <= osd_ram_addr1 + 16'd1;
end

//当前通道**********************************************************************************************************************************************


//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start2 && pos_y <= y_start2 + OSD_HEGIHT2 - 12'd1 && pos_x >= x_start2 && pos_x  <= x_start2 + OSD_WIDTH2 - 12'd1)
		region_active2 <= 1'b1;
	else
		region_active2 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active2_d0 <= region_active2;
	region_active2_d1 <= region_active2_d0;
	region_active2_d2 <= region_active2_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active2_d0 == 1'b1)
		osd_x2 <= osd_x2 + 12'd1;

	else
		osd_x2 <= 12'd0;
end


always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)
		osd_ram_addr2 <= 16'd0;
	else if( pos_y==y_start2+6'd50)
		osd_ram_addr2 <= 16'd0;
	else if(region_active2 == 1'b1||region_active6 == 1'b1)
		osd_ram_addr2 <= osd_ram_addr2 + 16'd1;
end



//通道数字显示区域***********************************************************************************************



//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start3 && pos_y <= y_start3 + OSD_HEGIHT3- 12'd1 && pos_x >= x_start3 && pos_x  <= x_start3 + OSD_WIDTH3 - 12'd1)
		region_active3 <= 1'b1;
	else
		region_active3 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active3_d0 <= region_active3;
	region_active3_d1 <= region_active3_d0;
	region_active3_d2 <= region_active3_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active3_d0 == 1'b1)
		osd_x3 <= osd_x3 + 12'd1;

	else
		osd_x3 <= 12'd0;
end


always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)
		osd_ram_addr3 <= 16'd0;
	else if(pos_y==y_start3+8'd50||pos_y==y_start5+8'd50||pos_y==y_start+8'd50)
		osd_ram_addr3 <= 16'd0;    
	else if(region_active3 == 1'b1||region_active5 == 1'b1||region_active8 == 1'b1||region_active9 == 1'b1)
		osd_ram_addr3 <= osd_ram_addr3 + 16'd1;
end

always @(*)begin
    if(region_active3 == 1'b1)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+7'd66*channel_index;
    else if(region_active9 == 1'b1)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+10'd264;   
    else if(region_active5 == 1'b1&&pos_x>=x_start5+12'd0&&pos_x<=x_start5+12'd15)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+baiwei*7'd66-(pos_y-y_start5)*3'd4;
    else if(region_active5 == 1'b1&&pos_x>=x_start5+12'd16&&pos_x<=x_start5+12'd31)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+shiwei*7'd66-(pos_y-y_start5)*3'd4-3'd2; //旋转角度数字地址生成
    else if(region_active5 == 1'b1&&pos_x>=x_start5+12'd32&&pos_x<=x_start5+12'd47)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+gewei*7'd66-(pos_y-y_start5)*3'd4-3'd4;

    else if(region_active8 == 1'b1&&pos_x>=x_start8+12'd0&&pos_x<=x_start8+12'd15)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+shiwei1*7'd66-(pos_y-y_start8)*3'd5;
    else if(region_active8 == 1'b1&&pos_x>=x_start8+12'd16&&pos_x<=x_start8+12'd31)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+gewei1*7'd66-(pos_y-y_start8)*3'd5-3'd2; //缩放比例数字地址生成
    else if(region_active8 == 1'b1&&pos_x>=x_start8+12'd32&&pos_x<=x_start8+12'd39)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+4'd10*7'd66-(pos_y-y_start8)*3'd6-3'd4;
    else if(region_active8 == 1'b1&&pos_x>=x_start8+12'd40&&pos_x<=x_start8+12'd55)
        osd_ram_addr3_reg = osd_ram_addr3[12:3]+scale_value[3:0]*7'd66-(pos_y-y_start8)*3'd5-3'd5;

    else
        osd_ram_addr3_reg = osd_ram_addr3_reg;

end
//assign osd_ram_addr3_reg=(region_active3 == 1'b1):(osd_ram_addr3[12:3]+10'd132):();


//旋转角度：(文字显示)*********************************************************************************************



//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start4 && pos_y <= y_start4 + OSD_HEGIHT4 - 12'd1 && pos_x >= x_start4 && pos_x  <= x_start4 + OSD_WIDTH4 - 12'd1)
		region_active4 <= 1'b1;
	else
		region_active4 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active4_d0 <= region_active4;
	region_active4_d1 <= region_active4_d0;
	region_active4_d2 <= region_active4_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active4_d0 == 1'b1)
		osd_x4 <= osd_x4 + 12'd1;

	else
		osd_x4 <= 12'd0;
end


always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)
		osd_ram_addr4 <= 16'd0;
	else if(region_active4 == 1'b1)
		osd_ram_addr4 <= osd_ram_addr4 + 16'd1;
end
//角度数字显示区域，和通道数字共用一个rom**********************************************************************



//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start5 && pos_y <= y_start5 + OSD_HEGIHT5 - 12'd1 && pos_x >= x_start5 && pos_x  <= x_start5 + OSD_WIDTH5 - 12'd1)
		region_active5 <= 1'b1;
	else
		region_active5 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active5_d0 <= region_active5;
	region_active5_d1 <= region_active5_d0;
	region_active5_d2 <= region_active5_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active5_d0 == 1'b1)
		osd_x5 <= osd_x5 + 12'd1;

	else
		osd_x5 <= 12'd0;
end

//度数符号显示区域，和当前通道共用一个rom*************************************************************


//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start6 && pos_y <= y_start6 + OSD_HEGIHT6 - 12'd1 && pos_x >= x_start6 && pos_x  <= x_start6 + OSD_WIDTH6 - 12'd1)
		region_active6 <= 1'b1;
	else
		region_active6 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active6_d0 <= region_active6;
	region_active6_d1 <= region_active6_d0;
	region_active6_d2 <= region_active6_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active6_d0 == 1'b1)
		osd_x6 <= osd_x6 + 12'd1;

	else
		osd_x6 <= 12'd0;
end

//缩放比例**********************************************************************************************************



//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start7 && pos_y <= y_start7 + OSD_HEGIHT7 - 12'd1 && pos_x >= x_start7 && pos_x  <= x_start7 + OSD_WIDTH7 - 12'd1)
		region_active7 <= 1'b1;
	else
		region_active7 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active7_d0 <= region_active7;
	region_active7_d1 <= region_active7_d0;
	region_active7_d2 <= region_active7_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active7_d0 == 1'b1)
		osd_x7 <= osd_x7 + 12'd1;

	else
		osd_x7 <= 12'd0;
end


always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)
		osd_ram_addr7 <= 16'd0;
	else if(region_active7 == 1'b1)
		osd_ram_addr7 <= osd_ram_addr7 + 16'd1;
end

//缩放比例数字***************************************************************************************************


//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start8 && pos_y <= y_start8 + OSD_HEGIHT8 - 12'd1 && pos_x >= x_start8 && pos_x  <= x_start8 + OSD_WIDTH8 - 12'd1)
		region_active8 <= 1'b1;
	else
		region_active8 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active8_d0 <= region_active8;
	region_active8_d1 <= region_active8_d0;
	region_active8_d2 <= region_active8_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active8_d0 == 1'b1)
		osd_x8 <= osd_x8 + 12'd1;

	else
		osd_x8 <= 12'd0;
end

//总输入数字显示***************************************************************************************************

//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= y_start9 && pos_y <= y_start9 + OSD_HEGIHT9 - 12'd1 && pos_x >= x_start9 && pos_x  <= x_start9 + OSD_WIDTH9 - 12'd1)
		region_active9 <= 1'b1;
	else
		region_active9 <= 1'b0;
end


always@(posedge pclk)
begin
	region_active9_d0 <= region_active9;
	region_active9_d1 <= region_active9_d0;
	region_active9_d2 <= region_active9_d1;
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active9_d0 == 1'b1)
		osd_x9 <= osd_x9 + 12'd1;

	else
		osd_x9 <= 12'd0;
end

//下面实例化了有效位置
timing_gen_xy timing_gen_xy_m0(
	.rst_n    (rst_n    ),
	.clk      (pclk     ),
	.i_hs     (i_hs     ),
	.i_vs     (i_vs     ),
	.i_de     (i_de     ),
	.i_data   (i_data   ),
	.o_hs     (pos_hs   ),
	.o_vs     (pos_vs   ),
	.o_de     (pos_de   ),
	.o_data   (pos_data ),
	.x        (pos_x    ),
	.y        (pos_y    )
);
endmodule