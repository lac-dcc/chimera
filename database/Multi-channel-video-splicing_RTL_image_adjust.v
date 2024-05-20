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
// 视频数据后处理，亮度、色相、灰阶
//
module image_adjust #(
	parameter OSD_WIDTH   =  12'd960,
    parameter OSD_HEGIHT  =  12'd540,
	parameter x_start     =  12'd1,     //亮度调节区域的起始坐标，显示区域大小，当前参数默认显示区域为下大半屏幕,可修改成全屏。
	parameter y_start     =  12'd180
)(
	input                       rst_n, 
    input                       sys_clk,  
	input                       pclk,
	input                       i_hs,    
	input                       i_vs,    
	input                       i_de,	
	input[23:0]                 i_data,  
	input                       command_flag,   //作为操作的标志信号
    input       [3:0]           ctrl_command_in,       // 控制信道
    input       [3:0]           value_command_in,   // 数据通道    
	output                      o_hs/*synthesis PAP_MARK_DEBUG="1"*/,    
	output                      o_vs/*synthesis PAP_MARK_DEBUG="1"*/,    
	output                      o_de/*synthesis PAP_MARK_DEBUG="1"*/,    
	output[23:0]                o_data/*synthesis PAP_MARK_DEBUG="1"*/
);

wire[11:0] pos_x;
wire[11:0] pos_y;
wire       pos_hs;
wire       pos_vs;
wire       pos_de;
wire[23:0] pos_data;
reg        image_mode ;
reg [8:0]  r_data/*synthesis PAP_MARK_DEBUG="1"*/; //设定成9位，可以通过判断值是否大于255进行溢出检测
reg [8:0]  g_data/*synthesis PAP_MARK_DEBUG="1"*/;
reg [8:0]  b_data/*synthesis PAP_MARK_DEBUG="1"*/;

reg[8:0]   r_data_d1/*synthesis PAP_MARK_DEBUG="1"*/; ////设定成9位，可以通过判断值是否大于255进行溢出检测
reg[8:0]   g_data_d1/*synthesis PAP_MARK_DEBUG="1"*/;
reg[8:0]   b_data_d1/*synthesis PAP_MARK_DEBUG="1"*/;

wire[7:0]  r_data_reg/*synthesis PAP_MARK_DEBUG="1"*/;
wire[7:0]  g_data_reg/*synthesis PAP_MARK_DEBUG="1"*/;
wire[7:0]  b_data_reg/*synthesis PAP_MARK_DEBUG="1"*/;
wire[7:0]  rs232_data_d1;

wire [7:0] r_data_hue/*synthesis PAP_MARK_DEBUG="1"*/;
wire [7:0] g_data_hue/*synthesis PAP_MARK_DEBUG="1"*/;
wire [7:0] b_data_hue/*synthesis PAP_MARK_DEBUG="1"*/;

wire[23:0] v_data_reg;      
reg        region_active/*synthesis PAP_MARK_DEBUG="1"*/;
reg [7:0]  brightness_cnt='d100/*synthesis PAP_MARK_DEBUG="1"*/;
reg [7:0]  hue_cnt = 'd100     /*synthesis PAP_MARK_DEBUG="1"*/;   //hue:色相
reg           o_hs_reg;
reg           o_vs_reg;
reg           o_de_reg;
reg           o_hs_reg2;
reg           o_vs_reg2;
reg           o_de_reg2;
reg        pos_vs_d0;
reg        pos_vs_d1;
reg [7:0]  data_Gray;

assign rs232_data_d1 = {ctrl_command_in,value_command_in};

assign o_data = (image_mode == 1'b1 && region_active == 1'b1) ? {data_Gray,data_Gray,data_Gray} :{r_data_hue,g_data_hue,b_data_hue};
assign o_hs = o_hs_reg2;
assign o_vs = o_vs_reg2;
assign o_de = o_de_reg2;

