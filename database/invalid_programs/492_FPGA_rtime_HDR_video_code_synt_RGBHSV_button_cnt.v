// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

module button_cnt
#(
	parameter		BUTTON_CNT_MAX,
	parameter		WIDTH
)
(
	input wire				clk,
	input wire				rst,
		
	input wire				button,
	
	
	output reg [WIDTH-1: 0]	button_cnt	
);


reg	 [3: 0]				filter;
reg						sh_button;
wire					p_button;


	always @( posedge clk )
		sh_button <= button;
		
assign p_button = button & !sh_button;

	always @( posedge clk )
		if ( p_button )
			filter <= 1;
		else if ( ( filter != 0 ) && ( button ) )
			filter <= filter + 1;
		else
			filter <= 0;
	always @( posedge clk or posedge rst )
		if ( rst )
			button_cnt <= '0;
		else
			if ( button_cnt == BUTTON_CNT_MAX )
				button_cnt <= '0;
			else if ( filter == 15 )
				button_cnt <= button_cnt + 1;
				
			
endmodule
