//**************************************************************************
// RISC-V Baseline Datapath
//--------------------------------------------------------------------------

`include "riscvConst.vh"
`include "riscvInst.vh"
`include "fpu_common.v"
`include "vuVXU-Opcode.vh"

module riscvProcDpath #
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

  output [31:0] imem_req_addr,
  input  [31:0] imem_resp_data,

  input [4:0]  ll_waddr,
  input        ll_wen,
  input [63:0] ll_wdata,

  output [19:0] vec_cmdq_bits,
  output [63:0] vec_ximm1q_bits,
  output [31:0] vec_ximm2q_bits,

  input [2:0] ctrl_sel_pc,
  input       ctrl_wen_btb,
  input       ctrl_stallf,
  input       ctrl_stalld,
  input       ctrl_killf,
  input       ctrl_killd,
  input       ctrl_ren2,
  input       ctrl_ren1,
  input [1:0] ctrl_sel_alu2,
  input       ctrl_sel_alu1,
  input       ctrl_fn_dw,
  input [3:0] ctrl_fn_alu,
  input       ctrl_wen,
  input       ctrl_sel_wa,
  input [1:0] ctrl_sel_wb,
  input       ctrl_ren_pcr,
  input       ctrl_wen_pcr,
  input       ctrl_wen_fsr,
  input       ctrl_fn_vec,
  input       ctrl_wen_vec,
  input [2:0] ctrl_sel_vcmd,
  input [1:0] ctrl_sel_vimm,
  input       ctrl_except_illegal,
  input       ctrl_except_privileged,
  input       ctrl_except_fpu,
  input       ctrl_except_syscall,
  input       ctrl_except_vec,
  input       ctrl_except_vec_bank,
  input       ctrl_eret,

  output [7:0] dpath_status,
  output dpath_btb_hit,
  output [31:0] dpath_inst,
  output [63:0] dpath_id_rdata2,
  output [63:0] dpath_id_rdata1,
  output [63:0] dpath_ex_rs2,
  output dpath_bypass_rs2,
  output dpath_bypass_rs1,
  output dpath_exception,
  output dpath_br_eq,
  output dpath_br_lt,
  output dpath_br_ltu,
  output dpath_vec_bank_lt3,
  output dpath_vec_appvl_eq0,
  output [4:0] dpath_waddr,
  output [63:0] dpath_alu_out,
  output [`FSR_WIDTH-1:0] dpath_fsr
);

  // instruction fetch definitions
  reg  [31:0] if_reg_pc;
  wire [31:0] if_next_pc;

  wire [31:0] if_pc_plus4;
  wire [31:0] if_btb_target;

  // instruction decode definitions
  reg  [31:0] id_reg_pc;
  reg  [31:0] id_reg_pc_plus4;
  reg  [31:0] id_reg_inst;

  wire [4:0]  id_raddr2;
  wire [4:0]  id_raddr1;
  wire [63:0] id_rdata2;
  wire [63:0] id_rdata1;
  wire [4:0]  id_waddr;
  wire [63:0] id_rs2;
  wire [63:0] id_rs1;
  wire        id_exception;
  wire [4:0]  id_cause;

  // execute definitions
  reg  [31:0] ex_reg_pc;
  reg  [31:0] ex_reg_pc_plus4;
  reg  [31:0] ex_reg_inst;
  reg  [4:0]  ex_reg_raddr2;
  reg  [4:0]  ex_reg_raddr1;
  reg  [63:0] ex_reg_rs2;
  reg  [63:0] ex_reg_rs1;
  reg  [4:0]  ex_reg_waddr;
  reg         ex_reg_exception;
  reg  [4:0]  ex_reg_cause;
  reg         ex_reg_eret;
  reg  [1:0]  ex_reg_ctrl_sel_alu2;
  reg         ex_reg_ctrl_sel_alu1;
  reg         ex_reg_ctrl_fn_dw;
  reg  [3:0]  ex_reg_ctrl_fn_alu;
  reg  [1:0]  ex_reg_ctrl_sel_wb;
  reg         ex_reg_ctrl_wen;
  reg         ex_reg_ctrl_ren_pcr;
  reg         ex_reg_ctrl_wen_pcr;
  reg         ex_reg_ctrl_wen_fsr;
  reg         ex_reg_ctrl_fn_vec;
  reg         ex_reg_ctrl_wen_vec;
  reg  [2:0]  ex_reg_ctrl_sel_vcmd;
  reg  [2:0]  ex_reg_ctrl_sel_vimm;

  wire [63:0] ex_sign_extend;
  wire [63:0] ex_sign_extend_split;
  wire [31:0] ex_branch_target;
  wire [31:0] ex_jr_target;
  wire        ex_exception;
  wire [4:0]  ex_cause;
  wire [4:0]  ex_raddr_pcr;
  wire [63:0] ex_pcr;
  wire [63:0] ex_wdata;
  wire [5:0]  ex_alu_shamt;
  wire [63:0] ex_alu_in2;
  wire [63:0] ex_alu_in1;
  wire [63:0] ex_alu_out;
  wire [11:0] ex_vec_out;

  // instruction fetch stage
  always @(posedge clk)
  begin
    if (reset)
      if_reg_pc <= 32'h2000; //32'hFFFF_FFFC;
    else if (!ctrl_stallf)
      if_reg_pc <= if_next_pc;
  end

  assign if_pc_plus4 = if_reg_pc + 32'd4;

  assign if_next_pc
    = (ctrl_sel_pc == `PC_4) ? if_pc_plus4
    : (ctrl_sel_pc == `PC_BTB) ? if_btb_target
    : (ctrl_sel_pc == `PC_EX4) ? ex_reg_pc_plus4
    : (ctrl_sel_pc == `PC_BR) ? ex_branch_target
    : (ctrl_sel_pc == `PC_J) ? ex_branch_target
    : (ctrl_sel_pc == `PC_JR) ? ex_jr_target
    : (ctrl_sel_pc == `PC_PCR) ? ex_pcr[31:0]
    : 32'bx;

  assign imem_req_addr
    = ctrl_stallf ? if_reg_pc
    : if_next_pc;

  riscvProcDpathBTB btb
  (
    .clk(clk),
    .reset(reset),

    .current_pc4(if_pc_plus4),
    .btb_hit(dpath_btb_hit),
    .btb_target(if_btb_target),

    .wen(ctrl_wen_btb),
    .correct_pc4(ex_reg_pc_plus4),
    .correct_target(ex_branch_target)
  );

  // instruction decode stage
  always @(posedge clk)
  begin
    if (reset)
    begin
      id_reg_pc <= 32'd0;
      id_reg_pc_plus4 <= 32'd0;
      id_reg_inst <= `NOP;
    end
    else if (!ctrl_stalld)
    begin
      id_reg_pc <= if_reg_pc;
      id_reg_pc_plus4 <= if_pc_plus4;

      if (ctrl_killf)
        id_reg_inst <= `NOP;
      else
        id_reg_inst <= imem_resp_data;
    end
  end

  assign id_raddr2 = id_reg_inst[21:17];
  assign id_raddr1 = id_reg_inst[26:22];

  riscvProcDpath_Regfile rfile
  (
    .clk(clk),

    .raddr0(id_raddr2),
    .raddr1(id_raddr1),
    .ren0(ctrl_ren2),
    .ren1(ctrl_ren1),
    .rdata0(id_rdata2),
    .rdata1(id_rdata1),

    .waddr0_p(ex_reg_waddr),
    .wen0_p(ex_reg_ctrl_wen),
    .wdata0_p(ex_wdata),

    .waddr1_p(ll_waddr),
    .wen1_p(ll_wen),
    .wdata1_p(ll_wdata)
  );

  assign id_waddr
    = (ctrl_sel_wa == `WA_RD) ? id_reg_inst[31:27]
    : (ctrl_sel_wa == `WA_RA) ? `RA
    : 5'bx;

  wire bypass_rs2 = (id_raddr2 != 5'd0 && ex_reg_ctrl_wen && id_raddr2 == ex_reg_waddr);
  wire bypass_rs1 = (id_raddr1 != 5'd0 && ex_reg_ctrl_wen && id_raddr1 == ex_reg_waddr);

  assign id_rs2 = bypass_rs2 ? ex_wdata : id_rdata2;
  assign id_rs1 = bypass_rs1 ? ex_wdata : id_rdata1;

  assign id_exception =
    ctrl_except_illegal |
    ctrl_except_privileged |
    ctrl_except_fpu |
    ctrl_except_syscall |
    ctrl_except_vec |
    ctrl_except_vec_bank;

  assign id_cause
    = ctrl_except_illegal ? 5'd2
    : ctrl_except_privileged ? 5'd3
    : ctrl_except_fpu ? 5'd4
    : ctrl_except_syscall ? 5'd6
    : ctrl_except_vec ? 5'd12
    : ctrl_except_vec_bank ? 5'd13
    : 5'd0;

  // execute stage
  always @(posedge clk)
  begin
    if (reset)
    begin
      ex_reg_pc_plus4 <= 32'd0;
      ex_reg_inst <= 32'd0;
      ex_reg_raddr2 <= 5'd0;
      ex_reg_raddr1 <= 5'd0;
      ex_reg_rs2 <= 64'd0;
      ex_reg_rs1 <= 64'd0;
      ex_reg_waddr <= 5'd0;
      ex_reg_exception <= 1'b0;
      ex_reg_cause <= 5'd0;
      ex_reg_eret <= 1'b0;
      ex_reg_ctrl_sel_alu2 <= `A2_X;
      ex_reg_ctrl_sel_alu1 <= `A1_X;
      ex_reg_ctrl_fn_dw <= `DW_X;
      ex_reg_ctrl_fn_alu <= `FN_X;
      ex_reg_ctrl_sel_wb <= `WB_X;
      ex_reg_ctrl_wen <= 1'b0;
      ex_reg_ctrl_ren_pcr <= 1'b0;
      ex_reg_ctrl_wen_pcr <= 1'b0;
      ex_reg_ctrl_wen_fsr <= 1'b0;
      ex_reg_ctrl_fn_vec <= 1'b0;
      ex_reg_ctrl_wen_vec <= 1'b0;
      ex_reg_ctrl_sel_vcmd <= `VCMD_X;
      ex_reg_ctrl_sel_vimm <= `VIMM_X;
    end
    else
    begin
      ex_reg_pc <= id_reg_pc;
      ex_reg_pc_plus4 <= id_reg_pc_plus4;
      ex_reg_inst <= id_reg_inst;
      ex_reg_raddr2 <= id_raddr2;
      ex_reg_raddr1 <= id_raddr1;
      ex_reg_rs2 <= id_rs2;
      ex_reg_rs1 <= id_rs1;
      ex_reg_waddr <= id_waddr;
      ex_reg_cause <= id_cause;
      ex_reg_ctrl_sel_alu2 <= ctrl_sel_alu2;
      ex_reg_ctrl_sel_alu1 <= ctrl_sel_alu1;
      ex_reg_ctrl_fn_dw <= ctrl_fn_dw;
      ex_reg_ctrl_fn_alu <= ctrl_fn_alu;
      ex_reg_ctrl_sel_wb <= ctrl_sel_wb;
      ex_reg_ctrl_ren_pcr <= ctrl_ren_pcr;
      ex_reg_ctrl_fn_vec <= ctrl_fn_vec;
      ex_reg_ctrl_wen_vec <= ctrl_wen_vec;
      ex_reg_ctrl_sel_vcmd <= ctrl_sel_vcmd;
      ex_reg_ctrl_sel_vimm <= ctrl_sel_vimm;

      if (ctrl_killd)
      begin
        ex_reg_exception <= 1'b0;
        ex_reg_eret <= 1'b0;
        ex_reg_ctrl_wen <= 1'b0;
        ex_reg_ctrl_wen_pcr <= 1'b0;
        ex_reg_ctrl_wen_fsr <= 1'b0;
      end
      else
      begin
        ex_reg_exception <= id_exception;
        ex_reg_eret <= ctrl_eret;
        ex_reg_ctrl_wen <= ctrl_wen;
        ex_reg_ctrl_wen_pcr <= ctrl_wen_pcr;
        ex_reg_ctrl_wen_fsr <= ctrl_wen_fsr;
      end
    end
  end

  assign ex_sign_extend = {{52{ex_reg_inst[21]}}, ex_reg_inst[21:10]};
  assign ex_sign_extend_split = {{52{ex_reg_inst[31]}}, ex_reg_inst[31:27], ex_reg_inst[16:10]};

  wire [31:0] branch_adder_rhs
    = (ctrl_sel_pc == `PC_BR) ? {ex_sign_extend_split[30:0], 1'd0}
    : {{6{ex_reg_inst[31]}}, ex_reg_inst[31:7],1'd0};

  assign ex_branch_target = ex_reg_pc + branch_adder_rhs;
  assign ex_jr_target = ex_alu_out[31:0];

  assign ex_alu_shamt
    = {ex_alu_in2[5] & ex_reg_ctrl_fn_dw == `DW_64, ex_alu_in2[4:0]};

  assign ex_alu_in2
    = (ex_reg_ctrl_sel_alu2 == `A2_0) ? 64'd0
    : (ex_reg_ctrl_sel_alu2 == `A2_SEXT) ? ex_sign_extend
    : (ex_reg_ctrl_sel_alu2 == `A2_SPLIT) ? ex_sign_extend_split
    : (ex_reg_ctrl_sel_alu2 == `A2_RS2) ? ex_reg_rs2
    : 64'bx;

  assign ex_alu_in1
    = (ex_reg_ctrl_sel_alu1 == `A1_RS1) ? ex_reg_rs1
    : (ex_reg_ctrl_sel_alu1 == `A1_LUI) ? {{32{ex_reg_inst[26]}},ex_reg_inst[26:7],12'd0}
    : 64'bx;

  riscvProcDpath_ALU alu
  (
    .dw(ex_reg_ctrl_fn_dw),
    .fn(ex_reg_ctrl_fn_alu),
    .shamt(ex_alu_shamt),
    .in2(ex_alu_in2),
    .in1(ex_alu_in1),
    .out(ex_alu_out),
    .lt(dpath_br_lt),
    .ltu(dpath_br_ltu)
  );

  wire [7:0] vec_bank;
  wire [3:0] vec_bank_count;

  generate
    if (HAS_VECTOR)
    begin
      riscvProcDpath_VEC vec
      (
        .clk(clk),
        .reset(reset),

        .wen(ex_reg_ctrl_wen_vec),
        .fn(ex_reg_ctrl_fn_vec),
        .in(ex_reg_rs1),
        .imm(ex_reg_inst[21:10]),
        .vec_bank_count(vec_bank_count),
        .appvl_eq0(dpath_vec_appvl_eq0),
        .out(ex_vec_out)
      );
    end
    else
    begin
      assign ex_vec_out = 11'bx;
    end
  endgenerate

  assign ex_exception = ex_reg_exception;
  assign ex_cause = ex_reg_cause;

  assign ex_raddr_pcr
    = ex_exception ? `PCR_EVEC
    : ex_reg_eret ? `PCR_EPC
    : ex_reg_raddr2;

  riscvProcDpath_PCR#(.COREID(COREID), .HAS_FPU(HAS_FPU), .HAS_VECTOR(HAS_VECTOR)) pcr
  (
    .clk(clk),
    .reset(reset),

    .status(dpath_status),
    .vec_bank(vec_bank),
    .vec_bank_count(vec_bank_count),
    .error_mode(error_mode),
    .log_control(log_control),

    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),

    .exception(ex_exception),
    .cause(ex_cause),
    .pc(ex_reg_pc),

    .eret(ex_reg_eret),

    .raddr(ex_raddr_pcr),
    .ren(ex_exception | ex_reg_eret | ex_reg_ctrl_ren_pcr),
    .rdata(ex_pcr),

    .waddr(ex_reg_raddr2),
    .wen(ex_reg_ctrl_wen_pcr),
    .wdata(ex_reg_rs1)
  );

  riscvProcDpath_FSR fsr
  (
    .clk(clk),
    .reset(reset),

    .wen(ex_reg_ctrl_wen_fsr),
    .wdata(ex_reg_rs1[`FSR_WIDTH-1:0]),

    .fsr(dpath_fsr)
  );

  generate
    if (HAS_VECTOR)
    begin
      assign ex_wdata
        = (ex_reg_ctrl_sel_wb == `WB_PC) ? ex_reg_pc_plus4
        : (ex_reg_ctrl_sel_wb == `WB_ALU) ? ex_alu_out
        : (ex_reg_ctrl_sel_wb == `WB_PCR) ? ex_pcr
        : (ex_reg_ctrl_sel_wb == `WB_VEC) ? {52'd0, ex_vec_out}
        : 64'bx;
    end
    else
      assign ex_wdata
        = (ex_reg_ctrl_sel_wb == `WB_PC) ? ex_reg_pc_plus4
        : (ex_reg_ctrl_sel_wb == `WB_ALU) ? ex_alu_out
        : (ex_reg_ctrl_sel_wb == `WB_PCR) ? ex_pcr
        : 64'bx;
    begin
    end
  endgenerate

  assign dpath_id_rdata2 = id_rdata2;
  assign dpath_id_rdata1 = id_rdata1;
  assign dpath_bypass_rs2 = bypass_rs2;
  assign dpath_bypass_rs1 = bypass_rs1;
  assign dpath_inst = id_reg_inst;
  assign dpath_ex_rs2 = ex_reg_rs2;
  assign dpath_exception = ex_exception;
  assign dpath_br_eq = (ex_reg_rs1 == ex_reg_rs2);
  assign dpath_vec_bank_lt3 = vec_bank_count < 4'd3;
  assign dpath_waddr = ex_reg_waddr;
  assign dpath_alu_out = ex_alu_out;

  generate
    if (HAS_VECTOR)
    begin
      assign vec_cmdq_bits
        = (ex_reg_ctrl_sel_vcmd == `VCMD_I) ? {2'b00, 4'd0, ex_reg_inst[9:8], 6'd0, 6'd0}
        : (ex_reg_ctrl_sel_vcmd == `VCMD_F) ? {2'b00, 3'd1, ex_reg_inst[9:7], 6'd0, 6'd0}
        : (ex_reg_ctrl_sel_vcmd == `VCMD_TX) ? {2'b01, ex_reg_inst[13:8], 1'b0, ex_reg_waddr, 1'b0, ex_reg_raddr1}
        : (ex_reg_ctrl_sel_vcmd == `VCMD_TF) ? {2'b01, ex_reg_inst[13:8], 1'b1, ex_reg_waddr, 1'b1, ex_reg_raddr1}
        : (ex_reg_ctrl_sel_vcmd == `VCMD_MX) ? {1'b1, ex_reg_inst[13:12], ex_reg_inst[2], ex_reg_inst[10:7], 1'b0, ex_reg_waddr, 1'b0, ex_reg_waddr}
        : (ex_reg_ctrl_sel_vcmd == `VCMD_MF) ? {1'b1, ex_reg_inst[13:12], ex_reg_inst[2], ex_reg_inst[10:7], 1'b1, ex_reg_waddr, 1'b1, ex_reg_waddr}
        : 20'bx;

      wire [11:0] ex_vlenm1 = ex_vec_out - 1'b1;

      assign vec_ximm1q_bits
        = (ex_reg_ctrl_sel_vimm == `VIMM_VLEN) ? {29'd0, vec_bank_count, vec_bank, ex_reg_inst[21:10], ex_vlenm1[10:0]}
        : (ex_reg_ctrl_sel_vimm == `VIMM_ALU) ? ex_alu_out
        : (ex_reg_ctrl_sel_vimm == `VIMM_RS1) ? ex_reg_rs1
        : 64'bx;

      assign vec_ximm2q_bits = ex_reg_rs2[31:0];
    end
    else
    begin
      assign vec_cmdq_bits = 20'bx;
      assign vec_ximm1q_bits = 64'bx;
      assign vec_ximm2q_bits = 32'bx;
    end
  endgenerate

`ifndef SYNTHESIS
  reg [31:0] ex_reg_loginst;

  always @(posedge clk)
  begin
    if (ctrl_killd)
      ex_reg_loginst <= `NOP;
    else
      ex_reg_loginst <= id_reg_inst;
  end

  printInst log
  (
    .clk(clk),
    .inst(ex_reg_loginst),
    .log_control(log_control)
  );
`endif
  
endmodule
