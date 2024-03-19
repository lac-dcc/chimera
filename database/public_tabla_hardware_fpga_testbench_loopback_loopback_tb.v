module loopback_tb;

  parameter READ_ADDR_BASE_0    = 32'h10000000;
  parameter WRITE_ADDR_BASE_0   = 32'h20000000;
  parameter READ_ADDR_BASE_1    = 32'h02000000;
  parameter WRITE_ADDR_BASE_1   = 32'h03000000;
  parameter READ_ADDR_BASE_2    = 32'h04000000;
  parameter WRITE_ADDR_BASE_2   = 32'h05000000;
  parameter READ_ADDR_BASE_3    = 32'h06000000;
  parameter WRITE_ADDR_BASE_3   = 32'h07000000;

  reg                    clk;
  reg                    resetn;
  reg                    reset;

  wire [31:0]         M_AXI_GP0_awaddr;
  wire [2:0]          M_AXI_GP0_awprot;
  wire                M_AXI_GP0_awvalid;
  wire                M_AXI_GP0_awready;

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

//--------------------------------------------------------------
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
    .M_AXI_GP0_wdata    ( M_AXI_GP0_wdata   ),
    .M_AXI_GP0_wstrb    ( M_AXI_GP0_wstrb   ),
    .M_AXI_GP0_wvalid   ( M_AXI_GP0_wvalid    ),
    .M_AXI_GP0_wready   ( M_AXI_GP0_wready    ),
    .M_AXI_GP0_bresp    ( M_AXI_GP0_bresp   ),
    .M_AXI_GP0_bvalid   ( M_AXI_GP0_bvalid    ),
    .M_AXI_GP0_bready   ( M_AXI_GP0_bready    ),
    .M_AXI_GP0_araddr   ( M_AXI_GP0_araddr    ),
    .M_AXI_GP0_arprot   ( M_AXI_GP0_arprot    ),
    .M_AXI_GP0_arvalid  ( M_AXI_GP0_arvalid   ),
    .M_AXI_GP0_arready  ( M_AXI_GP0_arready   ),
    .M_AXI_GP0_rdata    ( M_AXI_GP0_rdata   ),
    .M_AXI_GP0_rresp    ( M_AXI_GP0_rresp   ),
    .M_AXI_GP0_rvalid   ( M_AXI_GP0_rvalid    ),
    .M_AXI_GP0_rready   ( M_AXI_GP0_rready    ),
    .S_AXI_HP0_araddr   ( S_AXI_HP0_araddr    ),
    .S_AXI_HP0_arburst  ( S_AXI_HP0_arburst   ),
    .S_AXI_HP0_arcache  ( S_AXI_HP0_arcache   ),
    .S_AXI_HP0_arid     ( S_AXI_HP0_arid    ),
    .S_AXI_HP0_arlen    ( S_AXI_HP0_arlen   ),
    .S_AXI_HP0_arlock   ( S_AXI_HP0_arlock    ),
    .S_AXI_HP0_arprot   ( S_AXI_HP0_arprot    ),
    .S_AXI_HP0_arqos    ( S_AXI_HP0_arqos   ),
    .S_AXI_HP0_arready  ( S_AXI_HP0_arready   ),
    .S_AXI_HP0_arsize   ( S_AXI_HP0_arsize    ),
    .S_AXI_HP0_arvalid  ( S_AXI_HP0_arvalid   ),
    .S_AXI_HP0_awaddr   ( S_AXI_HP0_awaddr    ),
    .S_AXI_HP0_awburst  ( S_AXI_HP0_awburst   ),
    .S_AXI_HP0_awcache  ( S_AXI_HP0_awcache   ),
    .S_AXI_HP0_awid     ( S_AXI_HP0_awid    ),
    .S_AXI_HP0_awlen    ( S_AXI_HP0_awlen   ),
    .S_AXI_HP0_awlock   ( S_AXI_HP0_awlock    ),
    .S_AXI_HP0_awprot   ( S_AXI_HP0_awprot    ),
    .S_AXI_HP0_awqos    ( S_AXI_HP0_awqos   ),
    .S_AXI_HP0_awready  ( S_AXI_HP0_awready   ),
    .S_AXI_HP0_awsize   ( S_AXI_HP0_awsize    ),
    .S_AXI_HP0_awvalid  ( S_AXI_HP0_awvalid   ),
    .S_AXI_HP0_bid      ( S_AXI_HP0_bid   ),
    .S_AXI_HP0_bready   ( S_AXI_HP0_bready    ),
    .S_AXI_HP0_bresp    ( S_AXI_HP0_bresp   ),
    .S_AXI_HP0_bvalid   ( S_AXI_HP0_bvalid    ),
    .S_AXI_HP0_rdata    ( S_AXI_HP0_rdata   ),
    .S_AXI_HP0_rid      ( S_AXI_HP0_rid   ),
    .S_AXI_HP0_rlast    ( S_AXI_HP0_rlast   ),
    .S_AXI_HP0_rready   ( S_AXI_HP0_rready    ),
    .S_AXI_HP0_rresp    ( S_AXI_HP0_rresp   ),
    .S_AXI_HP0_rvalid   ( S_AXI_HP0_rvalid    ),
    .S_AXI_HP0_wdata    ( S_AXI_HP0_wdata   ),
    .S_AXI_HP0_wid      ( S_AXI_HP0_wid   ),
    .S_AXI_HP0_wlast    ( S_AXI_HP0_wlast   ),
    .S_AXI_HP0_wready   ( S_AXI_HP0_wready    ),
    .S_AXI_HP0_wstrb    ( S_AXI_HP0_wstrb   ),
    .S_AXI_HP0_wvalid   ( S_AXI_HP0_wvalid    )
  );
