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
//		按键消抖，LED显示
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
`timescale 1ns / 1ps

module buttons_led
#(
	parameter N        = 5,  //N is button number
	parameter CNT_20MS = 19'h75601//系统时钟24MHz，要延时20ms左右时间
)
(
	input  wire        		clk_24m,
	input  wire [N-1:0]  	btn,
	output reg  [15:0] 		led
);

wire       rst_n;
wire [4:0] key_pulse;

debounce
#(
	.N          (N          ),
	.CNT_20MS   (CNT_20MS	)
)
ux_btn
(
	.clk		(clk_24m	),
	.rst_n		(rst_n		),
	.key		(btn		),
	.key_pulse	(key_pulse	)
);

rst_n ux_rst
(
	.clk		(clk_24m	),
	.rst_n		(rst_n		)
);

//led off/on logic
always@(posedge clk_24m  or  negedge rst_n)
begin
    if(!rst_n) 
		        led[15:0]  <= 16'hFFFF;
	else if(key_pulse[0])
		        led[2:0]   <= ~led[2:0];
	else if(key_pulse[1])
		        led[5:3]   <= ~led[5:3];
	else if(key_pulse[2])
		        led[8:6]   <= ~led[8:6];
	else if(key_pulse[3])
		        led[11:9]  <= ~led[11:9];
	else if(key_pulse[4])
		        led[15:12] <= ~led[15:12];		      
	else
                led        <= led;
end    

endmodule