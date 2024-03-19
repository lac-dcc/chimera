module loopback #(
  parameter integer C_M_AXI_RD_BURST_LEN      = 16,
  parameter integer C_M_AXI_WR_BURST_LEN      = 16,
  parameter integer FIFO_ADDR_WIDTH           = 8,
  parameter integer READ_ADDR_BASE_0          = 32'h00000000,
  parameter integer WRITE_ADDR_BASE_0         = 32'h01000000,
  parameter integer READ_ADDR_BASE_1          = 32'h02000000,
  parameter integer WRITE_ADDR_BASE_1         = 32'h03000000,
  parameter integer READ_ADDR_BASE_2          = 32'h04000000,
  parameter integer WRITE_ADDR_BASE_2         = 32'h05000000,
  parameter integer READ_ADDR_BASE_3          = 32'h06000000,
  parameter integer WRITE_ADDR_BASE_3         = 32'h07000000,
  parameter integer DATA_WIDTH                = 64,
  parameter integer TX_SIZE_WIDTH             = 10
) (
  input  wire                clk,
  input  wire                resetn,

  input  wire [31:0]         M_AXI_GP0_awaddr,
  input  wire [2:0]          M_AXI_GP0_awprot,
  input  wire                M_AXI_GP0_awvalid,
  output wire                M_AXI_GP0_awready,

  input  wire [31:0]         M_AXI_GP0_wdata,
  input  wire [3:0]          M_AXI_GP0_wstrb,
  input  wire                M_AXI_GP0_wvalid,
  output wire                M_AXI_GP0_wready,

  output wire [1:0]          M_AXI_GP0_bresp,
  output wire                M_AXI_GP0_bvalid,
  input  wire                M_AXI_GP0_bready,

  input  wire [31:0]         M_AXI_GP0_araddr,
  input  wire [2:0]          M_AXI_GP0_arprot,
  input  wire                M_AXI_GP0_arvalid,
  output wire                M_AXI_GP0_arready,

  output wire [31:0]         M_AXI_GP0_rdata,
  output wire [1:0]          M_AXI_GP0_rresp,
  output wire                M_AXI_GP0_rvalid,
  input  wire                M_AXI_GP0_rready,

  output wire [31:0]         S_AXI_HP0_araddr,
  output wire [1:0]          S_AXI_HP0_arburst,
  output wire [3:0]          S_AXI_HP0_arcache,
  output wire [5:0]          S_AXI_HP0_arid,
  output wire [3:0]          S_AXI_HP0_arlen,
  output wire [1:0]          S_AXI_HP0_arlock,
  output wire [2:0]          S_AXI_HP0_arprot,
  output wire [3:0]          S_AXI_HP0_arqos,
  input  wire                S_AXI_HP0_arready,
  output wire [2:0]          S_AXI_HP0_arsize,
  output wire                S_AXI_HP0_arvalid,

  output wire [31:0]         S_AXI_HP0_awaddr,
  output wire [1:0]          S_AXI_HP0_awburst,
  output wire [3:0]          S_AXI_HP0_awcache,
  output wire [5:0]          S_AXI_HP0_awid,
  output wire [3:0]          S_AXI_HP0_awlen,
  output wire [1:0]          S_AXI_HP0_awlock,
  output wire [2:0]          S_AXI_HP0_awprot,
  output wire [3:0]          S_AXI_HP0_awqos,
  input  wire                S_AXI_HP0_awready,
  output wire [2:0]          S_AXI_HP0_awsize,
  output wire                S_AXI_HP0_awvalid,

  input  wire [5:0]          S_AXI_HP0_bid,
  output wire                S_AXI_HP0_bready,
  input  wire [1:0]          S_AXI_HP0_bresp,
  input  wire                S_AXI_HP0_bvalid,

  input  wire [63:0]         S_AXI_HP0_rdata,
  input  wire [5:0]          S_AXI_HP0_rid,
  input  wire                S_AXI_HP0_rlast,
  output wire                S_AXI_HP0_rready,
  input  wire [1:0]          S_AXI_HP0_rresp,
  input  wire                S_AXI_HP0_rvalid,

  output wire [63:0]         S_AXI_HP0_wdata,
  output wire [5:0]          S_AXI_HP0_wid,
  output wire                S_AXI_HP0_wlast,
  input  wire                S_AXI_HP0_wready,
  output wire [7:0]          S_AXI_HP0_wstrb,
  output wire                S_AXI_HP0_wvalid
);

  wire wburst_ready, outbuf_empty, outbuf_full;
  reg  [FIFO_ADDR_WIDTH:0] outbuf_count;
  wire outbuf_read_ready, outbuf_write_ready;


  //wire [63:0] S_AXI_HP0_wdata_tmp;
  //assign S_AXI_HP0_wdata = {32'hDEADBEEF, 32'hDEADBEEF};

  reg [31:0] r_count;
  reg [31:0] w_count;
  reg [31:0] ar_count;
  reg [31:0] aw_count;

  reg [31:0]  total_cycles;
  reg [31:0]  pr_cycles;
  reg [31:0]  wr_cycles;
  reg [31:0]  rd_cycles;


  wire [DATA_WIDTH-1:0] outbuf_read_data;
  wire [DATA_WIDTH-1:0] inbuf_write_data;
  wire [DATA_WIDTH-1:0] inbuf_read_data;

  wire [TX_SIZE_WIDTH-1:0] rx_req_size;

  wire outbuf_write, outbuf_read;

