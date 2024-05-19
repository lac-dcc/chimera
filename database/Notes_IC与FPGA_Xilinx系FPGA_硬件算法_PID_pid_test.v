// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

/* PID TestBench */
`timescale 1ns/1ps
module pid_tb ();
 
reg clk;
reg rst_n;
reg signed [9:0]		target	; // 目标值
reg	signed [9:0]		   y	; // 实际输出值
reg	[3:0]		  kp	; // 比例系数
reg	[3:0]		  ki	; // 积分系数
reg	[3:0]		  kd	; // 微分系数
wire signed [14:0]	    uk0;  // pid输出值
 
reg [10:0] i;
reg [8:0] mytxt[0:1997];
initial
begin
	$readmemh("C:/Users/lenovo/Desktop/pid_demo/test_y.txt",mytxt);
	clk = 1'b0;
	rst_n = 1'b1;
	#5 rst_n = 1'b0;
	#5 rst_n = 1'b1;
	target = 10'd350;
	kp = 4'd10;
	ki = 4'd9;
	kd = 4'd8;
 
	for(i = 0; i <= 11'd1997; i = i + 1)
  		begin
      		y = mytxt[i];
      		#10;
  		end
end
 
always #5 clk = ~clk;
 
demo_top demo_top_tb(.clk(clk),
					 .rst_n(rst_n),
					 .target(target),
					 .y(y),
					 .kp(kp),
					 .ki(ki),
					 .kd(kd),
					 .uk0(uk0)
					 );   
 
