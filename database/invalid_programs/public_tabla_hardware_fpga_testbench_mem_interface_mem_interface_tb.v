`timescale 1ns/1ps
module mem_interface_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer AXI_DATA_WIDTH    = 64;
    parameter integer RD_BUF_ADDR_WIDTH = 8;
    parameter integer NUM_AXI           = 4;
    parameter integer DATA_WIDTH        = 16;
    parameter integer NUM_DATA          = AXI_DATA_WIDTH*NUM_AXI/DATA_WIDTH;
    parameter integer NUM_PE            = 64;
    parameter integer VERBOSITY         = 3;
    parameter integer NAMESPACE_WIDTH   = 2;
    parameter integer TX_SIZE_WIDTH     = 10;
// ******************************************************************

// ******************************************************************
// Localparams
// ******************************************************************
    localparam integer STATE_IDLE           = 0;

    localparam integer WEIGHT_READ          = 1;
    localparam integer WEIGHT_READ_WAIT     = 2;

    localparam integer DATA_READ            = 3;
    localparam integer DATA_READ_WAIT       = 4;

    localparam integer STATE_COMPUTE        = 5;

    localparam integer WEIGHT_WRITE         = 6;
    localparam integer WEIGHT_WRITE_WAIT    = 7;

    localparam integer WEIGHT_COUNTER_WIDTH = 16;

    localparam integer WSTRB_WIDTH          = (RD_BUF_DATA_WIDTH/8) * NUM_AXI;

    localparam integer RD_BUF_DATA_WIDTH    = DATA_WIDTH * NUM_DATA / NUM_AXI;
    localparam integer RD_IF_DATA_WIDTH     = DATA_WIDTH * NUM_DATA;
    localparam integer CTRL_PE_WIDTH        = (`C_LOG_2(NUM_PE/NUM_DATA) + 1) 
                                              * NUM_DATA + NAMESPACE_WIDTH;
    localparam integer SHIFTER_CTRL_WIDTH   = `C_LOG_2(NUM_DATA);
    localparam integer NUM_OPS              = 4;
    localparam integer OP_CODE_WIDTH        = `C_LOG_2 (NUM_OPS);
    localparam integer CTRL_BUF_DATA_WIDTH  = CTRL_PE_WIDTH + 
                                              SHIFTER_CTRL_WIDTH +
                                              OP_CODE_WIDTH;

    localparam integer OP_READ              = 0;
    localparam integer OP_SHIFT             = 1;
    localparam integer OP_WFI               = 2;
    localparam integer OP_WRITE             = 3;
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
  reg                             ACLK;
  reg                             ARESETN;

  wire [31:0]                     M_AXI_GP0_awaddr;
  wire [2:0]                      M_AXI_GP0_awprot;
  wire                            M_AXI_GP0_awvalid;
  wire                            M_AXI_GP0_awready;

  wire [31:0]                     M_AXI_GP0_wdata;
  wire [3:0]                      M_AXI_GP0_wstrb;
  wire                            M_AXI_GP0_wvalid;
  wire                            M_AXI_GP0_wready;

  wire [1:0]                      M_AXI_GP0_bresp;
  wire                            M_AXI_GP0_bvalid;
  wire                            M_AXI_GP0_bready;

  wire [31:0]                     M_AXI_GP0_araddr;
  wire [2:0]                      M_AXI_GP0_arprot;
  wire                            M_AXI_GP0_arvalid;
  wire                            M_AXI_GP0_arready;

  wire [31:0]                     M_AXI_GP0_rdata;
  wire [1:0]                      M_AXI_GP0_rresp;
  wire                            M_AXI_GP0_rvalid;
  wire                            M_AXI_GP0_rready;

  reg                             EOI, EOC;
  wire                            compute_start;
  reg  [NUM_AXI-1:0]              axim_rvalid;
  wire [NUM_AXI-1:0]              axim_rready;
  reg  [RD_IF_DATA_WIDTH   -1:0]  axim_rdata;
  wire [RD_IF_DATA_WIDTH   -1:0]  rdata;
  wire [RD_IF_DATA_WIDTH   -1:0]  wdata;
  wire [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_fifo_data_out;
  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe;
  wire [OP_CODE_WIDTH-1:0]        ctrl_op_code;
  wire [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;

  wire  [RD_IF_DATA_WIDTH   -1:0]  shifter_input;
  assign shifter_input = mem_interface_tb.u_mem_if.rd_buf_data_out;

  reg                             fail_flag;

  integer                         i;
  integer                         n;

  integer                         pe_read_count_expected [ 0 : NUM_PE-1 ];
  integer                         pe_read_count_real     [ 0 : NUM_PE-1 ];

  reg [16-1:0]                    pe_weight_reads_expected [ 0 : NUM_PE-1 ];
  reg [16-1:0]                    pe_weight_reads_real     [ 0 : NUM_PE-1 ];
  integer                         pe_write_count [ 0 : NUM_PE-1 ];
  integer                         weight_read_count [ NUM_PE-1 : 0 ];


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

  // WRITE from BRAM to DDR
  wire [NUM_AXI-1:0]              outBuf_empty;
  wire [NUM_AXI-1:0]              outBuf_pop;
  wire [RD_IF_DATA_WIDTH-1:0]     data_from_outBuf;

  // READ from DDR to BRAM
  wire [RD_IF_DATA_WIDTH-1:0]     data_to_inBuf;
  wire [NUM_AXI-1:0]              inBuf_push;
  wire [NUM_AXI-1:0]              inBuf_full;

  // TXN REQ
  wire [NUM_AXI-1:0]              rd_req;
  wire [NUM_AXI*TX_SIZE_WIDTH-1:0]rd_req_size;
  wire [NUM_AXI*32-1:0]           rd_addr;

  reg  [RD_IF_DATA_WIDTH-1:0]   expected_data_ram [0:4095];

  integer num_instructions, num_wfi_instructions;
  integer max_weight_reads;
// ******************************************************************


// ******************************************************************
// AXI_slave tb driver
// ******************************************************************
axi_slave_tb_driver
#(
    .PERF_CNTR_WIDTH            ( 10                    ),
    .AXIS_DATA_WIDTH            ( 32                    ),
    .AXIS_ADDR_WIDTH            ( 32                    ),
    .VERBOSITY                  ( VERBOSITY             )
) u_axis_driver (
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
    .C_M_AXI_DATA_WIDTH         ( RD_BUF_DATA_WIDTH         ),
    .DATA_WIDTH                 ( DATA_WIDTH                ),
    .TX_SIZE_WIDTH              ( TX_SIZE_WIDTH             ),
    .AXI_ID                     ( gen                       )
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
    .rd_req                     ( rd_req[gen+:1]            ),
    .rd_req_size                ( rd_req_size[TX_SIZE_WIDTH*gen+:TX_SIZE_WIDTH]               ),
    .rd_addr                    ( rd_addr[gen*32+:32]                   )
  );
end
// ******************************************************************

// ******************************************************************
// DUT - MEM Interface
// ******************************************************************
  mem_interface #(
    .DATA_WIDTH             ( DATA_WIDTH            ),
    .RD_BUF_ADDR_WIDTH      ( RD_BUF_ADDR_WIDTH     ),
    .NUM_DATA               ( NUM_DATA              ),
    .NUM_PE                 ( NUM_PE                ),
    .NUM_AXI                ( NUM_AXI               ),
    .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH         )
  ) u_mem_if (
    .ACLK                   ( ACLK                  ), //input
    .ARESETN                ( ARESETN               ), //input

    .M_AXI_GP0_awaddr       ( M_AXI_GP0_awaddr      ),
    .M_AXI_GP0_awprot       ( M_AXI_GP0_awprot      ),
    .M_AXI_GP0_awvalid      ( M_AXI_GP0_awvalid     ),
    .M_AXI_GP0_awready      ( M_AXI_GP0_awready     ),

    .M_AXI_GP0_wdata        ( M_AXI_GP0_wdata       ),
    .M_AXI_GP0_wstrb        ( M_AXI_GP0_wstrb       ),
    .M_AXI_GP0_wvalid       ( M_AXI_GP0_wvalid      ),
    .M_AXI_GP0_wready       ( M_AXI_GP0_wready      ),

    .M_AXI_GP0_bresp        ( M_AXI_GP0_bresp       ),
    .M_AXI_GP0_bvalid       ( M_AXI_GP0_bvalid      ),
    .M_AXI_GP0_bready       ( M_AXI_GP0_bready      ),

    .M_AXI_GP0_araddr       ( M_AXI_GP0_araddr      ),
    .M_AXI_GP0_arprot       ( M_AXI_GP0_arprot      ),
    .M_AXI_GP0_arvalid      ( M_AXI_GP0_arvalid     ),
    .M_AXI_GP0_arready      ( M_AXI_GP0_arready     ),

    .M_AXI_GP0_rdata        ( M_AXI_GP0_rdata       ),
    .M_AXI_GP0_rresp        ( M_AXI_GP0_rresp       ),
    .M_AXI_GP0_rvalid       ( M_AXI_GP0_rvalid      ),
    .M_AXI_GP0_rready       ( M_AXI_GP0_rready      ),

    .compute_start          ( compute_start         ), //output
    .rdata                  ( rdata                 ), //input
    .wdata                  ( wdata                 ), //output
    .EOI                    ( EOI                   ), //input
    .CTRL_PE                ( ctrl_pe               ), //output
    .DATA_IO_DIR            ( DATA_IO_DIR           ), //output

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
    .S_AXI_WVALID           ( S_AXI_WVALID          )  //output
  );
