module mycpu_top
(
    input  wire [ 5:0] int,
    input  wire        aclk,
    input  wire        aresetn,
    output wire [ 3:0] arid,
    output wire [31:0] araddr,
    output wire [ 3:0] arlen,
    output wire [ 2:0] arsize,
    output wire [ 1:0] arburst,
    output wire [ 1:0] arlock,
    output wire [ 3:0] arcache,
    output wire [ 2:0] arprot,
    output wire        arvalid,
    input  wire        arready,
    input  wire [ 3:0] rid,
    input  wire [31:0] rdata,
    input  wire [ 1:0] rresp,
    input  wire        rlast,
    input  wire        rvalid,
    output wire        rready,
    output wire [ 3:0] awid,
    output wire [31:0] awaddr,
    output wire [ 3:0] awlen,
    output wire [ 2:0] awsize,
    output wire [ 1:0] awburst,
    output wire [ 1:0] awlock,
    output wire [ 3:0] awcache,
    output wire [ 2:0] awprot,
    output wire        awvalid,
    input  wire        awready,
    output wire [ 3:0] wid,
    output wire [31:0] wdata,
    output wire [ 3:0] wstrb,
    output wire        wlast,
    output wire        wvalid,
    input  wire        wready,
    input  wire [ 3:0] bid,
    input  wire [ 1:0] bresp,
    input  wire        bvalid,
    output wire        bready,
    
    output wire [31:0] debug_wb_pc,
    output wire [ 3:0] debug_wb_rf_wen,
    output wire [ 4:0] debug_wb_rf_wnum,
    output wire [31:0] debug_wb_rf_wdata
);

    MangoMIPS_Top mangomips32 (
        .cpu_clk        ( aclk      ),
        .cpu_rstn       ( aresetn   ),
        .intr           ( int       ),

        .m_axi_arid     ( arid      ),
        .m_axi_araddr   ( araddr    ),
        .m_axi_arlen    ( arlen     ),
        .m_axi_arsize   ( arsize    ),
        .m_axi_arburst  ( arburst   ),
        .m_axi_arlock   ( arlock    ),
        .m_axi_arcache  ( arcache   ),
        .m_axi_arprot   ( arprot    ),
        .m_axi_arvalid  ( arvalid   ),
        .m_axi_arready  ( arready   ),
        .m_axi_rid      ( rid       ),
        .m_axi_rdata    ( rdata     ),
        .m_axi_rresp    ( rresp     ),
        .m_axi_rlast    ( rlast     ),
        .m_axi_rvalid   ( rvalid    ),
        .m_axi_rready   ( rready    ),
        .m_axi_awid     ( awid      ),
        .m_axi_awaddr   ( awaddr    ),
        .m_axi_awlen    ( awlen     ),
        .m_axi_awsize   ( awsize    ),
        .m_axi_awburst  ( awburst   ),
        .m_axi_awlock   ( awlock    ),
        .m_axi_awcache  ( awcache   ),
        .m_axi_awprot   ( awprot    ),
        .m_axi_awvalid  ( awvalid   ),
        .m_axi_awready  ( awready   ),
        .m_axi_wid      ( wid       ),
        .m_axi_wdata    ( wdata     ),
        .m_axi_wstrb    ( wstrb     ),
        .m_axi_wlast    ( wlast     ),
        .m_axi_wvalid   ( wvalid    ),
        .m_axi_wready   ( wready    ),
        .m_axi_bid      ( bid       ),
        .m_axi_bresp    ( bresp     ),
        .m_axi_bvalid   ( bvalid    ),
        .m_axi_bready   ( bready    )

        // .debug_wb_pc     ( debug_wb_pc       ),
        // .debug_wb_wreg   ( debug_wb_rf_wen   ),
        // .debug_wb_wraddr ( debug_wb_rf_wnum  ),
        // .debug_wb_wrdata ( debug_wb_rf_wdata )

    );

    assign debug_wb_pc       = mangomips32.mips_core.wb_pc;
    assign debug_wb_rf_wen   = mangomips32.mips_core.wb_wreg;
    assign debug_wb_rf_wnum  = mangomips32.mips_core.wb_wraddr;
    assign debug_wb_rf_wdata = mangomips32.mips_core.wb_wrdata;

endmodule