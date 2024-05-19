// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "log.vh"
	`include "config.vh"
`endif
module axi_master #
(
// ******************************************************************
// Parameters
// ******************************************************************
   parameter         C_M_AXI_PROTOCOL                   = "AXI3",
   parameter integer C_M_AXI_THREAD_ID_WIDTH            = 6,
   parameter integer C_M_AXI_ADDR_WIDTH                 = 32,
   parameter integer C_M_AXI_DATA_WIDTH                 = 64,
   parameter integer C_M_AXI_AWUSER_WIDTH               = 1,
   parameter integer C_M_AXI_ARUSER_WIDTH               = 1,
   parameter integer C_M_AXI_WUSER_WIDTH                = 1,
   parameter integer C_M_AXI_RUSER_WIDTH                = 1,
   parameter integer C_M_AXI_BUSER_WIDTH                = 1,
   
   /* Disabling these parameters will remove any throttling.
    The resulting ERROR flag will not be useful */ 
   parameter integer C_M_AXI_SUPPORTS_WRITE             = 1,
   parameter integer C_M_AXI_SUPPORTS_READ              = 1,
   
   /* Max count of written but not yet read bursts.
    If the interconnect/slave is able to accept enough
    addresses and the read channels are stalled, the
    master will issue this many commands ahead of 
    write responses */

   // Base address of targeted slave
   //Changing read and write addresses
   parameter         C_M_AXI_READ_TARGET                = 32'hFFFF0000,
   parameter         C_M_AXI_WRITE_TARGET               = 32'hFFFF8000,
   
   
   // Number of address bits to test before wrapping
   parameter integer C_OFFSET_WIDTH                     = 30,
   
   /* Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
    Non-2^n lengths will eventually cause bursts across 4K
    address boundaries.*/
   parameter integer C_M_AXI_RD_BURST_LEN               = 16,
   parameter integer C_M_AXI_WR_BURST_LEN               = 16,
   
   // CUSTOM PARAMS
   parameter         TX_SIZE_WIDTH                      = 10,
   parameter         NUM_AXI                            =4
   )
   (
// ******************************************************************
// IO
// ******************************************************************
    // System Signals
    input  wire                                 ACLK,
    input  wire                                 ARESETN,
     
    // Master Interface Write Address
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   MASTER_AXI_AWID,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]        MASTER_AXI_AWADDR,
    output wire [4-1:0]                         MASTER_AXI_AWLEN,
    output wire [3-1:0]                         MASTER_AXI_AWSIZE,
    output wire [2-1:0]                         MASTER_AXI_AWBURST,
    output wire [2-1:0]                         MASTER_AXI_AWLOCK,
    output wire [4-1:0]                         MASTER_AXI_AWCACHE,
    output wire [3-1:0]                         MASTER_AXI_AWPROT,
    output wire [4-1:0]                         MASTER_AXI_AWQOS,
    output wire [C_M_AXI_AWUSER_WIDTH-1:0]      MASTER_AXI_AWUSER,
    output wire                                 MASTER_AXI_AWVALID,
    input  wire                                 MASTER_AXI_AWREADY,
    
    // Master Interface Write Data
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   MASTER_AXI_WID,
    output wire [C_M_AXI_DATA_WIDTH-1:0]        MASTER_AXI_WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1:0]      MASTER_AXI_WSTRB,
    output wire                                 MASTER_AXI_WLAST,
    output wire [C_M_AXI_WUSER_WIDTH-1:0]       MASTER_AXI_WUSER,
    output wire                                 MASTER_AXI_WVALID,
    input  wire                                 MASTER_AXI_WREADY,
    
    // Master Interface Write Response
    input  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   MASTER_AXI_BID,
    input  wire [2-1:0]                         MASTER_AXI_BRESP,
    input  wire [C_M_AXI_BUSER_WIDTH-1:0]       MASTER_AXI_BUSER,
    input  wire                                 MASTER_AXI_BVALID,
    output wire                                 MASTER_AXI_BREADY,
    
    // Master Interface Read Address
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   MASTER_AXI_ARID,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]        MASTER_AXI_ARADDR,
    output wire [4-1:0]                         MASTER_AXI_ARLEN,
    output wire [3-1:0]                         MASTER_AXI_ARSIZE,
    output wire [2-1:0]                         MASTER_AXI_ARBURST,
    output wire [2-1:0]                         MASTER_AXI_ARLOCK,
    output wire [4-1:0]                         MASTER_AXI_ARCACHE,
    output wire [3-1:0]                         MASTER_AXI_ARPROT,
    // AXI3 output wire [4-1:0]          		MASTER_AXI_ARREGION,
    output wire [4-1:0]                         MASTER_AXI_ARQOS,
    output wire [C_M_AXI_ARUSER_WIDTH-1:0]      MASTER_AXI_ARUSER,
    output wire                                 MASTER_AXI_ARVALID,
    input  wire                                 MASTER_AXI_ARREADY,
    
    // Master Interface Read Data 
    input  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   MASTER_AXI_RID,
    input  wire [C_M_AXI_DATA_WIDTH-1:0]        MASTER_AXI_RDATA,
    input  wire [2-1:0]                         MASTER_AXI_RRESP,
    input  wire                                 MASTER_AXI_RLAST,
    input  wire [C_M_AXI_RUSER_WIDTH-1:0]       MASTER_AXI_RUSER,
    input  wire                                 MASTER_AXI_RVALID,
    output wire                                 MASTER_AXI_RREADY,

    // NPU Design
    // WRITE from BRAM to DDR
    //input  wire [TX_SIZE_WIDTH-1:0]             outBuf_count,
    input  wire                                 outBuf_empty,
    output wire                                 outBuf_pop,
    input  wire [C_M_AXI_DATA_WIDTH-1:0]        data_from_outBuf,

    // READ from DDR to BRAM
    output wire [C_M_AXI_DATA_WIDTH-1:0]        data_to_inBuf,
    output wire                                 inBuf_push,
    input  wire                                 inBuf_full,

    // TXN REQ
    input  wire                                 rd_req,
    input  wire [TX_SIZE_WIDTH-1:0]             rd_req_size,
    input  wire [C_M_AXI_ADDR_WIDTH-1:0]        rd_addr,

    input  wire [C_M_AXI_ADDR_WIDTH-1:0]        wr_addr,
    input  wire                                 wr_req,

    input  wire                                 wr_flush,
    input  wire                                 write_valid
    ); 


