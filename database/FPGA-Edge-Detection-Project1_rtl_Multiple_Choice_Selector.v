//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          Multiple_Choice_Selector
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        多通道选择器
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module Multiple_Choice_Selector(
    input          [3:0]in_a,    //系统复位，低有效
    input               in_b,    //系统复位，低有效
    input               in_a_clk  ,    //50Mhz系统时钟
    input               in_b_clk,    //系统复位，低有效
    input               in_c_clk,    //系统复位，低有效
    input               in_d_clk,    //系统复位，低有效
    input               in_e_clk,    //系统复位，低有效
    input               in_f_clk,    //系统复位，低有效
    input               in_g_clk,    //系统复位，低有效
    input               in_h_clk,    //系统复位，低有效
    input        [15:0] in_a_data  ,    //50Mhz系统时钟
    input          [15:0]in_b_data,    //系统复位，低有效
    input          [15:0]in_c_data,    //系统复位，低有效
    input               in_d_data,    //系统复位，低有效
    input               in_e_data,    //系统复位，低有效
    input               in_f_data,    //系统复位，低有效
    input               in_g_data,    //系统复位，低有效
    input               in_h_data,    //系统复位，低有效
    output  reg         out_clk,           //LED输出信号
    output reg        [15:0]   out_data           //LED输出信号
    );
    
/*always@(*)
begin

    if(in_a==1)
            out_clk<=in_a_clk;
    else
            out_clk<=in_b_clk;
end*/
 
    
     
always @(in_a_clk or in_b_clk or in_c_clk or in_d_clk or in_e_clk or in_f_clk or in_g_clk or in_h_clk) begin
    if((in_a==4'd0))
        begin
         out_clk<=in_a_clk;
         out_data<=in_a_data;
        end
    else if((in_a==4'd1))//灰度
        begin
         out_clk<=in_b_clk;
         out_data<=in_b_data;//~
        end 
   else if((in_a==4'd2))//中值滤波
        begin
         out_clk<=in_c_clk;
         out_data<=in_c_data;//~
        end 
    else if((in_a==4'd3))//sobel
        begin
         out_clk<=in_d_clk;
         out_data<=~{16{in_d_data}};
        end 
    else if((in_a==4'd4))//prewitt
        begin
         out_clk<=in_e_clk;
         out_data<=~{16{in_e_data}};
        end 
    else if((in_a==4'd5))//sobel+errsion
        begin
         out_clk<=in_f_clk;
         out_data<=~{16{in_f_data}};
        end 
    else if((in_a==4'd6))//sobel+膨胀
        begin
         out_clk<=in_g_clk;
         out_data<=~{16{in_g_data}};
        end 
     else if((in_a==4'd7))//手势
        begin
         out_clk<=in_h_clk;
         out_data<=~{16{in_h_data}};
        end 
   /*else if((in_a==4'd2))
        begin
         out_clk<=in_d_clk;
         out_data<=in_d_data;
        end */
    /*else 
        begin
         out_clk<=out_clk;
         out_data<=out_data;
         end */ 
        
end
/*always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		out_clk<=in_b_clk;
        out_data<=in_b_data;
    end
	else if(in_a==1)
        begin
         out_clk<=in_b_clk;
         out_data<=in_b_data;
        end
	else
        begin
            out_a <= out_a;
            out_b <= out_b;
        end
end*/

endmodule