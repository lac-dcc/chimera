// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`include "alink_define.v"
module tx_timer(
input             clk          ,
input             rst          ,
input             reg_flush    ,
input  [31:0]     reg_tout     ,
input             timer_start  ,
output reg        timer_busy   ,
output [31:0]     timer_cnt       
);

reg [25:0] timer ;

assign timer_cnt = {6'b0,timer} ;

always @ ( posedge clk ) begin
	if( rst || (timer == reg_tout) || reg_flush )
		timer <= 'b0 ;
	else if( timer_start )
		timer <= 'b1 ;
	else if( |timer && (timer < reg_tout))
		timer <= 'b1 + timer ;
end

always @ ( posedge clk ) begin
	if( rst )
		timer_busy <= 1'b0 ;
	else if( timer_start )
		timer_busy <= 1'b1 ;
	else if ( (timer == reg_tout[25:0]) && |reg_tout[25:0] )
		timer_busy <= 1'b0 ;
end
endmodule
