`timescale 1ns/1ps
`ifdef FPGA
	`include "log.vh"
`endif
	
module mem_interface
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer C_M_AXI_ADDR_WIDTH    = 32,
    parameter integer DATA_WIDTH            = 16,
    parameter integer NUM_DATA              = 16,
    parameter integer NUM_PE                = 64,
    parameter integer RD_BUF_ADDR_WIDTH     = 10,
    parameter integer NUM_AXI               = 4,
    parameter integer NAMESPACE_WIDTH       = 2,
    parameter integer TX_SIZE_WIDTH         = 16,
// ******************************************************************
    parameter integer RD_IF_DATA_WIDTH     = DATA_WIDTH * NUM_DATA, 
    parameter integer RD_BUF_DATA_WIDTH    = DATA_WIDTH * NUM_DATA / NUM_AXI,    
    parameter integer WSTRB_WIDTH          = (RD_BUF_DATA_WIDTH/8) * NUM_AXI,
    parameter integer CTRL_PE_WIDTH        = (`C_LOG_2(NUM_PE/NUM_DATA) + 1) 
                                              * NUM_DATA + NAMESPACE_WIDTH
) (
// ******************************************************************
// IO
// ******************************************************************
    input  wire                             ACLK,
    input  wire                             ARESETN,
    input  wire [RD_IF_DATA_WIDTH-1:0]      rdata,
    output wire [RD_IF_DATA_WIDTH-1:0]      wdata,
    input  wire                             EOI,
    output wire                             EOC,
    output reg  [CTRL_PE_WIDTH-1:0]         CTRL_PE,

    output wire                             DATA_IO_DIR,

    // Master Interface Write Address
    output wire [32*NUM_AXI-1:0]            S_AXI_AWADDR,
    output wire [2*NUM_AXI-1:0]             S_AXI_AWBURST,
    output wire [4*NUM_AXI-1:0]             S_AXI_AWCACHE,
    output wire [6*NUM_AXI-1:0]             S_AXI_AWID,
    output wire [4*NUM_AXI-1:0]             S_AXI_AWLEN,
    output wire [2*NUM_AXI-1:0]             S_AXI_AWLOCK,
    output wire [3*NUM_AXI-1:0]             S_AXI_AWPROT,
    output wire [4*NUM_AXI-1:0]             S_AXI_AWQOS,
    output wire [1*NUM_AXI-1:0]             S_AXI_AWUSER,
    input  wire [1*NUM_AXI-1:0]             S_AXI_AWREADY,
    output wire [3*NUM_AXI-1:0]             S_AXI_AWSIZE,
    output wire [1*NUM_AXI-1:0]             S_AXI_AWVALID,
    
    // Master Interface Write Data
    output wire [RD_IF_DATA_WIDTH-1:0]      S_AXI_WDATA,
    output wire [6*NUM_AXI-1:0]             S_AXI_WID,
    output wire [1*NUM_AXI-1:0]             S_AXI_WUSER,
    output wire [1*NUM_AXI-1:0]             S_AXI_WLAST,
    input  wire [1*NUM_AXI-1:0]             S_AXI_WREADY,
    output wire [WSTRB_WIDTH-1:0]           S_AXI_WSTRB,
    output wire [1*NUM_AXI-1:0]             S_AXI_WVALID,

    // Master Interface Write Response
    input  wire [6*NUM_AXI-1:0]             S_AXI_BID,
    input  wire [1*NUM_AXI-1:0]             S_AXI_BUSER,
    output wire [1*NUM_AXI-1:0]             S_AXI_BREADY,
    input  wire [2*NUM_AXI-1:0]             S_AXI_BRESP,
    input  wire [1*NUM_AXI-1:0]             S_AXI_BVALID,
    
    // Master Interface Read Address
    output wire [32*NUM_AXI-1:0]            S_AXI_ARADDR,
    output wire [2*NUM_AXI-1:0]             S_AXI_ARBURST,
    output wire [4*NUM_AXI-1:0]             S_AXI_ARCACHE,
    output wire [6*NUM_AXI-1:0]             S_AXI_ARID,
    output wire [4*NUM_AXI-1:0]             S_AXI_ARLEN,
    output wire [2*NUM_AXI-1:0]             S_AXI_ARLOCK,
    output wire [3*NUM_AXI-1:0]             S_AXI_ARPROT,
    output wire [4*NUM_AXI-1:0]             S_AXI_ARQOS,
    output wire [1*NUM_AXI-1:0]             S_AXI_ARUSER,
    input  wire [1*NUM_AXI-1:0]             S_AXI_ARREADY,
    output wire [3*NUM_AXI-1:0]             S_AXI_ARSIZE,
    output wire [1*NUM_AXI-1:0]             S_AXI_ARVALID,

    // Master Interface Read Data 
    input  wire [RD_IF_DATA_WIDTH-1:0]      S_AXI_RDATA,
    input  wire [6*NUM_AXI-1:0]             S_AXI_RID,
    input  wire [1*NUM_AXI-1:0]             S_AXI_RUSER,
    input  wire [1*NUM_AXI-1:0]             S_AXI_RLAST,
    output wire [1*NUM_AXI-1:0]             S_AXI_RREADY,
    input  wire [2*NUM_AXI-1:0]             S_AXI_RRESP,
    input  wire [1*NUM_AXI-1:0]             S_AXI_RVALID,

    input  wire [31:0]                      M_AXI_GP0_awaddr,
    input  wire [2:0]                       M_AXI_GP0_awprot,
    input  wire                             M_AXI_GP0_awvalid,
    output wire                             M_AXI_GP0_awready,

    input  wire [31:0]                      M_AXI_GP0_wdata,
    input  wire [3:0]                       M_AXI_GP0_wstrb,
    input  wire                             M_AXI_GP0_wvalid,
    output wire                             M_AXI_GP0_wready,

    output wire [1:0]                       M_AXI_GP0_bresp,
    output wire                             M_AXI_GP0_bvalid,
    input  wire                             M_AXI_GP0_bready,

    input  wire [31:0]                      M_AXI_GP0_araddr,
    input  wire [2:0]                       M_AXI_GP0_arprot,
    input  wire                             M_AXI_GP0_arvalid,
    output wire                             M_AXI_GP0_arready,

    output wire [31:0]                      M_AXI_GP0_rdata,
    output wire [1:0]                       M_AXI_GP0_rresp,
    output wire                             M_AXI_GP0_rvalid,
    input  wire                             M_AXI_GP0_rready,

    // TXN REQ
    output wire                             compute_start
// ******************************************************************
);

// ******************************************************************
// Localparams
// ******************************************************************
    localparam integer SHIFTER_CTRL_WIDTH   = `C_LOG_2(NUM_DATA);
    localparam integer NUM_OPS              = 4;
    localparam integer OP_CODE_WIDTH        = `C_LOG_2 (NUM_OPS);
    localparam integer CTRL_BUF_DATA_WIDTH  = NUM_DATA * CTRL_PE_WIDTH + 
                                              SHIFTER_CTRL_WIDTH +
                                              OP_CODE_WIDTH;
    localparam integer CTRL_BUF_ADDR_WIDTH  = 13;
    localparam integer MEM_PIPELINE_DELAY = `MEM_PIPELINE_STAGES + `MEM_PIPELINE_STAGES_COMMON + `MEM_PIPELINE_STAGES_OUTPUTS;
// ******************************************************************

// ******************************************************************
// Local wires and regs
// ******************************************************************

  wire                            start;
  wire                            wr_flush;

  wire                            wr_req;
  wire [NUM_AXI*32-1:0]           wr_addr;
  wire                            rd_req;
  wire [TX_SIZE_WIDTH-1:0]        rd_req_size;
  wire [NUM_AXI*32-1:0]           rd_addr;

  wire [RD_IF_DATA_WIDTH-1:0]     rd_buf_data_out;
  wire [NUM_AXI-1:0]              rd_buf_full;
  wire [NUM_AXI-1:0]              rd_buf_empty;
  wire [NUM_AXI-1:0]              rd_buf_pop;

  wire [RD_IF_DATA_WIDTH-1:0]     wr_buf_data_out;
  wire [NUM_AXI-1:0]              wr_buf_full;
  wire [NUM_AXI-1:0]              wr_buf_empty;
  wire [NUM_AXI-1:0]              wr_buf_push,wr_buf_push_p;

  wire                            shifter_rd_en;
  wire [SHIFTER_CTRL_WIDTH -1:0]  shifter_ctrl_in;

  // WRITE from BRAM to DDR
  wire                            outBuf_empty;
  wire [NUM_AXI-1:0]              outBuf_pop;
  wire [RD_IF_DATA_WIDTH-1:0]     data_from_outBuf;
  wire [RD_BUF_ADDR_WIDTH:0]      outBuf_count;

  // READ from DDR to BRAM
  wire [RD_IF_DATA_WIDTH-1:0]     data_to_inBuf;
  wire [NUM_AXI-1:0]              inBuf_push;
  wire [NUM_AXI-1:0]              inBuf_full;
  wire [RD_BUF_ADDR_WIDTH * NUM_AXI:0]      inBuf_count;

  wire [RD_IF_DATA_WIDTH   -1:0]    data_out_shift;

  wire [NUM_AXI-1:0]                rx_done_inst;

  reg         slv_reg0_out_d;
  
  wire [31:0] slv_reg0_in, slv_reg0_out;
  wire [31:0] slv_reg1_in, slv_reg1_out;
  wire [31:0] slv_reg2_in, slv_reg2_out;
  wire [31:0] slv_reg3_in, slv_reg3_out;
  wire [31:0] slv_reg4_in, slv_reg4_out;
  wire [31:0] slv_reg5_in, slv_reg5_out;
  wire [31:0] slv_reg6_in, slv_reg6_out;
  wire [31:0] slv_reg7_in, slv_reg7_out;

  wire [31:0] slv_reg8_in, slv_reg8_out;
  wire [31:0] slv_reg9_in, slv_reg9_out;
  wire [31:0] slv_reg10_in, slv_reg10_out;
  wire [31:0] slv_reg11_in, slv_reg11_out;
  wire [31:0] slv_reg12_in, slv_reg12_out;
  wire [31:0] slv_reg13_in, slv_reg13_out;
  wire [31:0] slv_reg14_in, slv_reg14_out;
  wire [31:0] slv_reg15_in, slv_reg15_out;

  wire done;

  wire [31:0]                       max_iterations;
  wire [31:0]                       weight_rd_addr;
  wire [31:0]                       data_rd_addr;
  wire [31:0]                       data_rd_size;
  wire [31:0]                       weight_rd_size;
  wire [31:0]                       weight_wr_addr;

  wire [CTRL_BUF_ADDR_WIDTH-1:0]                       ctrl_buf_addr;
  wire [31:0]                       num_iterations;
  wire [31:0]                       if_control_state;

  wire [CTRL_PE_WIDTH-1:0]          ctrl_pe;

// ******************************************************************

// ******************************************************************
// RD Fifo - Buffer for Read Interface
// ******************************************************************

assign inBuf_full = rd_buf_full;
assign outBuf_empty = |wr_buf_empty; 

genvar gen;
generate
for (gen = 0; gen < NUM_AXI; gen = gen + 1)
begin : AXI_RD_BUF

    reg                         rd_push;
    reg [RD_BUF_DATA_WIDTH-1:0] rd_data_in;
    wire [RD_BUF_DATA_WIDTH-1:0] rd_data_out;
    wire                         rd_pop;
    wire                         rd_full;
    wire                         rd_empty;
    
    always @(posedge ACLK or negedge ARESETN) begin
        if(~ARESETN) begin
            rd_data_in <= {RD_BUF_DATA_WIDTH{1'b0}};
            rd_push    <= 1'b0;
        end
        else begin
            rd_data_in <= data_to_inBuf[gen*RD_BUF_DATA_WIDTH+:RD_BUF_DATA_WIDTH];
            rd_push    <= inBuf_push[gen];
        end
    end
    assign rd_pop     = rd_buf_pop[gen];

    assign rd_buf_empty[gen] = rd_empty;
    assign rd_buf_full[gen] = rd_full;
    assign rd_buf_data_out[gen*RD_BUF_DATA_WIDTH+:RD_BUF_DATA_WIDTH] = rd_data_out;

    fifo #(
        .DATA_WIDTH             ( RD_BUF_DATA_WIDTH     ),
        .ADDR_WIDTH             ( RD_BUF_ADDR_WIDTH     )
    ) read_buffer (
        .clk                    ( ACLK                  ),
        .reset                  ( !ARESETN              ),
        .push                   ( rd_push               ),
        .pop                    ( rd_pop                ),
        .data_in                ( rd_data_in            ),
        .data_out               ( rd_data_out           ),
        .empty                  ( rd_empty              ),
        .full                   ( rd_full               )
    );

    wire                         wr_push;
    wire [RD_BUF_DATA_WIDTH-1:0] wr_data_in;
    wire [RD_BUF_DATA_WIDTH-1:0] wr_data_out;
    wire                         wr_pop;
    wire                         wr_full;
    wire                         wr_empty;

    assign wr_data_in = rdata[gen*RD_BUF_DATA_WIDTH+:RD_BUF_DATA_WIDTH];
    assign wr_push    = wr_buf_push_p[gen];//DATA_IO_DIR;
    //assign wr_push    = DATA_IO_DIR;
    assign wr_pop     = outBuf_pop[gen];

    assign wr_buf_empty[gen] = wr_empty;
    assign wr_buf_full[gen] = wr_full;
    assign data_from_outBuf[gen*RD_BUF_DATA_WIDTH+:RD_BUF_DATA_WIDTH] = wr_data_out;

    fifo_fwft #(
        .DATA_WIDTH             ( RD_BUF_DATA_WIDTH     ),
        .ADDR_WIDTH             ( RD_BUF_ADDR_WIDTH     ),
        .EARLY_FULL             ( MEM_PIPELINE_DELAY     )
    ) write_buffer (
        .clk                    ( ACLK                  ),
        .reset                  ( !ARESETN              ),
        .push                   ( wr_push               ),
        .pop                    ( wr_pop                ),
        .data_in                ( wr_data_in            ),
        .data_out               ( wr_data_out           ),
        .empty                  ( wr_empty              ),
        .full                   ( wr_full               )
    );

end
endgenerate

pipeline #(
    .NUM_BITS	( NUM_AXI	),
    .NUM_STAGES	( MEM_PIPELINE_DELAY	)
    
) wr_buf_push_pipeline(

    .clk		(	ACLK		),
    .rstn		(	ARESETN		),
    
    .data_in	(	wr_buf_push	),
    .data_out	(	wr_buf_push_p )
    
    );
