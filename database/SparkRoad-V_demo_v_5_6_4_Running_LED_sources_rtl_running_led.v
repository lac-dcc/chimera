// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		流水灯
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
`timescale 1ns / 1ps
module running_led
( 
	input	wire 		clk_24m,
	output  reg [15:0] 	led
);

wire rst_n;

parameter CNT = 25'd12000_000;

initial
begin
	cnt_time = 0;
	flag = 0;
	led = 0;
end

rst_n ux_rst_n
(
	.clk	(clk_24m	),
	.rst_n	(rst_n		)
);

reg [24:0] cnt_time;
reg flag;

// 0.04S计数器
always @(posedge clk_24m)
begin 
	if(cnt_time == CNT - 1) 
		cnt_time <= 0; 
	else 
		cnt_time <= cnt_time + 1'b1; 
end

always @(posedge clk_24m)
begin
	if(!led[0])
		flag <= 0;
	else if(!led[15])
		flag <= 1;
	else
		flag <= flag;
end

// always @(posedge clk_24m)
// begin
	// if(led == 0) 
		// led <= 16'hfffe; 
	// else if(cnt_time == CNT - 1 && !flag)
		// led <= {led[14:0],led[15]};	
	// else if(cnt_time == CNT - 1)
		// led <= {led[0],led[15:1]};
	// else
		// led <= led;
// end

always @(posedge clk_24m)
begin
	if(led == 0) 
		led <= 16'hfffe; 
	else if(cnt_time == CNT - 1)
	begin
		if(!flag)
			led <= {led[14:0],led[15]};
		else
			led <= {led[0],led[15:1]};
	end
	else
		led <= led;
end


endmodule