//--------------------------------------------------------------

initial begin
  clk = 0;
  reset = 1;
  resetn = 0;
  @(negedge clk);
  reset = 0;
  resetn = 1;
end

always #1 clk = !clk;

initial begin
  #10000;
  $display ("TIMEOUT");
  fail_flag = 1'b1;
end

// ******************************************************************
// AXI_MASTER_TB
// ******************************************************************
   parameter integer MAX_AR_DELAY             = 8;

   parameter integer TX_FIFO_DATA_WIDTH       = 16;

   parameter         C_M_AXI_PROTOCOL         = "AXI3";
   parameter integer C_M_AXI_THREAD_ID_WIDTH  = 6;
   parameter integer C_M_AXI_ADDR_WIDTH       = 32;
   parameter integer C_M_AXI_DATA_WIDTH       = 64;
   parameter integer C_M_AXI_AWUSER_WIDTH     = 1;
   parameter integer C_M_AXI_ARUSER_WIDTH     = 1;
   parameter integer C_M_AXI_WUSER_WIDTH      = 1;
   parameter integer C_M_AXI_RUSER_WIDTH      = 1;
   parameter integer C_M_AXI_BUSER_WIDTH      = 1;
   parameter integer C_M_AXI_SUPPORTS_WRITE   = 1;
   parameter integer C_M_AXI_SUPPORTS_READ    = 1;
   parameter integer C_M_AXI_READ_TARGET      = 32'hFFFF0000;
   parameter integer C_M_AXI_WRITE_TARGET     = 32'hFFFF8000;
   parameter integer C_OFFSET_WIDTH           = 11;
   parameter integer C_M_AXI_RD_BURST_LEN     = 16;
   parameter integer C_M_AXI_WR_BURST_LEN     = 4;

   parameter integer TX_SIZE_WIDTH            = 6;
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
    .TX_SIZE_WIDTH              ( TX_SIZE_WIDTH             )
) u_axim_driver (
    .ACLK                       ( clk                       ),
    .ARESETN                    ( resetn                    ),
    .M_AXI_AWID                 ( S_AXI_HP0_awid            ),
    .M_AXI_AWADDR               ( S_AXI_HP0_awaddr          ),
    .M_AXI_AWLEN                ( S_AXI_HP0_awlen           ),
    .M_AXI_AWSIZE               ( S_AXI_HP0_awsize          ),
    .M_AXI_AWBURST              ( S_AXI_HP0_awburst         ),
    .M_AXI_AWLOCK               ( S_AXI_HP0_awlock          ),
    .M_AXI_AWCACHE              ( S_AXI_HP0_awcache         ),
    .M_AXI_AWPROT               ( S_AXI_HP0_awprot          ),
    .M_AXI_AWQOS                ( S_AXI_HP0_awqos           ),
    .M_AXI_AWUSER               ( S_AXI_HP0_awuser          ),
    .M_AXI_AWVALID              ( S_AXI_HP0_awvalid         ),
    .M_AXI_AWREADY              ( S_AXI_HP0_awready         ),
    .M_AXI_WID                  ( S_AXI_HP0_wid             ),
    .M_AXI_WDATA                ( S_AXI_HP0_wdata           ),
    .M_AXI_WSTRB                ( S_AXI_HP0_wstrb           ),
    .M_AXI_WLAST                ( S_AXI_HP0_wlast           ),
    .M_AXI_WUSER                ( S_AXI_HP0_wuser           ),
    .M_AXI_WVALID               ( S_AXI_HP0_wvalid          ),
    .M_AXI_WREADY               ( S_AXI_HP0_wready          ),
    .M_AXI_BID                  ( S_AXI_HP0_bid             ),
    .M_AXI_BRESP                ( S_AXI_HP0_bresp           ),
    .M_AXI_BUSER                ( S_AXI_HP0_buser           ),
    .M_AXI_BVALID               ( S_AXI_HP0_bvalid          ),
    .M_AXI_BREADY               ( S_AXI_HP0_bready          ),
    .M_AXI_ARID                 ( S_AXI_HP0_arid            ),
    .M_AXI_ARADDR               ( S_AXI_HP0_araddr          ),
    .M_AXI_ARLEN                ( S_AXI_HP0_arlen           ),
    .M_AXI_ARSIZE               ( S_AXI_HP0_arsize          ),
    .M_AXI_ARBURST              ( S_AXI_HP0_arburst         ),
    .M_AXI_ARLOCK               ( S_AXI_HP0_arlock          ),
    .M_AXI_ARCACHE              ( S_AXI_HP0_arcache         ),
    .M_AXI_ARPROT               ( S_AXI_HP0_arprot          ),
    .M_AXI_ARQOS                ( S_AXI_HP0_arqos           ),
    .M_AXI_ARUSER               ( S_AXI_HP0_aruser          ),
    .M_AXI_ARVALID              ( S_AXI_HP0_arvalid         ),
    .M_AXI_ARREADY              ( S_AXI_HP0_arready         ),
    .M_AXI_RID                  ( S_AXI_HP0_rid             ),
    .M_AXI_RDATA                ( S_AXI_HP0_rdata           ),
    .M_AXI_RRESP                ( S_AXI_HP0_rresp           ),
    .M_AXI_RLAST                ( S_AXI_HP0_rlast           ),
    .M_AXI_RUSER                ( S_AXI_HP0_ruser           ),
    .M_AXI_RVALID               ( S_AXI_HP0_rvalid          ),
    .M_AXI_RREADY               ( S_AXI_HP0_rready          )
);
// ******************************************************************


