module zynq_loopback_wrapper #(
  parameter READ_ADDR_BASE_0   = 32'h1fd00000,
  parameter WRITE_ADDR_BASE_0  = 32'h1fd80000,
  parameter TYPE               = "LOOPBACK"
)
(
  inout wire [14:0]   DDR_addr,
  inout wire [2:0]    DDR_ba,
  inout wire          DDR_cas_n,
  inout wire          DDR_ck_n,
  inout wire          DDR_ck_p,
  inout wire          DDR_cke,
  inout wire          DDR_cs_n,
  inout wire [3:0]    DDR_dm,
  inout wire [31:0]   DDR_dq,
  inout wire [3:0]    DDR_dqs_n,
  inout wire [3:0]    DDR_dqs_p,
  inout wire          DDR_odt,
  inout wire          DDR_ras_n,
  inout wire          DDR_reset_n,
  inout wire          DDR_we_n,
  inout wire          FIXED_IO_ddr_vrn,
  inout wire          FIXED_IO_ddr_vrp,
  inout wire [53:0]   FIXED_IO_mio,
  inout wire          FIXED_IO_ps_clk,
  inout wire          FIXED_IO_ps_porb,
  inout wire          FIXED_IO_ps_srstb
);


  localparam integer  C_S_AXI_DATA_WIDTH    = 32;
  localparam integer  C_S_AXI_ADDR_WIDTH    = 32;
  localparam integer  C_M_AXI_DATA_WIDTH    = 64;
  localparam integer  C_M_AXI_ADDR_WIDTH    = 32;

  wire                clk;
  wire                resetn;

  wire [31:0]         M_AXI_GP0_awaddr;
  wire [2:0]          M_AXI_GP0_awprot;
  wire                M_AXI_GP0_awready;
  wire                M_AXI_GP0_awvalid;
  wire [31:0]         M_AXI_GP0_wdata;
  wire [3:0]          M_AXI_GP0_wstrb;
  wire                M_AXI_GP0_wvalid;
  wire                M_AXI_GP0_wready;
  wire [1:0]          M_AXI_GP0_bresp;
  wire                M_AXI_GP0_bvalid;
  wire                M_AXI_GP0_bready;
  wire [31:0]         M_AXI_GP0_araddr;
  wire [2:0]          M_AXI_GP0_arprot;
  wire                M_AXI_GP0_arvalid;
  wire                M_AXI_GP0_arready;
  wire [31:0]         M_AXI_GP0_rdata;
  wire [1:0]          M_AXI_GP0_rresp;
  wire                M_AXI_GP0_rvalid;
  wire                M_AXI_GP0_rready;

  wire [31:0]         S_AXI_HP0_araddr;
  wire [1:0]          S_AXI_HP0_arburst;
  wire [3:0]          S_AXI_HP0_arcache;
  wire [5:0]          S_AXI_HP0_arid;
  wire [3:0]          S_AXI_HP0_arlen;
  wire [1:0]          S_AXI_HP0_arlock;
  wire [2:0]          S_AXI_HP0_arprot;
  wire [3:0]          S_AXI_HP0_arqos;
  wire                S_AXI_HP0_arready;
  wire [2:0]          S_AXI_HP0_arsize;
  wire                S_AXI_HP0_arvalid;
  wire [31:0]         S_AXI_HP0_awaddr;
  wire [1:0]          S_AXI_HP0_awburst;
  wire [3:0]          S_AXI_HP0_awcache;
  wire [5:0]          S_AXI_HP0_awid;
  wire [3:0]          S_AXI_HP0_awlen;
  wire [1:0]          S_AXI_HP0_awlock;
  wire [2:0]          S_AXI_HP0_awprot;
  wire [3:0]          S_AXI_HP0_awqos;
  wire                S_AXI_HP0_awready;
  wire [2:0]          S_AXI_HP0_awsize;
  wire                S_AXI_HP0_awvalid;
  wire [5:0]          S_AXI_HP0_bid;
  wire                S_AXI_HP0_bready;
  wire [1:0]          S_AXI_HP0_bresp;
  wire                S_AXI_HP0_bvalid;
  wire [63:0]         S_AXI_HP0_rdata;
  wire [5:0]          S_AXI_HP0_rid;
  wire                S_AXI_HP0_rlast;
  wire                S_AXI_HP0_rready;
  wire [1:0]          S_AXI_HP0_rresp;
  wire                S_AXI_HP0_rvalid;
  wire [63:0]         S_AXI_HP0_wdata;
  wire [5:0]          S_AXI_HP0_wid;
  wire                S_AXI_HP0_wlast;
  wire                S_AXI_HP0_wready;
  wire [7:0]          S_AXI_HP0_wstrb;
  wire                S_AXI_HP0_wvalid;

  wire                                outBuf_empty;
  wire                                outBuf_pop;
  wire                                outBuf_full;
  wire                                outBuf_push;
  wire [FIFO_ADDR_WIDTH:0]            outBuf_count;
  wire [C_M_AXI_DATA_WIDTH-1:0]       data_to_outBuf;
  wire [C_M_AXI_DATA_WIDTH-1:0]       data_from_outBuf;

  //Inbuf Read
  wire                                inbuf_empty;
  wire                                inbuf_read_ready;
  wire                                inbuf_read;
  wire [C_M_AXI_DATA_WIDTH-1:0]       inbuf_read_data;
  //Inbuf Write
  wire                                inbuf_full;
  wire                                inbuf_write_ready;
  wire                                inbuf_write;
  wire [C_M_AXI_DATA_WIDTH-1:0]       inbuf_write_data;
  wire [FIFO_ADDR_WIDTH:0]            inbuf_count;

  localparam integer FIFO_ADDR_WIDTH = 4;


  wire tx_req;
  wire tx_done;


  zc702 zynq_i (
    .DDR_addr               ( DDR_addr            ),
    .DDR_ba                 ( DDR_ba              ),
    .DDR_cas_n              ( DDR_cas_n           ),
    .DDR_ck_n               ( DDR_ck_n            ),
    .DDR_ck_p               ( DDR_ck_p            ),
    .DDR_cke                ( DDR_cke             ),
    .DDR_cs_n               ( DDR_cs_n            ),
    .DDR_dm                 ( DDR_dm              ),
    .DDR_dq                 ( DDR_dq              ),
    .DDR_dqs_n              ( DDR_dqs_n           ),
    .DDR_dqs_p              ( DDR_dqs_p           ),
    .DDR_odt                ( DDR_odt             ),
    .DDR_ras_n              ( DDR_ras_n           ),
    .DDR_reset_n            ( DDR_reset_n         ),
    .DDR_we_n               ( DDR_we_n            ),

    .FIXED_IO_ddr_vrn       ( FIXED_IO_ddr_vrn    ),
    .FIXED_IO_ddr_vrp       ( FIXED_IO_ddr_vrp    ),
    .FIXED_IO_mio           ( FIXED_IO_mio        ),
    .FIXED_IO_ps_clk        ( FIXED_IO_ps_clk     ),
    .FIXED_IO_ps_porb       ( FIXED_IO_ps_porb    ),
    .FIXED_IO_ps_srstb      ( FIXED_IO_ps_srstb   ),

    .FCLK_CLK0              ( clk           ),
    .FCLK_RESET0_N          ( resetn       ),

    .M_AXI_GP0_awaddr       ( M_AXI_GP0_awaddr    ),
    .M_AXI_GP0_awprot       ( M_AXI_GP0_awprot    ),
    .M_AXI_GP0_awready      ( M_AXI_GP0_awready   ),
    .M_AXI_GP0_awvalid      ( M_AXI_GP0_awvalid   ),
    .M_AXI_GP0_araddr       ( M_AXI_GP0_araddr    ),
    .M_AXI_GP0_arprot       ( M_AXI_GP0_arprot    ),
    .M_AXI_GP0_arready      ( M_AXI_GP0_arready   ),
    .M_AXI_GP0_arvalid      ( M_AXI_GP0_arvalid   ),
    .M_AXI_GP0_bready       ( M_AXI_GP0_bready    ),
    .M_AXI_GP0_bresp        ( M_AXI_GP0_bresp     ),
    .M_AXI_GP0_bvalid       ( M_AXI_GP0_bvalid    ),
    .M_AXI_GP0_rdata        ( M_AXI_GP0_rdata     ),
    .M_AXI_GP0_rready       ( M_AXI_GP0_rready    ),
    .M_AXI_GP0_rresp        ( M_AXI_GP0_rresp     ),
    .M_AXI_GP0_rvalid       ( M_AXI_GP0_rvalid    ),
    .M_AXI_GP0_wdata        ( M_AXI_GP0_wdata     ),
    .M_AXI_GP0_wready       ( M_AXI_GP0_wready    ),
    .M_AXI_GP0_wstrb        ( M_AXI_GP0_wstrb     ),
    .M_AXI_GP0_wvalid       ( M_AXI_GP0_wvalid    ),

    .S_AXI_HP0_araddr       ( S_AXI_HP0_araddr    ),
    .S_AXI_HP0_arburst      ( S_AXI_HP0_arburst   ),
    .S_AXI_HP0_arcache      ( S_AXI_HP0_arcache   ),
    .S_AXI_HP0_arid         ( S_AXI_HP0_arid      ),
    .S_AXI_HP0_arlen        ( S_AXI_HP0_arlen     ),
    .S_AXI_HP0_arlock       ( S_AXI_HP0_arlock    ),
    .S_AXI_HP0_arprot       ( S_AXI_HP0_arprot    ),
    .S_AXI_HP0_arqos        ( S_AXI_HP0_arqos     ),
    .S_AXI_HP0_arready      ( S_AXI_HP0_arready   ),
    .S_AXI_HP0_arsize       ( S_AXI_HP0_arsize    ),
    .S_AXI_HP0_arvalid      ( S_AXI_HP0_arvalid   ),
    .S_AXI_HP0_awaddr       ( S_AXI_HP0_awaddr    ),
    .S_AXI_HP0_awburst      ( S_AXI_HP0_awburst   ),
    .S_AXI_HP0_awcache      ( S_AXI_HP0_awcache   ),
    .S_AXI_HP0_awid         ( S_AXI_HP0_awid      ),
    .S_AXI_HP0_awlen        ( S_AXI_HP0_awlen     ),
    .S_AXI_HP0_awlock       ( S_AXI_HP0_awlock    ),
    .S_AXI_HP0_awprot       ( S_AXI_HP0_awprot    ),
    .S_AXI_HP0_awqos        ( S_AXI_HP0_awqos     ),
    .S_AXI_HP0_awready      ( S_AXI_HP0_awready   ),
    .S_AXI_HP0_awsize       ( S_AXI_HP0_awsize    ),
    .S_AXI_HP0_awvalid      ( S_AXI_HP0_awvalid   ),
    .S_AXI_HP0_bid          ( S_AXI_HP0_bid       ),
    .S_AXI_HP0_bready       ( S_AXI_HP0_bready    ),
    .S_AXI_HP0_bresp        ( S_AXI_HP0_bresp     ),
    .S_AXI_HP0_bvalid       ( S_AXI_HP0_bvalid    ),
    .S_AXI_HP0_rdata        ( S_AXI_HP0_rdata     ),
    .S_AXI_HP0_rid          ( S_AXI_HP0_rid       ),
    .S_AXI_HP0_rlast        ( S_AXI_HP0_rlast     ),
    .S_AXI_HP0_rready       ( S_AXI_HP0_rready    ),
    .S_AXI_HP0_rresp        ( S_AXI_HP0_rresp     ),
    .S_AXI_HP0_rvalid       ( S_AXI_HP0_rvalid    ),
    .S_AXI_HP0_wdata        ( S_AXI_HP0_wdata     ),
    .S_AXI_HP0_wid          ( S_AXI_HP0_wid       ),
    .S_AXI_HP0_wlast        ( S_AXI_HP0_wlast     ),
    .S_AXI_HP0_wready       ( S_AXI_HP0_wready    ),
    .S_AXI_HP0_wstrb        ( S_AXI_HP0_wstrb     ),
    .S_AXI_HP0_wvalid       ( S_AXI_HP0_wvalid    )
  );