// ******************************************************************


//--------------------------------------------------------------------------------------
task test_main;
    begin
        repeat(20) begin
            AXI_DRIVERS[0].u_axim_driver.request_random_tx;
            $display ("AXI 0 done");
            AXI_DRIVERS[1].u_axim_driver.request_random_tx;
            $display ("AXI 1 done");
            AXI_DRIVERS[2].u_axim_driver.request_random_tx;
            $display ("AXI 2 done");
            AXI_DRIVERS[3].u_axim_driver.request_random_tx;
            $display ("AXI 3 done");
        end
        AXI_DRIVERS[0].u_axim_driver.check_fail;
        AXI_DRIVERS[1].u_axim_driver.check_fail;
        AXI_DRIVERS[2].u_axim_driver.check_fail;
        AXI_DRIVERS[3].u_axim_driver.check_fail;
        //AXI_DRIVERS[0].u_axim_driver.test_pass;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
wire ctrl_buf_rd_en       = mem_interface_tb.u_mem_if.u_if_controller.ctrl_buf_read_en;
reg ctrl_buf_rd_en_reg;
wire [11:0] ctrl_buf_addr = mem_interface_tb.u_mem_if.u_if_controller.ctrl_buf_addr;
assign ctrl_fifo_data_out = mem_interface_tb.u_mem_if.u_if_controller.ctrl_buf_data_out;