// ******************************************************************
// AXI_slave tb driver
// ******************************************************************
axi_slave_tb_driver
#(
    .PERF_CNTR_WIDTH            ( 10                    ),
    .AXIS_DATA_WIDTH            ( 32                    ),
    .AXIS_ADDR_WIDTH            ( 32                    ),
    .VERBOSITY                  ( 1                     )
) u_axis_driver (
    .tx_req                     ( tx_req                ), //input 
    .tx_done                    ( tx_done               ), //output 
    .rd_done                    ( rd_done               ), //output 
    .wr_done                    ( wr_done               ), //output 
    .processing_done            ( processing_done       ), //output 
    .total_cycles               ( total_cycles          ), //output 
    .rd_cycles                  ( rd_cycles             ), //output 
    .pr_cycles                  ( pr_cycles             ), //output 
    .wr_cycles                  ( wr_cycles             ), //output 
    .S_AXI_ACLK                 ( clk                   ), //output 
    .S_AXI_ARESETN              ( resetn                ), //output 
    .S_AXI_AWADDR               ( M_AXI_GP0_awaddr      ), //output 
    .S_AXI_AWPROT               ( M_AXI_GP0_awprot      ), //output 
    .S_AXI_AWVALID              ( M_AXI_GP0_awvalid     ), //output 
    .S_AXI_AWREADY              ( M_AXI_GP0_awready     ), //input 
    .S_AXI_WDATA                ( M_AXI_GP0_wdata       ), //output 
    .S_AXI_WSTRB                ( M_AXI_GP0_wstrb       ), //output 
    .S_AXI_WVALID               ( M_AXI_GP0_wvalid      ), //output 
    .S_AXI_WREADY               ( M_AXI_GP0_wready      ), //input 
    .S_AXI_BRESP                ( M_AXI_GP0_bresp       ), //input 
    .S_AXI_BVALID               ( M_AXI_GP0_bvalid      ), //input 
    .S_AXI_BREADY               ( M_AXI_GP0_bready      ), //output 
    .S_AXI_ARADDR               ( M_AXI_GP0_araddr      ), //output 
    .S_AXI_ARPROT               ( M_AXI_GP0_arprot      ), //output 
    .S_AXI_ARVALID              ( M_AXI_GP0_arvalid     ), //output 
    .S_AXI_ARREADY              ( M_AXI_GP0_arready     ), //input 
    .S_AXI_RDATA                ( M_AXI_GP0_rdata       ), //input 
    .S_AXI_RRESP                ( M_AXI_GP0_rresp       ), //input 
    .S_AXI_RVALID               ( M_AXI_GP0_rvalid      ), //input 
    .S_AXI_RREADY               ( M_AXI_GP0_rready      )  //output 
);
// ******************************************************************

