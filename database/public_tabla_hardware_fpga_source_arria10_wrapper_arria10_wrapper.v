`timescale 1ns/1ps
module arria10_wrapper #(
  parameter integer READ_ADDR_BASE_0  = 32'h00000000,
  parameter integer WRITE_ADDR_BASE_0 = 32'h02000000,
  parameter integer TYPE              = "PU",
  parameter integer PERF_CNTR_WIDTH   = 10,
  parameter integer AXIM_DATA_WIDTH   = 64,
  parameter integer AXIM_ADDR_WIDTH   = 32,
  parameter integer AXIS_DATA_WIDTH   = 8,
  parameter integer AXIS_ADDR_WIDTH   = 8,
  parameter integer RD_BUF_ADDR_WIDTH = 8,
  parameter integer NUM_AXI           = 1,
  parameter integer DATA_WIDTH        = 16,
  parameter integer NUM_DATA          = AXIM_DATA_WIDTH*NUM_AXI/DATA_WIDTH,
  parameter integer NUM_PE            = 64,
  parameter integer VERBOSITY         = 2,
  parameter integer NAMESPACE_WIDTH   = 2,
  parameter integer TX_SIZE_WIDTH     = 10,
  parameter integer TEST_NUM_READS    = 5
// ******************************************************************
)
(

  input  wire                pll_ref_clk,
  input  wire                global_reset,

  input  wire [AXIS_ADDR_WIDTH-1:0]         M_AXI_GP0_awaddr,
  //input  wire [2:0]          M_AXI_GP0_awprot,
  output wire                M_AXI_GP0_awready,
  input  wire                M_AXI_GP0_awvalid,
  
  input  wire [AXIS_DATA_WIDTH-1:0]         M_AXI_GP0_wdata,
  //input  wire [3:0]          M_AXI_GP0_wstrb,
  input  wire                M_AXI_GP0_wvalid,
  output wire                M_AXI_GP0_wready,
  
  output wire [1:0]          M_AXI_GP0_bresp,
  output wire                M_AXI_GP0_bvalid,
  input  wire                M_AXI_GP0_bready,
  
  input  wire [AXIS_ADDR_WIDTH-1:0]         M_AXI_GP0_araddr,
  //input  wire [2:0]          M_AXI_GP0_arprot,
  input  wire                M_AXI_GP0_arvalid,
  output wire                M_AXI_GP0_arready,
  
  output  wire [AXIS_DATA_WIDTH-1:0]        M_AXI_GP0_rdata,
  output  wire [1:0]         M_AXI_GP0_rresp,
  output  wire               M_AXI_GP0_rvalid,
  input   wire               M_AXI_GP0_rready,

  output wire [31:0]         S_AXI_HP0_araddr,
  output wire [1:0]          S_AXI_HP0_arburst,
  output wire [3:0]          S_AXI_HP0_arcache,

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
  output wire [3:0]          S_AXI_HP0_awlen,
  output wire [1:0]          S_AXI_HP0_awlock,
  output wire [2:0]          S_AXI_HP0_awprot,
  output wire [3:0]          S_AXI_HP0_awqos,
  input  wire                S_AXI_HP0_awready,
  output wire [2:0]          S_AXI_HP0_awsize,
  output wire                S_AXI_HP0_awvalid,  

  //output wire                S_AXI_HP0_bready,
  //input  wire [1:0]          S_AXI_HP0_bresp,
  //input  wire                S_AXI_HP0_bvalid,
  
  input  wire [63:0]         S_AXI_HP0_rdata,
  input  wire                S_AXI_HP0_rlast,
  output wire                S_AXI_HP0_rready,
  //input  wire [1:0]          S_AXI_HP0_rresp,
  input  wire                S_AXI_HP0_rvalid,
  
  output wire [63:0]         S_AXI_HP0_wdata,
  output wire                S_AXI_HP0_wlast,
  input  wire                S_AXI_HP0_wready,
  //output wire [7:0]          S_AXI_HP0_wstrb,
  output wire                S_AXI_HP0_wvalid
 );

  
  localparam integer  C_S_AXI_DATA_WIDTH    = 32;
  localparam integer  C_S_AXI_ADDR_WIDTH    = 32;
  localparam integer  C_M_AXI_DATA_WIDTH    = 64;
  localparam integer  C_M_AXI_ADDR_WIDTH    = 32;
  
   wire pll_out_clk;
	wire locked;
  
// ******************************************************************
// PLL
// ******************************************************************
  wire ACLK, ARESETN;
  assign ACLK = pll_out_clk;
  assign ARESETN = locked;
	
	tabla_pll pll (
		.rst      	( global_reset	), //  reset.reset
		.refclk   	( pll_ref_clk	), // refclk.clk
		.locked   	( locked			), // locked.export
		.outclk_0 	( pll_out_clk	)  // outclk0.clk
	);
// ******************************************************************

// ******************************************************************
// Tabla
// ******************************************************************
tabla_wrapper #(

  .AXIS_DATA_WIDTH        ( AXIS_DATA_WIDTH       ),
  .AXIS_ADDR_WIDTH        ( AXIS_ADDR_WIDTH       ),
  .DATA_WIDTH             ( DATA_WIDTH            ),
  .AXIM_DATA_WIDTH        ( AXIM_DATA_WIDTH       ),
  .RD_BUF_ADDR_WIDTH      ( RD_BUF_ADDR_WIDTH     ),
  .NUM_PE                 ( NUM_PE                ),
  .NUM_AXI                ( NUM_AXI               ),
  .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH         )

) u_tabla_wrapper (

  .ACLK                   ( ACLK     				  ), //input
  .ARESETN                ( ARESETN               ), //input

  .S_AXI_ARADDR           ( S_AXI_HP0_araddr          ), //output
  .S_AXI_ARBURST          ( S_AXI_HP0_arburst         ), //output
  .S_AXI_ARCACHE          ( S_AXI_HP0_arcache         ), //output
  .S_AXI_ARID             ( S_AXI_HP0_arid            ), //output
  .S_AXI_ARLEN            ( S_AXI_HP0_arlen           ), //output
  .S_AXI_ARLOCK           ( S_AXI_HP0_arlock          ), //output
  .S_AXI_ARPROT           ( S_AXI_HP0_arprot          ), //output
  .S_AXI_ARQOS            ( S_AXI_HP0_arqos           ), //output
  .S_AXI_ARREADY          ( S_AXI_HP0_arready         ), //input
  .S_AXI_ARSIZE           ( S_AXI_HP0_arsize          ), //output
  .S_AXI_ARVALID          ( S_AXI_HP0_arvalid         ), //output
  .S_AXI_AWADDR           ( S_AXI_HP0_awaddr          ), //output
  .S_AXI_AWBURST          ( S_AXI_HP0_awburst         ), //output
  .S_AXI_AWCACHE          ( S_AXI_HP0_awcache         ), //output
  .S_AXI_AWID             ( S_AXI_HP0_awid            ), //output
  .S_AXI_AWLEN            ( S_AXI_HP0_awlen           ), //output
  .S_AXI_AWLOCK           ( S_AXI_HP0_awlock          ), //output
  .S_AXI_AWPROT           ( S_AXI_HP0_awprot          ), //output
  .S_AXI_AWQOS            ( S_AXI_HP0_awqos           ), //output
  .S_AXI_AWREADY          ( S_AXI_HP0_awready         ), //input
  .S_AXI_AWSIZE           ( S_AXI_HP0_awsize          ), //output
  .S_AXI_AWVALID          ( S_AXI_HP0_awvalid         ), //output
  .S_AXI_BID              ( S_AXI_HP0_bid             ), //input
  .S_AXI_BUSER            ( 'b0   ), //input
  .S_AXI_BREADY           ( S_AXI_HP0_bready          ), //output
  .S_AXI_BRESP            ( S_AXI_HP0_bresp           ), //input
  .S_AXI_BVALID           ( S_AXI_HP0_bvalid          ), //input
  .S_AXI_RDATA            ( S_AXI_HP0_rdata           ), //input
  .S_AXI_RID              ( S_AXI_HP0_rid             ), //input
  .S_AXI_RUSER            ( 'b0   ), //input
  .S_AXI_RLAST            ( S_AXI_HP0_rlast           ), //input
  .S_AXI_RREADY           ( S_AXI_HP0_rready          ), //output
  .S_AXI_RRESP            ( S_AXI_HP0_rresp           ), //input
  .S_AXI_RVALID           ( S_AXI_HP0_rvalid          ), //input
  .S_AXI_WDATA            ( S_AXI_HP0_wdata           ), //output
  .S_AXI_WID              ( S_AXI_HP0_wid             ), //output
  .S_AXI_WUSER            ( S_AXI_HP0_wuser           ), //output
  .S_AXI_WLAST            ( S_AXI_HP0_wlast           ), //output
  .S_AXI_WREADY           ( S_AXI_HP0_wready          ), //input
  .S_AXI_WSTRB            ( S_AXI_HP0_wstrb           ), //output
  .S_AXI_WVALID           ( S_AXI_HP0_wvalid          ), //output

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

endmodule