// Master Interface Write Address
     wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_AWID;
     wire [C_M_AXI_ADDR_WIDTH-1:0]        M_AXI_AWADDR;
     wire [4-1:0]                         M_AXI_AWLEN;
     wire [3-1:0]                         M_AXI_AWSIZE;
     wire [2-1:0]                         M_AXI_AWBURST;
     wire [2-1:0]                         M_AXI_AWLOCK;
     wire [4-1:0]                         M_AXI_AWCACHE;
     wire [3-1:0]                         M_AXI_AWPROT;
     wire [4-1:0]                         M_AXI_AWQOS;
     wire [C_M_AXI_AWUSER_WIDTH-1:0]      M_AXI_AWUSER;
     wire                                 M_AXI_AWVALID;
      wire                                 M_AXI_AWREADY;
    
    // Master Interface Write Data
     wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_WID;
     wire [C_M_AXI_DATA_WIDTH-1:0]        M_AXI_WDATA;
     wire [C_M_AXI_DATA_WIDTH/8-1:0]      M_AXI_WSTRB;
     wire                                 M_AXI_WLAST;
     wire [C_M_AXI_WUSER_WIDTH-1:0]       M_AXI_WUSER;
     wire                                 M_AXI_WVALID;
      wire                                 M_AXI_WREADY;
    
    // Master Interface Write Response
      wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_BID;
      wire [2-1:0]                         M_AXI_BRESP;
      wire [C_M_AXI_BUSER_WIDTH-1:0]       M_AXI_BUSER;
      wire                                 M_AXI_BVALID;
     wire                                 M_AXI_BREADY;
    
    // Master Interface Read Address
     wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_ARID;
     wire [C_M_AXI_ADDR_WIDTH-1:0]        M_AXI_ARADDR;
     wire [4-1:0]                         M_AXI_ARLEN;
     wire [3-1:0]                         M_AXI_ARSIZE;
     wire [2-1:0]                         M_AXI_ARBURST;
     wire [2-1:0]                         M_AXI_ARLOCK;
     wire [4-1:0]                         M_AXI_ARCACHE;
     wire [3-1:0]                         M_AXI_ARPROT;
     wire [4-1:0]                         M_AXI_ARQOS;
     wire [C_M_AXI_ARUSER_WIDTH-1:0]      M_AXI_ARUSER;
     wire                                 M_AXI_ARVALID;
      wire                                 M_AXI_ARREADY;
    
    // Master Interface Read Data 
      wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_RID;
      wire [C_M_AXI_DATA_WIDTH-1:0]        M_AXI_RDATA;
      wire [2-1:0]                         M_AXI_RRESP;
      wire                                 M_AXI_RLAST;
      wire [C_M_AXI_RUSER_WIDTH-1:0]       M_AXI_RUSER;
      wire                                 M_AXI_RVALID;
     wire                                 M_AXI_RREADY;