// ******************************************************************

// ******************************************************************
// Shifter
// ******************************************************************
    shifter
    #(
        .DATA_WIDTH             ( DATA_WIDTH            ),
        .NUM_DATA               ( NUM_DATA              )
    ) u_shifter (
        .ACLK                   ( ACLK                  ),
        .ARESETN                ( ARESETN               ),
        .RD_EN                  ( shifter_rd_en         ),
        .DATA_IN                ( rd_buf_data_out       ),
        .CTRL_IN                ( shifter_ctrl_in       ),
        .DATA_OUT               ( data_out_shift        )
    );

    always @(posedge ACLK)
    begin
        if (ARESETN)
          CTRL_PE <= ctrl_pe;
        else
          CTRL_PE <= 0;
    end

    // Write to PEs
    assign wdata = data_out_shift;

// ******************************************************************

// ******************************************************************
// CONTROLLER
// ******************************************************************
if_control_new
#(
  .CTRL_BUF_ADDR_WIDTH    ( CTRL_BUF_ADDR_WIDTH   ),
  .NUM_DATA               ( NUM_DATA              ),
  .NUM_AXI                ( NUM_AXI               ),
  .NUM_PE                 ( NUM_PE                ),
  .C_M_AXI_DATA_WIDTH     ( RD_BUF_DATA_WIDTH     ),
  .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH         )
) u_if_controller (
  // clk and reset
  .clk                    ( ACLK                  ),
  .resetn                 ( ARESETN               ),
  // configuration
  .max_iterations         ( max_iterations        ),
  .ctrl_buf_addr          ( ctrl_buf_addr         ),
  .num_iterations         ( num_iterations        ),
  .if_control_state       ( if_control_state      ),
  .data_rd_addr           ( data_rd_addr          ),
  .data_rd_size           ( data_rd_size          ),
  .weight_rd_size         ( weight_rd_size        ),
  .weight_rd_addr         ( weight_rd_addr        ),
  .weight_wr_addr         ( weight_wr_addr        ),
  // configuration
  .rd_buf_empty           ( |rd_buf_empty         ),
  //.rd_buf_empty           ( 0),
  .rd_buf_pop_per_axi             ( rd_buf_pop            ),
  .wr_buf_full            ( |wr_buf_full          ),
  .wr_buf_push            ( wr_buf_push           ),
  // control
  .start                  ( start                 ),
  .wr_flush               ( wr_flush              ),
  .eoi                    ( EOI                   ),
  .eoc                    ( EOC                   ),
  .shifter_rd_en          ( shifter_rd_en         ),
  .compute_start          ( compute_start         ),
  .ctrl_pe                ( ctrl_pe               ),
  .shift                  ( shifter_ctrl_in       ),
  .data_io_dir            ( DATA_IO_DIR           ),
  .done                   ( done                  ),
  // axi
  .rd_req                 ( rd_req                ),
  .rd_req_size            ( rd_req_size           ),
  .rd_addr                ( rd_addr               ),
  .wr_req                 ( wr_req                ),
  .wr_addr                ( wr_addr               )
);
// ******************************************************************

