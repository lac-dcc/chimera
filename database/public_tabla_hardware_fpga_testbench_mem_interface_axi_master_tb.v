// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module axi_master_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
  parameter integer VERBOSITY                 = 3;

  parameter integer MAX_AR_DELAY              = 8;

  parameter integer TX_FIFO_DATA_WIDTH        = 16;

  parameter         C_M_AXI_PROTOCOL          = "AXI3";
  parameter integer C_M_AXI_THREAD_ID_WIDTH   = 6;
  parameter integer C_M_AXI_ADDR_WIDTH        = 32;
  parameter integer C_M_AXI_DATA_WIDTH        = 64;
  parameter integer C_M_AXI_AWUSER_WIDTH      = 1;
  parameter integer C_M_AXI_ARUSER_WIDTH      = 1;
  parameter integer C_M_AXI_WUSER_WIDTH       = 1;
  parameter integer C_M_AXI_RUSER_WIDTH       = 1;
  parameter integer C_M_AXI_BUSER_WIDTH       = 1;
  parameter integer C_M_AXI_SUPPORTS_WRITE    = 1;
  parameter integer C_M_AXI_SUPPORTS_READ     = 1;
  parameter integer C_M_AXI_READ_TARGET       = 32'hFFFF0000;
  parameter integer C_M_AXI_WRITE_TARGET      = 32'hFFFF8000;
  parameter integer C_OFFSET_WIDTH            = 30;
  parameter integer C_M_AXI_RD_BURST_LEN      = 16;
  parameter integer C_M_AXI_WR_BURST_LEN      = 16;

  parameter integer TX_SIZE_WIDTH             = 6;
// ******************************************************************

// ******************************************************************
// IO
// ******************************************************************

  // System Signals
  reg                                 ACLK;
  reg                                 ARESETN;
  
  // Master Interface Write Address
  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]  M_AXI_AWID;
  wire [C_M_AXI_ADDR_WIDTH-1:0]       M_AXI_AWADDR;
  wire [4-1:0]                        M_AXI_AWLEN;
  wire [3-1:0]                        M_AXI_AWSIZE;
  wire [2-1:0]                        M_AXI_AWBURST;
  wire [2-1:0]                        M_AXI_AWLOCK;
  wire [4-1:0]                        M_AXI_AWCACHE;
  wire [3-1:0]                        M_AXI_AWPROT;
  wire [4-1:0]                        M_AXI_AWQOS;
  wire [C_M_AXI_AWUSER_WIDTH-1:0]     M_AXI_AWUSER;
  wire                                M_AXI_AWVALID;
  wire                                M_AXI_AWREADY;
  
  // Master Interface Write Data
  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]  M_AXI_WID;
  wire [C_M_AXI_DATA_WIDTH-1:0]       M_AXI_WDATA;
  wire [C_M_AXI_DATA_WIDTH/8-1:0]     M_AXI_WSTRB;
  wire                                M_AXI_WLAST;
  wire [C_M_AXI_WUSER_WIDTH-1:0]      M_AXI_WUSER;
  wire                                M_AXI_WVALID;
  wire                                M_AXI_WREADY;
  
  // Master Interface Write Response  
  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]  M_AXI_BID;
  wire [2-1:0]                        M_AXI_BRESP;
  wire [C_M_AXI_BUSER_WIDTH-1:0]      M_AXI_BUSER;
  wire                                M_AXI_BVALID;
  wire                                M_AXI_BREADY;
  
  // Master Interface Read Address
  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]  M_AXI_ARID;
  wire [C_M_AXI_ADDR_WIDTH-1:0]       M_AXI_ARADDR;
  wire [4-1:0]                        M_AXI_ARLEN;
  wire [3-1:0]                        M_AXI_ARSIZE;
  wire [2-1:0]                        M_AXI_ARBURST;
  wire [2-1:0]                        M_AXI_ARLOCK;
  wire [4-1:0]                        M_AXI_ARCACHE;
  wire [3-1:0]                        M_AXI_ARPROT;
  wire [4-1:0]                        M_AXI_ARQOS;
  wire [C_M_AXI_ARUSER_WIDTH-1:0]     M_AXI_ARUSER;
  wire                                M_AXI_ARVALID;
  wire                                M_AXI_ARREADY;
  
  // Master Interface Read Data 
  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]  M_AXI_RID;
  wire [C_M_AXI_DATA_WIDTH-1:0]       M_AXI_RDATA;
  wire [2-1:0]                        M_AXI_RRESP;
  wire                                M_AXI_RLAST;
  wire [C_M_AXI_RUSER_WIDTH-1:0]      M_AXI_RUSER;
  wire                                M_AXI_RVALID;
  wire                                M_AXI_RREADY;

  // NPU Design
  // WRITE from BRAM to DDR
  wire [TX_SIZE_WIDTH-1:0]            outBuf_count;
  wire                                outBuf_empty;
  wire                                outBuf_pop;
  wire [C_M_AXI_DATA_WIDTH-1:0]       data_from_outBuf;

  // READ from DDR to BRAM
  wire [C_M_AXI_DATA_WIDTH-1:0]       data_to_inBuf;
  wire                                inBuf_push;
  wire                                inBuf_full;

  // TXN REQ
  wire                                rd_req;
  wire [TX_SIZE_WIDTH-1:0]            rd_req_size;
  wire [C_M_AXI_ADDR_WIDTH-1:0]       rd_addr;

  reg                                 fail_flag;

  integer                             read_counter;
  integer                             write_counter;


  // simplify interface
  wire                                wr_buf_push;
  reg                                 wr_flush = 0;
  wire                                wburst_ready;
  reg  [15:0]                         wburst_counter;
  wire [3:0]                          wburst_len;

  wire                                wr_req;
  wire [C_M_AXI_ADDR_WIDTH-1:0]       wr_addr;

