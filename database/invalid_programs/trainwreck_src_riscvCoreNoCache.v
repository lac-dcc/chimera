`include "riscvConst.vh"
`include "macros.vh"
`include "vuVXU-Opcode.vh"

module riscvCoreNoCache #
(
  parameter COREID = 0,
  parameter HAS_FPU = 0,
  parameter HAS_VECTOR = 0
)
(
  input clk,
  input reset,

  output error_mode,
  output log_control,

  input         htif_fromhost_wen,
  input  [31:0] htif_fromhost,
  output [31:0] htif_tohost,

  output       console_out_val,
  input        console_out_rdy,
  output [7:0] console_out_bits,

  output        imem_cp_req_val,
  input         imem_cp_req_rdy,
  output [31:0] imem_cp_req_addr,
  input         imem_cp_resp_val,
  input  [31:0] imem_cp_resp_data,

  output        imem_vec_req_val,
  input         imem_vec_req_rdy,
  output [31:0] imem_vec_req_addr,
  input         imem_vec_resp_val,
  input  [31:0] imem_vec_resp_data,
 
  output         dcache_req_val,
  input          dcache_req_rdy,
  output [3:0]   dcache_req_op,
  output [31:0]  dcache_req_addr,
  output [127:0] dcache_req_data,
  output [15:0]  dcache_req_wmask,
  output [14:0]  dcache_req_tag,
  input          dcache_resp_val,
  input  [127:0] dcache_resp_data,
  input  [14:0]  dcache_resp_tag
);

  wire [19:0]  vec_cmdq_enq_bits;
  wire         vec_cmdq_enq_val;

  wire [63:0]  vec_ximm1q_enq_bits;
  wire         vec_ximm1q_enq_val;

  wire [31:0]  vec_ximm2q_enq_bits;
  wire         vec_ximm2q_enq_val;

  wire [19:0]  vec_cmdq_deq_bits;
  wire         vec_cmdq_deq_val;
  wire         vec_cmdq_deq_rdy;

  wire [63:0]  vec_ximm1q_deq_bits;
  wire         vec_ximm1q_deq_val;
  wire         vec_ximm1q_deq_rdy;

  wire [31:0]  vec_ximm2q_deq_bits;
  wire         vec_ximm2q_deq_val;
  wire         vec_ximm2q_deq_rdy;

  wire         vec_ackq_val;
  wire         vec_ackq_rdy;

  wire              cp_imul_val;
  wire              cp_imul_rdy;
  wire `DEF_VAU0_FN cp_imul_fn;
  wire `DEF_XLEN    cp_imul_in0;
  wire `DEF_XLEN    cp_imul_in1;
  wire `DEF_XLEN    cp_imul_out;

  wire              cp_fma_val;
  wire              cp_fma_rdy;
  wire `DEF_VAU1_FN cp_fma_fn;
  wire `DEF_FLEN    cp_fma_in0;
  wire `DEF_FLEN    cp_fma_in1;
  wire `DEF_FLEN    cp_fma_in2;
  wire `DEF_FLEN    cp_fma_out;
  wire `DEF_EXC     cp_fma_exc;

  wire         dmem_cp_req_val;
  wire         dmem_cp_req_rdy;
  wire [3:0]   dmem_cp_req_op;
  wire [31:0]  dmem_cp_req_addr;
  wire [63:0]  dmem_cp_req_data;
  wire [7:0]   dmem_cp_req_wmask;
  wire [11:0]  dmem_cp_req_tag;
  wire         dmem_cp_resp_val;
  wire [63:0]  dmem_cp_resp_data;
  wire [11:0]  dmem_cp_resp_tag;

  wire         dmem_vec_req_val;
  wire         dmem_vec_req_rdy;
  wire [3:0]   dmem_vec_req_op;
  wire [31:0]  dmem_vec_req_addr;
  wire [127:0] dmem_vec_req_data;
  wire [15:0]  dmem_vec_req_wmask;
  wire [11:0]  dmem_vec_req_tag;
  wire         dmem_vec_resp_val;
  wire [127:0] dmem_vec_resp_data;
  wire [11:0]  dmem_vec_resp_tag;

  wire         dmem_ut_req_val;
  wire         dmem_ut_req_rdy;
  wire [3:0]   dmem_ut_req_op;
  wire [31:0]  dmem_ut_req_addr;
  wire [63:0]  dmem_ut_req_data;
  wire [7:0]   dmem_ut_req_wmask;
  wire [11:0]  dmem_ut_req_tag;
  wire         dmem_ut_resp_val;
  wire [63:0]  dmem_ut_resp_data;
  wire [11:0]  dmem_ut_resp_tag;

  wire [11:0]  dmem_resp_tag;
  wire [63:0]  dmem_resp_data64;
  wire [127:0] dmem_resp_data128;

  wire error_mode_proc;
  wire vec_illegal;
  assign error_mode = error_mode_proc | vec_illegal;

  wire vec_cmdq_deq;
  wire vec_ximm1q_deq;
  wire vec_ximm2q_deq;

  riscvProc #(.COREID(COREID), .HAS_FPU(HAS_FPU), .HAS_VECTOR(HAS_VECTOR)) proc
  (
    .clk(clk),
    .reset(reset),

    .error_mode(error_mode_proc),
    .log_control(log_control),

    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),

    .console_out_val(console_out_val),
    .console_out_rdy(console_out_rdy),
    .console_out_bits(console_out_bits),

    .vec_cmdq_bits(vec_cmdq_enq_bits),
    .vec_cmdq_val(vec_cmdq_enq_val),

    .vec_ximm1q_bits(vec_ximm1q_enq_bits),
    .vec_ximm1q_val(vec_ximm1q_enq_val),

    .vec_ximm2q_bits(vec_ximm2q_enq_bits),
    .vec_ximm2q_val(vec_ximm2q_enq_val),

    .vec_cmdq_deq(vec_cmdq_deq),
    .vec_ximm1q_deq(vec_ximm1q_deq),
    .vec_ximm2q_deq(vec_ximm2q_deq),

    .vec_ackq_val(vec_ackq_val),
    .vec_ackq_rdy(vec_ackq_rdy),

    .cp_imul_val(cp_imul_val),
    .cp_imul_rdy(cp_imul_rdy),
    .cp_imul_fn(cp_imul_fn),
    .cp_imul_in0(cp_imul_in0),
    .cp_imul_in1(cp_imul_in1),
    .cp_imul_out(cp_imul_out),

    .cp_fma_val(cp_fma_val),
    .cp_fma_rdy(cp_fma_rdy),
    .cp_fma_fn(cp_fma_fn),
    .cp_fma_in0(cp_fma_in0),
    .cp_fma_in1(cp_fma_in1),
    .cp_fma_in2(cp_fma_in2),
    .cp_fma_out(cp_fma_out),
    .cp_fma_exc(cp_fma_exc),

    .imem_req_val(imem_cp_req_val),
    .imem_req_rdy(imem_cp_req_rdy),
    .imem_req_addr(imem_cp_req_addr),
    .imem_resp_val(imem_cp_resp_val),
    .imem_resp_data(imem_cp_resp_data),

    .dmem_req_val(dmem_cp_req_val),
    .dmem_req_rdy(dmem_cp_req_rdy),
    .dmem_req_op(dmem_cp_req_op),
    .dmem_req_addr(dmem_cp_req_addr),
    .dmem_req_data(dmem_cp_req_data),
    .dmem_req_wmask(dmem_cp_req_wmask),
    .dmem_req_tag(dmem_cp_req_tag),
    .dmem_resp_val(dmem_cp_resp_val),
    .dmem_resp_data(dmem_cp_resp_data),
    .dmem_resp_tag(dmem_cp_resp_tag)
  );

  generate
    if (HAS_VECTOR)
    begin
      `VC_SIMPLE_QUEUE(20, `VEC_CMDQ_DEPTH) vec_cmdq
      (
        .clk(clk),
        .reset(reset),

        .enq_bits(vec_cmdq_enq_bits),
        .enq_val(vec_cmdq_enq_val),
        .enq_rdy(), // handled by counter in ctrl

        .deq_bits(vec_cmdq_deq_bits),
        .deq_val(vec_cmdq_deq_val),
        .deq_rdy(vec_cmdq_deq_rdy)
      );

      `VC_SIMPLE_QUEUE(64, `VEC_XIMM1Q_DEPTH) vec_ximm1q
      (
        .clk(clk),
        .reset(reset),

        .enq_bits(vec_ximm1q_enq_bits),
        .enq_val(vec_ximm1q_enq_val),
        .enq_rdy(), // handled by counter in ctrl

        .deq_bits(vec_ximm1q_deq_bits),
        .deq_val(vec_ximm1q_deq_val),
        .deq_rdy(vec_ximm1q_deq_rdy)
      );

      `VC_SIMPLE_QUEUE(32, `VEC_XIMM2Q_DEPTH) vec_ximm2q
      (
        .clk(clk),
        .reset(reset),

        .enq_bits(vec_ximm2q_enq_bits),
        .enq_val(vec_ximm2q_enq_val),
        .enq_rdy(), // handled by counter in ctrl

        .deq_bits(vec_ximm2q_deq_bits),
        .deq_val(vec_ximm2q_deq_val),
        .deq_rdy(vec_ximm2q_deq_rdy)
      );

      assign vec_cmdq_deq = vec_cmdq_deq_val & vec_cmdq_deq_rdy;
      assign vec_ximm1q_deq = vec_ximm1q_deq_val & vec_ximm1q_deq_rdy;
      assign vec_ximm2q_deq = vec_ximm2q_deq_val & vec_ximm2q_deq_rdy;

      vu vu
      (
        .clk(clk),
        .reset(reset),

        .illegal(vec_illegal),

        .vec_cmdq_bits(vec_cmdq_deq_bits),
        .vec_cmdq_val(vec_cmdq_deq_val),
        .vec_cmdq_rdy(vec_cmdq_deq_rdy),

        .vec_ximm1q_bits(vec_ximm1q_deq_bits),
        .vec_ximm1q_val(vec_ximm1q_deq_val),
        .vec_ximm1q_rdy(vec_ximm1q_deq_rdy),

        .vec_ximm2q_bits(vec_ximm2q_deq_bits),
        .vec_ximm2q_val(vec_ximm2q_deq_val),
        .vec_ximm2q_rdy(vec_ximm2q_deq_rdy),

        .vec_ackq_bits(),
        .vec_ackq_val(vec_ackq_val),
        .vec_ackq_rdy(vec_ackq_rdy),

        .cp_imul_val(cp_imul_val),
        .cp_imul_rdy(cp_imul_rdy),
        .cp_imul_fn(cp_imul_fn),
        .cp_imul_in0(cp_imul_in0),
        .cp_imul_in1(cp_imul_in1),
        .cp_imul_out(cp_imul_out),

        .cp_fma_val(cp_fma_val),
        .cp_fma_rdy(cp_fma_rdy),
        .cp_fma_fn(cp_fma_fn),
        .cp_fma_in0(cp_fma_in0),
        .cp_fma_in1(cp_fma_in1),
        .cp_fma_in2(cp_fma_in2),
        .cp_fma_out(cp_fma_out),
        .cp_fma_exc(cp_fma_exc),

        .imem_req_addr(imem_vec_req_addr),
        .imem_req_val(imem_vec_req_val),
        .imem_req_rdy(imem_vec_req_rdy),
        .imem_resp_data(imem_vec_resp_data),
        .imem_resp_val(imem_vec_resp_val),

        .dmem_req_ut_addr(dmem_ut_req_addr[31:2]),
        .dmem_req_ut_op(dmem_ut_req_op),
        .dmem_req_ut_data(dmem_ut_req_data),
        .dmem_req_ut_wmask(dmem_ut_req_wmask),
        .dmem_req_ut_tag(dmem_ut_req_tag),
        .dmem_req_ut_val(dmem_ut_req_val),
        .dmem_req_ut_rdy(dmem_ut_req_rdy),

        .dmem_resp_ut_val(dmem_ut_resp_val),
        .dmem_resp_ut_tag(dmem_ut_resp_tag),
        .dmem_resp_ut_data(dmem_ut_resp_data),

        .dmem_req_vec_addr(dmem_vec_req_addr[31:4]),
        .dmem_req_vec_op(dmem_vec_req_op),
        .dmem_req_vec_data(dmem_vec_req_data),
        .dmem_req_vec_wmask(dmem_vec_req_wmask),
        .dmem_req_vec_tag(dmem_vec_req_tag),
        .dmem_req_vec_val(dmem_vec_req_val),
        .dmem_req_vec_rdy(dmem_vec_req_rdy),

        .dmem_resp_vec_val(dmem_vec_resp_val),
        .dmem_resp_vec_tag(dmem_vec_resp_tag),
        .dmem_resp_vec_data(dmem_vec_resp_data)
      );

      assign dmem_ut_req_addr[1:0] = 2'b00;

      xbarProcCache xbarCache
      (
        .clk(clk),
        .reset(reset),

        .dcache_req_addr(dcache_req_addr),
        .dcache_req_op(dcache_req_op),
        .dcache_req_data(dcache_req_data),
        .dcache_req_wmask(dcache_req_wmask),
        .dcache_req_tag(dcache_req_tag),
        .dcache_req_val(dcache_req_val),
        .dcache_req_rdy(dcache_req_rdy),

        .dcache_resp_val(dcache_resp_val),
        .dcache_resp_data(dcache_resp_data),
        .dcache_resp_tag(dcache_resp_tag),

        .dmem_req2_addr(dmem_ut_req_addr),
        .dmem_req2_op(dmem_ut_req_op),
        .dmem_req2_data(dmem_ut_req_data),
        .dmem_req2_wmask(dmem_ut_req_wmask),
        .dmem_req2_tag(dmem_ut_req_tag),
        .dmem_req2_val(dmem_ut_req_val),
        .dmem_req2_rdy(dmem_ut_req_rdy),
        .dmem_resp2_val(dmem_ut_resp_val),

        .dmem_req3_addr(dmem_vec_req_addr),
        .dmem_req3_op(dmem_vec_req_op),
        .dmem_req3_data(dmem_vec_req_data),
        .dmem_req3_wmask(dmem_vec_req_wmask),
        .dmem_req3_tag(dmem_vec_req_tag),
        .dmem_req3_val(dmem_vec_req_val),
        .dmem_req3_rdy(dmem_vec_req_rdy),
        .dmem_resp3_val(dmem_vec_resp_val),

        .dmem_req4_addr(dmem_cp_req_addr),
        .dmem_req4_op(dmem_cp_req_op),
        .dmem_req4_data(dmem_cp_req_data),
        .dmem_req4_wmask(dmem_cp_req_wmask),
        .dmem_req4_tag(dmem_cp_req_tag),
        .dmem_req4_val(dmem_cp_req_val),
        .dmem_req4_rdy(dmem_cp_req_rdy),
        .dmem_resp4_val(dmem_cp_resp_val),

        .dmem_resp_tag(dmem_resp_tag),
        .dmem_resp_data64(dmem_resp_data64),
        .dmem_resp_data128(dmem_resp_data128)
      );

      assign dmem_ut_resp_tag = dmem_resp_tag;
      assign dmem_ut_resp_data = dmem_resp_data64;

      assign dmem_vec_resp_tag = dmem_resp_tag;
      assign dmem_vec_resp_data = dmem_resp_data128;

      assign dmem_cp_resp_tag = dmem_resp_tag;
      assign dmem_cp_resp_data = dmem_resp_data64;
    end
    else // ~HAS_VECTOR
    begin
      // hook up vec illegal to 1'b0
      assign vec_illegal = 1'b0;
      assign vec_cmdq_deq = 1'b0;
      assign vec_ximm1q_deq = 1'b0;
      assign vec_ximm2q_deq = 1'b0;

      // hook up the d$
      wire [127:0] dmem_cp_req_data128 = {dmem_cp_req_data, dmem_cp_req_data};
      wire [15:0]  dmem_cp_req_wmask16 = dmem_cp_req_addr[3] ? {dmem_cp_req_wmask, 8'd0} : {8'd0, dmem_cp_req_wmask};

      assign dcache_req_val = dmem_cp_req_val;
      assign dmem_cp_req_rdy = dcache_req_rdy;
      assign dcache_req_addr = dmem_cp_req_addr;
      assign dcache_req_op = dmem_cp_req_op;
      assign dcache_req_data = dmem_cp_req_data128;
      assign dcache_req_wmask = dmem_cp_req_wmask16;
      assign dcache_req_tag = {2'd0, dmem_cp_req_addr[3], dmem_cp_req_tag};
      assign dmem_cp_resp_val = dcache_resp_val;

      wire [127:0] dmem_resp_data128 = dcache_resp_data;
      wire [14:0]  dmem_resp_tag = dcache_resp_tag;

      assign dmem_cp_resp_tag = dmem_resp_tag[11:0];
      assign dmem_cp_resp_data = dmem_resp_tag[12] ? dmem_resp_data128[127:64] : dmem_resp_data128[63:0];

      // hook up the vector port
      assign vec_ackq_val = 1'b1;

      // hook up the integer multiplier
      assign cp_imul_rdy = 1'b1;
      wire dummy;

      vuVXU_Banked8_FU_imul imul
      (
        .clk(clk),
        .reset(reset),
        .val(cp_imul_val),
        .fn(cp_imul_fn),
        .in0({1'b0, cp_imul_in0}),
        .in1({1'b0, cp_imul_in1}),
        .out({dummy,cp_imul_out})
      );

      // hook up the fma pipeline
      if (HAS_FPU)
      begin
        assign cp_fma_rdy = 1'b1;

        vuVXU_Banked8_FU_fma fma
        (
          .clk(clk),
          .reset(reset),
          .val(cp_fma_val),
          .fn(cp_fma_fn),
          .in0(cp_fma_in0),
          .in1(cp_fma_in1),
          .in2(cp_fma_in2),
          .out(cp_fma_out),
          .exc(cp_fma_exc)
        );
      end // HAS_FPU
    end
  endgenerate

endmodule
