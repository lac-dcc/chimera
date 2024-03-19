`timescale 1ns / 1ps
//****************************************Copyright (c)***********************************//
// Descriptions:        LCD显示模块
//                      LCD分辨率640*480
//****************************************************************************************//

module lcd_display(
    input             	lcd_clk,                  	//lcd驱动时钟
    input             	sys_rst_n,                	//复位信号
		
    input      	[9:0] 	pixel_xpos,               	//像素点横坐标
    input      	[9:0] 	pixel_ypos,               	//像素点纵坐标   
    
    output  	[3:0]   VGA_R,
    output  	[3:0]   VGA_G,
    output  	[3:0]   VGA_B ,
    
    input     	[9:0]  	left_pos  ,            		
    input     	[9:0]  	right_pos ,

    input     	[9:0]  	up_pos ,  	
    input     	[9:0]  	down_pos     
    );    

//parameter define  
parameter  H_LCD_DISP = 11'd640;                //LCD分辨率--行
parameter  V_LCD_DISP = 11'd480;                //LCD分辨率--行

localparam BLACK  = 16'b00000_000000_00000;     //RGB565 
localparam WHITE  = 16'b11111_111111_11111;     //RGB565 
localparam RED    = 16'b11111_000000_00000;     //RGB565 
localparam BLUE   = 16'b00000_000000_11111;     //RGB565 
localparam GREEN  = 16'b00000_111111_00000;     //RGB565 
localparam GRAY   = 16'b11000_110000_11000;     //RGB565 

reg border_flag;

  assign VGA_R = (border_flag) ? 4'b1111 : 4'b0000;
  assign VGA_G = (border_flag) ? 4'b1111 : 4'b0000;
  assign VGA_B = (border_flag) ? 4'b1111 : 4'b0000;

//判断坐标是否落在矩形方框边界上

always @(posedge lcd_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin	//初始化
			border_flag <= 0;
		end
    else begin

            //判断上下边界
            if((pixel_xpos >  left_pos) && (pixel_xpos < right_pos) && ((pixel_ypos == up_pos) ||(pixel_ypos == down_pos)) )  
				border_flag <= 1;
           //判断左右边界
            else if((pixel_ypos > up_pos) && (pixel_ypos < down_pos) && ((pixel_xpos == left_pos) ||(pixel_xpos == right_pos)) )     
				border_flag <= 1;
            else 
                border_flag <= 0;

    end 
end 

endmodule