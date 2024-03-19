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
        $dumpvars(2, tb_top.i_top);
//      $dumpvars(3, tb_top.i_top.i_dma_video_read);
//      $dumpvars(1, tb_top.i_top.i_image_processing);
//      $dumpvars(0, tb_top.i_top.i_image_processing.i_img_previous_frame);
//      $dumpvars(0, tb_top.i_top.blk_read_vdma.i_vdma_axi4_to_axi4s);
//      $dumpvars(0, tb_top.i_top.i_vsync_generator);
        
    #100000000
        $finish;
    end
    
    reg     clk125 = 1'b1;
    always #(RATE125/2.0)   clk125 = ~clk125;
    
//  localparam  X_NUM = 1640;
//  localparam  Y_NUM = 1232;
    localparam  X_NUM = 256;
    localparam  Y_NUM = 16;
    
    
    zybo_z7_imx219_hdmi
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
                .PGM_FILE           ("lena_128x128.pgm"),
    //          .PGM_FILE           ("Chrysanthemum_1640x1232.pgm"),
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
    
    
    wire            vout_reset = i_top.vout_reset;
    wire            vout_clk   = i_top.vout_clk;
    wire            vout_vsync = i_top.vout_vsync;
    wire            vout_hsync = i_top.vout_hsync;
    wire            vout_de    = i_top.vout_de   ;
    wire    [23:0]  vout_data  = i_top.vout_data ;
    wire    [3:0]   vout_ctl   = i_top.vout_ctl  ;
    integer fp_vout;
    initial begin
        fp_vout = $fopen("vout.ppm", "w");
        $fdisplay(fp_vout, "P3");
        $fdisplay(fp_vout, "1280 720");
        $fdisplay(fp_vout, "255");
    end
    always @(posedge vout_clk) begin
        if ( !vout_reset & vout_de ) begin
            $fdisplay(fp_vout, "%d %d %d", vout_data[7:0], vout_data[15:8], vout_data[23:16]);
        end
    end
    
    
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
                input [31:0]    adr,
                input [31:0]    dat,
                input [3:0]     sel
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
                input [31:0]    adr
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


    localparam REG_BUF_MANAGER_CORE_ID      = 8'h00;
    localparam REG_BUF_MANAGER_CORE_VERSION = 8'h01;
    localparam REG_BUF_MANAGER_CORE_CONFIG  = 8'h03;
    localparam REG_BUF_MANAGER_NEWEST_INDEX = 8'h20;
    localparam REG_BUF_MANAGER_WRITER_INDEX = 8'h21;
    localparam REG_BUF_MANAGER_BUFFER0_ADDR = 8'h40;
    localparam REG_BUF_MANAGER_BUFFER1_ADDR = 8'h41;
    localparam REG_BUF_MANAGER_BUFFER2_ADDR = 8'h42;
    localparam REG_BUF_MANAGER_BUFFER3_ADDR = 8'h43;
    localparam REG_BUF_MANAGER_BUFFER4_ADDR = 8'h44;
    localparam REG_BUF_MANAGER_BUFFER5_ADDR = 8'h45;
    localparam REG_BUF_MANAGER_BUFFER6_ADDR = 8'h46;
    localparam REG_BUF_MANAGER_BUFFER7_ADDR = 8'h47;
    localparam REG_BUF_MANAGER_BUFFER8_ADDR = 8'h48;
    localparam REG_BUF_MANAGER_BUFFER9_ADDR = 8'h49;
    
    localparam  ADR_CORE_ID          = 8'h00;
    localparam  ADR_CORE_VERSION     = 8'h01;
    localparam  ADR_CORE_CONFIG      = 8'h03;
    localparam  ADR_CTL_CONTROL      = 8'h04;
    localparam  ADR_CTL_STATUS       = 8'h05;
    localparam  ADR_CTL_INDEX        = 8'h07;
    localparam  ADR_IRQ_ENABLE       = 8'h08;
    localparam  ADR_IRQ_STATUS       = 8'h09;
    localparam  ADR_IRQ_CLR          = 8'h0a;
    localparam  ADR_IRQ_SET          = 8'h0b;
    localparam  ADR_PARAM_ARADDR     = 8'h10;
    localparam  ADR_PARAM_ARLEN_MAX  = 8'h11;
    localparam  ADR_PARAM_ARLEN0     = 8'h20;
