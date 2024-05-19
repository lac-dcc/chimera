// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

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
        $dumpvars(1, tb_top.i_top.i_video_mnist);
//      $dumpvars(4, tb_top.i_top.i_video_mnist.i_video_mnist_core);
        
        
    #100000000
        $finish;
    end
    
    reg     clk125 = 1'b1;
    always #(RATE125/2.0)   clk125 = ~clk125;
    
    
//    localparam  IMG_FILE = "mnist_test_160x120.ppm";
//    localparam  X_NUM    = 160;
//    localparam  Y_NUM    = 120;

//    localparam  IMG_FILE = "mnist_test_64x720.ppm";
//    localparam  X_NUM    = 64;
//    localparam  Y_NUM    = 720;

    localparam  IMG_FILE = "test_raw_640x480.ppm";
    localparam  X_NUM    = 640;
    localparam  Y_NUM    = 480;
    
    
    // ----------------------------------
    //  Top net
    // ----------------------------------
    
    zybo_z7_mnist_cnn_imx219_hdmi
            #(
                .X_NUM          (X_NUM),
                .Y_NUM          (Y_NUM)
            )
        i_top
            (
                .in_clk125      (clk125),
                
                .push_sw        (0),
                .dip_sw         (0),
                .led            (),
                .pmod_a         ()
            );
    
    
    
    
    // ----------------------------------
    //  dummy video
    // ----------------------------------
    
    reg             axi4s_model_aresetn = 1'b0;
