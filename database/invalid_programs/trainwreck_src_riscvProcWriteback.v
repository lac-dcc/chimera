`include "fpu_common.v"
`include "riscvConst.vh"

module riscvProcWriteback
(
  input clk,
  input reset,

  input dmem_resp_val,
  input [63:0] dmem_resp_data,
  input [11:0] dmem_resp_tag,

  input [63:0] mul_result_bits,
  input [4:0]  mul_result_tag,
  input        mul_result_val,

  input [63:0] div_result_bits,
  input [4:0]  div_result_tag,
  input        div_result_val,

  input fpu_fwbq_val,
  input [`FPR_WIDTH-1:0] fpu_fwbq_bits,
  input [`FPRID_WIDTH-1:0] fpu_fwbq_tag,

  output mul_mwbq_deq,
  output div_dwbq_deq,
  output fpu_fwbq_deq,

  output [`FPR_WIDTH-1:0] fpu_ld_data,
  output [`FPRID_WIDTH-1:0] fpu_ld_rd,
  output fpu_ld_val,
  output [`PRECISION_WIDTH-1:0] fpu_ld_precision,

  output [4:0] ll_waddr,
  output ll_wen,
  output [63:0] ll_wdata
);

  wire [1:0] sel;

  wire [63:0] mwbq_deq_bits;
  wire [4:0]  mwbq_deq_tag;
  wire        mwbq_deq_val;
  wire        mwbq_deq_rdy;
  wire [63:0] dwbq_deq_bits;
  wire [4:0]  dwbq_deq_tag;
  wire        dwbq_deq_val;
  wire        dwbq_deq_rdy;
  wire [63:0] fwbq_deq_bits;
  wire [4:0]  fwbq_deq_tag;
  wire        fwbq_deq_val;
  wire        fwbq_deq_rdy;

  wire dmem_resp_xf = dmem_resp_tag[11];
  wire [2:0] dmem_resp_type = dmem_resp_tag[10:8];
  wire [2:0] dmem_resp_pos = dmem_resp_tag[7:5];
  wire [4:0] dmem_resp_waddr = dmem_resp_tag[4:0];

  wire dmem_resp_xval = dmem_resp_val & ~dmem_resp_xf;
  wire dmem_resp_fval = dmem_resp_val & dmem_resp_xf;

  riscvProcWritebackArbiter arbiter
  (
    .dmem_resp_val(dmem_resp_xval),

    .mwbq_deq_val(mwbq_deq_val),
    .mwbq_deq_rdy(mwbq_deq_rdy),

    .dwbq_deq_val(dwbq_deq_val),
    .dwbq_deq_rdy(dwbq_deq_rdy),

    .fwbq_deq_val(fwbq_deq_val),
    .fwbq_deq_rdy(fwbq_deq_rdy),

    .sel(sel)
  );

  `VC_SIMPLE_QUEUE(69,`MUL_WBQ_DEPTH) mwbq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({mul_result_tag,mul_result_bits}),
    .enq_val(mul_result_val),
    .enq_rdy(), // issue logic takes care of this

    .deq_bits({mwbq_deq_tag,mwbq_deq_bits}),
    .deq_val(mwbq_deq_val),
    .deq_rdy(mwbq_deq_rdy)
  );

  `VC_SIMPLE_QUEUE(69,`DIV_WBQ_DEPTH) dwbq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({div_result_tag,div_result_bits}),
    .enq_val(div_result_val),
    .enq_rdy(), // issue logic takes care of this

    .deq_bits({dwbq_deq_tag,dwbq_deq_bits}),
    .deq_val(dwbq_deq_val),
    .deq_rdy(dwbq_deq_rdy)
  );

  `VC_SIMPLE_QUEUE(69,`FPU_WBQ_DEPTH) fwbq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({fpu_fwbq_tag,fpu_fwbq_bits}),
    .enq_val(fpu_fwbq_val),
    .enq_rdy(), // issue logic takes care of this

    .deq_bits({fwbq_deq_tag,fwbq_deq_bits}),
    .deq_val(fwbq_deq_val),
    .deq_rdy(fwbq_deq_rdy)
  );

  assign mul_mwbq_deq = mwbq_deq_val & mwbq_deq_rdy;
  assign div_dwbq_deq = dwbq_deq_val & dwbq_deq_rdy;
  assign fpu_fwbq_deq = fwbq_deq_val & fwbq_deq_rdy;

  wire [31:0] dmem_resp_data_w
    = dmem_resp_pos[2] ? dmem_resp_data[63:32]
    : dmem_resp_data[31:0];

  wire [15:0] dmem_resp_data_h
    = dmem_resp_pos[1] ? dmem_resp_data_w[31:16]
    : dmem_resp_data_w[15:0];

  wire [7:0] dmem_resp_data_b
    = dmem_resp_pos[0] ? dmem_resp_data_h[15:8]
    : dmem_resp_data_h[7:0];

  wire [63:0] dmem_resp_data_final
    = (dmem_resp_type == `MT_B) ? {{56{dmem_resp_data_b[7]}}, dmem_resp_data_b}
    : (dmem_resp_type == `MT_BU) ? {56'd0, dmem_resp_data_b}
    : (dmem_resp_type == `MT_H) ? {{48{dmem_resp_data_h[15]}}, dmem_resp_data_h}
    : (dmem_resp_type == `MT_HU) ? {48'd0, dmem_resp_data_h}
    : (dmem_resp_type == `MT_W) ? {{32{dmem_resp_data_w[31]}}, dmem_resp_data_w}
    : (dmem_resp_type == `MT_WU) ? {32'd0, dmem_resp_data_w}
    : (dmem_resp_type == `MT_D) ? dmem_resp_data
    : 64'bx;

  assign ll_wen
    = dmem_resp_xval | mwbq_deq_val | dwbq_deq_val | fwbq_deq_val;

  assign ll_waddr
    = (sel == 2'd0) ? dmem_resp_waddr
    : (sel == 2'd1) ? mwbq_deq_tag
    : (sel == 2'd2) ? dwbq_deq_tag
    : (sel == 2'd3) ? fwbq_deq_tag
    : 5'bx;

  assign ll_wdata
    = (sel == 2'd0) ? dmem_resp_data_final
    : (sel == 2'd1) ? mwbq_deq_bits
    : (sel == 2'd2) ? dwbq_deq_bits
    : (sel == 2'd3) ? fwbq_deq_bits
    : 64'bx;

  assign fpu_ld_data = dmem_resp_data_final;
  assign fpu_ld_rd = dmem_resp_waddr;
  assign fpu_ld_val = dmem_resp_fval;
  assign fpu_ld_precision
    = (dmem_resp_type == `MT_WU) ? `PRECISION_S
    : (dmem_resp_type == `MT_D) ? `PRECISION_D
    : 1'bx;

endmodule
