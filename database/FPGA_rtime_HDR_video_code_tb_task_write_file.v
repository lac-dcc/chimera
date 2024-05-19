// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

`define SEEK_SET 0
`define SEEK_CUR 1
`define SEEK_END 2
task write_comp_image_to_file_1;
	input integer      file_Y_out  ;
	input integer      file_Cb_out ;
	input integer      file_Cr_out ;
	while(!end_frame)
	begin
		if(validY & validCb) begin
			$fdisplay(file_Y_out, "%d", Y1);
			$fdisplay(file_Cb_out, "%d", CbCr1);
			@(posedge clk_sys);
		end
		else if(validY & validCr)begin
			$fdisplay(file_Y_out, "%d", Y1);
			$fdisplay(file_Cr_out, "%d", CbCr1);
			@(posedge clk_sys);
		end
		else
			@(posedge clk_sys);
	end
			
			
	$fclose(file_Y_out);
	$fclose(file_Cb_out);
	$fclose(file_Cr_out);
endtask

task write_comp_image_to_file_2;
	input integer      file_Y_out  ;
	input integer      file_Cb_out ;
	input integer      file_Cr_out ;
	while(!end_frame)
	begin
		if(validY & validCb) begin
			$fdisplay(file_Y_out, "%d", Y2);
			$fdisplay(file_Cb_out, "%d", CbCr2);
			@(posedge clk_sys);
		end
		else if(validY & validCr)begin
			$fdisplay(file_Y_out, "%d", Y2);
			$fdisplay(file_Cr_out, "%d", CbCr2);
			@(posedge clk_sys);
		end
		else
			@(posedge clk_sys);
	end
			
			
	$fclose(file_Y_out);
	$fclose(file_Cb_out);
	$fclose(file_Cr_out);
endtask