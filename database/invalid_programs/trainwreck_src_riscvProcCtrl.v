//**************************************************************************
// RISC-V Baseline Control
//--------------------------------------------------------------------------

`include "defCommon.vh"
`include "riscvInst.vh"
`include "fpu_common.v"
`include "riscvConst.vh"
`include "fpu_recoded.vh"

module riscvProcCtrl #
(
  parameter HAS_FPU = 0,
  parameter HAS_VECTOR = 0
)
(
  input clk,
  input reset,

  output imem_req_val,
  input  imem_req_rdy,
  input  imem_resp_val,

  output mem_mrq_val,
  output [3:0] mem_mrq_cmd,
  output [2:0] mem_mrq_type,
  input  mem_mrq_deq,
  input  dmem_resp_val,

  input mul_rdy,
  output mul_val,
  output `DEF_VAU0_FN mul_fn,
  output [4:0] mul_waddr,
  input mul_mwbq_deq,

  input div_rdy,
  output div_val,
  output [2:0] div_fn,
  output [4:0] div_waddr,
  input div_dwbq_deq,

  input console_out_rdy,
  output console_out_val,

  output fpu_val,
  output fpu_precision,
  output [`FPU_CMD_WIDTH-1:0] fpu_cmd,
  output [`FPRID_WIDTH-1:0] fpu_rs1,
  output [`FPRID_WIDTH-1:0] fpu_rs2,
  output [`FPRID_WIDTH-1:0] fpu_rs3,
  output [`FPRID_WIDTH-1:0] fpu_rd,
  output [`FPU_RM_WIDTH-1:0]  fpu_rm,
  input fpu_fwbq_deq,
  input fpu_fsdq_deq,
  input fpu_fcmdq_deq,
  input fpu_flaq_deq,

  input [4:0] ll_waddr,
  input ll_wen,

  output vec_cmdq_val,
  output vec_ximm1q_val,
  output vec_ximm2q_val,

  input vec_cmdq_deq,
  input vec_ximm1q_deq,
  input vec_ximm2q_deq,

  input vec_ackq_val,
  output vec_ackq_rdy,

  input [7:0] dpath_status,
  input dpath_btb_hit,
  input [31:0] dpath_inst,
  input dpath_bypass_rs2,
  input dpath_bypass_rs1,
  input dpath_exception,
  input dpath_br_eq,
  input dpath_br_lt,
  input dpath_br_ltu,
  input dpath_vec_bank_lt3,
  input dpath_vec_appvl_eq0,
  input [`FSR_WIDTH-1:0] dpath_fsr,

  output [2:0] ctrl_sel_pc,
  output       ctrl_wen_btb,
  output       ctrl_stallf,
  output       ctrl_stalld,
  output       ctrl_killf,
  output       ctrl_killd,
  output       ctrl_ren2,
  output       ctrl_ren1,
  output [1:0] ctrl_sel_alu2,
  output       ctrl_sel_alu1,
  output       ctrl_fn_dw,
  output [3:0] ctrl_fn_alu,
  output       ctrl_wen,
  output       ctrl_sel_wa,
  output [1:0] ctrl_sel_wb,
  output       ctrl_ren_pcr,
  output       ctrl_wen_pcr,
  output       ctrl_wen_fsr,
  output       ctrl_fn_vec,
  output       ctrl_wen_vec,
  output [2:0] ctrl_sel_vcmd,
  output [1:0] ctrl_sel_vimm,
  output       ctrl_except_illegal,
  output       ctrl_except_privileged,
  output       ctrl_except_fpu,
  output       ctrl_except_syscall,
  output       ctrl_except_vec,
  output       ctrl_except_vec_bank,
  output       ctrl_eret
);

  localparam y = 1'b1;
  localparam n = 1'b0;

  wire      xpr64;

  reg       id_int_val;
  reg [3:0] id_br_type;
  reg       id_renx2;
  reg       id_renx1;
  reg [1:0] id_sel_alu2;
  reg       id_sel_alu1;
  reg       id_fn_dw;
  reg [3:0] id_fn_alu;
  reg       id_mem_val;
  reg [3:0] id_mem_cmd;
  reg [2:0] id_mem_type;
  reg       id_mul_val;
  reg [2:0] id_mul_fn;
  reg       id_div_val;
  reg [2:0] id_div_fn;
  reg       id_wen;
  reg       id_sel_wa;
  reg [1:0] id_sel_wb;
  reg       id_wen_fsr;
  reg       id_ren_pcr;
  reg       id_wen_pcr;
  reg       id_sync;
  reg       id_eret;
  reg       id_syscall;
  reg       id_privileged;

  `define XCS {id_int_val,id_br_type,id_renx2,id_renx1,id_sel_alu2,id_sel_alu1,id_fn_dw,id_fn_alu,id_mem_val,id_mem_cmd,id_mem_type,id_mul_val,id_mul_fn,id_div_val,id_div_fn,id_wen,id_sel_wa,id_sel_wb,id_ren_pcr,id_wen_pcr,id_sync,id_eret,id_syscall,id_privileged}

  always @(*)
  begin
    casez (dpath_inst)
      `J:         `XCS = {y,     `BR_J,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `JAL:       `XCS = {y,     `BR_J,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RA,`WB_PC, `REN_N,`WEN_N,n,n,n,n};
      `JALR_C:    `XCS = {y,     `BR_JR, `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_PC, `REN_N,`WEN_N,n,n,n,n};
      `JALR_J:    `XCS = {y,     `BR_JR, `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_PC, `REN_N,`WEN_N,n,n,n,n};
      `JALR_R:    `XCS = {y,     `BR_JR, `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_PC, `REN_N,`WEN_N,n,n,n,n};
      `RDNPC:     `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_PC, `REN_N,`WEN_N,n,n,n,n};
      `BEQ:       `XCS = {y,     `BR_EQ, `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `BNE:       `XCS = {y,     `BR_NE, `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `BLT:       `XCS = {y,     `BR_LT, `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `BLTU:      `XCS = {y,     `BR_LTU,`REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `BGE:       `XCS = {y,     `BR_GE, `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `BGEU:      `XCS = {y,     `BR_GEU,`REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};

      `LB:        `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_B, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `LH:        `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_H, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `LW:        `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `LD:        `XCS = {xpr64, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `LBU:       `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_BU,n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `LHU:       `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_HU,n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `LWU:       `XCS = {xpr64, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XRD,    `MT_WU,n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `SB:        `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_SPLIT,`A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XWR,    `MT_B, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `SH:        `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_SPLIT,`A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XWR,    `MT_H, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `SW:        `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_SPLIT,`A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XWR,    `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `SD:        `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_SPLIT,`A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XWR,    `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `FLW:       `XCS = {`FPU_Y,`BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_FRD,    `MT_WU,n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `FLD:       `XCS = {`FPU_Y,`BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_FRD,    `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `FSW:       `XCS = {`FPU_Y,`BR_N,  `REN_Y,`REN_Y,`A2_SPLIT,`A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_FWR,    `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `FSD:       `XCS = {`FPU_Y,`BR_N,  `REN_Y,`REN_Y,`A2_SPLIT,`A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_FWR,    `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOADD_W:  `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_ADD, `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOSWAP_W: `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_SWAP,`MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOAND_W:  `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_AND, `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOOR_W:   `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_OR,  `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMIN_W:  `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MIN, `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMAX_W:  `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MAX, `MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMINU_W: `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MINU,`MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMAXU_W: `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MAXU,`MT_W, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOADD_D:  `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_ADD, `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOSWAP_D: `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_SWAP,`MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOAND_D:  `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_AND, `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOOR_D:   `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_OR,  `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMIN_D:  `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MIN, `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMAX_D:  `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MAX, `MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMINU_D: `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MINU,`MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `AMOMAXU_D: `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_0,    `A1_RS1,`DW_XPR,`FN_ADD, `M_Y,`M_XA_MAXU,`MT_D, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};

      `LUI:       `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_0,    `A1_LUI,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `ADDI:      `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLTI :     `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_SLT, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLTIU:     `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_SLTU,`M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `ANDI:      `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_AND, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `ORI:       `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_OR,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `XORI:      `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_XOR, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLLI:      `XCS = {`Y_SH, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_SL,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRLI:      `XCS = {`Y_SH, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_SR,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRAI:      `XCS = {`Y_SH, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_SRA, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `ADD:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SUB:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_SUB, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLT:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_SLT, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLTU:      `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_SLTU,`M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `AND:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_AND, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `OR:        `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_OR,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `XOR:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_XOR, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLL:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_SL,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRL:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_SR,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRA:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_XPR,`FN_SRA, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};

      `ADDIW:     `XCS = {xpr64, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_32,`FN_ADD,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLLIW:     `XCS = {xpr64, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_32,`FN_SL,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRLIW:     `XCS = {xpr64, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_32,`FN_SR,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRAIW:     `XCS = {xpr64, `BR_N,  `REN_N,`REN_Y,`A2_SEXT, `A1_RS1,`DW_32,`FN_SRA,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `ADDW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_32,`FN_ADD,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SUBW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_32,`FN_SUB,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SLLW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_32,`FN_SL,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRLW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_32,`FN_SR,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};
      `SRAW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_RS2,  `A1_RS1,`DW_32,`FN_SRA,  `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_ALU,`REN_N,`WEN_N,n,n,n,n};

      `MUL:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, y,`MUL_XPR,   n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `MULH:      `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, y,`MUL_XPRH,  n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `MULHU:     `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, y,`MUL_XPRHU, n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `MULHSU:    `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, y,`MUL_XPRHSU,n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `MULW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, y,`MUL_32,    n,`DIV_X,    `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};

      `DIV:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_XPRD, `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `DIVU:      `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_XPRDU,`WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `REM:       `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_XPRR, `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `REMU:      `XCS = {y,     `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_XPRRU,`WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `DIVW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_32D,  `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `DIVUW:     `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_32DU, `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `REMW:      `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_32R,  `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};
      `REMUW:     `XCS = {xpr64, `BR_N,  `REN_Y,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     y,`DIV_32RU, `WEN_N,`WA_RD,`WB_X,  `REN_N,`WEN_N,n,n,n,n};

      `FENCE:     `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,y,n,n,n};
      `SYSCALL:   `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,y,n};

      `EI:        `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,y};
      `DI:        `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,y};
      `ERET:      `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,y,n,y};
      `MFPCR:     `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_PCR,`REN_Y,`WEN_N,n,n,n,y};
      `MTPCR:     `XCS = {y,     `BR_N,  `REN_N,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_Y,n,n,n,y};
      `CFLUSH:    `XCS = {y,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_Y,`M_FLA,    `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,y};

      `VVCFGIVL:  `XCS = {`VEC_Y,`BR_N,  `REN_N,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_VEC,`REN_N,`WEN_N,n,n,n,n};
      `VSETVL:    `XCS = {`VEC_Y,`BR_N,  `REN_N,`REN_Y,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_Y,`WA_RD,`WB_VEC,`REN_N,`WEN_N,n,n,n,n};
      `VF:        `XCS = {`VEC_Y,`BR_N,  `REN_Y,`REN_Y,`A2_SEXT, `A1_RS1,`DW_XPR,`FN_ADD, `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
      default:    `XCS = {n,     `BR_N,  `REN_N,`REN_N,`A2_X,    `A1_X,  `DW_X,  `FN_X,   `M_N,`M_X,      `MT_X, n,`MUL_X,     n,`DIV_X,    `WEN_N,`WA_X, `WB_X,  `REN_N,`WEN_N,n,n,n,n};
    endcase

    `RTL_PROPAGATE_X(dpath_inst,id_int_val);
    `RTL_PROPAGATE_X(dpath_inst,id_br_type);
    `RTL_PROPAGATE_X(dpath_inst,id_renx2);
    `RTL_PROPAGATE_X(dpath_inst,id_renx1);
    `RTL_PROPAGATE_X(dpath_inst,id_sel_alu2);
    `RTL_PROPAGATE_X(dpath_inst,id_sel_alu1);
    `RTL_PROPAGATE_X(dpath_inst,id_fn_dw);
    `RTL_PROPAGATE_X(dpath_inst,id_fn_alu);
    `RTL_PROPAGATE_X(dpath_inst,id_mem_val);
    `RTL_PROPAGATE_X(dpath_inst,id_mem_type);
    `RTL_PROPAGATE_X(dpath_inst,id_mul_fn);
    `RTL_PROPAGATE_X(dpath_inst,id_div_fn);
    `RTL_PROPAGATE_X(dpath_inst,id_wen);
    `RTL_PROPAGATE_X(dpath_inst,id_sel_wa);
    `RTL_PROPAGATE_X(dpath_inst,id_sel_wb);
    `RTL_PROPAGATE_X(dpath_inst,id_ren_pcr);
    `RTL_PROPAGATE_X(dpath_inst,id_wen_pcr);
    `RTL_PROPAGATE_X(dpath_inst,id_sync);
    `RTL_PROPAGATE_X(dpath_inst,id_eret);
    `RTL_PROPAGATE_X(dpath_inst,id_syscall);
    `RTL_PROPAGATE_X(dpath_inst,id_privileged);
  end

  reg       id_fpu_val;
  reg       id_fpu_use_rm;
  reg       id_fpu_fwbq;
  reg       id_renf2;
  reg       id_renf1;
  reg [5:0] id_fpu_cmd;

  `define FCS {id_fpu_val,id_fpu_use_rm,id_wen_fsr,id_fpu_fwbq,id_renf2,id_renf1,id_fpu_cmd}

  generate
    if (HAS_FPU)
    begin
      always @(*)
      begin
        casez (dpath_inst)
          `FADD_S:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_ADD};
          `FSUB_S:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SUB};
          `FMUL_S:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MUL};
          `FDIV_S:      `FCS = {`FPU_N,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_DIV};
          `FSQRT_S:     `FCS = {`FPU_N,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SQRT};
          `FADD_D:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_ADD};
          `FSUB_D:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SUB};
          `FMUL_D:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MUL};
          `FDIV_D:      `FCS = {`FPU_N,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_DIV};
          `FSQRT_D:     `FCS = {`FPU_N,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SQRT};
          `FSGNJ_S:     `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SGNINJ};
          `FSGNJN_S:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SGNINJN};
          `FSGNJX_S:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SGNMUL};
          `FSGNJ_D:     `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SGNINJ};
          `FSGNJN_D:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SGNINJN};
          `FSGNJX_D:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_SGNMUL};
          `FMIN_S:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MIN};
          `FMAX_S:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MAX};
          `FMIN_D:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MIN};
          `FMAX_D:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MAX};
          `FCVT_L_S:    `FCS = {xpr64, y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNC_L};
          `FCVT_LU_S:   `FCS = {xpr64, y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNCU_L};
          `FCVT_W_S:    `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNC_W};
          `FCVT_WU_S:   `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNCU_W};
          `FCVT_L_D:    `FCS = {xpr64, y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNC_L};
          `FCVT_LU_D:   `FCS = {xpr64, y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNCU_L};
          `FCVT_W_D:    `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNC_W};
          `FCVT_WU_D:   `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_TRUNCU_W};
          `FCVT_S_L:    `FCS = {xpr64, y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVT_L};
          `FCVT_S_LU:   `FCS = {xpr64, y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVTU_L};
          `FCVT_S_W:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVT_W};
          `FCVT_S_WU:   `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVTU_W};
          `FCVT_D_L:    `FCS = {xpr64, y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVT_L};
          `FCVT_D_LU:   `FCS = {xpr64, y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVTU_L};
          `FCVT_D_W:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVT_W};
          `FCVT_D_WU:   `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_CVTU_W};
          `FCVT_S_D:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_CVT_D};
          `FCVT_D_S:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_CVT_S};
          `FEQ_S:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_C_EQ};
          `FLT_S:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_C_LT};
          `FLE_S:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_C_LE};
          `FEQ_D:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_C_EQ};
          `FLT_D:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_C_LT};
          `FLE_D:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_C_LE};
          `MFTX_S:      `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_MF};
          `MFTX_D:      `FCS = { xpr64,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_MF};
          `MXTF_S:      `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_MT};
          `MXTF_D:      `FCS = { xpr64,y,n,`FWBQ_N,`REN_N,`REN_Y,`FPU_CMD_MT};
          `MTFSR:       `FCS = {`FPU_Y,y,y,`FWBQ_Y,`REN_N,`REN_Y,`FPU_CMD_MTFSR};
          `MFFSR:       `FCS = {`FPU_Y,y,n,`FWBQ_Y,`REN_N,`REN_N,`FPU_CMD_MFFSR};
          `FLW:         `FCS = {`FPU_Y,n,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_LD};
          `FLD:         `FCS = {`FPU_Y,n,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_LD};
          `FSW:         `FCS = {`FPU_Y,n,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_ST};
          `FSD:         `FCS = {`FPU_Y,n,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_ST};
          `FMADD_S:     `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MADD};
          `FMSUB_S:     `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MSUB};
          `FNMSUB_S:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_NMSUB};
          `FNMADD_S:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_NMADD};
          `FMADD_D:     `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MADD};
          `FMSUB_D:     `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_MSUB};
          `FNMSUB_D:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_NMSUB};
          `FNMADD_D:    `FCS = {`FPU_Y,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_NMADD};
          default:      `FCS = {`FPU_N,y,n,`FWBQ_N,`REN_N,`REN_N,`FPU_CMD_X};
        endcase

        id_fpu_val &= ~id_fpu_use_rm | `FPU_RM_SUPPORTED(fpu_rm);

        `RTL_PROPAGATE_X(dpath_inst,id_fpu_val);
        `RTL_PROPAGATE_X(dpath_inst,id_fpu_fwbq);
        `RTL_PROPAGATE_X(dpath_inst,id_renf2);
        `RTL_PROPAGATE_X(dpath_inst,id_renf1);
        `RTL_PROPAGATE_X(dpath_inst,id_fpu_cmd);
      end
    end
    else
    begin
      assign id_fpu_val = 1'b0;
      assign id_wen_fsr = 1'b0;
      assign id_fpu_fwbq = 1'b0;
      assign id_renf2 = 1'b0;
      assign id_renf1 = 1'b0;
    end
  endgenerate

  reg       id_vec_val;
  reg       id_renv2;
  reg       id_renv1;
  reg [2:0] id_sel_vcmd;
  reg [1:0] id_sel_vimm;
  reg       id_fn_vec;
  reg       id_vec_appvlmask;
  reg       id_vec_cmdq_val;
  reg       id_vec_ximm1q_val;
  reg       id_vec_ximm2q_val;
  reg       id_vec_ackq_wait;

  `define VECCS {id_vec_val,id_renv2,id_renv1,id_sel_vcmd,id_sel_vimm,id_fn_vec,id_vec_appvlmask,id_vec_cmdq_val,id_vec_ximm1q_val,id_vec_ximm2q_val,id_vec_ackq_wait}

  generate
    if (HAS_VECTOR)
    begin
      always @(*)
      begin
        casez (dpath_inst)
          `VVCFGIVL:  `VECCS = {y,`REN_N,`REN_Y,`VCMD_I, `VIMM_VLEN,`VEC_CFG,n,y,y,n,n};
          `VSETVL:    `VECCS = {y,`REN_N,`REN_Y,`VCMD_I, `VIMM_VLEN,`VEC_VL ,n,y,y,n,n};
          `VF:        `VECCS = {y,`REN_Y,`REN_Y,`VCMD_I, `VIMM_ALU, `VEC_X  ,y,y,y,n,n};
          `VMVV:      `VECCS = {y,`REN_N,`REN_N,`VCMD_TX,`VIMM_X,   `VEC_X  ,y,y,n,n,n};
          `VMSV:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_TX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VFMVV:     `VECCS = {y,`REN_N,`REN_N,`VCMD_TF,`VIMM_X,   `VEC_X  ,y,y,n,n,n};
          `FENCE_L_V: `VECCS = {y,`REN_N,`REN_N,`VCMD_F, `VIMM_X,   `VEC_X  ,n,y,n,n,n};
          `FENCE_G_V: `VECCS = {y,`REN_N,`REN_N,`VCMD_F, `VIMM_X,   `VEC_X  ,n,y,n,n,n};
          `FENCE_L_CV:`VECCS = {y,`REN_N,`REN_N,`VCMD_F, `VIMM_X,   `VEC_X  ,n,y,n,n,y};
          `FENCE_G_CV:`VECCS = {y,`REN_N,`REN_N,`VCMD_F, `VIMM_X,   `VEC_X  ,n,y,n,n,y};
          `VLD:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLW:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLWU:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLH:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLHU:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLB:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLBU:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VSD:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VSW:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VSH:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VSB:       `VECCS = {y,`REN_N,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VFLD:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VFLW:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VFSD:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VFSW:      `VECCS = {y,`REN_N,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,n,n};
          `VLSTD:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VLSTW:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VLSTWU:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VLSTH:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VLSTHU:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VLSTB:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VLSTBU:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VSSTD:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VSSTW:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VSSTH:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VSSTB:     `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MX,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VFLSTD:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VFLSTW:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VFSSTD:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          `VFSSTW:    `VECCS = {y,`REN_Y,`REN_Y,`VCMD_MF,`VIMM_RS1, `VEC_X  ,y,y,y,y,n};
          default:    `VECCS = {n,`REN_N,`REN_N,`VCMD_X, `VIMM_X,   `VEC_X  ,n,n,n,n,n};
        endcase

        `RTL_PROPAGATE_X(dpath_inst,id_vec_val);
        `RTL_PROPAGATE_X(dpath_inst,id_renv2);
        `RTL_PROPAGATE_X(dpath_inst,id_renv1);
        `RTL_PROPAGATE_X(dpath_inst,id_sel_vcmd);
        `RTL_PROPAGATE_X(dpath_inst,id_sel_vimm);
        `RTL_PROPAGATE_X(dpath_inst,id_fn_vec);
        `RTL_PROPAGATE_X(dpath_inst,id_vec_cmdq_val);
        `RTL_PROPAGATE_X(dpath_inst,id_vec_ximm1q_val);
        `RTL_PROPAGATE_X(dpath_inst,id_vec_ximm2q_val);
        `RTL_PROPAGATE_X(dpath_inst,id_vec_ackq_wait);
      end
    end
    else
    begin
      assign id_vec_val = 1'b0;
      assign id_renv2 = 1'b0;
      assign id_renv1 = 1'b0;
      assign id_vec_cmdq_val = 1'b0;
      assign id_vec_ximm1q_val = 1'b0;
      assign id_vec_ximm2q_val = 1'b0;
      assign id_vec_ackq_wait = 1'b0;
    end
  endgenerate

  wire [4:0] id_raddr3 = dpath_inst[16:12];
  wire [4:0] id_raddr2 = dpath_inst[21:17];
  wire [4:0] id_raddr1 = dpath_inst[26:22];
  wire [4:0] id_waddr = dpath_inst[31:27];

  wire id_ren2 = id_renx2 | id_renf2 | id_renv2;
  wire id_ren1 = id_renx1 | id_renf1 | id_renv1;

  wire id_console_out_val = id_wen_pcr & (id_raddr2 == `PCR_CONSOLE);

  wire id_mem_val_masked = id_mem_val & (~id_fpu_val | dpath_status[1]);
  wire id_fpu_val_masked = id_fpu_val & dpath_status[1];

  wire id_vec_cmdq_val_masked = id_vec_cmdq_val & dpath_status[2] & ~dpath_vec_bank_lt3;
  wire id_vec_ximm1q_val_masked = id_vec_ximm1q_val & dpath_status[2] & ~dpath_vec_bank_lt3;
  wire id_vec_ximm2q_val_masked = id_vec_ximm2q_val & dpath_status[2] & ~dpath_vec_bank_lt3;

  wire id_stall_raddr2;
  wire id_stall_raddr1;
  wire id_stall_waddr;
  wire id_stall_ra;

  wire mem_xload_val = id_mem_val_masked & (id_mem_cmd == `M_XRD);
  wire mem_fload_val = id_mem_val_masked & (id_mem_cmd == `M_FRD);
  wire mem_xamo_val = id_mem_val_masked & (id_mem_cmd == `M_XA_ADD || id_mem_cmd == `M_XA_SWAP || id_mem_cmd == `M_XA_AND || id_mem_cmd == `M_XA_OR || id_mem_cmd == `M_XA_MIN || id_mem_cmd == `M_XA_MAX || id_mem_cmd == `M_XA_MINU || id_mem_cmd == `M_XA_MAXU);
  wire mem_fstore_val = id_mem_val_masked & (id_mem_cmd == `M_FWR);

  wire mem_fire = id_mem_val_masked & ~ctrl_killd;
  wire mem_xload_fire = mem_xload_val & ~ctrl_killd;
  wire mem_xamo_fire = mem_xamo_val & ~ctrl_killd;
  wire mem_fstore_fire = mem_fstore_val & ~ctrl_killd;

  wire mul_fire = id_mul_val & ~ctrl_killd;
  wire div_fire = id_div_val & ~ctrl_killd;
  wire fpu_fire = id_fpu_val_masked & ~ctrl_killd;
  wire console_out_fire = id_console_out_val & ~ctrl_killd;
  wire fpu_fwbq_fire = id_fpu_val_masked & id_fpu_fwbq & ~ctrl_killd;
  wire vec_cmdq_fire = ~(id_vec_appvlmask & dpath_vec_appvl_eq0) & id_vec_cmdq_val_masked & ~ctrl_killd;
  wire vec_ximm1q_fire = ~(id_vec_appvlmask & dpath_vec_appvl_eq0) & id_vec_ximm1q_val_masked & ~ctrl_killd;
  wire vec_ximm2q_fire = ~(id_vec_appvlmask & dpath_vec_appvl_eq0) & id_vec_ximm2q_val_masked & ~ctrl_killd;

  assign xpr64 = dpath_status[5] ? dpath_status[7] : dpath_status[6];

  wire sboard_wen =
    mem_xload_fire |
    mem_xamo_fire | mul_fire | div_fire | fpu_fwbq_fire;

  wire [4:0] sboard_waddr = id_waddr;

  riscvProcCtrlSboard sboard
  (
    .clk(clk),
    .reset(reset),

    .wen0(sboard_wen),
    .waddr0(sboard_waddr),
    .wdata0(1'b1),
    .wen1(ll_wen),
    .waddr1(ll_waddr),
    .wdata1(1'b0),

    .raddra(id_raddr2),
    .raddrb(id_raddr1),
    .raddrc(id_waddr),

    .stalla(id_stall_raddr2),
    .stallb(id_stall_raddr1),
    .stallc(id_stall_waddr),
    .stallra(id_stall_ra)
  );

  wire id_empty_mrq;
  wire id_empty_mem_ack;
  wire id_full_mrq;
  wire id_full_mem_ack;
  wire id_full_mwbq;
  wire id_full_dwbq;
  wire id_full_fwbq;
  wire id_full_fsdq;
  wire id_full_fcmdq;
  wire id_full_flaq;
  wire id_full_vec_cmdq;
  wire id_full_vec_ximm1q;
  wire id_full_vec_ximm2q;

  riscvProcCtrlCnt#(`MEM_RQ_DEPTH) mrq
  (
    .clk(clk),
    .reset(reset),

    .enq(mem_fire),
    .deq(mem_mrq_deq),

    .empty(id_empty_mrq),
    .full(id_full_mrq)
  );

  // count outstanding memory requests to implement fences
  riscvProcCtrlCnt#(63) mem_ack_cnt
  (
    .clk(clk),
    .reset(reset),

    .enq(mem_fire),
    .deq(dmem_resp_val),

    .empty(id_empty_mem_ack),
    .full(id_full_mem_ack)
  );

  riscvProcCtrlCnt#(`MUL_WBQ_DEPTH) mwbq
  (
    .clk(clk),
    .reset(reset),

    .enq(mul_fire),
    .deq(mul_mwbq_deq),

    .empty(),
    .full(id_full_mwbq)
  );

  riscvProcCtrlCnt#(`DIV_WBQ_DEPTH) dwbq
  (
    .clk(clk),
    .reset(reset),

    .enq(div_fire),
    .deq(div_dwbq_deq),

    .empty(),
    .full(id_full_dwbq)
  );

  riscvProcCtrlCnt#(`FPU_WBQ_DEPTH) fwbq
  (
    .clk(clk),
    .reset(reset),

    .enq(fpu_fwbq_fire),
    .deq(fpu_fwbq_deq),

    .empty(),
    .full(id_full_fwbq)
  );

  riscvProcCtrlCnt#(`FP_SDQ_DEPTH) fsdq
  (
    .clk(clk),
    .reset(reset),

    .enq(mem_fstore_fire),
    .deq(fpu_fsdq_deq),

    .empty(),
    .full(id_full_fsdq)
  );

  riscvProcCtrlCnt#(`FP_CMDQ_DEPTH) fcmdq
  (
    .clk(clk),
    .reset(reset),

    .enq(fpu_fire),
    .deq(fpu_fcmdq_deq),

    .empty(),
    .full(id_full_fcmdq)
  );

  riscvProcCtrlCnt#(`FP_CMDQ_DEPTH) flaq
  (
    .clk(clk),
    .reset(reset),

    .enq(fpu_fire & mem_fload_val),
    .deq(fpu_flaq_deq),

    .empty(),
    .full(id_full_flaq)
  );

  riscvProcCtrlCnt#(`VEC_CMDQ_DEPTH) vec_cmdq
  (
    .clk(clk),
    .reset(reset),

    .enq(vec_cmdq_fire),
    .deq(vec_cmdq_deq),

    .empty(),
    .full(id_full_vec_cmdq)
  );

  riscvProcCtrlCnt#(`VEC_XIMM1Q_DEPTH) vec_ximm1q
  (
    .clk(clk),
    .reset(reset),

    .enq(vec_ximm1q_fire),
    .deq(vec_ximm1q_deq),

    .empty(),
    .full(id_full_vec_ximm1q)
  );

  riscvProcCtrlCnt#(`VEC_XIMM2Q_DEPTH) vec_ximm2q
  (
    .clk(clk),
    .reset(reset),

    .enq(vec_ximm2q_fire),
    .deq(vec_ximm2q_deq),

    .empty(),
    .full(id_full_vec_ximm2q)
  );

  reg       id_reg_btb_hit;
  reg [3:0] ex_reg_br_type;
  reg       ex_reg_btb_hit;
  reg       ex_reg_vec_cmdq_val;
  reg       ex_reg_vec_ximm1q_val;
  reg       ex_reg_vec_ximm2q_val;
  reg       ex_reg_vec_ackq_wait;
  reg       ex_reg_mem_val;
  reg [3:0] ex_reg_mem_cmd;
  reg [2:0] ex_reg_mem_type;
  reg       ex_reg_eret;
  reg       ex_reg_privileged;

  always @(posedge clk)
  begin
    if (reset)
      id_reg_btb_hit <= 1'b0;
    else if (!ctrl_stalld)
    begin
      if (ctrl_killf)
        id_reg_btb_hit <= 1'b0;
      else
        id_reg_btb_hit <= dpath_btb_hit;
    end

    if (reset)
    begin
      ex_reg_vec_ackq_wait <= 1'b0;
    end
    else
    begin
      ex_reg_vec_ackq_wait <= ex_reg_vec_ackq_wait ? ~vec_ackq_val : (id_vec_ackq_wait & ~ctrl_killd);
    end

    if (reset || ctrl_killd)
    begin
      ex_reg_br_type <= `BR_N;
      ex_reg_btb_hit <= 1'b0;
      ex_reg_vec_cmdq_val <= 1'b0;
      ex_reg_vec_ximm1q_val <= 1'b0;
      ex_reg_vec_ximm2q_val <= 1'b0;
      ex_reg_mem_val <= 1'b0;
      ex_reg_mem_cmd <= 4'd0;
      ex_reg_mem_type <= 3'd0;
      ex_reg_eret <= 1'b0;
      ex_reg_privileged <= 1'b0;
    end
    else
    begin
      ex_reg_br_type <= id_br_type;
      ex_reg_btb_hit <= id_reg_btb_hit;
      ex_reg_vec_cmdq_val <= ~(id_vec_appvlmask & dpath_vec_appvl_eq0) & id_vec_cmdq_val_masked;
      ex_reg_vec_ximm1q_val <= ~(id_vec_appvlmask & dpath_vec_appvl_eq0) & id_vec_ximm1q_val_masked;
      ex_reg_vec_ximm2q_val <= ~(id_vec_appvlmask & dpath_vec_appvl_eq0) & id_vec_ximm2q_val_masked;
      ex_reg_mem_val <= id_mem_val_masked;
      ex_reg_mem_cmd <= id_mem_cmd;
      ex_reg_mem_type <= id_mem_type;
      ex_reg_eret <= id_eret;
      ex_reg_privileged <= id_privileged;
    end
  end

  wire beq = dpath_br_eq;
  wire bne = ~dpath_br_eq;
  wire blt = dpath_br_lt;
  wire bltu = dpath_br_ltu;
  wire bge = ~dpath_br_lt;
  wire bgeu = ~dpath_br_ltu;
  
  wire br_taken =
    (ex_reg_br_type == `BR_EQ) & beq |
    (ex_reg_br_type == `BR_NE) & bne |
    (ex_reg_br_type == `BR_LT) & blt |
    (ex_reg_br_type == `BR_LTU) & bltu |
    (ex_reg_br_type == `BR_GE) & bge |
    (ex_reg_br_type == `BR_GEU) & bgeu;

  wire jr_taken = (ex_reg_br_type == `BR_JR);
  wire j_taken = (ex_reg_br_type == `BR_J);

  assign imem_req_val = 1'b1;

  assign vec_cmdq_val = ex_reg_vec_cmdq_val;
  assign vec_ximm1q_val = ex_reg_vec_ximm1q_val;
  assign vec_ximm2q_val = ex_reg_vec_ximm2q_val;
  assign vec_ackq_rdy = ex_reg_vec_ackq_wait;

  assign mem_mrq_val = ex_reg_mem_val;
  assign mem_mrq_cmd = ex_reg_mem_cmd;
  assign mem_mrq_type = ex_reg_mem_type;
  assign mul_val = mul_fire;
  assign mul_fn = id_mul_fn;
  assign mul_waddr = id_waddr;
  assign div_val = div_fire;
  assign div_fn = id_div_fn;
  assign div_waddr = id_waddr;
  assign fpu_val = fpu_fire;
  assign console_out_val = console_out_fire;

  wire take_pc;

  assign fpu_precision = dpath_inst[7];
  assign fpu_cmd = id_fpu_cmd;
  assign fpu_rs1 = id_raddr1;
  assign fpu_rs2 = id_raddr2;
  assign fpu_rs3 = id_raddr3;
  assign fpu_rd = id_waddr;
  assign fpu_rm = dpath_inst[11:9] == `FPU_RM_DYN ? dpath_fsr[`FSR_RM]
                :                                   dpath_inst[11:9];

  assign ctrl_sel_pc
    = dpath_exception || ex_reg_eret ? `PC_PCR
    : !ex_reg_btb_hit && br_taken ? `PC_BR
    : ex_reg_btb_hit && !br_taken || ex_reg_privileged ? `PC_EX4
    : jr_taken ? `PC_JR
    : j_taken ? `PC_J
    : dpath_btb_hit ? `PC_BTB
    : `PC_4;

  assign ctrl_wen_btb = ~ex_reg_btb_hit & br_taken;

  assign take_pc =
    ~ex_reg_btb_hit & br_taken |
    ex_reg_btb_hit & ~br_taken |
    ex_reg_privileged |
    jr_taken |
    j_taken |
    dpath_exception |
    ex_reg_eret;

  assign ctrl_stallf =
    ~take_pc &
    (
      ~imem_req_rdy |
      ~imem_resp_val |
      ctrl_stalld
    );

  assign ctrl_stalld =
    ~take_pc &
    (
      id_ren2 & id_stall_raddr2 |
      id_ren1 & id_stall_raddr1 |
      (id_sel_wa == `WA_RD) & id_stall_waddr |
      (id_sel_wa == `WA_RA) & id_stall_ra |
      id_sync & (~id_empty_mrq | ~id_empty_mem_ack) |
      id_vec_cmdq_val_masked & id_full_vec_cmdq |
      id_vec_ximm1q_val_masked & id_full_vec_ximm1q |
      id_vec_ximm2q_val_masked & id_full_vec_ximm2q |
      ex_reg_vec_ackq_wait |
      id_mem_val_masked & (id_full_mrq | id_full_mem_ack) |
      mem_fstore_val & id_full_fsdq |
      id_mul_val & (~mul_rdy | dpath_bypass_rs1 | dpath_bypass_rs2 | id_full_mwbq) |
      id_div_val & (~div_rdy | dpath_bypass_rs1 | dpath_bypass_rs2 | id_full_dwbq) |
      id_console_out_val & (dpath_bypass_rs1 | ~console_out_rdy) |
      id_fpu_val_masked & id_fpu_fwbq & id_full_fwbq |
      id_fpu_val_masked & (id_renf1 & dpath_bypass_rs1 | id_renf2 & dpath_bypass_rs2 | id_full_fcmdq | id_full_flaq)
    );

  assign ctrl_killf = take_pc | ~imem_resp_val;
  assign ctrl_killd = take_pc | ctrl_stalld;

  assign ctrl_ren2 = id_ren2;
  assign ctrl_ren1 = id_ren1;
  assign ctrl_sel_alu2 = id_sel_alu2;
  assign ctrl_sel_alu1 = id_sel_alu1;
  assign ctrl_fn_dw = id_fn_dw;
  assign ctrl_fn_alu = id_fn_alu;
  assign ctrl_wen = id_wen;
  assign ctrl_sel_wa = id_sel_wa;
  assign ctrl_sel_wb = id_sel_wb;
  assign ctrl_ren_pcr = id_ren_pcr;
  assign ctrl_wen_pcr = id_wen_pcr;
  assign ctrl_wen_fsr = id_wen_fsr;
  assign ctrl_fn_vec = id_fn_vec;
  assign ctrl_wen_vec = id_wen & id_vec_val;
  assign ctrl_sel_vcmd = id_sel_vcmd;
  assign ctrl_sel_vimm = id_sel_vimm;
  assign ctrl_except_illegal = (~id_int_val & ~id_fpu_val & ~id_vec_val);
  assign ctrl_except_privileged = id_privileged & ~dpath_status[5];
  assign ctrl_except_fpu = id_fpu_val & ~dpath_status[1];
  assign ctrl_except_vec = id_vec_val & ~dpath_status[2];
  assign ctrl_except_vec_bank = id_vec_val & dpath_vec_bank_lt3;
  assign ctrl_except_syscall = id_syscall;
  assign ctrl_eret = id_eret;
  
endmodule