reg [C_M_AXI_DATA_WIDTH-1:0] data_buffer [0:1023];
reg [10-1:0] rptr, wptr;
reg [10-1:0] num_reads, num_writes, num_reads_prev;
reg fail_flag;
reg [C_M_AXI_DATA_WIDTH-1:0] axis_rdata;
reg [C_M_AXI_DATA_WIDTH-1:0] count;
reg [C_M_AXI_ADDR_WIDTH-1:0] rd_addr, wr_addr;
initial begin
  num_reads = 0;
  count = 0;
  num_reads_prev = 0;
  fail_flag = 0;
  rptr = 0;
  wptr = 0;
  num_writes = 0;
  repeat (10) begin
    count = count + 16; 
    @(negedge clk);
    initiate_reads(count);
    $display("waiting for reads to finish");
    while (num_reads_prev !== num_reads - count) begin
      //u_axis_driver.read_request(9, num_reads);
      @(negedge clk);
      //$display ("Num_READS_PREV = %d, NUM_READS = %d, count = %d", num_reads_prev, num_reads, count);
    end
    rd_addr = S_AXI_HP0_araddr - READ_ADDR_BASE_0;
    $display("reads finished");
    if (rd_addr !== num_reads*8)
    begin
      $display ("Number of reads does not match the read address");
      $display ("rd_addr = %h, num_reads = %h",
        rd_addr, num_reads);
      fail_flag = 1;
    end
    $display("waiting for writes to finish");
    while (num_reads !== num_writes) begin
      //u_axis_driver.read_request(10, num_writes);
      @(negedge clk);
    end
    wr_addr = S_AXI_HP0_awaddr - WRITE_ADDR_BASE_0;
    if (rd_addr !== wr_addr) begin
      $display ("Number of reads !== number of writes");
      fail_flag = 1'b1;
    end
    num_reads_prev = num_reads_prev + count;
  end
  $display("%c[1;32m",27);
  $display ("*********************");
  $display ("Test Passed");
  $display ("*********************");
  $display("%c[0m",27);
  $finish;
end


always @(posedge clk)
begin
  if (S_AXI_HP0_rvalid && S_AXI_HP0_rready) begin
    num_reads = num_reads + 1'b1;
    data_buffer[rptr] = S_AXI_HP0_rdata;
    rptr = rptr + 1;
    $display ( "Read  data : %h, addr : %h", S_AXI_HP0_rdata, S_AXI_HP0_araddr);
    //$display ( "Num of reads finished = %d", rptr);
  end
  if (S_AXI_HP0_wvalid && S_AXI_HP0_wready) begin
    num_writes = num_writes + 1'b1;
    $display ( "Write data : %h, addr : %h", S_AXI_HP0_wdata, S_AXI_HP0_awaddr);
    if (S_AXI_HP0_wdata !== data_buffer[wptr]) begin
      $display ("ERROR: Expected data - %h\t Got data - %h",
        data_buffer[wptr], S_AXI_HP0_wdata);
      fail_flag = 1;
    end
    wptr = wptr + 1;
  end
end

initial
begin
    $dumpfile("hw-imp/bin/waveform/loopback_tb.vcd");
    $dumpvars(0,loopback_tb);
end

always @ (posedge clk)
begin
    check_fail;
end

//--------------------------------------------------------------------------------------
task check_fail;
    if (fail_flag && !reset) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task initiate_reads;
  input [C_M_AXI_DATA_WIDTH-1:0] rd;
  reg [C_M_AXI_DATA_WIDTH-1:0] state;
  begin
    $display("Initiating transfer for %d reads", rd);
    u_axis_driver.read_request(0, state);
    u_axis_driver.write_request(1<<2, rd);
    u_axis_driver.write_request(0, 1 - state);
  end
endtask
//--------------------------------------------------------------------------------------

endmodule