assign r_data_reg = (r_data <= 8'd255) ? r_data[7:0]:'d255;//亮度溢出处理
assign g_data_reg = (g_data <= 8'd255) ? g_data[7:0]:'d255; 
assign b_data_reg = (b_data <= 8'd255) ? b_data[7:0]:'d255; 

assign r_data_hue = (r_data_d1 <= 8'd255) ? r_data_d1[7:0]:'d255;//色相溢出处理
assign g_data_hue = (g_data_d1 <= 8'd255) ? g_data_d1[7:0]:'d255; 
assign b_data_hue = (b_data_d1 <= 8'd255) ? b_data_d1[7:0]:'d255; 
//三通道转换为单通道，阴影图像数据
always @(posedge sys_clk) begin
    if(image_mode == 1'b0 )begin
        data_Gray <= 8'd0;
    end
    else begin
        data_Gray <= ((r_data_hue*306 + r_data_hue*601 + r_data_hue*117) >> 10);
    end
end
//亮度调节参数以及色相调节参数，防止向下溢出，初值定为100.系统50m时钟下
always@(posedge sys_clk )begin
	if (rs232_data_d1[7:0] == 8'b01110000 && command_flag == 1'b1) begin
		brightness_cnt <= 'd100;
	end
	else if (rs232_data_d1[7:3] == 5'b01110 && command_flag == 1'b1) begin
		brightness_cnt <= brightness_cnt + rs232_data_d1[2:0];
	end
	else if (rs232_data_d1[7:3] == 5'b01111 && command_flag == 1'b1) begin
		brightness_cnt <= brightness_cnt - rs232_data_d1[2:0];
	end
	else
	   brightness_cnt  <= brightness_cnt;
end

always@(posedge sys_clk )begin
	if (rs232_data_d1[7:0] == 8'b10000000 && command_flag == 1'b1) begin
	    hue_cnt <= 'd100;
	end
	else if (rs232_data_d1[7:3] == 5'b10000 && command_flag == 1'b1) begin
		hue_cnt <= hue_cnt + rs232_data_d1[2:0];
	end
	else if (rs232_data_d1[7:3] == 5'b10001 && command_flag == 1'b1) begin
		hue_cnt <= hue_cnt - rs232_data_d1[2:0];
	end
	else
	   hue_cnt  <= hue_cnt;
end
//黑白显示开关
always@(posedge sys_clk )begin
	if (rs232_data_d1[7:0] == 8'b01100000 && command_flag == 1'b1) begin
	    image_mode <= 1'b0;
	end
	else if (rs232_data_d1[7:0] == 8'b01100001 && command_flag == 1'b1) begin
	    image_mode <= 1'b1;
	end
	else
	   image_mode  <= image_mode;
end
//行场信号延迟
always@(posedge pclk)
begin
	if(!rst_n)begin
		 o_hs_reg <= 1'b0;
         o_vs_reg <= 1'b0;
         o_de_reg <= 1'b0;
	end
	else begin
		 o_hs_reg <= pos_hs;
		 o_hs_reg2<=o_hs_reg;
         o_vs_reg <= pos_vs;
		 o_vs_reg2 <= o_vs_reg;
         o_de_reg <= pos_de;
		 o_de_reg2<= o_de_reg;
		
	end
end
//亮度区域范围，行列坐标均从0开始
always@(posedge pclk)
begin
	if(pos_y >= y_start && pos_y <= y_start + OSD_HEGIHT - 12'd1 && pos_x >= x_start + 2'd1 && pos_x  <= x_start + OSD_WIDTH )
		region_active <= 1'b1;
	else
		region_active <= 1'b0;
end


always@(posedge pclk)
begin
	pos_vs_d0 <= pos_vs;
	pos_vs_d1 <= pos_vs_d0;
end

//亮度调节，在timing_gen_xy.v 延时后的数据进行处理
always@(posedge pclk)
begin
	if(region_active == 1'b1) begin
		if (brightness_cnt >= 'd100) begin
            r_data <= pos_data[23:16]+brightness_cnt-'d100;
            g_data <= pos_data[15:8]+brightness_cnt-'d100;
            b_data <= pos_data[7:0]+brightness_cnt-'d100; 
		   end
	    else if (brightness_cnt < 'd100) begin
            r_data <= (pos_data[23:16]<(8'd100-brightness_cnt))?8'd0:pos_data[23:16]+brightness_cnt-'d100;
            g_data <= (pos_data[15:8]<(8'd100-brightness_cnt))?8'd0:pos_data[15:8]+brightness_cnt-'d100;
            b_data <= (pos_data[7:0]<(8'd100-brightness_cnt))?8'd0:pos_data[7:0]+brightness_cnt-'d100;  
	      end 
	   	else begin
	        r_data <= pos_data[23:16];
            g_data <= pos_data[15:8];
            b_data <= pos_data[7:0];
	     end    
       end       
	else begin
	   r_data <= pos_data[23:16];
       g_data <= pos_data[15:8];
       b_data <= pos_data[7:0];
	end
end

//色相调节，对次高的通道进行调节,在亮度调节后的图像数据进行处理
always @(posedge pclk) begin
	if(region_active == 1'b1) begin
		if ((r_data_reg > g_data_reg) && (g_data_reg > b_data_reg)) begin     //色相调高，对g分量进行+操作
			if ( hue_cnt < 'd100) begin
			    g_data_d1 <= (g_data_reg < ('d100 - hue_cnt)) ? 'd0 : g_data_reg + hue_cnt - 'd100;
	      		r_data_d1 <= r_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
			else begin
				g_data_d1 <= g_data_reg + hue_cnt - 'd100 ;
	      		r_data_d1 <= r_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
		end
		else if ((r_data_reg > b_data_reg) && (g_data_reg < b_data_reg)) begin     //色相调高，对b分量进行-操作
			if ( hue_cnt > 'd100) begin
			    b_data_d1 <= (b_data_reg < (hue_cnt - 'b100)) ? 'd0 : b_data_reg - hue_cnt + 'd100;
	      		r_data_d1 <= r_data_reg ;
		        g_data_d1 <= g_data_reg ;

			end
			else begin
				b_data_d1 <= b_data_reg - hue_cnt + 'd100;
	      		r_data_d1 <= r_data_reg ;
		        g_data_d1 <= g_data_reg ;
			end
		end
		else if ((b_data_reg > r_data_reg) && (g_data_reg > b_data_reg)) begin     //色相调高，对b分量进行+操作
			if ( hue_cnt < 'd100) begin
			    b_data_d1 <= (b_data_reg < ('d100 - hue_cnt)) ? 'd0 : b_data_reg + hue_cnt - 'd100;
	      		r_data_d1 <= r_data_reg ;
		        g_data_d1 <= g_data_reg ;
			end
			else begin
				b_data_d1 <= b_data_reg + hue_cnt - 'd100 ;
	      		r_data_d1 <= r_data_reg ;
		        g_data_d1 <= g_data_reg ;
			end
		end
		else if ((b_data_reg > r_data_reg) && (r_data_reg > g_data_reg)) begin     //色相调高，对r分量进行+操作
			if ( hue_cnt < 'd100) begin
			    r_data_d1 <= (r_data_reg < ('d100 - hue_cnt)) ? 'd0 : r_data_reg + hue_cnt - 'd100;
	      		g_data_d1 <= g_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
			else begin
				r_data_d1 <= r_data_reg + hue_cnt - 'd100 ;
	      		g_data_d1 <= g_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
		end
		else if ((r_data_reg > b_data_reg) && (r_data_reg < g_data_reg)) begin     //色相调高，对r分量进行-操作
			if ( hue_cnt > 'd100) begin
			    r_data_d1 <= (r_data_reg < (hue_cnt - 'b100)) ? 'd0 : r_data_reg - hue_cnt + 'd100;
	      		g_data_d1 <= g_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
			else begin
				r_data_d1 <= r_data_reg - hue_cnt + 'd100;
	      		g_data_d1 <= g_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
		end
		else if ((g_data_reg > r_data_reg) && (g_data_reg < b_data_reg)) begin     //色相调高，对g分量进行-操作
			if ( hue_cnt > 'd100) begin
			    g_data_d1 <= (g_data_reg < (hue_cnt - 'b100)) ? 'd0 : g_data_reg - hue_cnt + 'd100;
	      		r_data_d1 <= r_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
			else begin
				g_data_d1 <= g_data_reg - hue_cnt + 'd100;
	      		r_data_d1 <= r_data_reg ;
		        b_data_d1 <= b_data_reg ;
			end
		end
		else begin
		    r_data_d1 <= r_data_reg ;
		    g_data_d1 <= g_data_reg ;
		    b_data_d1 <= b_data_reg ;			
		end
	end
	else begin
		r_data_d1 <= r_data_reg ;
		g_data_d1 <= g_data_reg ;
		b_data_d1 <= b_data_reg ;
	end
end


//传出有效的横纵坐标，同时行场信号同步打拍输出
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