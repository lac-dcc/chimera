`timescale 1ns/1ps
`include "log.vh"
module tabla_wrapper #(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer AXIS_DATA_WIDTH       = 32,
    parameter integer AXIS_ADDR_WIDTH       = 32,
    parameter integer AXIM_DATA_WIDTH       = 8,
    parameter integer AXIM_ADDR_WIDTH       = 32,

    parameter integer PERF_CNTR_WIDTH       = 10,

    parameter integer DATA_WIDTH            = 4,
    parameter integer NUM_AXI               = 1,
    parameter integer NUM_PE                = NUM_DATA,
    parameter integer RD_BUF_ADDR_WIDTH     = 10,
    parameter integer NAMESPACE_WIDTH       = 2,
    parameter integer TX_SIZE_WIDTH         = 9,
    parameter         TYPE                  = "LOOPBACK"
// ******************************************************************
) (
// ******************************************************************
// IO
// ******************************************************************
    // Clk and Reset
    input  wire                             ACLK,
    input  wire                             ARESETN,

    // Master Interface Write Address
    output wire [32*NUM_AXI       -1 : 0]   S_AXI_AWADDR,
    output wire [2*NUM_AXI        -1 : 0]   S_AXI_AWBURST,
    output wire [4*NUM_AXI        -1 : 0]   S_AXI_AWCACHE,
    output wire [6*NUM_AXI        -1 : 0]   S_AXI_AWID,
    output wire [4*NUM_AXI        -1 : 0]   S_AXI_AWLEN,
    output wire [2*NUM_AXI        -1 : 0]   S_AXI_AWLOCK,
    output wire [3*NUM_AXI        -1 : 0]   S_AXI_AWPROT,
    output wire [4*NUM_AXI        -1 : 0]   S_AXI_AWQOS,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_AWUSER,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_AWREADY,
    output wire [3*NUM_AXI        -1 : 0]   S_AXI_AWSIZE,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_AWVALID,
    
    // Master Interface Write Data
    output wire [RD_IF_DATA_WIDTH -1 : 0]   S_AXI_WDATA,
    output wire [6*NUM_AXI        -1 : 0]   S_AXI_WID,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_WUSER,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_WLAST,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_WREADY,
    output wire [WSTRB_WIDTH      -1 : 0]   S_AXI_WSTRB,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_WVALID,

    // Master Interface Write Response
    input  wire [6*NUM_AXI        -1 : 0]   S_AXI_BID,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_BUSER,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_BREADY,
    input  wire [2*NUM_AXI        -1 : 0]   S_AXI_BRESP,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_BVALID,
    
    // Master Interface Read Address
    output wire [32*NUM_AXI       -1 : 0]   S_AXI_ARADDR,
    output wire [2*NUM_AXI        -1 : 0]   S_AXI_ARBURST,
    output wire [4*NUM_AXI        -1 : 0]   S_AXI_ARCACHE,
    output wire [6*NUM_AXI        -1 : 0]   S_AXI_ARID,
    output wire [4*NUM_AXI        -1 : 0]   S_AXI_ARLEN,
    output wire [2*NUM_AXI        -1 : 0]   S_AXI_ARLOCK,
    output wire [3*NUM_AXI        -1 : 0]   S_AXI_ARPROT,
    output wire [4*NUM_AXI        -1 : 0]   S_AXI_ARQOS,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_ARUSER,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_ARREADY,
    output wire [3*NUM_AXI        -1 : 0]   S_AXI_ARSIZE,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_ARVALID,

    // Master Interface Read Data 
    input  wire [RD_IF_DATA_WIDTH -1 : 0]   S_AXI_RDATA,
    input  wire [6*NUM_AXI        -1 : 0]   S_AXI_RID,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_RUSER,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_RLAST,
    output wire [1*NUM_AXI        -1 : 0]   S_AXI_RREADY,
    input  wire [2*NUM_AXI        -1 : 0]   S_AXI_RRESP,
    input  wire [1*NUM_AXI        -1 : 0]   S_AXI_RVALID,

    input  wire [AXIS_ADDR_WIDTH  -1 : 0]   M_AXI_GP0_AWADDR,
    input  wire [2:0]                       M_AXI_GP0_AWPROT,
    output wire                             M_AXI_GP0_AWREADY,
    input  wire                             M_AXI_GP0_AWVALID,
    input  wire [AXIS_DATA_WIDTH  -1 : 0]   M_AXI_GP0_WDATA,
    input  wire [AXIS_DATA_WIDTH/8-1 : 0]   M_AXI_GP0_WSTRB,
    input  wire                             M_AXI_GP0_WVALID,
    output wire                             M_AXI_GP0_WREADY,
    output wire [1:0]                       M_AXI_GP0_BRESP,
    output wire                             M_AXI_GP0_BVALID,
    input  wire                             M_AXI_GP0_BREADY,
    input  wire [AXIS_ADDR_WIDTH  -1 : 0]   M_AXI_GP0_ARADDR,
    input  wire [2:0]                       M_AXI_GP0_ARPROT,
    input  wire                             M_AXI_GP0_ARVALID,
    output wire                             M_AXI_GP0_ARREADY,
    output wire [AXIS_DATA_WIDTH  -1 : 0]   M_AXI_GP0_RDATA,
    output wire [1:0]                       M_AXI_GP0_RRESP,
    output wire                             M_AXI_GP0_RVALID,
    input  wire                             M_AXI_GP0_RREADY
// ******************************************************************
);

