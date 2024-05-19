// This program was cloned from: https://github.com/stanford-ppl/spatial-lang
// License: MIT License

module Arria10_tb;
  reg clk;                    // in
  reg reset;                  // in

  // For S_AVALON
  reg [6:0] addr;             // in
  wire [31:0] readdata;       // out
  reg [31:0] writedata;      // in
  wire io_rdata;
  reg chipselect;             // in
  reg write;                  // in
  reg read;                   // in


  // For M_AXI
  // AW
  wire [5:0]  awid;           // out
  wire [31:0] awuser;         // out
  wire [31:0] awaddr;         // out
  wire [7:0]  awlen;          // out
  wire [2:0]  awsize;         // out
  wire [1:0]  awburst;        // out
  wire        awlock;         // out
  wire [3:0]  awcache;        // out
  wire [2:0]  awprot;         // out
  wire [3:0]  awqos;          // out
  wire        awvalid;        // out
  reg         awready;        // in

  // AR
  wire [5:0]    arid;           // out
  wire [31:0]   aruser;         // out
  wire [31:0]   araddr;         // out
  wire [7:0]    arlen;          // out
  wire [2:0]    arsize;         // out
  wire [1:0]    arburst;        // out
  wire          arlock;         // out
  wire [3:0]    arcache;        // out
  wire [2:0]    arprot;         // out
  wire [3:0]    arqos;          // out
  wire          arvalid;        // out
  reg           arready;        // in

  // W
  wire [511:0]  wdata;        // out
  wire [63:0]   wtrb;         // out
  wire          wlast;        // out
  wire          wvalid;       // out
  reg           wready;       // in

  // R
  reg [5:0]     rid;          // in
  reg [31:0]    ruser;        // in
  reg [511:0]   rdata;        // in
  reg [1:0]     rresp;        // in
  reg           rlast;        // in
  reg           rvalid;       // in
  wire          rready;       // out

  // B
  reg [5:0]     bid;          // in
  reg [31:0]    buser;        // in
  reg [1:0]     bresp;        // in
  reg           bvalid;       // in
  wire          bready;       // out

  Top_DUT top0 (.clock (clk),
                .reset (reset),
                .io_raddr (clk),
                .io_wen (write),
                .io_waddr (clk),
                .io_rdata (io_rdata),
                .io_S_AVALON_readdata (readdata),
                .io_S_AVALON_address (addr),
                .io_S_AVALON_chipselect (chipselect),
                .io_S_AVALON_write (write),
                .io_S_AVALON_read (read),
                .io_S_AVALON_writedata (writedata),
                .io_M_AXI_0_AWID (awid),
                .io_M_AXI_0_AWUSER (awuser),
                .io_M_AXI_0_AWADDR (awaddr),
                .io_M_AXI_0_AWLEN (awlen),
                .io_M_AXI_0_AWSIZE (awsize),
                .io_M_AXI_0_AWBURST (awburst),
                .io_M_AXI_0_AWLOCK (awlock),
                .io_M_AXI_0_AWCACHE (awcache),
                .io_M_AXI_0_AWPROT (awprot),
                .io_M_AXI_0_AWQOS (awqos),
                .io_M_AXI_0_AWVALID (awvalid),
                .io_M_AXI_0_AWREADY (awready),
                .io_M_AXI_0_ARID (arid),
                .io_M_AXI_0_ARUSER (aruser),
                .io_M_AXI_0_ARADDR (araddr),
                .io_M_AXI_0_ARLEN (arlen),
                .io_M_AXI_0_ARSIZE (arsize),
                .io_M_AXI_0_ARBURST (arburst),
                .io_M_AXI_0_ARLOCK (arlock),
                .io_M_AXI_0_ARCACHE (arcache),
                .io_M_AXI_0_ARPROT (arprot),
                .io_M_AXI_0_ARQOS (arqos),
                .io_M_AXI_0_ARVALID (arvalid),
                .io_M_AXI_0_ARREADY (arready),
                .io_M_AXI_0_WDATA (wdata),
                .io_M_AXI_0_WSTRB (wtrb),
                .io_M_AXI_0_WLAST (wlast),
                .io_M_AXI_0_WVALID (wvalid),
                .io_M_AXI_0_WREADY (wready),
                .io_M_AXI_0_RID (rid),
                .io_M_AXI_0_RUSER (ruser),
                .io_M_AXI_0_RDATA (rdata),
                .io_M_AXI_0_RRESP (rresp),
                .io_M_AXI_0_RLAST (rlast),
                .io_M_AXI_0_RVALID (rvalid),
                .io_M_AXI_0_RREADY (rready),
                .io_M_AXI_0_BID (bid),
                .io_M_AXI_0_BUSER (buser),
                .io_M_AXI_0_BRESP (bresp),
                .io_M_AXI_0_BVALID (bvalid),
                .io_M_AXI_0_BREADY (bready));

  initial
  begin
    $dumpfile("arria10_argInOuts.vcd");
    $dumpvars(0, top0);
    clk = 0;
    chipselect = 1;
    reset = 0;

    write = 0;
    addr = 0;
    writedata = 0;
    chipselect = 0;
    write = 0;
    read = 0;

    awready = 0;
    arready = 0;
    wready = 0;
    rid = 6'b0;
    ruser = 32'b0;
    rdata = 512'b0;
    rresp = 2'b0;
    rlast = 0;
    rvalid = 0;
    bid = 0;
    buser = 32'b1;
    bresp = 2'b0;
    bvalid = 0;

    // reset the machine
    #10
    reset = 1;
    #10
    reset = 0;

    // start the flow
    // set up write eanbles
    awready = 1;
    #10
    wready = 1;

    // start fringe
    #20
    addr = 10'h0;
    writedata = 32'h1;
    write = 1;

    #10
    write = 0;

    #500
    bvalid = 1;
    bid = 6'b100000;

    #5000

    // check status
    // argouts
    read = 1;

    #30
    addr = 10'h1;

    $finish;
  end

  always
    #5 clk = !clk;

endmodule