//  localparam  ADR_PARAM_ARSTEP0    = 8'h21;
    localparam  ADR_PARAM_ARLEN1     = 8'h24;
    localparam  ADR_PARAM_ARSTEP1    = 8'h25;
    localparam  ADR_PARAM_ARLEN2     = 8'h28;
    localparam  ADR_PARAM_ARSTEP2    = 8'h29;
    localparam  ADR_PARAM_ARLEN3     = 8'h2c;
    localparam  ADR_PARAM_ARSTEP3    = 8'h2d;
    localparam  ADR_PARAM_ARLEN4     = 8'h30;
    localparam  ADR_PARAM_ARSTEP4    = 8'h31;
    localparam  ADR_PARAM_ARLEN5     = 8'h34;
    localparam  ADR_PARAM_ARSTEP5    = 8'h35;
    localparam  ADR_PARAM_ARLEN6     = 8'h38;
    localparam  ADR_PARAM_ARSTEP6    = 8'h39;
    localparam  ADR_PARAM_ARLEN7     = 8'h3c;
    localparam  ADR_PARAM_ARSTEP7    = 8'h3d;
    localparam  ADR_PARAM_ARLEN8     = 8'h30;
    localparam  ADR_PARAM_ARSTEP8    = 8'h31;
    localparam  ADR_PARAM_ARLEN9     = 8'h44;
    localparam  ADR_PARAM_ARSTEP9    = 8'h45;
    localparam  ADR_SHADOW_ARADDR    = 8'h90;
    localparam  ADR_SHADOW_ARLEN_MAX = 8'h91;
    localparam  ADR_SHADOW_ARLEN0    = 8'ha0;