wire [NUM_AXI*RD_BUF_ADDR_WIDTH-1:0] rd_address_received;

generate
for(gen=0; gen<NUM_AXI; gen=gen+1)
begin
    assign rd_address_received[gen*RD_BUF_ADDR_WIDTH+:RD_BUF_ADDR_WIDTH] = mem_interface_tb.u_mem_if.AXI_RD_BUF[gen].read_buffer.rd_pointer;
end
endgenerate

initial begin
  num_instructions = 0;
end

always @(posedge ACLK)
begin
  if (ctrl_buf_rd_en)
    num_instructions = num_instructions + 1;
end

//--------------------------------------------------------------------------------------
task read_instructions;
  input [100*8-1:0] rom_file;
  reg   [CTRL_BUF_DATA_WIDTH-1:0] rom_init [0:1<<10];

  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe;
  reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
  reg  [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;
  reg  [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data_in;
  reg  [DATA_WIDTH-1:0]           rd_data_addr;
  integer                         expected_data_addr;
  reg  [RD_IF_DATA_WIDTH-1:0]     tmp;
  integer                         rom_read_addr;
  integer num_ins, m, pe_id;
  begin 
    $display ("Testing ROM instructions %0s", rom_file);
    $readmemb (rom_file, rom_init);
    set_weight_reads;
    num_wfi_instructions = 0;
    expected_data_addr = 0;
    rom_read_addr = 0;
    rd_data_addr = max_weight_reads-1;
    num_ins = 26;
    for (n=0; n<NUM_PE; n=n+1)
    begin
      pe_read_count_expected[n] = 0;
      pe_read_count_real[n] = 0;
      pe_write_count[n] = 0;
    end
    for (n=0; n<num_ins; n=n+1)
    begin
      ctrl_buf_data_in = rom_init[rom_read_addr];
      rom_read_addr = rom_read_addr + 1;
      {ctrl_pe, ctrl_op_code, ctrl_shifter} = ctrl_buf_data_in;
      case (ctrl_op_code)
        0:begin
          rd_data_addr = rd_data_addr + 1;
        end
        1:begin
          tmp = {
            (rd_data_addr << 2) + 2'h3, 
            (rd_data_addr << 2) + 2'h2, 
            (rd_data_addr << 2) + 2'h1, 
            (rd_data_addr << 2) + 2'h0,
            (rd_data_addr << 2) + 2'h3, 
            (rd_data_addr << 2) + 2'h2, 
            (rd_data_addr << 2) + 2'h1, 
            (rd_data_addr << 2) + 2'h0,
            (rd_data_addr << 2) + 2'h3, 
            (rd_data_addr << 2) + 2'h2, 
            (rd_data_addr << 2) + 2'h1, 
            (rd_data_addr << 2) + 2'h0,
            (rd_data_addr << 2) + 2'h3, 
            (rd_data_addr << 2) + 2'h2, 
            (rd_data_addr << 2) + 2'h1, 
            (rd_data_addr << 2) + 2'h0
            };
          expected_data_ram[expected_data_addr] = {tmp, tmp, tmp} >> ctrl_shifter*DATA_WIDTH;
          $display ("Expected Data : %h", expected_data_ram[expected_data_addr]);
          $display ("Read Addr     : %d", rd_data_addr);
          expected_data_addr = expected_data_addr + 1;
        end
        2:begin
          num_wfi_instructions = num_wfi_instructions + 1;
        end
        default:begin
        end
      endcase
      if (VERBOSITY > 2) $display ("ADDR: %h, OP_CODE = %h", n, ctrl_op_code);
      for (m=0; m<NUM_DATA; m=m+1)
      begin
        if (ctrl_pe[NAMESPACE_WIDTH+(3)*m+:1] && ctrl_op_code == 1)
        begin
          pe_id = m+((ctrl_pe[NAMESPACE_WIDTH+(3)*m+1+:2])<<4);
          if (VERBOSITY > 2) $display ("Lane %d, PE_ID %d", m, pe_id);
          pe_read_count_expected[pe_id] = pe_read_count_expected[pe_id] + 1;
        end
      end
      ctrl_pe[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
      ctrl_buf_data_in = {ctrl_pe, ctrl_op_code, ctrl_shifter};
      mem_interface_tb.u_mem_if.u_if_controller.u_ctrl_buf.mem[n] = ctrl_buf_data_in;
    end
    ctrl_pe       = {$random, $random};
    ctrl_op_code  = 2;
    ctrl_shifter  = {$random, $random};
    ctrl_pe[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
    ctrl_buf_data_in = {ctrl_pe, ctrl_op_code, ctrl_shifter};
    mem_interface_tb.u_mem_if.u_if_controller.u_ctrl_buf.mem[num_ins] = ctrl_buf_data_in;
    num_wfi_instructions = num_wfi_instructions + 1;
    $display ("NUM of WFI Instructions = %d", num_wfi_instructions);
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task rand_instruction;
  input integer num_ins;
  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe;
  reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
  reg  [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;
  reg  [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data_in;
  reg  [DATA_WIDTH-1:0]           rd_data_addr;
  integer                         expected_data_addr;
  reg  [RD_IF_DATA_WIDTH-1:0]     tmp;
  integer n, m, pe_id;
  begin 
    $display ("Testing random instructions");
    set_weight_reads;
    num_wfi_instructions = 0;
    expected_data_addr = 0;
    rd_data_addr = max_weight_reads;
    for (n=0; n<NUM_PE; n=n+1)
    begin
      pe_read_count_expected[n] = 0;
      pe_read_count_real[n] = 0;
      //pe_write_count[n] = 0;
    end
    for (n=0; n<num_ins; n=n+1)
    begin
      if (n > 0)
      begin
        ctrl_pe       = {$random, $random};
        ctrl_op_code  = {$random, $random} % 3;
        ctrl_shifter  = {$random, $random};
        if (ctrl_op_code == OP_WFI)
          num_wfi_instructions = num_wfi_instructions + 1;
        case (ctrl_op_code)
          0:begin
            rd_data_addr = rd_data_addr + 1;
          end
          1:begin
            tmp = {
              (rd_data_addr << 2) + 2'h3, 
              (rd_data_addr << 2) + 2'h2, 
              (rd_data_addr << 2) + 2'h1, 
              (rd_data_addr << 2) + 2'h0,
              (rd_data_addr << 2) + 2'h3, 
              (rd_data_addr << 2) + 2'h2, 
              (rd_data_addr << 2) + 2'h1, 
              (rd_data_addr << 2) + 2'h0,
              (rd_data_addr << 2) + 2'h3, 
              (rd_data_addr << 2) + 2'h2, 
              (rd_data_addr << 2) + 2'h1, 
              (rd_data_addr << 2) + 2'h0,
              (rd_data_addr << 2) + 2'h3, 
              (rd_data_addr << 2) + 2'h2, 
              (rd_data_addr << 2) + 2'h1, 
              (rd_data_addr << 2) + 2'h0
              };
            expected_data_ram[expected_data_addr] = {tmp, tmp, tmp} >> ctrl_shifter*DATA_WIDTH;
            $display ("Expected Data : %h", expected_data_ram[expected_data_addr]);
            expected_data_addr = expected_data_addr + 1;
          end
          default:begin
          end
        endcase
      end
      else begin
        ctrl_pe       = {$random, $random};
        ctrl_op_code  = 0;
        ctrl_shifter  = {$random, $random};
      end
      if (VERBOSITY > 2) $display ("ADDR: %h, OP_CODE = %h", n, ctrl_op_code);
      for (m=0; m<NUM_DATA; m=m+1)
      begin
        if (ctrl_pe[NAMESPACE_WIDTH+(3)*m+:1] && ctrl_op_code == 1)
        begin
          pe_id = (m<<2)+ctrl_pe[NAMESPACE_WIDTH+(3)*m+1+:2];
          if (VERBOSITY > 3) $display ("Lane %d, PE_ID %d", m, pe_id);
          pe_read_count_expected[pe_id] = pe_read_count_expected[pe_id] + 1;
        end
      end
      ctrl_pe[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
      ctrl_buf_data_in = {ctrl_pe, ctrl_op_code, ctrl_shifter};
      mem_interface_tb.u_mem_if.u_if_controller.u_ctrl_buf.mem[n] = ctrl_buf_data_in;
    end
    ctrl_pe       = {$random, $random};
    ctrl_op_code  = 2;
    ctrl_shifter  = {$random, $random};
    ctrl_pe[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
    ctrl_buf_data_in = {ctrl_pe, ctrl_op_code, ctrl_shifter};
    mem_interface_tb.u_mem_if.u_if_controller.u_ctrl_buf.mem[num_ins] = ctrl_buf_data_in;
    num_wfi_instructions = num_wfi_instructions + 1;
  end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task check_fail;
    if (fail_flag && ARESETN) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        @(posedge ACLK);
        @(posedge ACLK);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

// ******************************************************************
// TestBench
// ******************************************************************
initial
begin
    $dumpfile("hw-imp/bin/waveform/mem_interface.vcd");
    $dumpvars(0,mem_interface_tb);
end

initial 
begin
  $display("***************************************");
  $display ("Testing Read IF");
  $display("***************************************");
  n = 0;
  ACLK = 0;
  ARESETN = 1;
  @(negedge ACLK);
  ARESETN = 0;
  @(negedge ACLK);
  ARESETN = 1;

  @(negedge ACLK);

  //test_main;

  //$display("%c[1;32m",27);
  //$display ("Test Passed");
  //$display("%c[0m",27);

  //#10000;
  //check_fail;
  //$finish;
end

initial begin
  EOI = 0;
  EOC = 0;
  wait (ARESETN);
  start_tabla;
end

wire [2:0] state = mem_interface_tb.u_mem_if.u_if_controller.state;
integer pe_id_count;
integer tmp_rand;
initial
begin
  tmp_rand = $random;
  tmp_rand = $random;
  //rand_instruction(100);
  //read_instructions(`MEM_INST_INIT);
  wait(num_instructions > 0);
  wait (state == 0);
  for (pe_id_count = 0; pe_id_count < NUM_PE; pe_id_count = pe_id_count + 1)
  begin
    if (pe_read_count_expected[pe_id_count] !== pe_read_count_real[pe_id_count]) begin
      $display ("Error in PE %d", pe_id_count);
      $display ("expected reads = %d, real reads = %d",
        pe_read_count_expected[pe_id_count], pe_read_count_real[pe_id_count]);
      fail_flag = 1;
      $finish;
    end
  end
  @(negedge ACLK);
  check_fail;
  $display ("Reads passed");

  $display ("Checking weight Reads");
  check_weight_reads;
  check_fail;
  $display ("Checking weight Reads- pass");
  $display ("Checking weight Writes");
  check_weight_writes;
  check_fail;
  $display ("Checking weight Writes- pass");

  $display("%c[1;32m",27);
  $display ("**************************************************");
  $display ("Test Passed");
  $display ("**************************************************");
  $display("%c[0m",27);
#10;
  $finish;
end

// ==================================================================
task check_weight_reads;
  begin
    for (pe_id_count = 0; pe_id_count < NUM_PE; pe_id_count = pe_id_count + 1)
    begin
      if (weight_read_count[pe_id_count] !== pe_weight_reads_expected[pe_id_count])
      begin
        $display ("PE_ID = %d, Weight Reads = %d, Expected Weight Reads = %d", 
          pe_id_count, weight_read_count[pe_id_count], pe_weight_reads_expected[pe_id_count]);
        fail_flag = 1;
        check_fail;
      end
    end
  end
endtask
// ==================================================================

// ==================================================================
task check_weight_writes;
  begin
    if (weight_fifo_rd_addr !== weight_fifo_wr_addr)
      fail_flag = 1;
    check_fail;
  end
endtask
// ==================================================================

always #1 ACLK = ~ACLK;

wire shifter_rd_en = mem_interface_tb.u_mem_if.shifter_rd_en;
integer addr;
initial begin
  addr = 0;
end
always @(posedge ACLK)
begin
  if (shifter_rd_en)
    check_shifter_output;
end

task check_shifter_output;
  integer n, m, pe_id;
  reg valid;
  reg [1:0] namespace;
  begin
    // for (n=0; n<NUM_DATA; n=n+1)
    // begin
    //   pe_id = (n<<2)+ctrl_pe[NAMESPACE_WIDTH+(3)*n+1+:2];
    //   valid = ctrl_pe[NAMESPACE_WIDTH+(3)*n+:1];
    //   if (valid) $display ("state = %d PE ID = %d", state, pe_id);
    // end
    namespace = ctrl_pe[NAMESPACE_WIDTH-1:0];
    @(negedge ACLK);
    if (wdata !== expected_data_ram[addr] && namespace == `NAMESPACE_MEM_DATA) begin
      $display ("Namespace MEM - Got Data      : %h", wdata);
      $display ("Namespace MEM - Expected Data : %h", expected_data_ram[addr]);
      fail_flag = 1;
    end
    else if (VERBOSITY > 2 && namespace == `NAMESPACE_MEM_DATA) begin
      $display ("Got Data      : %h", wdata);
      $display ("Expected Data : %h", expected_data_ram[addr]);
    end
    if (namespace == `NAMESPACE_MEM_DATA) addr = addr + 1;
    // for (n=0; n<NUM_DATA; n=n+1)
    // begin
    //   pe_id = (n<<2)+ctrl_pe[NAMESPACE_WIDTH+(3)*n+1+:2];
    //   valid = ctrl_pe[NAMESPACE_WIDTH+(3)*n+:1];
    //   if (valid) $display ("state = %d PE ID = %d", state, pe_id);
    // end
  end
endtask

always @(posedge ACLK)
begin
  count_pe_reads;
end

task count_pe_reads;
  integer n, m, pe_id;
  reg valid;
  reg [1:0] namespace;
  if (ctrl_pe[NAMESPACE_WIDTH-1:0] == `NAMESPACE_MEM_DATA)
  begin
    if (VERBOSITY > 2) $display ("--");
    for (n=0; n<NUM_DATA; n=n+1)
    begin
      pe_id = n+(ctrl_pe[NAMESPACE_WIDTH+(3)*n+1+:2] << 4);
      valid = ctrl_pe[NAMESPACE_WIDTH+(3)*n+:1];
      if (valid) begin
        pe_read_count_real[pe_id] = pe_read_count_real[pe_id] + 1;
        if (VERBOSITY > 2) $display ("PE_ID - %d, Expected Reads = %d, Actual = %d",
          pe_id, pe_read_count_expected[pe_id], pe_read_count_real[pe_id]);
      end
    end
    if (VERBOSITY > 2) $display ("--");
  end
endtask

always @(posedge ACLK)
begin
  if (compute_start)
    compute;
end

task compute;
  begin
    repeat (10) @(negedge ACLK);
      EOI = 1;
    @(negedge ACLK);
      EOI = 0;
      EOC = 0;
  end
endtask

initial begin
end

always @(posedge ACLK)
begin
  if (ARESETN == 0 || (shifter_rd_en && ctrl_pe[NAMESPACE_WIDTH-1:0] == `NAMESPACE_MEM_WEIGHT && DATA_IO_DIR == 0))
  begin
    count_weight_reads;
  end
end

// ==================================================================
task set_weight_reads;
  integer current_weight_reads;
  integer weight_reads_total;
  reg [16-1:0] a, b, c, d;
  begin
    max_weight_reads = 0;
    current_weight_reads = 0;
    for (i=0; i<NUM_DATA; i=i+1)
    begin
      a = $random & 'hF;
      b = $random & 'hF;
      c = $random & 'hF;
      d = $random & 'hF;
      pe_weight_reads_expected[i*4+0] = a;
      pe_weight_reads_expected[i*4+1] = b;
      pe_weight_reads_expected[i*4+2] = c;
      pe_weight_reads_expected[i*4+3] = d;
      weight_reads_total = a+b+c+d-1;
      mem_interface_tb.u_mem_if.u_if_controller.counter_init[i] = {
        weight_reads_total,
        pe_weight_reads_expected[4*i+3],
        pe_weight_reads_expected[4*i+2],
        pe_weight_reads_expected[4*i+1],
        pe_weight_reads_expected[4*i+0]
      };
      current_weight_reads = 
        pe_weight_reads_expected[4*i+0] +
        pe_weight_reads_expected[4*i+1] +
        pe_weight_reads_expected[4*i+2] +
        pe_weight_reads_expected[4*i+3];
      max_weight_reads = (max_weight_reads < current_weight_reads) ? current_weight_reads : max_weight_reads;
    end
    $display ("Max weight Reads = %d", max_weight_reads);
  end
endtask
// ==================================================================

// ==================================================================
task count_weight_reads;
  integer n, pe_id;
  reg valid;
  begin
    if (ARESETN == 0)
    begin
      for (n=0; n<NUM_PE; n=n+1)
      begin
        weight_read_count[n] = 0;
      end
    end
    for (n=0; n<NUM_DATA; n=n+1)
    begin
      pe_id = (n<<2)+ctrl_pe[NAMESPACE_WIDTH+(3)*n+1+:2];
      valid = ctrl_pe[NAMESPACE_WIDTH+(3)*n+:1];
      if (valid)
      begin
        weight_read_count[pe_id] = weight_read_count[pe_id] + 1;
      end
    end
  end
endtask
// ==================================================================

// ==================================================================
task start_tabla;
  reg tmp;
  integer num_iterations;
  begin
    $display ("Starting Tabla");
    num_iterations = 1;
    $display ("Num_iterations = %d",
      num_iterations);
    @(negedge ACLK);
    u_axis_driver.write_request (1, num_iterations);
    u_axis_driver.write_request (2, 32'hAABB0000);  //weight rd addr
    u_axis_driver.write_request (3, 32'hCCDD0000);  //data   rd addr
    u_axis_driver.write_request (5, 32'hEEFF0000);  //weight wr addr
    u_axis_driver.write_request (4, 128);//data   rd size
    u_axis_driver.read_request  (0, tmp);
    u_axis_driver.write_request (0, 1-tmp);
  end
endtask
// ==================================================================

wire rd_buf_pop = mem_interface_tb.u_mem_if.u_if_controller.rd_buf_pop;
integer num_weight_reads = 0;
always @(posedge ACLK)
  if (state == WEIGHT_READ && rd_buf_pop)
    num_weight_reads = num_weight_reads + 1;

integer num_weight_shifts = 0;
always @(posedge ACLK)
begin
  if (state == WEIGHT_READ && shifter_rd_en)
  begin
    num_weight_shifts = num_weight_shifts + 1;
  end
end

// ******************************************************************

reg [RD_BUF_DATA_WIDTH-1:0] weight_fifo_ram [0 : 1<<10];
integer weight_fifo_wr_addr = 0;
reg weight_fifo_push;

always @(posedge ACLK)
begin
  if (shifter_rd_en && state == WEIGHT_READ)
    weight_fifo_push <= 1;
  else 
    weight_fifo_push <= 0;
end

always @(posedge ACLK)
begin
  if (ARESETN == 0)
    weight_fifo_wr_addr <= 0;
  else if (weight_fifo_push)
  begin
    weight_fifo_ram[weight_fifo_wr_addr] <= wdata;
    weight_fifo_wr_addr <= weight_fifo_wr_addr + 1;
  end
end

integer weight_fifo_rd_addr = 0;
always @(posedge ACLK)
begin : CHECK_WEIGHTS
  if (DATA_IO_DIR)
    weight_fifo_rd_addr = weight_fifo_rd_addr + 1;
end

endmodule