// ******************************************************************
// AXI-Master
// ******************************************************************

for (gen=0; gen<NUM_AXI; gen=gen+1)
begin : AXI_MASTER
  localparam integer wstrb_width = RD_BUF_DATA_WIDTH/8;
  localparam integer C_M_AXI_WR_BURST_LEN = 16;

  axi_master 
  #(
    .C_M_AXI_DATA_WIDTH     ( RD_BUF_DATA_WIDTH         ),
    .C_M_AXI_ADDR_WIDTH     ( C_M_AXI_ADDR_WIDTH        ),
    .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH             ),
    .NUM_AXI                ( NUM_AXI               )
  )
  u_axim
  (
    .ACLK                   ( ACLK                      ),
    .ARESETN                ( ARESETN                   ),

    .MASTER_AXI_AWID             ( S_AXI_AWID[6*gen+:6]      ),
    .MASTER_AXI_AWADDR           ( S_AXI_AWADDR[32*gen+:32]  ),
    .MASTER_AXI_AWLEN            ( S_AXI_AWLEN[4*gen+:4]     ),
    .MASTER_AXI_AWSIZE           ( S_AXI_AWSIZE[3*gen+:3]    ),
    .MASTER_AXI_AWBURST          ( S_AXI_AWBURST[2*gen+:2]   ),
    .MASTER_AXI_AWLOCK           ( S_AXI_AWLOCK[2*gen+:2]    ),
    .MASTER_AXI_AWCACHE          ( S_AXI_AWCACHE[4*gen+:4]   ),
    .MASTER_AXI_AWPROT           ( S_AXI_AWPROT[3*gen+:3]    ),
    .MASTER_AXI_AWQOS            ( S_AXI_AWQOS[4*gen+:4]     ),
    .MASTER_AXI_AWUSER           ( S_AXI_AWUSER[gen+:1]      ),
    .MASTER_AXI_AWVALID          ( S_AXI_AWVALID[gen+:1]     ),
    .MASTER_AXI_AWREADY          ( S_AXI_AWREADY[gen+:1]     ),
    .MASTER_AXI_WID              ( S_AXI_WID[6*gen+:6]       ),
    .MASTER_AXI_WDATA            ( S_AXI_WDATA[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]               ),
    .MASTER_AXI_WSTRB            ( S_AXI_WSTRB[wstrb_width*gen+:wstrb_width]               ),
    .MASTER_AXI_WLAST            ( S_AXI_WLAST[gen]          ),
    .MASTER_AXI_WUSER            ( S_AXI_WUSER[gen+:1]       ),
    .MASTER_AXI_WVALID           ( S_AXI_WVALID[gen+:1]      ),
    .MASTER_AXI_WREADY           ( S_AXI_WREADY[gen+:1]      ),
    .MASTER_AXI_BID              ( S_AXI_BID[6*gen+:6]       ),
    .MASTER_AXI_BRESP            ( S_AXI_BRESP[2*gen+:2]     ),
    .MASTER_AXI_BUSER            ( S_AXI_BUSER[gen+:1]       ),
    .MASTER_AXI_BVALID           ( S_AXI_BVALID[gen+:1]      ),
    .MASTER_AXI_BREADY           ( S_AXI_BREADY[gen+:1]      ),
    .MASTER_AXI_ARID             ( S_AXI_ARID[6*gen+:6]      ),
    .MASTER_AXI_ARADDR           ( S_AXI_ARADDR[32*gen+:32]  ),
    .MASTER_AXI_ARLEN            ( S_AXI_ARLEN[4*gen+:4]     ),
    .MASTER_AXI_ARSIZE           ( S_AXI_ARSIZE[3*gen+:3]    ),
    .MASTER_AXI_ARBURST          ( S_AXI_ARBURST[2*gen+:2]   ),
    .MASTER_AXI_ARLOCK           ( S_AXI_ARLOCK[2*gen+:2]    ),
    .MASTER_AXI_ARCACHE          ( S_AXI_ARCACHE[4*gen+:4]   ),
    .MASTER_AXI_ARPROT           ( S_AXI_ARPROT[3*gen+:3]    ),
    .MASTER_AXI_ARQOS            ( S_AXI_ARQOS[4*gen+:4]     ),
    .MASTER_AXI_ARUSER           ( S_AXI_ARUSER[gen+:1]      ),
    .MASTER_AXI_ARVALID          ( S_AXI_ARVALID[gen+:1]     ),
    .MASTER_AXI_ARREADY          ( S_AXI_ARREADY[gen+:1]     ),
    .MASTER_AXI_RID              ( S_AXI_RID[6*gen+:6]       ),
    .MASTER_AXI_RDATA            ( S_AXI_RDATA[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]               ),
    .MASTER_AXI_RRESP            ( S_AXI_RRESP[2*gen+:2]     ),
    .MASTER_AXI_RLAST            ( S_AXI_RLAST[gen+:1]       ),
    .MASTER_AXI_RUSER            ( S_AXI_RUSER[gen+:1]       ),
    .MASTER_AXI_RVALID           ( S_AXI_RVALID[gen+:1]      ),
    .MASTER_AXI_RREADY           ( S_AXI_RREADY[gen+:1]      ),

    .outBuf_empty           ( outBuf_empty              ),
    .outBuf_pop             ( outBuf_pop[gen]           ),
    .data_from_outBuf       ( data_from_outBuf[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]          ),

    .data_to_inBuf          ( data_to_inBuf[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]             ),
    .inBuf_push             ( inBuf_push[gen+:1]        ),
    .inBuf_full             ( inBuf_full[gen+:1]        ),

    .rd_req                 ( rd_req                    ),
    .rd_req_size            ( rd_req_size               ),
    .rd_addr                ( rd_addr[gen*C_M_AXI_ADDR_WIDTH+:C_M_AXI_ADDR_WIDTH] ),

    .wr_req                 ( wr_req                    ),
    .wr_addr                ( wr_addr[gen*C_M_AXI_ADDR_WIDTH+:C_M_AXI_ADDR_WIDTH] ),
    .write_valid            ( wr_buf_push[gen]          ),
    .wr_flush               ( wr_flush                  )
  );
