// This program was cloned from: https://github.com/wongmatthew73/tt06-mw-pmic
// License: Apache License 2.0

`default_nettype none

module pmic(
    input clk,
    input reset,
    //input enable,
    input busy,
    input [7:0] adcVoltage,
    output convStart,
    output rd_cs,
    output syncRectifierLs,
    output syncRectifierHs
    );
    
    wire slowerClk;
    
    slow_clk slowClk(
    	.reset(reset),
    	.original_clk(clk), 
    	.slow_clk(slowerClk)
    	);
    pwm syncPWM(
    	.clk(slowerClk), 
    	.reset(reset), 
    	//.enable(enable), 
    	.busy(busy), 
    	.adcVoltage(adcVoltage), 
    	.convStart(convStart), 
    	.rd_cs(rd_cs),
    	.syncRegOutLs(syncRectifierLs),
    	.syncRegOutHs(syncRectifierHs)
    	);
  
    
endmodule

