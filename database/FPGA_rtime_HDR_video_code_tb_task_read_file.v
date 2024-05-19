// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

`define SEEK_SET 0
`define SEEK_CUR 1
`define SEEK_END 2
task read_file_comp_image_1;
	input integer      file_Y  ;
	input integer      file_Cb ;
	input integer      file_Cr ;
    input [5:0]        cnt_frame;

integer i;
for(i = 0; i<cnt_frame; i=i+1)
begin
	while(!t_start_href) @(posedge pclk);
	
	$fscanf(file_Y,"%x\n", D1);
	@(posedge pclk);
	$fscanf(file_Cb,"%x\n", D1);
	@(posedge pclk);
	$fscanf(file_Y,"%x\n", D1);
	@(posedge pclk);
	$fscanf(file_Cr,"%x\n", D1);
	@(posedge pclk);
	
	while(!$feof(file_Cr) )
	begin
	
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Y,"%x\n", D1);
		@(posedge pclk);
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Cb,"%x\n", D1);
		@(posedge pclk);
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Y,"%x\n", D1);
		@(posedge pclk);
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Cr,"%x\n", D1);
		@(posedge pclk);
		
	end
	$fseek(file_Y, 0, `SEEK_SET);
	$fseek(file_Cb, 0, `SEEK_SET);
	$fseek(file_Cr, 0, `SEEK_SET);
end

@(posedge pclk);
$fclose(file_Y);
$fclose(file_Cb);
$fclose(file_Cr);



endtask


task read_file_comp_image_2;
	input integer      file_Y  ;
	input integer      file_Cb ;
	input integer      file_Cr ;
    input [5:0]  cnt_frame;

integer j;
for(j = 0; j<cnt_frame; j=j+1)
begin

	while(!t_start_href) @(posedge pclk);
	$fscanf(file_Y,"%x\n", D2);
	@(posedge pclk);
	$fscanf(file_Cb,"%x\n", D2);
	@(posedge pclk);
	$fscanf(file_Y,"%x\n", D2);
	@(posedge pclk);
	$fscanf(file_Cr,"%x\n", D2);
	@(posedge pclk);
	while(!$feof(file_Cr) )
	begin
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Y,"%x\n", D2);
		@(posedge pclk);
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Cb,"%x\n", D2);
		@(posedge pclk);
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Y,"%x\n", D2);
		@(posedge pclk);
		while(!HREF)  @(posedge pclk);
		$fscanf(file_Cr,"%x\n", D2);
		@(posedge pclk);
		
	end
	$fseek(file_Y, 0, `SEEK_SET);
	$fseek(file_Cb, 0, `SEEK_SET);
	$fseek(file_Cr, 0, `SEEK_SET);
end

@(posedge pclk);
$fclose(file_Y);
$fclose(file_Cb);
$fclose(file_Cr);
endtask



task read_file_raw_images;
	input integer      file_RAW_1  ;
	input integer      file_RAW_2  ;
    input [5:0]        cnt_frame;

integer i;
for(i = 0; i<cnt_frame; i=i+1)
begin
	while(!t_start_href) @(posedge pclk);
	
	$fscanf(file_RAW_1,"%x\n", D1);
	$fscanf(file_RAW_2,"%x\n", D2);
	@(posedge pclk);

	while(!$feof(file_RAW_1) )
	begin
		while(!HREF)  @(posedge pclk);
		$fscanf(file_RAW_1,"%x\n", D1);
		$fscanf(file_RAW_2,"%x\n", D2);
		@(posedge pclk);
	end
	$fseek(file_RAW_1, 0, `SEEK_SET);
	$fseek(file_RAW_2, 0, `SEEK_SET);
end

@(posedge pclk);
$fclose(file_RAW_1);
$fclose(file_RAW_2);

endtask
