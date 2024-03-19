
`timescale 1ns / 1ps
`default_nettype none


module tb_sim_main
        #(
            parameter WB_ADR_WIDTH = 30,
            parameter WB_DAT_SIZE  = 2,
            parameter WB_DAT_WIDTH = (8 << WB_DAT_SIZE),
            parameter WB_SEL_WIDTH = WB_DAT_WIDTH / 8
        )
        (
            input   wire                        s_wb_rst_i,
            input   wire                        s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_we_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o
        );
    
    parameter   AXI4L_ADDR_WIDTH = WB_ADR_WIDTH + WB_DAT_SIZE;
    parameter   AXI4L_DATA_SIZE  = WB_DAT_SIZE;
    parameter   AXI4L_DATA_WIDTH = WB_DAT_WIDTH;
    parameter   AXI4L_STRB_WIDTH = WB_SEL_WIDTH;

    wire                            axi4l_aresetn;
    wire                            axi4l_aclk;
    wire    [AXI4L_ADDR_WIDTH-1:0]  axi4l_awaddr;
    wire    [2:0]                   axi4l_awprot;
    wire                            axi4l_awvalid;
    wire                            axi4l_awready;
    wire    [AXI4L_STRB_WIDTH-1:0]  axi4l_wstrb;
    wire    [AXI4L_DATA_WIDTH-1:0]  axi4l_wdata;
    wire                            axi4l_wvalid;
    wire                            axi4l_wready;
    wire    [1:0]                   axi4l_bresp;
    wire                            axi4l_bvalid;
    wire                            axi4l_bready;
    wire    [AXI4L_ADDR_WIDTH-1:0]  axi4l_araddr;
    wire    [2:0]                   axi4l_arprot;
    wire                            axi4l_arvalid;
    wire                            axi4l_arready;
    wire    [AXI4L_DATA_WIDTH-1:0]  axi4l_rdata;
    wire    [1:0]                   axi4l_rresp;
    wire                            axi4l_rvalid;
    wire                            axi4l_rready;
    

    // WISHBONE => AXI4Lite converter
    jelly_wishbone_to_axi4l
            #(
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_SIZE            (WB_DAT_SIZE),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                .AXI4L_ADDR_WIDTH       (AXI4L_ADDR_WIDTH),
                .AXI4L_DATA_WIDTH       (AXI4L_DATA_WIDTH),
                .AXI4L_STRB_WIDTH       (AXI4L_STRB_WIDTH)
            )
        i_jelly_wishbone_to_axi4l
            (
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i),
                .s_wb_dat_o             (s_wb_dat_o),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_we_i              (s_wb_we_i ),
                .s_wb_stb_i             (s_wb_stb_i),
                .s_wb_ack_o             (s_wb_ack_o),
                
                .m_axi4l_aresetn        (axi4l_aresetn),
                .m_axi4l_aclk           (axi4l_aclk),
                .m_axi4l_awaddr         (axi4l_awaddr),
                .m_axi4l_awprot         (axi4l_awprot ),
                .m_axi4l_awvalid        (axi4l_awvalid),
                .m_axi4l_awready        (axi4l_awready),
                .m_axi4l_wstrb          (axi4l_wstrb),
                .m_axi4l_wdata          (axi4l_wdata),
                .m_axi4l_wvalid         (axi4l_wvalid),
                .m_axi4l_wready         (axi4l_wready),
                .m_axi4l_bresp          (axi4l_bresp),
                .m_axi4l_bvalid         (axi4l_bvalid),
                .m_axi4l_bready         (axi4l_bready),
                .m_axi4l_araddr         (axi4l_araddr),
                .m_axi4l_arprot         (axi4l_arprot),
                .m_axi4l_arvalid        (axi4l_arvalid),
                .m_axi4l_arready        (axi4l_arready),
                .m_axi4l_rdata          (axi4l_rdata),
                .m_axi4l_rresp          (axi4l_rresp),
                .m_axi4l_rvalid         (axi4l_rvalid),
                .m_axi4l_rready         (axi4l_rready)
            );


    wire                            m_wb_rst_o;
    wire                            m_wb_clk_o;
    wire    [WB_ADR_WIDTH-1:0]      m_wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      m_wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]      m_wb_dat_i;
    wire                            m_wb_we_o;
    wire    [WB_SEL_WIDTH-1:0]      m_wb_sel_o;
    wire                            m_wb_stb_o;
    wire                            m_wb_ack_i;
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH       (AXI4L_ADDR_WIDTH),
                .AXI4L_DATA_SIZE        (AXI4L_DATA_SIZE),
                .AXI4L_DATA_WIDTH       (AXI4L_DATA_WIDTH),
                .AXI4L_STRB_WIDTH       (AXI4L_STRB_WIDTH),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH)
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn        (axi4l_aresetn),
                .s_axi4l_aclk           (axi4l_aclk),
                .s_axi4l_awaddr         (axi4l_awaddr),
                .s_axi4l_awprot         (axi4l_awprot ),
                .s_axi4l_awvalid        (axi4l_awvalid),
                .s_axi4l_awready        (axi4l_awready),
                .s_axi4l_wstrb          (axi4l_wstrb),
                .s_axi4l_wdata          (axi4l_wdata),
                .s_axi4l_wvalid         (axi4l_wvalid),
                .s_axi4l_wready         (axi4l_wready),
                .s_axi4l_bresp          (axi4l_bresp),
                .s_axi4l_bvalid         (axi4l_bvalid),
                .s_axi4l_bready         (axi4l_bready),
                .s_axi4l_araddr         (axi4l_araddr),
                .s_axi4l_arprot         (axi4l_arprot),
                .s_axi4l_arvalid        (axi4l_arvalid),
                .s_axi4l_arready        (axi4l_arready),
                .s_axi4l_rdata          (axi4l_rdata),
                .s_axi4l_rresp          (axi4l_rresp),
                .s_axi4l_rvalid         (axi4l_rvalid),
                .s_axi4l_rready         (axi4l_rready),
            
                .m_wb_rst_o             (m_wb_rst_o),
                .m_wb_clk_o             (m_wb_clk_o),
                .m_wb_adr_o             (m_wb_adr_o),
                .m_wb_dat_o             (m_wb_dat_o),
                .m_wb_dat_i             (m_wb_dat_i),
                .m_wb_we_o              (m_wb_we_o),
                .m_wb_sel_o             (m_wb_sel_o),
                .m_wb_stb_o             (m_wb_stb_o),
                .m_wb_ack_i             (m_wb_ack_i)
            );
    
    assign m_wb_ack_i = m_wb_stb_o;
    assign m_wb_dat_i = m_wb_adr_o + 1;

endmodule


`default_nettype wire


// end of file