//--------------------------------------------------------------
//--------------------------------------------------------------
  //assign rx_req_size = 16;

  //assign S_AXI_HP0_araddr = READ_ADDR_BASE_0;
  //assign S_AXI_HP0_awaddr = WRITE_ADDR_BASE_0;

  axi_master #(
    .C_M_AXI_READ_TARGET    ( READ_ADDR_BASE_0    ),
    .C_M_AXI_WRITE_TARGET   ( WRITE_ADDR_BASE_0   ),
    .C_M_AXI_WR_BURST_LEN   ( C_M_AXI_WR_BURST_LEN),
    .C_M_AXI_RD_BURST_LEN   ( C_M_AXI_RD_BURST_LEN),
    .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH       )
  ) axim_hp0 (
    // System Signals
    .ACLK                   ( clk                 ),  //input
    .ARESETN                ( resetn              ),  //input

    // Master Interface Write Address
    .M_AXI_AWID             ( S_AXI_HP0_awid      ),  //output
    .M_AXI_AWADDR           ( S_AXI_HP0_awaddr    ),  //output
    //.M_AXI_AWADDR           ( ),  //output
    .M_AXI_AWLEN            ( S_AXI_HP0_awlen     ),  //output
    .M_AXI_AWSIZE           ( S_AXI_HP0_awsize    ),  //output
    .M_AXI_AWBURST          ( S_AXI_HP0_awburst   ),  //output
    .M_AXI_AWLOCK           ( S_AXI_HP0_awlock    ),  //output
    .M_AXI_AWCACHE          ( S_AXI_HP0_awcache   ),  //output
    .M_AXI_AWPROT           ( S_AXI_HP0_awprot    ),  //output
    .M_AXI_AWQOS            ( S_AXI_HP0_awqos     ),  //output
    .M_AXI_AWVALID          ( S_AXI_HP0_awvalid   ),  //output
    .M_AXI_AWREADY          ( S_AXI_HP0_awready   ),  //input

    // Master Interface Write Data
    .M_AXI_WID              ( S_AXI_HP0_wid       ),  //output
    .M_AXI_WDATA            ( S_AXI_HP0_wdata     ),  //output
    .M_AXI_WSTRB            ( S_AXI_HP0_wstrb     ),  //output
    .M_AXI_WLAST            ( S_AXI_HP0_wlast     ),  //output
    .M_AXI_WVALID           ( S_AXI_HP0_wvalid    ),  //output
    .M_AXI_WREADY           ( S_AXI_HP0_wready    ),  //input

    // Master Interface Write Response
    .M_AXI_BID              ( S_AXI_HP0_bid       ),  //input
    .M_AXI_BUSER            ( 1'b0                ),  //input
    .M_AXI_BRESP            ( S_AXI_HP0_bresp     ),  //input
    .M_AXI_BVALID           ( S_AXI_HP0_bvalid    ),  //input
    .M_AXI_BREADY           ( S_AXI_HP0_bready    ),  //output

    // Master Interface Read Address
    .M_AXI_ARID             ( S_AXI_HP0_arid      ),  //output
    .M_AXI_ARADDR           ( S_AXI_HP0_araddr    ),  //output
    //.M_AXI_ARADDR           ( ),  //output
    .M_AXI_ARLEN            ( S_AXI_HP0_arlen     ),  //output
    .M_AXI_ARSIZE           ( S_AXI_HP0_arsize    ),  //output
    .M_AXI_ARBURST          ( S_AXI_HP0_arburst   ),  //output
    .M_AXI_ARLOCK           ( S_AXI_HP0_arlock    ),  //output
    .M_AXI_ARCACHE          ( S_AXI_HP0_arcache   ),  //output
    .M_AXI_ARQOS            ( S_AXI_HP0_arqos     ),  //output
    .M_AXI_ARPROT           ( S_AXI_HP0_arprot    ),  //output
    .M_AXI_ARVALID          ( S_AXI_HP0_arvalid   ),  //output
    .M_AXI_ARREADY          ( S_AXI_HP0_arready   ),  //input

    // Master Interface Read Data 
    .M_AXI_RID              ( S_AXI_HP0_rid       ),  //input
    .M_AXI_RUSER            ( 1'b0                ),  //input
    .M_AXI_RDATA            ( S_AXI_HP0_rdata     ),  //input
    .M_AXI_RRESP            ( S_AXI_HP0_rresp     ),  //input
    .M_AXI_RLAST            ( S_AXI_HP0_rlast     ),  //input
    .M_AXI_RVALID           ( S_AXI_HP0_rvalid    ),  //input
    .M_AXI_RREADY           ( S_AXI_HP0_rready    ),  //output

    // NPU Design
    // WRITE from BRAM to DDR
    .outBuf_count           ( outbuf_count        ), //input
    .outBuf_empty           ( outbuf_empty        ), //input
    .wburst_ready           ( wburst_ready        ), //input
    .outBuf_pop             ( outbuf_read         ), //output
    .data_from_outBuf       ( outbuf_read_data    ), //input
    //.data_from_outBuf       ( {16'hAAAA, outbuf_read_data[47:32], 16'hAAAA, outbuf_read_data[15:0]} ), //input

    // READ from DDR to BRAM
    .data_to_inBuf          ( inbuf_write_data    ), //output
    .inBuf_push             ( inbuf_write         ), //output
    .inBuf_full             ( inbuf_full          ), //input

    .rx_req_size            ( rx_req_size         ), //input
    .rx_req                 ( rx_req              ), //input
    .rx_done                ( rx_done             )  //output
  ); 
//--------------------------------------------------------------

//--------------------------------------------------------------
//--------------------------------------------------------------
  wire inbuf_read_ready, inbuf_write_ready;

  assign inbuf_read_ready   = !inbuf_empty;
  assign inbuf_write_ready  = !inbuf_full;

  fifo #(
    .DATA_WIDTH             ( 64                  ),
    .ADDR_WIDTH             ( FIFO_ADDR_WIDTH     )
  ) fifo_inBuf (
    .clk                    ( clk                 ), //input
    .reset                  ( !resetn             ), //input
    .pop                    ( inbuf_read          ), //input
    .data_out               ( inbuf_read_data     ), //output
    .empty                  ( inbuf_empty         ), //output
    .push                   ( inbuf_write         ), //input
    .data_in                ( inbuf_write_data    ), //input
    .full                   ( inbuf_full          )  //output
  );
//--------------------------------------------------------------

  reg start;
  wire done;
  assign done = S_AXI_HP0_wlast;
  reg tx_req_d;

  //reg done = 1;
  //assign rx_done = ! start;

  reg rd_done;
  reg processing_done;
  reg wr_done;

  reg status_rd;
  reg status_pr;
  reg status_wr;
  reg status_total;

  always @(posedge clk)
  begin
      if (!resetn)
          rd_done <= 0;
      else if (S_AXI_HP0_rlast)
          rd_done <= 1;
  end


// ******************************************************************
// PERF_COUNTERS
// ******************************************************************

  always @(posedge clk)
  begin : STATUS_TOTAL
    if (resetn == 1'b0 || rx_done)
      status_total <= 1'b0;
    else if (rx_req)
      status_total <= 1'b1;
  end

  always @(posedge clk)
  begin : STATUS_READ
    if (resetn == 1'b0 || rd_done)
      status_rd <= 1'b0;
    else if (rx_req && ! tx_req_d)
      status_rd <= 1'b1;
  end

  wire [1:0]  state;//        = zynq_wrapper.dnn.PU_GENBLK.u_PU0.u_PU_Controller.state;
  always @(posedge clk)
  begin : STATUS_PROCESS
      if (resetn == 1'b0 || state == 3)
          status_pr <= 1'b0;
      else if (rx_req && state != 0)
          status_pr <= 1'b1;
  end

  always @(posedge clk)
  begin : STATUS_WRITE
      if (resetn == 1'b0 || S_AXI_HP0_wlast)
          status_wr <= 1'b0;
      else if (rx_req && S_AXI_HP0_awvalid && S_AXI_HP0_wvalid)
          status_wr <= 1'b1;
  end

  always @(posedge clk)
  begin : PERF_COUNT_TOTAL
      if (resetn == 0)
          total_cycles <= 0;
      else if (status_total)
          total_cycles <= total_cycles+1;
  end

  always @(posedge clk)
  begin : PERF_COUNT_READ
      if (resetn == 0 || status_wr || !rx_req)
          rd_cycles <= 0;
      else if (status_rd)
          rd_cycles <= rd_cycles+1;
  end

  always @(posedge clk)
  begin : PERF_COUNT_PROCESS
      if (resetn == 0)
          pr_cycles <= 0;
      else if (status_pr)
          pr_cycles <= pr_cycles+1;
  end

  always @(posedge clk)
  begin : PERF_COUNT_WRITE
      if (resetn == 0)
          wr_cycles <= 0;
      else if (status_wr)
          wr_cycles <= wr_cycles+1;
  end


always @(posedge clk)
begin
    if (!resetn)
        processing_done <= 0;
    else if (done)
        processing_done <= 1;
end

always @(posedge clk)
begin
    if (!resetn)
        wr_done <= 0;
    else if (S_AXI_HP0_wlast)
        wr_done <= 1;
end

always @(posedge clk)
begin
  tx_req_d <= rx_req;
end

always @(posedge clk)
begin
    if (!resetn)
    begin
        start <= 0;
    end else if (done)
    begin
        start <= 0;
    end else if (rd_done)
    begin
        start <= 1;
    end
end

//--------------------------------------------------------------
    reg inbuf_data_valid, outbuf_data_valid;
    
    assign inbuf_read = inbuf_read_ready;
    
    always @(posedge clk)
    begin:READ_DATA_VALID
        if (!resetn) begin
            inbuf_data_valid <= 1'b0;
        end else begin
            inbuf_data_valid <= inbuf_read;
        end
    end

    reg [DATA_WIDTH-1:0]  data_out;
    reg                   data_out_valid;
    wire [DATA_WIDTH-1:0] outbuf_write_data;
    assign outbuf_write_data  = data_out;
    assign outbuf_write = data_out_valid;

    always @(posedge clk)
    begin:WRITE_DATA
        if (!resetn) begin
            data_out_valid <= 1'b0;
        end else if (inbuf_data_valid) begin
            data_out_valid <= 1'b1;
        end else begin
            data_out_valid <= 1'b0;
        end
    end

    always @(posedge clk)
    begin:WRITE_DATA_VALID
        if (!resetn) begin
            data_out <= 0;
        end else begin
            data_out <= inbuf_read_data;
        end
    end
//--------------------------------------------------------------

//--------------------------------------------------------------
//--------------------------------------------------------------
  assign outbuf_read_ready = !outbuf_empty;
  assign outbuf_write_ready = !outbuf_full;

  fifo_fwft #(
    .DATA_WIDTH             ( 64                ),
    .ADDR_WIDTH             ( FIFO_ADDR_WIDTH   )
  ) fifo_outBuf (
    .clk                    ( clk               ),  //input
    .reset                  ( !resetn           ),  //input
    .push                   ( outbuf_write      ),  //input
    .pop                    ( outbuf_read       ),  //input
    .data_in                ( outbuf_write_data ),  //input
    .data_out               ( outbuf_read_data  ),  //output
    .empty                  ( outbuf_empty      ),  //output
    .full                   ( outbuf_full       ),  //output
    .fifo_count             (                   )   //output
  );

assign wburst_ready = outbuf_count >= C_M_AXI_WR_BURST_LEN;
always @(posedge clk)
begin
  if (!resetn)
    outbuf_count <= 0;
  else if (outbuf_write)
  begin
    if (S_AXI_HP0_awvalid && S_AXI_HP0_awready)
      outbuf_count <= outbuf_count - 15;
    else
      outbuf_count <= outbuf_count + 1;
  end else begin
    if (S_AXI_HP0_awvalid && S_AXI_HP0_awready)
      outbuf_count <= outbuf_count - 16;
    else
      outbuf_count <= outbuf_count + 0;
  end
end
//--------------------------------------------------------------

//--------------------------------------------------------------
//--------------------------------------------------------------
axi4lite_slave #(
    .AXIS_DATA_WIDTH        ( 32                  ),
    .AXIS_ADDR_WIDTH        ( 32                  ),
    .READ_ADDR_BASE_0       ( READ_ADDR_BASE_0    ),
    .WRITE_ADDR_BASE_0      ( WRITE_ADDR_BASE_0   )
) axi_slave_i (
    .S_AXI_ACLK             ( clk                ),  //input
    .S_AXI_ARESETN          ( resetn             ),  //input

    .S_AXI_AWADDR           ( M_AXI_GP0_awaddr    ),  //input
    .S_AXI_AWPROT           ( M_AXI_GP0_awprot    ),  //input
    .S_AXI_AWVALID          ( M_AXI_GP0_awvalid   ),  //input
    .S_AXI_AWREADY          ( M_AXI_GP0_awready   ),  //output

    .S_AXI_WDATA            ( M_AXI_GP0_wdata     ),  //input
    .S_AXI_WSTRB            ( M_AXI_GP0_wstrb     ),  //input
    .S_AXI_WVALID           ( M_AXI_GP0_wvalid    ),  //input
    .S_AXI_WREADY           ( M_AXI_GP0_wready    ),  //output

    .S_AXI_BRESP            ( M_AXI_GP0_bresp     ),  //output
    .S_AXI_BVALID           ( M_AXI_GP0_bvalid    ),  //output
    .S_AXI_BREADY           ( M_AXI_GP0_bready    ),  //input

    .S_AXI_ARADDR           ( M_AXI_GP0_araddr    ),  //input
    .S_AXI_ARPROT           ( M_AXI_GP0_arprot    ),  //input
    .S_AXI_ARVALID          ( M_AXI_GP0_arvalid   ),  //input
    .S_AXI_ARREADY          ( M_AXI_GP0_arready   ),  //output

    .S_AXI_RDATA            ( M_AXI_GP0_rdata     ),  //output
    .S_AXI_RRESP            ( M_AXI_GP0_rresp     ),  //output
    .S_AXI_RVALID           ( M_AXI_GP0_rvalid    ),  //output
    .S_AXI_RREADY           ( M_AXI_GP0_rready    ),  //input

    .rx_req                 ( rx_req              ),  //output
    .rx_req_size            ( rx_req_size         ),  //output
    .rx_done                ( 1'b1                ),  //input
    
    .rd_address             ( S_AXI_HP0_araddr    ),  //input
    .wr_address             ( S_AXI_HP0_awaddr    ),  //input

    .total_cycles           ( total_cycles        ),  //input
    .rd_cycles              ( rd_cycles           ),  //input
    .pr_cycles              ( pr_cycles           ),  //input
    .wr_cycles              ( wr_cycles           ),  //input

    .r_count                ( r_count             ),  //input
    .w_count                ( w_count             ),  //input
    .ar_count               ( ar_count            ),  //input
    .aw_count               ( aw_count            )   //input
);
//--------------------------------------------------------------

always @(posedge clk)
begin
  if (!resetn)
    r_count <= 0;
  else if (S_AXI_HP0_rvalid && S_AXI_HP0_rready)
    r_count <= r_count + 1;
  else
    r_count <= r_count;
end

always @(posedge clk)
begin
  if (!resetn)
    w_count <= 0;
  else if (S_AXI_HP0_wvalid && S_AXI_HP0_wready)
    w_count <= w_count + 1;
  else
    w_count <= w_count;
end

always @(posedge clk)
begin
  if (!resetn)
    ar_count <= 0;
  else if (S_AXI_HP0_arvalid && S_AXI_HP0_arready)
    ar_count <= ar_count + 1;
  else
    ar_count <= ar_count;
end

always @(posedge clk)
begin
  if (!resetn)
    aw_count <= 0;
  else if (S_AXI_HP0_awvalid && S_AXI_HP0_awready)
    aw_count <= aw_count + 1;
  else
    aw_count <= aw_count;
end

endmodule
