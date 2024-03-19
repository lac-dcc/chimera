// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2018 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
	localparam RATE125  = 1000.0/125.0;
	localparam VIN_RATE = 1000.0/75.3;
	
	initial begin
		$dumpfile("tb_top.vcd");
		$dumpvars(1, tb_top);
		$dumpvars(0, tb_top.i_top);
		
	#100000000
		$finish;
	end
	
//	parameter	X_NUM = 1920;
//	parameter	Y_NUM = 1080;
	parameter	X_NUM = 640;
	parameter	Y_NUM = 480;
	
	reg		reset = 1'b1;
	initial #200			reset = 1'b0;
	
	reg		clk125 = 1'b1;
	always #(RATE125/2.0)	clk125 = ~clk125;
	
	reg		vin_clk = 1'b1;
	always #(VIN_RATE/2.0)	vin_clk = ~vin_clk;
	
	
	// TOP
	top
			#(
				.HDMI_TX				(0),
				.HDMI_RX				(0),
				.VOUT_X_NUM				(X_NUM),
				.VOUT_Y_NUM				(Y_NUM),
				.TEXMEM_READMEMH		(1),
				.TEXMEM_READMEM_FILE0	("image0.hex"),
				.TEXMEM_READMEM_FILE1	("image1.hex"),
				.TEXMEM_READMEM_FILE2	("image2.hex"),
				.TEXMEM_READMEM_FILE3	("image3.hex"),
				.DEVICE					("RTL")
			)
		i_top
			(
				.in_clk125	(clk125),
				
				.led		()
			);
	
	wire					axi4s_vin_aresetn = ~reset;
	wire					axi4s_vin_aclk    = vin_clk;
	wire	[0:0]			axi4s_vin_tuser;
	wire					axi4s_vin_tlast;
	wire	[23:0]			axi4s_vin_tdata;
	wire					axi4s_vin_tvalid;
	wire					axi4s_vin_tready  = i_top.axi4s_vin_tready;
	
	initial begin
		force	i_top.axi4s_vin_aresetn = axi4s_vin_aresetn;
		force	i_top.axi4s_vin_aclk    = axi4s_vin_aclk;
		force	i_top.axi4s_vin_tuser   = axi4s_vin_tuser;
		force	i_top.axi4s_vin_tlast   = axi4s_vin_tlast;
		force	i_top.axi4s_vin_tdata   = axi4s_vin_tdata;
		force	i_top.axi4s_vin_tvalid  = axi4s_vin_tvalid;
	end
	
	
	// HDMI RX
	jelly_axi4s_master_model
			#(
				.AXI4S_DATA_WIDTH	(24),
				.X_NUM				(640),
				.Y_NUM				(480),
				.PPM_FILE			("Chrysanthemum.ppm"),
				.BUSY_RATE			(10),
				.RANDOM_SEED		(0)
			)
		i_axi4s_master_model
			(
				.aresetn			(axi4s_vin_aresetn),
				.aclk				(axi4s_vin_aclk),
				
				.m_axi4s_tuser		(axi4s_vin_tuser),
				.m_axi4s_tlast		(axi4s_vin_tlast),
				.m_axi4s_tdata		(axi4s_vin_tdata),
				.m_axi4s_tvalid		(axi4s_vin_tvalid),
				.m_axi4s_tready		(axi4s_vin_tready)
			);
	
	/*
	integer		fp_vin;
	initial begin
		 fp_vin = $fopen("vin_img.ppm", "w");
		 $fdisplay(fp_vin, "P3");
		 $fdisplay(fp_vin, "%d %d", 640, 480);
		 $fdisplay(fp_vin, "255");
	end
	
	always @(posedge axi4s_vin_aclk) begin
		if ( axi4s_vin_aresetn && axi4s_vin_tvalid && axi4s_vin_tready ) begin
			 $fdisplay(fp_vin, "%d %d %d",
			 	axi4s_vin_tdata[8*0 +: 8],		// r
			 	axi4s_vin_tdata[8*1 +: 8],		// g
			 	axi4s_vin_tdata[8*2 +: 8]);		// b
		end
	end
	
	
	// trim
	wire	[0:0]			axi4s_trim_tuser  = i_top.axi4s_trim_tuser;
	wire					axi4s_trim_tlast  = i_top.axi4s_trim_tlast;
	wire	[23:0]			axi4s_trim_tdata  = i_top.axi4s_trim_tdata;
	wire					axi4s_trim_tvalid = i_top.axi4s_trim_tvalid;
	wire					axi4s_trim_tready = i_top.axi4s_trim_tready;
	integer		fp_trim;
	initial begin
		 fp_trim = $fopen("trim_img.ppm", "w");
		 $fdisplay(fp_trim, "P3");
		 $fdisplay(fp_trim, "%d %d", 256, 256);
		 $fdisplay(fp_trim, "255");
	end
	
	always @(posedge axi4s_vin_aclk) begin
		if ( axi4s_vin_aresetn && axi4s_trim_tvalid && axi4s_trim_tready ) begin
			 $fdisplay(fp_trim, "%d %d %d",
			 	axi4s_trim_tdata[8*0 +: 8],		// r
			 	axi4s_trim_tdata[8*1 +: 8],		// g
			 	axi4s_trim_tdata[8*2 +: 8]);		// b
		end
	end
	*/
	
	// texmem
	wire					texmem_reset = i_top.texmem_reset;
	wire					texmem_clk   = i_top.texmem_clk;
	wire					texmem_we    = i_top.texmem_we;
	wire	[7:0]			texmem_addrx = i_top.texmem_addrx;
	wire	[7:0]			texmem_addry = i_top.texmem_addry;
	wire	[23:0]			texmem_wdata = i_top.texmem_wdata;
	
	integer		fp_tex;
	initial begin
		 fp_tex = $fopen("tex_img.ppm", "w");
		 $fdisplay(fp_tex, "P3");
		 $fdisplay(fp_tex, "%d %d", 256, 256);
		 $fdisplay(fp_tex, "255");
	end
	
	always @(posedge texmem_clk) begin
		if ( !texmem_reset && texmem_we ) begin
			 $fdisplay(fp_tex, "%d %d %d",
			 	texmem_wdata[8*0 +: 8],		// r
			 	texmem_wdata[8*1 +: 8],		// g
			 	texmem_wdata[8*2 +: 8]);	// b
		end
	end
	
	
	
	// 出力保存
	wire			vout_reset        = i_top.vout_reset;
	wire			vout_clk          = i_top.vout_clk;
	wire	[0:0]	axi4s_vout_tuser  = i_top.axi4s_vout_tuser;
	wire			axi4s_vout_tlast  = i_top.axi4s_vout_tlast;
	wire	[23:0]	axi4s_vout_tdata  = i_top.axi4s_vout_tdata;
	wire			axi4s_vout_tvalid = i_top.axi4s_vout_tvalid;
	wire			axi4s_vout_tready = i_top.axi4s_vout_tready;
	
	integer			axi4s_vout_x = 0;
	always @(posedge vout_clk) begin
		if ( axi4s_vout_tvalid & axi4s_vout_tready ) begin
			axi4s_vout_x <= axi4s_vout_x + 1;
			if ( axi4s_vout_tlast ) begin
				axi4s_vout_x <= 0;
			end
		end
	end
	
	
	integer		fp;
	initial begin
		 fp = $fopen("out_img.ppm", "w");
		 $fdisplay(fp, "P3");
		 $fdisplay(fp, "%d %d", X_NUM, Y_NUM);
		 $fdisplay(fp, "255");
	end
	
	always @(posedge vout_clk) begin
		if ( !vout_reset && axi4s_vout_tvalid && axi4s_vout_tready ) begin
			 $fdisplay(fp, "%d %d %d",
			 	axi4s_vout_tdata[8*0 +: 8],		// r
			 	axi4s_vout_tdata[8*1 +: 8],		// g
			 	axi4s_vout_tdata[8*2 +: 8]);	// b
		end
	end
	
	
	
	// VOUT
	wire			vout_vsync = i_top.vout_vsync;
	wire			vout_hsync = i_top.vout_hsync;
	wire			vout_de    = i_top.vout_de;
	wire	[23:0]	vout_data  = i_top.vout_data;
	wire	[3:0]	vout_ctl   = i_top.vout_ctl;
	integer		fp_vout;
	initial begin
		 fp_vout = $fopen("vout_img.ppm", "w");
		 $fdisplay(fp_vout, "P3");
		 $fdisplay(fp_vout, "%d %d", X_NUM, Y_NUM*3);
		 $fdisplay(fp_vout, "255");
	end
	
	always @(posedge vout_clk) begin
		if ( !vout_reset && vout_de ) begin
			 $fdisplay(fp_vout, "%d %d %d",
			 	vout_data[8*0 +: 8],
			 	vout_data[8*1 +: 8],
			 	vout_data[8*2 +: 8]);
		end
	end
	
	
	
	
	// WISHBONE master
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
	#100
	