// ******************************************************************
// Internal variables - Regs, Wires and LocalParams
// ******************************************************************
  wire                                       rnext;

  // A fancy terminal counter, using extra bits to reduce decode logic
  localparam integer C_WLEN_COUNT_WIDTH = `C_LOG_2(C_M_AXI_WR_BURST_LEN-2)+2;
  reg [C_WLEN_COUNT_WIDTH-1:0]                wlen_count; 
  
  // Local address counters
  reg [C_OFFSET_WIDTH-1:0]                    araddr_offset ;
  reg [C_OFFSET_WIDTH-1:0]                    awaddr_offset ;

  // Example user application signals
  reg                                         read_mismatch;
  reg                                         error_reg;
  reg [C_M_AXI_DATA_WIDTH :0]                 wdata; //optimized for example design
  
  // Interface response error flags
  wire                                        write_resp_error;
  wire                                        read_resp_error; 

  // AXI4 temp signals
  reg                                         awvalid;
  wire                                        wlast;
  reg                                         wvalid;
  reg                                         bready;
  reg                                         arvalid; 
  reg                                         rready;   
  
  wire                                        wnext;

  reg  [C_M_AXI_ADDR_WIDTH-1:0]               wr_addr_d;
  reg                                         wr_req_d; 

  wire                                        wburst_ready;
  wire [4-1:0]                                wburst_len;
  reg  [4-1:0]                                wburst_len_d;
  wire                                        wburst_len_push;

  always @(posedge ACLK)
  begin
    if (ARESETN && wr_req)
    begin
      wr_addr_d <= wr_addr;
    end
    else if (ARESETN == 0)
    begin
      wr_addr_d <= 0;
    end
  end

  always @(posedge ACLK)
  begin
    if (ARESETN && wr_req)
    begin
      wr_req_d <= 1'b1;
    end
    else
    begin
      wr_req_d <= 0;
    end
  end
parameter AXI_BUS_WIDTH = C_M_AXI_THREAD_ID_WIDTH+C_M_AXI_ADDR_WIDTH+4+3+2+2+4+3+4+C_M_AXI_AWUSER_WIDTH+1+1+C_M_AXI_THREAD_ID_WIDTH+C_M_AXI_DATA_WIDTH+(C_M_AXI_DATA_WIDTH/8)+1+C_M_AXI_WUSER_WIDTH+1+1+C_M_AXI_THREAD_ID_WIDTH+2+C_M_AXI_BUSER_WIDTH+1+1+C_M_AXI_THREAD_ID_WIDTH+C_M_AXI_ADDR_WIDTH+4+3+2+2+4+3+4+C_M_AXI_ARUSER_WIDTH+1+1+C_M_AXI_THREAD_ID_WIDTH+C_M_AXI_DATA_WIDTH+2+1+C_M_AXI_RUSER_WIDTH+1+1;
wire [AXI_BUS_WIDTH-1:0] pipeline_in,pipeline_out;
assign pipeline_in = {M_AXI_AWID,M_AXI_AWADDR,M_AXI_AWLEN,M_AXI_AWSIZE,M_AXI_AWBURST,M_AXI_AWLOCK,M_AXI_AWCACHE,M_AXI_AWPROT,M_AXI_AWQOS,M_AXI_AWUSER,M_AXI_AWVALID,MASTER_AXI_AWREADY,M_AXI_WID,M_AXI_WDATA,M_AXI_WSTRB,M_AXI_WLAST,M_AXI_WUSER,M_AXI_WVALID,MASTER_AXI_WREADY,MASTER_AXI_BID,MASTER_AXI_BRESP,MASTER_AXI_BUSER,MASTER_AXI_BVALID,M_AXI_BREADY,M_AXI_ARID,M_AXI_ARADDR,M_AXI_ARLEN,M_AXI_ARSIZE,M_AXI_ARBURST,M_AXI_ARLOCK,M_AXI_ARCACHE,M_AXI_ARPROT,M_AXI_ARQOS,M_AXI_ARUSER,M_AXI_ARVALID,MASTER_AXI_ARREADY,MASTER_AXI_RID,MASTER_AXI_RDATA,MASTER_AXI_RRESP,MASTER_AXI_RLAST,MASTER_AXI_RUSER,MASTER_AXI_RVALID,M_AXI_RREADY};
assign  {MASTER_AXI_AWID,MASTER_AXI_AWADDR,MASTER_AXI_AWLEN,MASTER_AXI_AWSIZE,MASTER_AXI_AWBURST,MASTER_AXI_AWLOCK,MASTER_AXI_AWCACHE,MASTER_AXI_AWPROT,MASTER_AXI_AWQOS,MASTER_AXI_AWUSER,MASTER_AXI_AWVALID,M_AXI_AWREADY,MASTER_AXI_WID,MASTER_AXI_WDATA,MASTER_AXI_WSTRB,MASTER_AXI_WLAST,MASTER_AXI_WUSER,MASTER_AXI_WVALID,M_AXI_WREADY,M_AXI_BID,M_AXI_BRESP,M_AXI_BUSER,M_AXI_BVALID,MASTER_AXI_BREADY,MASTER_AXI_ARID,MASTER_AXI_ARADDR,MASTER_AXI_ARLEN,MASTER_AXI_ARSIZE,MASTER_AXI_ARBURST,MASTER_AXI_ARLOCK,MASTER_AXI_ARCACHE,MASTER_AXI_ARPROT,MASTER_AXI_ARQOS,MASTER_AXI_ARUSER,MASTER_AXI_ARVALID,M_AXI_ARREADY,M_AXI_RID,M_AXI_RDATA,M_AXI_RRESP,M_AXI_RLAST,M_AXI_RUSER,M_AXI_RVALID,MASTER_AXI_RREADY} = pipeline_out;
pipeline #(
        .NUM_BITS	( AXI_BUS_WIDTH	),
        .NUM_STAGES	( `AXI_PIPELINE_STAGES	)
        
    ) mem_pipeline_outputs(
    
        .clk		(	ACLK		),
        .rstn		(	ARESETN		),
        
        .data_in	(	pipeline_in ),
        .data_out	(	pipeline_out)
        
        );