//  localparam  ADR_SHADOW_ARSTEP0   = 8'ha1;
    localparam  ADR_SHADOW_ARLEN1    = 8'ha4;
    localparam  ADR_SHADOW_ARSTEP1   = 8'ha5;
    localparam  ADR_SHADOW_ARLEN2    = 8'ha8;
    localparam  ADR_SHADOW_ARSTEP2   = 8'ha9;
    localparam  ADR_SHADOW_ARLEN3    = 8'hac;
    localparam  ADR_SHADOW_ARSTEP3   = 8'had;
    localparam  ADR_SHADOW_ARLEN4    = 8'hb0;
    localparam  ADR_SHADOW_ARSTEP4   = 8'hb1;
    localparam  ADR_SHADOW_ARLEN5    = 8'hb4;
    localparam  ADR_SHADOW_ARSTEP5   = 8'hb5;
    localparam  ADR_SHADOW_ARLEN6    = 8'hb8;
    localparam  ADR_SHADOW_ARSTEP6   = 8'hb9;
    localparam  ADR_SHADOW_ARLEN7    = 8'hbc;
    localparam  ADR_SHADOW_ARSTEP7   = 8'hbd;
    localparam  ADR_SHADOW_ARLEN8    = 8'hb0;
    localparam  ADR_SHADOW_ARSTEP8   = 8'hb1;
    localparam  ADR_SHADOW_ARLEN9    = 8'hc4;
    localparam  ADR_SHADOW_ARSTEP9   = 8'hc5;
    
    localparam  VSYNC_CORE_ID           = 8'h00;
    localparam  VSYNC_CORE_VERSION      = 8'h01;
    localparam  VSYNC_CTL_CONTROL       = 8'h04;
    localparam  VSYNC_CTL_STATUS        = 8'h05;
    localparam  VSYNC_PARAM_HTOTAL      = 8'h08;
    localparam  VSYNC_PARAM_HSYNC_POL   = 8'h0B;
    localparam  VSYNC_PARAM_HDISP_START = 8'h0C;
    localparam  VSYNC_PARAM_HDISP_END   = 8'h0D;
    localparam  VSYNC_PARAM_HSYNC_START = 8'h0E;
    localparam  VSYNC_PARAM_HSYNC_END   = 8'h0F;
    localparam  VSYNC_PARAM_VTOTAL      = 8'h10;
    localparam  VSYNC_PARAM_VSYNC_POL   = 8'h13;
    localparam  VSYNC_PARAM_VDISP_START = 8'h14;
    localparam  VSYNC_PARAM_VDISP_END   = 8'h15;
    localparam  VSYNC_PARAM_VSYNC_START = 8'h16;
    localparam  VSYNC_PARAM_VSYNC_END   = 8'h17;
    
    parameter   STRIDE = 4*4096;
    
    
    initial begin
        $display("start");
    #10000;
        $display("read id");
        wb_read (32'h40000000);
        wb_read (32'h40100000);  // ビデオサイズ正規化
        wb_read (32'h40200000);  // デモザイク
        wb_read (32'h40210000);  // カラーマトリックス
        wb_read (32'h40220000);  // ガンマ補正
        wb_read (32'h40240000);  // ガウシアンフィルタ
        wb_read (32'h40250000);  // Cannyフィルタ
        wb_read (32'h40260000);  // FIFO dma
        wb_read (32'h40270000);  // 前画像との差分バイナライズ
        wb_read (32'h402f0000);  // 出力切り替え
        wb_read (32'h40310000);  // Write-DMA
        wb_read (32'h40340000);  // Read-DMA
        wb_read (32'h40360000);  // Video out sync generator
        
        $display("set DMA FIFO");
        wb_read (32'h40260000);                     // CORE ID
        wb_write(32'h40260020, 32'h0000_1000, 4'b1111); // PARAM_ADDR
        wb_write(32'h40260024, 32'h0010_0000, 4'b1111); // PARAM_SZIE
        wb_write(32'h40260010, 32'h0000_0003, 4'b1111); // CTL_CONTROL
        
        
        $display("set format regularizer");
        wb_read (32'h40100000);                     // CORE ID
        wb_write(32'h40100040,        X_NUM, 4'b1111);     // width
        wb_write(32'h40100044,        Y_NUM, 4'b1111);     // height
        wb_write(32'h40100048,            0, 4'b1111);     // fill
        wb_write(32'h4010004c,         1024, 4'b1111);     // timeout
        wb_write(32'h40100010,            1, 4'b1111);     // enable
        
        $display("set colmat");
        wb_read (32'h40210000);                     // CORE ID
        wb_write(32'h40210010,            3, 4'b1111);     // CTL_CONTROL
        
        $display("set gauss");
        wb_read (32'h40240000);                     // CORE ID
        wb_write(32'h40240020,            7, 4'b1111);     // PARAM_ENABLE
        wb_write(32'h40240010,            3, 4'b1111);     // CTL_CONTROL
        
        /*
    #10000;
        $display("vin write DMA");
        wb_read (32'h40310000);                             // CORE ID
        wb_write(32'h40310020, 32'h30000000, 4'b1111);      // address
        wb_write(32'h40310024,       STRIDE, 4'b1111);      // stride
        wb_write(32'h40310028,        X_NUM, 4'b1111);      // width
        wb_write(32'h4031002c,        Y_NUM, 4'b1111);      // height
        wb_write(32'h40310030,  X_NUM*Y_NUM, 4'b1111);      // size
        wb_write(32'h4031003c,           31, 4'b1111);      // awlen
        wb_write(32'h40310010,            3, 4'b1111);      // update & enable
        axi4s_model_aresetn = 1'b1;
        */
        
        $display("buf manager");
        wb_write(32'h40300000 + (REG_BUF_MANAGER_BUFFER0_ADDR << 2), 32'h00010000, 4'b1111);
        wb_write(32'h40300000 + (REG_BUF_MANAGER_BUFFER1_ADDR << 2), 32'h00020000, 4'b1111);
        wb_write(32'h40300000 + (REG_BUF_MANAGER_BUFFER2_ADDR << 2), 32'h00030000, 4'b1111);
        wb_write(32'h40300000 + (REG_BUF_MANAGER_BUFFER3_ADDR << 2), 32'h00040000, 4'b1111);
        
        
        $display("vin write DMA");
        wb_write(32'h40320000 + (ADR_PARAM_ARADDR  << 2), 32'h00010000, 4'b1111);      // address
        wb_write(32'h40320000 + (ADR_PARAM_ARLEN0  << 2),      X_NUM-1, 4'b1111);
        wb_write(32'h40320000 + (ADR_PARAM_ARLEN1  << 2),      Y_NUM-1, 4'b1111);
        wb_write(32'h40320000 + (ADR_PARAM_ARLEN2  << 2),            0, 4'b1111);
        wb_write(32'h40320000 + (ADR_PARAM_ARSTEP1 << 2),       STRIDE, 4'b1111);
        wb_write(32'h40320000 + (ADR_PARAM_ARSTEP2 << 2), Y_NUM*STRIDE, 4'b1111);
        wb_write(32'h40320000 + (ADR_CTL_CONTROL   << 2),         8'hb, 4'b1111);
        axi4s_model_aresetn = 1'b1;
     #1000;
        $display("vsync start");
        wb_write(32'h40360000 + (VSYNC_PARAM_HTOTAL      << 2),  32 + X_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_HSYNC_POL   << 2),           0, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_HDISP_START << 2),           0, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_HDISP_END   << 2),       X_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_HSYNC_START << 2),   4 + X_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_HSYNC_END   << 2),   8 + X_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_VTOTAL      << 2),   4 + Y_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_VSYNC_POL   << 2),           0, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_VDISP_START << 2),           0, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_VDISP_END   << 2),       Y_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_VSYNC_START << 2),   1 + Y_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_PARAM_VSYNC_END   << 2),   2 + Y_NUM, 4'b1111);
        wb_write(32'h40360000 + (VSYNC_CTL_CONTROL << 2),            1, 4'b1111);
        
        
     #1000;
        $display("vout read DMA");
        wb_write(32'h40340000 + (ADR_PARAM_ARADDR  << 2), 32'h00010000, 4'b1111);      // address
        wb_write(32'h40340000 + (ADR_PARAM_ARLEN0  << 2),      X_NUM-1, 4'b1111);
        wb_write(32'h40340000 + (ADR_PARAM_ARLEN1  << 2),      Y_NUM-1, 4'b1111);
        wb_write(32'h40340000 + (ADR_PARAM_ARLEN2  << 2),            0, 4'b1111);
        wb_write(32'h40340000 + (ADR_PARAM_ARSTEP1 << 2),       STRIDE, 4'b1111);
        wb_write(32'h40340000 + (ADR_PARAM_ARSTEP2 << 2), Y_NUM*STRIDE, 4'b1111);
        wb_write(32'h40340000 + (ADR_CTL_CONTROL   << 2),         8'hb, 4'b1111);
        
     #400000;
        wb_write(32'h40320000 + (ADR_CTL_CONTROL   << 2),            0, 4'b1111);
        wb_write(32'h40340000 + (ADR_CTL_CONTROL   << 2),            0, 4'b1111);
     #100000;
        $finish();
        
        while(1) begin
            #10000;
            wb_read(32'h40260014);
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
