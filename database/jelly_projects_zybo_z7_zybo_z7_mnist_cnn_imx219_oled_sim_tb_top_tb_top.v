// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2018 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
	localparam RATE125 = 1000.0/125.0;
	
	initial begin
		$dumpfile("tb_top.vcd");
		$dumpvars(1, tb_top);
		$dumpvars(1, tb_top.i_top);
//		$dumpvars(1, tb_top.i_top.i_video_rgb_to_gray);
//		$dumpvars(0, tb_top.i_top.i_video_raw_to_rgb);
		$dumpvars(1, tb_top.i_top.i_video_mnist);
		$dumpvars(0, tb_top.i_top.i_video_mnist.i_video_integrator_bram_classifier);
		$dumpvars(0, tb_top.i_top.i_video_mnist.i_video_integrator_bram_detect);
//		$dumpvars(0, tb_top.i_top.i_video_normalizer);
//		$dumpvars(0, tb_top.i_top.i_video_tbl_modulator);
		$dumpvars(0, tb_top.i_top.i_video_mnist_color);
//		$dumpvars(0, tb_top.i_top.i_video_dnn_fmem);
//		$dumpvars(0, tb_top.i_top.i_video_mnist.i_video_dnn_max_count);
//		$dumpvars(0, tb_top.i_top.i_video_trimming_core);
//		$dumpvars(0, tb_top.i_top.i_video_oled_cnv);
//		$dumpvars(0, tb_top.i_top.i_oled_control);
//		$dumpvars(0, tb_top.i_top.i_video_raw_to_rgb);
//		$dumpvars(0, tb_top.i_top.i_video_normalizer);
//		$dumpvars(0, tb_top.i_top.i_video_resize_half_core);
//		$dumpvars(0, tb_top.i_axi4s_master_model);
		
	#20000000
		$finish;
	end
	
	reg		clk125 = 1'b1;
	always #(RATE125/2.0)	clk125 = ~clk125;
	
	
	
	
//	localparam IMG_X_NUM = 256;
//	localparam IMG_Y_NUM = 256;
//	localparam PGM_FILE  = "lena_256x256.pgm";
	
