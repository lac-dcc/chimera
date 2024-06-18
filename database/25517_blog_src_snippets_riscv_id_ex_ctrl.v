// This program was cloned from: https://github.com/suda-morris/blog
// License: GNU General Public License v3.0

module id_ex_ctrl (
  input        clk,
  input        reset,
  input        in_ex_ctrl_itype,
  input  [1:0] in_ex_ctrl_alu_ctrlop,
  input  [1:0] in_ex_ctrl_result_sel,
  input        in_ex_ctrl_alu_src,
  input        in_ex_ctrl_pc_add,
  input        in_ex_ctrl_branch,
  input  [1:0] in_ex_ctrl_jump,
  input        in_mem_ctrl_mem_read,
  input        in_mem_ctrl_mem_write,
  input  [1:0] in_mem_ctrl_mask_mode,
  input        in_mem_ctrl_sext,
  input        in_wb_ctrl_to_reg,
  input        in_wb_ctrl_reg_write,
  input        in_noflush,
  input        flush,
  input        valid,
  output       out_ex_ctrl_itype,
  output [1:0] out_ex_ctrl_alu_ctrlop,
  output [1:0] out_ex_ctrl_result_sel,
  output       out_ex_ctrl_alu_src,
  output       out_ex_ctrl_pc_add,
  output       out_ex_ctrl_branch,
  output [1:0] out_ex_ctrl_jump,
  output       out_mem_ctrl_mem_read,
  output       out_mem_ctrl_mem_write,
  output [1:0] out_mem_ctrl_mask_mode,
  output       out_mem_ctrl_sext,
  output       out_wb_ctrl_to_reg,
  output       out_wb_ctrl_reg_write,
  output       out_noflush
);

  reg  reg_ex_ctrl_itype;
  reg [1:0] reg_ex_ctrl_alu_ctrlop;
  reg [1:0] reg_ex_ctrl_result_sel;
  reg  reg_ex_ctrl_alu_src;
  reg  reg_ex_ctrl_pc_add;
  reg  reg_ex_ctrl_branch;
  reg [1:0] reg_ex_ctrl_jump;
  reg  reg_mem_ctrl_mem_read;
  reg  reg_mem_ctrl_mem_write;
  reg [1:0] reg_mem_ctrl_mask_mode;
  reg  reg_mem_ctrl_sext;
  reg  reg_wb_ctrl_to_reg;
  reg  reg_wb_ctrl_reg_write;
  reg  reg_noflush;

  assign out_ex_ctrl_itype = reg_ex_ctrl_itype;
  assign out_ex_ctrl_alu_ctrlop = reg_ex_ctrl_alu_ctrlop;
  assign out_ex_ctrl_result_sel = reg_ex_ctrl_result_sel;
  assign out_ex_ctrl_alu_src = reg_ex_ctrl_alu_src;
  assign out_ex_ctrl_pc_add = reg_ex_ctrl_pc_add;
  assign out_ex_ctrl_branch = reg_ex_ctrl_branch;
  assign out_ex_ctrl_jump = reg_ex_ctrl_jump;
  assign out_mem_ctrl_mem_read = reg_mem_ctrl_mem_read;
  assign out_mem_ctrl_mem_write = reg_mem_ctrl_mem_write;
  assign out_mem_ctrl_mask_mode = reg_mem_ctrl_mask_mode;
  assign out_mem_ctrl_sext = reg_mem_ctrl_sext;
  assign out_wb_ctrl_to_reg = reg_wb_ctrl_to_reg;
  assign out_wb_ctrl_reg_write = reg_wb_ctrl_reg_write;
  assign out_noflush = reg_noflush;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_itype <= 1'h0;
    end else if (flush) begin
      reg_ex_ctrl_itype <= 1'h0;
    end else if (valid) begin
      reg_ex_ctrl_itype <= in_ex_ctrl_itype;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_alu_ctrlop <= 2'h0;
    end else if (flush) begin
      reg_ex_ctrl_alu_ctrlop <= 2'h0;
    end else if (valid) begin
      reg_ex_ctrl_alu_ctrlop <= in_ex_ctrl_alu_ctrlop;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_result_sel <= 2'h0;
    end else if (flush) begin
      reg_ex_ctrl_result_sel <= 2'h0;
    end else if (valid) begin
      reg_ex_ctrl_result_sel <= in_ex_ctrl_result_sel;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_alu_src <= 1'h0;
    end else if (flush) begin
      reg_ex_ctrl_alu_src <= 1'h0;
    end else if (valid) begin
      reg_ex_ctrl_alu_src <= in_ex_ctrl_alu_src;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_pc_add <= 1'h0;
    end else if (flush) begin
      reg_ex_ctrl_pc_add <= 1'h0;
    end else if (valid) begin
      reg_ex_ctrl_pc_add <= in_ex_ctrl_pc_add;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_branch <= 1'h0;
    end else if (flush) begin
      reg_ex_ctrl_branch <= 1'h0;
    end else if (valid) begin
      reg_ex_ctrl_branch <= in_ex_ctrl_branch;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_ex_ctrl_jump <= 2'h0;
    end else if (flush) begin
      reg_ex_ctrl_jump <= 2'h0;
    end else if (valid) begin
      reg_ex_ctrl_jump <= in_ex_ctrl_jump;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_mem_ctrl_mem_read <= 1'h0;
    end else if (flush) begin
      reg_mem_ctrl_mem_read <= 1'h0;
    end else if (valid) begin
      reg_mem_ctrl_mem_read <= in_mem_ctrl_mem_read;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_mem_ctrl_mem_write <= 1'h0;
    end else if (flush) begin
      reg_mem_ctrl_mem_write <= 1'h0;
    end else if (valid) begin
      reg_mem_ctrl_mem_write <= in_mem_ctrl_mem_write;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_mem_ctrl_mask_mode <= 2'h0;
    end else if (flush) begin
      reg_mem_ctrl_mask_mode <= 2'h0;
    end else if (valid) begin
      reg_mem_ctrl_mask_mode <= in_mem_ctrl_mask_mode;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_mem_ctrl_sext <= 1'h0;
    end else if (flush) begin
      reg_mem_ctrl_sext <= 1'h0;
    end else if (valid) begin
      reg_mem_ctrl_sext <= in_mem_ctrl_sext;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_wb_ctrl_to_reg <= 1'h0;
    end else if (flush) begin
      reg_wb_ctrl_to_reg <= 1'h0;
    end else if (valid) begin
      reg_wb_ctrl_to_reg <= in_wb_ctrl_to_reg;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_wb_ctrl_reg_write <= 1'h0;
    end else if (flush) begin
      reg_wb_ctrl_reg_write <= 1'h0;
    end else if (valid) begin
      reg_wb_ctrl_reg_write <= in_wb_ctrl_reg_write;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg_noflush <= 1'h0;
    end else if (flush) begin
      reg_noflush <= 1'h0;
    end else if (valid) begin
      reg_noflush <= in_noflush;
    end
  end


endmodule