//  wire            axi4s_model_aresetn = i_top.axi4s_cam_aresetn;
    wire            axi4s_model_aclk    = i_top.axi4s_cam_aclk;
    wire    [0:0]   axi4s_model_tuser;
    wire            axi4s_model_tlast;
    wire    [7:0]   axi4s_model_tdata;
    wire            axi4s_model_tvalid;
    wire            axi4s_model_tready = i_top.axi4s_csi2_tready;
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (8),
                .X_NUM              (X_NUM),
                .Y_NUM              (Y_NUM),
                .PPM_FILE           (IMG_FILE),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (0)
            )
        i_axi4s_master_model
            (
                .aresetn            (axi4s_model_aresetn),
                .aclk               (axi4s_model_aclk),
                
                .m_axi4s_tuser      (axi4s_model_tuser),
                .m_axi4s_tlast      (axi4s_model_tlast),
                .m_axi4s_tdata      (axi4s_model_tdata),
                .m_axi4s_tvalid     (axi4s_model_tvalid),
                .m_axi4s_tready     (axi4s_model_tready)
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
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (1),
                .INIT_FRAME_NUM     (0),
                .FRAME_WIDTH        (32),
                .X_WIDTH            (32),
                .Y_WIDTH            (32),
                .FILE_NAME          ("bin_%04d.pgm"),
                .MAX_PATH           (64),
                .BUSY_RATE          (0)
            )
        i_axi4s_slave_model_bin
            (
                .aresetn            (i_top.axi4s_cam_aresetn),
                .aclk               (i_top.axi4s_cam_aclk),
                .aclken             (1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (i_top.i_video_mnist.axi4s_bin_tuser),
                .s_axi4s_tlast      (i_top.i_video_mnist.axi4s_bin_tlast),
                .s_axi4s_tdata      (i_top.i_video_mnist.axi4s_bin_tdata),
                .s_axi4s_tvalid     (i_top.i_video_mnist.axi4s_bin_tvalid & i_top.i_video_mnist.axi4s_bin_tready),
                .s_axi4s_tready     ()
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (3),
                .DATA_WIDTH         (10),
                .INIT_FRAME_NUM     (0),
                .FRAME_WIDTH        (32),
                .X_WIDTH            (32),
                .Y_WIDTH            (32),
                .FILE_NAME          ("rgb_%04d.ppm"),
                .MAX_PATH           (64),
                .BUSY_RATE          (0)
            )
        i_axi4s_slave_model_rgb
            (
                .aresetn            (i_top.axi4s_cam_aresetn),
                .aclk               (i_top.axi4s_cam_aclk),
                .aclken             (1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (i_top.axi4s_rgb_tuser),
                .s_axi4s_tlast      (i_top.axi4s_rgb_tlast),
                .s_axi4s_tdata      (i_top.axi4s_rgb_tdata[29:0]),
                .s_axi4s_tvalid     (i_top.axi4s_rgb_tvalid & i_top.axi4s_rgb_tready),
                .s_axi4s_tready     ()
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (3),
                .DATA_WIDTH         (8),
                .INIT_FRAME_NUM     (0),
                .FRAME_WIDTH        (32),
                .X_WIDTH            (32),
                .Y_WIDTH            (32),
                .FILE_NAME          ("col_%04d.ppm"),
                .MAX_PATH           (64),
                .BUSY_RATE          (0)
            )
        i_axi4s_slave_model_mcol
            (
                .aresetn            (i_top.axi4s_cam_aresetn),
                .aclk               (i_top.axi4s_cam_aclk),
                .aclken             (1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (i_top.axi4s_mcol_tuser),
                .s_axi4s_tlast      (i_top.axi4s_mcol_tlast),
                .s_axi4s_tdata      ({
                                        i_top.axi4s_mcol_tdata[7:0],
                                        i_top.axi4s_mcol_tdata[15:8],
                                        i_top.axi4s_mcol_tdata[23:16]
                                    }),
                .s_axi4s_tvalid     (i_top.axi4s_mcol_tvalid & i_top.axi4s_mcol_tready),
                .s_axi4s_tready     ()
            );
    
    
    
    wire            vout_vsync = i_top.vout_vsync;
    wire            vout_hsync = i_top.vout_hsync;
    wire            vout_de    = i_top.vout_de   ;
    wire    [23:0]  vout_data  = i_top.vout_data ;
    wire    [3:0]   vout_ctl   = i_top.vout_ctl  ;
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (3),
                .DATA_WIDTH         (8),
                .INIT_FRAME_NUM     (0),
                .FRAME_WIDTH        (32),
                .X_WIDTH            (32),
                .Y_WIDTH            (32),
                .FILE_NAME          ("img_%04d.ppm"),
                .MAX_PATH           (64),
                .BUSY_RATE          (0)
            )
        i_axi4s_slave_model_vout
            (
                .aresetn            (~i_top.vout_reset),
                .aclk               (i_top.vout_clk),
                .aclken             (1),
                
                .param_width        (1280),
                .param_height       (720),
                
                .s_axi4s_tuser      (i_top.axi4s_vout_tuser),
                .s_axi4s_tlast      (i_top.axi4s_vout_tlast),
                .s_axi4s_tdata      (i_top.axi4s_vout_tdata[23:0]),
                .s_axi4s_tvalid     (i_top.axi4s_vout_tvalid & i_top.axi4s_vout_tready),
                .s_axi4s_tready     ()
            );
    
    
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    parameter   WB_ADR_WIDTH        = 30;
    parameter   WB_DAT_WIDTH        = 32;
    parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8);
    
    wire                            wb_rst_i = i_top.wb_peri_rst_i;
    wire                            wb_clk_i = i_top.wb_peri_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i = i_top.wb_peri_dat_o;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i = i_top.wb_peri_ack_o;
    
    initial begin
        force i_top.wb_peri_adr_i = wb_adr_o;
        force i_top.wb_peri_dat_i = wb_dat_o;
        force i_top.wb_peri_we_i  = wb_we_o;
        force i_top.wb_peri_sel_i = wb_sel_o;
        force i_top.wb_peri_stb_i = wb_stb_o;
    end
    
    
    reg     [WB_DAT_WIDTH-1:0]      reg_wb_dat;
    reg                             reg_wb_ack;
    always @(posedge wb_clk_i) begin
        if ( ~wb_we_o & wb_stb_o & wb_ack_i ) begin
            reg_wb_dat <= wb_dat_i;
        end
        reg_wb_ack <= wb_ack_i;
    end
    
    
    task wb_write(
                input [WB_ADR_WIDTH-1:0]    adr,
                input [WB_DAT_WIDTH-1:0]    dat,
                input [WB_SEL_WIDTH:0]      sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = adr;
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
                input [31:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = adr;
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
    
    
    `include "jelly_regs.inc"
    
    localparam BASE_ADDR_GID   = (32'h40000000 >> 2);
    localparam BASE_ADDR_FMTR  = (32'h40100000 >> 2);
    localparam BASE_ADDR_RGB   = (32'h40200000 >> 2);
    localparam BASE_ADDR_MNIST = (32'h40400000 >> 2);
    localparam BASE_ADDR_MCOL  = (32'h40410000 >> 2);
    localparam BASE_ADDR_BUFM  = (32'h40300000 >> 2);
    localparam BASE_ADDR_BUFA  = (32'h40310000 >> 2);
    localparam BASE_ADDR_VDMAW = (32'h40320000 >> 2);
    localparam BASE_ADDR_VDMAR = (32'h40340000 >> 2);
    localparam BASE_ADDR_VSGEN = (32'h40360000 >> 2);
    
    localparam STRIDE = 8192;
    
    initial begin
    #1000;
        $display("start");
        wb_read(BASE_ADDR_GID);     // ビデオサイズ正規化
        wb_read(BASE_ADDR_FMTR);    // デモザイク
        wb_read(BASE_ADDR_RGB);     // カラーマトリックス
        wb_read(BASE_ADDR_MNIST);   // 二値化
        wb_read(BASE_ADDR_MCOL);    // 色付け
        wb_read(BASE_ADDR_BUFM);    // Buffer manager
        wb_read(BASE_ADDR_BUFA);    // Buffer allocator
        wb_read(BASE_ADDR_VDMAW);   // Write-DMA
        wb_read(BASE_ADDR_VDMAR);   // Read-DMA
        wb_read(BASE_ADDR_VSGEN);   // Video out sync generator
    #10000;
        
        
        $display("demosaic");
        wb_write(BASE_ADDR_RGB + `REG_IMG_DEMOSAIC_PARAM_PHASE,                  1, 4'hf);
        wb_write(BASE_ADDR_RGB + `REG_IMG_DEMOSAIC_CTL_CONTROL,                  3, 4'hf);
        
        // Video format regularizer
        $display("Video format regularizer");
        wb_write(BASE_ADDR_FMTR + `REG_VIDEO_FMTREG_PARAM_WIDTH,             X_NUM, 4'hf);
        wb_write(BASE_ADDR_FMTR + `REG_VIDEO_FMTREG_PARAM_HEIGHT,            Y_NUM, 4'hf);
        wb_write(BASE_ADDR_FMTR + `REG_VIDEO_FMTREG_PARAM_FILL,                  0, 4'hf);
        wb_write(BASE_ADDR_FMTR + `REG_VIDEO_FMTREG_PARAM_TIMEOUT,            1024, 4'hf);
        wb_write(BASE_ADDR_FMTR + `REG_VIDEO_FMTREG_CTL_CONTROL,                 1, 4'hf);
        
        $display("vin write DMA");
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_PARAM_ADDR,        32'h00010000, 4'hf);
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_PARAM_H_SIZE,           X_NUM-1, 4'hf);
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_PARAM_V_SIZE,           Y_NUM-1, 4'hf);
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_PARAM_F_SIZE,               1-1, 4'hf);
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_PARAM_LINE_STEP,         STRIDE, 4'hf);
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_PARAM_FRAME_STEP,  Y_NUM*STRIDE, 4'hf);
        wb_write(BASE_ADDR_VDMAW + `REG_VDMA_WRITE_CTL_CONTROL,               8'h3, 4'hf);
        
        axi4s_model_aresetn = 1'b1;
        
        
     #1000;
        $display("vout read DMA");
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_READ_PARAM_ADDR,         32'h00010000, 4'hf);
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_READ_PARAM_H_SIZE,            X_NUM-1, 4'hf);
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_WRITE_PARAM_V_SIZE,           Y_NUM-1, 4'hf);
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_WRITE_PARAM_F_SIZE,               1-1, 4'hf);
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_WRITE_PARAM_LINE_STEP,         STRIDE, 4'hf);
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_WRITE_PARAM_FRAME_STEP,  Y_NUM*STRIDE, 4'hf);
        wb_write(BASE_ADDR_VDMAR + `REG_VDMA_READ_CTL_CONTROL,                8'h3, 4'hf);
        
     #1000;
        $display("vsync start");
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_HTOTAL,       32 + X_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_HSYNC_POL,             0, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_HDISP_START,           0, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_HDISP_END,         X_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_HSYNC_START,   4 + X_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_HSYNC_END,     8 + X_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_VTOTAL,        4 + Y_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_VSYNC_POL,             0, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_VDISP_START,           0, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_VDISP_END,         Y_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_VSYNC_START,   1 + Y_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_PARAM_VSYNC_END,     2 + Y_NUM, 4'hf);
        wb_write(BASE_ADDR_VSGEN + `REG_VIDEO_VSGEN_CTL_CONTROL,                 1, 4'hf);
        
        
        
     #400000;
//        wb_write(32'h40320000 + (ADR_CTL_CONTROL   << 2),            0, 4'b1111);
//        wb_write(32'h40340000 + (ADR_CTL_CONTROL   << 2),            0, 4'b1111);
   
    end
    
    
endmodule


`default_nettype wire


// end of file
