// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : tb_imitator_dvp_ifc                //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 27.02.2018                        //
//Last revision : 07.03.2018                        //
//////////////////////////////////////////////////////
`timescale 1ns / 1ps 
module tb_imitator_dvp_ifc;	

reg run_test;
reg stop_test;
reg [9:0] count_line;
reg reset_n;
reg clk_sys=0;
reg pclk   =0;
always #5 clk_sys = ~clk_sys;
always #2.604 pclk = ~pclk;
// DVP iface from two cameras
wire [7:0] D1;
wire [7:0] D2;
wire       HREF;
wire       VSYNC;
// avalon stream iface on F_clk_sys
wire [7:0] Y1;
wire [7:0] Y2;
wire [7:0] CbCr1;
wire [7:0] CbCr2;
wire       SOF;
wire       EOF;
wire       validY;
wire       validCb;
wire       validCr;
wire last_data = EOF;
wire end_frame = count_line == 'd720;
`include "../task_write_file.v"
initial begin
	reset_n    <= 0;
	run_test   <= 0;
	stop_test  <= 0;
	#10000;
	reset_n  <= 1;
	@(posedge clk_sys);
	run_test    <=1;
	@(posedge clk_sys);
	run_test <=0;
end
// source video_streem
imitator_dvp_ifc imitator_dvp_ifc_inst 
(
	.pclk      (pclk      ),  
	.reset_n   (reset_n   ),
	.run_test  (run_test  ), // <- 
	.stop_test (stop_test ), // <-
	.VSYNC     (VSYNC     ), // ->
    .HREF      (HREF      ), // ->
    .D1        (D1        ), // -> bus data from camera 1
    .D2        (D2        )  // -> bus data from camera 2
);

convert2avl_stream convert_to_avlstream_image_1
(
	.pclk      (pclk      ), 
	.clk_sys   (clk_sys   ),
	.reset_n   (reset_n   ),
	// from camera
	.VSYNC     (VSYNC     ), // <-
	.HREF      (HREF      ), // <-
	.D1        (D1        ), // <-
	.D2        (D2        ), // <-
	// output avl stream interface //
	.Y1        (Y1        ), // ->
	.CbCr1     (CbCr1     ), // ->
	.Y2        (Y2        ), // ->
	.CbCr2     (CbCr2     ), // ->
	.validY    (validY    ), // ->
	.validCb   (validCb   ), // ->
	.validCr   (validCr   ), // ->
	.SOF       (SOF       ), // ->
	.EOF       (EOF       )  // ->
);


initial begin
	integer file_Y1_out  = $fopen("../result_images/Y1_comp_out.txt" ,"w");
	integer file_Cb1_out = $fopen("../result_images/Cb1_comp_out.txt","w");
	integer file_Cr1_out = $fopen("../result_images/Cr1_comp_out.txt","w");

	@(posedge reset_n);
	@(posedge clk_sys);
	write_comp_image_to_file_1(file_Y1_out, file_Cb1_out, file_Cr1_out);
end

// write files components of image_1
initial begin
	integer file_Y2_out  = $fopen("../result_images/Y2_comp_out.txt" ,"w");
	integer file_Cb2_out = $fopen("../result_images/Cb2_comp_out.txt","w");
	integer file_Cr2_out = $fopen("../result_images/Cr2_comp_out.txt","w");
	@(posedge reset_n);
	@(posedge clk_sys);
	write_comp_image_to_file_2(file_Y2_out, file_Cb2_out, file_Cr2_out);
end


		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_line <='0;
	else if(end_frame)
		count_line <='0;
	else if(last_data)
		count_line <= count_line + 1;	

integer test_file,test_file1;	
initial
	begin
		test_file  = $fopen("../test_filez.txt","w");
		test_file1  = $fopen("../test_file1z.txt","w");
		forever @( posedge clk_sys )
			begin
				if (validY)
					begin
						$fwrite (test_file,Y1,"\n");
						$fwrite (test_file1,CbCr1,"\n");
					end
				else if ( count_line == 720 )
					begin
						$fclose(test_file);
						$fclose(test_file1);
						$stop;
					end
			end   	
	end
	
endmodule

	            






