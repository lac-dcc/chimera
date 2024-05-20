// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module ForwardingUnit (
    EX_Mem_rd,
    EX_Mem_reg_write_en,
    Mem_WB_reg_write_en,
    ID_EX_rs,
    ID_EX_rt,
    ID_EX_reg_dest,
    IF_ID_rs,
    IF_ID_rt,
    Mem_WB_rd,
    forward_a,
    forward_b,
    forward_r1_eq,
    forward_r2_eq
);

  input EX_Mem_reg_write_en, Mem_WB_reg_write_en;
  input [4:0] EX_Mem_rd, ID_EX_rs, ID_EX_rt, ID_EX_reg_dest, IF_ID_rs, IF_ID_rt, Mem_WB_rd;

  output reg [1:0] forward_a, forward_b;
  output reg forward_r1_eq, forward_r2_eq;

  wire second_forward_a, third_forward_a;
  wire second_forward_b, third_forward_b;

  assign second_forward_a = (Mem_WB_reg_write_en == 1) & (Mem_WB_rd == ID_EX_rs) & (EX_Mem_rd != 0);
  assign third_forward_a = (EX_Mem_reg_write_en == 1) & (EX_Mem_rd == ID_EX_rs) & (EX_Mem_rd != 0) & ~second_forward_a;

  assign second_forward_b = (Mem_WB_reg_write_en == 1) & (Mem_WB_rd == ID_EX_rt) & (EX_Mem_rd != 0);
  assign third_forward_b = (EX_Mem_reg_write_en == 1) & (EX_Mem_rd == ID_EX_rt) & (EX_Mem_rd != 0) & ~second_forward_b;

  always @(EX_Mem_reg_write_en,
            Mem_WB_reg_write_en,
            EX_Mem_rd, ID_EX_rs,
            ID_EX_rt,
            ID_EX_reg_dest,
            IF_ID_rs,
            IF_ID_rt,
            Mem_WB_rd) begin

    forward_a = 2'd0;
    forward_b = 2'd0;
    forward_r1_eq = 1'b0;
    forward_r2_eq = 1'b0;

    if (third_forward_a) forward_a = 2'd1;
    else if (second_forward_a) forward_a = 2'd2;

    if (third_forward_b) forward_b = 2'd1;
    else if (second_forward_b) forward_b = 2'd2;

    if (ID_EX_reg_dest == IF_ID_rs) forward_r1_eq = 1'b1;
    if (ID_EX_reg_dest == IF_ID_rt) forward_r2_eq = 1'b1;

  end

endmodule
