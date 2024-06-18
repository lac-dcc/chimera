// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : imitator_dvp_ifc                //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 27.02.2018                        //
//Last revision : 08.03.2018                        //
//////////////////////////////////////////////////////
`timescale 1ns / 1ps 
module imitator_dvp_ifc
(
	input wire   pclk     ,
	input wire   reset_n  ,
	input wire   run_test , // (One Clock Cycle)
	input wire   stop_test,
	output logic VSYNC    ,
	output logic HREF     ,
	output logic [7:0] D1 ,
	output logic [7:0] D2     
	
);	

reg [5:0]  cnt_frame;  // counter of frame
reg [23:0] cnt_pclk;  // counter of clock pixel
reg [9:0]  cnt_line_in_frame; // counter of line in frame
reg        running_trans_frame;
reg        start_first_frame;
reg        wait_next_vsync;

/* start pass next frame */ 
wire next_start_frame = (cnt_pclk =='d4115952); // 
wire t_start_vsync   = next_start_frame | start_first_frame;
wire t_stop_vsync    = (cnt_pclk == 'd176);
wire last_line_in_frame = (cnt_line_in_frame == 'd720);
//============================================================//
wire initial_reg = start_first_frame | next_start_frame;
reg [23:0] next_href_t1;   // number of next sample start HREF
reg [23:0] next_href_t2;   // number of next sample end HREF
assign t_start_href  = running_trans_frame & !wait_next_vsync &(cnt_pclk == next_href_t1) ;//признак начала строба
assign t_stop_href   = running_trans_frame & !wait_next_vsync &(cnt_pclk == next_href_t2) ;// & !strbs_end;//признак конца строба

////HREF///////////////////////////////		
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		HREF <=1'b0;
	else if(t_stop_href)
		HREF <=1'b0;
	else if(t_start_href)
		HREF <=1'b1;
/* calc next time start  HREF*/	
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		next_href_t1 <='0;
	else if(run_test | initial_reg)
		next_href_t1 <='d12352;// 'd7072664 ; //(3530644 + 5688)*2 = 7072664
	else if(t_start_href)
		next_href_t1 <=next_href_t1 + 'd5688 ;
/* calc next time end  HREF */	
always @(posedge pclk or negedge reset_n)
	if (~reset_n)
		next_href_t2 <= '1;
	else if(initial_reg)
		next_href_t2 <= 'd13632;//'d7075224;
	else if(t_stop_href)
		next_href_t2 <= next_href_t2 +'d5688 ;	
//===========================================================//

// counter frame
always @(posedge pclk, negedge reset_n)
	if(~reset_n)
		cnt_frame <='0;
	else if(run_test)
		cnt_frame <= '0;
	else if(start_first_frame | next_start_frame)
		cnt_frame <= cnt_frame + 1;
		
always @(posedge pclk, negedge reset_n)
	if(~reset_n)
		cnt_line_in_frame <='0;
	else if(last_line_in_frame)
		cnt_line_in_frame <= '0;
	else if(t_stop_href)
		cnt_line_in_frame <= cnt_line_in_frame + 1;
// counter clock freq camera	
always @(posedge pclk, negedge reset_n)
	if(~reset_n)
		cnt_pclk <='0;
	else if(next_start_frame | start_first_frame)
		cnt_pclk <= 1;
	else if(running_trans_frame)
		cnt_pclk <= cnt_pclk + 1;	

always_ff @(posedge pclk or negedge reset_n)
	if (~reset_n)
		VSYNC <= 1'b0;
	else if(t_start_vsync)
		VSYNC <= 1'b1;
	else if(t_stop_vsync)
		VSYNC <= 1'b0;

always_ff @(posedge pclk or negedge reset_n)
	if (~reset_n)
		start_first_frame <= 1'b0;
	else if(run_test)
		start_first_frame <= 1'b1;
	else 
		start_first_frame <= 1'b0;
		

always_ff @(posedge pclk or negedge reset_n)
	if (~reset_n)
		wait_next_vsync <= 1'b0;
	else if(last_line_in_frame)
		wait_next_vsync <= 1'b1;
	else if(next_start_frame)
		wait_next_vsync <= 1'b0;

always_ff @(posedge pclk or negedge reset_n)
	if (~reset_n)
		running_trans_frame <= 1'b0;
	else if(run_test)
		running_trans_frame <= 1'b1;
	else if(stop_test)
		running_trans_frame <= 1'b0;
		
		
`include "../../tb/task_read_file.v"		
//`include "task_read_file.v"
//`include "D:/Vlad/FPGA_rtime_HDR_video/code/tb/task_read_file.v"
// read files components of image_1		
//initial begin
//	/* input files */
//	
//	integer file_Y1  = $fopen("../../tb/test_images/generate_component_YCbCR/Y1_comp.txt" ,"r");
//	integer file_Cb1 = $fopen("../../tb/test_images/generate_component_YCbCR/Cb1_comp.txt","r");
//	integer file_Cr1 = $fopen("../../tb/test_images/generate_component_YCbCR/Cr1_comp.txt","r");
//
////	integer file_Y1  = $fopen("test_images/generate_component_YCbCR/Y1_comp.txt" ,"r");
////	integer file_Cb1 = $fopen("test_images/generate_component_YCbCR/Cb1_comp.txt","r");
////	integer file_Cr1 = $fopen("test_images/generate_component_YCbCR/Cr1_comp.txt","r");		
//	@(posedge reset_n);
//	@(posedge pclk);
//	@(posedge run_test);
//	read_file_comp_image_1(file_Y1, file_Cb1, file_Cr1, 2 );
//end
//
//
//// read files components of image_2
//initial begin
//	
//	integer file_Y2  = $fopen("../../tb/test_images/generate_component_YCbCR/Y2_comp.txt" ,"r");
//    integer file_Cb2 = $fopen("../../tb/test_images/generate_component_YCbCR/Cb2_comp.txt","r");
//    integer file_Cr2 = $fopen("../../tb/test_images/generate_component_YCbCR/Cr2_comp.txt","r");
//
//	//integer file_Y2  = $fopen("test_images/generate_component_YCbCR/Y2_comp.txt" ,"r");
//   // integer file_Cb2 = $fopen("test_images/generate_component_YCbCR/Cb2_comp.txt","r");
//   // integer file_Cr2 = $fopen("test_images/generate_component_YCbCR/Cr2_comp.txt","r");
//	@(posedge reset_n);
//	@(posedge pclk);
//	@(posedge run_test);
//	read_file_comp_image_2(file_Y2, file_Cb2, file_Cr2, 2 );
//end
	
	
initial begin
	/* input files */
	
	integer file_RAW_1  = $fopen("../../tb/test_images/generate_component_YCbCR/RAW_1.txt" ,"r");
	integer file_RAW_2 = $fopen("../../tb/test_images/generate_component_YCbCR/RAW_2.txt","r");
	
	@(posedge reset_n);
	@(posedge pclk);
	@(posedge run_test);
	read_file_raw_images(file_RAW_1, file_RAW_2, 2 );
end










endmodule

	            