//--------------------------------------------------------------
wire rd_req_buf_pop, rd_req_buf_push;
wire rd_req_buf_empty, rd_req_buf_full;
wire [C_M_AXI_ADDR_WIDTH+TX_SIZE_WIDTH-1:0] rd_req_buf_data_in, rd_req_buf_data_out;
wire [TX_SIZE_WIDTH-1:0]             rx_req_size_buf;
wire [C_M_AXI_ADDR_WIDTH-1:0]        rx_addr_buf;
reg  [TX_SIZE_WIDTH-1:0] rx_size;
reg rd_req_buf_pop_d;
assign rd_req_buf_pop       = rx_size == 0 && !rd_req_buf_empty && !rd_req_buf_pop_d;
assign rd_req_buf_push      = rd_req;
assign rd_req_buf_data_in   = {rd_req_size, rd_addr};
assign {rx_req_size_buf, rx_addr_buf} = rd_req_buf_data_out;


always @(posedge ACLK)
begin
  if (ARESETN)
    rd_req_buf_pop_d <= rd_req_buf_pop;
  else
    rd_req_buf_pop_d <= 0;
end

  fifo #(
    .DATA_WIDTH             ( C_M_AXI_ADDR_WIDTH + TX_SIZE_WIDTH ),
    .ADDR_WIDTH             ( 5                   )
  ) rd_req_buf (
    .clk                    ( ACLK                ), //input
    .reset                  ( !ARESETN            ), //input
    .pop                    ( rd_req_buf_pop      ), //input
    .data_out               ( rd_req_buf_data_out ), //output
    .empty                  ( rd_req_buf_empty    ), //output
    .push                   ( rd_req_buf_push     ), //input
    .data_in                ( rd_req_buf_data_in  ), //input
    .full                   ( rd_req_buf_full     )  //output
  );
