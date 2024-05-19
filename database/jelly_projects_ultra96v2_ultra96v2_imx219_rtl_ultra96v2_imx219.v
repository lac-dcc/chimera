// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License




`timescale 1ns / 1ps
`default_nettype none


module ultra96v2_imx219
        #(
            parameter   X_NUM = 3280 / 2,
            parameter   Y_NUM = 2464 / 2
        )
        (
            input   wire            cam_clk_p,
            input   wire            cam_clk_n,
            input   wire    [1:0]   cam_data_p,
            input   wire    [1:0]   cam_data_n,
            
            output  wire    [1:0]   radio_led,
            output  wire    [7:0]   pmod0,
            output  wire    [7:0]   pmod1
        );
    
    wire            sys_reset;
    wire            sys_clk100;
    wire            sys_clk200;
    wire            sys_clk250;
    
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
    
    
    
    localparam  AXI4_MEM0_ID_WIDTH   = 6;
    localparam  AXI4_MEM0_ADDR_WIDTH = 49;
    localparam  AXI4_MEM0_DATA_SIZE  = 4;   // 2:32bit, 3:64bit, 4:128bit
    localparam  AXI4_MEM0_DATA_WIDTH = (8 << AXI4_MEM0_DATA_SIZE);
    localparam  AXI4_MEM0_STRB_WIDTH = AXI4_MEM0_DATA_WIDTH / 8;
    
    wire                                 axi4_mem_aresetn;
    wire                                 axi4_mem_aclk;
    
    wire    [AXI4_MEM0_ID_WIDTH-1:0]     axi4_mem0_awid;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]   axi4_mem0_awaddr;
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
    wire    [AXI4_MEM0_STRB_WIDTH-1:0]   axi4_mem0_wstrb;
    wire    [AXI4_MEM0_DATA_WIDTH-1:0]   axi4_mem0_wdata;
    wire                                 axi4_mem0_wlast;
    wire                                 axi4_mem0_wvalid;
    wire                                 axi4_mem0_wready;
    wire    [AXI4_MEM0_ID_WIDTH-1:0]     axi4_mem0_bid;
    wire    [1:0]                        axi4_mem0_bresp;
    wire                                 axi4_mem0_bvalid;
    wire                                 axi4_mem0_bready;
    wire    [AXI4_MEM0_ID_WIDTH-1:0]     axi4_mem0_arid;
    wire    [AXI4_MEM0_ADDR_WIDTH-1:0]   axi4_mem0_araddr;
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
    wire    [AXI4_MEM0_ID_WIDTH-1:0]     axi4_mem0_rid;
    wire    [1:0]                        axi4_mem0_rresp;
    wire    [AXI4_MEM0_DATA_WIDTH-1:0]   axi4_mem0_rdata;
    wire                                 axi4_mem0_rlast;
    wire                                 axi4_mem0_rvalid;
    wire                                 axi4_mem0_rready;
    
    design_1
        i_design_1
            (
                .out_reset              (sys_reset),
                .out_clk100             (sys_clk100),
                .out_clk200             (sys_clk200),
                .out_clk250             (sys_clk250),
                
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
                .s_axi4_mem0_rready     (axi4_mem0_rready)
            );
    
    
    
    // AXI4L => WISHBONE
    localparam  WB_ADR_WIDTH = AXI4L_PERI_ADDR_WIDTH - AXI4L_PERI_DATA_SIZE;
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
                .AXI4L_ADDR_WIDTH   (AXI4L_PERI_ADDR_WIDTH),
                .AXI4L_DATA_SIZE    (AXI4L_PERI_DATA_SIZE)     // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn    (axi4l_peri_aresetn),
                .s_axi4l_aclk       (axi4l_peri_aclk),
                .s_axi4l_awaddr     (axi4l_peri_awaddr),
                .s_axi4l_awprot     (axi4l_peri_awprot),
                .s_axi4l_awvalid    (axi4l_peri_awvalid),
                .s_axi4l_awready    (axi4l_peri_awready),
                .s_axi4l_wstrb      (axi4l_peri_wstrb),
                .s_axi4l_wdata      (axi4l_peri_wdata),
                .s_axi4l_wvalid     (axi4l_peri_wvalid),
                .s_axi4l_wready     (axi4l_peri_wready),
                .s_axi4l_bresp      (axi4l_peri_bresp),
                .s_axi4l_bvalid     (axi4l_peri_bvalid),
                .s_axi4l_bready     (axi4l_peri_bready),
                .s_axi4l_araddr     (axi4l_peri_araddr),
                .s_axi4l_arprot     (axi4l_peri_arprot),
                .s_axi4l_arvalid    (axi4l_peri_arvalid),
                .s_axi4l_arready    (axi4l_peri_arready),
                .s_axi4l_rdata      (axi4l_peri_rdata),
                .s_axi4l_rresp      (axi4l_peri_rresp),
                .s_axi4l_rvalid     (axi4l_peri_rvalid),
                .s_axi4l_rready     (axi4l_peri_rready),
                
                .m_wb_rst_o         (wb_peri_rst_i),
                .m_wb_clk_o         (wb_peri_clk_i),
                .m_wb_adr_o         (wb_peri_adr_i),
                .m_wb_dat_i         (wb_peri_dat_o),
                .m_wb_dat_o         (wb_peri_dat_i),
                .m_wb_sel_o         (wb_peri_sel_i),
                .m_wb_we_o          (wb_peri_we_i),
                .m_wb_stb_o         (wb_peri_stb_i),
                .m_wb_ack_i         (wb_peri_ack_o)
            );
    
    // ----------------------------------------
    //  Global ID
    // ----------------------------------------
    
    wire    [WB_DAT_WIDTH-1:0]  wb_gid_dat_o;
    wire                        wb_gid_stb_i;
    wire                        wb_gid_ack_o;
    
    assign wb_gid_dat_o = 32'h01234567;
    assign wb_gid_ack_o = wb_gid_stb_i;
    
    reg     reg_sw_reset;
    always @(posedge wb_peri_clk_i) begin
        if ( wb_peri_rst_i ) begin
            reg_sw_reset <= 1'b0;
        end
        else begin
            if ( wb_gid_stb_i && wb_peri_we_i ) begin
                reg_sw_reset <= wb_peri_dat_i;
            end
        end
    end
    

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
    
    (* mark_debug="true" *) wire    [7:0]       dl0_rxdatahs;
    (* mark_debug="true" *) wire                dl0_rxvalidhs;
    (* mark_debug="true" *) wire                dl0_rxactivehs;
    (* mark_debug="true" *) wire                dl0_rxsynchs;
    
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
    
    (* mark_debug="true" *) wire    [7:0]       dl1_rxdatahs;
    (* mark_debug="true" *) wire                dl1_rxvalidhs;
    (* mark_debug="true" *) wire                dl1_rxactivehs;
    (* mark_debug="true" *) wire                dl1_rxsynchs;
    
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
                .core_clk           (sys_clk200),
                .core_rst           (sys_reset | reg_sw_reset),
                .rxbyteclkhs        (rxbyteclkhs),
                
                .clkoutphy_out      (clkoutphy_out),
                .pll_lock_out       (pll_lock_out),
                .system_rst_out     (system_rst_out),
                .init_done          (init_done),
                
                .cl_rxclkactivehs   (cl_rxclkactivehs),
                .cl_stopstate       (cl_stopstate),
                .cl_enable          (cl_enable),
                .cl_rxulpsclknot    (cl_rxulpsclknot),
                .cl_ulpsactivenot   (cl_ulpsactivenot),
                
                .dl0_rxdatahs       (dl0_rxdatahs),
                .dl0_rxvalidhs      (dl0_rxvalidhs),
                .dl0_rxactivehs     (dl0_rxactivehs),
                .dl0_rxsynchs       (dl0_rxsynchs),
                
                .dl0_forcerxmode    (dl0_forcerxmode),
                .dl0_stopstate      (dl0_stopstate),
                .dl0_enable         (dl0_enable),
                .dl0_ulpsactivenot  (dl0_ulpsactivenot),
                
                .dl0_rxclkesc       (dl0_rxclkesc),
                .dl0_rxlpdtesc      (dl0_rxlpdtesc),
                .dl0_rxulpsesc      (dl0_rxulpsesc),
                .dl0_rxtriggeresc   (dl0_rxtriggeresc),
                .dl0_rxdataesc      (dl0_rxdataesc),
                .dl0_rxvalidesc     (dl0_rxvalidesc),
                
                .dl0_errsoths       (dl0_errsoths),
                .dl0_errsotsynchs   (dl0_errsotsynchs),
                .dl0_erresc         (dl0_erresc),
                .dl0_errsyncesc     (dl0_errsyncesc),
                .dl0_errcontrol     (dl0_errcontrol),
                
                .dl1_rxdatahs       (dl1_rxdatahs),
                .dl1_rxvalidhs      (dl1_rxvalidhs),
                .dl1_rxactivehs     (dl1_rxactivehs),
                .dl1_rxsynchs       (dl1_rxsynchs),
                
                .dl1_forcerxmode    (dl1_forcerxmode),
                .dl1_stopstate      (dl1_stopstate),
                .dl1_enable         (dl1_enable),
                .dl1_ulpsactivenot  (dl1_ulpsactivenot),
                
                .dl1_rxclkesc       (dl1_rxclkesc),
                .dl1_rxlpdtesc      (dl1_rxlpdtesc),
                .dl1_rxulpsesc      (dl1_rxulpsesc),
                .dl1_rxtriggeresc   (dl1_rxtriggeresc),
                .dl1_rxdataesc      (dl1_rxdataesc),
                .dl1_rxvalidesc     (dl1_rxvalidesc),
                
                .dl1_errsoths       (dl1_errsoths),
                .dl1_errsotsynchs   (dl1_errsotsynchs),
                .dl1_erresc         (dl1_erresc),
                .dl1_errsyncesc     (dl1_errsyncesc),
                .dl1_errcontrol     (dl1_errcontrol),
                
                .clk_rxp            (cam_clk_p),
                .clk_rxn            (cam_clk_n),
                .data_rxp           (cam_data_p),
                .data_rxn           (cam_data_n)
           );
    
    wire        dphy_clk   = rxbyteclkhs;
    wire        dphy_reset = system_rst_out;
    

    
    // ----------------------------------------
    //  CSI-2
    // ----------------------------------------
    
                            wire            axi4s_cam_aresetn   /*verilator public_flat*/;
                            wire            axi4s_cam_aclk      /*verilator public_flat*/;
    (* mark_debug="true" *) wire    [0:0]   axi4s_csi2_tuser    /*verilator public_flat*/;
    (* mark_debug="true" *) wire            axi4s_csi2_tlast    /*verilator public_flat*/;
    (* mark_debug="true" *) wire    [9:0]   axi4s_csi2_tdata    /*verilator public_flat*/;
    (* mark_debug="true" *) wire            axi4s_csi2_tvalid   /*verilator public_flat*/;
    (* mark_debug="true" *) wire            axi4s_csi2_tready   /*verilator public_flat*/;

    wire    [0:0]   axi4s2_csi2_tuser    /*verilator public_flat*/;
    wire            axi4s2_csi2_tlast    /*verilator public_flat*/;
    wire    [9:0]   axi4s2_csi2_tdata    /*verilator public_flat*/;
    wire            axi4s2_csi2_tvalid   /*verilator public_flat*/;
    wire            axi4s2_csi2_tready   /*verilator public_flat*/;

    assign axi4s_cam_aresetn = ~sys_reset;
    assign axi4s_cam_aclk    = sys_clk200;

    wire            mipi_ecc_corrected;
    wire            mipi_ecc_error;
    wire            mipi_ecc_valid;
    wire            mipi_crc_error;
    wire            mipi_crc_valid;
    wire            mipi_packet_lost;
    wire            mipi_fifo_overflow;
    
    jelly_mipi_csi2_rx
            #(
                .LANES              (2),
                .DATA_WIDTH         (10),
                .M_FIFO_ASYNC       (1),
                .M_FIFO_PTR_WIDTH   (10)
            )
        i_mipi_csi2_rx
            (
                .aresetn            (~sys_reset),
                .aclk               (sys_clk250),
                
                .ecc_corrected      (mipi_ecc_corrected),
                .ecc_error          (mipi_ecc_error),
                .ecc_valid          (mipi_ecc_valid),
                .crc_error          (mipi_crc_error),
                .crc_valid          (mipi_crc_valid),
                .packet_lost        (mipi_packet_lost),
                .fifo_overflow      (mipi_fifo_overflow),
                
                .rxreseths          (dphy_reset),
                .rxbyteclkhs        (dphy_clk),
                .rxdatahs           ({dl1_rxdatahs,   dl0_rxdatahs  }),
                .rxvalidhs          ({dl1_rxvalidhs,  dl0_rxvalidhs }),
                .rxactivehs         ({dl1_rxactivehs, dl0_rxactivehs}),
                .rxsynchs           ({dl1_rxsynchs,   dl0_rxsynchs  }),
                
                .m_axi4s_aresetn    (axi4s_cam_aresetn),
                .m_axi4s_aclk       (axi4s_cam_aclk),
                .m_axi4s_tuser      (axi4s_csi2_tuser),
                .m_axi4s_tlast      (axi4s_csi2_tlast),
                .m_axi4s_tdata      (axi4s_csi2_tdata),
                .m_axi4s_tvalid     (axi4s_csi2_tvalid),
                .m_axi4s_tready     (1'b1)  // (axi4s_csi2_tready)
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
                .WB_ADR_WIDTH       (8),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                
                .TUSER_WIDTH        (1),
                .TDATA_WIDTH        (10),
                .X_WIDTH            (16),
                .Y_WIDTH            (16),
                .TIMER_WIDTH        (32),
                .S_SLAVE_REGS       (1),
                .S_MASTER_REGS      (1),
                .M_SLAVE_REGS       (1),
                .M_MASTER_REGS      (1),
                
                .INIT_CTL_CONTROL   (2'b00),
                .INIT_CTL_SKIP      (1),
                .INIT_PARAM_WIDTH   (X_NUM),
                .INIT_PARAM_HEIGHT  (Y_NUM),
                .INIT_PARAM_FILL    (10'd0),
                .INIT_PARAM_TIMEOUT (32'h00010000)
            )
        i_video_format_regularizer
            (
                .aresetn            (axi4s_cam_aresetn),
                .aclk               (axi4s_cam_aclk),
                .aclken             (1'b1),
                
                .s_wb_rst_i         (wb_peri_rst_i),
                .s_wb_clk_i         (wb_peri_clk_i),
                .s_wb_adr_i         (wb_peri_adr_i[7:0]),
                .s_wb_dat_o         (wb_fmtr_dat_o),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_fmtr_stb_i),
                .s_wb_ack_o         (wb_fmtr_ack_o),
                
                .s_axi4s_tuser      (axi4s_csi2_tuser),
                .s_axi4s_tlast      (axi4s_csi2_tlast),
                .s_axi4s_tdata      (axi4s_csi2_tdata),
                .s_axi4s_tvalid     (axi4s_csi2_tvalid),
                .s_axi4s_tready     (axi4s_csi2_tready),
                
                .m_axi4s_tuser      (axi4s_fmtr_tuser),
                .m_axi4s_tlast      (axi4s_fmtr_tlast),
                .m_axi4s_tdata      (axi4s_fmtr_tdata),
                .m_axi4s_tvalid     (axi4s_fmtr_tvalid),
                .m_axi4s_tready     (axi4s_fmtr_tready)
            );
    
    
    // 現像
    wire    [0:0]               axi4s_rgb_tuser;
    wire                        axi4s_rgb_tlast;
    wire    [39:0]              axi4s_rgb_tdata;
    wire                        axi4s_rgb_tvalid;
    wire                        axi4s_rgb_tready;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_rgb_dat_o;
    wire                        wb_rgb_stb_i;
    wire                        wb_rgb_ack_o;
    
    video_raw_to_rgb
            #(
                .WB_ADR_WIDTH       (10),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                
                .DATA_WIDTH         (10),
                
                .IMG_Y_NUM          (480),
                .IMG_Y_WIDTH        (12),
                
                .TUSER_WIDTH        (1)
            )
        i_video_raw_to_rgb
            (
                .aresetn            (axi4s_cam_aresetn),
                .aclk               (axi4s_cam_aclk),
                
                .in_update_req      (1'b1),
                
                .s_wb_rst_i         (wb_peri_rst_i),
                .s_wb_clk_i         (wb_peri_clk_i),
                .s_wb_adr_i         (wb_peri_adr_i[9:0]),
                .s_wb_dat_o         (wb_rgb_dat_o),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_rgb_stb_i),
                .s_wb_ack_o         (wb_rgb_ack_o),
                
                .s_axi4s_tuser      (axi4s_fmtr_tuser),
                .s_axi4s_tlast      (axi4s_fmtr_tlast),
                .s_axi4s_tdata      (axi4s_fmtr_tdata),
                .s_axi4s_tvalid     (axi4s_fmtr_tvalid),
                .s_axi4s_tready     (axi4s_fmtr_tready),
                
                .m_axi4s_tuser      (axi4s_rgb_tuser),
                .m_axi4s_tlast      (axi4s_rgb_tlast),
                .m_axi4s_tdata      (axi4s_rgb_tdata),
                .m_axi4s_tvalid     (axi4s_rgb_tvalid),
                .m_axi4s_tready     (axi4s_rgb_tready)
            );
    
    
    // DMA write
    wire    [WB_DAT_WIDTH-1:0]  wb_vdmaw_dat_o;
    wire                        wb_vdmaw_stb_i;
    wire                        wb_vdmaw_ack_o;
    
    jelly_vdma_axi4s_to_axi4
            #(
                .ASYNC              (1),
                .FIFO_PTR_WIDTH     (12),
                
                .PIXEL_SIZE         (2),    // 32bit
                .AXI4_ID_WIDTH      (AXI4_MEM0_ID_WIDTH),
                .AXI4_ADDR_WIDTH    (AXI4_MEM0_ADDR_WIDTH),
                .AXI4_DATA_SIZE     (AXI4_MEM0_DATA_SIZE),
                .AXI4S_DATA_SIZE    (2),    // 32bit
                .AXI4S_USER_WIDTH   (1),
                .INDEX_WIDTH        (8),
                .STRIDE_WIDTH       (16),
                .H_WIDTH            (14),
                .V_WIDTH            (14),
                .SIZE_WIDTH         (32),
                
                .WB_ADR_WIDTH       (8),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                .INIT_CTL_CONTROL   (2'b00),
                .INIT_PARAM_ADDR    (32'h3000_0000),
                .INIT_PARAM_STRIDE  (X_NUM*2),
                .INIT_PARAM_WIDTH   (X_NUM),
                .INIT_PARAM_HEIGHT  (Y_NUM),
                .INIT_PARAM_SIZE    (X_NUM*Y_NUM),
                .INIT_PARAM_AWLEN   (7)
            )
        i_vdma_axi4s_to_axi4
            (
                .m_axi4_aresetn     (axi4_mem_aresetn),
                .m_axi4_aclk        (axi4_mem_aclk),
                .m_axi4_awid        (axi4_mem0_awid),
                .m_axi4_awaddr      (axi4_mem0_awaddr),
                .m_axi4_awburst     (axi4_mem0_awburst),
                .m_axi4_awcache     (axi4_mem0_awcache),
                .m_axi4_awlen       (axi4_mem0_awlen),
                .m_axi4_awlock      (axi4_mem0_awlock),
                .m_axi4_awprot      (axi4_mem0_awprot),
                .m_axi4_awqos       (axi4_mem0_awqos),
                .m_axi4_awregion    (),
                .m_axi4_awsize      (axi4_mem0_awsize),
                .m_axi4_awvalid     (axi4_mem0_awvalid),
                .m_axi4_awready     (axi4_mem0_awready),
                .m_axi4_wstrb       (axi4_mem0_wstrb),
                .m_axi4_wdata       (axi4_mem0_wdata),
                .m_axi4_wlast       (axi4_mem0_wlast),
                .m_axi4_wvalid      (axi4_mem0_wvalid),
                .m_axi4_wready      (axi4_mem0_wready),
                .m_axi4_bid         (axi4_mem0_bid),
                .m_axi4_bresp       (axi4_mem0_bresp),
                .m_axi4_bvalid      (axi4_mem0_bvalid),
                .m_axi4_bready      (axi4_mem0_bready),
                
                .s_axi4s_aresetn    (axi4s_cam_aresetn),
                .s_axi4s_aclk       (axi4s_cam_aclk),
                .s_axi4s_tuser      (axi4s_rgb_tuser),
                .s_axi4s_tlast      (axi4s_rgb_tlast),
                .s_axi4s_tdata      ({
                                        axi4s_rgb_tdata[39:32],
                                        axi4s_rgb_tdata[29:22],
                                        axi4s_rgb_tdata[19:12],
                                        axi4s_rgb_tdata[ 9: 2]
                                    }),
                .s_axi4s_tvalid     (axi4s_rgb_tvalid),
                .s_axi4s_tready     (axi4s_rgb_tready),
                
                .s_wb_rst_i         (wb_peri_rst_i),
                .s_wb_clk_i         (wb_peri_clk_i),
                .s_wb_adr_i         (wb_peri_adr_i[7:0]),
                .s_wb_dat_o         (wb_vdmaw_dat_o),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_vdmaw_stb_i),
                .s_wb_ack_o         (wb_vdmaw_ack_o)
            );
        
    
    // read は未使用
    assign axi4_mem0_arid     = 0;
    assign axi4_mem0_araddr   = 0;
    assign axi4_mem0_arburst  = 0;
    assign axi4_mem0_arcache  = 0;
    assign axi4_mem0_arlen    = 0;
    assign axi4_mem0_arlock   = 0;
    assign axi4_mem0_arprot   = 0;
    assign axi4_mem0_arqos    = 0;
    assign axi4_mem0_arregion = 0;
    assign axi4_mem0_arsize   = 0;
    assign axi4_mem0_arvalid  = 0;
    assign axi4_mem0_rready   = 0;
    
    
    
    // ----------------------------------------
    //  WISHBONE address decoder
    // ----------------------------------------
    
    assign wb_gid_stb_i   = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h000);   // 0x80000000-0x8000ffff
    assign wb_fmtr_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h010);   // 0x80100000-0x8010ffff
    assign wb_rgb_stb_i   = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h012);   // 0x80120000-0x8012ffff
    assign wb_vdmaw_stb_i = wb_peri_stb_i & (wb_peri_adr_i[24:13] == 12'h021);   // 0x80210000-0x8021ffff
    
    assign wb_peri_dat_o  = wb_gid_stb_i   ? wb_gid_dat_o   :
                            wb_fmtr_stb_i  ? wb_fmtr_dat_o  :
                            wb_rgb_stb_i   ? wb_rgb_dat_o   :
                            wb_vdmaw_stb_i ? wb_vdmaw_dat_o :
                            {WB_DAT_WIDTH{1'b0}};
    
    assign wb_peri_ack_o  = wb_gid_stb_i   ? wb_gid_ack_o   :
                            wb_fmtr_stb_i  ? wb_fmtr_ack_o  :
                            wb_rgb_stb_i   ? wb_rgb_ack_o   :
                            wb_vdmaw_stb_i ? wb_vdmaw_ack_o :
                            wb_peri_stb_i;
    
    
    
    // ----------------------------------------
    //  Debug
    // ----------------------------------------
    
    reg     [31:0]      reg_counter_rxbyteclkhs;
    always @(posedge rxbyteclkhs)   reg_counter_rxbyteclkhs <= reg_counter_rxbyteclkhs + 1;
    
    reg     [31:0]      reg_counter_clk100;
    always @(posedge sys_clk100)    reg_counter_clk100 <= reg_counter_clk100 + 1;
    
    reg     [31:0]      reg_counter_clk200;
    always @(posedge sys_clk200)    reg_counter_clk200 <= reg_counter_clk200 + 1;
    
    reg     [31:0]      reg_counter_clk250;
    always @(posedge sys_clk250)    reg_counter_clk250 <= reg_counter_clk250 + 1;
    
    reg     frame_toggle = 0;
    always @(posedge axi4s_cam_aclk) begin
        if ( axi4s_csi2_tuser[0] && axi4s_csi2_tvalid && axi4s_csi2_tready ) begin
            frame_toggle <= ~frame_toggle;
        end
    end
    
    
    reg     [31:0]      reg_clk200_time;
    reg                 reg_clk200_led;
    always @(posedge sys_clk200) begin
        if ( sys_reset ) begin
            reg_clk200_time <= 0;
            reg_clk200_led  <= 0;
        end
        else begin
            reg_clk200_time <= reg_clk200_time + 1;
            if ( reg_clk200_time == 200000000-1 ) begin
                reg_clk200_time <= 0;
                reg_clk200_led  <= ~reg_clk200_led;
            end
        end
    end
    
    reg     [31:0]      reg_clk250_time;
    reg                 reg_clk250_led;
    always @(posedge sys_clk250) begin
        if ( sys_reset ) begin
            reg_clk250_time <= 0;
            reg_clk250_led  <= 0;
        end
        else begin
            reg_clk250_time <= reg_clk250_time + 1;
            if ( reg_clk250_time == 250000000-1 ) begin
                reg_clk250_time <= 0;
                reg_clk250_led  <= ~reg_clk250_led;
            end
        end
    end
    
    
    assign radio_led[1] = reg_clk200_led;
    assign radio_led[0] = reg_clk250_led;
    
//    assign radio_led[1] = reg_counter_clk100[24];
//    assign radio_led[0] = reg_counter_rxbyteclkhs[1];
    
    assign pmod0 = reg_counter_clk100[15:8];
    
    reg     [7:0]   reg_frame_count;
    always @(posedge axi4s_cam_aclk) begin
        if ( axi4s_csi2_tuser && axi4s_csi2_tvalid ) begin
            reg_frame_count <= reg_frame_count + 1;
        end
    end
    
    assign pmod1 = reg_frame_count;
    
    
    // Debug
    (* mark_debug = "true" *)   reg                 dbg_reset;
    (* mark_debug = "true" *)   reg     [7:0]       dbg0_rxdatahs;
    (* mark_debug = "true" *)   reg                 dbg0_rxvalidhs;
    (* mark_debug = "true" *)   reg                 dbg0_rxactivehs;
    (* mark_debug = "true" *)   reg                 dbg0_rxsynchs;
    (* mark_debug = "true" *)   reg     [7:0]       dbg1_rxdatahs;
    (* mark_debug = "true" *)   reg                 dbg1_rxvalidhs;
    (* mark_debug = "true" *)   reg                 dbg1_rxactivehs;
    (* mark_debug = "true" *)   reg                 dbg1_rxsynchs;
    always @(posedge dphy_clk) begin
        dbg_reset       <=  sys_reset | reg_sw_reset;
        dbg0_rxdatahs   <= dl0_rxdatahs;
        dbg0_rxvalidhs  <= dl0_rxvalidhs;
        dbg0_rxactivehs <= dl0_rxactivehs;
        dbg0_rxsynchs   <= dl0_rxsynchs;
        dbg1_rxdatahs   <= dl1_rxdatahs;
        dbg1_rxvalidhs  <= dl1_rxvalidhs;
        dbg1_rxactivehs <= dl1_rxactivehs;
        dbg1_rxsynchs   <= dl1_rxsynchs;
    end
        
endmodule


`default_nettype wire