// ******************************************************************
// Localparams
// ******************************************************************
    localparam integer NUM_DATA             = AXIM_DATA_WIDTH * NUM_AXI / DATA_WIDTH;
    localparam integer PE_ID_WIDTH          = `C_LOG_2(NUM_PE/NUM_DATA);
    localparam integer CTRL_SINGLE_PE_WIDTH = (PE_ID_WIDTH + 1) + NAMESPACE_WIDTH;
    localparam integer CTRL_PE_WIDTH        = (PE_ID_WIDTH + 1) * NUM_DATA + NAMESPACE_WIDTH;
    localparam integer RD_IF_DATA_WIDTH     = DATA_WIDTH * NUM_DATA;
    localparam integer RD_BUF_DATA_WIDTH    = RD_IF_DATA_WIDTH / NUM_AXI;
    localparam integer WSTRB_WIDTH          = (RD_BUF_DATA_WIDTH/8) * NUM_AXI;
// ******************************************************************
	wire start; //TODO: START LOGIC

// ******************************************************************
// Wires and Regs
// ******************************************************************
    // TXN REQ
    wire                                    rx_req;
    wire [TX_SIZE_WIDTH    -1 : 0]          rx_req_size;
    wire                                    rx_done;

    wire                                    rd_done;
    wire                                    processing_done;
    wire                                    wr_done;

    wire [PERF_CNTR_WIDTH   -1 : 0]         total_cycles;
    wire [PERF_CNTR_WIDTH   -1 : 0]         rd_cycles;
    wire [PERF_CNTR_WIDTH   -1 : 0]         pr_cycles;
    wire [PERF_CNTR_WIDTH   -1 : 0]         wr_cycles;

    wire [RD_IF_DATA_WIDTH  -1 : 0]         mem_data_input;
    wire [RD_IF_DATA_WIDTH  -1 : 0]         mem_data_output;
    wire                                    DATA_INOUT_WB;
    wire                                    EOI;
    wire                                    EOC;

    wire                                    DATA_IO_DIR;
    wire [CTRL_PE_WIDTH-1:0]                CTRL_PE;
// ******************************************************************

// ******************************************************************
// Read Interface
// ******************************************************************
    assign rx_req_size = 32;
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
        .data_input             ( mem_data_input        ), //input
        .data_output            ( mem_data_output       ), //output
        .DATA_INOUT_WB          ( DATA_INOUT_WB         ), //input
        .EOI                    ( EOI                   ), //input
        .EOC                    ( EOC                   ), //input
        .DATA_IO_DIR            ( DATA_IO_DIR           ), //output
        .CTRL_PE                ( CTRL_PE               ), //output
    
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
    
        .rx_req                 ( rx_req                ), //input
        .rx_req_size            ( rx_req_size           ), //input
        .rx_done                ( rx_done               )  //output
    );
// ******************************************************************

// ******************************************************************
// AXI-SLAVE
// ******************************************************************
    axi4lite_slave #(
        .AXIS_DATA_WIDTH        ( AXIS_DATA_WIDTH       ),
        .AXIS_ADDR_WIDTH        ( AXIS_ADDR_WIDTH       ),
        .PERF_CNTR_WIDTH        ( PERF_CNTR_WIDTH       )
    ) axi_slave_i (
        .S_AXI_ACLK             ( ACLK                  ),  //input
        .S_AXI_ARESETN          ( ARESETN               ),  //input
    
        .S_AXI_AWADDR           ( M_AXI_GP0_AWADDR      ),  //input
        .S_AXI_AWPROT           ( M_AXI_GP0_AWPROT      ),  //input
        .S_AXI_AWVALID          ( M_AXI_GP0_AWVALID     ),  //input
        .S_AXI_AWREADY          ( M_AXI_GP0_AWREADY     ),  //output
    
        .S_AXI_WDATA            ( M_AXI_GP0_WDATA       ),  //input
        .S_AXI_WSTRB            ( M_AXI_GP0_WSTRB       ),  //input
        .S_AXI_WVALID           ( M_AXI_GP0_WVALID      ),  //input
        .S_AXI_WREADY           ( M_AXI_GP0_WREADY      ),  //output
    
        .S_AXI_BRESP            ( M_AXI_GP0_BRESP       ),  //output
        .S_AXI_BVALID           ( M_AXI_GP0_BVALID      ),  //output
        .S_AXI_BREADY           ( M_AXI_GP0_BREADY      ),  //input
    
        .S_AXI_ARADDR           ( M_AXI_GP0_ARADDR      ),  //input
        .S_AXI_ARPROT           ( M_AXI_GP0_ARPROT      ),  //input
        .S_AXI_ARVALID          ( M_AXI_GP0_ARVALID     ),  //input
        .S_AXI_ARREADY          ( M_AXI_GP0_ARREADY     ),  //output
    
        .S_AXI_RDATA            ( M_AXI_GP0_RDATA       ),  //output
        .S_AXI_RRESP            ( M_AXI_GP0_RRESP       ),  //output
        .S_AXI_RVALID           ( M_AXI_GP0_RVALID      ),  //output
        .S_AXI_RREADY           ( M_AXI_GP0_RREADY      ),  //input
    
        .tx_req                 ( rx_req                ),  //output
        .tx_done                ( rx_done               ),  //input
        
        .rd_done                ( rd_done               ),  //input
        .processing_done        ( processing_done       ),  //input
        .wr_done                ( wr_done               ),  //input
    
        .total_cycles           ( total_cycles          ),  //input
        .rd_cycles              ( rd_cycles             ),  //input
        .pr_cycles              ( pr_cycles             ),  //input
        .wr_cycles              ( wr_cycles             )   //input
    );
// ******************************************************************

// ******************************************************************
// PEs
// ******************************************************************
genvar i, j;
generate
for (i=0; i<NUM_DATA; i=i+1)
begin : SAME_PE_ID
    for (j=0; j<NUM_PE/NUM_DATA; j=j+1)
    begin : DIFF_PE_ID

        wire eoi, eoc, data_inout_wb;
        wire [DATA_WIDTH-1:0] pe_data_input;
        wire [DATA_WIDTH-1:0] pe_data_output;
        wire data_io_dir;
        wire [CTRL_SINGLE_PE_WIDTH-1:0] ctrl_pe;

        if (i==0 && j == 0) begin
            assign EOI = eoi;
            assign EOC = eoc;
            assign DATA_INOUT_WB = data_inout_wb;
        end

        assign data_io_dir = DATA_IO_DIR;
        //assign pe_data_input = !data_io_dir ? DATA_INOUT[i*DATA_WIDTH+:DATA_WIDTH] : 'b0;
        //assign DATA_INOUT[i*DATA_WIDTH+:DATA_WIDTH] = data_io_dir ? pe_data_output : 'b0;
        assign pe_data_input = mem_data_output[i*DATA_WIDTH+:DATA_WIDTH];
        assign mem_data_input[i*DATA_WIDTH+:DATA_WIDTH] = pe_data_output;
        assign ctrl_pe[NAMESPACE_WIDTH-1:0] = CTRL_PE[NAMESPACE_WIDTH-1:0];
        assign ctrl_pe[PE_ID_WIDTH+NAMESPACE_WIDTH:NAMESPACE_WIDTH] = CTRL_PE[NAMESPACE_WIDTH+(NUM_DATA-i-1)*(CTRL_SINGLE_PE_WIDTH-NAMESPACE_WIDTH)+:CTRL_SINGLE_PE_WIDTH-NAMESPACE_WIDTH];

        pe_dummy #(
            .DATA_WIDTH     ( DATA_WIDTH    ),
            .PE_INDEX       ( i             ),
            .PE_ID          ( j             ),
            .CTRL_PE_WIDTH  (CTRL_SINGLE_PE_WIDTH)
        ) u_pe_dummy (
            .ACLK           ( ACLK          ),
            .ARESETN        ( ARESETN       ),
            .START			( start			),
            .data_input     ( pe_data_input ),
            .data_output    ( pe_data_output),
            .DATA_INOUT_WB  ( data_inout_wb ),
            .CTRL_PE        ( ctrl_pe       ),
            .DATA_IO_DIR    ( data_io_dir   ),
            .EOI            ( eoi           ),
            .EOC            ( eoc           )
        );
    end
end
endgenerate
// ******************************************************************
endmodule