//--------------------------------------------------------------
   

   // READs
   
   //wire [4-1:0] arlen = (rx_size >= 16) ? 15: (rx_size >= 8) ? 7 : (rx_size >= 4) ? 3 : (rx_size >= 2) ? 1 : 0;
   wire [4-1:0] arlen = (rx_size >= 16) ? 15: (rx_size != 0) ? (rx_size-1) : 0;
   // reg  [4-1:0] arlen_d;

   always @(posedge ACLK)
   begin
       if (ARESETN == 0)
           rx_size <= 0;
       //else if (rd_req)
       //    rx_size <= rx_size + rd_req_size;
       else if (rd_req_buf_pop_d)
           rx_size <= rx_size + rx_req_size_buf;
       else if (arvalid && M_AXI_ARREADY)
           rx_size <= rx_size - arlen - 1;
   end

   // always @(posedge ACLK)
   // begin
       // if (ARESETN == 0)
           // arlen_d <= 0;
       // else if (arvalid && M_AXI_ARREADY)
           // arlen_d <= arlen;
   // end

   
/////////////////
//I/O Connections
/////////////////
//////////////////// 
//Write Address (AW)
////////////////////

// Single threaded   
assign M_AXI_AWID = 'b0;   

// The AXI address is a concatenation of the target base address + active offset range
//assign M_AXI_AWADDR = {C_M_AXI_WRITE_TARGET[C_M_AXI_ADDR_WIDTH-1:C_OFFSET_WIDTH],awaddr_offset};
assign M_AXI_AWADDR = {wr_addr_d[C_M_AXI_ADDR_WIDTH-1:C_OFFSET_WIDTH],awaddr_offset};

//Burst LENgth is number of transaction beats, minus 1
reg  [4-1:0] awlen;
assign M_AXI_AWLEN = awlen;

// Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
assign M_AXI_AWSIZE = `C_LOG_2(C_M_AXI_DATA_WIDTH/8);

// INCR burst type is usually used, except for keyhole bursts
assign M_AXI_AWBURST = 2'b01;
assign M_AXI_AWLOCK = 2'b00;

// Not Allocated, Modifiable and Bufferable
assign M_AXI_AWCACHE = 4'b0011;
assign M_AXI_AWPROT = 3'h0;
assign M_AXI_AWQOS = 4'h0;

//Set User[0] to 1 to allow Zynq coherent ACP transactions   
assign M_AXI_AWUSER = 'b1;
assign M_AXI_AWVALID = awvalid;

///////////////
//Write Data(W)
///////////////
//assign M_AXI_WDATA = wdata;

//All bursts are complete and aligned in this example
assign M_AXI_WID = 'b0;
assign M_AXI_WSTRB = {(C_M_AXI_DATA_WIDTH/8){1'b1}};
assign M_AXI_WLAST = wlast;
assign M_AXI_WUSER = 'b0;
assign M_AXI_WVALID = wvalid;

////////////////////
//Write Response (B)
////////////////////
assign M_AXI_BREADY = bready;

///////////////////   
//Read Address (AR)
///////////////////
assign M_AXI_ARID = 'b0;   
//assign M_AXI_ARADDR = {C_M_AXI_READ_TARGET[C_M_AXI_ADDR_WIDTH-1:C_OFFSET_WIDTH],araddr_offset};
assign M_AXI_ARADDR = {rx_addr_buf[C_M_AXI_ADDR_WIDTH-1:C_OFFSET_WIDTH], araddr_offset};

//Burst LENgth is number of transaction beats, minus 1
//assign M_AXI_ARLEN = C_M_AXI_RD_BURST_LEN - 1;
//assign M_AXI_ARLEN = 11;
assign M_AXI_ARLEN = arlen;

// Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
assign M_AXI_ARSIZE = `C_LOG_2(C_M_AXI_DATA_WIDTH/8);

