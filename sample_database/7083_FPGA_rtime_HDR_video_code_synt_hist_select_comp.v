// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : select_comp                       //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 29.06.2018                        //
//Last revision : 29.06.2018                        //
//////////////////////////////////////////////////////
module select_comp
(
	input wire					           clk        ,
	input wire					           reset_n    ,
	input wire					           start_frame,
	input wire  [ 3: 0]                    hist_switch,
    input wire                             rgb_valid  ,                                       
	input wire  [ 7: 0]   		           r_comp     ,
	input wire  [ 7: 0]   		           g_comp     ,
	input wire  [ 7: 0]   		           b_comp     ,
	input wire                             y_valid    ,
	input wire  [ 7: 0]                    y_comp     ,
	output reg [ 7: 0]                    out_comp   ,
	input wire                            frame_end_rgb, 
    input wire                            frame_end_y,   	
    output reg                            frame_end_hist,   	
	output reg                            out_valid   	                                     	          	
);

reg [3:0] reg_hist_switch;

always @( posedge clk or negedge reset_n)
	if ( !reset_n )
		reg_hist_switch <= '0;
	else if(start_frame)
		reg_hist_switch <= hist_switch;



always_ff @(posedge clk, negedge reset_n)
	if(~reset_n)
		{frame_end_hist, out_valid, out_comp} <='0;
	else 
		case(reg_hist_switch)
			4'b0001 : {frame_end_hist, out_valid, out_comp} <={frame_end_rgb,rgb_valid, r_comp};
			4'b0010 : {frame_end_hist, out_valid, out_comp} <={frame_end_rgb,rgb_valid, g_comp};
			4'b0100 : {frame_end_hist, out_valid, out_comp} <={frame_end_rgb,rgb_valid, b_comp};
			4'b1000 : {frame_end_hist, out_valid, out_comp} <={frame_end_y,  y_valid, y_comp};
			default : {frame_end_hist, out_valid, out_comp} <={frame_end_y,  y_valid, y_comp};
		endcase


endmodule