// ******************************************************************

// ******************************************************************
initial begin
  $display("***************************************");
  $display ("Testing AXI Master");
  $display("***************************************");
  ACLK = 0;
  ARESETN = 0;
  @(negedge ACLK);
  @(negedge ACLK);
  ARESETN = 1;
  repeat(100) begin
      u_axim_driver.request_random_tx;
  end
  u_axim_driver.wait_for_writes;
      wr_flush = 1;
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      @(negedge ACLK);
      wr_flush = 0;
#100;
  u_axim_driver.check_fail;
  u_axim_driver.test_pass;
end

always #1 ACLK = ~ACLK;

always @(posedge ACLK)
begin
end

initial
begin
  $dumpfile("hw-imp/bin/waveform/axi_master.vcd");
  $dumpvars(0,axi_master_tb);
end


// ******************************************************************
// DUT - AXI-Master
// ******************************************************************
axi_master
#(
  .C_M_AXI_PROTOCOL           ( C_M_AXI_PROTOCOL          ),
  .C_M_AXI_THREAD_ID_WIDTH    ( C_M_AXI_THREAD_ID_WIDTH   ),
  .C_M_AXI_ADDR_WIDTH         ( C_M_AXI_ADDR_WIDTH        ),
  .C_M_AXI_DATA_WIDTH         ( C_M_AXI_DATA_WIDTH        ),
  .C_M_AXI_AWUSER_WIDTH       ( C_M_AXI_AWUSER_WIDTH      ),
  .C_M_AXI_ARUSER_WIDTH       ( C_M_AXI_ARUSER_WIDTH      ),
  .C_M_AXI_WUSER_WIDTH        ( C_M_AXI_WUSER_WIDTH       ),
  .C_M_AXI_RUSER_WIDTH        ( C_M_AXI_RUSER_WIDTH       ),
  .C_M_AXI_BUSER_WIDTH        ( C_M_AXI_BUSER_WIDTH       ),
  .C_M_AXI_SUPPORTS_WRITE     ( C_M_AXI_SUPPORTS_WRITE    ),
  .C_M_AXI_SUPPORTS_READ      ( C_M_AXI_SUPPORTS_READ     ),
  .C_M_AXI_READ_TARGET        ( C_M_AXI_READ_TARGET       ),
  .C_M_AXI_WRITE_TARGET       ( C_M_AXI_WRITE_TARGET      ),
  .C_OFFSET_WIDTH             ( C_OFFSET_WIDTH            ),
  .C_M_AXI_RD_BURST_LEN       ( C_M_AXI_RD_BURST_LEN      ),
  .C_M_AXI_WR_BURST_LEN       ( C_M_AXI_WR_BURST_LEN      ),
  .TX_SIZE_WIDTH              ( TX_SIZE_WIDTH             )
) u_axim (
  .ACLK                       ( ACLK                      ),
  .ARESETN                    ( ARESETN                   ),
  .M_AXI_AWID                 ( M_AXI_AWID                ),
  .M_AXI_AWADDR               ( M_AXI_AWADDR              ),
  .M_AXI_AWLEN                ( M_AXI_AWLEN               ),
  .M_AXI_AWSIZE               ( M_AXI_AWSIZE              ),
  .M_AXI_AWBURST              ( M_AXI_AWBURST             ),
  .M_AXI_AWLOCK               ( M_AXI_AWLOCK              ),
  .M_AXI_AWCACHE              ( M_AXI_AWCACHE             ),
  .M_AXI_AWPROT               ( M_AXI_AWPROT              ),
  .M_AXI_AWQOS                ( M_AXI_AWQOS               ),
  .M_AXI_AWUSER               ( M_AXI_AWUSER              ),
  .M_AXI_AWVALID              ( M_AXI_AWVALID             ),
  .M_AXI_AWREADY              ( M_AXI_AWREADY             ),
  .M_AXI_WID                  ( M_AXI_WID                 ),
  .M_AXI_WDATA                ( M_AXI_WDATA               ),
  .M_AXI_WSTRB                ( M_AXI_WSTRB               ),
  .M_AXI_WLAST                ( M_AXI_WLAST               ),
  .M_AXI_WUSER                ( M_AXI_WUSER               ),
  .M_AXI_WVALID               ( M_AXI_WVALID              ),
  .M_AXI_WREADY               ( M_AXI_WREADY              ),
  .M_AXI_BID                  ( M_AXI_BID                 ),
  .M_AXI_BRESP                ( M_AXI_BRESP               ),
  .M_AXI_BUSER                ( M_AXI_BUSER               ),
  .M_AXI_BVALID               ( M_AXI_BVALID              ),
  .M_AXI_BREADY               ( M_AXI_BREADY              ),
  .M_AXI_ARID                 ( M_AXI_ARID                ),
  .M_AXI_ARADDR               ( M_AXI_ARADDR              ),
  .M_AXI_ARLEN                ( M_AXI_ARLEN               ),
  .M_AXI_ARSIZE               ( M_AXI_ARSIZE              ),
  .M_AXI_ARBURST              ( M_AXI_ARBURST             ),
  .M_AXI_ARLOCK               ( M_AXI_ARLOCK              ),
  .M_AXI_ARCACHE              ( M_AXI_ARCACHE             ),
  .M_AXI_ARPROT               ( M_AXI_ARPROT              ),
  .M_AXI_ARQOS                ( M_AXI_ARQOS               ),
  .M_AXI_ARUSER               ( M_AXI_ARUSER              ),
  .M_AXI_ARVALID              ( M_AXI_ARVALID             ),
  .M_AXI_ARREADY              ( M_AXI_ARREADY             ),
  .M_AXI_RID                  ( M_AXI_RID                 ),
  .M_AXI_RDATA                ( M_AXI_RDATA               ),
  .M_AXI_RRESP                ( M_AXI_RRESP               ),
  .M_AXI_RLAST                ( M_AXI_RLAST               ),
  .M_AXI_RUSER                ( M_AXI_RUSER               ),
  .M_AXI_RVALID               ( M_AXI_RVALID              ),
  .M_AXI_RREADY               ( M_AXI_RREADY              ),

  .outBuf_empty               ( outBuf_empty              ),
  .outBuf_pop                 ( outBuf_pop                ),
  .data_from_outBuf           ( data_from_outBuf          ),

  .data_to_inBuf              ( data_to_inBuf             ),
  .inBuf_push                 ( inBuf_push                ),
  .inBuf_full                 ( inBuf_full                ),

  .rd_req                     ( rd_req                    ),
  .rd_req_size                ( rd_req_size               ),
  .rd_addr                    ( rd_addr                   ),

  .wr_req                     ( wr_req                    ),
  .wr_addr                    ( wr_addr                   ),

  .write_valid                ( inBuf_push                ),
  .wr_flush                   ( wr_flush                  )
); 
// ******************************************************************