// INCR burst type is usually used, except for keyhole bursts
assign M_AXI_ARBURST = 2'b01;
assign M_AXI_ARLOCK = 2'b00;
   
// Not Allocated, Modifiable and Bufferable
//assign M_AXI_ARCACHE = 4'b0011;
assign M_AXI_ARCACHE = 4'b1111;
assign M_AXI_ARPROT = 3'h0;
assign M_AXI_ARQOS = 4'h0;

//Set User[0] to 1 to allow Zynq coherent ACP transactions     
assign M_AXI_ARUSER = 'b1;
assign M_AXI_ARVALID = arvalid;

////////////////////////////
//Read and Read Response (R)
////////////////////////////
assign M_AXI_RREADY = rready;

////////////////////
//Example design I/O
////////////////////
//assign ERROR = error_reg;
//
////////////////////////////////////////////////
//Reset logic, workaround for AXI_BRAM CR#582705
////////////////////////////////////////////////  
reg aresetn_r  ;
reg aresetn_r1 ;
reg aresetn_r2 ;
reg aresetn_r3 ;
reg aresetn_r4 ;

always @(posedge ACLK) 
begin
   aresetn_r    <= ARESETN;
   aresetn_r1   <= aresetn_r;
   aresetn_r2   <= aresetn_r1;
   aresetn_r3   <= aresetn_r2;
   aresetn_r4   <= aresetn_r3;
end

///////////////////////
//Write Address Channel
///////////////////////
/*
 The purpose of the write address channel is to request the address and 
 command information for the entire transaction.  It is a single beat
 of data for each burst.
 
 The AXI4 Write address channel in this example will continue to initiate
 write commands as fast as it is allowed by the slave/interconnect.
 
 The address will be incremented on each accepted address transaction,
 until wrapping on the C_OFFSET_WIDTH boundary with awaddr_offset.
 */

//always @(posedge ACLK)
//begin
//  if (aresetn_r4 == 0)
//    awlen <= 0;
//  else if (wburst_ready)
//    awlen <= wburst_len;
//end


wire wr_req_buf_push;
wire wr_req_buf_pop;
reg wr_req_buf_pop_d;
wire wr_req_buf_empty, wr_req_buf_full;
wire [4-1:0] wr_req_buf_data_in, wr_req_buf_data_out;

//assign wr_req_buf_push = wburst_ready;
assign wr_req_buf_push = M_AXI_AWREADY && M_AXI_AWVALID;
assign wr_req_buf_pop  = !wvalid && !wr_req_buf_empty;
assign wr_req_buf_data_in = wburst_len;
//assign awlen = wr_req_buf_data_out;

// always @(posedge ACLK)
// begin
  // if (ARESETN == 0)
    // wburst_len_d <= 0;
  // else if (wburst_len_push)
    // wburst_len_d <= wburst_len;
// end

// always @(posedge ACLK)
// begin
  // if (ARESETN == 0)
    // wr_req_buf_pop_d <= 0;
  // else
    // wr_req_buf_pop_d <= wr_req_buf_pop;
// end

fifo #(
  .DATA_WIDTH             ( 4                   ),
  .ADDR_WIDTH             ( 5                   )
) wr_req_buf (
  .clk                    ( ACLK                ), //input
  .reset                  ( !ARESETN            ), //input
  .pop                    ( wr_req_buf_pop      ), //input
  .data_out               ( wr_req_buf_data_out ), //output
  .empty                  ( wr_req_buf_empty    ), //output
  .push                   ( wr_req_buf_push     ), //input
  .data_in                ( wr_req_buf_data_in  ), //input
  .full                   ( wr_req_buf_full     )  //output
);

wire ax_wr_req = wburst_ready;

reg write_state, write_state_d;
always @(posedge ACLK)
begin
  if (ARESETN == 0)
    write_state_d <= 0;
  else
    write_state_d <= write_state;
end

