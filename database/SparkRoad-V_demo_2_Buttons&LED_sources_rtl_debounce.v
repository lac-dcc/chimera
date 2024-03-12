`timescale 1ns / 1ps
// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		按键消抖
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
module debounce 
#(
	parameter  N         =  1,
	parameter  CNT_20MS  =  19'h75601//系统时钟24MHz，要延时20ms左右时间
)
(
	input	wire         clk,
	input	wire         rst_n,
	// key
	input   wire [N-1:0] key,
	output	wire [N-1:0] key_pulse
); 
  
reg [18:0]	cnt; //产生延时所用的计数器，系统时钟24MHz，要延时20ms左右时间   

always@(posedge clk or negedge rst_n)
begin
     if(!rst_n)
          cnt <= 0;
     else if(cnt == CNT_20MS)
          cnt <= 0;
     else
          cnt <= cnt + 1'h1;
end  

reg [N-1:0] key_sec_pre;                
reg [N-1:0] key_sec;                      

always@(posedge clk  or  negedge rst_n)
begin
     if(!rst_n) 
         key_sec <= {N{1'b1}};                
     else if(cnt == CNT_20MS)
         key_sec <= key;  
end

always@(posedge clk  or  negedge rst_n)
begin
     if(!rst_n)
         key_sec_pre <= {N{1'b1}};
     else                   
         key_sec_pre <= key_sec;             
end  
    
assign  key_pulse = ~key_sec & key_sec_pre ;     
 
endmodule