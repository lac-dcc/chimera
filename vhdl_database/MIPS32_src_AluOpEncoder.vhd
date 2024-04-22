library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Common.all;

entity AluOpEncoder is
  port (
    -- Interface --
    op    : in  std_logic_vector(5 downto 0);
    func  : in  std_logic_vector(5 downto 0);
    rt    : in  std_logic_vector(4 downto 0);
    aluop : out AluOpType
    );
end AluOpEncoder;

architecture Behavioral of AluOpEncoder is
  signal special, regimm : AluOpType;
begin
  with func select special <=
    ALU_SLL when func_sll,
    ALU_SRL when func_srl,
    ALU_SRA when func_sra,
    ALU_SLL when func_sllv,
    ALU_SRL when func_srlv,
    ALU_SRA when func_srav,
    ALU_MUL when func_mult,
    ALU_MULU when func_multu,
    ALU_ADD when func_addu,
    ALU_SUB when func_subu,
    ALU_AND when func_and,
    ALU_OR  when func_or,
    ALU_XOR when func_xor,
    ALU_NOR when func_nor,
    ALU_LT  when func_slt,
    ALU_LTU when func_sltu,
    ALU_NOP when others;
  
  with rt select regimm <=
    ALU_LT  when rt_bltz,
    ALU_GEZ when rt_bgez,
    ALU_NOP when others;
  
  with op select aluop <=
    special when op_special,
    regimm  when op_regimm,
    ALU_EQ  when op_beq,
    ALU_NE  when op_bne,
    ALU_LEZ when op_blez,
    ALU_GTZ when op_bgtz,
    ALU_ADD when op_addiu,
    ALU_LT  when op_slti,
    ALU_LTU when op_sltiu,
    ALU_AND when op_andi,
    ALU_OR  when op_ori,
    ALU_XOR when op_xori,
    ALU_SLL when op_lui,
    ALU_ADD when op_lb | op_lw | op_lbu | op_sb | op_sw,
    ALU_NOP when others;

end Behavioral;