always @(posedge ACLK)
  if (ARESETN == 0)
    awlen <= 0;
  else
    awlen <= wburst_len;


always @(posedge ACLK)
begin
  if (ARESETN == 0)
    write_state <= 0;
  else if (M_AXI_AWVALID && M_AXI_AWREADY)
    write_state <= 1;
  else if (wnext && wlast)
    write_state <= 0;
end

wire wburst_issued;
assign wburst_issued = (write_state_d == 0) && (write_state == 1);
reg [4-1:0] wburst_issued_len;
always @(posedge ACLK)
begin
  if (ARESETN == 0)
    wburst_issued_len <= 0;
  else if (M_AXI_AWVALID && M_AXI_AWREADY)
    wburst_issued_len <= M_AXI_AWLEN;
end


always @(posedge ACLK)
  begin
     if (aresetn_r4 == 0 )
       awvalid <= 1'b0; 
     //else if (C_M_AXI_SUPPORTS_WRITE && !awvalid && (outBuf_count >= C_M_AXI_WR_BURST_LEN))
     else if (C_M_AXI_SUPPORTS_WRITE && !awvalid && ax_wr_req && !write_state)
     begin
       awvalid <= 1'b1;
     end
     else if (M_AXI_AWREADY && awvalid)
     begin
       awvalid <= 1'b0; 
     end
     else
       awvalid <= awvalid;    
  end
   
// Next address after AWREADY indicates previous address acceptance
always @(posedge ACLK)
begin
     if (ARESETN == 0)
       awaddr_offset <= 'b0;
     else if (wr_req_d)
       awaddr_offset <= wr_addr_d;
     else if (M_AXI_AWREADY && awvalid)
       //awaddr_offset <= awaddr_offset + C_M_AXI_WR_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
       //awaddr_offset <= awaddr_offset + 4*(C_M_AXI_WR_BURST_LEN * C_M_AXI_DATA_WIDTH/8);
       awaddr_offset <= awaddr_offset + NUM_AXI*C_M_AXI_RD_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
     else
       awaddr_offset <= awaddr_offset;
end
   
////////////////////
//Write Data Channel
////////////////////
/* 
 The write data will continually try to push write data across the interface.

 The amount of data accepted will depend on the AXI slave and the AXI
 Interconnect settings, such as if there are FIFOs enabled in interconnect. 
 
 Note that there is no explicit timing relationship to the write address channel.
 The write channel has its own throttling flag, separate from the AW channel.
  
 Synchronization between the channels must be determined by the user.
 
 The simpliest but lowest performance would be to only issue one address write
 and write data burst at a time.
  
 In this example they are kept in sync by using the same address increment
 and burst sizes. Then the AW and W channels have their transactions measured
 with threshold counters as part of the user logic, to make sure neither 
 channel gets too far ahead of each other. 
 */

// Forward movement occurs when the channel is valid and ready
assign wnext = M_AXI_WREADY & wvalid;

// WVALID logic, similar to the AWVALID always block above
always @(posedge ACLK)
begin
  if (ARESETN == 0)
    wvalid <= 1'b0; 
    //else if (C_M_AXI_SUPPORTS_WRITE && wvalid==0 && (outBuf_count >= C_M_AXI_WR_BURST_LEN))
  else if (C_M_AXI_SUPPORTS_WRITE && wr_req_buf_pop)
    wvalid <= 1'b1;
  else if (wnext && wlast)
    wvalid <= 1'b0; 
  else
    wvalid <= wvalid;    
end

//WLAST generation on the MSB of a counter underflow
assign wlast = wlen_count[C_WLEN_COUNT_WIDTH-1];

/* Burst length counter. Uses extra counter register bit to indicate terminal
 count to reduce decode logic */    
always @(posedge ACLK)
begin
  if (ARESETN == 0)// || (wnext && wlen_count[C_WLEN_COUNT_WIDTH-1]))
    wlen_count <= C_M_AXI_WR_BURST_LEN - 2'd2;
  //else if (wnext && wlen_count[C_WLEN_COUNT_WIDTH-1])
  else if (M_AXI_AWVALID && M_AXI_AWREADY)
  //else if (wr_req_buf_pop_d)
    wlen_count <= awlen - 1;
  else if (wnext)
    wlen_count <= wlen_count - 1'b1;
  else
    wlen_count <= wlen_count;
