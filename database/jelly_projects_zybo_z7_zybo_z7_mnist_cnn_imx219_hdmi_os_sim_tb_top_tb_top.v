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
		$dumpvars(2, tb_top.i_top.i_video_mnist);
		$dumpvars(0, tb_top.i_top.i_video_mnist.i_video_tbl_modulator);
		$dumpvars(0, tb_top.i_top.i_video_integrator_bram);
		
		/*
		$dumpvars(0, tb_top.i_top.i_axi4s_debug_monitor_csi2);
		$dumpvars(0, tb_top.i_top.i_axi4s_debug_monitor_mcol);
		$dumpvars(0, tb_top.i_top.i_axi4s_debug_monitor_vout);
		$dumpvars(1, tb_top.i_axi4s_master_model);
		$dumpvars(1, tb_top.i_top.i_video_mnist);
		$dumpvars(1, tb_top.i_top.i_vdma_axi4_to_axi4s);
		*/
//		$dumpvars(0, tb_top.i_top.i_video_normalizer);
		
	#100000000
		$finish;
	end
	
	reg		clk125 = 1'b1;
	always #(RATE125/2.0)	clk125 = ~clk125;
	
	localparam	X_NUM = 512;
	localparam	Y_NUM = 128;
	
	
	top
			#(
				.X_NUM			(X_NUM),
				.Y_NUM			(Y_NUM)
			)
		i_top
			(
				.in_clk125		(clk125),
				
				.push_sw		(0),
				.dip_sw			(0),
				.led			(),
				.pmod_a			()
			);
	
	
	
	
	// ----------------------------------
	//  dummy video
	// ----------------------------------
	
	reg				axi4s_model_aresetn = 1'b0;