// ******************************************************************
// AXI_MASTER_TB
// ******************************************************************
axi_master_tb_driver
#(
  .MAX_AR_DELAY               ( MAX_AR_DELAY              ),
  .TX_FIFO_DATA_WIDTH         ( TX_FIFO_DATA_WIDTH        ),
  .C_M_AXI_PROTOCOL           ( C_M_AXI_PROTOCOL          ),
  .C_M_AXI_THREAD_ID_WIDTH    ( C_M_AXI_THREAD_ID_WIDTH   ),
  .C_M_AXI_DATA_WIDTH         ( C_M_AXI_DATA_WIDTH        ),
  .C_M_AXI_SUPPORTS_WRITE     ( C_M_AXI_SUPPORTS_WRITE    ),
  .C_M_AXI_SUPPORTS_READ      ( C_M_AXI_SUPPORTS_READ     ),
  .C_M_AXI_READ_TARGET        ( C_M_AXI_READ_TARGET       ),
  .C_M_AXI_WRITE_TARGET       ( C_M_AXI_WRITE_TARGET      ),
  .C_OFFSET_WIDTH             ( C_OFFSET_WIDTH            ),
  .C_M_AXI_RD_BURST_LEN       ( C_M_AXI_RD_BURST_LEN      ),
  .C_M_AXI_WR_BURST_LEN       ( C_M_AXI_WR_BURST_LEN      ),
  .TX_SIZE_WIDTH              ( TX_SIZE_WIDTH             ),
  .VERBOSITY                  ( VERBOSITY                 )
) u_axim_driver (
  .ACLK                       ( ACLK                      ),
  .ARESETN                    ( ARESETN                   ),
  .M_AXI_AWID                 ( M_AXI_AWID                ),
  .M_AXI_AWADDR               ( M_AXI_AWADDR              ),
  .M_AXI_AWLEN                ( M_AXI_AWLEN               ),
  .M_AXI_AWSIZE               ( M_AXI_AWSIZE              ),
  .M_AXI_AWBURST              ( M_AXI_AWBURST             ),
  .M_AXI_AWLOCK               ( M_AXI_AWLOCK              ),
  .M_AXI_AWCACHE              ( M_AXI_AWCACHE             ),
  .M_AXI_AWPROT               ( M_AXI_AWPROT              ),
  .M_AXI_AWQOS                ( M_AXI_AWQOS               ),
  .M_AXI_AWUSER               ( M_AXI_AWUSER              ),
  .M_AXI_AWVALID              ( M_AXI_AWVALID             ),
  .M_AXI_AWREADY              ( M_AXI_AWREADY             ),
  .M_AXI_WID                  ( M_AXI_WID                 ),
  .M_AXI_WDATA                ( M_AXI_WDATA               ),
  .M_AXI_WSTRB                ( M_AXI_WSTRB               ),
  .M_AXI_WLAST                ( M_AXI_WLAST               ),
  .M_AXI_WUSER                ( M_AXI_WUSER               ),
  .M_AXI_WVALID               ( M_AXI_WVALID              ),
  .M_AXI_WREADY               ( M_AXI_WREADY              ),
  .M_AXI_BID                  ( M_AXI_BID                 ),
  .M_AXI_BRESP                ( M_AXI_BRESP               ),
  .M_AXI_BUSER                ( M_AXI_BUSER               ),
  .M_AXI_BVALID               ( M_AXI_BVALID              ),
  .M_AXI_BREADY               ( M_AXI_BREADY              ),
  .M_AXI_ARID                 ( M_AXI_ARID                ),
  .M_AXI_ARADDR               ( M_AXI_ARADDR              ),
  .M_AXI_ARLEN                ( M_AXI_ARLEN               ),
  .M_AXI_ARSIZE               ( M_AXI_ARSIZE              ),
  .M_AXI_ARBURST              ( M_AXI_ARBURST             ),
  .M_AXI_ARLOCK               ( M_AXI_ARLOCK              ),
  .M_AXI_ARCACHE              ( M_AXI_ARCACHE             ),
  .M_AXI_ARPROT               ( M_AXI_ARPROT              ),
  .M_AXI_ARQOS                ( M_AXI_ARQOS               ),
  .M_AXI_ARUSER               ( M_AXI_ARUSER              ),
  .M_AXI_ARVALID              ( M_AXI_ARVALID             ),
  .M_AXI_ARREADY              ( M_AXI_ARREADY             ),
  .M_AXI_RID                  ( M_AXI_RID                 ),
  .M_AXI_RDATA                ( M_AXI_RDATA               ),
  .M_AXI_RRESP                ( M_AXI_RRESP               ),
  .M_AXI_RLAST                ( M_AXI_RLAST               ),
  .M_AXI_RUSER                ( M_AXI_RUSER               ),
  .M_AXI_RVALID               ( M_AXI_RVALID              ),
  .M_AXI_RREADY               ( M_AXI_RREADY              ),
  .outBuf_count               ( outBuf_count              ),
  .outBuf_empty               ( outBuf_empty              ),
  .outBuf_pop                 ( outBuf_pop                ),
  .data_from_outBuf           ( data_from_outBuf          ),
  .data_to_inBuf              ( data_to_inBuf             ),
  .inBuf_push                 ( inBuf_push                ),
  .inBuf_full                 ( inBuf_full                ),
  .rd_req                     ( rd_req                    ),
  .rd_addr                    ( rd_addr                   ),
  .rd_req_size                ( rd_req_size               )
);
// ******************************************************************

endmodule
