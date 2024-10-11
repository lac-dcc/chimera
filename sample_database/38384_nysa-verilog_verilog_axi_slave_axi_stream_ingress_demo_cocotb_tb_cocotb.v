// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps


module tb_cocotb #(
  parameter ADDR_WIDTH          = 32,
  parameter DATA_WIDTH          = 32,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8)
)(

input                               clk,
input                               rst,

//Write Address Channel
input                               AXIMS_TVALID,
input       [ADDR_WIDTH - 1: 0]     AXIMS_TDATA,
output                              AXIMS_TREADY,

input                               AXIMS_TLAST,
input       [STROBE_WIDTH - 1: 0]   AXIMS_TKEEP,
input       [STROBE_WIDTH - 1: 0]   AXIMS_TSTRB,
input       [3:0]                   AXIMS_TID,
input       [31:0]                  AXIMS_TDEST,
input       [3:0]                   AXIMS_TUSER
);


//Parameters
//Registers

reg               r_rst;
always @ (*)      r_rst           = rst;

//submodules

axi_stream_ingress_demo #(
  .ADDR_WIDTH   (ADDR_WIDTH     ),
  .DATA_WIDTH   (DATA_WIDTH     )
) dut (
  .clk          (clk            ),
  .rst          (r_rst          ),


  .i_tvalid     (AXIMS_TVALID   ),
  .i_tdata      (AXIMS_TDATA    ),
  .o_tready     (AXIMS_TREADY   ),

  .i_tlast      (AXIMS_TLAST    ),
  .i_tkeep      (AXIMS_TKEEP    ),
  .i_tstrb      (AXIMS_TSTRB    ),
  .i_tid        (AXIMS_TID      ),
  .i_tdest      (AXIMS_TDEST    ),
  .i_tuser      (AXIMS_TUSER    )
);


//asynchronus logic
//synchronous logic

initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end


endmodule