end
// ******************************************************************

//--------------------------------------------------------------
//--------------------------------------------------------------

  assign max_iterations = slv_reg1_out;
  assign weight_rd_addr = slv_reg2_out;
  assign data_rd_addr   = slv_reg3_out;
  assign data_rd_size   = slv_reg4_out;
  assign weight_wr_addr = slv_reg5_out;
  assign weight_rd_size = slv_reg6_out;
  
  always @(posedge ACLK)
  begin
    if (ARESETN)
      slv_reg0_out_d <= slv_reg0_out[0];
    else
      slv_reg0_out_d <= 1'b0;
  end
  
  assign start = slv_reg0_out[0] ^ slv_reg0_out_d;

  assign slv_reg0_in = slv_reg0_out;
  assign slv_reg1_in = slv_reg1_out;
  assign slv_reg2_in = slv_reg2_out;
  assign slv_reg3_in = slv_reg3_out;
  assign slv_reg4_in = slv_reg4_out;
  assign slv_reg5_in = slv_reg5_out;
  assign slv_reg6_in = slv_reg6_out;
  //assign slv_reg7_in = slv_reg7_out;

  //assign slv_reg6_in = S_AXI_ARADDR[31:0];
  assign slv_reg7_in = ctrl_buf_addr;

  assign slv_reg8_in = num_iterations;
  assign slv_reg9_in = if_control_state;
  assign slv_reg10_in = rd_buf_empty;

  reg [31:0] axi0_wr_count;
  reg [31:0] axi0_wr_addr;
  reg [31:0] axi1_wr_addr;
  reg [31:0] axi2_wr_addr;
  reg [31:0] axi3_wr_addr;
  assign slv_reg11_in = axi0_wr_addr;
  assign slv_reg12_in = axi1_wr_addr;
  assign slv_reg13_in = axi2_wr_addr;
  assign slv_reg14_in = axi3_wr_addr;
  always @(posedge ACLK)
  begin
    if (ARESETN == 0) begin
      axi0_wr_count <= 0;
      axi0_wr_addr <= 0;
      axi1_wr_addr <= 0;
      axi2_wr_addr <= 0;
      axi3_wr_addr <= 0;
    end
    else if (S_AXI_AWVALID[0] && S_AXI_AWREADY[0]) begin
      axi0_wr_count <= axi0_wr_count + S_AXI_AWLEN[3:0] + 1;
      axi0_wr_addr <= S_AXI_AWADDR[31:0];