//	wire			axi4s_model_aresetn = i_top.axi4s_cam_aresetn;
	wire			axi4s_model_aclk    = i_top.axi4s_cam_aclk;
	wire	[0:0]	axi4s_model_tuser;
	wire			axi4s_model_tlast;
	wire	[7:0]	axi4s_model_tdata;
	wire			axi4s_model_tvalid;
	wire			axi4s_model_tready = i_top.axi4s_csi2_tready;
	
	jelly_axi4s_master_model
			#(
				.AXI4S_DATA_WIDTH	(8),
				.X_NUM				(X_NUM),
				.Y_NUM				(Y_NUM),
	//			.PGM_FILE			("lena_128x128.pgm"),
				.PGM_FILE			("mnist_test_512x128.pgm"),
				.BUSY_RATE			(0),
				.RANDOM_SEED		(0)
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
	//  save output
	// ----------------------------------
	
	jelly_axi4s_slave_model
			#(
				.COMPONENT_NUM    	(3),
				.DATA_WIDTH       	(10),
				.INIT_FRAME_NUM   	(0),
				.FRAME_WIDTH      	(32),
				.X_WIDTH          	(32),
				.Y_WIDTH          	(32),
				.FILE_NAME        	("rgb_%04d.ppm"),
				.MAX_PATH         	(64),
				.BUSY_RATE        	(0)
			)
		i_axi4s_slave_model_rgb
			(
				.aresetn			(i_top.axi4s_cam_aresetn),
				.aclk				(i_top.axi4s_cam_aclk),
				.aclken				(1),
				
				.param_width		(X_NUM),
				.param_height		(Y_NUM),
				
				.s_axi4s_tuser		(i_top.axi4s_rgb_tuser),
				.s_axi4s_tlast		(i_top.axi4s_rgb_tlast),
				.s_axi4s_tdata		(i_top.axi4s_rgb_tdata[29:0]),
				.s_axi4s_tvalid		(i_top.axi4s_rgb_tvalid & i_top.axi4s_rgb_tready),
				.s_axi4s_tready		()
			);
	
	jelly_axi4s_slave_model
			#(
				.COMPONENT_NUM    	(3),
				.DATA_WIDTH       	(8),
				.INIT_FRAME_NUM   	(0),
				.FRAME_WIDTH      	(32),
				.X_WIDTH          	(32),
				.Y_WIDTH          	(32),
				.FILE_NAME        	("col_%04d.ppm"),
				.MAX_PATH         	(64),
				.BUSY_RATE        	(0)
			)
		i_axi4s_slave_model_mcol
			(
				.aresetn			(i_top.axi4s_cam_aresetn),
				.aclk				(i_top.axi4s_cam_aclk),
				.aclken				(1),
				
				.param_width		(X_NUM),
				.param_height		(Y_NUM),
				
				.s_axi4s_tuser		(i_top.axi4s_mcol_tuser),
				.s_axi4s_tlast		(i_top.axi4s_mcol_tlast),
				.s_axi4s_tdata		(i_top.axi4s_mcol_tdata[23:0]),
				.s_axi4s_tvalid		(i_top.axi4s_mcol_tvalid & i_top.axi4s_mcol_tready),
				.s_axi4s_tready		()
			);
	
	
	
	wire			vout_vsync = i_top.vout_vsync;
	wire			vout_hsync = i_top.vout_hsync;
	wire			vout_de    = i_top.vout_de   ;
	wire	[23:0]	vout_data  = i_top.vout_data ;
	wire	[3:0]	vout_ctl   = i_top.vout_ctl  ;
	
	jelly_axi4s_slave_model
			#(
				.COMPONENT_NUM    	(3),
				.DATA_WIDTH       	(8),
				.INIT_FRAME_NUM   	(0),
				.FRAME_WIDTH      	(32),
				.X_WIDTH          	(32),
				.Y_WIDTH          	(32),
				.FILE_NAME        	("img_%04d.ppm"),
				.MAX_PATH         	(64),
				.BUSY_RATE        	(0)
			)
		i_axi4s_slave_model_vout
			(
				.aresetn			(~i_top.vout_reset),
				.aclk				(i_top.vout_clk),
				.aclken				(1),
				
				.param_width		(1280),
				.param_height		(720),
				
				.s_axi4s_tuser		(i_top.axi4s_vout_tuser),
				.s_axi4s_tlast		(i_top.axi4s_vout_tlast),
				.s_axi4s_tdata		(i_top.axi4s_vout_tdata[23:0]),
				.s_axi4s_tvalid		(i_top.axi4s_vout_tvalid & i_top.axi4s_vout_tready),
				.s_axi4s_tready		()
			);
	
	
	
	
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
	#10000;
		$display("start");
		wb_write(32'h00010010, 32'h00, 4'b1111);
	#10000;
		
		// normarizer
		wb_write(32'h40011020, X_NUM, 4'b1111);				// width
		wb_write(32'h40011024, Y_NUM, 4'b1111);				// height
		wb_write(32'h40011028,     0, 4'b1111);				// fill
		wb_write(32'h4001102c,  1024, 4'b1111);				// timeout
		wb_write(32'h40011000,     1, 4'b1111);				// enable
		
		
		wb_write(32'h40012000, 0, 4'hf);	// DEMOSAIC_REG_PARAM_PHASE
		
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
		
		wb_write(32'h4001a000, 32'hf4, 4'hf);	// INTEGRATOR_REG_PARAM_RATE
		
		
	#10000;
		// vin write DMA
		wb_write(32'h40010020, 32'h30000000, 4'b1111);
		wb_write(32'h40010024,      4*X_NUM, 4'b1111);		// stride
		wb_write(32'h40010028,        X_NUM, 4'b1111);		// width
		wb_write(32'h4001002c,        Y_NUM, 4'b1111);		// height
		wb_write(32'h40010030,  X_NUM*Y_NUM, 4'b1111);		// size
		wb_write(32'h4001003c,           31, 4'b1111);		// awlen
		wb_write(32'h40010010,            3, 4'b1111);
		axi4s_model_aresetn = 1'b1;

	#100000;
		// vout read DMA
		wb_write(32'h40020020, 32'h30000000, 4'b1111);
		wb_write(32'h40020024,      4*X_NUM, 4'b1111);		// stride
		wb_write(32'h40020028,         1280, 4'b1111);		// width
		wb_write(32'h4002002c,          720, 4'b1111);		// height
		wb_write(32'h40020030,     1280*720, 4'b1111);		// size
		wb_write(32'h4002003c,           31, 4'b1111);		// awlen
		wb_write(32'h40020010,            3, 4'b1111);		// control
		
		// vout vsync generator
		wb_write(32'h40021010,            1, 4'b1111);		// control
	end
	
	
endmodule


`default_nettype wire


// end of file
