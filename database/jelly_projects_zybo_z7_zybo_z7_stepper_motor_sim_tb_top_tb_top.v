// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
    localparam RATE = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
        
    #1000000000
        $finish;
    end
    
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0) clk = ~clk;
    
    
    // ----------------------------------
    //  top net
    // ----------------------------------
    
    wire            stm_ap_en;
    wire            stm_an_en;
    wire            stm_bp_en;
    wire            stm_bn_en;
    wire            stm_ap_hl;
    wire            stm_an_hl;
    wire            stm_bp_hl;
    wire            stm_bn_hl;
    
    wire    [3:0]   led;
    
    zybo_z7_stepper_motor
            #(
                .MICROSTEP_WIDTH    (8)
            )
        i_top
            (
                .in_reset           (reset),
                .in_clk125          (clk),
                
                .dip_sw             (4'b0111),
                
                .stm_ap_en          (stm_ap_en),
                .stm_an_en          (stm_an_en),
                .stm_bp_en          (stm_bp_en),
                .stm_bn_en          (stm_bn_en),
                .stm_ap_hl          (stm_ap_hl),
                .stm_an_hl          (stm_an_hl),
                .stm_bp_hl          (stm_bp_hl),
                .stm_bn_hl          (stm_bn_hl)
            );
    
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    parameter   WB_ADR_WIDTH        = 30;
    parameter   WB_DAT_SIZE         = 2;
    parameter   WB_DAT_WIDTH        = (8 << WB_DAT_SIZE);
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
        $display("WISHBONE_WRITE(adr:%h(%h) dat:%h sel:%b)", adr, (adr << WB_DAT_SIZE), dat, sel);
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
            $display("WISHBONE_READ(adr:%h(%h) dat:%h)", adr, (adr << WB_DAT_SIZE), reg_wb_dat);
    end
    endtask
    
    localparam  STMC_ADR_BASE        = 32'h00100;
    localparam  STMC_ADR_CORE_ID     = STMC_ADR_BASE + 8'h00;
    localparam  STMC_ADR_CTL_ENABLE  = STMC_ADR_BASE + 8'h01;
    localparam  STMC_ADR_CTL_TARGET  = STMC_ADR_BASE + 8'h02;
    localparam  STMC_ADR_CTL_PWM     = STMC_ADR_BASE + 8'h03;
    localparam  STMC_ADR_TARGET_X    = STMC_ADR_BASE + 8'h04;
    localparam  STMC_ADR_TARGET_V    = STMC_ADR_BASE + 8'h06;
    localparam  STMC_ADR_TARGET_A    = STMC_ADR_BASE + 8'h07;
    localparam  STMC_ADR_MAX_V       = STMC_ADR_BASE + 8'h09;
    localparam  STMC_ADR_MAX_A       = STMC_ADR_BASE + 8'h0a;
    localparam  STMC_ADR_MAX_A_NEAR  = STMC_ADR_BASE + 8'h0f;
    localparam  STMC_ADR_CUR_X       = STMC_ADR_BASE + 8'h10;
    localparam  STMC_ADR_CUR_V       = STMC_ADR_BASE + 8'h12;
    localparam  STMC_ADR_CUR_A       = STMC_ADR_BASE + 8'h13;
    
    initial begin
        #200;
            $display("start");
            wb_read(STMC_ADR_CORE_ID);
            
            wb_write(STMC_ADR_MAX_A,       100, 4'b1111);
            wb_write(STMC_ADR_MAX_V,    200000, 4'b1111);
            wb_write(STMC_ADR_CTL_ENABLE,    1, 4'b1111);
            
        #100;
            $display("forward acc");
            wb_write(STMC_ADR_CTL_TARGET,  3'b100, 4'b1111);
            wb_write(STMC_ADR_TARGET_A,        10, 4'b1111);
        #1000;
            
            $display("back acc");
            wb_write(STMC_ADR_CTL_TARGET,  3'b100, 4'b1111);
            wb_write(STMC_ADR_TARGET_A,       -10, 4'b1111);
            wb_write(STMC_ADR_CTL_ENABLE ,      1, 4'b1111);
        #3000;
            
            $display("goto target");
            wb_write(STMC_ADR_MAX_V,        20<<16, 4'b1111);
            wb_write(STMC_ADR_MAX_A,         1<<16, 4'b1111);
            wb_write(STMC_ADR_MAX_A_NEAR,    2<<16, 4'b1111);
            wb_write(STMC_ADR_TARGET_X,     100000, 4'b1111);
            wb_write(STMC_ADR_CTL_TARGET,   3'b001, 4'b1111);
            
        #4000;
            $display("set speed");
            wb_write(STMC_ADR_TARGET_V,       1000, 4'b1111);
            wb_write(STMC_ADR_CTL_TARGET,   3'b010, 4'b1111);
            
        #1000;
            $finish();
    end
    
    
endmodule


`default_nettype wire


// end of file
