// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module tb_cocotb #(
  parameter ADDR_WIDTH          = 8,
  parameter DATA_WIDTH          = 32,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter AXIS_WIDTH          = 24,
  parameter AXIS_STROBE_WIDTH   = (AXIS_WIDTH / 8),
  parameter FRAME_WIDTH         = 480,
  parameter FRAME_HEIGHT        = 272
)(

input                                   clk,
input                                   rst,

//Write Address Channel
input                                   AXIML_AWVALID,
input       [ADDR_WIDTH - 1: 0]         AXIML_AWADDR,
output                                  AXIML_AWREADY,

//Write Data Channel
input                                   AXIML_WVALID,
output                                  AXIML_WREADY,
input       [STROBE_WIDTH - 1:0]        AXIML_WSTRB,
input       [DATA_WIDTH - 1: 0]         AXIML_WDATA,

//Write Response Channel
output                                  AXIML_BVALID,
input                                   AXIML_BREADY,
output      [1:0]                       AXIML_BRESP,

//Read Address Channel
input                                   AXIML_ARVALID,
output                                  AXIML_ARREADY,
input       [ADDR_WIDTH - 1: 0]         AXIML_ARADDR,

//Read Data Channel
output                                  AXIML_RVALID,
input                                   AXIML_RREADY,
output      [1:0]                       AXIML_RRESP,
output      [DATA_WIDTH - 1: 0]         AXIML_RDATA,


output      [AXIS_WIDTH - 1:0]          AXISS_TDATA,
input                                   AXISS_TREADY,
output                                  AXISS_TVALID,
output                                  AXISS_TLAST,
output      [AXIS_STROBE_WIDTH - 1: 0]  AXISS_TKEEP,
output      [AXIS_STROBE_WIDTH - 1: 0]  AXISS_TSTRB,
output      [3:0]                       AXISS_TID,
output      [31:0]                      AXISS_TDEST,
output      [3:0]                       AXISS_TUSER

);


//Local Parameters
//Registers

reg               r_rst;
reg               r_axiss_tready;

always @ (*)      r_rst           = rst;
always @ (*)      r_axiss_tready  = AXISS_TREADY;
reg   [3:0]       test_id         = 0;


//submodules

axi_nes #(
  .AXIS_WIDTH         (AXIS_WIDTH       ),
  .INVERT_AXI_RESET   (0                ),
  .INVERT_AXIS_RESET  (0                ),
  .FRAME_WIDTH        (FRAME_WIDTH      ),
  .FRAME_HEIGHT       (FRAME_HEIGHT     )
) dut (
  .clk                (clk              ),
  .rst                (r_rst            ),

  //AXI Lite Interface
  .i_awvalid          (AXIML_AWVALID    ),
  .i_awaddr           (AXIML_AWADDR     ),
  .o_awready          (AXIML_AWREADY    ),


  .i_wvalid           (AXIML_WVALID     ),
  .o_wready           (AXIML_WREADY     ),
  .i_wstrb            (AXIML_WSTRB      ),
  .i_wdata            (AXIML_WDATA      ),


  .o_bvalid           (AXIML_BVALID     ),
  .i_bready           (AXIML_BREADY     ),
  .o_bresp            (AXIML_BRESP      ),


  .i_arvalid          (AXIML_ARVALID    ),
  .o_arready          (AXIML_ARREADY    ),
  .i_araddr           (AXIML_ARADDR     ),


  .o_rvalid           (AXIML_RVALID     ),
  .i_rready           (AXIML_RREADY     ),
  .o_rresp            (AXIML_RRESP      ),
  .o_rdata            (AXIML_RDATA      ),

  //AXI Stream
  .i_axis_clk         (clk              ),
  .i_axis_rst         (r_rst            ),
  .o_axis_user        (AXISS_TUSER      ),
  .i_axis_ready       (r_axiss_tready   ),
  .o_axis_data        (AXISS_TDATA      ),
  .o_axis_last        (AXISS_TLAST      ),
  .o_axis_valid       (AXISS_TVALID     )


);

//asynchronus logic
//synchronous logic

initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

endmodule
