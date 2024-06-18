// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Ultra96V2 udmabuf test
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none

module zybo_z7_stepper_motor
            #(
                parameter   MICROSTEP_WIDTH = 11    // PWM : 125MHz / 2^11 = 61kHz
            )
            (
                inout   wire    [14:0]  DDR_addr,
                inout   wire    [2:0]   DDR_ba,
                inout   wire            DDR_cas_n,
                inout   wire            DDR_ck_n,
                inout   wire            DDR_ck_p,
                inout   wire            DDR_cke,
                inout   wire            DDR_cs_n,
                inout   wire    [3:0]   DDR_dm,
                inout   wire    [31:0]  DDR_dq,
                inout   wire    [3:0]   DDR_dqs_n,
                inout   wire    [3:0]   DDR_dqs_p,
                inout   wire            DDR_odt,
                inout   wire            DDR_ras_n,
                inout   wire            DDR_reset_n,
                inout   wire            DDR_we_n,
                inout   wire            FIXED_IO_ddr_vrn,
                inout   wire            FIXED_IO_ddr_vrp,
                inout   wire    [53:0]  FIXED_IO_mio,
                inout   wire            FIXED_IO_ps_clk,
                inout   wire            FIXED_IO_ps_porb,
                inout   wire            FIXED_IO_ps_srstb,
                
                
                input   wire            in_reset,
                input   wire            in_clk125,
                
                /*
                output  wire            stm_ap_en,
                output  wire            stm_an_en,
                output  wire            stm_bp_en,
                output  wire            stm_bn_en,
                output  wire            stm_ap_hl,
                output  wire            stm_an_hl,
                output  wire            stm_bp_hl,
                output  wire            stm_bn_hl,
                */

                input   wire    [3:1]   push_sw,
                input   wire    [3:0]   dip_sw,
                output  wire    [3:0]   led,
                inout   wire    [7:0]   pmod_a,
                inout   wire    [7:0]   pmod_b,
                inout   wire    [7:0]   pmod_c,
                inout   wire    [7:0]   pmod_d,
                inout   wire    [7:0]   pmod_e
            );
    
    // -----------------------------
    //  ZynqMP PS
    // -----------------------------
    
    wire            axi4l_peri_aresetn;
    wire            axi4l_peri_aclk;
    wire    [31:0]  axi4l_peri_awaddr;
    wire    [2:0]   axi4l_peri_awprot;
    wire            axi4l_peri_awvalid;
    wire            axi4l_peri_awready;
    wire    [31:0]  axi4l_peri_wdata;
    wire    [3:0]   axi4l_peri_wstrb;
    wire            axi4l_peri_wvalid;
    wire            axi4l_peri_wready;
    wire    [1:0]   axi4l_peri_bresp;
    wire            axi4l_peri_bvalid;
    wire            axi4l_peri_bready;
    wire    [31:0]  axi4l_peri_araddr;
    wire    [2:0]   axi4l_peri_arprot;
    wire            axi4l_peri_arvalid;
    wire            axi4l_peri_arready;
    wire    [31:0]  axi4l_peri_rdata;
    wire    [1:0]   axi4l_peri_rresp;
    wire            axi4l_peri_rvalid;
    wire            axi4l_peri_rready;
    
    design_1
        i_design_1
            (
                .DDR_addr               (DDR_addr),
                .DDR_ba                 (DDR_ba),
                .DDR_cas_n              (DDR_cas_n),
                .DDR_ck_n               (DDR_ck_n),
                .DDR_ck_p               (DDR_ck_p),
                .DDR_cke                (DDR_cke),
                .DDR_cs_n               (DDR_cs_n),
                .DDR_dm                 (DDR_dm),
                .DDR_dq                 (DDR_dq),
                .DDR_dqs_n              (DDR_dqs_n),
                .DDR_dqs_p              (DDR_dqs_p),
                .DDR_odt                (DDR_odt),
                .DDR_ras_n              (DDR_ras_n),
                .DDR_reset_n            (DDR_reset_n),
                .DDR_we_n               (DDR_we_n),
                .FIXED_IO_ddr_vrn       (FIXED_IO_ddr_vrn),
                .FIXED_IO_ddr_vrp       (FIXED_IO_ddr_vrp),
                .FIXED_IO_mio           (FIXED_IO_mio),
                .FIXED_IO_ps_clk        (FIXED_IO_ps_clk),
                .FIXED_IO_ps_porb       (FIXED_IO_ps_porb),
                .FIXED_IO_ps_srstb      (FIXED_IO_ps_srstb),
                
                .m_axi4l_peri_aresetn   (axi4l_peri_aresetn),
                .m_axi4l_peri_aclk      (axi4l_peri_aclk),
                .m_axi4l_peri_awaddr    (axi4l_peri_awaddr),
                .m_axi4l_peri_awprot    (axi4l_peri_awprot),
                .m_axi4l_peri_awvalid   (axi4l_peri_awvalid),
                .m_axi4l_peri_awready   (axi4l_peri_awready),
                .m_axi4l_peri_wdata     (axi4l_peri_wdata),
                .m_axi4l_peri_wstrb     (axi4l_peri_wstrb),
                .m_axi4l_peri_wvalid    (axi4l_peri_wvalid),
                .m_axi4l_peri_wready    (axi4l_peri_wready),
                .m_axi4l_peri_bresp     (axi4l_peri_bresp),
                .m_axi4l_peri_bvalid    (axi4l_peri_bvalid),
                .m_axi4l_peri_bready    (axi4l_peri_bready),
                .m_axi4l_peri_araddr    (axi4l_peri_araddr),
                .m_axi4l_peri_arprot    (axi4l_peri_arprot),
                .m_axi4l_peri_arvalid   (axi4l_peri_arvalid),
                .m_axi4l_peri_arready   (axi4l_peri_arready),
                .m_axi4l_peri_rdata     (axi4l_peri_rdata),
                .m_axi4l_peri_rresp     (axi4l_peri_rresp),
                .m_axi4l_peri_rvalid    (axi4l_peri_rvalid),
                .m_axi4l_peri_rready    (axi4l_peri_rready)
            );
    
    
    
    // -----------------------------
    //  Peripheral BUS (WISHBONE)
    // -----------------------------
    
    localparam  WB_DAT_SIZE  = 2;
    localparam  WB_ADR_WIDTH = 32 - WB_DAT_SIZE;
    localparam  WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH = (1 << WB_DAT_SIZE);
    
    wire                            wb_peri_rst_i;
    wire                            wb_peri_clk_i;
    wire    [WB_ADR_WIDTH-1:0]      wb_peri_adr_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_peri_dat_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_peri_dat_o;
    wire                            wb_peri_we_i;
    wire    [WB_SEL_WIDTH-1:0]      wb_peri_sel_i;
    wire                            wb_peri_stb_i;
    wire                            wb_peri_ack_o;
    
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH       (32),
                .AXI4L_DATA_SIZE        (2)     // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn        (axi4l_peri_aresetn),
                .s_axi4l_aclk           (axi4l_peri_aclk),
                .s_axi4l_awaddr         (axi4l_peri_awaddr),
                .s_axi4l_awprot         (axi4l_peri_awprot),
                .s_axi4l_awvalid        (axi4l_peri_awvalid),
                .s_axi4l_awready        (axi4l_peri_awready),
                .s_axi4l_wstrb          (axi4l_peri_wstrb),
                .s_axi4l_wdata          (axi4l_peri_wdata),
                .s_axi4l_wvalid         (axi4l_peri_wvalid),
                .s_axi4l_wready         (axi4l_peri_wready),
                .s_axi4l_bresp          (axi4l_peri_bresp),
                .s_axi4l_bvalid         (axi4l_peri_bvalid),
                .s_axi4l_bready         (axi4l_peri_bready),
                .s_axi4l_araddr         (axi4l_peri_araddr),
                .s_axi4l_arprot         (axi4l_peri_arprot),
                .s_axi4l_arvalid        (axi4l_peri_arvalid),
                .s_axi4l_arready        (axi4l_peri_arready),
                .s_axi4l_rdata          (axi4l_peri_rdata),
                .s_axi4l_rresp          (axi4l_peri_rresp),
                .s_axi4l_rvalid         (axi4l_peri_rvalid),
                .s_axi4l_rready         (axi4l_peri_rready),
                
                .m_wb_rst_o             (wb_peri_rst_i),
                .m_wb_clk_o             (wb_peri_clk_i),
                .m_wb_adr_o             (wb_peri_adr_i),
                .m_wb_dat_o             (wb_peri_dat_i),
                .m_wb_dat_i             (wb_peri_dat_o),
                .m_wb_we_o              (wb_peri_we_i),
                .m_wb_sel_o             (wb_peri_sel_i),
                .m_wb_stb_o             (wb_peri_stb_i),
                .m_wb_ack_i             (wb_peri_ack_o)
            );
    
    wire    reset = wb_peri_rst_i;
    wire    clk   = wb_peri_clk_i;
    
    // -----------------------------
    //  Global ID
    // -----------------------------
    
    wire    [WB_DAT_WIDTH-1:0]      wb_gid_dat_o;
    wire                            wb_gid_stb_i;
    wire                            wb_gid_ack_o;
    
    assign wb_gid_dat_o = 32'h12345678;
    assign wb_gid_ack_o = wb_gid_stb_i;
    
    
    
    // -----------------------------
    //  stepper moter control
    // -----------------------------
    
    wire                            stmc_out_en;
    wire                            stmc_out_a;
    wire                            stmc_out_b;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_stmc_dat_o;
    wire                            wb_stmc_stb_i;
    wire                            wb_stmc_ack_o;
    
    stepper_motor_control
            #(
                .WB_ADR_WIDTH       (8),
                .WB_DAT_SIZE        (WB_DAT_SIZE),
                
                .Q_WIDTH            (24),       // 小数点サイズ
                .MICROSTEP_WIDTH    (12),
                .X_WIDTH            (48),
                .V_WIDTH            (24),
                .A_WIDTH            (24),
                
                .INIT_CTL_ENABLE    (1'b0),
                .INIT_CTL_TARGET    (3'b0),
                .INIT_CTL_PWM       (2'b11),
                .INIT_TARGET_X      (0),
                .INIT_TARGET_V      (0),
                .INIT_TARGET_A      (0),
                .INIT_MAX_V         (1000),
                .INIT_MAX_A         (100),
                .INIT_MAX_A_NEAR    (120)
            )
        i_stepper_motor_control
            (
                .reset              (wb_peri_rst_i),
                .clk                (wb_peri_clk_i),
                
                .s_wb_adr_i         (wb_peri_adr_i[7:0]),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_dat_o         (wb_stmc_dat_o),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_stmc_stb_i),
                .s_wb_ack_o         (wb_stmc_ack_o),
                
                .motor_en           (stmc_out_en),
                .motor_a            (stmc_out_a),
                .motor_b            (stmc_out_b)
            );
    
    assign pmod_d[0] =  stmc_out_a & stmc_out_en;
    assign pmod_d[1] = ~stmc_out_a & stmc_out_en;
    assign pmod_d[2] =  stmc_out_b & stmc_out_en;
    assign pmod_d[3] = ~stmc_out_b & stmc_out_en;
    assign pmod_d[4] = 1'bz;
    assign pmod_d[5] = 1'bz;
    assign pmod_d[6] = 1'bz;
    assign pmod_d[7] = 1'bz;

    /*
    assign stm_ap_en = stmc_out_en & dip_sw[0];
    assign stm_an_en = stmc_out_en & dip_sw[0];
    assign stm_bp_en = stmc_out_en & dip_sw[0];
    assign stm_bn_en = stmc_out_en & dip_sw[0];
    
    assign stm_ap_hl =  stmc_out_a;
    assign stm_an_hl = ~stmc_out_a;
    assign stm_bp_hl =  stmc_out_b;
    assign stm_bn_hl = ~stmc_out_b;
    */
    
    
    // -----------------------------
    //  Test LED
    // -----------------------------
    
    assign led[0] = dip_sw[0];
    assign led[1] = 1'b0; //stm_ap_hl;
    assign led[2] = 1'b0; //stm_bp_hl;
    assign led[3] = 1'b0; //stm_ap_en;
    

    // -----------------------------
    //  PMOD
    // -----------------------------

    assign pmod_a = 8'hzz;
    assign pmod_b = 8'hzz;
    assign pmod_c = 8'hzz;
    assign pmod_e = 8'hzz;
    
    
    // -----------------------------
    //  WISHBONE address decode
    // -----------------------------
    
    assign wb_gid_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0000);
    assign wb_stmc_stb_i = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0001);
    
    assign wb_peri_dat_o  = wb_gid_stb_i  ? wb_gid_dat_o  :
                            wb_stmc_stb_i ? wb_stmc_dat_o :
                            {WB_DAT_WIDTH{1'b0}};
    
    assign wb_peri_ack_o  = wb_gid_stb_i  ? wb_gid_ack_o  :
                            wb_stmc_stb_i ? wb_stmc_ack_o :
                            wb_peri_stb_i;
    
    
endmodule



`default_nettype wire


// end of file
