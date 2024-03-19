//`define		CYCLONE_V
`define	CYCLONE_IV
module alarm(
	input	sys_clk, 
	input 	sys_rst_n,
	input	alarm_touch,// 触发报警
	output	alarm_line// 报警线
	);
	// 报警模块
`ifdef		CYCLONE_V	
`define 	ALARM_CNT_WIDTH		26
`else
`ifdef		CYCLONE_IV
`define 	ALARM_CNT_WIDTH		24
`endif
`endif	
	reg		[`ALARM_CNT_WIDTH-1:0]	alarm_cnt;
	always @(posedge sys_clk)
		if(!sys_rst_n)
			alarm_cnt <= {`ALARM_CNT_WIDTH{1'B1}};
		else if(alarm_touch)
			alarm_cnt <= 0;
		else if(alarm_cnt < {`ALARM_CNT_WIDTH{1'B1}})
			alarm_cnt <= alarm_cnt + 1;
	assign	alarm_line = (alarm_cnt < {`ALARM_CNT_WIDTH{1'B1}});
	
endmodule
