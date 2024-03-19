// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//  LUT-Network CNN MNIST recognition
//
//                                 Copyright (C) 2008-2021 by Ryuz
//                                 https://github.com/ryuz/
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// top net
module zybo_z7_mnist_cnn_imx219_hdmi
        #(
            parameter   X_NUM = 1280,
            parameter   Y_NUM = 720
        )
        (
            input   wire            in_clk125,
            
            input   wire    [3:0]   push_sw,
            input   wire    [3:0]   dip_sw,
            output  wire    [3:0]   led,
            output  wire    [7:0]   pmod_a,
            
            input   wire            cam_clk_hs_p,
            input   wire            cam_clk_hs_n,
            input   wire            cam_clk_lp_p,
            input   wire            cam_clk_lp_n,
            input   wire    [1:0]   cam_data_hs_p,
            input   wire    [1:0]   cam_data_hs_n,
            input   wire    [1:0]   cam_data_lp_p,
            input   wire    [1:0]   cam_data_lp_n,
            input   wire            cam_clk,
            output  wire            cam_gpio,
            inout   wire            cam_scl,
            inout   wire            cam_sda,
            
            output  wire            hdmi_tx_clk_p,
            output  wire            hdmi_tx_clk_n,
            output  wire    [2:0]   hdmi_tx_data_p,
            output  wire    [2:0]   hdmi_tx_data_n,
            
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
            inout   wire            FIXED_IO_ps_srstb
        );
    
    
    // ----------------------------------------
    //  input clock
    // ----------------------------------------
    
    wire                        in_clk125_i;
    wire                        in_clk125_buf;
    IBUFG
        i_ibufg_in_clk125
            (
                .I  (in_clk125),
                .O  (in_clk125_i)
            );
    BUFG
        i_bufg_in_clk125
            (
                .I  (in_clk125_i),
                .O  (in_clk125_buf)
            );
    
    
    
    // ----------------------------------------
    //  block design (PS)
    // ----------------------------------------
    
    wire                                sys_reset;
    wire                                sys_clk100;
    wire                                sys_clk200;
    wire                                sys_clk250;
    
    wire                                core_reset;
    wire                                core_clk;
    
    wire                                vout_reset;
    wire                                vout_clk;
    wire                                vout_clk_x5;
    
    localparam  AXI4L_PERI_ADDR_WIDTH = 32;
    localparam  AXI4L_PERI_DATA_SIZE  = 2;     // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
    localparam  AXI4L_PERI_DATA_WIDTH = (8 << AXI4L_PERI_DATA_SIZE);
    localparam  AXI4L_PERI_STRB_WIDTH = AXI4L_PERI_DATA_WIDTH / 8;
    
    wire                                 axi4l_peri_aresetn;
    wire                                 axi4l_peri_aclk;
    wire    [AXI4L_PERI_ADDR_WIDTH-1:0]  axi4l_peri_awaddr;
    wire    [2:0]                        axi4l_peri_awprot;
    wire                                 axi4l_peri_awvalid;
    wire                                 axi4l_peri_awready;
    wire    [AXI4L_PERI_STRB_WIDTH-1:0]  axi4l_peri_wstrb;
    wire    [AXI4L_PERI_DATA_WIDTH-1:0]  axi4l_peri_wdata;
    wire                                 axi4l_peri_wvalid;
    wire                                 axi4l_peri_wready;
    wire    [1:0]                        axi4l_peri_bresp;
    wire                                 axi4l_peri_bvalid;
    wire                                 axi4l_peri_bready;
    wire    [AXI4L_PERI_ADDR_WIDTH-1:0]  axi4l_peri_araddr;
    wire    [2:0]                        axi4l_peri_arprot;
    wire                                 axi4l_peri_arvalid;
    wire                                 axi4l_peri_arready;
    wire    [AXI4L_PERI_DATA_WIDTH-1:0]  axi4l_peri_rdata;
    wire    [1:0]                        axi4l_peri_rresp;
    wire                                 axi4l_peri_rvalid;
    wire                                 axi4l_peri_rready;
    
    localparam  AXI4_MEM0_ID_WIDTH   = 6;
    localparam  AXI4_MEM0_ADDR_WIDTH = 32;
    localparam  AXI4_MEM0_DATA_SIZE  = 3;   // 2:32bit, 3:64bit
    localparam  AXI4_MEM0_DATA_WIDTH = (8 << AXI4_MEM0_DATA_SIZE);
    localparam  AXI4_MEM0_STRB_WIDTH = AXI4_MEM0_DATA_WIDTH / 8;
    
    wire                                axi4_mem_aresetn;
    wire                                axi4_mem_aclk;
    
    wire    [AXI4_MEM0_ID_WIDTH-1:0]    axi4_mem0_awid;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]  axi4_mem0_awaddr;
    wire    [1:0]                       axi4_mem0_awburst;
    wire    [3:0]                       axi4_mem0_awcache;
    wire    [7:0]                       axi4_mem0_awlen;
    wire    [0:0]                       axi4_mem0_awlock;
    wire    [2:0]                       axi4_mem0_awprot;
    wire    [3:0]                       axi4_mem0_awqos;
    wire    [3:0]                       axi4_mem0_awregion;
    wire    [2:0]                       axi4_mem0_awsize;
    wire                                axi4_mem0_awvalid;
    wire                                axi4_mem0_awready;
    wire    [AXI4_MEM0_STRB_WIDTH-1:0]  axi4_mem0_wstrb;
    wire    [AXI4_MEM0_DATA_WIDTH-1:0]  axi4_mem0_wdata;
    wire                                axi4_mem0_wlast;
    wire                                axi4_mem0_wvalid;
    wire                                axi4_mem0_wready;
    wire    [AXI4_MEM0_ID_WIDTH-1:0]    axi4_mem0_bid;
    wire    [1:0]                       axi4_mem0_bresp;
    wire                                axi4_mem0_bvalid;
    wire                                axi4_mem0_bready;
    wire    [AXI4_MEM0_ID_WIDTH-1:0]    axi4_mem0_arid;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]  axi4_mem0_araddr;
    wire    [1:0]                       axi4_mem0_arburst;
    wire    [3:0]                       axi4_mem0_arcache;
    wire    [7:0]                       axi4_mem0_arlen;
    wire    [0:0]                       axi4_mem0_arlock;
    wire    [2:0]                       axi4_mem0_arprot;
    wire    [3:0]                       axi4_mem0_arqos;
    wire    [3:0]                       axi4_mem0_arregion;
    wire    [2:0]                       axi4_mem0_arsize;
    wire                                axi4_mem0_arvalid;
    wire                                axi4_mem0_arready;
    wire    [AXI4_MEM0_ID_WIDTH-1:0]    axi4_mem0_rid;
    wire    [1:0]                       axi4_mem0_rresp;
    wire    [AXI4_MEM0_DATA_WIDTH-1:0]  axi4_mem0_rdata;
    wire                                axi4_mem0_rlast;
    wire                                axi4_mem0_rvalid;
    wire                                axi4_mem0_rready;
    
    wire                                IIC_0_0_scl_i;
    wire                                IIC_0_0_scl_o;
    wire                                IIC_0_0_scl_t;
    wire                                IIC_0_0_sda_i;
    wire                                IIC_0_0_sda_o;
    wire                                IIC_0_0_sda_t;
    
    design_1
        i_design_1
            (
                .sys_reset              (1'b0),
                .sys_clock              (in_clk125_buf),
                
                .out_reset              (sys_reset),
                .out_clk100             (sys_clk100),
                .out_clk200             (sys_clk200),
                .out_clk250             (sys_clk250),
                
                .core_reset             (core_reset),
                .core_clk               (core_clk),
                
                .vout_reset             (vout_reset),
                .vout_clk               (vout_clk),
                .vout_clk_x5            (vout_clk_x5),
                
                .m_axi4l_peri_aresetn   (axi4l_peri_aresetn),
                .m_axi4l_peri_aclk      (axi4l_peri_aclk),
                .m_axi4l_peri_awaddr    (axi4l_peri_awaddr),
                .m_axi4l_peri_awprot    (axi4l_peri_awprot),
                .m_axi4l_peri_awvalid   (axi4l_peri_awvalid),
                .m_axi4l_peri_awready   (axi4l_peri_awready),
                .m_axi4l_peri_wstrb     (axi4l_peri_wstrb),
                .m_axi4l_peri_wdata     (axi4l_peri_wdata),
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
                .m_axi4l_peri_rready    (axi4l_peri_rready),
                
                
                .s_axi4_mem_aresetn     (axi4_mem_aresetn),
                .s_axi4_mem_aclk        (axi4_mem_aclk),
                
                .s_axi4_mem0_awid       (axi4_mem0_awid),
                .s_axi4_mem0_awaddr     (axi4_mem0_awaddr),
                .s_axi4_mem0_awburst    (axi4_mem0_awburst),
                .s_axi4_mem0_awcache    (axi4_mem0_awcache),
                .s_axi4_mem0_awlen      (axi4_mem0_awlen),
                .s_axi4_mem0_awlock     (axi4_mem0_awlock),
                .s_axi4_mem0_awprot     (axi4_mem0_awprot),
                .s_axi4_mem0_awqos      (axi4_mem0_awqos),
    //          .s_axi4_mem0_awregion   (axi4_mem0_awregion),
                .s_axi4_mem0_awsize     (axi4_mem0_awsize),
                .s_axi4_mem0_awvalid    (axi4_mem0_awvalid),
                .s_axi4_mem0_awready    (axi4_mem0_awready),
                .s_axi4_mem0_wstrb      (axi4_mem0_wstrb),
                .s_axi4_mem0_wdata      (axi4_mem0_wdata),
                .s_axi4_mem0_wlast      (axi4_mem0_wlast),
                .s_axi4_mem0_wvalid     (axi4_mem0_wvalid),
                .s_axi4_mem0_wready     (axi4_mem0_wready),
                .s_axi4_mem0_bid        (axi4_mem0_bid),
                .s_axi4_mem0_bresp      (axi4_mem0_bresp),
                .s_axi4_mem0_bvalid     (axi4_mem0_bvalid),
                .s_axi4_mem0_bready     (axi4_mem0_bready),
                .s_axi4_mem0_araddr     (axi4_mem0_araddr),
                .s_axi4_mem0_arburst    (axi4_mem0_arburst),
                .s_axi4_mem0_arcache    (axi4_mem0_arcache),
                .s_axi4_mem0_arid       (axi4_mem0_arid),
                .s_axi4_mem0_arlen      (axi4_mem0_arlen),
                .s_axi4_mem0_arlock     (axi4_mem0_arlock),
                .s_axi4_mem0_arprot     (axi4_mem0_arprot),
                .s_axi4_mem0_arqos      (axi4_mem0_arqos),
    //          .s_axi4_mem0_arregion   (axi4_mem0_arregion),
                .s_axi4_mem0_arsize     (axi4_mem0_arsize),
                .s_axi4_mem0_arvalid    (axi4_mem0_arvalid),
                .s_axi4_mem0_arready    (axi4_mem0_arready),
                .s_axi4_mem0_rid        (axi4_mem0_rid),
                .s_axi4_mem0_rresp      (axi4_mem0_rresp),
                .s_axi4_mem0_rdata      (axi4_mem0_rdata),
                .s_axi4_mem0_rlast      (axi4_mem0_rlast),
                .s_axi4_mem0_rvalid     (axi4_mem0_rvalid),
                .s_axi4_mem0_rready     (axi4_mem0_rready),
                
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
                
                .IIC_0_0_scl_i          (IIC_0_0_scl_i),
                .IIC_0_0_scl_o          (IIC_0_0_scl_o),
                .IIC_0_0_scl_t          (IIC_0_0_scl_t),
                .IIC_0_0_sda_i          (IIC_0_0_sda_i),
                .IIC_0_0_sda_o          (IIC_0_0_sda_o),
                .IIC_0_0_sda_t          (IIC_0_0_sda_t)
            );
    
    assign cam_gpio = dip_sw[0];
    
    IOBUF
        i_IOBUF_cam_scl
            (
                .IO     (cam_scl),
                .I      (IIC_0_0_scl_o),
                .O      (IIC_0_0_scl_i),
                .T      (IIC_0_0_scl_t)
            );

    IOBUF
        i_iobuf_cam_sda
            (
                .IO     (cam_sda),
                .I      (IIC_0_0_sda_o),
                .O      (IIC_0_0_sda_i),
                .T      (IIC_0_0_sda_t)
            );
    
    
    //  Peripheral BUS (WISHBONE)
    localparam  WB_ADR_WIDTH = AXI4L_PERI_ADDR_WIDTH - AXI4L_PERI_DATA_SIZE;
    localparam  WB_DAT_SIZE  = AXI4L_PERI_DATA_SIZE;
    localparam  WB_DAT_WIDTH = AXI4L_PERI_DATA_WIDTH;
    localparam  WB_SEL_WIDTH = AXI4L_PERI_STRB_WIDTH;
    
    wire                            wb_peri_rst_i;
    wire                            wb_peri_clk_i;
    wire    [WB_ADR_WIDTH-1:0]      wb_peri_adr_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_peri_dat_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_peri_dat_i;
    wire                            wb_peri_we_i;
    wire    [WB_SEL_WIDTH-1:0]      wb_peri_sel_i;
    wire                            wb_peri_stb_i;
    wire                            wb_peri_ack_o;
    
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH       (32),
                .AXI4L_DATA_SIZE        (2)     // 0:8bit, 1:16bit, 2:32bit ...
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
    
    
    
    // ----------------------------------------
    //  Global ID
    // ----------------------------------------
    
    wire    [WB_DAT_WIDTH-1:0]      wb_gid_dat_o;
    wire                            wb_gid_stb_i;
    wire                            wb_gid_ack_o;
    
    assign wb_gid_dat_o = 32'h6f6b654e;
    assign wb_gid_ack_o = wb_gid_stb_i;
    
    
    
    
    // ----------------------------------------
    //  Camera Input (Sony IMX219)
    // ----------------------------------------
    
    //  MIPI D-PHY RX
    (* KEEP = "true" *)
    wire                            rxbyteclkhs;
    wire                            system_rst_out;
    wire                            init_done;
    
    wire                            cl_rxclkactivehs;
    wire                            cl_stopstate;
    wire                            cl_enable         = 1;
    wire                            cl_rxulpsclknot;
    wire                            cl_ulpsactivenot;
    
    wire    [7:0]                   dl0_rxdatahs;
    wire                            dl0_rxvalidhs;
    wire                            dl0_rxactivehs;
    wire                            dl0_rxsynchs;
    
    wire                            dl0_forcerxmode   = 0;
    wire                            dl0_stopstate;
    wire                            dl0_enable        = 1;
    wire                            dl0_ulpsactivenot;
    
    wire                            dl0_rxclkesc;
    wire                            dl0_rxlpdtesc;
    wire                            dl0_rxulpsesc;
    wire    [3:0]                   dl0_rxtriggeresc;
    wire    [7:0]                   dl0_rxdataesc;
    wire                            dl0_rxvalidesc;
    
    wire                            dl0_errsoths;
    wire                            dl0_errsotsynchs;
    wire                            dl0_erresc;
    wire                            dl0_errsyncesc;
    wire                            dl0_errcontrol;
    
    wire    [7:0]                   dl1_rxdatahs;
    wire                            dl1_rxvalidhs;
    wire                            dl1_rxactivehs;
    wire                            dl1_rxsynchs;
    
    wire                            dl1_forcerxmode   = 0;
    wire                            dl1_stopstate;
    wire                            dl1_enable        = 1;
    wire                            dl1_ulpsactivenot;
    
    wire                            dl1_rxclkesc;
    wire                            dl1_rxlpdtesc;
    wire                            dl1_rxulpsesc;
    wire    [3:0]                   dl1_rxtriggeresc;
    wire    [7:0]                   dl1_rxdataesc;
    wire                            dl1_rxvalidesc;
    
    wire                            dl1_errsoths;
    wire                            dl1_errsotsynchs;
    wire                            dl1_erresc;
    wire                            dl1_errsyncesc;
    wire                            dl1_errcontrol;
    
    mipi_dphy_cam
        i_mipi_dphy_cam
            (
                .core_clk               (sys_clk200),
                .core_rst               (sys_reset),
                .rxbyteclkhs            (rxbyteclkhs),
                .system_rst_out         (system_rst_out),
                .init_done              (init_done),
                
                .cl_rxclkactivehs       (cl_rxclkactivehs),
                .cl_stopstate           (cl_stopstate),
                .cl_enable              (cl_enable),
                .cl_rxulpsclknot        (cl_rxulpsclknot),
                .cl_ulpsactivenot       (cl_ulpsactivenot),
                
                .dl0_rxdatahs           (dl0_rxdatahs),
                .dl0_rxvalidhs          (dl0_rxvalidhs),
                .dl0_rxactivehs         (dl0_rxactivehs),
                .dl0_rxsynchs           (dl0_rxsynchs),
                
                .dl0_forcerxmode        (dl0_forcerxmode),
                .dl0_stopstate          (dl0_stopstate),
                .dl0_enable             (dl0_enable),
                .dl0_ulpsactivenot      (dl0_ulpsactivenot),
                
                .dl0_rxclkesc           (dl0_rxclkesc),
                .dl0_rxlpdtesc          (dl0_rxlpdtesc),
                .dl0_rxulpsesc          (dl0_rxulpsesc),
                .dl0_rxtriggeresc       (dl0_rxtriggeresc),
                .dl0_rxdataesc          (dl0_rxdataesc),
                .dl0_rxvalidesc         (dl0_rxvalidesc),
                
                .dl0_errsoths           (dl0_errsoths),
                .dl0_errsotsynchs       (dl0_errsotsynchs),
                .dl0_erresc             (dl0_erresc),
                .dl0_errsyncesc         (dl0_errsyncesc),
                .dl0_errcontrol         (dl0_errcontrol),
                
                .dl1_rxdatahs           (dl1_rxdatahs),
                .dl1_rxvalidhs          (dl1_rxvalidhs),
                .dl1_rxactivehs         (dl1_rxactivehs),
                .dl1_rxsynchs           (dl1_rxsynchs),
                
                .dl1_forcerxmode        (dl1_forcerxmode),
                .dl1_stopstate          (dl1_stopstate),
                .dl1_enable             (dl1_enable),
                .dl1_ulpsactivenot      (dl1_ulpsactivenot),
                
                .dl1_rxclkesc           (dl1_rxclkesc),
                .dl1_rxlpdtesc          (dl1_rxlpdtesc),
                .dl1_rxulpsesc          (dl1_rxulpsesc),
                .dl1_rxtriggeresc       (dl1_rxtriggeresc),
                .dl1_rxdataesc          (dl1_rxdataesc),
                .dl1_rxvalidesc         (dl1_rxvalidesc),
                
                .dl1_errsoths           (dl1_errsoths),
                .dl1_errsotsynchs       (dl1_errsotsynchs),
                .dl1_erresc             (dl1_erresc),
                .dl1_errsyncesc         (dl1_errsyncesc),
                .dl1_errcontrol         (dl1_errcontrol),
                
                .clk_hs_rxp             (cam_clk_hs_p),
                .clk_hs_rxn             (cam_clk_hs_n),
                .clk_lp_rxp             (cam_clk_lp_p),
                .clk_lp_rxn             (cam_clk_lp_n),
                .data_hs_rxp            (cam_data_hs_p),
                .data_hs_rxn            (cam_data_hs_n),
                .data_lp_rxp            (cam_data_lp_p),
                .data_lp_rxn            (cam_data_lp_n)
           );
    
    // dphy_reset
    wire                            dphy_clk   = rxbyteclkhs;
    wire                            dphy_reset;
    jelly_reset
            #(
                .IN_LOW_ACTIVE          (0),
                .OUT_LOW_ACTIVE         (0),
                .INPUT_REGS             (2),
                .COUNTER_WIDTH          (5),
                .INSERT_BUFG            (0)
            )
        i_reset
            (
                .clk                    (dphy_clk),
                .in_reset               (sys_reset || system_rst_out),
                .out_reset              (dphy_reset)
            );
    
    
    //  CSI-2
    wire                            axi4s_cam_aresetn = ~core_reset;
    wire                            axi4s_cam_aclk    = core_clk;
    
    wire    [0:0]                   axi4s_csi2_tuser;
    wire                            axi4s_csi2_tlast;
    wire    [9:0]                   axi4s_csi2_tdata;
    wire                            axi4s_csi2_tvalid;
    wire                            axi4s_csi2_tready;
    
    jelly_mipi_csi2_rx
            #(
                .LANES                  (2),
                .DATA_WIDTH             (10),
                .M_FIFO_ASYNC           (1)
            )
        i_mipi_csi2_rx
            (
                .aresetn                (~sys_reset),
                .aclk                   (sys_clk250),
                
                .rxreseths              (system_rst_out),
                .rxbyteclkhs            (rxbyteclkhs),
                .rxdatahs               ({dl1_rxdatahs,   dl0_rxdatahs  }),
                .rxvalidhs              ({dl1_rxvalidhs,  dl0_rxvalidhs }),
                .rxactivehs             ({dl1_rxactivehs, dl0_rxactivehs}),
                .rxsynchs               ({dl1_rxsynchs,   dl0_rxsynchs  }),
                
                .m_axi4s_aresetn        (axi4s_cam_aresetn),
                .m_axi4s_aclk           (axi4s_cam_aclk),
                .m_axi4s_tuser          (axi4s_csi2_tuser),
                .m_axi4s_tlast          (axi4s_csi2_tlast),
                .m_axi4s_tdata          (axi4s_csi2_tdata),
                .m_axi4s_tvalid         (axi4s_csi2_tvalid),
                .m_axi4s_tready         (1'b1)  // (axi4s_csi2_tready)
            );
    
    jelly_axi4s_debug_monitor
            #(
                .TUSER_WIDTH            (1),
                .TDATA_WIDTH            (10),
                .TIMER_WIDTH            (32),
                .FRAME_WIDTH            (32),
                .PIXEL_WIDTH            (32),
                .X_WIDTH                (16),
                .Y_WIDTH                (16)
            )
        i_axi4s_debug_monitor_csi2
            (
                .aresetn                (axi4s_cam_aresetn),
                .aclk                   (axi4s_cam_aclk),
                .aclken                 (1'b1),
                
                .axi4s_tuser            (axi4s_csi2_tuser),
                .axi4s_tlast            (axi4s_csi2_tlast),
                .axi4s_tdata            (axi4s_csi2_tdata),
                .axi4s_tvalid           (axi4s_csi2_tvalid),
                .axi4s_tready           (axi4s_csi2_tready)
            );
    
    
    // video format regularizer
    wire    [0:0]               axi4s_fmtr_tuser;
    wire                        axi4s_fmtr_tlast;
    wire    [9:0]               axi4s_fmtr_tdata;
    wire                        axi4s_fmtr_tvalid;
    wire                        axi4s_fmtr_tready;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_fmtr_dat_o;
    wire                        wb_fmtr_stb_i;
    wire                        wb_fmtr_ack_o;
    
    jelly_video_format_regularizer
            #(
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .TUSER_WIDTH            (1),
                .TDATA_WIDTH            (10),
                .X_WIDTH                (16),
                .Y_WIDTH                (16),
                .TIMER_WIDTH            (32),
                .S_SLAVE_REGS           (1),
                .S_MASTER_REGS          (1),
                .M_SLAVE_REGS           (1),
                .M_MASTER_REGS          (1),
                
                .INIT_CTL_CONTROL       (2'b11),
                .INIT_CTL_SKIP          (1),
                .INIT_PARAM_WIDTH       (X_NUM),
                .INIT_PARAM_HEIGHT      (Y_NUM),
                .INIT_PARAM_FILL        (10'd0),
                .INIT_PARAM_TIMEOUT     (32'h00010000)
            )
        i_video_format_regularizer
            (
                .aresetn                (axi4s_cam_aresetn),
                .aclk                   (axi4s_cam_aclk),
                .aclken                 (1'b1),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_o             (wb_fmtr_dat_o),
                .s_wb_dat_i             (wb_peri_dat_o),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_fmtr_stb_i),
                .s_wb_ack_o             (wb_fmtr_ack_o),
                
                .s_axi4s_tuser          (axi4s_csi2_tuser),
                .s_axi4s_tlast          (axi4s_csi2_tlast),
                .s_axi4s_tdata          (axi4s_csi2_tdata),
                .s_axi4s_tvalid         (axi4s_csi2_tvalid),
                .s_axi4s_tready         (axi4s_csi2_tready),
                
                .m_axi4s_tuser          (axi4s_fmtr_tuser),
                .m_axi4s_tlast          (axi4s_fmtr_tlast),
                .m_axi4s_tdata          (axi4s_fmtr_tdata),
                .m_axi4s_tvalid         (axi4s_fmtr_tvalid),
                .m_axi4s_tready         (axi4s_fmtr_tready)
            );
    
    
    // 現像
    wire    [0:0]                   axi4s_rgb_tuser;
    wire                            axi4s_rgb_tlast;
    wire    [39:0]                  axi4s_rgb_tdata;
    wire                            axi4s_rgb_tvalid;
    wire                            axi4s_rgb_tready;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_rgb_dat_o;
    wire                            wb_rgb_stb_i;
    wire                            wb_rgb_ack_o;
    
    video_raw_to_rgb
            #(
                .WB_ADR_WIDTH           (10),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .DATA_WIDTH             (10),
                
                .IMG_Y_NUM              (Y_NUM),
                .IMG_Y_WIDTH            (12),
                
                .TUSER_WIDTH            (1)
            )
        i_video_raw_to_rgb
            (
                .aresetn                (axi4s_cam_aresetn),
                .aclk                   (axi4s_cam_aclk),
                
                .in_update_req          (1'b1),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[9:0]),
                .s_wb_dat_o             (wb_rgb_dat_o),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_rgb_stb_i),
                .s_wb_ack_o             (wb_rgb_ack_o),
                
                .s_axi4s_tuser          (axi4s_fmtr_tuser),
                .s_axi4s_tlast          (axi4s_fmtr_tlast),
                .s_axi4s_tdata          (axi4s_fmtr_tdata),
                .s_axi4s_tvalid         (axi4s_fmtr_tvalid),
                .s_axi4s_tready         (axi4s_fmtr_tready),
                
                .m_axi4s_tuser          (axi4s_rgb_tuser),
                .m_axi4s_tlast          (axi4s_rgb_tlast),
                .m_axi4s_tdata          (axi4s_rgb_tdata),
                .m_axi4s_tvalid         (axi4s_rgb_tvalid),
                .m_axi4s_tready         (axi4s_rgb_tready)
            );
    
    
    // モノクロ化
    wire    [23:0]                  axi4s_rgb_trgb = {axi4s_rgb_tdata[29:22], axi4s_rgb_tdata[19:12], axi4s_rgb_tdata[9:2]};
    wire    [7:0]                   axi4s_rgb_traw = axi4s_rgb_tdata[39:32];
    
    wire    [0:0]                   axi4s_gray_tuser;
    wire                            axi4s_gray_tlast;
    wire    [9:0]                   axi4s_gray_tdata;
    wire                            axi4s_gray_tvalid;
    
    jelly_video_rgb_to_gray
            #(
                .COMPONENT_NUM          (3),
                .DATA_WIDTH             (10),
                .TUSER_WIDTH            (1)
            )
        i_video_rgb_to_gray
            (
                .aresetn                (axi4s_cam_aresetn),
                .aclk                   (axi4s_cam_aclk),
                
                .s_axi4s_tuser          (axi4s_rgb_tuser),
                .s_axi4s_tlast          (axi4s_rgb_tlast),
                .s_axi4s_tdata          (axi4s_rgb_tdata[29:0]),
                .s_axi4s_tvalid         (axi4s_rgb_tvalid),
                .s_axi4s_tready         (),
                
                .m_axi4s_tuser          (axi4s_gray_tuser),
                .m_axi4s_tlast          (axi4s_gray_tlast),
                .m_axi4s_tdata          (),
                .m_axi4s_tgray          (axi4s_gray_tdata),
                .m_axi4s_tvalid         (axi4s_gray_tvalid),
                .m_axi4s_tready         (1'b1)
            );
    
    
    
    // ----------------------------------
    //  recognition
    // ----------------------------------
    
    // mnist
    wire    [0:0]                   axi4s_mnist_tuser;
    wire                            axi4s_mnist_tlast;
    wire    [3:0]                   axi4s_mnist_tcount;
    wire    [3:0]                   axi4s_mnist_tnumber;
    wire                            axi4s_mnist_tvalid;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_mnist_dat_o;
    wire                            wb_mnist_stb_i;
    wire                            wb_mnist_ack_o;
    
    video_mnist
            #(
                .MAX_X_NUM              (2048),
                .DATA_WIDTH             (8),
                .IMG_Y_NUM              (Y_NUM),
                .IMG_Y_WIDTH            (12),
                .TUSER_WIDTH            (1),
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .INIT_PARAM_TH          (127),
                .INIT_PARAM_INV         (0)
            )
        i_video_mnist
            (
                .aresetn                (axi4s_cam_aresetn),
                .aclk                   (axi4s_cam_aclk),
                
                .s_axi4s_tuser          (axi4s_gray_tuser),
                .s_axi4s_tlast          (axi4s_gray_tlast),
                .s_axi4s_tdata          (axi4s_gray_tdata[9:2]),
                .s_axi4s_tvalid         (axi4s_gray_tvalid),
                .s_axi4s_tready         (),
                
                .m_axi4s_tuser          (axi4s_mnist_tuser),
                .m_axi4s_tlast          (axi4s_mnist_tlast),
                .m_axi4s_tnumber        (axi4s_mnist_tnumber),
                .m_axi4s_tcount         (axi4s_mnist_tcount),
                .m_axi4s_tdata          (),
                .m_axi4s_tvalid         (axi4s_mnist_tvalid),
                .m_axi4s_tready         (1'b1),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_o             (wb_mnist_dat_o),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_mnist_stb_i),
                .s_wb_ack_o             (wb_mnist_ack_o)
            );
    
    
    // frame buffer
    wire    [0:0]                   axi4s_fmem_tuser;
    wire                            axi4s_fmem_tlast;
    wire    [23:0]                  axi4s_fmem_tdata;
    wire    [3:0]                   axi4s_fmem_tcount;
    wire    [3:0]                   axi4s_fmem_tnumber;
    wire                            axi4s_fmem_tvalid;
    wire                            axi4s_fmem_tready;
    
    video_dnn_fmem
            #(
                .TUSER_WIDTH            (1),
                .TDATA_WIDTH            (24),
                .STORE_TDATA_WIDTH      (4+4),
                
                .DIV_X                  (2),
                .DIV_Y                  (2),
                
                .X_WIDTH                (11),
                .Y_WIDTH                (10),
                .MAX_X_NUM              (4096),
                .MAX_Y_NUM              (2048),
                .RAM_TYPE               ("block")
            )
        i_video_dnn_fmem
            (
                .aresetn                (axi4s_cam_aresetn),
                .aclk                   (axi4s_cam_aclk),
                
                .s_axi4s_tuser          (axi4s_rgb_tuser),
                .s_axi4s_tlast          (axi4s_rgb_tlast),
                .s_axi4s_tdata          (axi4s_rgb_trgb),
                .s_axi4s_tvalid         (axi4s_rgb_tvalid),
                .s_axi4s_tready         (axi4s_rgb_tready),
                
                .m_axi4s_tuser          (axi4s_fmem_tuser),
                .m_axi4s_tlast          (axi4s_fmem_tlast),
                .m_axi4s_tdata          (axi4s_fmem_tdata),
                .m_axi4s_tdata_store    ({axi4s_fmem_tnumber, axi4s_fmem_tcount}),
                .m_axi4s_tvalid         (axi4s_fmem_tvalid),
                .m_axi4s_tready         (axi4s_fmem_tready),
                
                
                .s_axi4s_store_aresetn  (axi4s_cam_aresetn),
                .s_axi4s_store_aclk     (axi4s_cam_aclk),
                .s_axi4s_store_tuser    (axi4s_mnist_tuser),
                .s_axi4s_store_tlast    (axi4s_mnist_tlast),
                .s_axi4s_store_tdata    ({axi4s_mnist_tnumber, axi4s_mnist_tcount}),
                .s_axi4s_store_tvalid   (axi4s_mnist_tvalid)
            );
    
    
    // 結果で着色
    wire    [0:0]               axi4s_mcol_tuser;
    wire                        axi4s_mcol_tlast;
    wire    [31:0]              axi4s_mcol_tdata;
    wire                        axi4s_mcol_tvalid;
    wire                        axi4s_mcol_tready;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_mcol_dat_o;
    wire                        wb_mcol_stb_i;
    wire                        wb_mcol_ack_o;
    
    video_mnist_color
            #(
                .DATA_WIDTH         (8),
                .TUSER_WIDTH        (1),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH)
            )
        i_video_mnist_color
            (
                .aresetn            (axi4s_cam_aresetn),
                .aclk               (axi4s_cam_aclk),
                
                .s_axi4s_tuser      (axi4s_fmem_tuser),
                .s_axi4s_tlast      (axi4s_fmem_tlast),
                .s_axi4s_tnumber    (axi4s_fmem_tnumber),
                .s_axi4s_tcount     (axi4s_fmem_tcount),
                .s_axi4s_tdata      ({8'h00, axi4s_fmem_tdata}),
                .s_axi4s_tbinary    (1'b0),
                .s_axi4s_tvalid     (axi4s_fmem_tvalid),
                .s_axi4s_tready     (axi4s_fmem_tready),
                
                .m_axi4s_tuser      (axi4s_mcol_tuser),
                .m_axi4s_tlast      (axi4s_mcol_tlast),
                .m_axi4s_tdata      (axi4s_mcol_tdata),
                .m_axi4s_tvalid     (axi4s_mcol_tvalid),
                .m_axi4s_tready     (axi4s_mcol_tready),
                
                .s_wb_rst_i         (wb_peri_rst_i),
                .s_wb_clk_i         (wb_peri_clk_i),
                .s_wb_adr_i         (wb_peri_adr_i[7:0]),
                .s_wb_dat_o         (wb_mcol_dat_o),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_mcol_stb_i),
                .s_wb_ack_o         (wb_mcol_ack_o)
            );
    
    
    
    // ----------------------------------
    //  buffer manager
    // ----------------------------------
    
    localparam BUFFER_NUM   = 4;
    localparam READER_NUM   = 1;
    
    wire                                vdmaw_buffer_request;
    wire                                vdmaw_buffer_release;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]  vdmaw_buffer_addr;
    wire    [1:0]                       vdmaw_buffer_index;
    
    wire                                vdmar_buffer_request;
    wire                                vdmar_buffer_release;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]  vdmar_buffer_addr;
    wire    [1:0]                       vdmar_buffer_index;

    wire                                hostr_buffer_request;
    wire                                hostr_buffer_release;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]  hostr_buffer_addr;
    wire    [1:0]                       hostr_buffer_index;
    
    
    wire    [WB_DAT_WIDTH-1:0]          wb_bufm_dat_o;
    wire                                wb_bufm_stb_i;
    wire                                wb_bufm_ack_o;
    
    jelly_buffer_manager
            #(
                .BUFFER_NUM             (4),
                .READER_NUM             (2),
                .ADDR_WIDTH             (AXI4_MEM0_ADDR_WIDTH),
                .REFCNT_WIDTH           (2),
                .INDEX_WIDTH            (2),
                
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .INIT_ADDR0             (32'h0000_0000),
                .INIT_ADDR1             (32'h0000_0000),
                .INIT_ADDR2             (32'h0000_0000),
                .INIT_ADDR3             (32'h0000_0000),
                .INIT_ADDR4             (32'h0000_0000)
            )
        i_buffer_manager
            (
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_dat_o             (wb_bufm_dat_o),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_bufm_stb_i),
                .s_wb_ack_o             (wb_bufm_ack_o),
                
                .writer_request         (vdmaw_buffer_request),
                .writer_release         (vdmaw_buffer_release),
                .writer_addr            (vdmaw_buffer_addr),
                .writer_index           (vdmaw_buffer_index),
                
                .reader_request         ({hostr_buffer_request, vdmar_buffer_request}),
                .reader_release         ({hostr_buffer_release, vdmar_buffer_release}),
                .reader_addr            ({hostr_buffer_addr,    vdmar_buffer_addr   }),
                .reader_index           ({hostr_buffer_index,   vdmar_buffer_index  }),
                
                .newest_addr            (),
                .newest_index           (),
                
                .status_refcnt          ()
            );
    
    
    
    // ----------------------------------
    //  buffer allocator
    // ----------------------------------
    
    // バッファ割り当て
    wire    [WB_DAT_WIDTH-1:0]          wb_bufa_dat_o;
    wire                                wb_bufa_stb_i;
    wire                                wb_bufa_ack_o;
    
    jelly_buffer_allocator
            #(
                .ADDR_WIDTH             (AXI4_MEM0_ADDR_WIDTH),
                .INDEX_WIDTH            (2),
                
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH)
            )
        i_buffer_allocator
            (
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_dat_o             (wb_bufa_dat_o),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_bufa_stb_i),
                .s_wb_ack_o             (wb_bufa_ack_o),
                
                .buffer_request         (hostr_buffer_request),
                .buffer_release         (hostr_buffer_release),
                .buffer_addr            (hostr_buffer_addr),
                .buffer_index           (hostr_buffer_index)
            );
    
    
    
    // -----------------------------------------
    //  Video DMA Write
    // -----------------------------------------
    
    wire    [WB_DAT_WIDTH-1:0]          wb_vdmaw_dat_o;
    wire                                wb_vdmaw_stb_i;
    wire                                wb_vdmaw_ack_o;
    
    jelly_dma_video_write
            #(
                .WB_ASYNC               (1),
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .AXI4S_ASYNC            (1),
                .AXI4S_DATA_WIDTH       (24),
                .AXI4S_USER_WIDTH       (1),
                
                .AXI4_ID_WIDTH          (AXI4_MEM0_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_MEM0_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_MEM0_DATA_SIZE),
                .AXI4_LEN_WIDTH         (8),
                .AXI4_QOS_WIDTH         (4),
                
                .INDEX_WIDTH            (1),
                .SIZE_OFFSET            (1'b1),
                .H_SIZE_WIDTH           (12),
                .V_SIZE_WIDTH           (12),
                .F_SIZE_WIDTH           (8),
                .LINE_STEP_WIDTH        (AXI4_MEM0_ADDR_WIDTH),
                .FRAME_STEP_WIDTH       (AXI4_MEM0_ADDR_WIDTH),
                
                .INIT_CTL_CONTROL       (4'b0000),
                .INIT_IRQ_ENABLE        (1'b0),
                .INIT_PARAM_ADDR        (0),
                .INIT_PARAM_AWLEN_MAX   (255),
                .INIT_PARAM_H_SIZE      (X_NUM-1),
                .INIT_PARAM_V_SIZE      (Y_NUM-1),
                .INIT_PARAM_LINE_STEP   (8192),
                .INIT_PARAM_F_SIZE      (0),
                .INIT_PARAM_FRAME_STEP  (Y_NUM*8192),
                .INIT_SKIP_EN           (1'b1),
                .INIT_DETECT_FIRST      (3'b010),
                .INIT_DETECT_LAST       (3'b001),
                .INIT_PADDING_EN        (1'b1),
                .INIT_PADDING_DATA      (32'd0),
                
                .BYPASS_GATE            (0),
                .BYPASS_ALIGN           (0),
                .DETECTOR_ENABLE        (1),
                .ALLOW_UNALIGNED        (1), // (0),
                .CAPACITY_WIDTH         (32),
                
                .WFIFO_PTR_WIDTH        (9),
                .WFIFO_RAM_TYPE         ("block"),
                .WDATFIFO_S_REGS        (1),
                .WDATFIFO_M_REGS        (1)
            )
        i_dma_video_write
            (
                .endian                 (1'b0),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_dat_o             (wb_vdmaw_dat_o),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_vdmaw_stb_i),
                .s_wb_ack_o             (wb_vdmaw_ack_o),
                .out_irq                (),
                
                .buffer_request         (vdmaw_buffer_request),
                .buffer_release         (vdmaw_buffer_release),
                .buffer_addr            (vdmaw_buffer_addr),
                
                .s_axi4s_aresetn        (axi4s_cam_aresetn),
                .s_axi4s_aclk           (axi4s_cam_aclk),
                .s_axi4s_tuser          (axi4s_mcol_tuser),
                .s_axi4s_tlast          (axi4s_mcol_tlast),
                .s_axi4s_tdata          (axi4s_mcol_tdata[23:0]),
                .s_axi4s_tvalid         (axi4s_mcol_tvalid),
                .s_axi4s_tready         (axi4s_mcol_tready),
                
                .m_aresetn              (axi4_mem_aresetn),
                .m_aclk                 (axi4_mem_aclk),
                .m_axi4_awid            (axi4_mem0_awid),
                .m_axi4_awaddr          (axi4_mem0_awaddr),
                .m_axi4_awburst         (axi4_mem0_awburst),
                .m_axi4_awcache         (axi4_mem0_awcache),
                .m_axi4_awlen           (axi4_mem0_awlen),
                .m_axi4_awlock          (axi4_mem0_awlock),
                .m_axi4_awprot          (axi4_mem0_awprot),
                .m_axi4_awqos           (axi4_mem0_awqos),
                .m_axi4_awregion        (),
                .m_axi4_awsize          (axi4_mem0_awsize),
                .m_axi4_awvalid         (axi4_mem0_awvalid),
                .m_axi4_awready         (axi4_mem0_awready),
                .m_axi4_wstrb           (axi4_mem0_wstrb),
                .m_axi4_wdata           (axi4_mem0_wdata),
                .m_axi4_wlast           (axi4_mem0_wlast),
                .m_axi4_wvalid          (axi4_mem0_wvalid),
                .m_axi4_wready          (axi4_mem0_wready),
                .m_axi4_bid             (axi4_mem0_bid),
                .m_axi4_bresp           (axi4_mem0_bresp),
                .m_axi4_bvalid          (axi4_mem0_bvalid),
                .m_axi4_bready          (axi4_mem0_bready)
            );
    
    
    
    // -----------------------------------------
    //  Video DMA Read
    // -----------------------------------------
    
    localparam  VOUT_X_NUM = 1280;
    localparam  VOUT_Y_NUM = 720;
    
    wire    [23:0]                      axi4s_vout_tdata;
    wire                                axi4s_vout_tlast;
    wire    [0:0]                       axi4s_vout_tuser;
    wire                                axi4s_vout_tvalid;
    wire                                axi4s_vout_tready;
    
    
    wire    [WB_DAT_WIDTH-1:0]          wb_vdmar_dat_o;
    wire                                wb_vdmar_stb_i;
    wire                                wb_vdmar_ack_o;
    
    jelly_dma_video_read
            #(
                .WB_ASYNC               (1),
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .AXI4S_ASYNC            (1),
                .AXI4S_DATA_WIDTH       (24), // (32),
                .AXI4S_USER_WIDTH       (1),
                
                .AXI4_ID_WIDTH          (AXI4_MEM0_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_MEM0_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_MEM0_DATA_SIZE),
                .AXI4_LEN_WIDTH         (8),
                .AXI4_QOS_WIDTH         (4),
                
                .INDEX_WIDTH            (1),
                .SIZE_OFFSET            (1'b1),
                .H_SIZE_WIDTH           (12),
                .V_SIZE_WIDTH           (12),
                .F_SIZE_WIDTH           (8),
                .LINE_STEP_WIDTH        (AXI4_MEM0_ADDR_WIDTH),
                .FRAME_STEP_WIDTH       (AXI4_MEM0_ADDR_WIDTH),
                
                .INIT_CTL_CONTROL       (4'b0000),
                .INIT_IRQ_ENABLE        (1'b0),
                .INIT_PARAM_ADDR        (0),
                .INIT_PARAM_AWLEN_MAX   (255),
                .INIT_PARAM_H_SIZE      (VOUT_X_NUM-1),
                .INIT_PARAM_V_SIZE      (VOUT_Y_NUM-1),
                .INIT_PARAM_LINE_STEP   (8192),
                .INIT_PARAM_F_SIZE      (0),
                .INIT_PARAM_FRAME_STEP  (Y_NUM*8192),
                
                .BYPASS_GATE            (0),
                .BYPASS_ALIGN           (1), // (0),
                .ALLOW_UNALIGNED        (0),
                .CAPACITY_WIDTH         (32),
                .RFIFO_PTR_WIDTH        (9),
                .RFIFO_RAM_TYPE         ("block")
            )
        i_dma_video_read
            (
                .endian                 (1'b0),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_dat_o             (wb_vdmar_dat_o),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_vdmar_stb_i),
                .s_wb_ack_o             (wb_vdmar_ack_o),
                .out_irq                (),
                
                .buffer_request         (vdmar_buffer_request),
                .buffer_release         (vdmar_buffer_release),
                .buffer_addr            (vdmar_buffer_addr),
                
                .m_axi4s_aresetn        (~vout_reset),
                .m_axi4s_aclk           (vout_clk),
                .m_axi4s_tdata          (axi4s_vout_tdata),
                .m_axi4s_tlast          (axi4s_vout_tlast),
                .m_axi4s_tuser          (axi4s_vout_tuser),
                .m_axi4s_tvalid         (axi4s_vout_tvalid),
                .m_axi4s_tready         (axi4s_vout_tready),
                
                .m_aresetn              (axi4_mem_aresetn),
                .m_aclk                 (axi4_mem_aclk),
                .m_axi4_arid            (axi4_mem0_arid),
                .m_axi4_araddr          (axi4_mem0_araddr),
                .m_axi4_arlen           (axi4_mem0_arlen),
                .m_axi4_arsize          (axi4_mem0_arsize),
                .m_axi4_arburst         (axi4_mem0_arburst),
                .m_axi4_arlock          (axi4_mem0_arlock),
                .m_axi4_arcache         (axi4_mem0_arcache),
                .m_axi4_arprot          (axi4_mem0_arprot),
                .m_axi4_arqos           (axi4_mem0_arqos),
                .m_axi4_arregion        (axi4_mem0_arregion),
                .m_axi4_arvalid         (axi4_mem0_arvalid),
                .m_axi4_arready         (axi4_mem0_arready),
                .m_axi4_rid             (axi4_mem0_rid),
                .m_axi4_rdata           (axi4_mem0_rdata),
                .m_axi4_rresp           (axi4_mem0_rresp),
                .m_axi4_rlast           (axi4_mem0_rlast),
                .m_axi4_rvalid          (axi4_mem0_rvalid),
                .m_axi4_rready          (axi4_mem0_rready)
            );
    
    
    // ----------------------------------------
    //  VOUT
    // ----------------------------------------
    
    wire                            vout_vsgen_vsync;
    wire                            vout_vsgen_hsync;
    wire                            vout_vsgen_de;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_vsgen_dat_o;
    wire                            wb_vsgen_stb_i;
    wire                            wb_vsgen_ack_o;
    
    jelly_vsync_generator
            #(
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .INIT_CTL_CONTROL       (1'b0),
                
                .INIT_HTOTAL            (1650),
                .INIT_HDISP_START       (0),
                .INIT_HDISP_END         (VOUT_X_NUM),
                .INIT_HSYNC_START       (1390),
                .INIT_HSYNC_END         (1430),
                .INIT_HSYNC_POL         (1),
                .INIT_VTOTAL            (750),
                .INIT_VDISP_START       (0),
                .INIT_VDISP_END         (VOUT_Y_NUM),
                .INIT_VSYNC_START       (725),
                .INIT_VSYNC_END         (730),
                .INIT_VSYNC_POL         (1)
            )
        i_vsync_generator
            (
                .reset                  (vout_reset),
                .clk                    (vout_clk),
                
                .out_vsync              (vout_vsgen_vsync),
                .out_hsync              (vout_vsgen_hsync),
                .out_de                 (vout_vsgen_de),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_o             (wb_vsgen_dat_o),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_vsgen_stb_i),
                .s_wb_ack_o             (wb_vsgen_ack_o)
            );
    
    
    // VOUT
    wire                            vout_vsync;
    wire                            vout_hsync;
    wire                            vout_de;
    wire    [23:0]                  vout_data;
    wire    [3:0]                   vout_ctl;
    
    jelly_vout_axi4s
            #(
                .WIDTH                  (24)
            )
        i_vout_axi4s
            (
                .reset                  (vout_reset),
                .clk                    (vout_clk),
                
                .s_axi4s_tuser          (axi4s_vout_tuser),
                .s_axi4s_tlast          (axi4s_vout_tlast),
                .s_axi4s_tdata          (axi4s_vout_tdata[23:0]),
                .s_axi4s_tvalid         (axi4s_vout_tvalid),
                .s_axi4s_tready         (axi4s_vout_tready),
                
                .in_vsync               (vout_vsgen_vsync),
                .in_hsync               (vout_vsgen_hsync),
                .in_de                  (vout_vsgen_de),
                .in_ctl                 (4'd0),
                
                .out_vsync              (vout_vsync),
                .out_hsync              (vout_hsync),
                .out_de                 (vout_de),
                .out_data               (vout_data),
                .out_ctl                (vout_ctl)
            );
    
    
    // DVI
    jelly_dvi_tx
        i_dvi_tx
            (
                .reset                  (vout_reset),
                .clk                    (vout_clk),
                .clk_x5                 (vout_clk_x5),
                
                .in_vsync               (vout_vsync),
                .in_hsync               (vout_hsync),
                .in_de                  (vout_de),
                .in_data                (vout_data),
                .in_ctl                 (4'd0),
                
                .out_clk_p              (hdmi_tx_clk_p),
                .out_clk_n              (hdmi_tx_clk_n),
                .out_data_p             (hdmi_tx_data_p),
                .out_data_n             (hdmi_tx_data_n)
            );
    
    
    // ----------------------------------------
    //  WISHBONE address decoder
    // ----------------------------------------
    
    assign wb_gid_stb_i   = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h000);   // 0x40000000-0x4000ffff
    assign wb_fmtr_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h010);   // 0x40100000-0x4010ffff
    assign wb_rgb_stb_i   = wb_peri_stb_i & (wb_peri_adr_i[25:18] ==  8'h02);    // 0x40200000-0x402fffff
    assign wb_mnist_stb_i = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h040);   // 0x40400000-0x4040ffff
    assign wb_mcol_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h041);   // 0x40410000-0x4041ffff
    assign wb_bufm_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h030);   // 0x40300000-0x4030ffff
    assign wb_bufa_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h031);   // 0x40310000-0x4031ffff
    assign wb_vdmaw_stb_i = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h032);   // 0x40320000-0x4032ffff
    assign wb_vdmar_stb_i = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h034);   // 0x40340000-0x4034ffff
    assign wb_vsgen_stb_i = wb_peri_stb_i & (wb_peri_adr_i[25:14] == 12'h036);   // 0x40360000-0x4036ffff
    
    
    assign wb_peri_dat_o  = wb_gid_stb_i   ? wb_gid_dat_o   :
                            wb_fmtr_stb_i  ? wb_fmtr_dat_o  :
                            wb_rgb_stb_i   ? wb_rgb_dat_o   :
                            wb_mnist_stb_i ? wb_mnist_dat_o :
                            wb_mcol_stb_i  ? wb_mcol_dat_o  :
                            wb_bufm_stb_i  ? wb_bufm_dat_o  :
                            wb_bufa_stb_i  ? wb_bufa_dat_o  :
                            wb_vdmaw_stb_i ? wb_vdmaw_dat_o :
                            wb_vdmar_stb_i ? wb_vdmar_dat_o :
                            wb_vsgen_stb_i ? wb_vsgen_dat_o :
                            {WB_DAT_WIDTH{1'b0}};
    
    assign wb_peri_ack_o  = wb_gid_stb_i   ? wb_gid_ack_o   :
                            wb_vdmaw_stb_i ? wb_vdmaw_ack_o :
                            wb_fmtr_stb_i  ? wb_fmtr_ack_o  :
                            wb_rgb_stb_i   ? wb_rgb_ack_o   :
                            wb_mnist_stb_i ? wb_mnist_ack_o :
                            wb_mcol_stb_i  ? wb_mcol_ack_o  :
                            wb_bufm_stb_i  ? wb_bufm_ack_o  :
                            wb_bufa_stb_i  ? wb_bufa_ack_o  :
                            wb_vdmar_stb_i ? wb_vdmar_ack_o :
                            wb_vsgen_stb_i ? wb_vsgen_ack_o :
                            wb_peri_stb_i;
    
    
    
    
    // ----------------------------------------
    //  Debug (LED and PMOD)
    // ----------------------------------------
    
    reg     [31:0]      reg_counter_rxbyteclkhs;
    always @(posedge rxbyteclkhs)   reg_counter_rxbyteclkhs <= reg_counter_rxbyteclkhs + 1;
    
    reg     [31:0]      reg_counter_clk200;
    always @(posedge sys_clk200)    reg_counter_clk200 <= reg_counter_clk200 + 1;
    
    reg     [31:0]      reg_counter_clk100;
    always @(posedge sys_clk100)    reg_counter_clk100 <= reg_counter_clk100 + 1;
    
    
    reg     frame_toggle = 0;
    always @(posedge axi4s_cam_aclk) begin
        if ( axi4s_csi2_tuser[0] && axi4s_csi2_tvalid && axi4s_csi2_tready ) begin
            frame_toggle <= ~frame_toggle;
        end
    end
    
    
    assign led[0] = reg_counter_rxbyteclkhs[24];
    assign led[1] = reg_counter_clk200[24];
    assign led[2] = reg_counter_clk100[24];
    assign led[3] = frame_toggle;
    
    assign pmod_a[0]   = frame_toggle;
    assign pmod_a[1]   = reg_counter_rxbyteclkhs[5];
    assign pmod_a[2]   = reg_counter_clk200[5];
    assign pmod_a[3]   = reg_counter_clk100[5];
    assign pmod_a[7:4] = 0;
    
    
endmodule


`default_nettype wire

// end of file
