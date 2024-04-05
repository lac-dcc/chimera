`timescale 1ns/1ps
`define SIMULATION 1
`include "log.vh"
`include "config.vh"
module tabla_wrapper_tb;
// ******************************************************************
// Localparams
// ******************************************************************
    localparam numPu = `NUM_PU;
  localparam numPe = `NUM_PE;
  localparam integer PERF_CNTR_WIDTH   = 10;
  localparam integer AXIM_DATA_WIDTH   = 64;
  localparam integer AXIM_ADDR_WIDTH   = 32;
  localparam integer AXIS_DATA_WIDTH   = 32;
  localparam integer AXIS_ADDR_WIDTH   = 32;
  localparam integer RD_BUF_ADDR_WIDTH = 8;
  localparam integer NUM_AXI           = 4;
  localparam integer DATA_WIDTH        = 16;
  localparam integer NUM_DATA          = AXIM_DATA_WIDTH*NUM_AXI/DATA_WIDTH;
  localparam integer NUM_PE            = numPu*numPe;
  localparam integer VERBOSITY         = 2;
  localparam integer NAMESPACE_WIDTH   = 2;
  localparam integer TX_SIZE_WIDTH     = 12;
  localparam integer TEST_NUM_READS    = 5;

  

  localparam integer RD_BUF_DATA_WIDTH    = DATA_WIDTH * NUM_DATA / NUM_AXI;
  localparam integer WSTRB_WIDTH          = (RD_BUF_DATA_WIDTH/8) * NUM_AXI;
  localparam integer RD_IF_DATA_WIDTH     = DATA_WIDTH * NUM_DATA;
  localparam integer CTRL_PE_WIDTH        = (`C_LOG_2(NUM_PE/NUM_DATA) + 1) 
                                            * NUM_DATA + NAMESPACE_WIDTH;
  localparam integer SHIFTER_CTRL_WIDTH   = `C_LOG_2(NUM_DATA);
  localparam integer NUM_OPS              = 4;
  localparam integer OP_CODE_WIDTH        = `C_LOG_2 (NUM_OPS);
  localparam integer CTRL_BUF_DATA_WIDTH  = CTRL_PE_WIDTH + 
                                            SHIFTER_CTRL_WIDTH +
                                            OP_CODE_WIDTH;
  localparam integer PE_ID_WIDTH          = `C_LOG_2 (NUM_PE/NUM_DATA);
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
  reg                             ACLK;
  reg                             ARESETN;

  // WRITE from BRAM to DDR
  wire [NUM_AXI-1:0]              outBuf_empty;
  wire [NUM_AXI-1:0]              outBuf_pop;
  wire [RD_IF_DATA_WIDTH-1:0]     data_from_outBuf;

  // READ from DDR to BRAM
  wire [RD_IF_DATA_WIDTH-1:0]     data_to_inBuf;
  wire [NUM_AXI-1:0]              inBuf_push;
  wire [NUM_AXI-1:0]              inBuf_full;

  // TXN REQ
  wire [NUM_AXI-1:0]              rx_req;
  wire [NUM_AXI*TX_SIZE_WIDTH-1:0]rx_req_size;
  wire [NUM_AXI-1:0]              rx_done;
  wire [NUM_AXI*32-1:0]           rx_addr;

  wire [32*NUM_AXI-1:0]           S_AXI_ARADDR;
  wire [2*NUM_AXI-1:0]            S_AXI_ARBURST;
  wire [4*NUM_AXI-1:0]            S_AXI_ARCACHE;
  wire [6*NUM_AXI-1:0]            S_AXI_ARID;
  wire [4*NUM_AXI-1:0]            S_AXI_ARLEN;
  wire [2*NUM_AXI-1:0]            S_AXI_ARLOCK;
  wire [3*NUM_AXI-1:0]            S_AXI_ARPROT;
  wire [4*NUM_AXI-1:0]            S_AXI_ARQOS;
  wire [1*NUM_AXI-1:0]            S_AXI_ARUSER;
  wire [NUM_AXI-1:0]              S_AXI_ARREADY;
  wire [3*NUM_AXI-1:0]            S_AXI_ARSIZE;
  wire [NUM_AXI-1:0]              S_AXI_ARVALID;
  wire [32*NUM_AXI-1:0]           S_AXI_AWADDR;
  wire [2*NUM_AXI-1:0]            S_AXI_AWBURST;
  wire [4*NUM_AXI-1:0]            S_AXI_AWCACHE;
  wire [6*NUM_AXI-1:0]            S_AXI_AWID;
  wire [4*NUM_AXI-1:0]            S_AXI_AWLEN;
  wire [2*NUM_AXI-1:0]            S_AXI_AWLOCK;
  wire [3*NUM_AXI-1:0]            S_AXI_AWPROT;
  wire [4*NUM_AXI-1:0]            S_AXI_AWQOS;
  wire [1*NUM_AXI-1:0]            S_AXI_AWUSER;
  wire [NUM_AXI-1:0]              S_AXI_AWREADY;
  wire [3*NUM_AXI-1:0]            S_AXI_AWSIZE;
  wire [NUM_AXI-1:0]              S_AXI_AWVALID;
  wire [6*NUM_AXI-1:0]            S_AXI_BID;
  wire [1*NUM_AXI-1:0]            S_AXI_BUSER;
  wire [NUM_AXI-1:0]              S_AXI_BREADY;
  wire [2*NUM_AXI-1:0]            S_AXI_BRESP;
  wire [NUM_AXI-1:0]              S_AXI_BVALID;
  wire [RD_IF_DATA_WIDTH-1:0]     S_AXI_RDATA;
  wire [6*NUM_AXI-1:0]            S_AXI_RID;
  wire [1*NUM_AXI-1:0]            S_AXI_RUSER;
  wire [NUM_AXI-1:0]              S_AXI_RLAST;
  wire [NUM_AXI-1:0]              S_AXI_RREADY;
  wire [2*NUM_AXI-1:0]            S_AXI_RRESP;
  wire [NUM_AXI-1:0]              S_AXI_RVALID;
  wire [RD_IF_DATA_WIDTH-1:0]     S_AXI_WDATA;
  wire [6*NUM_AXI-1:0]            S_AXI_WID;
  wire [1*NUM_AXI-1:0]            S_AXI_WUSER;
  wire [NUM_AXI-1:0]              S_AXI_WLAST;
  wire [NUM_AXI-1:0]              S_AXI_WREADY;
  wire [WSTRB_WIDTH-1:0]          S_AXI_WSTRB;
  wire [NUM_AXI-1:0]              S_AXI_WVALID;

  wire [AXIS_ADDR_WIDTH-1:0]      M_AXI_GP0_awaddr;
  wire [2:0]                      M_AXI_GP0_awprot;
  wire                            M_AXI_GP0_awready;
  wire                            M_AXI_GP0_awvalid;
  wire [AXIS_DATA_WIDTH-1:0]      M_AXI_GP0_wdata;
  wire [AXIS_DATA_WIDTH/8-1:0]    M_AXI_GP0_wstrb;
  wire                            M_AXI_GP0_wvalid;
  wire                            M_AXI_GP0_wready;
  wire [1:0]                      M_AXI_GP0_bresp;
  wire                            M_AXI_GP0_bvalid;
  wire                            M_AXI_GP0_bready;
  wire [AXIS_ADDR_WIDTH-1:0]      M_AXI_GP0_araddr;
  wire [2:0]                      M_AXI_GP0_arprot;
  wire                            M_AXI_GP0_arvalid;
  wire                            M_AXI_GP0_arready;
  wire [AXIS_DATA_WIDTH-1:0]      M_AXI_GP0_rdata;
  wire [1:0]                      M_AXI_GP0_rresp;
  wire                            M_AXI_GP0_rvalid;
  wire                            M_AXI_GP0_rready;

  integer                         num_instructions;

// ******************************************************************

// ******************************************************************
// AXI Slave driver
// ******************************************************************
axi_slave_tb_driver
#(
  .PERF_CNTR_WIDTH            ( PERF_CNTR_WIDTH       ),
  .AXIS_DATA_WIDTH            ( AXIS_DATA_WIDTH       ),
  .AXIS_ADDR_WIDTH            ( AXIS_ADDR_WIDTH       ),
  .VERBOSITY                  ( 2             )
) u_axis_driver (
  .start		      (	ARESETN		      ),
  .tx_done                    (                       ), //output 
  .rd_done                    (                       ), //output 
  .wr_done                    (                       ), //output 
  .processing_done            (                       ), //output 
  .total_cycles               (                       ), //output 
  .rd_cycles                  (                       ), //output 
  .pr_cycles                  (                       ), //output 
  .wr_cycles                  (                       ), //output 
  .S_AXI_ACLK                 ( ACLK                  ), //output 
  .S_AXI_ARESETN              ( ARESETN               ), //output 
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

// ******************************************************************
// AXI Master driver
// ******************************************************************
genvar gen;
for (gen=0; gen<NUM_AXI; gen=gen+1)
begin : AXI_DRIVERS
  localparam integer wstrb_width = RD_BUF_DATA_WIDTH/8;
  axi_master_tb_driver
  #(
    .AXI_ID                     ( gen                       ),
    .C_M_AXI_DATA_WIDTH         ( RD_BUF_DATA_WIDTH         ),
    .DATA_WIDTH                 ( DATA_WIDTH                ),
    .TX_SIZE_WIDTH              ( TX_SIZE_WIDTH             )
  ) u_axim_driver (
    .ACLK                       ( ACLK                      ),
    .ARESETN                    ( ARESETN                   ),
    .M_AXI_AWID                 ( S_AXI_AWID[6*gen+:6]      ),
    .M_AXI_AWADDR               ( S_AXI_AWADDR[32*gen+:32]  ),
    .M_AXI_AWLEN                ( S_AXI_AWLEN[4*gen+:4]     ),
    .M_AXI_AWSIZE               ( S_AXI_AWSIZE[3*gen+:3]    ),
    .M_AXI_AWBURST              ( S_AXI_AWBURST[2*gen+:2]   ),
    .M_AXI_AWLOCK               ( S_AXI_AWLOCK[2*gen+:2]    ),
    .M_AXI_AWCACHE              ( S_AXI_AWCACHE[4*gen+:4]   ),
    .M_AXI_AWPROT               ( S_AXI_AWPROT[3*gen+:3]    ),
    .M_AXI_AWQOS                ( S_AXI_AWQOS[4*gen+:4]     ),
    .M_AXI_AWUSER               ( S_AXI_AWUSER[gen+:1]      ),
    .M_AXI_AWVALID              ( S_AXI_AWVALID[gen+:1]     ),
    .M_AXI_AWREADY              ( S_AXI_AWREADY[gen+:1]     ),
    .M_AXI_WID                  ( S_AXI_WID[6*gen+:6]       ),
    .M_AXI_WDATA                ( S_AXI_WDATA[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]               ),
    .M_AXI_WSTRB                ( S_AXI_WSTRB[wstrb_width*gen+:wstrb_width]               ),
    .M_AXI_WLAST                ( S_AXI_WLAST[gen+:1]       ),
    .M_AXI_WUSER                ( S_AXI_WUSER[gen+:1]       ),
    .M_AXI_WVALID               ( S_AXI_WVALID[gen+:1]      ),
    .M_AXI_WREADY               ( S_AXI_WREADY[gen+:1]      ),
    .M_AXI_BID                  ( S_AXI_BID[6*gen+:6]       ),
    .M_AXI_BRESP                ( S_AXI_BRESP[2*gen+:2]     ),
    .M_AXI_BUSER                ( S_AXI_BUSER[gen+:1]       ),
    .M_AXI_BVALID               ( S_AXI_BVALID[gen+:1]      ),
    .M_AXI_BREADY               ( S_AXI_BREADY[gen+:1]      ),
    .M_AXI_ARID                 ( S_AXI_ARID[6*gen+:6]      ),
    .M_AXI_ARADDR               ( S_AXI_ARADDR[32*gen+:32]  ),
    .M_AXI_ARLEN                ( S_AXI_ARLEN[4*gen+:4]     ),
    .M_AXI_ARSIZE               ( S_AXI_ARSIZE[3*gen+:3]    ),
    .M_AXI_ARBURST              ( S_AXI_ARBURST[2*gen+:2]   ),
    .M_AXI_ARLOCK               ( S_AXI_ARLOCK[2*gen+:2]    ),
    .M_AXI_ARCACHE              ( S_AXI_ARCACHE[4*gen+:4]   ),
    .M_AXI_ARPROT               ( S_AXI_ARPROT[3*gen+:3]    ),
    .M_AXI_ARQOS                ( S_AXI_ARQOS[4*gen+:4]     ),
    .M_AXI_ARUSER               ( S_AXI_ARUSER[gen+:1]      ),
    .M_AXI_ARVALID              ( S_AXI_ARVALID[gen+:1]     ),
    .M_AXI_ARREADY              ( S_AXI_ARREADY[gen+:1]     ),
    .M_AXI_RID                  ( S_AXI_RID[6*gen+:6]       ),
    .M_AXI_RDATA                ( S_AXI_RDATA[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]               ),
    .M_AXI_RRESP                ( S_AXI_RRESP[2*gen+:2]     ),
    .M_AXI_RLAST                ( S_AXI_RLAST[gen+:1]       ),
    .M_AXI_RUSER                ( S_AXI_RUSER[gen+:1]       ),
    .M_AXI_RVALID               ( S_AXI_RVALID[gen+:1]      ),
    .M_AXI_RREADY               ( S_AXI_RREADY[gen+:1]      ),
    .outBuf_empty               ( outBuf_empty[gen+:1]      ),
    .outBuf_pop                 ( outBuf_pop[gen+:1]        ),
    .data_from_outBuf           ( data_from_outBuf[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]          ),
    .data_to_inBuf              ( data_to_inBuf[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]             ),
    .inBuf_push                 ( inBuf_push[gen+:1]        ),
    .inBuf_full                 ( inBuf_full[gen+:1]        ),
    .rd_req                     ( rx_req[gen+:1]            ),
    .rd_req_size                ( rx_req_size[TX_SIZE_WIDTH*gen+:TX_SIZE_WIDTH]               ),
    .rd_addr                    ( rx_addr[gen*32+:32]                   ),
    .outBuf_count		(				)
    //.rd_done                    ( rx_done[gen]           )
  );