//--------------------------------------------------------------
  loopback #(
    .READ_ADDR_BASE_0   ( READ_ADDR_BASE_0    ),
    .WRITE_ADDR_BASE_0  ( WRITE_ADDR_BASE_0   )
  ) loopback_dut (
    .clk                ( clk                 ),
    .resetn             ( resetn              ),
    .M_AXI_GP0_awaddr   ( M_AXI_GP0_awaddr    ),
    .M_AXI_GP0_awprot   ( M_AXI_GP0_awprot    ),
    .M_AXI_GP0_awvalid  ( M_AXI_GP0_awvalid   ),
    .M_AXI_GP0_awready  ( M_AXI_GP0_awready   ),
    .M_AXI_GP0_wdata    ( M_AXI_GP0_wdata     ),
    .M_AXI_GP0_wstrb    ( M_AXI_GP0_wstrb     ),
    .M_AXI_GP0_wvalid   ( M_AXI_GP0_wvalid    ),
    .M_AXI_GP0_wready   ( M_AXI_GP0_wready    ),
    .M_AXI_GP0_bresp    ( M_AXI_GP0_bresp     ),
    .M_AXI_GP0_bvalid   ( M_AXI_GP0_bvalid    ),
    .M_AXI_GP0_bready   ( M_AXI_GP0_bready    ),
    .M_AXI_GP0_araddr   ( M_AXI_GP0_araddr    ),
    .M_AXI_GP0_arprot   ( M_AXI_GP0_arprot    ),
    .M_AXI_GP0_arvalid  ( M_AXI_GP0_arvalid   ),
    .M_AXI_GP0_arready  ( M_AXI_GP0_arready   ),
    .M_AXI_GP0_rdata    ( M_AXI_GP0_rdata     ),
    .M_AXI_GP0_rresp    ( M_AXI_GP0_rresp     ),
    .M_AXI_GP0_rvalid   ( M_AXI_GP0_rvalid    ),
    .M_AXI_GP0_rready   ( M_AXI_GP0_rready    ),
    .S_AXI_HP0_araddr   ( S_AXI_HP0_araddr    ),
    .S_AXI_HP0_arburst  ( S_AXI_HP0_arburst   ),
    .S_AXI_HP0_arcache  ( S_AXI_HP0_arcache   ),
    .S_AXI_HP0_arid     ( S_AXI_HP0_arid      ),
    .S_AXI_HP0_arlen    ( S_AXI_HP0_arlen     ),
    .S_AXI_HP0_arlock   ( S_AXI_HP0_arlock    ),
    .S_AXI_HP0_arprot   ( S_AXI_HP0_arprot    ),
    .S_AXI_HP0_arqos    ( S_AXI_HP0_arqos     ),
    .S_AXI_HP0_arready  ( S_AXI_HP0_arready   ),
    .S_AXI_HP0_arsize   ( S_AXI_HP0_arsize    ),
    .S_AXI_HP0_arvalid  ( S_AXI_HP0_arvalid   ),
    .S_AXI_HP0_awaddr   ( S_AXI_HP0_awaddr    ),
    .S_AXI_HP0_awburst  ( S_AXI_HP0_awburst   ),
    .S_AXI_HP0_awcache  ( S_AXI_HP0_awcache   ),
    .S_AXI_HP0_awid     ( S_AXI_HP0_awid      ),
    .S_AXI_HP0_awlen    ( S_AXI_HP0_awlen     ),
    .S_AXI_HP0_awlock   ( S_AXI_HP0_awlock    ),
    .S_AXI_HP0_awprot   ( S_AXI_HP0_awprot    ),
    .S_AXI_HP0_awqos    ( S_AXI_HP0_awqos     ),
    .S_AXI_HP0_awready  ( S_AXI_HP0_awready   ),
    .S_AXI_HP0_awsize   ( S_AXI_HP0_awsize    ),
    .S_AXI_HP0_awvalid  ( S_AXI_HP0_awvalid   ),
    .S_AXI_HP0_bid      ( S_AXI_HP0_bid       ),
    .S_AXI_HP0_bready   ( S_AXI_HP0_bready    ),
    .S_AXI_HP0_bresp    ( S_AXI_HP0_bresp     ),
    .S_AXI_HP0_bvalid   ( S_AXI_HP0_bvalid    ),
    .S_AXI_HP0_rdata    ( S_AXI_HP0_rdata     ),
    .S_AXI_HP0_rid      ( S_AXI_HP0_rid       ),
    .S_AXI_HP0_rlast    ( S_AXI_HP0_rlast     ),
    .S_AXI_HP0_rready   ( S_AXI_HP0_rready    ),
    .S_AXI_HP0_rresp    ( S_AXI_HP0_rresp     ),
    .S_AXI_HP0_rvalid   ( S_AXI_HP0_rvalid    ),
    .S_AXI_HP0_wdata    ( S_AXI_HP0_wdata     ),
    .S_AXI_HP0_wid      ( S_AXI_HP0_wid       ),
    .S_AXI_HP0_wlast    ( S_AXI_HP0_wlast     ),
    .S_AXI_HP0_wready   ( S_AXI_HP0_wready    ),
    .S_AXI_HP0_wstrb    ( S_AXI_HP0_wstrb     ),
    .S_AXI_HP0_wvalid   ( S_AXI_HP0_wvalid    )
  );
//--------------------------------------------------------------

endmodule