//      axi1_wr_addr <= S_AXI_AWADDR[63:32];
//      axi2_wr_addr <= S_AXI_AWADDR[95:64];
//      axi3_wr_addr <= S_AXI_AWADDR[127:96];
    end
  end

  assign slv_reg15_in = axi0_wr_count;

axi4lite_slave #(

  .AXIS_DATA_WIDTH        ( 32                  ),
  .AXIS_ADDR_WIDTH        ( 32                  )

) axi_slave_i (

  .slv_reg0_in            ( slv_reg0_in         ),  //input  register 0
  .slv_reg0_out           ( slv_reg0_out        ),  //output register 0
  .slv_reg1_in            ( slv_reg1_in         ),  //input  register 1
  .slv_reg1_out           ( slv_reg1_out        ),  //output register 1
  .slv_reg2_in            ( slv_reg2_in         ),  //input  register 2
  .slv_reg2_out           ( slv_reg2_out        ),  //output register 2
  .slv_reg3_in            ( slv_reg3_in         ),  //input  register 3
  .slv_reg3_out           ( slv_reg3_out        ),  //output register 3
  .slv_reg4_in            ( slv_reg4_in         ),  //input  register 4
  .slv_reg4_out           ( slv_reg4_out        ),  //output register 4
  .slv_reg5_in            ( slv_reg5_in         ),  //input  register 5
  .slv_reg5_out           ( slv_reg5_out        ),  //output register 5
  .slv_reg6_in            ( slv_reg6_in         ),  //input  register 6
  .slv_reg6_out           ( slv_reg6_out        ),  //output register 6
  .slv_reg7_in            ( slv_reg7_in         ),  //input  register 7
  .slv_reg7_out           ( slv_reg7_out        ),  //output register 7

  .slv_reg8_in            ( slv_reg8_in         ),  //input  register 8
  .slv_reg8_out           ( slv_reg8_out        ),  //output register 8
  .slv_reg9_in            ( slv_reg9_in         ),  //input  register 9
  .slv_reg9_out           ( slv_reg9_out        ),  //output register 9
  .slv_reg10_in           ( slv_reg10_in        ),  //input  register 10
  .slv_reg10_out          ( slv_reg10_out       ),  //output register 10
  .slv_reg11_in           ( slv_reg11_in        ),  //input  register 11
  .slv_reg11_out          ( slv_reg11_out       ),  //output register 11
  .slv_reg12_in           ( slv_reg12_in        ),  //input  register 12
  .slv_reg12_out          ( slv_reg12_out       ),  //output register 12
  .slv_reg13_in           ( slv_reg13_in        ),  //input  register 13
  .slv_reg13_out          ( slv_reg13_out       ),  //output register 13
  .slv_reg14_in           ( slv_reg14_in        ),  //input  register 14
  .slv_reg14_out          ( slv_reg14_out       ),  //output register 14
  .slv_reg15_in           ( slv_reg15_in        ),  //input  register 15
  .slv_reg15_out          ( slv_reg15_out       ),  //output register 15

  .S_AXI_ACLK             ( ACLK                ),  //input
  .S_AXI_ARESETN          ( ARESETN             ),  //input

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
  .S_AXI_RREADY           ( M_AXI_GP0_rready    )   //input
);
//--------------------------------------------------------------
endmodule