end
// ******************************************************************

// ******************************************************************
// Read Interface
// ******************************************************************
tabla_wrapper #(
  .AXIS_DATA_WIDTH        ( AXIS_DATA_WIDTH       ),
  .AXIS_ADDR_WIDTH        ( AXIS_ADDR_WIDTH       ),
  .DATA_WIDTH             ( DATA_WIDTH            ),
  .AXIM_DATA_WIDTH        ( AXIM_DATA_WIDTH       ),
  .RD_BUF_ADDR_WIDTH      ( RD_BUF_ADDR_WIDTH     ),
  //.NUM_DATA               ( NUM_DATA              ),
  .NUM_PE                 ( NUM_PE                ),
  .NUM_AXI                ( NUM_AXI               ),
  .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH         )
) u_tabla_wrapper (
  .ACLK                   ( ACLK                  ), //input
  .ARESETN                ( ARESETN               ), //input
  
  .S_AXI_ARADDR           ( S_AXI_ARADDR          ), //output
  .S_AXI_ARBURST          ( S_AXI_ARBURST         ), //output
  .S_AXI_ARCACHE          ( S_AXI_ARCACHE         ), //output
  .S_AXI_ARID             ( S_AXI_ARID            ), //output
  .S_AXI_ARLEN            ( S_AXI_ARLEN           ), //output
  .S_AXI_ARLOCK           ( S_AXI_ARLOCK          ), //output
  .S_AXI_ARPROT           ( S_AXI_ARPROT          ), //output
  .S_AXI_ARQOS            ( S_AXI_ARQOS           ), //output
  .S_AXI_ARUSER           ( S_AXI_ARUSER          ), //output
  .S_AXI_ARREADY          ( S_AXI_ARREADY         ), //input
  .S_AXI_ARSIZE           ( S_AXI_ARSIZE          ), //output
  .S_AXI_ARVALID          ( S_AXI_ARVALID         ), //output
  .S_AXI_AWADDR           ( S_AXI_AWADDR          ), //output
  .S_AXI_AWBURST          ( S_AXI_AWBURST         ), //output
  .S_AXI_AWCACHE          ( S_AXI_AWCACHE         ), //output
  .S_AXI_AWID             ( S_AXI_AWID            ), //output
  .S_AXI_AWLEN            ( S_AXI_AWLEN           ), //output
  .S_AXI_AWLOCK           ( S_AXI_AWLOCK          ), //output
  .S_AXI_AWPROT           ( S_AXI_AWPROT          ), //output
  .S_AXI_AWQOS            ( S_AXI_AWQOS           ), //output
  .S_AXI_AWUSER           ( S_AXI_AWUSER          ), //output
  .S_AXI_AWREADY          ( S_AXI_AWREADY         ), //input
  .S_AXI_AWSIZE           ( S_AXI_AWSIZE          ), //output
  .S_AXI_AWVALID          ( S_AXI_AWVALID         ), //output
  .S_AXI_BID              ( S_AXI_BID             ), //input
  .S_AXI_BUSER            ( S_AXI_BUSER           ), //input
  .S_AXI_BREADY           ( S_AXI_BREADY          ), //output
  .S_AXI_BRESP            ( S_AXI_BRESP           ), //input
  .S_AXI_BVALID           ( S_AXI_BVALID          ), //input
  .S_AXI_RDATA            ( S_AXI_RDATA           ), //input
  .S_AXI_RID              ( S_AXI_RID             ), //input
  .S_AXI_RUSER            ( S_AXI_RUSER           ), //input
  .S_AXI_RLAST            ( S_AXI_RLAST           ), //input
  .S_AXI_RREADY           ( S_AXI_RREADY          ), //output
  .S_AXI_RRESP            ( S_AXI_RRESP           ), //input
  .S_AXI_RVALID           ( S_AXI_RVALID          ), //input
  .S_AXI_WDATA            ( S_AXI_WDATA           ), //output
  .S_AXI_WID              ( S_AXI_WID             ), //output
  .S_AXI_WUSER            ( S_AXI_WUSER           ), //output
  .S_AXI_WLAST            ( S_AXI_WLAST           ), //output
  .S_AXI_WREADY           ( S_AXI_WREADY          ), //input
  .S_AXI_WSTRB            ( S_AXI_WSTRB           ), //output
  .S_AXI_WVALID           ( S_AXI_WVALID          ), //output
  
  .M_AXI_GP0_awaddr       ( M_AXI_GP0_awaddr      ), //input 
  .M_AXI_GP0_awprot       ( M_AXI_GP0_awprot      ), //input 
  .M_AXI_GP0_awready      ( M_AXI_GP0_awready     ), //output 
  .M_AXI_GP0_awvalid      ( M_AXI_GP0_awvalid     ), //input
  .M_AXI_GP0_wdata        ( M_AXI_GP0_wdata       ), //input 
  .M_AXI_GP0_wstrb        ( M_AXI_GP0_wstrb       ), //input 
  .M_AXI_GP0_wvalid       ( M_AXI_GP0_wvalid      ), //input 
  .M_AXI_GP0_wready       ( M_AXI_GP0_wready      ), //output
  .M_AXI_GP0_bresp        ( M_AXI_GP0_bresp       ), //output
  .M_AXI_GP0_bvalid       ( M_AXI_GP0_bvalid      ), //output
  .M_AXI_GP0_bready       ( M_AXI_GP0_bready      ), //input 
  .M_AXI_GP0_araddr       ( M_AXI_GP0_araddr      ), //input 
  .M_AXI_GP0_arprot       ( M_AXI_GP0_arprot      ), //input 
  .M_AXI_GP0_arvalid      ( M_AXI_GP0_arvalid     ), //input 
  .M_AXI_GP0_arready      ( M_AXI_GP0_arready     ), //output
  .M_AXI_GP0_rdata        ( M_AXI_GP0_rdata       ), //output
  .M_AXI_GP0_rresp        ( M_AXI_GP0_rresp       ), //output
  .M_AXI_GP0_rvalid       ( M_AXI_GP0_rvalid      ), //output
  .M_AXI_GP0_rready       ( M_AXI_GP0_rready      )  //input 
);
// ******************************************************************