end

////////////////////////////
//Write Response (B) Channel
////////////////////////////
/* 
 The write response channel provides feedback that the write has committed
 to memory. BREADY will occur when all of the data and the write address
 has arrived and been accepted by the slave.
 
 The write issuance (number of outstanding write addresses) is started by 
 the Address Write transfer, and is completed by a BREADY/BRESP.
 
 While negating BREADY will eventually throttle the AWREADY signal, 
 it is best not to throttle the whole data channel this way.
 
 The BRESP bit [1] is used indicate any errors from the interconnect or
 slave for the entire write burst. This example will capture the error 
 into the ERROR output. 
 */

//Always accept write responses
always @(posedge ACLK)
  begin
     if (ARESETN == 0)
       bready <= 1'b0;
      else
       bready <= C_M_AXI_SUPPORTS_WRITE;
 end

//Flag any write response errors   
//assign write_resp_error = bready & M_AXI_BVALID & M_AXI_BRESP[1];

//-----------------------------------------------//
//  READ - BEGIN
//-----------------------------------------------//

assign rnext    = ARESETN & M_AXI_RVALID  & M_AXI_RREADY;

//////////////////////   
//Read Address Channel
//////////////////////
//Generate ARVALID
always @(posedge ACLK) 
begin
    if (ARESETN == 0)
    begin
        arvalid <= 1'b0;
    end
    else if (arvalid && M_AXI_ARREADY)
    begin
        arvalid <= 1'b0;
    end
    else if (C_M_AXI_SUPPORTS_READ && rx_size != 0)
    begin
        arvalid <= 1'b1;
    end
    else
    begin
        arvalid <= arvalid;
    end
end

always @(posedge ACLK) 
begin
    if (ARESETN == 0)
    begin
        araddr_offset  <= 'b0;
    end
    else if (rd_req_buf_pop_d)
    begin
      araddr_offset <= rx_addr_buf;
    end
    else if (arvalid && M_AXI_ARREADY)
    begin
        //araddr_offset <= araddr_offset + C_M_AXI_RD_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
        // 1xAXI
        // araddr_offset <= araddr_offset + ((arlen+1) << `C_LOG_2(C_M_AXI_DATA_WIDTH/8));
        // 4xAXI = 16*8*4 = 'd512 = 'h200
        araddr_offset <= araddr_offset + NUM_AXI*C_M_AXI_RD_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
    end
    else if (C_M_AXI_SUPPORTS_READ && rx_size != 0)
    begin
        araddr_offset <= araddr_offset;
    end
    else
    begin
        araddr_offset <= araddr_offset;
    end
end

//////////////////////////////////   
//Read Data (and Response) Channel
//////////////////////////////////
always @(posedge ACLK)
begin
    if (ARESETN == 0)
        rready <= 1'b0;
    else
        rready <= (C_M_AXI_SUPPORTS_READ == 1) && !inBuf_full;
end

//-----------------------------------------------//
//  Data Fifo Control
//-----------------------------------------------//
assign outBuf_pop    = wnext;
assign inBuf_push    = rnext;
assign data_to_inBuf = M_AXI_RDATA;
assign M_AXI_WDATA   = data_from_outBuf;
//-----------------------------------------------//

// ******************************************************************
// WBURST Counter
// ******************************************************************

wburst_counter #(
  .WBURST_COUNTER_LEN         ( 16                        ),
  .WBURST_LEN                 ( 4                         ),
  .MAX_BURST_LEN              ( C_M_AXI_WR_BURST_LEN      )
) wburst_C (
  .clk                        ( ACLK                      ),
  .resetn                     ( ARESETN                   ),
  .write_valid                ( write_valid               ),
  .write_flush                ( wr_flush                  ),
  .wburst_len                 ( wburst_len                ),
  .wburst_len_push            ( wburst_len_push           ),
  .wburst_ready               ( wburst_ready              ),

  .wburst_issued              ( wburst_issued             ),
  .wburst_issued_len          ( wburst_issued_len         )
);
// ******************************************************************


endmodule
