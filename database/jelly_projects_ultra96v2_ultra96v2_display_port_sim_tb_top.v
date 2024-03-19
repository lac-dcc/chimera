// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
    localparam RATE125 = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
        
    #200000000
        $finish;
    end
    
    
    
    // ----------------------------------
    //  top net
    // ----------------------------------
    
    wire    [1:0]       radio_led;
    
    ultra96v2_display_port
        i_top
            (
                .led    (radio_led)
            );
    
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    localparam  WB_DAT_SIZE  = 3;
    localparam  WB_ADR_WIDTH = 40 - WB_DAT_SIZE;
    localparam  WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH = (1 << WB_DAT_SIZE);
    
    // force connect to top-net
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
                input [WB_SEL_WIDTH-1:0]    sel
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
    
    
    
    // ----------------------------------
    //  top net
    // ----------------------------------
    
    integer REG_DMA_READ_CORE_ID           = 8'h00;
    integer REG_DMA_READ_CORE_VERSION      = 8'h01;
    integer REG_DMA_READ_CORE_CONFIG       = 8'h03;
    integer REG_DMA_READ_CTL_CONTROL       = 8'h04;
    integer REG_DMA_READ_CTL_STATUS        = 8'h05;
    integer REG_DMA_READ_CTL_INDEX         = 8'h07;
    integer REG_DMA_READ_IRQ_ENABLE        = 8'h08;
    integer REG_DMA_READ_IRQ_STATUS        = 8'h09;
    integer REG_DMA_READ_IRQ_CLR           = 8'h0a;
    integer REG_DMA_READ_IRQ_SET           = 8'h0b;
    integer REG_DMA_READ_PARAM_ARADDR      = 8'h10;
    integer REG_DMA_READ_PARAM_AROFFSET    = 8'h18;
    integer REG_DMA_READ_PARAM_ARLEN_MAX   = 8'h1c;
    integer REG_DMA_READ_PARAM_ARLEN0      = 8'h20;
    integer REG_DMA_READ_PARAM_ARLEN1      = 8'h24;
    integer REG_DMA_READ_PARAM_ARSTEP1     = 8'h25;
    integer REG_DMA_READ_PARAM_ARLEN2      = 8'h28;
    integer REG_DMA_READ_PARAM_ARSTEP2     = 8'h29;
    integer REG_DMA_READ_PARAM_ARLEN3      = 8'h2c;
    integer REG_DMA_READ_PARAM_ARSTEP3     = 8'h2d;
    integer REG_DMA_READ_PARAM_ARLEN4      = 8'h30;
    integer REG_DMA_READ_PARAM_ARSTEP4     = 8'h31;
    integer REG_DMA_READ_PARAM_ARLEN5      = 8'h34;
    integer REG_DMA_READ_PARAM_ARSTEP5     = 8'h35;
    integer REG_DMA_READ_PARAM_ARLEN6      = 8'h38;
    integer REG_DMA_READ_PARAM_ARSTEP6     = 8'h39;
    integer REG_DMA_READ_PARAM_ARLEN7      = 8'h3c;
    integer REG_DMA_READ_PARAM_ARSTEP7     = 8'h3d;
    integer REG_DMA_READ_PARAM_ARLEN8      = 8'h30;
    integer REG_DMA_READ_PARAM_ARSTEP8     = 8'h31;
    integer REG_DMA_READ_PARAM_ARLEN9      = 8'h44;
    integer REG_DMA_READ_PARAM_ARSTEP9     = 8'h45;
    integer REG_DMA_READ_SHADOW_ARADDR     = 8'h90;
    integer REG_DMA_READ_SHADOW_ARLEN_MAX  = 8'h91;
    integer REG_DMA_READ_SHADOW_ARLEN0     = 8'ha0;
    integer REG_DMA_READ_SHADOW_ARLEN1     = 8'ha4;
    integer REG_DMA_READ_SHADOW_ARSTEP1    = 8'ha5;
    integer REG_DMA_READ_SHADOW_ARLEN2     = 8'ha8;
    integer REG_DMA_READ_SHADOW_ARSTEP2    = 8'ha9;
    integer REG_DMA_READ_SHADOW_ARLEN3     = 8'hac;
    integer REG_DMA_READ_SHADOW_ARSTEP3    = 8'had;
    integer REG_DMA_READ_SHADOW_ARLEN4     = 8'hb0;
    integer REG_DMA_READ_SHADOW_ARSTEP4    = 8'hb1;
    integer REG_DMA_READ_SHADOW_ARLEN5     = 8'hb4;
    integer REG_DMA_READ_SHADOW_ARSTEP5    = 8'hb5;
    integer REG_DMA_READ_SHADOW_ARLEN6     = 8'hb8;
    integer REG_DMA_READ_SHADOW_ARSTEP6    = 8'hb9;
    integer REG_DMA_READ_SHADOW_ARLEN7     = 8'hbc;
    integer REG_DMA_READ_SHADOW_ARSTEP7    = 8'hbd;
    integer REG_DMA_READ_SHADOW_ARLEN8     = 8'hb0;
    integer REG_DMA_READ_SHADOW_ARSTEP8    = 8'hb1;
    integer REG_DMA_READ_SHADOW_ARLEN9     = 8'hc4;
    integer REG_DMA_READ_SHADOW_ARSTEP9    = 8'hc5;

