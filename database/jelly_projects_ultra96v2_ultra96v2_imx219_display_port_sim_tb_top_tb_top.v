// ---------------------------------------------------------------------------
//
//                                 Copyright (C) 2015-2020 by Ryuz 
//                                 https://github.com/ryuz/
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
    localparam RATE125 = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(1, tb_top);
        $dumpvars(2, tb_top.i_top);
        $dumpvars(0, tb_top.i_top.i_dma_video_read);
        
    #100000000
        $finish;
    end
    
    reg     clk125 = 1'b1;
    always #(RATE125/2.0)   clk125 = ~clk125;
    
    
    parameter   X_NUM = 1280; //2048; // 3280 / 2;
    parameter   Y_NUM = 16; // 2464 / 2;
    
    ultra96v2_imx219_display_port
        i_top
            (
                .cam_clk_p      (),
                .cam_clk_n      (),
                .cam_data_p     (),
                .cam_data_n     (),
                
                .radio_led      ()
//              .hd_gpio        ()
            );
    
    
    
    
    // ----------------------------------
    //  summy video
    // ----------------------------------
    
    wire            axi4s_model_aresetn = i_top.axi4s_cam_aresetn;
    wire            axi4s_model_aclk    = i_top.axi4s_cam_aclk;
    wire    [0:0]   axi4s_model_tuser;
    wire            axi4s_model_tlast;
    wire    [7:0]   axi4s_model_tdata;
    wire            axi4s_model_tvalid;
    wire            axi4s_model_tready = i_top.axi4s_csi2_tready;
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (8),
                .X_NUM              (X_NUM), // (128),
                .Y_NUM              (Y_NUM),   // (128),
                .X_BLANK            (16),
                .Y_BLANK            (4),
