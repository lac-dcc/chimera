// This program was cloned from: https://github.com/AngeloJacobo/FPGA_RealTime_and_Static_Sobel_Edge_Detection
// License: MIT License

`timescale 1ns / 1ps

   module top_module(
	input wire clk,rst_n,
	input wire[3:0] key, //key[1:0] for increasing/decreasing threshold for edge detection,key[2] to change display between raw video or edge detected video
	//camera pinouts
	input wire cmos_pclk,cmos_href,cmos_vsync,
	input wire[7:0] cmos_db,
	inout cmos_sda,cmos_scl, 
	output wire cmos_rst_n, cmos_pwdn, cmos_xclk,
	//Debugging
	output[3:0] led, 
	//controller to sdram
	output wire sdram_clk,
	output wire sdram_cke, 
	output wire sdram_cs_n, sdram_ras_n, sdram_cas_n, sdram_we_n, 
	output wire[12:0] sdram_addr,
	output wire[1:0] sdram_ba, 
	output wire[1:0] sdram_dqm, 
	inout[15:0] sdram_dq,
	//VGA output
	output wire[4:0] vga_out_r,
	output wire[5:0] vga_out_g,
	output wire[4:0] vga_out_b,
	output wire vga_out_vs,vga_out_hs
    );
	 
	 wire f2s_data_valid;
	 wire[9:0] data_count_r;
	 wire[15:0] dout,din;
	 wire clk_sdram;
	 wire empty_fifo,empty;
	 wire clk_vga;
	 wire state;
	 wire rd_en,rd_fifo,key1_tick,key2_tick,key3_tick;
	 reg[7:0] threshold=0;
	 reg sobel=0;
	 
	 //register operation 
	always @(posedge clk) begin
		if(!rst_n) begin
			threshold=0;
			sobel<=0;
		end
		else begin
			threshold=key1_tick? threshold+1:threshold;  //decrease sensitivity of sobel edge detection
			threshold=key2_tick? threshold-1:threshold;	//increase sensitivity of sobel edge detection
			sobel<=key3_tick? !sobel:sobel; //choose whether to display the raw videoe or the edge detected video
		end
	end
	
	//module instantiations
	camera_interface m0 //control logic for retrieving data from camera, storing data to asyn_fifo, and  sending data to sdram
	(
		.clk(clk),
		.clk_100(clk_sdram),
		.rst_n(rst_n),
		.key(),
		//camera fifo IO
		.rd_en(rd_fifo),
		.data_count_r(data_count_r),
		.dout(dout),
		//camera pinouts
		.cmos_pclk(cmos_pclk),
		.cmos_href(cmos_href),
		.cmos_vsync(cmos_vsync),
		.cmos_db(cmos_db),
		.cmos_sda(cmos_sda),
		.cmos_scl(cmos_scl), 
		.cmos_rst_n(cmos_rst_n),
		.cmos_pwdn(cmos_pwdn),
		.cmos_xclk(cmos_xclk),
		//Debugging
		.led(led) //lights up after successful SCCB transfer
    );
	 
	 sdram_interface m1 //control logic for writing the pixel-data from camera to sdram and reading pixel-data from sdram to vga
	 (
		.clk(clk_sdram),
		.rst_n(rst_n),
		.clk_vga(clk_vga),
		.rd_en(rd_en),
		.sobel(sobel),
		//fifo for camera
		.data_count_camera_fifo(data_count_r),
		.din(dout),
		.rd_camera(rd_fifo),
		//fifo for vga
		.empty_fifo(empty_fifo),
		.dout(din),
		//controller to sdram
		.sdram_cke(sdram_cke), 
		.sdram_cs_n(sdram_cs_n),
		.sdram_ras_n(sdram_ras_n),
		.sdram_cas_n(sdram_cas_n),
		.sdram_we_n(sdram_we_n), 
		.sdram_addr(sdram_addr),
		.sdram_ba(sdram_ba), 
		.sdram_dqm(sdram_dqm),
		.sdram_dq(sdram_dq)
    );
	 
	 vga_interface m2 //control logic for retrieving data from sdram, storing data to asyn_fifo, and sending data to vga
	 (
		.clk(clk),
		.rst_n(rst_n),
		.sobel(sobel),
		//asyn_fifo IO
		.empty_fifo(empty_fifo),
		.din(din),
		.clk_vga(clk_vga),
		.rd_en(rd_en),
		.threshold(threshold),
		//VGA output
		.vga_out_r(vga_out_r),
		.vga_out_g(vga_out_g),
		.vga_out_b(vga_out_b),
		.vga_out_vs(vga_out_vs),
		.vga_out_hs(vga_out_hs)
    );
	 
	 debounce_explicit m3
	(
		.clk(clk),
		.rst_n(rst_n),
		.sw({!key[0]}),
		.db_level(),
		.db_tick(key1_tick)
    );
	 
	 debounce_explicit m4
	(
		.clk(clk),
		.rst_n(rst_n),
		.sw({!key[1]}),
		.db_level(),
		.db_tick(key2_tick)
    );
	 
	 debounce_explicit m5
	(
		.clk(clk),
		.rst_n(rst_n),
		.sw({!key[2]}),
		.db_level(),
		.db_tick(key3_tick)
    );
	
	//SDRAM clock
	dcm_165MHz m6
   (// Clock in ports
    .clk(clk),      // IN
    // Clock out ports
    .clk_sdram(clk_sdram),     // OUT
    // Status and control signals
    .RESET(RESET),// IN
    .LOCKED(LOCKED));      // OUT
	 
	 
	//ERROR APPEARS IF ODDR2 IS ROUTED INSIDE THE FPGA INSTEAD OF BEING DIRECTLY CONNECTED TO OUTPUT (thus we bring this outside instead of being inside the sdram_controller module)
	 ODDR2#(.DDR_ALIGNMENT("NONE"), .INIT(1'b0),.SRTYPE("SYNC")) oddr2_primitive
	 (
		.D0(1'b0),
		.D1(1'b1),
		.C0(clk_sdram),
		.C1(~clk_sdram),
		.CE(1'b1),
		.R(1'b0),
		.S(1'b0),
		.Q(sdram_clk)
	);
	
	


endmodule