`define REG_VDMA_READ_CORE_ID                   REG_DMA_READ_CORE_ID
`define REG_VDMA_READ_CORE_VERSION              REG_DMA_READ_CORE_VERSION
`define REG_VDMA_READ_CORE_CONFIG               REG_DMA_READ_CORE_CONFIG
`define REG_VDMA_READ_CTL_CONTROL               REG_DMA_READ_CTL_CONTROL
`define REG_VDMA_READ_CTL_STATUS                REG_DMA_READ_CTL_STATUS
`define REG_VDMA_READ_CTL_INDEX                 REG_DMA_READ_CTL_INDEX
`define REG_VDMA_READ_IRQ_ENABLE                REG_DMA_READ_IRQ_ENABLE
`define REG_VDMA_READ_IRQ_STATUS                REG_DMA_READ_IRQ_STATUS
`define REG_VDMA_READ_IRQ_CLR                   REG_DMA_READ_IRQ_CLR
`define REG_VDMA_READ_IRQ_SET                   REG_DMA_READ_IRQ_SET
`define REG_VDMA_READ_PARAM_ADDR                REG_DMA_READ_PARAM_ARADDR
`define REG_VDMA_READ_PARAM_OFFSET              REG_DMA_READ_PARAM_AROFFSET
`define REG_VDMA_READ_PARAM_ARLEN_MAX           REG_DMA_READ_PARAM_ARLEN_MAX
`define REG_VDMA_READ_PARAM_H_SIZE              REG_DMA_READ_PARAM_ARLEN0
`define REG_VDMA_READ_PARAM_V_SIZE              REG_DMA_READ_PARAM_ARLEN1
`define REG_VDMA_READ_PARAM_LINE_STEP           REG_DMA_READ_PARAM_ARSTEP1
`define REG_VDMA_READ_PARAM_F_SIZE              REG_DMA_READ_PARAM_ARLEN2
`define REG_VDMA_READ_PARAM_FRAME_STEP          REG_DMA_READ_PARAM_ARSTEP2
`define REG_VDMA_READ_SHADOW_ADDR               REG_DMA_READ_SHADOW_ARADDR
`define REG_VDMA_READ_SHADOW_ARLEN_MAX          REG_DMA_READ_SHADOW_ARLEN_MAX
`define REG_VDMA_READ_SHADOW_H_SIZE             REG_DMA_READ_SHADOW_ARLEN0
`define REG_VDMA_READ_SHADOW_V_SIZE             REG_DMA_READ_SHADOW_ARLEN1
`define REG_VDMA_READ_SHADOW_LINE_STEP          REG_DMA_READ_SHADOW_ARSTEP1
`define REG_VDMA_READ_SHADOW_F_SIZE             REG_DMA_READ_SHADOW_ARLEN2
`define REG_VDMA_READ_SHADOW_FRAME_STEP         REG_DMA_READ_SHADOW_ARSTEP2


`define REG_VIDEO_VSGEN_CORE_ID                 8'h00
`define REG_VIDEO_VSGEN_CORE_VERSION            8'h01
`define REG_VIDEO_VSGEN_CTL_CONTROL             8'h04
`define REG_VIDEO_VSGEN_CTL_STATUS              8'h05
`define REG_VIDEO_VSGEN_PARAM_HTOTAL            8'h08
`define REG_VIDEO_VSGEN_PARAM_HSYNC_POL         8'h0B
`define REG_VIDEO_VSGEN_PARAM_HDISP_START       8'h0C
`define REG_VIDEO_VSGEN_PARAM_HDISP_END         8'h0D
`define REG_VIDEO_VSGEN_PARAM_HSYNC_START       8'h0E
`define REG_VIDEO_VSGEN_PARAM_HSYNC_END         8'h0F
`define REG_VIDEO_VSGEN_PARAM_VTOTAL            8'h10
`define REG_VIDEO_VSGEN_PARAM_VSYNC_POL         8'h13
`define REG_VIDEO_VSGEN_PARAM_VDISP_START       8'h14
`define REG_VIDEO_VSGEN_PARAM_VDISP_END         8'h15
`define REG_VIDEO_VSGEN_PARAM_VSYNC_START       8'h16
`define REG_VIDEO_VSGEN_PARAM_VSYNC_END         8'h17

localparam REG_VIDEO_ADJDE_CORE_ID            = 8'h00;
localparam REG_VIDEO_ADJDE_CORE_VERSION       = 8'h01;
localparam REG_VIDEO_ADJDE_CTL_CONTROL        = 8'h04;
localparam REG_VIDEO_ADJDE_CTL_STATUS         = 8'h05;
localparam REG_VIDEO_ADJDE_CTL_INDEX          = 8'h07;
localparam REG_VIDEO_ADJDE_PARAM_HSIZE        = 8'h08;
localparam REG_VIDEO_ADJDE_PARAM_VSIZE        = 8'h09;
localparam REG_VIDEO_ADJDE_PARAM_HSTART       = 8'h0a;
localparam REG_VIDEO_ADJDE_PARAM_VSTART       = 8'h0b;
localparam REG_VIDEO_ADJDE_PARAM_HPOL         = 8'h0c;
localparam REG_VIDEO_ADJDE_PARAM_VPOL         = 8'h0d;
localparam REG_VIDEO_ADJDE_CURRENT_HSIZE      = 8'h18;
localparam REG_VIDEO_ADJDE_CURRENT_VSIZE      = 8'h19;
localparam REG_VIDEO_ADJDE_CURRENT_HSTART     = 8'h1a;
localparam REG_VIDEO_ADJDE_CURRENT_VSTART     = 8'h1b;

    
    initial begin
    @(negedge wb_rst_i);
    #10000;
        $display(" --- read id --- ");
        wb_read (32'h00001000); // vdmar
        wb_read (32'h00002000); // vsgen
        
        $display(" --- damr --- ");
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_ADDR,       32'h00000000, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_OFFSET,                0, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_LINE_STEP,        1920*3, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_H_SIZE,           1920-1, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_V_SIZE,           1080-1, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_FRAME_STEP,  1920*3*1080, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_F_SIZE,              1-1, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_PARAM_ARLEN_MAX,          64-1, 8'hff);
        wb_write(32'h00001000 + `REG_VDMA_READ_CTL_CONTROL,                 3, 8'hff);
        
    #1000;
        $display(" --- vsgen --- ");
        wb_write(32'h00002000 + REG_VIDEO_ADJDE_PARAM_VSIZE,  10, 8'hff);
        wb_write(32'h00002000 + REG_VIDEO_ADJDE_PARAM_HSTART, 20, 8'hff);
        wb_write(32'h00002000 + REG_VIDEO_ADJDE_PARAM_VSTART,  3, 8'hff);
        wb_write(32'h00002000 + REG_VIDEO_ADJDE_CTL_CONTROL,   3, 8'hff);
        
    #2000000;
        
        $finish();
    end
    
    
    
endmodule


`default_nettype wire


// end of file