// ******************************************************************
// TestBench
// ******************************************************************
initial
begin
  $dumpfile("hw-imp/bin/waveform/tabla_wrapper.vcd");
  $dumpvars(0,tabla_wrapper_tb);
end

wire [numPe*numPu-1:0] weight_inv,data_inv,pe_bus_inv,pu_bus_inv,pe_neigh_inv,pu_neigh_inv,bus_out_inv,neigh_out_inv,stall,eoi;
genvar k;
generate
for(k=0;k<numPe*numPu;k=k+1) begin
    assign weight_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.weight_invalid;
    assign data_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.data_invalid;
    assign pe_bus_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.pe_bus_invalid;
    assign pu_bus_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.pu_bus_invalid;
    assign pe_neigh_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.pe_neigh_invalid;
    assign pu_neigh_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.pu_neigh_invalid;
    assign bus_out_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.bus_out_invalid;
    assign neigh_out_inv[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.neigh_out_invalid;
    assign stall[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.stall;
    assign eoi[k] = tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[k/numPe].pu_unit.GEN_PE[k%numPe].genblk1.pe_unit.eoi;
end
endgenerate
wire all_pe_stall;
assign all_pe_stall = (&(stall | eoi))&&(if_controller_state==5);

initial wait(all_pe_stall) begin
   $display("*******Compute Start****************");
//   $finish;
end

integer iterations;
wire [2:0] if_controller_state;
assign if_controller_state = tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.state;
reg finished;
initial 
begin
  $display ("CTRL_BUF_WIDTH = %d", CTRL_BUF_DATA_WIDTH);
  $display("%c[1;34m",27);
  $display("***************************************");
  $display ("Testing Tabla");
  $display("***************************************");
  $display("%c[0m",27);

  // Mem instructions
  //rand_instruction;
  //add_instruction;
  //num_instructions = 28;
  //read_mem_instructions ("hw-imp/include/memory_instructions/meminst_50.txt", num_instructions);
  print_mem_instructions;
   finished=0;
  ACLK = 0;
  ARESETN = 1;
  @(negedge ACLK);
  ARESETN = 0;
  @(negedge ACLK);
  ARESETN = 1;
  iterations = 1;

  u_axis_driver.configure_tabla (iterations, 32'hAABB0000, 8191, 32'hCCDD0000, 8191, 32'hEEFF0000);
  u_axis_driver.start_tabla;
  $display ("Starting %d iterations", iterations);
  //u_axis_driver.test_main;

  wait (if_controller_state == 0);

  repeat (50) begin
    @(negedge ACLK);
  end

  wait (if_controller_state == 0);

  repeat (100) begin
    @(negedge ACLK);
  end

  $display ("Finished %d iterations", iterations);
  finished = 1;
end   
integer cycle_count[0:7];

wire [2:0] state;
assign state = tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.state;
generate
for (genvar i=0; i<8; i=i+1)
begin
    initial begin
        cycle_count[i] = 0;
    end
    always @(posedge ACLK) begin
        if( state == i)
            cycle_count[i] = cycle_count[i] +1;
    end
end
endgenerate

integer cycle_file;

initial wait(finished) begin
    cycle_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/cycle_count.txt","w");
    $fclose(cycle_file);
    cycle_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/cycle_count.txt","a");
    wait(state == 0);
    for (integer i=0; i<8; i=i+1) begin
//    $display("skafk");
    $fwrite(cycle_file,"%d\n",cycle_count[i]);
    end
    $fclose(cycle_file);
end


generate
for (genvar i=0; i<numPu; i=i+1)
begin
    for (genvar j=0; j<numPe; j=j+1)
        begin
//        if( tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[0].pu_unit.GEN_PE[0].genblk1.pe_bus_slave_inst.read_from_bus.empty != 8'hff)
         initial wait(finished) begin
            if(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_bus_slave_inst.read_from_bus.empty != 8'hff)
                $display ("pe buffer not empty", i,j,tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_bus_slave_inst.read_from_bus.empty);
            if(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_unit.pe_neigh_fifo.empty != 1'b1)
                $display ("pe neigh buffer not empty", i,j);
//            if(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_unit.pu_neigh_fifo.empty != 1'b1)
//                $display ("pu neigh buffer not empty", i,j);
           end
           
//        initial wait(tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.state == 5) begin
//         if(j!=0) begin
//         initial wait(finished) begin
//         #10
//         $display (" output weights",i*8+j, $signed(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_unit.pe_namespace_wrapper_unit.genblk1.pe_namespace_unit.weightBuffer.mem[0]),$signed(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_unit.pe_namespace_wrapper_unit.genblk1.pe_namespace_unit.weightBuffer.mem[1]),$signed(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_unit.pe_namespace_wrapper_unit.genblk1.pe_namespace_unit.weightBuffer.mem[2]),$signed(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_unit.GEN_PE[j].genblk1.pe_unit.pe_namespace_wrapper_unit.genblk1.pe_namespace_unit.weightBuffer.mem[3]));
//        end
//   end
           
    end
    initial wait(finished) begin
    if(tabla_wrapper_tb.u_tabla_wrapper.accelerator_unit.GEN_PU[i].pu_bus_slave_inst.read_from_bus.empty != 8'hff)
        $display ("pu buffer not empty", i);
   end
   
   initial wait(finished) begin
        #3000
        if(tabla_wrapper_tb.AXI_DRIVERS[0].u_axim_driver.num_errors == 0
        && tabla_wrapper_tb.AXI_DRIVERS[1].u_axim_driver.num_errors == 0
        && tabla_wrapper_tb.AXI_DRIVERS[2].u_axim_driver.num_errors == 0
        && tabla_wrapper_tb.AXI_DRIVERS[3].u_axim_driver.num_errors == 0) begin
        $display ("*******************************************************************");
        $display ("**************************************TEST PASS********************");
        $display ("*******************************************************************");
        end else begin
        $display ("*******************************************************************");
        $display ("**************************************TEST FAIL********************");
        $display ("*******************************************************************");
        end
        $finish;
   end
end
endgenerate
//  u_axis_driver.test_pass;


initial begin
  #1000000
  u_axis_driver.fail_flag = 1;
end

always #1 ACLK = ~ACLK;

//always @(posedge ACLK)
//begin
//  if (tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.ctrl_buf_read_en)
//  begin
//    $display ("Read Mem Instruction : ");
//    @(negedge ACLK);
//    print_mem_instruction_detail (tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.ctrl_buf_data_out);
//  end
//end

// ******************************************************************

//--------------------------------------------------------------------------------------
task automatic rand_instruction;
  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe;
  reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
  reg  [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;
  reg  [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data_in;
  integer n;
  begin
    for (n=0; n<1000; n=n+1)
    begin
      if (n > 0)
      begin
        ctrl_pe       = {$random, $random};
        ctrl_op_code  = {$random, $random};
        ctrl_shifter  = {$random, $random};
      end
      else begin
        ctrl_pe       = {$random, $random};
        ctrl_op_code  = 0;
        ctrl_shifter  = {$random, $random};
      end
      ctrl_buf_data_in = {ctrl_pe, ctrl_op_code, ctrl_shifter};
//      tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.u_ctrl_buf.mem[n] = ctrl_buf_data_in;
    end
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task automatic print_partition;
  begin
    $display("*************************************************");
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task automatic print_mem_instructions;

  reg  [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data;

  integer n;
  begin

    print_partition;
//    $display ("Mem Instructions are as follows");

    for (n=0; n<num_instructions; n=n+1)
    begin
//      ctrl_buf_data = tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.u_ctrl_buf.mem[n];
      if (ctrl_buf_data[0] !== 1'bx) 
      begin
//        $display ("Index = %h, Data = %h", n, ctrl_buf_data);
        print_mem_instruction_detail(ctrl_buf_data);
//        $display;
      end
    end
//    $display ("Mem Instructions END");
    print_partition;
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task automatic print_mem_instruction_detail;

  input [CTRL_BUF_DATA_WIDTH-1:0] ctrl_buf_data;

  reg   [CTRL_PE_WIDTH-1:0]       ctrl_pe;
  reg   [OP_CODE_WIDTH-1:0]       ctrl_op_code;
  reg   [SHIFTER_CTRL_WIDTH-1:0]  ctrl_shifter;

  reg   [PE_ID_WIDTH-1:0]         pe_id;
  reg                             valid;
  reg                             valid_prev;
  reg   [NAMESPACE_WIDTH-1:0]     namespace_id;

  integer n;

  begin
    {ctrl_pe, ctrl_op_code, ctrl_shifter} = ctrl_buf_data;
    print_op_code(ctrl_op_code);
    $display ("Shift amount = %d", ctrl_shifter);
    $display;
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task automatic print_op_code;

  input  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
  begin
    case (ctrl_op_code)
      0: begin
        $display ("Read Instruction");
      end
      1: begin
        $display ("Shift Instruction");
      end
      2: begin
        $display ("Wait Instruction");
      end
      3: begin
        $display ("Write Instruction");
      end
    endcase
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task automatic read_mem_instructions;
  input [1000*8-1:0]              read_file;
  input integer                   num_instructions;
  reg   [CTRL_BUF_DATA_WIDTH-1:0] rom_init [0:1<<14];
  integer                         rom_read_addr;
  integer                         i;
  begin
    $display ("Reading %0d instructions from file %0s", num_instructions, read_file);
    //$readmemb (read_file, rom_init);
    rom_read_addr = 0;
    for (i=0; i<num_instructions; i=i+1)
    begin
//      tabla_wrapper_tb.u_tabla_wrapper.u_mem_if.u_if_controller.u_ctrl_buf.mem[i] = rom_init[i];
    end
  end
endtask
//--------------------------------------------------------------------------------------

endmodule