//	localparam IMG_X_NUM = 160;
//	localparam IMG_Y_NUM = 120;
//	localparam PGM_FILE  = "mnist_test_160x120.pgm";
	
	localparam IMG_X_NUM = 640;
	localparam IMG_Y_NUM = 132;
	localparam PGM_FILE  = "mnist_test_640x480.pgm";
	
	
	// ----------------------------------
	//  TOP
	// ----------------------------------
	
	top
			#(
				.WITH_HDMI_TX	(0),
				.X_NUM			(IMG_X_NUM),
				.Y_NUM			(IMG_Y_NUM)
			)
		i_top
			(
				.in_clk125		(clk125),
				
				.push_sw		(0),
				.dip_sw			(0),
				.led			(),
				.pmod_a			()
			);
	
	
	// debug
	wire	[2:0]	axi4s_count_tcount0 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[0*3 +: 3];
	wire	[2:0]	axi4s_count_tcount1 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[1*3 +: 3];
	wire	[2:0]	axi4s_count_tcount2 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[2*3 +: 3];
	wire	[2:0]	axi4s_count_tcount3 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[3*3 +: 3];
	wire	[2:0]	axi4s_count_tcount4 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[4*3 +: 3];
	wire	[2:0]	axi4s_count_tcount5 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[5*3 +: 3];
	wire	[2:0]	axi4s_count_tcount6 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[6*3 +: 3];
	wire	[2:0]	axi4s_count_tcount7 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[7*3 +: 3];
	wire	[2:0]	axi4s_count_tcount8 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[8*3 +: 3];
	wire	[2:0]	axi4s_count_tcount9 = tb_top.i_top.i_video_mnist.axi4s_count_tcount[9*3 +: 3];
	
	
	// ----------------------------------
	//  dummy video
	// ----------------------------------
	
	reg				axi4s_model_aresetn = 1'b0;
	wire			axi4s_model_aclk    = i_top.axi4s_cam_aclk;
	wire	[0:0]	axi4s_model_tuser;
	wire			axi4s_model_tlast;
	wire	[7:0]	axi4s_model_tdata;
	wire			axi4s_model_tvalid;
	wire			axi4s_model_tready = i_top.axi4s_csi2_tready;
	
	jelly_axi4s_master_model
			#(
				.AXI4S_DATA_WIDTH	(8),
				.X_NUM				(IMG_X_NUM),
				.Y_NUM				(IMG_Y_NUM),
				.PGM_FILE			(PGM_FILE),
				.BUSY_RATE			(5),
				.RANDOM_SEED		(2374),
				.INTERVAL			(1000)
			)
		i_axi4s_master_model
			(
				.aresetn			(axi4s_model_aresetn),
				.aclk				(axi4s_model_aclk),
				
				.m_axi4s_tuser		(axi4s_model_tuser),
				.m_axi4s_tlast		(axi4s_model_tlast),
				.m_axi4s_tdata		(axi4s_model_tdata),
				.m_axi4s_tvalid		(axi4s_model_tvalid),
				.m_axi4s_tready		(axi4s_model_tready)
			);
	
	initial begin
		force i_top.axi4s_csi2_tuser  = axi4s_model_tuser;
		force i_top.axi4s_csi2_tlast  = axi4s_model_tlast;
		force i_top.axi4s_csi2_tdata  = {axi4s_model_tdata, 2'd0};
		force i_top.axi4s_csi2_tvalid = axi4s_model_tvalid;
	end
	
	
	
	
	// ----------------------------------
	//  image dump
	// ----------------------------------
	
	localparam FRAME_NUM = 6;
	
	wire			axi4s_dump0_aresetn = ~i_top.oled_reset;
	wire			axi4s_dump0_aclk    = i_top.oled_clk;
	wire	[0:0]	axi4s_dump0_tuser   = i_top.axi4s_oledfifo_tuser;
	wire			axi4s_dump0_tlast   = i_top.axi4s_oledfifo_tlast;
	wire	[23:0]	axi4s_dump0_tdata   = i_top.axi4s_oledfifo_tdata;
	wire			axi4s_dump0_tvalid  = i_top.axi4s_oledfifo_tvalid;
	wire			axi4s_dump0_tready  = i_top.axi4s_oledfifo_tready;
	
	integer		fp_img0;
	initial begin
		 fp_img0 = $fopen("out_img0.ppm", "w");
		 $fdisplay(fp_img0, "P3");
		 $fdisplay(fp_img0, "%d %d", 96, 64*FRAME_NUM);
		 $fdisplay(fp_img0, "255");
	end
	
	always @(posedge axi4s_dump0_aclk) begin
		if ( axi4s_dump0_aresetn && axi4s_dump0_tvalid && axi4s_dump0_tready ) begin
			 $fdisplay(fp_img0, "%d %d %d", axi4s_dump0_tdata[0*8 +: 8], axi4s_dump0_tdata[1*8 +: 8], axi4s_dump0_tdata[2*8 +: 8]);
		end
	end
	
	/*
	integer frame_count = 0;
	always @(posedge clk) begin
		if ( !reset && m_axi4s_tuser[0] && m_axi4s_tvalid && m_axi4s_tready ) begin
			$display("frame : %d", frame_count);
			frame_count = frame_count + 1;
			if ( frame_count > FRAME_NUM+1 ) begin
				$finish();
			end
		end
	end
	*/
	
	
//	wire			axi4s_dump1_aresetn = i_top.axi4s_cam_aresetn;
//	wire			axi4s_dump1_aclk    = i_top.axi4s_cam_aclk;
//	wire	[0:0]	axi4s_dump1_tuser   = i_top.axi4s_norm_tuser;
//	wire			axi4s_dump1_tlast   = i_top.axi4s_norm_tlast;
//	wire	[23:0]	axi4s_dump1_tdata   = {3{i_top.axi4s_norm_tdata[9:2]}};
//	wire			axi4s_dump1_tvalid  = i_top.axi4s_norm_tvalid;
//	wire			axi4s_dump1_tready  = i_top.axi4s_norm_tready;
	
	wire			axi4s_dump1_aresetn = i_top.axi4s_cam_aresetn;
	wire			axi4s_dump1_aclk    = i_top.axi4s_cam_aclk;
	wire	[0:0]	axi4s_dump1_tuser   = i_top.axi4s_mcol_tuser;
	wire			axi4s_dump1_tlast   = i_top.axi4s_mcol_tlast;
	wire	[23:0]	axi4s_dump1_tdata   = i_top.axi4s_mcol_tdata;
	wire			axi4s_dump1_tvalid  = i_top.axi4s_mcol_tvalid;
	wire			axi4s_dump1_tready  = i_top.axi4s_mcol_tready;
	
//	wire			axi4s_dump1_aresetn = i_top.axi4s_cam_aresetn;
//	wire			axi4s_dump1_aclk    = i_top.axi4s_cam_aclk;
//	wire	[0:0]	axi4s_dump1_tuser   = i_top.axi4s_gray_tuser;
//	wire			axi4s_dump1_tlast   = i_top.axi4s_gray_tlast;
//	wire	[23:0]	axi4s_dump1_tdata   = {3{i_top.axi4s_gray_tdata[9:2]}};
//	wire			axi4s_dump1_tvalid  = i_top.axi4s_gray_tvalid;
//	wire			axi4s_dump1_tready  = 1'b1;
	
	integer		fp_img1;
	initial begin
		 fp_img1 = $fopen("out_img1.ppm", "w");
		 $fdisplay(fp_img1, "P3");
		 $fdisplay(fp_img1, "%d %d", IMG_X_NUM, IMG_Y_NUM*FRAME_NUM);
		 $fdisplay(fp_img1, "255");
	end
	
	always @(posedge axi4s_dump1_aclk) begin
		if ( axi4s_dump1_aresetn && axi4s_dump1_tvalid && axi4s_dump1_tready ) begin
			 $fdisplay(fp_img1, "%d %d %d", axi4s_dump1_tdata[2*8 +: 8], axi4s_dump1_tdata[1*8 +: 8], axi4s_dump1_tdata[0*8 +: 8]);
		end
	end
	
	
	wire			axi4s_dump2_aresetn = ~i_top.oled_reset;
	wire			axi4s_dump2_aclk    = i_top.oled_clk;
	wire	[0:0]	axi4s_dump2_tuser   = i_top.axi4s_oled_tuser;
	wire			axi4s_dump2_tlast   = i_top.axi4s_oled_tlast;
	wire	[23:0]	axi4s_dump2_tdata   = i_top.axi4s_oled_tdata;
	wire			axi4s_dump2_tvalid  = i_top.axi4s_oled_tvalid;
	wire			axi4s_dump2_tready  = i_top.axi4s_oled_tready;
	
	integer		fp_img2;
	initial begin
		 fp_img2 = $fopen("out_img2.ppm", "w");
		 $fdisplay(fp_img2, "P3");
		 $fdisplay(fp_img2, "%d %d", 96, 64*FRAME_NUM);
		 $fdisplay(fp_img2, "15");
	end
	
	always @(posedge axi4s_dump2_aclk) begin
		if ( axi4s_dump2_aresetn && axi4s_dump2_tvalid && axi4s_dump2_tready ) begin
			 $fdisplay(fp_img2, "%d %d %d", {axi4s_dump2_tdata[1:0], 1'b0}, axi4s_dump2_tdata[4:2], axi4s_dump2_tdata[7:5]);
		end
	end
	
	
	
	integer		fp_detect;
	initial begin
		 fp_detect = $fopen("detect.pgm", "w");
		 $fdisplay(fp_detect, "P2");
		 $fdisplay(fp_detect, "%d %d", IMG_X_NUM/4, IMG_Y_NUM/4*FRAME_NUM);
		 $fdisplay(fp_detect, "1");
	end
	
	always @(posedge i_top.axi4s_cam_aclk) begin
		if ( i_top.axi4s_cam_aresetn && i_top.axi4s_mnist_tvalid ) begin
			 $fdisplay(fp_detect, "%d", i_top.axi4s_mnist_tdetect);
		end
	end
	
	integer		fp_bin;
	initial begin
		 fp_bin = $fopen("bin.pgm", "w");
		 $fdisplay(fp_bin, "P2");
		 $fdisplay(fp_bin, "%d %d", IMG_X_NUM, IMG_Y_NUM*FRAME_NUM);
		 $fdisplay(fp_bin, "1");
	end
	
	always @(posedge i_top.axi4s_cam_aclk) begin
		if ( i_top.axi4s_cam_aresetn && i_top.axi4s_bin_tvalid && i_top.axi4s_bin_tready ) begin
			 $fdisplay(fp_bin, "%d", i_top.axi4s_bin_tbinary);
		end
	end
	
	
	
	
	// ----------------------------------
	//  WISHBONE master
	// ----------------------------------
	
	parameter	WB_ADR_WIDTH        = 30;
	parameter	WB_DAT_WIDTH        = 32;
	parameter	WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8);
	
	wire							wb_rst_i = i_top.wb_rst_o;
	wire							wb_clk_i = i_top.wb_clk_o;
	reg		[WB_ADR_WIDTH-1:0]		wb_adr_o;
	wire	[WB_DAT_WIDTH-1:0]		wb_dat_i = i_top.wb_host_dat_i;
	reg		[WB_DAT_WIDTH-1:0]		wb_dat_o;
	reg								wb_we_o;
	reg		[WB_SEL_WIDTH-1:0]		wb_sel_o;
	reg								wb_stb_o = 0;
	wire							wb_ack_i = i_top.wb_host_ack_i;
	
	initial begin
		force i_top.wb_host_adr_o = wb_adr_o;
		force i_top.wb_host_dat_o = wb_dat_o;
		force i_top.wb_host_we_o  = wb_we_o;
		force i_top.wb_host_sel_o = wb_sel_o;
		force i_top.wb_host_stb_o = wb_stb_o;
	end
	
	
	reg		[WB_DAT_WIDTH-1:0]		reg_wb_dat;
	reg								reg_wb_ack;
	always @(posedge wb_clk_i) begin
		if ( ~wb_we_o & wb_stb_o & wb_ack_i ) begin
			reg_wb_dat <= wb_dat_i;
		end
		reg_wb_ack <= wb_ack_i;
	end
	
	
	task wb_write(
				input [31:0]	adr,
				input [31:0]	dat,
				input [3:0]		sel
			);
	begin
		$display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
		@(negedge wb_clk_i);
			wb_adr_o = (adr >> 2);
			wb_dat_o = dat;
			wb_sel_o = sel;
			wb_we_o  = 1'b1;
			wb_stb_o = 1'b1;
		@(negedge wb_clk_i);
			while ( reg_wb_ack == 1'b0 ) begin
				@(negedge wb_clk_i);
			end
			wb_adr_o = {WB_ADR_WIDTH{1'bx}};
			wb_dat_o = {WB_DAT_WIDTH{1'bx}};
			wb_sel_o = {WB_SEL_WIDTH{1'bx}};
			wb_we_o  = 1'bx;
			wb_stb_o = 1'b0;
	end
	endtask
	
	task wb_read(
				input [31:0]	adr
			);
	begin
		@(negedge wb_clk_i);
			wb_adr_o = (adr >> 2);
			wb_dat_o = {WB_DAT_WIDTH{1'bx}};
			wb_sel_o = {WB_SEL_WIDTH{1'b1}};
			wb_we_o  = 1'b0;
			wb_stb_o = 1'b1;
		@(negedge wb_clk_i);
			while ( reg_wb_ack == 1'b0 ) begin
				@(negedge wb_clk_i);
			end
			wb_adr_o = {WB_ADR_WIDTH{1'bx}};
			wb_dat_o = {WB_DAT_WIDTH{1'bx}};
			wb_sel_o = {WB_SEL_WIDTH{1'bx}};
			wb_we_o  = 1'bx;
			wb_stb_o = 1'b0;
			$display("WISHBONE_READ(adr:%h dat:%h)", adr, reg_wb_dat);
	end
	endtask
	
	
	
	initial begin
	@(negedge wb_rst_i);
	#1000;
		$display("start");
		wb_write(32'h00010010,     32'h00, 4'hf);
	#1000;
		
		// OLED
		wb_write(32'h4002200c,          1, 4'hf);
		
		// demosaic
		wb_write(32'h40012004,          1, 4'hf);		// bypass
		
		// normarizer
		wb_write(32'h40011020,  IMG_X_NUM, 4'hf);		// width
		wb_write(32'h40011024,  IMG_Y_NUM, 4'hf);		// height
		wb_write(32'h40011028,          0, 4'hf);		// fill
		wb_write(32'h4001102c,          0, 4'hf);		// timeout
		wb_write(32'h40011000,          1, 4'hf);		// enable
		
		// pwm
		/*
		wb_write(32'h40018100 + 4*0,  32'h10, 4'hf);
		wb_write(32'h40018100 + 4*1,  32'hf0, 4'hf);
		wb_write(32'h40018100 + 4*2,  32'h70, 4'hf);
		wb_write(32'h40018100 + 4*3,  32'h90, 4'hf);
		wb_write(32'h40018100 + 4*4,  32'h30, 4'hf);
		wb_write(32'h40018100 + 4*5,  32'hd0, 4'hf);
		wb_write(32'h40018100 + 4*6,  32'h50, 4'hf);
		wb_write(32'h40018100 + 4*7,  32'hb0, 4'hf);
		wb_write(32'h40018100 + 4*8,  32'h20, 4'hf);
		wb_write(32'h40018100 + 4*9,  32'he0, 4'hf);
		wb_write(32'h40018100 + 4*10, 32'h60, 4'hf);
		wb_write(32'h40018100 + 4*11, 32'ha0, 4'hf);
		wb_write(32'h40018100 + 4*12, 32'h40, 4'hf);
		wb_write(32'h40018100 + 4*13, 32'hc0, 4'hf);
		wb_write(32'h40018100 + 4*14, 32'h80, 4'hf);
		wb_write(32'h40018010, 14, 4'hf);		 // MNIST_MOD_REG_PARAM_END
		*/
		
		wb_write(32'h40015000, 32'h00, 4'hf);	// LPF rate
		wb_write(32'h40015040, 32'h00, 4'hf);	// LPF rate
		
		wb_write(32'h40019008, 127, 4'hf);	// color th0
		wb_write(32'h4001900c, 127, 4'hf);	// color th1
		
		
	#1000;
		// vin start
		$display("vin start");
		axi4s_model_aresetn = 1'b1;
		
	#100000;
		wb_write(32'h40010020, 32'h30000000 + 1506560, 4'b1111);
		wb_write(32'h40010024, 1280*4,       4'b1111);			// stride
		wb_write(32'h40010028, IMG_X_NUM,    4'b1111);			// width
		wb_write(32'h4001002c, IMG_Y_NUM,    4'b1111);			// height
		wb_write(32'h40010030, IMG_X_NUM*IMG_Y_NUM, 4'b1111);	// size
		wb_write(32'h4001003c,      31, 4'b1111);				// awlen
		wb_write(32'h40010010,       3, 4'b1111);
	#10000;

		wb_read(32'h40010014);
		wb_read(32'h40010014);
		wb_read(32'h40010014);
		wb_read(32'h40010014);
	#10000;
		/*
		wb_write(32'h40010010,      0, 4'b1111);
		
		// 取り込み完了を待つ
		wb_read(32'h40010014);
		while ( reg_wb_dat != 0 ) begin
			#10000;
			wb_read(32'h40010014);
		end
		#10000;
		*/
		
		
		
		/*
		// サイズを不整合で書いてみる
		wb_write(32'h40010020, 32'h30000000, 4'b1111);
		wb_write(32'h40010024, 128*4, 4'b1111);			// stride
		wb_write(32'h40010028, 256+64, 4'b1111);		// width
		wb_write(32'h4001002c,     64, 4'b1111);		// height
		wb_write(32'h40010030, 256*64, 4'b1111);		// size
		wb_write(32'h4001003c,     31, 4'b1111);		// awlen
		wb_write(32'h40010010,      7, 4'b1111);
	#10000;
		
		// 取り込み完了を待つ
		wb_read(32'h40010014);
		while ( reg_wb_dat != 0 ) begin
			#10000;
			wb_read(32'h40010014);
		end
		#10000;
		*/
		
	end
	
	
endmodule


`default_nettype wire


// end of file
