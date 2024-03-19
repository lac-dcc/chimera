
`timescale 1 ns / 1 ps
`default_nettype none

module design_1
        (
            output  wire            fan_en,

            output  wire            out_reset,
            output  wire            out_clk,
            
            output  wire    [39:0]  m_axi4l_peri_awaddr,
            output  wire    [2:0]   m_axi4l_peri_awprot,
            output  wire            m_axi4l_peri_awvalid,
            input   wire            m_axi4l_peri_awready,
            output  wire    [63:0]  m_axi4l_peri_wdata,
            output  wire    [7:0]   m_axi4l_peri_wstrb,
            output  wire            m_axi4l_peri_wvalid,
            input   wire            m_axi4l_peri_wready,
            input   wire    [1:0]   m_axi4l_peri_bresp,
            input   wire            m_axi4l_peri_bvalid,
            output  wire            m_axi4l_peri_bready,
            output  wire    [39:0]  m_axi4l_peri_araddr,
            output  wire    [2:0]   m_axi4l_peri_arprot,
            output  wire            m_axi4l_peri_arvalid,
            input   wire            m_axi4l_peri_arready,
            input   wire    [63:0]  m_axi4l_peri_rdata,
            input   wire    [1:0]   m_axi4l_peri_rresp,
            input   wire            m_axi4l_peri_rvalid,
            output  wire            m_axi4l_peri_rready
        );
    
    // トップから force する前提(verilatorも考慮)

    // CLK& reset
    reg     reset   /*verilator public_flat*/ ;
    reg     clk     /*verilator public_flat*/ ;
    
    // WISHBONE
    localparam  WB_ADR_WIDTH     = 37;
    localparam  WB_DAT_SIZE      = 3;   // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
    localparam  WB_DAT_WIDTH     = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH     = WB_DAT_WIDTH / 8;

    reg     [WB_ADR_WIDTH-1:0]      wb_adr_i /*verilator public_flat*/ ;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_o /*verilator public_flat*/ ;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_i /*verilator public_flat*/ ;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_i /*verilator public_flat*/ ;
    reg                             wb_we_i  /*verilator public_flat*/ ;
    reg                             wb_stb_i /*verilator public_flat*/ ;
    wire                            wb_ack_o /*verilator public_flat*/ ;

    assign out_reset = reset;
    assign out_clk   = clk;

    jelly_wishbone_to_axi4l
            #(
                .WB_ADR_WIDTH       (WB_ADR_WIDTH),
                .WB_DAT_SIZE        (WB_DAT_SIZE),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH)
            )
        i_wishbone_to_axi4l
            (
                .s_wb_rst_i          (reset),
                .s_wb_clk_i          (clk),
                .s_wb_adr_i          (wb_adr_i),
                .s_wb_dat_o          (wb_dat_o),
                .s_wb_dat_i          (wb_dat_i),
                .s_wb_sel_i          (wb_sel_i),
                .s_wb_we_i           (wb_we_i),
                .s_wb_stb_i          (wb_stb_i),
                .s_wb_ack_o          (wb_ack_o),
                
                .m_axi4l_aresetn     (),
                .m_axi4l_aclk        (),
                .m_axi4l_awaddr      (m_axi4l_peri_awaddr),
                .m_axi4l_awprot      (m_axi4l_peri_awprot),
                .m_axi4l_awvalid     (m_axi4l_peri_awvalid),
                .m_axi4l_awready     (m_axi4l_peri_awready),
                .m_axi4l_wstrb       (m_axi4l_peri_wstrb),
                .m_axi4l_wdata       (m_axi4l_peri_wdata),
                .m_axi4l_wvalid      (m_axi4l_peri_wvalid),
                .m_axi4l_wready      (m_axi4l_peri_wready),
                .m_axi4l_bresp       (m_axi4l_peri_bresp),
                .m_axi4l_bvalid      (m_axi4l_peri_bvalid),
                .m_axi4l_bready      (m_axi4l_peri_bready),
                .m_axi4l_araddr      (m_axi4l_peri_araddr),
                .m_axi4l_arprot      (m_axi4l_peri_arprot),
                .m_axi4l_arvalid     (m_axi4l_peri_arvalid),
                .m_axi4l_arready     (m_axi4l_peri_arready),
                .m_axi4l_rdata       (m_axi4l_peri_rdata),
                .m_axi4l_rresp       (m_axi4l_peri_rresp),
                .m_axi4l_rvalid      (m_axi4l_peri_rvalid),
                .m_axi4l_rready      (m_axi4l_peri_rready)
            );
            
endmodule

`default_nettype wire