wb_write(32'h40104000, 32'hffffea7d, 4'hf);
wb_write(32'h40104004, 32'h0035b2e4, 4'hf);
wb_write(32'h40104008, 32'h0006f21c, 4'hf);
wb_write(32'h4010400c, 32'h000003d7, 4'hf);
wb_write(32'h40104010, 32'hfff67ca8, 4'hf);
wb_write(32'h40104014, 32'hffe3a0ba, 4'hf);
wb_write(32'h40104018, 32'hffffebba, 4'hf);
wb_write(32'h4010401c, 32'h00329a74, 4'hf);
wb_write(32'h40104020, 32'h001f598b, 4'hf);
wb_write(32'h40104024, 32'h0000029a, 4'hf);
wb_write(32'h40104028, 32'hfff99518, 4'hf);
wb_write(32'h4010402c, 32'hfffcb5b8, 4'hf);
wb_write(32'h40104030, 32'h00000528, 4'hf);
wb_write(32'h40104034, 32'hfff335a8, 4'hf);
wb_write(32'h40104038, 32'hffd0aa68, 4'hf);
wb_write(32'h4010403c, 32'hffffe76d, 4'hf);
wb_write(32'h40104040, 32'h003d575a, 4'hf);
wb_write(32'h40104044, 32'h00154504, 4'hf);
wb_write(32'h40104048, 32'h00000391, 4'hf);
wb_write(32'h4010404c, 32'hfff72f0b, 4'hf);
wb_write(32'h40104050, 32'hfff0dc68, 4'hf);
wb_write(32'h40104054, 32'hffffe904, 4'hf);
wb_write(32'h40104058, 32'h00395df7, 4'hf);
wb_write(32'h4010405c, 32'h00340e36, 4'hf);
wb_write(32'h40104060, 32'hfffffa35, 4'hf);
wb_write(32'h40104064, 32'h000e80f3, 4'hf);
wb_write(32'h40104068, 32'h00096670, 4'hf);
wb_write(32'h4010406c, 32'hfffff93e, 4'hf);
wb_write(32'h40104070, 32'h0010e700, 4'hf);
wb_write(32'h40104074, 32'h00011f68, 4'hf);
wb_write(32'h40104078, 32'hfffff77f, 4'hf);
wb_write(32'h4010407c, 32'h00154476, 4'hf);
wb_write(32'h40104080, 32'h0000251b, 4'hf);
wb_write(32'h40104084, 32'hfffff62e, 4'hf);
wb_write(32'h40104088, 32'h00188b76, 4'hf);
wb_write(32'h4010408c, 32'hfff798a4, 4'hf);
wb_write(32'h40108000, 32'hffffff4a, 4'hf);
wb_write(32'h40108004, 32'h0001c5cc, 4'hf);
wb_write(32'h40108008, 32'h000bccf2, 4'hf);
wb_write(32'h4010800c, 32'h00000111, 4'hf);
wb_write(32'h40108010, 32'hfffd5e8e, 4'hf);
wb_write(32'h40108014, 32'hfffea795, 4'hf);
wb_write(32'h40108018, 32'h000008c0, 4'hf);
wb_write(32'h4010801c, 32'hffea2863, 4'hf);
wb_write(32'h40108020, 32'hfffd2c7f, 4'hf);
wb_write(32'h40108024, 32'hffffff1e, 4'hf);
wb_write(32'h40108028, 32'h00023382, 4'hf);
wb_write(32'h4010802c, 32'h000ea7c1, 4'hf);
wb_write(32'h40108030, 32'hfffff611, 4'hf);
wb_write(32'h40108034, 32'h0018cb1d, 4'hf);
wb_write(32'h40108038, 32'h00167ed7, 4'hf);
wb_write(32'h4010803c, 32'hfffffdcb, 4'hf);
wb_write(32'h40108040, 32'h00057984, 4'hf);
wb_write(32'h40108044, 32'h00144863, 4'hf);
wb_write(32'h40108048, 32'h00000000, 4'hf);
wb_write(32'h4010804c, 32'h000004d5, 4'hf);
wb_write(32'h40108050, 32'h000ae755, 4'hf);
wb_write(32'h40108054, 32'h00000780, 4'hf);
wb_write(32'h40108058, 32'hffed3dc8, 4'hf);
wb_write(32'h4010805c, 32'hfffebfc9, 4'hf);
wb_write(32'h40108060, 32'h000003a7, 4'hf);
wb_write(32'h40108064, 32'hfff6fd7f, 4'hf);
wb_write(32'h40108068, 32'hfffb653c, 4'hf);
wb_write(32'h4010806c, 32'h000002b8, 4'hf);
wb_write(32'h40108070, 32'hfff93646, 4'hf);
wb_write(32'h40108074, 32'h00067e7a, 4'hf);
wb_write(32'h40108078, 32'hfffffbec, 4'hf);
wb_write(32'h4010807c, 32'h000a35d7, 4'hf);
wb_write(32'h40108080, 32'h00069d47, 4'hf);
wb_write(32'h40108084, 32'h0000119f, 4'hf);
wb_write(32'h40108088, 32'hffd4045b, 4'hf);
wb_write(32'h4010808c, 32'hffe4c208, 4'hf);
wb_write(32'h40108090, 32'h00000000, 4'hf);
wb_write(32'h40108094, 32'h000002e6, 4'hf);
wb_write(32'h40108098, 32'h00068acc, 4'hf);
wb_write(32'h4010809c, 32'hfffff880, 4'hf);
wb_write(32'h401080a0, 32'h0012c1ba, 4'hf);
wb_write(32'h401080a4, 32'h000021f5, 4'hf);
wb_write(32'h401080a8, 32'h000003a7, 4'hf);
wb_write(32'h401080ac, 32'hfff6f392, 4'hf);
wb_write(32'h401080b0, 32'hffe50148, 4'hf);
wb_write(32'h401080b4, 32'h00000445, 4'hf);
wb_write(32'h401080b8, 32'hfff55712, 4'hf);
wb_write(32'h401080bc, 32'h000a3104, 4'hf);
wb_write(32'h401080c0, 32'h00000aad, 4'hf);
wb_write(32'h401080c4, 32'hffe5512c, 4'hf);
wb_write(32'h401080c8, 32'h00091f8a, 4'hf);
wb_write(32'h401080cc, 32'h00001993, 4'hf);
wb_write(32'h401080d0, 32'hffc02901, 4'hf);
wb_write(32'h401080d4, 32'hfff7bd46, 4'hf);
wb_write(32'h4010c000, 32'h0000000f, 4'hf);
wb_write(32'h4010c004, 32'h0000000c, 4'hf);
wb_write(32'h4010c008, 32'h000000f0, 4'hf);
wb_write(32'h4010c00c, 32'h00000030, 4'hf);
wb_write(32'h4010c010, 32'h00000348, 4'hf);
wb_write(32'h4010c014, 32'h00000240, 4'hf);
wb_write(32'h4010c018, 32'h00000584, 4'hf);
wb_write(32'h4010c01c, 32'h00000180, 4'hf);
wb_write(32'h4010c020, 32'h00000c12, 4'hf);
wb_write(32'h4010c024, 32'h00000402, 4'hf);
wb_write(32'h4010c028, 32'h00000a21, 4'hf);
wb_write(32'h4010c02c, 32'h00000801, 4'hf);	

	
	#100
		$display("start");
		wb_write(32'h4010_0084, 32'h0000_0001, 4'b1111);	// UPDATE
		wb_write(32'h4010_0080, 32'h0000_0001, 4'b1111);	// ENABLE
	
	#100000000
		$finish();
	end
	
	
	
endmodule


`default_nettype wire


// end of file
