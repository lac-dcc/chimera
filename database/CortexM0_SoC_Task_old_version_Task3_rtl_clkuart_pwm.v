// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License


module clkuart_pwm 
	#( parameter BPS_PARA = 434 )
	(
	input bps_en,
	input clk,
	input RSTn,		
	output reg clk_uart		
);	
 
reg	[12:0] cnt = 0;

always @ (posedge clk or negedge RSTn) begin
	if(~RSTn) cnt <= 13'b0;
	else if((cnt >= BPS_PARA-1)||(!bps_en)) cnt <= 13'b0;		
	else cnt <= cnt + 1'b1;
end

always @ (posedge clk or negedge RSTn) begin
	if(~RSTn) clk_uart <= 1'b0;
	else if(cnt == (BPS_PARA>>1)) clk_uart <= 1'b1;
	else clk_uart <= 1'b0;	
end
 
endmodule