//**************************************************************************
// RISC-V Baseline Processor
//--------------------------------------------------------------------------

`include "fpu_common.v"
`include "vuVXU-Opcode.vh"
`include "vuVXU-B8-Config.vh"
`include "riscvConst.vh"

module riscvProc #
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

  output [19:0] vec_cmdq_bits,
  output        vec_cmdq_val,

  output [63:0] vec_ximm1q_bits,
  output        vec_ximm1q_val,

  output [31:0] vec_ximm2q_bits,
  output        vec_ximm2q_val,

  input         vec_cmdq_deq,
  input         vec_ximm1q_deq,
  input         vec_ximm2q_deq,

  input         vec_ackq_val,
  output        vec_ackq_rdy,

  output              cp_imul_val,
  input               cp_imul_rdy,
  output `DEF_VAU0_FN cp_imul_fn,
  output `DEF_XLEN    cp_imul_in0,
  output `DEF_XLEN    cp_imul_in1,
  input  `DEF_XLEN    cp_imul_out,

  output              cp_fma_val,
  input               cp_fma_rdy,
  output `DEF_VAU1_FN cp_fma_fn,
  output `DEF_FLEN    cp_fma_in0,
  output `DEF_FLEN    cp_fma_in1,
  output `DEF_FLEN    cp_fma_in2,
  input  `DEF_FLEN    cp_fma_out,
  input  `DEF_EXC     cp_fma_exc,

  output        imem_req_val,
  input         imem_req_rdy,
  output [31:0] imem_req_addr,
  input         imem_resp_val,
  input  [31:0] imem_resp_data,
 
  output        dmem_req_val,
  input         dmem_req_rdy,
  output [3:0]  dmem_req_op,
  output [31:0] dmem_req_addr,
  output [63:0] dmem_req_data,
  output [7:0]  dmem_req_wmask,
  output [11:0] dmem_req_tag,
  input         dmem_resp_val,
  input  [63:0] dmem_resp_data,
  input  [11:0] dmem_resp_tag
);

  wire [7:0]  dpath_status;
  wire        dpath_btb_hit;
  wire [31:0] dpath_inst;
  wire [63:0] dpath_id_rdata2;
  wire [63:0] dpath_id_rdata1;
  wire [63:0] dpath_ex_rs2;
  wire        dpath_bypass_rs2;
  wire        dpath_bypass_rs1;
  wire        dpath_exception;
  wire        dpath_br_eq;
  wire        dpath_br_lt;
  wire        dpath_br_ltu;
  wire        dpath_vec_bank_lt3;
  wire        dpath_vec_appvl_eq0;
  wire [4:0]  dpath_waddr;
  wire [63:0] dpath_alu_out;
  wire [`FSR_WIDTH-1:0] dpath_fsr;

  wire [2:0] ctrl_sel_pc;
  wire       ctrl_wen_btb;
  wire       ctrl_stallf;
  wire       ctrl_stalld;
  wire       ctrl_killf;
  wire       ctrl_killd;
  wire       ctrl_ren2;
  wire       ctrl_ren1;
  wire [1:0] ctrl_sel_alu2;
  wire       ctrl_sel_alu1;
  wire       ctrl_fn_dw;
  wire [3:0] ctrl_fn_alu;
  wire       ctrl_wen;
  wire       ctrl_sel_wa;
  wire [1:0] ctrl_sel_wb;
  wire       ctrl_ren_pcr;
  wire       ctrl_wen_pcr;
  wire       ctrl_wen_fsr;
  wire       ctrl_fn_vec;
  wire       ctrl_wen_vec;
  wire [2:0] ctrl_sel_vcmd;
  wire [1:0] ctrl_sel_vimm;
  wire       ctrl_except_illegal;
  wire       ctrl_except_privileged;
  wire       ctrl_except_fpu;
  wire       ctrl_except_syscall;
  wire       ctrl_except_vec;
  wire       ctrl_except_vec_bank;
  wire       ctrl_eret;

  wire       mem_mrq_val;
  wire [3:0] mem_mrq_cmd;
  wire [2:0] mem_mrq_type;
  wire       mem_mrq_deq;

  wire       mul_val;
  wire [4:0] mul_waddr;
  wire       mul_mwbq_deq;

  wire [63:0] mul_result_bits;
  wire [4:0]  mul_result_tag;
  wire        mul_result_val;

  wire       div_rdy;
  wire       div_val;
  wire [2:0] div_fn;
  wire [4:0] div_waddr;
  wire       div_dwbq_deq;

  wire [63:0] div_result_bits;
  wire [4:0]  div_result_tag;
  wire        div_result_val;

  wire                        fpu_val;
  wire [`FPU_RM_WIDTH-1:0]    fpu_rm;
  wire [`PRECISION_WIDTH-1:0] fpu_precision;
  wire [`FPU_CMD_WIDTH-1:0]   fpu_cmd;
  wire [`FPRID_WIDTH-1:0]     fpu_rs1;
  wire [`FPRID_WIDTH-1:0]     fpu_rs2;
  wire [`FPRID_WIDTH-1:0]     fpu_rs3;
  wire [`FPRID_WIDTH-1:0]     fpu_rd;

  wire [`FPR_WIDTH-1:0]       fpu_ld_data;
  wire [`FPRID_WIDTH-1:0]     fpu_ld_rd;
  wire                        fpu_ld_val;
  wire [`PRECISION_WIDTH-1:0] fpu_ld_precision;

  wire                    fpu_fwbq_val;
  wire [`FPR_WIDTH-1:0]   fpu_fwbq_bits;
  wire [`FPRID_WIDTH-1:0] fpu_fwbq_tag;
  wire                    fpu_fwbq_deq;

  wire                  fpu_fsdq_val;
  wire [`FPR_WIDTH-1:0] fpu_fsdq_bits;
  wire                  fpu_fsdq_deq;
  wire                  fpu_fcmdq_deq;
  wire                  fpu_flaq_deq;
  wire                  fpu_flaq_enq;

  wire [4:0]  ll_waddr;
  wire        ll_wen;
  wire [63:0] ll_wdata;

  //--------------------------------------------------------------------
  // Control Unit
  //--------------------------------------------------------------------

  riscvProcCtrl #(.HAS_FPU(HAS_FPU), .HAS_VECTOR(HAS_VECTOR)) ctrl
  (
    .clk(clk),
    .reset(reset),

    .imem_req_val(imem_req_val),
    .imem_req_rdy(imem_req_rdy),
    .imem_resp_val(imem_resp_val),

    .mem_mrq_val(mem_mrq_val),
    .mem_mrq_cmd(mem_mrq_cmd),
    .mem_mrq_type(mem_mrq_type),
    .mem_mrq_deq(mem_mrq_deq),
    .dmem_resp_val(dmem_resp_val),

    .mul_rdy(cp_imul_rdy),
    .mul_val(mul_val),
    .mul_fn(cp_imul_fn),
    .mul_waddr(mul_waddr),
    .mul_mwbq_deq(mul_mwbq_deq),

    .div_rdy(div_rdy),
    .div_val(div_val),
    .div_fn(div_fn),
    .div_waddr(div_waddr),
    .div_dwbq_deq(div_dwbq_deq),

    .console_out_rdy(console_out_rdy),
    .console_out_val(console_out_val),

    .fpu_val(fpu_val),
    .fpu_precision(fpu_precision),
    .fpu_rm(fpu_rm),
    .fpu_cmd(fpu_cmd),
    .fpu_rs1(fpu_rs1),
    .fpu_rs2(fpu_rs2),
    .fpu_rs3(fpu_rs3),
    .fpu_rd(fpu_rd),
    .fpu_fwbq_deq(fpu_fwbq_deq),
    .fpu_fsdq_deq(fpu_fsdq_deq),
    .fpu_fcmdq_deq(fpu_fcmdq_deq),
    .fpu_flaq_deq(fpu_flaq_deq),

    .ll_waddr(ll_waddr),
    .ll_wen(ll_wen),

    .vec_cmdq_val(vec_cmdq_val),
    .vec_ximm1q_val(vec_ximm1q_val),
    .vec_ximm2q_val(vec_ximm2q_val),

    .vec_cmdq_deq(vec_cmdq_deq),
    .vec_ximm1q_deq(vec_ximm1q_deq),
    .vec_ximm2q_deq(vec_ximm2q_deq),

    .vec_ackq_val(vec_ackq_val),
    .vec_ackq_rdy(vec_ackq_rdy),

    .dpath_status(dpath_status),
    .dpath_btb_hit(dpath_btb_hit),
    .dpath_inst(dpath_inst),
    .dpath_bypass_rs2(dpath_bypass_rs2),
    .dpath_bypass_rs1(dpath_bypass_rs1),
    .dpath_exception(dpath_exception),
    .dpath_br_eq(dpath_br_eq),
    .dpath_br_lt(dpath_br_lt),
    .dpath_br_ltu(dpath_br_ltu),
    .dpath_vec_bank_lt3(dpath_vec_bank_lt3),
    .dpath_vec_appvl_eq0(dpath_vec_appvl_eq0),
    .dpath_fsr(dpath_fsr),

    .ctrl_sel_pc(ctrl_sel_pc),
    .ctrl_wen_btb(ctrl_wen_btb),
    .ctrl_stallf(ctrl_stallf),
    .ctrl_stalld(ctrl_stalld),
    .ctrl_killf(ctrl_killf),
    .ctrl_killd(ctrl_killd),
    .ctrl_ren2(ctrl_ren2),
    .ctrl_ren1(ctrl_ren1),
    .ctrl_sel_alu2(ctrl_sel_alu2),
    .ctrl_sel_alu1(ctrl_sel_alu1),
    .ctrl_fn_dw(ctrl_fn_dw),
    .ctrl_fn_alu(ctrl_fn_alu),
    .ctrl_wen(ctrl_wen),
    .ctrl_sel_wa(ctrl_sel_wa),
    .ctrl_sel_wb(ctrl_sel_wb),
    .ctrl_ren_pcr(ctrl_ren_pcr),
    .ctrl_wen_pcr(ctrl_wen_pcr),
    .ctrl_wen_fsr(ctrl_wen_fsr),
    .ctrl_fn_vec(ctrl_fn_vec),
    .ctrl_wen_vec(ctrl_wen_vec),
    .ctrl_sel_vcmd(ctrl_sel_vcmd),
    .ctrl_sel_vimm(ctrl_sel_vimm),
    .ctrl_except_illegal(ctrl_except_illegal),
    .ctrl_except_privileged(ctrl_except_privileged),
    .ctrl_except_fpu(ctrl_except_fpu),
    .ctrl_except_syscall(ctrl_except_syscall),
    .ctrl_except_vec(ctrl_except_vec),
    .ctrl_except_vec_bank(ctrl_except_vec_bank),
    .ctrl_eret(ctrl_eret)
  );

  //--------------------------------------------------------------------
  // Datapath
  //--------------------------------------------------------------------
  
  riscvProcDpath #(.COREID(COREID), .HAS_FPU(HAS_FPU), .HAS_VECTOR(HAS_VECTOR)) dpath
  (
    .clk(clk),
    .reset(reset),

    .error_mode(error_mode),
    .log_control(log_control),

    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),

    .imem_req_addr(imem_req_addr),
    .imem_resp_data(imem_resp_data),

    .ll_waddr(ll_waddr),
    .ll_wen(ll_wen),
    .ll_wdata(ll_wdata),

    .vec_cmdq_bits(vec_cmdq_bits),
    .vec_ximm1q_bits(vec_ximm1q_bits),
    .vec_ximm2q_bits(vec_ximm2q_bits),

    .ctrl_sel_pc(ctrl_sel_pc),
    .ctrl_wen_btb(ctrl_wen_btb),
    .ctrl_stallf(ctrl_stallf),
    .ctrl_stalld(ctrl_stalld),
    .ctrl_killf(ctrl_killf),
    .ctrl_killd(ctrl_killd),
    .ctrl_ren2(ctrl_ren2),
    .ctrl_ren1(ctrl_ren1),
    .ctrl_sel_alu2(ctrl_sel_alu2),
    .ctrl_sel_alu1(ctrl_sel_alu1),
    .ctrl_fn_dw(ctrl_fn_dw),
    .ctrl_fn_alu(ctrl_fn_alu),
    .ctrl_wen(ctrl_wen),
    .ctrl_sel_wa(ctrl_sel_wa),
    .ctrl_sel_wb(ctrl_sel_wb),
    .ctrl_ren_pcr(ctrl_ren_pcr),
    .ctrl_wen_pcr(ctrl_wen_pcr),
    .ctrl_wen_fsr(ctrl_wen_fsr),
    .ctrl_fn_vec(ctrl_fn_vec),
    .ctrl_wen_vec(ctrl_wen_vec),
    .ctrl_sel_vcmd(ctrl_sel_vcmd),
    .ctrl_sel_vimm(ctrl_sel_vimm),
    .ctrl_except_illegal(ctrl_except_illegal),
    .ctrl_except_privileged(ctrl_except_privileged),
    .ctrl_except_fpu(ctrl_except_fpu),
    .ctrl_except_syscall(ctrl_except_syscall),
    .ctrl_except_vec(ctrl_except_vec),
    .ctrl_except_vec_bank(ctrl_except_vec_bank),
    .ctrl_eret(ctrl_eret),

    .dpath_status(dpath_status),
    .dpath_btb_hit(dpath_btb_hit),
    .dpath_inst(dpath_inst),
    .dpath_id_rdata2(dpath_id_rdata2),
    .dpath_id_rdata1(dpath_id_rdata1),
    .dpath_ex_rs2(dpath_ex_rs2),
    .dpath_bypass_rs2(dpath_bypass_rs2),
    .dpath_bypass_rs1(dpath_bypass_rs1),
    .dpath_exception(dpath_exception),
    .dpath_br_eq(dpath_br_eq),
    .dpath_br_lt(dpath_br_lt),
    .dpath_br_ltu(dpath_br_ltu),
    .dpath_vec_bank_lt3(dpath_vec_bank_lt3),
    .dpath_vec_appvl_eq0(dpath_vec_appvl_eq0),
    .dpath_alu_out(dpath_alu_out),
    .dpath_waddr(dpath_waddr),
    .dpath_fsr(dpath_fsr)
  );

  riscvProcMemory mem
  (
    .clk(clk),
    .reset(reset),

    .mem_mrq_val(mem_mrq_val),
    .mem_mrq_cmd(mem_mrq_cmd),
    .mem_mrq_type(mem_mrq_type),

    .dpath_rs2(dpath_ex_rs2),
    .dpath_waddr(dpath_waddr),
    .dpath_alu_out(dpath_alu_out),

    .fpu_fsdq_val(fpu_fsdq_val),
    .fpu_fsdq_bits(fpu_fsdq_bits),

    .dmem_req_val(dmem_req_val),
    .dmem_req_rdy(dmem_req_rdy),
    .dmem_req_op(dmem_req_op),
    .dmem_req_addr(dmem_req_addr),
    .dmem_req_data(dmem_req_data),
    .dmem_req_wmask(dmem_req_wmask),
    .dmem_req_tag(dmem_req_tag),

    .mem_mrq_deq(mem_mrq_deq),
    .fpu_fsdq_deq(fpu_fsdq_deq),

    .fpu_flaq_enq(fpu_flaq_enq),
    .fpu_flaq_deq(fpu_flaq_deq)
  );

  assign cp_imul_val = mul_val;
  assign cp_imul_in0 = dpath_id_rdata1;
  assign cp_imul_in1 = dpath_id_rdata2;
  assign mul_result_bits = cp_imul_out;

  riscvProcMultiplier mul
  (
    .clk(clk),
    .reset(reset),

    .mul_fire(mul_val & cp_imul_rdy),
    .mul_waddr(mul_waddr),
    .mul_result_tag(mul_result_tag),
    .mul_result_val(mul_result_val)
  );

  riscvProcDivider #(64) div
  (
    .clk(clk),
    .reset(reset),

    .div_rdy(div_rdy),
    .div_val(div_val),
    .div_fn(div_fn),
    .div_waddr(div_waddr),

    .dpath_rs2(dpath_id_rdata2),
    .dpath_rs1(dpath_id_rdata1),

    .div_result_bits(div_result_bits),
    .div_result_tag(div_result_tag),
    .div_result_val(div_result_val)
  );

  generate
    if(HAS_FPU)
    begin
      wire fcmdq_deq_rdy, fcmdq_deq_val;

      wire fcmdq_deq_precision;
      wire [`FPU_RM_WIDTH-1:0] fcmdq_deq_rm;
      wire [`FPU_CMD_WIDTH-1:0] fcmdq_deq_cmd;
      wire [`FPR_WIDTH-1:0] fcmdq_deq_data;
      wire [`FPRID_WIDTH-1:0] fcmdq_deq_rs1, fcmdq_deq_rs2, fcmdq_deq_rs3,
                              fcmdq_deq_rd;

      `VC_SIMPLE_QUEUE(1+`FPU_RM_WIDTH+`FPU_CMD_WIDTH+`FPR_WIDTH+
                       4*`FPRID_WIDTH,`FP_CMDQ_DEPTH) fcmdq
      (
        .clk(clk),
        .reset(reset),

        .enq_bits({fpu_precision, fpu_rm, fpu_cmd, dpath_id_rdata1,
                   fpu_rs1, fpu_rs2, fpu_rs3, fpu_rd}),
        .enq_val(fpu_val),
        .enq_rdy(), // issue logic takes care of this

        .deq_bits({fcmdq_deq_precision, fcmdq_deq_rm, fcmdq_deq_cmd, fcmdq_deq_data,
                   fcmdq_deq_rs1, fcmdq_deq_rs2, fcmdq_deq_rs3, fcmdq_deq_rd}),
        .deq_val(fcmdq_deq_val),
        .deq_rdy(fcmdq_deq_rdy)
      );

      assign fpu_fcmdq_deq = fcmdq_deq_val & fcmdq_deq_rdy;

      fpu fpu
      (
        .clk(clk),
        .reset(reset),

        .cmd_val(fcmdq_deq_val),
        .cmd_precision(fcmdq_deq_precision),
        .cmd_rm(fcmdq_deq_rm),
        .cmd(fcmdq_deq_cmd),
        .cmd_data(fcmdq_deq_data),

        .cmd_rs1(fcmdq_deq_rs1),
        .cmd_rs2(fcmdq_deq_rs2),
        .cmd_rs3(fcmdq_deq_rs3),
        .cmd_rd(fcmdq_deq_rd),

        .fp_load_data(fpu_ld_data),
        .fp_load_rd(fpu_ld_rd),
        .fp_load_val(fpu_ld_val),
        .fp_load_precision(fpu_ld_precision),

        .fpu_flaq_enq(fpu_flaq_enq),

        .rdy(fcmdq_deq_rdy),

        .fp_toint_val(fpu_fwbq_val),
        .fp_toint_data(fpu_fwbq_bits),
        .fp_toint_rd(fpu_fwbq_tag),

        .fp_store_val(fpu_fsdq_val),
        .fp_store_data(fpu_fsdq_bits),

        .pipe_fma_val(cp_fma_val),
        .pipe_fma_rdy(cp_fma_rdy),
        .pipe_fma_fn(cp_fma_fn),
        .pipe_fma_in0(cp_fma_in0),
        .pipe_fma_in1(cp_fma_in1),
        .pipe_fma_in2(cp_fma_in2),
        .pipe_fma_exc(cp_fma_exc),
        .pipe_fma_out(cp_fma_out)
      );
    end
    else
    begin
      assign fpu_fwbq_val = 1'b0;
      assign fpu_fsdq_val = 1'b0;
      assign fpu_fcmdq_deq = 1'b0;
      assign fpu_flaq_enq = 1'b0;
    end
  endgenerate

  riscvProcWriteback wb
  (
    .clk(clk),
    .reset(reset),

    .dmem_resp_val(dmem_resp_val),
    .dmem_resp_data(dmem_resp_data),
    .dmem_resp_tag(dmem_resp_tag),

    .mul_result_bits(mul_result_bits),
    .mul_result_tag(mul_result_tag),
    .mul_result_val(mul_result_val),

    .div_result_bits(div_result_bits),
    .div_result_tag(div_result_tag),
    .div_result_val(div_result_val),

    .fpu_fwbq_val(fpu_fwbq_val),
    .fpu_fwbq_bits(fpu_fwbq_bits),
    .fpu_fwbq_tag(fpu_fwbq_tag),

    .mul_mwbq_deq(mul_mwbq_deq),
    .div_dwbq_deq(div_dwbq_deq),
    .fpu_fwbq_deq(fpu_fwbq_deq),

    .fpu_ld_data(fpu_ld_data),
    .fpu_ld_rd(fpu_ld_rd),
    .fpu_ld_val(fpu_ld_val),
    .fpu_ld_precision(fpu_ld_precision),

    .ll_waddr(ll_waddr),
    .ll_wen(ll_wen),
    .ll_wdata(ll_wdata)
  );

  assign console_out_bits = dpath_id_rdata1[7:0];

endmodule
