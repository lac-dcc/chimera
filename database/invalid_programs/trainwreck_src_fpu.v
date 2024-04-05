`include "riscvConst.vh"
`include "fpu_common.v"
`include "fpu_recoded.vh"
module fpu
(
  input  wire                        clk,
  input  wire                        reset,

  input  wire                        cmd_val,
  input  wire                        cmd_precision,
  input  wire [`FPU_RM_WIDTH-1:0]    cmd_rm,
  input  wire [`FPU_CMD_WIDTH-1:0]   cmd,
  input  wire [`FPR_WIDTH-1:0]       cmd_data,

  input  wire [`FPRID_WIDTH-1:0]     cmd_rs1,
  input  wire [`FPRID_WIDTH-1:0]     cmd_rs2,
  input  wire [`FPRID_WIDTH-1:0]     cmd_rs3,
  input  wire [`FPRID_WIDTH-1:0]     cmd_rd,

  input  wire [`FPR_WIDTH-1:0]       fp_load_data,
  input  wire [`FPRID_WIDTH-1:0]     fp_load_rd,
  input  wire                        fp_load_val,
  input  wire                        fp_load_precision,

  output wire                        fpu_flaq_enq,

  output wire                        rdy,

  output wire                        fp_toint_val,
  output wire [`FPR_WIDTH-1:0]       fp_toint_data,
  output wire [`FPRID_WIDTH-1:0]     fp_toint_rd,

  output wire                        fp_store_val,
  output wire [`FPR_WIDTH-1:0]       fp_store_data,

  output wire                        pipe_fma_val,
  input  wire                        pipe_fma_rdy,
  output wire `DEF_VAU1_FN           pipe_fma_fn,
  output wire `DEF_FLEN              pipe_fma_in0,
  output wire `DEF_FLEN              pipe_fma_in1,
  output wire `DEF_FLEN              pipe_fma_in2,
  input  wire `DEF_EXC               pipe_fma_exc,
  input  wire `DEF_FLEN              pipe_fma_out
);

  wire ctrl_need_rs1, ctrl_need_rs2, ctrl_need_rs3, ctrl_need_rd, ctrl_need_fsr;
  wire ctrl_need_pipeline, ctrl_fp_fromint, ctrl_fp_toint;
  wire ctrl_fp_load, ctrl_fp_store, ctrl_write_fsr;
  wire [`FPU_PIPE_ID_WIDTH-1:0] ctrl_pipeline_id;

  fpu_decoder fpu_decoder
  (
    .cmd_precision(cmd_precision),
    .cmd(cmd),

    .need_rs1(ctrl_need_rs1),
    .need_rs2(ctrl_need_rs2),
    .need_rs3(ctrl_need_rs3),
    .need_rd (ctrl_need_rd),
    .need_fsr(ctrl_need_fsr),

    .need_pipeline(ctrl_need_pipeline),
    .pipeline_id(ctrl_pipeline_id),
    .fp_fromint(ctrl_fp_fromint),
    .fp_toint(ctrl_fp_toint),
    .fp_load(ctrl_fp_load),
    .fp_store(ctrl_fp_store),
    .write_fsr(ctrl_write_fsr)
  );

  wire fpr_wen1, fpr_wen2;
  wire [`FPRID_WIDTH-1:0] fpr_waddr1, fpr_waddr2;
  wire [`FPR_REC_WIDTH-1:0] fpr_wdata1, fpr_wdata2;

  wire schedule_val, schedule_rdy, busy_fsr;
  wire [`FPU_PIPE_ID_WIDTH-1:0] wb_pipeline_id;
  fp_scheduler fp_scheduler
  (
    .clk(clk),
    .reset(reset),

`ifdef ST_TAPEOUT_0
    .schedule_val(schedule_val),
`else
    .schedule_val(schedule_val & ctrl_need_pipeline),
`endif
    .schedule_writeback(ctrl_need_pipeline),
    .schedule_rdy(schedule_rdy),
    .schedule_pipeline_id(ctrl_pipeline_id),
    .schedule_rd(cmd_rd),

    .busy_fsr(busy_fsr),

    .wb_wen(fpr_wen1),
    .wb_waddr(fpr_waddr1),
    .wb_pipeline_id(wb_pipeline_id)
  );

  wire [`FSR_WIDTH-1:0] fsr;
  wire fsr_exc_wen1, fsr_exc_wen2;
  wire [`FPU_EXC_WIDTH-1:0] fsr_exc_wdata1, fsr_exc_wdata2;
  fp_fsr fp_fsr
  (
    .clk(clk),
    .reset(reset),
  
    .fsr_wen(schedule_val & schedule_rdy & ctrl_write_fsr),
    .fsr_wdata(cmd_data[`FSR_WIDTH-1:0]),
  
    .fsr_exc_wen1(fsr_exc_wen1),
    .fsr_exc_wdata1(fsr_exc_wdata1),
  
    .fsr_exc_wen2(fsr_exc_wen2),
    .fsr_exc_wdata2(fsr_exc_wdata2),
  
    .fsr(fsr)
  );

  wire busy_rs1, busy_rs2, busy_rs3, busy_rd;
  fp_scoreboard fp_scoreboard
  (
    .clk(clk),
    .reset(reset),
  
    .fp_fire(schedule_val & schedule_rdy & ctrl_need_pipeline),
    .fp_fire_addr(cmd_rd),
  
    .load_fire(schedule_val & schedule_rdy & ctrl_fp_load),
    .load_fire_addr(cmd_rd),

    .fp_wb(fpr_wen1),
    .fp_wb_addr(fpr_waddr1),

    .load_wb(fpr_wen2),
    .load_wb_addr(fpr_waddr2),
  
    .rs1(cmd_rs1),
    .rs2(cmd_rs2),
    .rs3(cmd_rs3),
    .rd (cmd_rd),
  
    .busy_rs1(busy_rs1),
    .busy_rs2(busy_rs2),
    .busy_rs3(busy_rs3),
    .busy_rd (busy_rd)
  );

  wire [`FPR_REC_WIDTH-1:0] rs1_data, rs2_data, rs3_data;
  fp_regfile fprf
  (
    .clk(clk),
    .reset(reset),
  
    .rs1(cmd_rs1),
    .rs2(cmd_rs2),
    .rs3(cmd_rs3),
  
    .fpr_wen1(fpr_wen1),
    .fpr_waddr1(fpr_waddr1),
    .fpr_wdata1(fpr_wdata1),
  
    .fpr_wen2(fpr_wen2),
    .fpr_waddr2(fpr_waddr2),
    .fpr_wdata2(fpr_wdata2),
  
    .rs1_data(rs1_data),
    .rs2_data(rs2_data),
    .rs3_data(rs3_data)
  );

  wire [`FPR_REC_WIDTH-1:0] pipe_fromint_out;
  wire [`FPU_EXC_WIDTH-1:0] pipe_fromint_exc;
  fp_fromint_unit fp_fromint_unit
  (
    .clk(clk),
    .reset(reset),

    .val(schedule_val & schedule_rdy & ctrl_fp_fromint),
    .cmd(cmd),
    .rm(cmd_rm),
    .data(cmd_data),
    .precision(cmd_precision),

    .out(pipe_fromint_out),
    .exc(pipe_fromint_exc)
  );

  fp_load_unit fp_load_unit
  (
    .clk(clk),
    .reset(reset),

    .load_val(fp_load_val),
    .load_data(fp_load_data),
    .load_rd(fp_load_rd),
    .load_precision(fp_load_precision),

    .rf_wen(fpr_wen2),
    .rf_waddr(fpr_waddr2),
    .rf_wdata(fpr_wdata2)
  );

  assign fsr_exc_wen2 = fp_toint_val;
  fp_toint_unit fp_toint_unit
  (
    .clk(clk),
    .reset(reset),

    .in_toint_val(schedule_val & schedule_rdy & ctrl_fp_toint),
    .in_toint_cmd(cmd),
    .in_toint_rm(cmd_rm),
    .in_toint_rd(cmd_rd),
    .in_precision(cmd_precision),
    .in0(rs1_data),
    .in1(rs2_data),
    .in_fsr(fsr),

    .toint_val(fp_toint_val),
    .toint_data(fp_toint_data),
    .toint_rd(fp_toint_rd),
    .toint_exc(fsr_exc_wdata2)
  );

  fp_store_unit fp_store_unit
  (
    .clk(clk),
    .reset(reset),

    .in_val(schedule_val & schedule_rdy & ctrl_fp_store),
    .in_precision(cmd_precision),
    .in(rs2_data),

    .out_val(fp_store_val),
    .out_data(fp_store_data)
  );

  wire ctrl_fp_move = ctrl_need_pipeline & (ctrl_pipeline_id==`FPU_PIPE_MOVE);
  wire [`FPR_REC_WIDTH-1:0] pipe_move_out;
  wire [`FPU_EXC_WIDTH-1:0] pipe_move_exc;
  fp_move_unit fp_move_unit
  (
    .clk(clk),
    .reset(reset),

    .val(schedule_val & schedule_rdy & ctrl_fp_move),
    .cmd(cmd),
    .in0(rs1_data),
    .in1(rs2_data),
    .precision(cmd_precision),

    .out(pipe_move_out),
    .exc(pipe_move_exc)
  );

  wire ctrl_fp_cvtsd = ctrl_need_pipeline & (ctrl_pipeline_id==`FPU_PIPE_CVT_S_D);
  wire [`FPR_REC_WIDTH-1:0] pipe_cvtsd_out;
  wire [`FPU_EXC_WIDTH-1:0] pipe_cvtsd_exc;
  fp_cvtsd_unit fp_cvtsd_unit
  (
    .clk(clk),
    .reset(reset),

    .val(schedule_val & schedule_rdy & ctrl_fp_cvtsd),
    .rm(cmd_rm),
    .in0(rs1_data),

    .out(pipe_cvtsd_out),
    .exc(pipe_cvtsd_exc)
  );

  assign fsr_exc_wen1 = fpr_wen1;
  assign {fsr_exc_wdata1, fpr_wdata1}
    = wb_pipeline_id == `FPU_PIPE_INT_FLOAT ? {pipe_fromint_exc, pipe_fromint_out}
    : wb_pipeline_id == `FPU_PIPE_MOVE      ? {pipe_move_exc, pipe_move_out}
    : wb_pipeline_id == `FPU_PIPE_FMA_S     ? {pipe_fma_exc, pipe_fma_out}
    : wb_pipeline_id == `FPU_PIPE_FMA_D     ? {pipe_fma_exc, pipe_fma_out}
    : wb_pipeline_id == `FPU_PIPE_CVT_S_D   ? {pipe_cvtsd_exc, pipe_cvtsd_out}
    : {`FPU_EXC_WIDTH+`FPR_REC_WIDTH{1'bx}};

  // all pipelines except FMA are always ready
  wire ctrl_fp_fma;
  wire pipeline_rdy = ~(ctrl_fp_fma & ~pipe_fma_rdy);

  wire data_rdy = ~(ctrl_need_fsr & busy_fsr | ctrl_need_rd  & busy_rd  |
                    ctrl_need_rs1 & busy_rs1 | ctrl_need_rs2 & busy_rs2 |
                    ctrl_need_rs3 & busy_rs3);
  assign schedule_val = data_rdy & pipeline_rdy & cmd_val;
  assign rdy = data_rdy & pipeline_rdy & schedule_rdy;
  assign fpu_flaq_enq = schedule_val & schedule_rdy & ctrl_fp_load;

  // shared VXU FMA pipe
  assign ctrl_fp_fma = ctrl_need_pipeline &
                       (ctrl_pipeline_id == `FPU_PIPE_FMA_S |
                        ctrl_pipeline_id == `FPU_PIPE_FMA_D);
  assign pipe_fma_val = data_rdy & schedule_rdy & cmd_val & ctrl_fp_fma;
  assign pipe_fma_fn[`RG_VAU1_RM] = cmd_rm[1:0]; // RMM isn't supported
  assign pipe_fma_fn[`RG_VAU1_FP] = cmd_precision;
  assign pipe_fma_fn[`RG_VAU1_FN] = cmd == `FPU_CMD_ADD   ? `VAU1_ADD
                                  : cmd == `FPU_CMD_SUB   ? `VAU1_SUB
                                  : cmd == `FPU_CMD_MUL   ? `VAU1_MUL
                                  : cmd == `FPU_CMD_MADD  ? `VAU1_MADD
                                  : cmd == `FPU_CMD_MSUB  ? `VAU1_MSUB
                                  : cmd == `FPU_CMD_NMADD ? `VAU1_NMADD
                                  : cmd == `FPU_CMD_NMSUB ? `VAU1_NMSUB
                                  : `VAU1_X;
  assign pipe_fma_in0 = rs1_data;
  assign pipe_fma_in1 = rs2_data;
  assign pipe_fma_in2 = cmd == `FPU_CMD_ADD   ? rs2_data
                      : cmd == `FPU_CMD_SUB   ? rs2_data
                      : cmd == `FPU_CMD_MUL   ? rs2_data
                      : cmd == `FPU_CMD_MADD  ? rs3_data
                      : cmd == `FPU_CMD_MSUB  ? rs3_data
                      : cmd == `FPU_CMD_NMADD ? rs3_data
                      : cmd == `FPU_CMD_NMSUB ? rs3_data
                      : `VAU1_X;
endmodule

module fpu_decoder
(
  input wire                          cmd_precision,
  input wire [`FPU_CMD_WIDTH-1:0]     cmd,

  output reg                          need_rs1,
  output reg                          need_rs2,
  output reg                          need_rs3,
  output reg                          need_rd,
  output reg                          need_fsr,

  output reg                          need_pipeline,
  output reg [`FPU_PIPE_ID_WIDTH-1:0] pipeline_id,
  output reg                          fp_fromint,
  output reg                          fp_toint,
  output reg                          fp_load,
  output reg                          fp_store,
  output reg                          write_fsr
);

  `define CTRLSIGS { need_fsr, write_fsr, need_rs1, need_rs2, need_rs3, need_rd, need_pipeline, fp_fromint, fp_toint, fp_load, fp_store, pipeline_id }
  localparam n = 1'b0;
  localparam y = 1'b1;
  localparam x = 1'bx;
  
  wire sp = cmd_precision == `PRECISION_S;
  always @(*) begin
    case(cmd)
      `FPU_CMD_ADD:      `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_SUB:      `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_MUL:      `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_MADD:     `CTRLSIGS = {n,n,y,y,y,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_MSUB:     `CTRLSIGS = {n,n,y,y,y,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_NMADD:    `CTRLSIGS = {n,n,y,y,y,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_NMSUB:    `CTRLSIGS = {n,n,y,y,y,y,y,n,n,n,n,sp ? `FPU_PIPE_FMA_S : `FPU_PIPE_FMA_D };
      `FPU_CMD_LD:       `CTRLSIGS = {n,n,n,n,n,y,n,n,n,y,n,`FPU_PIPE_X };
      `FPU_CMD_MF:       `CTRLSIGS = {n,n,y,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_ST:       `CTRLSIGS = {n,n,n,y,n,n,n,n,n,n,y,`FPU_PIPE_X };
      `FPU_CMD_TRUNC_L:  `CTRLSIGS = {n,n,y,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_TRUNCU_L: `CTRLSIGS = {n,n,y,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_TRUNC_W:  `CTRLSIGS = {n,n,y,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_TRUNCU_W: `CTRLSIGS = {n,n,y,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_MT:       `CTRLSIGS = {n,n,n,n,n,y,y,y,n,n,n,`FPU_PIPE_INT_FLOAT };
      `FPU_CMD_CVT_L:    `CTRLSIGS = {n,n,n,n,n,y,y,y,n,n,n,`FPU_PIPE_INT_FLOAT };
      `FPU_CMD_CVTU_L:   `CTRLSIGS = {n,n,n,n,n,y,y,y,n,n,n,`FPU_PIPE_INT_FLOAT };
      `FPU_CMD_CVT_W:    `CTRLSIGS = {n,n,n,n,n,y,y,y,n,n,n,`FPU_PIPE_INT_FLOAT };
      `FPU_CMD_CVTU_W:   `CTRLSIGS = {n,n,n,n,n,y,y,y,n,n,n,`FPU_PIPE_INT_FLOAT };
      `FPU_CMD_C_EQ:     `CTRLSIGS = {n,n,y,y,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_C_LT:     `CTRLSIGS = {n,n,y,y,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_C_LE:     `CTRLSIGS = {n,n,y,y,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_CVT_S:    `CTRLSIGS = {n,n,y,n,n,y,y,n,n,n,n,`FPU_PIPE_MOVE };
      `FPU_CMD_CVT_D:    `CTRLSIGS = {n,n,y,n,n,y,y,n,n,n,n,`FPU_PIPE_CVT_S_D };
      `FPU_CMD_SGNINJ:   `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,`FPU_PIPE_MOVE };
      `FPU_CMD_SGNINJN:  `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,`FPU_PIPE_MOVE };
      `FPU_CMD_SGNMUL:   `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,`FPU_PIPE_MOVE };
      `FPU_CMD_MIN:      `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,`FPU_PIPE_MOVE };
      `FPU_CMD_MAX:      `CTRLSIGS = {n,n,y,y,n,y,y,n,n,n,n,`FPU_PIPE_MOVE };
      `FPU_CMD_MTFSR:    `CTRLSIGS = {y,y,n,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      `FPU_CMD_MFFSR:    `CTRLSIGS = {y,n,n,n,n,n,n,n,y,n,n,`FPU_PIPE_X };
      default:           `CTRLSIGS = {x,x,x,x,x,x,x,x,x,x,x,`FPU_PIPE_X };
    endcase
  end

endmodule

module fp_scheduler
(
  input  wire clk,
  input  wire reset,

  input  wire                          schedule_val,
  input  wire                          schedule_writeback,
  output wire                          schedule_rdy,
  input  wire [`FPU_PIPE_ID_WIDTH-1:0] schedule_pipeline_id,
  input  wire [`FPRID_WIDTH-1:0]       schedule_rd,

  output wire busy_fsr,

  output wire                          wb_wen,
  output wire [`FPRID_WIDTH-1:0]       wb_waddr,
  output wire [`FPU_PIPE_ID_WIDTH-1:0] wb_pipeline_id
);

  reg [`FPU_MAX_PIPE_DEPTH-1:0] pipeline_regs_val, pipeline_regs_writeback;
  reg [`FPRID_WIDTH-1:0] pipeline_regs_waddr [`FPU_MAX_PIPE_DEPTH-1:0];
  reg [`FPU_PIPE_ID_WIDTH-1:0] pipeline_regs_id [`FPU_MAX_PIPE_DEPTH-1:0];

  reg [`ceilLog2(`FPU_MAX_PIPE_DEPTH)-1:0] pipeline_head_ptr;
  wire [`ceilLog2(`FPU_MAX_PIPE_DEPTH)-1:0] pipe_depth
    = `FPU_PIPE_DEPTH(schedule_pipeline_id);
  wire [`ceilLog2(`FPU_MAX_PIPE_DEPTH)-1:0] pipeline_tail_ptr
    = pipeline_head_ptr + pipe_depth;
  
  always @(posedge clk)
  begin
    if(reset)
      pipeline_head_ptr <= {`ceilLog2(`FPU_MAX_PIPE_DEPTH){1'b0}};
    else if((schedule_rdy && schedule_val) || (|pipeline_regs_val))
      // the above if() is a clock gate and can be safely removed
      pipeline_head_ptr <= pipeline_head_ptr+1'b1;

    if(schedule_rdy && schedule_val)
    begin
      pipeline_regs_waddr[pipeline_tail_ptr] <= schedule_rd;
      pipeline_regs_id[pipeline_tail_ptr] <= schedule_pipeline_id;
    end

    if(reset)
    begin
      pipeline_regs_val <= {`FPU_MAX_PIPE_DEPTH{1'b0}};
      pipeline_regs_writeback <= {`FPU_MAX_PIPE_DEPTH{1'b0}};
    end
    else 
    begin
      if(schedule_rdy && schedule_val)
      begin
        pipeline_regs_val[pipeline_tail_ptr] <= 1'b1;
        pipeline_regs_writeback[pipeline_tail_ptr] <= schedule_writeback;
      end

      if(!(schedule_rdy && schedule_val && pipe_depth == 0))
      begin
        pipeline_regs_val[pipeline_head_ptr] <= 1'b0;
        pipeline_regs_writeback[pipeline_head_ptr] <= 1'b0;
      end
    end
  end

  assign schedule_rdy
    = ~(schedule_writeback & pipeline_regs_val[pipeline_tail_ptr]);
  assign busy_fsr = |pipeline_regs_val;

  assign wb_wen = pipeline_regs_writeback[pipeline_head_ptr];
  assign wb_waddr = pipeline_regs_waddr[pipeline_head_ptr];
  assign wb_pipeline_id = pipeline_regs_id[pipeline_head_ptr];

endmodule

module fp_scoreboard
(
  input  wire                    clk,
  input  wire                    reset,

  input  wire                    fp_fire,
  input  wire [`FPRID_WIDTH-1:0] fp_fire_addr,

  input  wire                    load_fire,
  input  wire [`FPRID_WIDTH-1:0] load_fire_addr,

  input  wire                    fp_wb,
  input  wire [`FPRID_WIDTH-1:0] fp_wb_addr,

  input  wire                    load_wb,
  input  wire [`FPRID_WIDTH-1:0] load_wb_addr,

  input  wire [`FPRID_WIDTH-1:0] rs1,
  input  wire [`FPRID_WIDTH-1:0] rs2,
  input  wire [`FPRID_WIDTH-1:0] rs3,
  input  wire [`FPRID_WIDTH-1:0] rd,

  output wire                    busy_rs1,
  output wire                    busy_rs2,
  output wire                    busy_rs3,
  output wire                    busy_rd
);

  reg [`NFPR-1:0] fp_scoreboard, load_scoreboard;
  
  always @(posedge clk)
  begin
    if(reset)
      fp_scoreboard <= {`NFPR{1'b0}};
    else
    begin
      if(fp_fire)
        fp_scoreboard[fp_fire_addr] <= 1'b1;
      if(fp_wb && !(fp_fire && fp_fire_addr == fp_wb_addr))
        fp_scoreboard[fp_wb_addr] <= 1'b0;
    end

    if(reset)
      load_scoreboard <= {`NFPR{1'b0}};
    else
    begin
      if(load_fire)
        load_scoreboard[load_fire_addr] <= 1'b1;
      if(load_wb && !(load_fire && load_fire_addr == load_wb_addr))
        load_scoreboard[load_wb_addr] <= 1'b0;
    end
  end
  
  assign busy_rs1 = fp_scoreboard[rs1] | load_scoreboard[rs1];
  assign busy_rs2 = fp_scoreboard[rs2] | load_scoreboard[rs2];
  assign busy_rs3 = fp_scoreboard[rs3] | load_scoreboard[rs3];
  assign busy_rd  = fp_scoreboard[rd]  | load_scoreboard[rd];

endmodule

module fp_regfile
(
  input  wire                      clk,
  input  wire                      reset,

  input  wire [`FPRID_WIDTH-1:0]   rs1,
  input  wire [`FPRID_WIDTH-1:0]   rs2,
  input  wire [`FPRID_WIDTH-1:0]   rs3,

  input  wire                      fpr_wen1,
  input  wire [`FPRID_WIDTH-1:0]   fpr_waddr1,
  input  wire [`FPR_REC_WIDTH-1:0] fpr_wdata1,

  input  wire                      fpr_wen2,
  input  wire [`FPRID_WIDTH-1:0]   fpr_waddr2,
  input  wire [`FPR_REC_WIDTH-1:0] fpr_wdata2,

  output wire [`FPR_REC_WIDTH-1:0] rs1_data,
  output wire [`FPR_REC_WIDTH-1:0] rs2_data,
  output wire [`FPR_REC_WIDTH-1:0] rs3_data
);

  reg [`FPR_REC_WIDTH-1:0] fpr [`NFPR-1:0];
  
  always @(posedge clk)
  begin
    if(fpr_wen1)
      fpr[fpr_waddr1] <= fpr_wdata1;
    if(fpr_wen2)
      fpr[fpr_waddr2] <= fpr_wdata2;
  end
  
  assign rs1_data = fpr[rs1];
  assign rs2_data = fpr[rs2];
  assign rs3_data = fpr[rs3];

endmodule

module fp_load_unit
(
  input  wire clk,
  input  wire reset,

  input  wire                      load_val,
  input  wire [`FPR_WIDTH-1:0]     load_data,
  input  wire [`FPRID_WIDTH-1:0]   load_rd,
  input  wire                      load_precision,

  output reg                       rf_wen,
  output reg  [`FPRID_WIDTH-1:0]   rf_waddr,
  output wire [`FPR_REC_WIDTH-1:0] rf_wdata
);

  reg [`FPR_WIDTH-1:0] r_data;
  reg r_precision;

  always @(posedge clk)
  begin
    if(reset)
      rf_wen <= 1'b0;
    else
      rf_wen <= load_val;

    if(load_val)
    begin
      rf_waddr <= load_rd;
      r_data <= load_data;
      r_precision <= load_precision;
    end
  end

  wire [`FPR_REC_WIDTH-1:0] sp_out, dp_out;
  assign sp_out[`FPR_REC_WIDTH-1:`SP_REC_WIDTH] = 32'hFFFFFFFF;

  floatNToRecodedFloatN #( 8,24) sp (r_data[31:0], sp_out[`SP_REC_WIDTH-1:0]);
  floatNToRecodedFloatN #(11,53) dp (r_data,       dp_out);

  assign rf_wdata = r_precision == `PRECISION_S ? sp_out : dp_out;

endmodule

module fp_toint_unit
(
  input  wire clk,
  input  wire reset,

  input  wire                      in_toint_val,
  input  wire [`FPU_CMD_WIDTH-1:0] in_toint_cmd,
  input  wire [`FPU_RM_WIDTH-1:0]  in_toint_rm,
  input  wire [`FPRID_WIDTH-1:0]   in_toint_rd,
  input  wire                      in_precision,
  input  wire [`FPR_REC_WIDTH-1:0] in0,
  input  wire [`FPR_REC_WIDTH-1:0] in1,
  input  wire [`FSR_WIDTH-1:0]     in_fsr,

  output wire                      toint_val,
  output wire [`FPR_WIDTH-1:0]     toint_data,
  output wire [`FPRID_WIDTH-1:0]   toint_rd,
  output wire [`FPU_EXC_WIDTH-1:0] toint_exc
);

  reg [`FPU_CMD_WIDTH-1:0] r_cmd;
  reg [`FPU_RM_WIDTH-1:0] r_rm;
  reg r_precision;
  reg [`FPR_REC_WIDTH-1:0] r_in0, r_in1;
  reg [`FSR_WIDTH-1:0] r_fsr;

  // MTFSR/MFFSR
  wire [`FPR_WIDTH-1:0] fsr_out = {{`FPR_WIDTH-`FSR_WIDTH{1'b0}}, r_fsr};

  // un-recode for mftx
  wire [63:0] unrec_dp, unrec_out;
  wire [31:0] unrec_sp;
  recodedFloatNToFloatN #( 8,24) rec_sp (r_in0[`SP_REC_WIDTH-1:0], unrec_sp);
  recodedFloatNToFloatN #(11,53) rec_dp (r_in0, unrec_dp);
  assign unrec_out
    = r_precision == `PRECISION_S ? {{32{unrec_sp[31]}}, unrec_sp} : unrec_dp;
  wire [`FPU_EXC_WIDTH-1:0] exc_none = {`FPU_EXC_WIDTH{1'b0}};

  // compare and write boolean to int
  wire [`FPU_EXC_WIDTH-1:0] exc_cmp_sp, exc_cmp_dp;
  wire cmp_less_sp, cmp_less_dp, cmp_equal_sp, cmp_equal_dp;
  compareRecodedFloatN #( 8,24) cmp_sp
  (
    .a(r_in0[`SP_REC_WIDTH-1:0]),
    .b(r_in1[`SP_REC_WIDTH-1:0]),
    .less(cmp_less_sp),
    .equal(cmp_equal_sp),
    .unordered(),
    .exceptionFlags(exc_cmp_sp)
  );
  compareRecodedFloatN #(11,53) cmp_dp
  (
    .a(r_in0),
    .b(r_in1),
    .less(cmp_less_dp),
    .equal(cmp_equal_dp),
    .unordered(),
    .exceptionFlags(exc_cmp_dp)
  );
  wire cmp_equal = r_precision == `PRECISION_S ? cmp_equal_sp : cmp_equal_dp;
  wire cmp_less = r_precision == `PRECISION_S ? cmp_less_sp : cmp_less_dp;
  wire [`FPU_EXC_WIDTH-1:0] exc_cmp
    = r_precision == `PRECISION_S ? exc_cmp_sp : exc_cmp_dp;
  wire cmp_result = r_cmd == `FPU_CMD_C_EQ ? cmp_equal
                  : r_cmd == `FPU_CMD_C_LE ? cmp_equal|cmp_less
                  : r_cmd == `FPU_CMD_C_LT ? cmp_less
                  : 1'bx;
  wire [`FPR_WIDTH-1:0] cmp_out = {{`FPR_WIDTH-1{1'b0}}, cmp_result};

  // convert to int
  wire [63:0] conv_int_out_dp, conv_int_out_sp, conv_int_out64, conv_int_out32;
  wire [`FPU_EXC_WIDTH-1:0] exc_conv_int_sp, exc_conv_int_dp, exc_conv;
  wire [1:0] conv_int_type = r_cmd == `FPU_CMD_TRUNC_W  ? `type_int32
                           : r_cmd == `FPU_CMD_TRUNCU_W ? `type_uint32
                           : r_cmd == `FPU_CMD_TRUNC_L  ? `type_int64
                           : r_cmd == `FPU_CMD_TRUNCU_L ? `type_uint64
                           : 2'bx;

  recodedFloat32ToAny conv_int_sp
  (
    .in(r_in0[`SP_REC_WIDTH-1:0]),
    .roundingMode(r_rm[1:0]), // RMM isn't supported
    .typeOp(conv_int_type),
    .out(conv_int_out_sp),
    .exceptionFlags(exc_conv_int_sp)
  );

  recodedFloat64ToAny conv_int_dp
  (
    .in(r_in0),
    .roundingMode(r_rm[1:0]), // RMM isn't supported
    .typeOp(conv_int_type),
    .out(conv_int_out_dp),
    .exceptionFlags(exc_conv_int_dp)
  );
  assign conv_int_out64
    = r_precision == `PRECISION_S ? conv_int_out_sp : conv_int_out_dp;
  assign conv_int_out32 = {{32{conv_int_out64[31]}},conv_int_out64[31:0]};
  assign exc_conv
    = r_precision == `PRECISION_S ? exc_conv_int_sp : exc_conv_int_dp;

  reg [`FPU_EXC_WIDTH+`FPR_WIDTH-1:0] r_out[`FPU_PIPE_DEPTH_FLOAT_INT-1:0];
  reg [`FPU_PIPE_DEPTH_FLOAT_INT-1:0] r_toint_val;
  reg [`FPRID_WIDTH-1:0] r_toint_rd[`FPU_PIPE_DEPTH_FLOAT_INT-1:0];
  always @(*) r_out[0] = r_cmd == `FPU_CMD_MF       ? {exc_none, unrec_out}
                       : r_cmd == `FPU_CMD_MFFSR    ? {exc_none, fsr_out}
                       : r_cmd == `FPU_CMD_MTFSR    ? {exc_none, fsr_out}
                       : r_cmd == `FPU_CMD_C_EQ     ? {exc_cmp,  cmp_out}
                       : r_cmd == `FPU_CMD_C_LE     ? {exc_cmp,  cmp_out}
                       : r_cmd == `FPU_CMD_C_LT     ? {exc_cmp,  cmp_out}
                       : r_cmd == `FPU_CMD_TRUNC_W  ? {exc_conv, conv_int_out32}
                       : r_cmd == `FPU_CMD_TRUNCU_W ? {exc_conv, conv_int_out32}
                       : r_cmd == `FPU_CMD_TRUNC_L  ? {exc_conv, conv_int_out64}
                       : r_cmd == `FPU_CMD_TRUNCU_L ? {exc_conv, conv_int_out64}
                       : {`FPU_EXC_WIDTH+`FPR_WIDTH{1'bx}};

  integer i;
  always @(posedge clk)
  begin
    if(in_toint_val)
    begin
      r_precision <= in_precision;
      r_in0 <= in0;
      r_in1 <= in1;
      r_toint_rd[0] <= in_toint_rd;
      r_cmd <= in_toint_cmd;
      r_rm <= in_toint_rm;
      r_fsr <= in_fsr;
    end

    for(i = 1; i < `FPU_PIPE_DEPTH_FLOAT_INT; i=i+1)
      r_toint_rd[i] <= r_toint_rd[i-1];

    r_toint_val <= reset ? {`FPU_PIPE_DEPTH_FLOAT_INT{1'b0}}
                 : {r_toint_val[`FPU_PIPE_DEPTH_FLOAT_INT-2:0], in_toint_val};
  end

  always @(posedge clk) // retime me
    for(i = 1; i < `FPU_PIPE_DEPTH_FLOAT_INT; i=i+1)
      r_out[i] <= r_out[i-1];

  assign toint_val = r_toint_val[`FPU_PIPE_DEPTH_FLOAT_INT-1];
  assign toint_rd = r_toint_rd[`FPU_PIPE_DEPTH_FLOAT_INT-1];
  assign {toint_exc, toint_data} = r_out[`FPU_PIPE_DEPTH_FLOAT_INT-1];

endmodule

module fp_store_unit
(
  input  wire clk,
  input  wire reset,

  input  wire                      in_val,
  input  wire                      in_precision,
  input  wire [`FPR_REC_WIDTH-1:0] in,

  output wire                      out_val,
  output wire [`FPR_WIDTH-1:0]     out_data
);

  reg r_precision;
  reg r_val;
  reg [`FPR_REC_WIDTH-1:0] r_in;

  // un-recode
  wire [63:0] unrec_dp, unrec_out;
  wire [31:0] unrec_sp;
  recodedFloatNToFloatN #( 8,24) rec_sp (r_in[`SP_REC_WIDTH-1:0], unrec_sp);
  recodedFloatNToFloatN #(11,53) rec_dp (r_in, unrec_dp);
  assign unrec_out
    = r_precision == `PRECISION_S ? {{32{unrec_sp[31]}}, unrec_sp} : unrec_dp;

  integer i;
  always @(posedge clk)
  begin
    if(in_val)
    begin
      r_precision <= in_precision;
      r_in <= in;
    end

    if(reset)
      r_val <= 1'b0;
    else
      r_val <= in_val;
  end

  assign out_val = r_val;
  assign out_data = unrec_out;

endmodule

module fp_fromint_unit
(
  input  wire clk,
  input  wire reset,

  input  wire                      val,
  input  wire [`FPU_CMD_WIDTH-1:0] cmd,
  input  wire [`FPU_RM_WIDTH-1:0]  rm,
  input  wire [`FPR_WIDTH-1:0]     data,
  input  wire                      precision,

  output wire [`FPR_REC_WIDTH-1:0] out,
  output wire [`FPU_EXC_WIDTH-1:0] exc
);

  reg [`FPU_CMD_WIDTH-1:0] r_cmd;
  reg [`FPR_WIDTH-1:0] r_data;
  reg [`FPU_RM_WIDTH-1:0] r_rm;
  reg r_precision;

  always @(posedge clk)
  begin
    if(val)
    begin
      r_cmd <= cmd;
      r_data <= data;
      r_rm <= rm;
      r_precision <= precision;
    end
  end

  wire [`FPR_REC_WIDTH-1:0] conv_int_out_dp, recode_out_dp, out_dp, units_out;
  wire [`SP_REC_WIDTH-1:0]  conv_int_out_sp, recode_out_sp, out_sp;

  wire [1:0] conv_int_type = r_cmd == `FPU_CMD_CVT_W  ? `type_int32
                           : r_cmd == `FPU_CMD_CVTU_W ? `type_uint32
                           : r_cmd == `FPU_CMD_CVT_L  ? `type_int64
                           : r_cmd == `FPU_CMD_CVTU_L ? `type_uint64
                           : 2'bx;
  wire [`FPU_EXC_WIDTH-1:0] exc_conv, exc_conv_int_sp, exc_conv_int_dp;
  assign exc_conv
    = r_precision == `PRECISION_S ? exc_conv_int_sp : exc_conv_int_dp;

  anyToRecodedFloat32 conv_int_sp
  (
    .in(r_data),
    .roundingMode(r_rm[1:0]), // RMM isn't supported
    .typeOp(conv_int_type),
    .out(conv_int_out_sp),
    .exceptionFlags(exc_conv_int_sp)
  );

  anyToRecodedFloat64 conv_int_dp
  (
    .in(r_data),
    .roundingMode(r_rm[1:0]), // RMM isn't supported
    .typeOp(conv_int_type),
    .out(conv_int_out_dp),
    .exceptionFlags(exc_conv_int_dp)
  );

  floatNToRecodedFloatN #( 8,24) rec_sp (r_data[31:0], recode_out_sp);
  floatNToRecodedFloatN #(11,53) rec_dp (r_data,       recode_out_dp);
  wire [`FPU_EXC_WIDTH-1:0] exc_none = {`FPU_EXC_WIDTH{1'b0}};

  assign out_dp = r_cmd == `FPU_CMD_MT ? recode_out_dp : conv_int_out_dp;
  assign out_sp = r_cmd == `FPU_CMD_MT ? recode_out_sp : conv_int_out_sp;
  assign units_out = r_precision == `PRECISION_S ? {32'hFFFFFFFF, out_sp} : out_dp;
  wire [`FPU_EXC_WIDTH-1:0] units_exc = r_cmd == `FPU_CMD_MT ? exc_none : exc_conv;

  integer i;
  reg [`FPU_EXC_WIDTH+`FPR_REC_WIDTH-1:0] r_out [`FPU_PIPE_DEPTH_INT_FLOAT-1:0];
  always @(*) r_out[0] = {units_exc, units_out};

  always @(posedge clk) // retime me
    for(i = 1; i < `FPU_PIPE_DEPTH_INT_FLOAT; i=i+1)
      r_out[i] <= r_out[i-1];

  assign {exc, out} = r_out[`FPU_PIPE_DEPTH_INT_FLOAT-1];

endmodule

module fp_fsr
(
  input  wire                      clk,
  input  wire                      reset,

  input  wire                      fsr_wen,
  input  wire [`FSR_WIDTH-1:0]     fsr_wdata,

  input  wire                      fsr_exc_wen1,
  input  wire [`FPU_EXC_WIDTH-1:0] fsr_exc_wdata1,

  input  wire                      fsr_exc_wen2,
  input  wire [`FPU_EXC_WIDTH-1:0] fsr_exc_wdata2,

  output wire [`FSR_WIDTH-1:0]     fsr
);

  wire write_exc, write_rm;
  wire [`FPU_RM_WIDTH-1:0] new_rm;
  wire [`FPU_EXC_WIDTH-1:0] new_exc;
  reg [`FPU_RM_WIDTH-1:0] rm;
  reg [`FPU_EXC_WIDTH-1:0] exc;

  assign new_exc = fsr_wen ? fsr_wdata[`FSR_EXC]
                 : ({`FPU_EXC_WIDTH{fsr_exc_wen2}} & fsr_exc_wdata2 |
                    {`FPU_EXC_WIDTH{fsr_exc_wen1}} & fsr_exc_wdata1 |
                    fsr[`FSR_EXC]);
  assign write_exc = fsr_wen | fsr_exc_wen2 | fsr_exc_wen1;

  assign new_rm = fsr_wdata[`FSR_RM];
  assign write_rm = fsr_wen;

  always @(posedge clk)
  begin
    if(reset)
    begin
      rm <= {`FPU_RM_WIDTH{1'b0}};
      exc <= {`FPU_EXC_WIDTH{1'b0}};
    end
    else
    begin
      if(write_exc)
        exc <= new_exc;

      if(write_rm)
        rm <= new_rm;
    end
  end

  assign fsr[`FSR_EXC] = exc;
  assign fsr[`FSR_RM] = rm;

endmodule

module fp_move_unit
(
  input  wire clk,
  input  wire reset,

  input  wire                      val,
  input  wire [`FPU_CMD_WIDTH-1:0] cmd,
  input  wire [`FPR_REC_WIDTH-1:0] in0,
  input  wire [`FPR_REC_WIDTH-1:0] in1,
  input  wire                      precision,

  output wire [`FPR_REC_WIDTH-1:0] out,
  output wire [`FPU_EXC_WIDTH-1:0] exc
);

  reg [`FPU_CMD_WIDTH-1:0] r_cmd;
  reg [`FPR_REC_WIDTH-1:0] r_in0, r_in1;
  reg r_precision;

  always @(posedge clk)
  begin
    if(val)
    begin
      r_cmd <= cmd;
      r_in0 <= in0;
      r_in1 <= in1;
      r_precision <= precision;
    end
  end

  wire [`FPU_EXC_WIDTH-1:0] exc_s2d, exc_sgnj;
  wire [`FPR_REC_WIDTH-1:0] out_s2d, out_sgnj;

  // for sign injection, pass through all bits of in0 except the sign bit
  // for appropriate format.  the sign bit is computed based upon the cmd.
  assign out_sgnj[`FPR_REC_WIDTH-2:`SP_REC_WIDTH]
    = r_in0[`FPR_REC_WIDTH-2:`SP_REC_WIDTH];
  assign out_sgnj[`SP_REC_WIDTH-2:0] = r_in0[`SP_REC_WIDTH-2:0];
  assign out_sgnj[`FPR_REC_WIDTH-1]
    = r_precision == `PRECISION_S ?  r_in0[`FPR_REC_WIDTH-1]
    : r_cmd == `FPU_CMD_SGNINJ    ?  r_in1[`FPR_REC_WIDTH-1]
    : r_cmd == `FPU_CMD_SGNINJN   ? ~r_in1[`FPR_REC_WIDTH-1]
    : r_cmd == `FPU_CMD_SGNMUL    ?  r_in0[`FPR_REC_WIDTH-1]^r_in1[`FPR_REC_WIDTH-1]
    : 1'bx;
  assign out_sgnj[`SP_REC_WIDTH-1]
    = r_precision == `PRECISION_D ?  r_in0[`SP_REC_WIDTH-1]
    : r_cmd == `FPU_CMD_SGNINJ    ?  r_in1[`SP_REC_WIDTH-1]
    : r_cmd == `FPU_CMD_SGNINJN   ? ~r_in1[`SP_REC_WIDTH-1]
    : r_cmd == `FPU_CMD_SGNMUL    ?  r_in0[`SP_REC_WIDTH-1]^r_in1[`SP_REC_WIDTH-1]
    : 1'bx;
  assign exc_sgnj = {`FPU_EXC_WIDTH{1'b0}};
  
  recodedFloat32ToRecodedFloat64 conv_s2d
  (
    .in(r_in0[`SP_REC_WIDTH-1:0]),
    .out(out_s2d),
    .exceptionFlags(exc_s2d)
  );

  // min/max.  this might not fit in one clock, in which case it should
  // be made into an independent pipeline.  also, we should share the
  // comparator with the toint unit.
  wire [`FPU_EXC_WIDTH-1:0] exc_cmp_sp, exc_cmp_dp;
  wire cmp_less_sp, cmp_less_dp;
  compareRecodedFloatN #( 8,24) cmp_sp
  (
    .a(r_in0[`SP_REC_WIDTH-1:0]),
    .b(r_in1[`SP_REC_WIDTH-1:0]),
    .less(cmp_less_sp),
    .equal(),
    .unordered(),
    .exceptionFlags(exc_cmp_sp)
  );
  compareRecodedFloatN #(11,53) cmp_dp
  (
    .a(r_in0),
    .b(r_in1),
    .less(cmp_less_dp),
    .equal(),
    .unordered(),
    .exceptionFlags(exc_cmp_dp)
  );
  wire aNaN = r_precision == `PRECISION_S
    ? (r_in0[`SP_REC_WIDTH-2:`SP_REC_WIDTH-4] == 3'b111)
    : (r_in0[`FPR_REC_WIDTH-2:`FPR_REC_WIDTH-4] == 3'b111);
  wire bNaN = r_precision == `PRECISION_S
    ? (r_in1[`SP_REC_WIDTH-2:`SP_REC_WIDTH-4] == 3'b111)
    : (r_in1[`FPR_REC_WIDTH-2:`FPR_REC_WIDTH-4] == 3'b111);
  wire cmp_less = r_precision == `PRECISION_S ? cmp_less_sp : cmp_less_dp;
  wire [`FPU_EXC_WIDTH-1:0] exc_cmp
    = r_precision == `PRECISION_S ? exc_cmp_sp : exc_cmp_dp;
  wire want_min = r_cmd == `FPU_CMD_MIN ? 1'b1
                : r_cmd == `FPU_CMD_MAX ? 1'b0
                : 1'bx;
  wire [`FPR_REC_WIDTH-1:0] out_cmp
    = bNaN || ~aNaN && want_min == cmp_less ? r_in0 : r_in1;

  reg [`FPU_EXC_WIDTH+`FPR_REC_WIDTH-1:0] r_out[`FPU_PIPE_DEPTH_MOVE-1:0];
  always @(*) r_out[0] = r_cmd == `FPU_CMD_CVT_S   ? {exc_s2d,  out_s2d}
                       : r_cmd == `FPU_CMD_SGNINJ  ? {exc_sgnj, out_sgnj}
                       : r_cmd == `FPU_CMD_SGNINJN ? {exc_sgnj, out_sgnj}
                       : r_cmd == `FPU_CMD_SGNMUL  ? {exc_sgnj, out_sgnj}
                       : r_cmd == `FPU_CMD_MIN     ? {exc_cmp,  out_cmp}
                       : r_cmd == `FPU_CMD_MAX     ? {exc_cmp,  out_cmp}
                       : {`FPU_EXC_WIDTH+`FPR_REC_WIDTH{1'bx}};

  integer i;
  always @(posedge clk) // retime me
    for(i = 1; i < `FPU_PIPE_DEPTH_MOVE; i=i+1)
      r_out[i] <= r_out[i-1];

  assign {exc, out} = r_out[`FPU_PIPE_DEPTH_MOVE-1];

endmodule

module fp_cvtsd_unit
(
  input  wire clk,
  input  wire reset,

  input  wire                      val,
  input  wire [`FPU_RM_WIDTH-1:0]  rm,
  input  wire [`FPR_REC_WIDTH-1:0] in0,

  output wire [`FPR_REC_WIDTH-1:0] out,
  output wire [`FPU_EXC_WIDTH-1:0] exc
);

  reg [`FPR_REC_WIDTH-1:0] r_in0;
  reg [`FPU_RM_WIDTH-1:0] r_rm;

  always @(posedge clk)
  begin
    if(val)
    begin
      r_in0 <= in0;
      r_rm <= rm;
    end
  end

  wire [`FPU_EXC_WIDTH-1:0] exc_d2s;
  wire [`FPR_REC_WIDTH-1:0] out_d2s;
  assign out_d2s[`FPR_REC_WIDTH-1:`SP_REC_WIDTH] = 32'hFFFFFFFF;

  recodedFloat64ToRecodedFloat32 conv_d2s
  (
    .in(r_in0),
    .roundingMode(r_rm[1:0]), // RMM isn't supported
    .out(out_d2s[`SP_REC_WIDTH-1:0]),
    .exceptionFlags(exc_d2s)
  );

  reg [`FPU_EXC_WIDTH+`FPR_REC_WIDTH-1:0] r_out[`FPU_PIPE_DEPTH_CVT_S_D-1:0];
  always @(*) r_out[0] = {exc_d2s, out_d2s};

  integer i;
  always @(posedge clk) // retime me
    for(i = 1; i < `FPU_PIPE_DEPTH_CVT_S_D; i=i+1)
      r_out[i] <= r_out[i-1];

  assign {exc, out} = r_out[`FPU_PIPE_DEPTH_CVT_S_D-1];

endmodule