//              .PGM_FILE           ("lena_128x128.pgm"),
                .BUSY_RATE          (0), // (50),
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
    //  WISHBONE master
    // ----------------------------------
    
    parameter   WB_ADR_WIDTH        = 30;
    parameter   WB_DAT_WIDTH        = 64;
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
                input [WB_SEL_WIDTH-1:0]     sel
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
                input [WB_ADR_WIDTH-1:0]    adr
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
    
    
    
    
    
    
    
    /* DMA Stream write */
    localparam REG_DMA_WRITE_CORE_ID         = 8'h00;
    localparam REG_DMA_WRITE_CORE_VERSION    = 8'h01;
    localparam REG_DMA_WRITE_CORE_CONFIG     = 8'h03;
    localparam REG_DMA_WRITE_CTL_CONTROL     = 8'h04;
    localparam REG_DMA_WRITE_CTL_STATUS      = 8'h05;
    localparam REG_DMA_WRITE_CTL_INDEX       = 8'h07;
    localparam REG_DMA_WRITE_IRQ_ENABLE      = 8'h08;
    localparam REG_DMA_WRITE_IRQ_STATUS      = 8'h09;
    localparam REG_DMA_WRITE_IRQ_CLR         = 8'h0a;
    localparam REG_DMA_WRITE_IRQ_SET         = 8'h0b;
    localparam REG_DMA_WRITE_PARAM_AWADDR    = 8'h10;
    localparam REG_DMA_WRITE_PARAM_AWOFFSET  = 8'h18;
    localparam REG_DMA_WRITE_PARAM_AWLEN_MAX = 8'h1c;
    localparam REG_DMA_WRITE_PARAM_AWLEN0    = 8'h20;
    localparam REG_DMA_WRITE_PARAM_AWLEN1    = 8'h24;
    localparam REG_DMA_WRITE_PARAM_AWSTEP1   = 8'h25;
    localparam REG_DMA_WRITE_PARAM_AWLEN2    = 8'h28;
    localparam REG_DMA_WRITE_PARAM_AWSTEP2   = 8'h29;
    localparam REG_DMA_WRITE_PARAM_AWLEN3    = 8'h2c;
    localparam REG_DMA_WRITE_PARAM_AWSTEP3   = 8'h2d;
    localparam REG_DMA_WRITE_PARAM_AWLEN4    = 8'h30;
    localparam REG_DMA_WRITE_PARAM_AWSTEP4   = 8'h31;
    localparam REG_DMA_WRITE_PARAM_AWLEN5    = 8'h34;
    localparam REG_DMA_WRITE_PARAM_AWSTEP5   = 8'h35;
    localparam REG_DMA_WRITE_PARAM_AWLEN6    = 8'h38;
    localparam REG_DMA_WRITE_PARAM_AWSTEP6   = 8'h39;
    localparam REG_DMA_WRITE_PARAM_AWLEN7    = 8'h3c;
    localparam REG_DMA_WRITE_PARAM_AWSTEP7   = 8'h3d;
    localparam REG_DMA_WRITE_PARAM_AWLEN8    = 8'h30;
    localparam REG_DMA_WRITE_PARAM_AWSTEP8   = 8'h31;
    localparam REG_DMA_WRITE_PARAM_AWLEN9    = 8'h44;
    localparam REG_DMA_WRITE_PARAM_AWSTEP9   = 8'h45;
    localparam REG_DMA_WRITE_WSKIP_EN        = 8'h70;
    localparam REG_DMA_WRITE_WDETECT_FIRST   = 8'h72;
    localparam REG_DMA_WRITE_WDETECT_LAST    = 8'h73;
    localparam REG_DMA_WRITE_WPADDING_EN     = 8'h74;
    localparam REG_DMA_WRITE_WPADDING_DATA   = 8'h75;
    localparam REG_DMA_WRITE_WPADDING_STRB   = 8'h76;

    localparam REG_VDMA_WRITE_CORE_ID          = REG_DMA_WRITE_CORE_ID;
    localparam REG_VDMA_WRITE_CORE_VERSION     = REG_DMA_WRITE_CORE_VERSION;
    localparam REG_VDMA_WRITE_CORE_CONFIG      = REG_DMA_WRITE_CORE_CONFIG;
    localparam REG_VDMA_WRITE_CTL_CONTROL      = REG_DMA_WRITE_CTL_CONTROL;
    localparam REG_VDMA_WRITE_CTL_STATUS       = REG_DMA_WRITE_CTL_STATUS;
    localparam REG_VDMA_WRITE_CTL_INDEX        = REG_DMA_WRITE_CTL_INDEX;
    localparam REG_VDMA_WRITE_IRQ_ENABLE       = REG_DMA_WRITE_IRQ_ENABLE;
    localparam REG_VDMA_WRITE_IRQ_STATUS       = REG_DMA_WRITE_IRQ_STATUS;
    localparam REG_VDMA_WRITE_IRQ_CLR          = REG_DMA_WRITE_IRQ_CLR;
    localparam REG_VDMA_WRITE_IRQ_SET          = REG_DMA_WRITE_IRQ_SET;
    localparam REG_VDMA_WRITE_PARAM_ADDR       = REG_DMA_WRITE_PARAM_AWADDR;
    localparam REG_VDMA_WRITE_PARAM_OFFSET     = REG_DMA_WRITE_PARAM_AWOFFSET;
    localparam REG_VDMA_WRITE_PARAM_AWLEN_MAX  = REG_DMA_WRITE_PARAM_AWLEN_MAX;
    localparam REG_VDMA_WRITE_PARAM_H_SIZE     = REG_DMA_WRITE_PARAM_AWLEN0;
    localparam REG_VDMA_WRITE_PARAM_V_SIZE     = REG_DMA_WRITE_PARAM_AWLEN1;
    localparam REG_VDMA_WRITE_PARAM_LINE_STEP  = REG_DMA_WRITE_PARAM_AWSTEP1;
    localparam REG_VDMA_WRITE_PARAM_F_SIZE     = REG_DMA_WRITE_PARAM_AWLEN2;
    localparam REG_VDMA_WRITE_PARAM_FRAME_STEP = REG_DMA_WRITE_PARAM_AWSTEP2;
    localparam REG_VDMA_WRITE_SKIP_EN          = REG_DMA_WRITE_WSKIP_EN;
    localparam REG_VDMA_WRITE_DETECT_FIRST     = REG_DMA_WRITE_WDETECT_FIRST;
    localparam REG_VDMA_WRITE_DETECT_LAST      = REG_DMA_WRITE_WDETECT_LAST;
    localparam REG_VDMA_WRITE_PADDING_EN       = REG_DMA_WRITE_WPADDING_EN;
    localparam REG_VDMA_WRITE_PADDING_DATA     = REG_DMA_WRITE_WPADDING_DATA;
    localparam REG_VDMA_WRITE_PADDING_STRB     = REG_DMA_WRITE_WPADDING_STRB;
    
    
    initial begin
    #1000;
        $display("start");
    
    #1000;
        $display("read core ID");
        wb_read ((32'h80000000>>3));     // gid
        wb_read ((32'h80100000>>3));     // fmtr
        wb_read ((32'h80200000>>3));     // demosaic
        wb_read ((32'h80210000>>3));     // col mat
        wb_read ((32'h80320000>>3));     // wdma
        
        $display("set DMA FIFO");
        wb_read ((32'h80260000>>3)+8'h00);                       // CORE ID
        wb_write((32'h80260000>>3)+8'h08, 32'h0000_0000, 8'hff); // PARAM_ADDR
        wb_write((32'h80260000>>3)+8'h09, 32'h0010_0000, 8'hff); // PARAM_SZIE
        wb_write((32'h80260000>>3)+8'h04, 32'h0000_0003, 8'hff); // CTL_CONTROL
        
    #10000;
        $display("set format regularizer");
        wb_read ((32'h80100000>>3));                       // CORE ID
        wb_write((32'h80100080>>3),        X_NUM, 8'hff);  // width
        wb_write((32'h80100088>>3),        Y_NUM, 8'hff);  // height
        wb_write((32'h80100090>>3),            0, 8'hff);  // fill
        wb_write((32'h80100098>>3),         1024, 8'hff);  // timeout
        wb_write((32'h80100020>>3),            1, 8'hff);  // enable
    #100000;
        
        
        $display("set read DMA");
        force i_top.axi4s_vout_tready = 1;
        wb_read ((32'h80340000>>3) + REG_VDMA_WRITE_CORE_ID);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_ADDR,        32'h30000000, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_OFFSET,      32'h00000000, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_AWLEN_MAX,             31, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_H_SIZE,           X_NUM-1, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_V_SIZE,           Y_NUM-1, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_LINE_STEP,        3*X_NUM, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_F_SIZE,               1-1, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_PARAM_FRAME_STEP, 3*X_NUM*Y_NUM, 8'hff);
        wb_write((32'h80340000>>3) + REG_VDMA_WRITE_CTL_CONTROL,                  3, 8'hff);
    #10000;
        
        
        
        $display("set write DMA");
        wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CORE_ID);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_ADDR,        32'h30000000, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_OFFSET,      32'h00000000, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_AWLEN_MAX,             31, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_H_SIZE,           X_NUM-1, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_V_SIZE,           Y_NUM-1, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_LINE_STEP,        3*X_NUM, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_F_SIZE,               1-1, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_PARAM_FRAME_STEP, 3*X_NUM*Y_NUM, 8'hff);
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_CTL_CONTROL,                  3, 8'hff);
    #10000;
        wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CTL_STATUS);
        wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CTL_STATUS);
        wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CTL_STATUS);
        wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CTL_STATUS);
        
    #100000;
        wb_write((32'h80320000>>3) + REG_VDMA_WRITE_CTL_CONTROL,                  0, 8'hff);   // stop
        
        // 取り込み完了を待つ
        wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CTL_STATUS);
        while ( reg_wb_dat != 0 ) begin
            #10000;
            wb_read ((32'h80320000>>3) + REG_VDMA_WRITE_CTL_STATUS);
        end
        #10000;
        
        
    #10000;
        $finish();
    end
    
    
endmodule


`default_nettype wire


// end of file
