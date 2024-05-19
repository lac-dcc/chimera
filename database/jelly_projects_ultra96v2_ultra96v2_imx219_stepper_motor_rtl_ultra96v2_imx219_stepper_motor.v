// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The FPGA processing system
//
//  IMX219 capture sample
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/
// ---------------------------------------------------------------------------




`timescale 1ns / 1ps
`default_nettype none


module ultra96v2_imx219_stepper_motor
        #(
            parameter   X_NUM = 3280,
            parameter   Y_NUM = 2464
        )
        (
            output  wire    [1:0]   radio_led,
            
            input   wire    [1:0]   push_sw,
            input   wire    [3:0]   dip_sw,
            output  wire    [3:0]   led,
            output  wire    [7:0]   pmod0,
            output  wire    [7:0]   pmod1,
            
            input   wire            cam_clk_p,
            input   wire            cam_clk_n,
            input   wire    [1:0]   cam_data_p,
            input   wire    [1:0]   cam_data_n
        );
    
    
    // -----------------------------
    //  ZynqMP PS
    // -----------------------------
    
    
    wire                                sys_reset;
    wire                                sys_clk100;
    wire                                sys_clk200;
    wire                                sys_clk250;
    
    wire                                dp_video_ref_reset;
    wire                                dp_video_ref_clk;
    wire                                dp_video_out_vsync;
    wire                                dp_video_out_hsync;
    wire    [35:0]                      dp_live_video_in_pixel1;
    
    localparam  AXI4L_PERI_ADDR_WIDTH = 40;
    localparam  AXI4L_PERI_DATA_SIZE  = 3;     // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
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
    
    
    
    localparam  AXI4_MEM_ID_WIDTH   = 6;
    localparam  AXI4_MEM_ADDR_WIDTH = 49;
    localparam  AXI4_MEM_DATA_SIZE  = 4;   // 2:32bit, 3:64bit, 4:128bit
    localparam  AXI4_MEM_DATA_WIDTH = (8 << AXI4_MEM_DATA_SIZE);
    localparam  AXI4_MEM_STRB_WIDTH = AXI4_MEM_DATA_WIDTH / 8;
    
    wire                                 axi4_mem_aresetn;
    wire                                 axi4_mem_aclk;
    
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_awid;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]    axi4_mem0_awaddr;
    wire    [1:0]                        axi4_mem0_awburst;
    wire    [3:0]                        axi4_mem0_awcache;
    wire    [7:0]                        axi4_mem0_awlen;
    wire    [0:0]                        axi4_mem0_awlock;
    wire    [2:0]                        axi4_mem0_awprot;
    wire    [3:0]                        axi4_mem0_awqos;
    wire    [3:0]                        axi4_mem0_awregion;
    wire    [2:0]                        axi4_mem0_awsize;
    wire                                 axi4_mem0_awvalid;
    wire                                 axi4_mem0_awready;
    wire    [AXI4_MEM_STRB_WIDTH-1:0]    axi4_mem0_wstrb;
    wire    [AXI4_MEM_DATA_WIDTH-1:0]    axi4_mem0_wdata;
    wire                                 axi4_mem0_wlast;
    wire                                 axi4_mem0_wvalid;
    wire                                 axi4_mem0_wready;
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_bid;
    wire    [1:0]                        axi4_mem0_bresp;
    wire                                 axi4_mem0_bvalid;
    wire                                 axi4_mem0_bready;
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_arid;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]    axi4_mem0_araddr;
    wire    [1:0]                        axi4_mem0_arburst;
    wire    [3:0]                        axi4_mem0_arcache;
    wire    [7:0]                        axi4_mem0_arlen;
    wire    [0:0]                        axi4_mem0_arlock;
    wire    [2:0]                        axi4_mem0_arprot;
    wire    [3:0]                        axi4_mem0_arqos;
    wire    [3:0]                        axi4_mem0_arregion;
    wire    [2:0]                        axi4_mem0_arsize;
    wire                                 axi4_mem0_arvalid;
    wire                                 axi4_mem0_arready;
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_rid;
    wire    [1:0]                        axi4_mem0_rresp;
    wire    [AXI4_MEM_DATA_WIDTH-1:0]    axi4_mem0_rdata;
    wire                                 axi4_mem0_rlast;
    wire                                 axi4_mem0_rvalid;
    wire                                 axi4_mem0_rready;
    
    design_1
        i_design_1
            (
                .out_reset                  (sys_reset),
                .out_clk100                 (sys_clk100),
                .out_clk200                 (sys_clk200),
                .out_clk250                 (sys_clk250),
                
                .dp_video_ref_reset         (dp_video_ref_reset),
                .dp_video_ref_clk           (dp_video_ref_clk),
                .dp_video_out_vsync         (dp_video_out_vsync),
                .dp_video_out_hsync         (dp_video_out_hsync),
                .dp_live_video_in_pixel1    (dp_live_video_in_pixel1),
                
                .m_axi4l_peri_aresetn       (axi4l_peri_aresetn),
                .m_axi4l_peri_aclk          (axi4l_peri_aclk),
                .m_axi4l_peri_awaddr        (axi4l_peri_awaddr),
                .m_axi4l_peri_awprot        (axi4l_peri_awprot),
                .m_axi4l_peri_awvalid       (axi4l_peri_awvalid),
                .m_axi4l_peri_awready       (axi4l_peri_awready),
                .m_axi4l_peri_wstrb         (axi4l_peri_wstrb),
                .m_axi4l_peri_wdata         (axi4l_peri_wdata),
                .m_axi4l_peri_wvalid        (axi4l_peri_wvalid),
                .m_axi4l_peri_wready        (axi4l_peri_wready),
                .m_axi4l_peri_bresp         (axi4l_peri_bresp),
                .m_axi4l_peri_bvalid        (axi4l_peri_bvalid),
                .m_axi4l_peri_bready        (axi4l_peri_bready),
                .m_axi4l_peri_araddr        (axi4l_peri_araddr),
                .m_axi4l_peri_arprot        (axi4l_peri_arprot),
                .m_axi4l_peri_arvalid       (axi4l_peri_arvalid),
                .m_axi4l_peri_arready       (axi4l_peri_arready),
                .m_axi4l_peri_rdata         (axi4l_peri_rdata),
                .m_axi4l_peri_rresp         (axi4l_peri_rresp),
                .m_axi4l_peri_rvalid        (axi4l_peri_rvalid),
                .m_axi4l_peri_rready        (axi4l_peri_rready),
                
                
                .s_axi4_mem_aresetn         (axi4_mem_aresetn),
                .s_axi4_mem_aclk            (axi4_mem_aclk),
                
                .s_axi4_mem0_awid           (axi4_mem0_awid),
                .s_axi4_mem0_awaddr         (axi4_mem0_awaddr),
                .s_axi4_mem0_awburst        (axi4_mem0_awburst),
                .s_axi4_mem0_awcache        (axi4_mem0_awcache),
                .s_axi4_mem0_awlen          (axi4_mem0_awlen),
                .s_axi4_mem0_awlock         (axi4_mem0_awlock),
                .s_axi4_mem0_awprot         (axi4_mem0_awprot),
                .s_axi4_mem0_awqos          (axi4_mem0_awqos),
    //          .s_axi4_mem0_awregion       (axi4_mem0_awregion),
                .s_axi4_mem0_awsize         (axi4_mem0_awsize),
                .s_axi4_mem0_awvalid        (axi4_mem0_awvalid),
                .s_axi4_mem0_awready        (axi4_mem0_awready),
                .s_axi4_mem0_wstrb          (axi4_mem0_wstrb),
                .s_axi4_mem0_wdata          (axi4_mem0_wdata),
                .s_axi4_mem0_wlast          (axi4_mem0_wlast),
                .s_axi4_mem0_wvalid         (axi4_mem0_wvalid),
                .s_axi4_mem0_wready         (axi4_mem0_wready),
                .s_axi4_mem0_bid            (axi4_mem0_bid),
                .s_axi4_mem0_bresp          (axi4_mem0_bresp),
                .s_axi4_mem0_bvalid         (axi4_mem0_bvalid),
                .s_axi4_mem0_bready         (axi4_mem0_bready),
                .s_axi4_mem0_araddr         (axi4_mem0_araddr),
                .s_axi4_mem0_arburst        (axi4_mem0_arburst),
                .s_axi4_mem0_arcache        (axi4_mem0_arcache),
                .s_axi4_mem0_arid           (axi4_mem0_arid),
                .s_axi4_mem0_arlen          (axi4_mem0_arlen),
                .s_axi4_mem0_arlock         (axi4_mem0_arlock),
                .s_axi4_mem0_arprot         (axi4_mem0_arprot),
                .s_axi4_mem0_arqos          (axi4_mem0_arqos),
    //          .s_axi4_mem0_arregion       (axi4_mem0_arregion),
                .s_axi4_mem0_arsize         (axi4_mem0_arsize),
                .s_axi4_mem0_arvalid        (axi4_mem0_arvalid),
                .s_axi4_mem0_arready        (axi4_mem0_arready),
                .s_axi4_mem0_rid            (axi4_mem0_rid),
                .s_axi4_mem0_rresp          (axi4_mem0_rresp),
                .s_axi4_mem0_rdata          (axi4_mem0_rdata),
                .s_axi4_mem0_rlast          (axi4_mem0_rlast),
                .s_axi4_mem0_rvalid         (axi4_mem0_rvalid),
                .s_axi4_mem0_rready         (axi4_mem0_rready)
            );
    
    
    
    // AXI4L => WISHBONE
    localparam  WB_ADR_WIDTH = AXI4L_PERI_ADDR_WIDTH - AXI4L_PERI_DATA_SIZE;
    localparam  WB_DAT_SIZE  = AXI4L_PERI_DATA_SIZE;
    localparam  WB_DAT_WIDTH = AXI4L_PERI_DATA_WIDTH;
    localparam  WB_SEL_WIDTH = AXI4L_PERI_STRB_WIDTH;
    
    wire                           wb_peri_rst_i;
    wire                           wb_peri_clk_i;
    wire    [WB_ADR_WIDTH-1:0]     wb_peri_adr_i;
    wire    [WB_DAT_WIDTH-1:0]     wb_peri_dat_o;
    wire    [WB_DAT_WIDTH-1:0]     wb_peri_dat_i;
    wire    [WB_SEL_WIDTH-1:0]     wb_peri_sel_i;
    wire                           wb_peri_we_i;
    wire                           wb_peri_stb_i;
    wire                           wb_peri_ack_o;
    
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH           (AXI4L_PERI_ADDR_WIDTH),
                .AXI4L_DATA_SIZE            (AXI4L_PERI_DATA_SIZE)     // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn            (axi4l_peri_aresetn),
                .s_axi4l_aclk               (axi4l_peri_aclk),
                .s_axi4l_awaddr             (axi4l_peri_awaddr),
                .s_axi4l_awprot             (axi4l_peri_awprot),
                .s_axi4l_awvalid            (axi4l_peri_awvalid),
                .s_axi4l_awready            (axi4l_peri_awready),
                .s_axi4l_wstrb              (axi4l_peri_wstrb),
                .s_axi4l_wdata              (axi4l_peri_wdata),
                .s_axi4l_wvalid             (axi4l_peri_wvalid),
                .s_axi4l_wready             (axi4l_peri_wready),
                .s_axi4l_bresp              (axi4l_peri_bresp),
                .s_axi4l_bvalid             (axi4l_peri_bvalid),
                .s_axi4l_bready             (axi4l_peri_bready),
                .s_axi4l_araddr             (axi4l_peri_araddr),
                .s_axi4l_arprot             (axi4l_peri_arprot),
                .s_axi4l_arvalid            (axi4l_peri_arvalid),
                .s_axi4l_arready            (axi4l_peri_arready),
                .s_axi4l_rdata              (axi4l_peri_rdata),
                .s_axi4l_rresp              (axi4l_peri_rresp),
                .s_axi4l_rvalid             (axi4l_peri_rvalid),
                .s_axi4l_rready             (axi4l_peri_rready),
                
                .m_wb_rst_o                 (wb_peri_rst_i),
                .m_wb_clk_o                 (wb_peri_clk_i),
                .m_wb_adr_o                 (wb_peri_adr_i),
                .m_wb_dat_i                 (wb_peri_dat_o),
                .m_wb_dat_o                 (wb_peri_dat_i),
                .m_wb_sel_o                 (wb_peri_sel_i),
                .m_wb_we_o                  (wb_peri_we_i),
                .m_wb_stb_o                 (wb_peri_stb_i),
                .m_wb_ack_i                 (wb_peri_ack_o)
            );
    
    
    // ----------------------------------------
    //  Global ID
    // ----------------------------------------
    
    wire    [WB_DAT_WIDTH-1:0]  wb_gid_dat_o;
    wire                        wb_gid_stb_i;
    wire                        wb_gid_ack_o;
    
    assign wb_gid_dat_o = 32'h01234567;
    assign wb_gid_ack_o = wb_gid_stb_i;
    
    
    
    // ----------------------------------------
    //  MIPI D-PHY RX
    // ----------------------------------------
    
    (* KEEP = "true" *)
    wire                rxbyteclkhs;
    wire                clkoutphy_out;
    wire                pll_lock_out;
    wire                system_rst_out;
    wire                init_done;
    
    wire                cl_rxclkactivehs;
    wire                cl_stopstate;
    wire                cl_enable         = 1;
    wire                cl_rxulpsclknot;
    wire                cl_ulpsactivenot;
    
    wire    [7:0]       dl0_rxdatahs;
    wire                dl0_rxvalidhs;
    wire                dl0_rxactivehs;
    wire                dl0_rxsynchs;
    
    wire                dl0_forcerxmode   = 0;
    wire                dl0_stopstate;
    wire                dl0_enable        = 1;
    wire                dl0_ulpsactivenot;
    
    wire                dl0_rxclkesc;
    wire                dl0_rxlpdtesc;
    wire                dl0_rxulpsesc;
    wire    [3:0]       dl0_rxtriggeresc;
    wire    [7:0]       dl0_rxdataesc;
    wire                dl0_rxvalidesc;
    
    wire                dl0_errsoths;
    wire                dl0_errsotsynchs;
    wire                dl0_erresc;
    wire                dl0_errsyncesc;
    wire                dl0_errcontrol;
    
    wire    [7:0]       dl1_rxdatahs;
    wire                dl1_rxvalidhs;
    wire                dl1_rxactivehs;
    wire                dl1_rxsynchs;
    
    wire                dl1_forcerxmode   = 0;
    wire                dl1_stopstate;
    wire                dl1_enable        = 1;
    wire                dl1_ulpsactivenot;
    
    wire                dl1_rxclkesc;
    wire                dl1_rxlpdtesc;
    wire                dl1_rxulpsesc;
    wire    [3:0]       dl1_rxtriggeresc;
    wire    [7:0]       dl1_rxdataesc;
    wire                dl1_rxvalidesc;
    
    wire                dl1_errsoths;
    wire                dl1_errsotsynchs;
    wire                dl1_erresc;
    wire                dl1_errsyncesc;
    wire                dl1_errcontrol;
    
    mipi_dphy_cam
        i_mipi_dphy_cam
            (
                .core_clk                   (sys_clk200),
                .core_rst                   (sys_reset),
                .rxbyteclkhs                (rxbyteclkhs),
                
                .clkoutphy_out              (clkoutphy_out),
                .pll_lock_out               (pll_lock_out),
                .system_rst_out             (system_rst_out),
                .init_done                  (init_done),
                
                .cl_rxclkactivehs           (cl_rxclkactivehs),
                .cl_stopstate               (cl_stopstate),
                .cl_enable                  (cl_enable),
                .cl_rxulpsclknot            (cl_rxulpsclknot),
                .cl_ulpsactivenot           (cl_ulpsactivenot),
                
                .dl0_rxdatahs               (dl0_rxdatahs),
                .dl0_rxvalidhs              (dl0_rxvalidhs),
                .dl0_rxactivehs             (dl0_rxactivehs),
                .dl0_rxsynchs               (dl0_rxsynchs),
                
                .dl0_forcerxmode            (dl0_forcerxmode),
                .dl0_stopstate              (dl0_stopstate),
                .dl0_enable                 (dl0_enable),
                .dl0_ulpsactivenot          (dl0_ulpsactivenot),
                
                .dl0_rxclkesc               (dl0_rxclkesc),
                .dl0_rxlpdtesc              (dl0_rxlpdtesc),
                .dl0_rxulpsesc              (dl0_rxulpsesc),
                .dl0_rxtriggeresc           (dl0_rxtriggeresc),
                .dl0_rxdataesc              (dl0_rxdataesc),
                .dl0_rxvalidesc             (dl0_rxvalidesc),
                
                .dl0_errsoths               (dl0_errsoths),
                .dl0_errsotsynchs           (dl0_errsotsynchs),
                .dl0_erresc                 (dl0_erresc),
                .dl0_errsyncesc             (dl0_errsyncesc),
                .dl0_errcontrol             (dl0_errcontrol),
                
                .dl1_rxdatahs               (dl1_rxdatahs),
                .dl1_rxvalidhs              (dl1_rxvalidhs),
                .dl1_rxactivehs             (dl1_rxactivehs),
                .dl1_rxsynchs               (dl1_rxsynchs),
                
                .dl1_forcerxmode            (dl1_forcerxmode),
                .dl1_stopstate              (dl1_stopstate),
                .dl1_enable                 (dl1_enable),
                .dl1_ulpsactivenot          (dl1_ulpsactivenot),
                
                .dl1_rxclkesc               (dl1_rxclkesc),
                .dl1_rxlpdtesc              (dl1_rxlpdtesc),
                .dl1_rxulpsesc              (dl1_rxulpsesc),
                .dl1_rxtriggeresc           (dl1_rxtriggeresc),
                .dl1_rxdataesc              (dl1_rxdataesc),
                .dl1_rxvalidesc             (dl1_rxvalidesc),
                
                .dl1_errsoths               (dl1_errsoths),
                .dl1_errsotsynchs           (dl1_errsotsynchs),
                .dl1_erresc                 (dl1_erresc),
                .dl1_errsyncesc             (dl1_errsyncesc),
                .dl1_errcontrol             (dl1_errcontrol),
                
                .clk_rxp                    (cam_clk_p),
                .clk_rxn                    (cam_clk_n),
                .data_rxp                   (cam_data_p),
                .data_rxn                   (cam_data_n)
           );
    
    
    wire        dphy_clk   = rxbyteclkhs;
    wire        dphy_reset;
    jelly_reset
            #(
                .IN_LOW_ACTIVE              (0),
                .OUT_LOW_ACTIVE             (0),
                .INPUT_REGS                 (2),
                .COUNTER_WIDTH              (5),
                .INSERT_BUFG                (0)
            )
        i_reset
            (
                .clk                        (dphy_clk),
                .in_reset                   (sys_reset || system_rst_out),
                .out_reset                  (dphy_reset)
            );
    
    
    
    
    // ----------------------------------------
    //  CSI-2
    // ----------------------------------------
    
    
    wire            axi4s_cam_aresetn = ~sys_reset;
    wire            axi4s_cam_aclk    = sys_clk200;
    
    wire    [0:0]   axi4s_csi2_tuser;
    wire            axi4s_csi2_tlast;
    wire    [9:0]   axi4s_csi2_tdata;
    wire            axi4s_csi2_tvalid;
    wire            axi4s_csi2_tready;
    
    jelly_mipi_csi2_rx
            #(
                .LANES                      (2),
                .DATA_WIDTH                 (10),
                .M_FIFO_ASYNC               (1)
            )
        i_mipi_csi2_rx
            (
                .aresetn                    (~sys_reset),
                .aclk                       (sys_clk250),
                
                .rxreseths                  (system_rst_out),
                .rxbyteclkhs                (dphy_clk),
                .rxdatahs                   ({dl1_rxdatahs,   dl0_rxdatahs  }),
                .rxvalidhs                  ({dl1_rxvalidhs,  dl0_rxvalidhs }),
                .rxactivehs                 ({dl1_rxactivehs, dl0_rxactivehs}),
                .rxsynchs                   ({dl1_rxsynchs,   dl0_rxsynchs  }),
                
                .m_axi4s_aresetn            (axi4s_cam_aresetn),
                .m_axi4s_aclk               (axi4s_cam_aclk),
                .m_axi4s_tuser              (axi4s_csi2_tuser),
                .m_axi4s_tlast              (axi4s_csi2_tlast),
                .m_axi4s_tdata              (axi4s_csi2_tdata),
                .m_axi4s_tvalid             (axi4s_csi2_tvalid),
                .m_axi4s_tready             (1'b1)  // (axi4s_csi2_tready)
            );
    
    
    // format regularizer
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
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .TUSER_WIDTH                (1),
                .TDATA_WIDTH                (10),
                .X_WIDTH                    (16),
                .Y_WIDTH                    (16),
                .TIMER_WIDTH                (32),
                .S_SLAVE_REGS               (1),
                .S_MASTER_REGS              (1),
                .M_SLAVE_REGS               (1),
                .M_MASTER_REGS              (1),
                
                .INIT_CTL_CONTROL           (2'b00),
                .INIT_CTL_SKIP              (1),
                .INIT_PARAM_WIDTH           (X_NUM),
                .INIT_PARAM_HEIGHT          (Y_NUM),
                .INIT_PARAM_FILL            (10'd0),
                .INIT_PARAM_TIMEOUT         (32'h00010000)
            )
        i_video_format_regularizer
            (
                .aresetn                    (axi4s_cam_aresetn),
                .aclk                       (axi4s_cam_aclk),
                .aclken                     (1'b1),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_o                 (wb_fmtr_dat_o),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_fmtr_stb_i),
                .s_wb_ack_o                 (wb_fmtr_ack_o),
                
                .s_axi4s_tuser              (axi4s_csi2_tuser),
                .s_axi4s_tlast              (axi4s_csi2_tlast),
                .s_axi4s_tdata              (axi4s_csi2_tdata),
                .s_axi4s_tvalid             (axi4s_csi2_tvalid),
                .s_axi4s_tready             (axi4s_csi2_tready),
                
                .m_axi4s_tuser              (axi4s_fmtr_tuser),
                .m_axi4s_tlast              (axi4s_fmtr_tlast),
                .m_axi4s_tdata              (axi4s_fmtr_tdata),
                .m_axi4s_tvalid             (axi4s_fmtr_tvalid),
                .m_axi4s_tready             (axi4s_fmtr_tready)
            );
    
    
    
    
    // ----------------------------------
    //  画像処理
    // ----------------------------------
    
    
    // parameter update(フレーム単位で一括パラメータ更新できるように)
    wire                            parameter_update_req;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_prmup_dat_o;
    wire                            wb_prmup_stb_i;
    wire                            wb_prmup_ack_o;
    
    jelly_video_parameter_update
            #(
                .WB_ADR_WIDTH               (8),
                .WB_DAT_SIZE                (WB_DAT_SIZE),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .TUSER_WIDTH                (1),
                .TDATA_WIDTH                (10),
                
                .INDEX_WIDTH                (1),
                .FRAME_WIDTH                (32),
                
                .INIT_CONTROL               (2'b11),
                
                .DELAY                      (1)
            )
        i_video_parameter_update
            (
                .aresetn                    (axi4s_cam_aresetn),
                .aclk                       (axi4s_cam_aclk),
                .aclken                     (1'b1),
                
                .out_update_req             (parameter_update_req),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_dat_o                 (wb_prmup_dat_o),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_prmup_stb_i),
                .s_wb_ack_o                 (wb_prmup_ack_o),
                
                .s_axi4s_tdata              (axi4s_fmtr_tdata),
                .s_axi4s_tlast              (axi4s_fmtr_tlast),
                .s_axi4s_tuser              (axi4s_fmtr_tuser),
                .s_axi4s_tvalid             (axi4s_fmtr_tvalid),
                .s_axi4s_tready             (),
                
                .m_axi4s_tuser              (),
                .m_axi4s_tlast              (),
                .m_axi4s_tdata              (),
                .m_axi4s_tvalid             (),
                .m_axi4s_tready             (1'b1)
                
            );
    
    
    // image processing
    localparam  IMG_ANGLE_WIDTH = 32;
    
    wire    [0:0]                   axi4s_rgb_tuser;
    wire                            axi4s_rgb_tlast;
    wire    [39:0]                  axi4s_rgb_tdata;
    wire                            axi4s_rgb_tvalid;
    wire                            axi4s_rgb_tready;
    
    wire    [IMG_ANGLE_WIDTH-1:0]   image_angle;
    wire                            image_valid;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_imgp_dat_o;
    wire                            wb_imgp_stb_i;
    wire                            wb_imgp_ack_o;
    
    image_processing
            #(
                .WB_ADR_WIDTH               (13),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .DATA_WIDTH                 (10),
                .ANGLE_WIDTH                (IMG_ANGLE_WIDTH),
                .ATAN2_X_WIDTH              (32),
                .ATAN2_Y_WIDTH              (32),
                
                .IMG_X_NUM                  (640),
                .IMG_Y_NUM                  (132),
                .IMG_X_WIDTH                (14),
                .IMG_Y_WIDTH                (14),
                
                .TUSER_WIDTH                (1)
            )
        i_image_processing
            (
                .aresetn                    (axi4s_cam_aresetn),
                .aclk                       (axi4s_cam_aclk),
                
                .in_update_req              (parameter_update_req),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[12:0]),
                .s_wb_dat_o                 (wb_imgp_dat_o),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_imgp_stb_i),
                .s_wb_ack_o                 (wb_imgp_ack_o),
                
                .s_axi4s_tuser              (axi4s_fmtr_tuser),
                .s_axi4s_tlast              (axi4s_fmtr_tlast),
                .s_axi4s_tdata              (axi4s_fmtr_tdata),
                .s_axi4s_tvalid             (axi4s_fmtr_tvalid),
                .s_axi4s_tready             (axi4s_fmtr_tready),
                
                .m_axi4s_tuser              (axi4s_rgb_tuser),
                .m_axi4s_tlast              (axi4s_rgb_tlast),
                .m_axi4s_tdata              (axi4s_rgb_tdata),
                .m_axi4s_tvalid             (axi4s_rgb_tvalid),
                .m_axi4s_tready             (axi4s_rgb_tready),
                
                .out_reset                  (wb_peri_rst_i),
                .out_clk                    (wb_peri_clk_i),
                .out_angle                  (image_angle),
                .out_valid                  (image_valid)
            );
    
    
    
    // ----------------------------------
    //  buffer manager
    // ----------------------------------
    
    localparam BUFFER_NUM   = 4;
    localparam READER_NUM   = 1;
    
    wire                                vdmaw_buffer_request;
    wire                                vdmaw_buffer_release;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]   vdmaw_buffer_addr;
    wire    [1:0]                       vdmaw_buffer_index;
    
    wire                                vdmar_buffer_request;
    wire                                vdmar_buffer_release;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]   vdmar_buffer_addr;
    wire    [1:0]                       vdmar_buffer_index;
    
    wire                                hostr_buffer_request;
    wire                                hostr_buffer_release;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]   hostr_buffer_addr;
    wire    [1:0]                       hostr_buffer_index;
    
    
    wire    [WB_DAT_WIDTH-1:0]          wb_bufm_dat_o;
    wire                                wb_bufm_stb_i;
    wire                                wb_bufm_ack_o;
    
    jelly_buffer_manager
            #(
                .BUFFER_NUM                 (4),
                .READER_NUM                 (2),
                .ADDR_WIDTH                 (AXI4_MEM_ADDR_WIDTH),
                .REFCNT_WIDTH               (2),
                .INDEX_WIDTH                (2),
                
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .INIT_ADDR0                 (32'h0000_0000),
                .INIT_ADDR1                 (32'h0000_0000),
                .INIT_ADDR2                 (32'h0000_0000),
                .INIT_ADDR3                 (32'h0000_0000),
                .INIT_ADDR4                 (32'h0000_0000)
            )
        i_buffer_manager
            (
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_dat_o                 (wb_bufm_dat_o),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_bufm_stb_i),
                .s_wb_ack_o                 (wb_bufm_ack_o),
                
                .writer_request             (vdmaw_buffer_request),
                .writer_release             (vdmaw_buffer_release),
                .writer_addr                (vdmaw_buffer_addr),
                .writer_index               (vdmaw_buffer_index),
                
                .reader_request             ({hostr_buffer_request, vdmar_buffer_request}),
                .reader_release             ({hostr_buffer_release, vdmar_buffer_release}),
                .reader_addr                ({hostr_buffer_addr,    vdmar_buffer_addr   }),
                .reader_index               ({hostr_buffer_index,   vdmar_buffer_index  }),
                
                .newest_addr                (),
                .newest_index               (),
                
                .status_refcnt              ()
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
                .ADDR_WIDTH                 (AXI4_MEM_ADDR_WIDTH),
                .INDEX_WIDTH                (2),
                
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH)
            )
        i_buffer_allocator
            (
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_dat_o                 (wb_bufa_dat_o),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_bufa_stb_i),
                .s_wb_ack_o                 (wb_bufa_ack_o),
                
                .buffer_request             (hostr_buffer_request),
                .buffer_release             (hostr_buffer_release),
                .buffer_addr                (hostr_buffer_addr),
                .buffer_index               (hostr_buffer_index)
            );
    
    
    // DMA write
    wire    [WB_DAT_WIDTH-1:0]  wb_vdmaw_dat_o;
    wire                        wb_vdmaw_stb_i;
    wire                        wb_vdmaw_ack_o;
    
    jelly_dma_video_write
            #(
                .WB_ASYNC                   (1),
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .AXI4S_ASYNC                (1),
                .AXI4S_DATA_WIDTH           (32),
                .AXI4S_USER_WIDTH           (1),
                
                .AXI4_ID_WIDTH              (AXI4_MEM_ID_WIDTH),
                .AXI4_ADDR_WIDTH            (AXI4_MEM_ADDR_WIDTH),
                .AXI4_DATA_SIZE             (AXI4_MEM_DATA_SIZE),
                .AXI4_LEN_WIDTH             (8),
                .AXI4_QOS_WIDTH             (4),
                
                .INDEX_WIDTH                (1),
                .SIZE_OFFSET                (1'b1),
                .H_SIZE_WIDTH               (12),
                .V_SIZE_WIDTH               (12),
                .F_SIZE_WIDTH               (8),
                .LINE_STEP_WIDTH            (AXI4_MEM_ADDR_WIDTH),
                .FRAME_STEP_WIDTH           (AXI4_MEM_ADDR_WIDTH),
                
                .INIT_CTL_CONTROL           (4'b0000),
                .INIT_IRQ_ENABLE            (1'b0),
                .INIT_PARAM_ADDR            (0),
                .INIT_PARAM_AWLEN_MAX       (255),
                .INIT_PARAM_H_SIZE          (X_NUM-1),
                .INIT_PARAM_V_SIZE          (Y_NUM-1),
                .INIT_PARAM_LINE_STEP       (X_NUM*4),
                .INIT_PARAM_F_SIZE          (0),
                .INIT_PARAM_FRAME_STEP      (Y_NUM*8192),
                .INIT_SKIP_EN               (1'b1),
                .INIT_DETECT_FIRST          (3'b010),
                .INIT_DETECT_LAST           (3'b001),
                .INIT_PADDING_EN            (1'b1),
                .INIT_PADDING_DATA          (32'd0),
                
                .BYPASS_GATE                (0),
                .BYPASS_ALIGN               (0),
                .DETECTOR_ENABLE            (1),
                .ALLOW_UNALIGNED            (1),
                .CAPACITY_WIDTH             (32),
                
                .WFIFO_PTR_WIDTH            (9),
                .WFIFO_RAM_TYPE             ("block")
            )
        i_dma_video_write
            (
                .endian                     (1'b0),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_dat_o                 (wb_vdmaw_dat_o),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_vdmaw_stb_i),
                .s_wb_ack_o                 (wb_vdmaw_ack_o),
                .out_irq                    (),
                
                .buffer_request             (vdmaw_buffer_request),
                .buffer_release             (vdmaw_buffer_release),
                .buffer_addr                (vdmaw_buffer_addr),
                
                .s_axi4s_aresetn            (axi4s_cam_aresetn),
                .s_axi4s_aclk               (axi4s_cam_aclk),
                .s_axi4s_tuser              (axi4s_rgb_tuser),
                .s_axi4s_tlast              (axi4s_rgb_tlast),
                .s_axi4s_tdata              ({
                                                axi4s_rgb_tdata[39:32],
                                                axi4s_rgb_tdata[29:22],
                                                axi4s_rgb_tdata[19:12],
                                                axi4s_rgb_tdata[ 9: 2]
                                            }),
                .s_axi4s_tvalid             (axi4s_rgb_tvalid),
                .s_axi4s_tready             (axi4s_rgb_tready),
                
                .m_aresetn                  (axi4_mem_aresetn),
                .m_aclk                     (axi4_mem_aclk),
                .m_axi4_awid                (axi4_mem0_awid),
                .m_axi4_awaddr              (axi4_mem0_awaddr),
                .m_axi4_awburst             (axi4_mem0_awburst),
                .m_axi4_awcache             (axi4_mem0_awcache),
                .m_axi4_awlen               (axi4_mem0_awlen),
                .m_axi4_awlock              (axi4_mem0_awlock),
                .m_axi4_awprot              (axi4_mem0_awprot),
                .m_axi4_awqos               (axi4_mem0_awqos),
                .m_axi4_awregion            (),
                .m_axi4_awsize              (axi4_mem0_awsize),
                .m_axi4_awvalid             (axi4_mem0_awvalid),
                .m_axi4_awready             (axi4_mem0_awready),
                .m_axi4_wstrb               (axi4_mem0_wstrb),
                .m_axi4_wdata               (axi4_mem0_wdata),
                .m_axi4_wlast               (axi4_mem0_wlast),
                .m_axi4_wvalid              (axi4_mem0_wvalid),
                .m_axi4_wready              (axi4_mem0_wready),
                .m_axi4_bid                 (axi4_mem0_bid),
                .m_axi4_bresp               (axi4_mem0_bresp),
                .m_axi4_bvalid              (axi4_mem0_bvalid),
                .m_axi4_bready              (axi4_mem0_bready)
            );
    
    
    /*
    jelly_vdma_axi4s_to_axi4
            #(
                .ASYNC                      (1),
                .FIFO_PTR_WIDTH             (12),
                
                .PIXEL_SIZE                 (2),    // 32bit
                .AXI4_ID_WIDTH              (AXI4_MEM_ID_WIDTH),
                .AXI4_ADDR_WIDTH            (AXI4_MEM_ADDR_WIDTH),
                .AXI4_DATA_SIZE             (AXI4_MEM_DATA_SIZE),
                .AXI4S_DATA_SIZE            (2),    // 32bit
                .AXI4S_USER_WIDTH           (1),
                .INDEX_WIDTH                (8),
                .STRIDE_WIDTH               (16),
                .H_WIDTH                    (14),
                .V_WIDTH                    (14),
                .SIZE_WIDTH                 (32),
                
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                .INIT_CTL_CONTROL           (2'b00),
                .INIT_PARAM_ADDR            (32'h3000_0000),
                .INIT_PARAM_STRIDE          (X_NUM*2),
                .INIT_PARAM_WIDTH           (X_NUM),
                .INIT_PARAM_HEIGHT          (Y_NUM),
                .INIT_PARAM_SIZE            (X_NUM*Y_NUM),
                .INIT_PARAM_AWLEN           (7)
            )
        i_vdma_axi4s_to_axi4
            (
                .m_axi4_aresetn             (axi4_mem_aresetn),
                .m_axi4_aclk                (axi4_mem_aclk),
                .m_axi4_awid                (axi4_mem0_awid),
                .m_axi4_awaddr              (axi4_mem0_awaddr),
                .m_axi4_awburst             (axi4_mem0_awburst),
                .m_axi4_awcache             (axi4_mem0_awcache),
                .m_axi4_awlen               (axi4_mem0_awlen),
                .m_axi4_awlock              (axi4_mem0_awlock),
                .m_axi4_awprot              (axi4_mem0_awprot),
                .m_axi4_awqos               (axi4_mem0_awqos),
                .m_axi4_awregion            (),
                .m_axi4_awsize              (axi4_mem0_awsize),
                .m_axi4_awvalid             (axi4_mem0_awvalid),
                .m_axi4_awready             (axi4_mem0_awready),
                .m_axi4_wstrb               (axi4_mem0_wstrb),
                .m_axi4_wdata               (axi4_mem0_wdata),
                .m_axi4_wlast               (axi4_mem0_wlast),
                .m_axi4_wvalid              (axi4_mem0_wvalid),
                .m_axi4_wready              (axi4_mem0_wready),
                .m_axi4_bid                 (axi4_mem0_bid),
                .m_axi4_bresp               (axi4_mem0_bresp),
                .m_axi4_bvalid              (axi4_mem0_bvalid),
                .m_axi4_bready              (axi4_mem0_bready),
                
                .s_axi4s_aresetn            (axi4s_cam_aresetn),
                .s_axi4s_aclk               (axi4s_cam_aclk),
                .s_axi4s_tuser              (axi4s_rgb_tuser),
                .s_axi4s_tlast              (axi4s_rgb_tlast),
                .s_axi4s_tdata              ({
                                                axi4s_rgb_tdata[39:32],
                                                axi4s_rgb_tdata[29:22],
                                                axi4s_rgb_tdata[19:12],
                                                axi4s_rgb_tdata[ 9: 2]
                                            }),
                .s_axi4s_tvalid             (axi4s_rgb_tvalid),
                .s_axi4s_tready             (axi4s_rgb_tready),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_o                 (wb_vdmaw_dat_o),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_vdmaw_stb_i),
                .s_wb_ack_o                 (wb_vdmaw_ack_o)
            );
    */
    
    
    // -----------------------------------------
    //  Read
    // -----------------------------------------
    
    
    localparam  VOUT_X_NUM = 1920;
    localparam  VOUT_Y_NUM = 1080;
    
    
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
                .WB_ASYNC                   (1),
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .AXI4S_ASYNC                (1),
                .AXI4S_DATA_WIDTH           (24), // (32),
                .AXI4S_USER_WIDTH           (1),
                
                .AXI4_ID_WIDTH              (AXI4_MEM_ID_WIDTH),
                .AXI4_ADDR_WIDTH            (AXI4_MEM_ADDR_WIDTH),
                .AXI4_DATA_SIZE             (AXI4_MEM_DATA_SIZE),
                .AXI4_LEN_WIDTH             (8),
                .AXI4_QOS_WIDTH             (4),
                
                .INDEX_WIDTH                (1),
                .SIZE_OFFSET                (1'b1),
                .H_SIZE_WIDTH               (12),
                .V_SIZE_WIDTH               (12),
                .F_SIZE_WIDTH               (8),
                .LINE_STEP_WIDTH            (AXI4_MEM_ADDR_WIDTH),
                .FRAME_STEP_WIDTH           (AXI4_MEM_ADDR_WIDTH),
                
                .INIT_CTL_CONTROL           (4'b0000),
                .INIT_IRQ_ENABLE            (1'b0),
                .INIT_PARAM_ADDR            (0),
                .INIT_PARAM_AWLEN_MAX       (255),
                .INIT_PARAM_H_SIZE          (VOUT_X_NUM-1),
                .INIT_PARAM_V_SIZE          (VOUT_Y_NUM-1),
                .INIT_PARAM_LINE_STEP       (8192),
                .INIT_PARAM_F_SIZE          (0),
                .INIT_PARAM_FRAME_STEP      (VOUT_Y_NUM*8192),
                
                .BYPASS_GATE                (0),
                .BYPASS_ALIGN               (0),
                .ALLOW_UNALIGNED            (0),
                .CAPACITY_WIDTH             (32),
                .RFIFO_PTR_WIDTH            (10),
                .RFIFO_RAM_TYPE             ("block")
            )
        i_dma_video_read
            (
                .endian                     (1'b0),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_dat_o                 (wb_vdmar_dat_o),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_vdmar_stb_i),
                .s_wb_ack_o                 (wb_vdmar_ack_o),
                .out_irq                    (),
                
                .buffer_request             (vdmar_buffer_request),
                .buffer_release             (vdmar_buffer_release),
                .buffer_addr                (vdmar_buffer_addr),
                
                .m_axi4s_aresetn            (~vout_reset),
                .m_axi4s_aclk               (vout_clk),
                .m_axi4s_tdata              (axi4s_vout_tdata),
                .m_axi4s_tlast              (axi4s_vout_tlast),
                .m_axi4s_tuser              (axi4s_vout_tuser),
                .m_axi4s_tvalid             (axi4s_vout_tvalid),
                .m_axi4s_tready             (axi4s_vout_tready),
                
                .m_aresetn                  (axi4_mem_aresetn),
                .m_aclk                     (axi4_mem_aclk),
                .m_axi4_arid                (axi4_mem0_arid),
                .m_axi4_araddr              (axi4_mem0_araddr),
                .m_axi4_arlen               (axi4_mem0_arlen),
                .m_axi4_arsize              (axi4_mem0_arsize),
                .m_axi4_arburst             (axi4_mem0_arburst),
                .m_axi4_arlock              (axi4_mem0_arlock),
                .m_axi4_arcache             (axi4_mem0_arcache),
                .m_axi4_arprot              (axi4_mem0_arprot),
                .m_axi4_arqos               (axi4_mem0_arqos),
                .m_axi4_arregion            (axi4_mem0_arregion),
                .m_axi4_arvalid             (axi4_mem0_arvalid),
                .m_axi4_arready             (axi4_mem0_arready),
                .m_axi4_rid                 (axi4_mem0_rid),
                .m_axi4_rdata               (axi4_mem0_rdata),
                .m_axi4_rresp               (axi4_mem0_rresp),
                .m_axi4_rlast               (axi4_mem0_rlast),
                .m_axi4_rvalid              (axi4_mem0_rvalid),
                .m_axi4_rready              (axi4_mem0_rready)
            );
    
    
    
    // ----------------------------------------
    //  VOUT
    // ----------------------------------------
    
    wire                        vout_reset = dp_video_ref_reset;
    wire                        vout_clk   = dp_video_ref_clk;
    
    wire                        vout_vsgen_vsync;
    wire                        vout_vsgen_hsync;
    wire                        vout_vsgen_de;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_vsgen_dat_o;
    wire                        wb_vsgen_stb_i;
    wire                        wb_vsgen_ack_o;
    
    generate
    if ( 0 ) begin : blk_vsync_gen
        jelly_vsync_generator
                #(
                    .WB_ADR_WIDTH           (8),
                    .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                    .INIT_CTL_CONTROL       (1'b0),
                    
                    .INIT_HTOTAL            (2200),
                    .INIT_HDISP_START       (0),
                    .INIT_HDISP_END         (1920),
                    .INIT_HSYNC_START       (2008),
                    .INIT_HSYNC_END         (2052),
                    .INIT_HSYNC_POL         (1),
                    .INIT_VTOTAL            (1125),
                    .INIT_VDISP_START       (0),
                    .INIT_VDISP_END         (1080),
                    .INIT_VSYNC_START       (1084),
                    .INIT_VSYNC_END         (1089),
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
    end
    else begin : blk_vsync_adj
        jelly_vsync_adjust_de
                #(
                   .USER_WIDTH              (0),
                   .H_COUNT_WIDTH           (14),
                   .V_COUNT_WIDTH           (14),
                   
                   .WB_ADR_WIDTH            (8),
                   .WB_DAT_WIDTH            (WB_DAT_WIDTH),
                   
                   .INIT_CTL_CONTROL        (2'b00),
                   .INIT_PARAM_HSIZE        (1920-1),
                   .INIT_PARAM_VSIZE        (1080-1),
                   .INIT_PARAM_HSTART       (131),
                   .INIT_PARAM_VSTART       (35),
                   .INIT_PARAM_HPOL         (1),
                   .INIT_PARAM_VPOL         (1)
                )
            i_vsync_adjust_de
                (
                    .reset                  (vout_reset),
                    .clk                    (vout_clk),
                    
                    .in_update_req          (1'b1),
                    
                    .s_wb_rst_i             (wb_peri_rst_i),
                    .s_wb_clk_i             (wb_peri_clk_i),
                    .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                    .s_wb_dat_o             (wb_vsgen_dat_o),
                    .s_wb_dat_i             (wb_peri_dat_i),
                    .s_wb_we_i              (wb_peri_we_i),
                    .s_wb_sel_i             (wb_peri_sel_i),
                    .s_wb_stb_i             (wb_vsgen_stb_i),
                    .s_wb_ack_o             (wb_vsgen_ack_o),
                    
                    .in_vsync               (dp_video_out_vsync),
                    .in_hsync               (dp_video_out_hsync),
                    .in_user                (1'b0),
                    
                    .out_vsync              (vout_vsgen_vsync),
                    .out_hsync              (vout_vsgen_hsync),
                    .out_de                 (vout_vsgen_de),
                    .out_user               ()
                );
    end
    endgenerate
    
    // vout
    wire            vout_vsync;
    wire            vout_hsync;
    wire            vout_de;
    wire    [23:0]  vout_data;
    wire    [3:0]   vout_ctl;
    
    jelly_vout_axi4s
            #(
                .WIDTH                      (24)
            )
        i_vout_axi4s
            (
                .reset                      (vout_reset),
                .clk                        (vout_clk),
                
                .s_axi4s_tuser              (axi4s_vout_tuser),
                .s_axi4s_tlast              (axi4s_vout_tlast),
                .s_axi4s_tdata              (axi4s_vout_tdata[23:0]),
                .s_axi4s_tvalid             (axi4s_vout_tvalid),
                .s_axi4s_tready             (axi4s_vout_tready),
                
                .in_vsync                   (vout_vsgen_vsync),
                .in_hsync                   (vout_vsgen_hsync),
                .in_de                      (vout_vsgen_de),
                .in_ctl                     (4'd0),
                
                .out_vsync                  (vout_vsync),
                .out_hsync                  (vout_hsync),
                .out_de                     (vout_de),
                .out_data                   (vout_data),
                .out_ctl                    (vout_ctl)
            );
    
    assign dp_live_video_in_pixel1[11:0]  = {vout_data[15: 8], vout_data[15:12]};
    assign dp_live_video_in_pixel1[23:12] = {vout_data[23:16], vout_data[23:20]};
    assign dp_live_video_in_pixel1[35:24] = {vout_data[ 7: 0], vout_data[ 7: 4]};
    
    
    
    
    
    // -----------------------------
    //  position_calc
    // -----------------------------
    
    wire    [31:0]              position_diff;
    wire                        position_valid;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_posc_dat_o;
    wire                        wb_posc_stb_i;
    wire                        wb_posc_ack_o;
    
    diff_calc
            #(
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                .ASYNC                      (0),
                .IN_WIDTH                   (IMG_ANGLE_WIDTH),
                .OUT_WIDTH                  (32),
                .GAIN_WIDTH                 (18),
                .Q_WIDTH                    (16),
                .INIT_ENABLE                (1),
                .INIT_TARGET                (0),
                .INIT_GAIN                  (18'h10000)
            )
        i_diff_calc
            (
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_o                 (wb_posc_dat_o),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_posc_stb_i),
                .s_wb_ack_o                 (wb_posc_ack_o),
                
                .in_reset                   (wb_peri_rst_i),
                .in_clk                     (wb_peri_clk_i),
                .in_data                    (image_angle),
                .in_valid                   (image_valid),
                
                .out_reset                  (wb_peri_rst_i),
                .out_clk                    (wb_peri_clk_i),
                .out_data                   (position_diff),
                .out_valid                  (position_valid)
            );
    
    
    // -----------------------------
    //  stepper moter control
    // -----------------------------
    
    wire                            stmc_out_en;
    wire                            stmc_out_a;
    wire                            stmc_out_b;
    
    wire                            stmc_update;
    wire    signed  [47:0]          stmc_cur_x;
    wire    signed  [24:0]          stmc_cur_v;
    wire    signed  [24:0]          stmc_cur_a;
    wire    signed  [47:0]          stmc_target_x;
    wire    signed  [24:0]          stmc_target_v;
    wire    signed  [24:0]          stmc_target_a;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_stmc_dat_o;
    wire                            wb_stmc_stb_i;
    wire                            wb_stmc_ack_o;
    
    stepper_motor_control
            #(
                .WB_ADR_WIDTH               (8),
                .WB_DAT_SIZE                (WB_DAT_SIZE),
                
                .Q_WIDTH                    (24),       // 小数点サイズ
                .MICROSTEP_WIDTH            (12),
                .X_WIDTH                    (48),
                .V_WIDTH                    (24),
                .A_WIDTH                    (24),
                .X_DIFF_WIDTH               (32),
                
                .INIT_CTL_ENABLE            (1'b0),
                .INIT_CTL_TARGET            (3'b0),
                .INIT_CTL_PWM               (2'b11),
                .INIT_TARGET_X              (0),
                .INIT_TARGET_V              (0),
                .INIT_TARGET_A              (0),
                .INIT_MAX_V                 (1000),
                .INIT_MAX_A                 (100),
                .INIT_MAX_A_NEAR            (120)
            )
        i_stepper_motor_control
            (
                .reset                      (wb_peri_rst_i),
                .clk                        (wb_peri_clk_i),
                
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_dat_o                 (wb_stmc_dat_o),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_stmc_stb_i),
                .s_wb_ack_o                 (wb_stmc_ack_o),
                
                .in_x_diff                  (position_diff),
                .in_valid                   (position_valid),
                
                .motor_en                   (stmc_out_en),
                .motor_a                    (stmc_out_a),
                .motor_b                    (stmc_out_b),
                
                .monitor_update             (stmc_update),
                .monitor_cur_x              (stmc_cur_x),
                .monitor_cur_v              (stmc_cur_v),
                .monitor_cur_a              (stmc_cur_a),
                .monitor_target_x           (stmc_target_x),
                .monitor_target_v           (stmc_target_v),
                .monitor_target_a           (stmc_target_a)
            );
    
//    assign pmod0[0]   = stmc_out_a;
//    assign pmod0[1]   = stmc_out_b;
//    assign pmod0[2]   = stmc_out_en;
//    assign pmod0[7:3] = 0;
    
    assign pmod0[0]   = stmc_out_a;
    assign pmod0[1]   = ~stmc_out_a;
    assign pmod0[2]   = 1'b1;
    assign pmod0[3]   = 1'b0;
    assign pmod0[4]   = stmc_out_b;
    assign pmod0[5]   = ~stmc_out_b;
    assign pmod0[6]   = 1'b1;
    assign pmod0[7]   = 1'b0;
    
    
    // ----------------------------------------
    //  logging
    // ----------------------------------------
    
    // image log
    /*
    wire    [IMG_ANGLE_WIDTH-1:0]   log_image_angle;
    wire                            log_image_valid;
    wire                            log_image_ready;
    
    jelly_data_async
            #(
                .ASYNC                      (1),
                .DATA_WIDTH                 (IMG_ANGLE_WIDTH)
            )
        i_data_async
            (
                .s_reset                    (~axi4s_cam_aresetn),
                .s_clk                      (axi4s_cam_aclk),
                .s_data                     (image_angle),
                .s_valid                    (image_valid),
                .s_ready                    (),
                
                .m_reset                    (wb_peri_rst_i),
                .m_clk                      (wb_peri_clk_i),
                .m_data                     (log_image_angle),
                .m_valid                    (log_image_valid),
                .m_ready                    (log_image_ready)
            );
    */
    
    wire    [WB_DAT_WIDTH-1:0]  wb_log0_dat_o;
    wire                        wb_log0_stb_i;
    wire                        wb_log0_ack_o;
    
    jelly_data_logger_fifo
            #(
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                .DATA_WIDTH                 (IMG_ANGLE_WIDTH),
                .TIMER_WIDTH                (48),
                .FIFO_ASYNC                 (0),
                .FIFO_PTR_WIDTH             (6),
                .FIFO_RAM_TYPE              ("distributed")
            )
        i_data_logger_fifo_img
            (
                .reset                      (wb_peri_rst_i),
                .clk                        (wb_peri_clk_i),
                
                .s_data                     (image_angle),
                .s_valid                    (image_valid),
                .s_ready                    (),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_o                 (wb_log0_dat_o),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_log0_stb_i),
                .s_wb_ack_o                 (wb_log0_ack_o)
            );
    
    
    // motor log
    
    wire    [8*WB_DAT_WIDTH-1:0]    log_stmc_data;
    wire                            log_stmc_valid = stmc_update;
    
    assign log_stmc_data[0*WB_DAT_WIDTH +: WB_DAT_WIDTH] = (stmc_cur_x >> (0*WB_DAT_WIDTH));
    assign log_stmc_data[1*WB_DAT_WIDTH +: WB_DAT_WIDTH] = (stmc_cur_x >> (1*WB_DAT_WIDTH));
    assign log_stmc_data[2*WB_DAT_WIDTH +: WB_DAT_WIDTH] = stmc_cur_v;
    assign log_stmc_data[3*WB_DAT_WIDTH +: WB_DAT_WIDTH] = stmc_cur_a;
    assign log_stmc_data[4*WB_DAT_WIDTH +: WB_DAT_WIDTH] = (stmc_target_x >> (0*WB_DAT_WIDTH));
    assign log_stmc_data[5*WB_DAT_WIDTH +: WB_DAT_WIDTH] = (stmc_target_x >> (1*WB_DAT_WIDTH));
    assign log_stmc_data[6*WB_DAT_WIDTH +: WB_DAT_WIDTH] = stmc_target_v;
    assign log_stmc_data[7*WB_DAT_WIDTH +: WB_DAT_WIDTH] = stmc_target_a;
    
    
    wire    [WB_DAT_WIDTH-1:0]  wb_log1_dat_o;
    wire                        wb_log1_stb_i;
    wire                        wb_log1_ack_o;
    
    jelly_data_logger_fifo
            #(
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                .DATA_WIDTH                 (8*WB_DAT_WIDTH),
                .TIMER_WIDTH                (48),
                .FIFO_ASYNC                 (0),
                .FIFO_PTR_WIDTH             (6),
                .FIFO_RAM_TYPE              ("distributed")
            )
        i_data_logger_fifo_motor
            (
                .reset                      (wb_peri_rst_i),
                .clk                        (wb_peri_clk_i),
                
                .s_data                     (log_stmc_data),
                .s_valid                    (log_stmc_valid),
                .s_ready                    (),
                
                .s_wb_rst_i                 (wb_peri_rst_i),
                .s_wb_clk_i                 (wb_peri_clk_i),
                .s_wb_adr_i                 (wb_peri_adr_i[7:0]),
                .s_wb_dat_o                 (wb_log1_dat_o),
                .s_wb_dat_i                 (wb_peri_dat_i),
                .s_wb_we_i                  (wb_peri_we_i),
                .s_wb_sel_i                 (wb_peri_sel_i),
                .s_wb_stb_i                 (wb_log1_stb_i),
                .s_wb_ack_o                 (wb_log1_ack_o)
            );
    
    
    
    
    
    // ----------------------------------------
    //  WISHBONE address decoder
    // ----------------------------------------

    assign wb_gid_stb_i   = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h000);      // 0x80000000-0x8000ffff
    assign wb_fmtr_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h010);      // 0x80100000-0x8010ffff
    assign wb_prmup_stb_i = wb_peri_stb_i & (wb_peri_adr_i[24:9]  == 16'h001_1);    // 0x80011000-0x80011fff
    assign wb_imgp_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] ==  8'h02);       // 0x80120000-0x8012ffff
    assign wb_bufm_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h030);      // 0x80300000-0x8030ffff
    assign wb_bufa_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h031);      // 0x80310000-0x8031ffff
    assign wb_vdmaw_stb_i = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h032);      // 0x80320000-0x8032ffff
    assign wb_vdmar_stb_i = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h034);      // 0x80340000-0x8034ffff
    assign wb_vsgen_stb_i = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h036);      // 0x80360000-0x8036ffff
    assign wb_stmc_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 16'h041);      // 0x80410000-0x80041fff
    assign wb_posc_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 16'h042);      // 0x80420000-0x80042fff
    assign wb_log0_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 16'h070);      // 0x80700000-0x80070fff
    assign wb_log1_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 16'h071);      // 0x80710000-0x80071fff
    
    assign wb_peri_dat_o  = wb_gid_stb_i   ? wb_gid_dat_o   :
                            wb_fmtr_stb_i  ? wb_fmtr_dat_o  :
                            wb_prmup_stb_i ? wb_prmup_dat_o :
                            wb_imgp_stb_i  ? wb_imgp_dat_o  :
                            wb_bufm_stb_i  ? wb_bufm_dat_o  :
                            wb_bufa_stb_i  ? wb_bufa_dat_o  :
                            wb_vdmaw_stb_i ? wb_vdmaw_dat_o :
                            wb_vdmar_stb_i ? wb_vdmar_dat_o :
                            wb_vsgen_stb_i ? wb_vsgen_dat_o :
                            wb_stmc_stb_i  ? wb_stmc_dat_o  :
                            wb_posc_stb_i  ? wb_posc_dat_o  :
                            wb_log0_stb_i  ? wb_log0_dat_o  :
                            wb_log1_stb_i  ? wb_log1_dat_o  :
                            {WB_DAT_WIDTH{1'b0}};
    
    assign wb_peri_ack_o  = wb_gid_stb_i   ? wb_gid_ack_o   :
                            wb_fmtr_stb_i  ? wb_fmtr_ack_o  :
                            wb_prmup_stb_i ? wb_prmup_ack_o :
                            wb_imgp_stb_i  ? wb_imgp_ack_o  :
                            wb_bufm_stb_i  ? wb_bufm_ack_o  :
                            wb_bufa_stb_i  ? wb_bufa_ack_o  :
                            wb_vdmaw_stb_i ? wb_vdmaw_ack_o :
                            wb_vdmar_stb_i ? wb_vdmar_ack_o :
                            wb_vsgen_stb_i ? wb_vsgen_ack_o :
                            wb_stmc_stb_i  ? wb_stmc_ack_o  :
                            wb_posc_stb_i  ? wb_posc_ack_o  :
                            wb_log0_stb_i  ? wb_log0_ack_o  :
                            wb_log1_stb_i  ? wb_log1_ack_o  :
                            wb_peri_stb_i;
    
    
    
    // ----------------------------------------
    //  Debug
    // ----------------------------------------
    
    reg     [31:0]      reg_counter_rxbyteclkhs;
    always @(posedge rxbyteclkhs)   reg_counter_rxbyteclkhs <= reg_counter_rxbyteclkhs + 1;
    
    reg     [31:0]      reg_counter_clk200;
    always @(posedge sys_clk200)    reg_counter_clk200 <= reg_counter_clk200 + 1;
    
    reg     [31:0]      reg_counter_clk100;
    always @(posedge sys_clk100)    reg_counter_clk100 <= reg_counter_clk100 + 1;
    
    reg     [31:0]      reg_counter_peri_aclk;
    always @(posedge axi4l_peri_aclk)   reg_counter_peri_aclk <= reg_counter_peri_aclk + 1;
    
    reg     [31:0]      reg_counter_mem_aclk;
    always @(posedge axi4_mem_aclk) reg_counter_mem_aclk <= reg_counter_mem_aclk + 1;
    
    reg     frame_toggle = 0;
    always @(posedge axi4s_cam_aclk) begin
        if ( axi4s_csi2_tuser[0] && axi4s_csi2_tvalid && axi4s_csi2_tready ) begin
            frame_toggle <= ~frame_toggle;
        end
    end
    
    
    assign led[0] = reg_counter_rxbyteclkhs[24];
    assign led[1] = reg_counter_peri_aclk[24]; // reg_counter_clk200[24];
    assign led[2] = reg_counter_mem_aclk[24];  // reg_counter_clk100[24];
    assign led[3] = frame_toggle;
    
    assign pmod1[0]   = frame_toggle;
    assign pmod1[1]   = reg_counter_rxbyteclkhs[5];
    assign pmod1[2]   = reg_counter_clk200[5];
    assign pmod1[3]   = reg_counter_clk100[5];
    assign pmod1[7:4] = 0;
    
    
endmodule


`default_nettype wire

