library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.test_utils.all;
use work.defines.all;
use work.alu_defines.all;

entity tb_instruction_decode is
end tb_instruction_decode;

architecture behavior of tb_instruction_decode is 
  
  signal instruction_in: instruction_t;
  signal operand_rt_out: register_address_t;
  signal operand_rs_out: register_address_t;
  signal operand_rd_out: register_address_t;
  signal shamt_out: std_logic_vector(ALU_SHAMT_WIDTH -1 downto 0);
  signal immediate_operand_out:  immediate_value_t;
  signal mask_enable_out: std_logic;
  signal register_write_enable_out: std_logic;
  signal alu_funct_out: alu_funct_t;
  signal lsu_load_enable_out: std_logic;
  signal lsu_write_enable_out: std_logic;
  signal thread_done_out: std_logic;
  signal constant_write_enable_out: std_logic;
  
  function make_r_instruction(mask: std_logic_vector ;op: std_logic_vector; rs: std_logic_vector;  rt: std_logic_vector; rd: std_logic_vector; sh: std_logic_vector; funct: std_logic_vector) return instruction_t is
   begin
    -- "0" is mask
    return mask & op & rs & rt & rd & sh & funct;
  end;
  
  function make_i_instruction(mask: std_logic_vector ;op: std_logic_vector; rs: std_logic_vector;  rd: std_logic_vector; imm: std_logic_vector) return instruction_t is
   begin
    -- "0" is mask
    return mask & op & rs & rd & imm;
  end;
  

begin

  -- component instantiation
      uut: entity work.instruction_decode port map(
            instruction_in => instruction_in,
            operand_rt_out => operand_rt_out,
            operand_rs_out => operand_rs_out,
            operand_rd_out => operand_rd_out,
            alu_shamt_out => shamt_out,
            immediate_operand_out => immediate_operand_out,
            mask_enable_out => mask_enable_out,
            register_write_enable_out => register_write_enable_out,
            alu_funct_out => alu_funct_out,
            lsu_load_enable_out => lsu_load_enable_out,
            lsu_write_enable_out => lsu_write_enable_out,
            thread_done_out => thread_done_out,
            constant_write_enable_out => constant_write_enable_out
      );

  --  test bench statements
       tb : process
        procedure assert_r_type_decode(mask: std_logic_vector(0 downto 0); op: std_logic_vector(4 downto 0); rs: std_logic_vector(4 downto 0);  rt: std_logic_vector(4 downto 0); rd: std_logic_vector(4 downto 0); sh: std_logic_vector(4 downto 0); funct: std_logic_vector(5 downto 0)) is
         begin
          instruction_in <= make_r_instruction(mask, op, rs, rt, rd, sh ,funct);
          wait for 1 ns;
          assert_equals(mask(0), mask_enable_out, "Testing r type mask bit decode/control signal");
          assert_equals(rs(REGISTER_COUNT_BIT_WIDTH -1 downto 0), operand_rs_out(REGISTER_COUNT_BIT_WIDTH -1 downto 0), "Testing r type rs decode");
          assert_equals(rt(REGISTER_COUNT_BIT_WIDTH -1 downto 0), operand_rt_out(REGISTER_COUNT_BIT_WIDTH -1 downto 0), "Testing r type rt decode");
          assert_equals(rd(REGISTER_COUNT_BIT_WIDTH -1 downto 0), operand_rd_out(REGISTER_COUNT_BIT_WIDTH -1 downto 0), "Testing r type rd decode");
          assert_equals(  sh(ALU_SHAMT_WIDTH -1 downto 0), shamt_out(ALU_SHAMT_WIDTH -1 downto 0), "Testing r type shamt decode");
          assert_equals(funct(ALU_FUNCT_WIDTH -1 downto 0), alu_funct_out(ALU_FUNCT_WIDTH -1 downto 0), "Testing r type alu_funct decode");
        end procedure assert_r_type_decode;
        
        procedure assert_i_type_decode(mask: std_logic_vector(0 downto 0); op:std_logic_vector(4 downto 0); rs: std_logic_vector(4 downto 0); rd: std_logic_vector(4 downto 0); imm: std_logic_vector(15 downto 0)) is
         begin
          instruction_in <= make_i_instruction(mask, op, rs, rd, imm);
          wait for 1 ns;
          assert_equals(mask(0), mask_enable_out, "Testing i type mask bit decode/control signal");
          assert_equals(rs(REGISTER_COUNT_BIT_WIDTH -1 downto 0), operand_rs_out(REGISTER_COUNT_BIT_WIDTH -1 downto 0), "Testing i type rs decode");
          assert_equals(rd(REGISTER_COUNT_BIT_WIDTH -1 downto 0), operand_rd_out(REGISTER_COUNT_BIT_WIDTH -1 downto 0), "Testing i type rd decode");
          assert_equals(imm(INSTRUCTION_DECODE_IMMEDIATE_BIT_WIDTH -1 downto 0), immediate_operand_out(INSTRUCTION_DECODE_IMMEDIATE_BIT_WIDTH  -1 downto 0), "Testing i type imm decode");
        end procedure assert_i_type_decode;
          begin
           -- Test r_type decode
           assert_r_type_decode("1", R_TYPE_OPCODE, "01010", "00101", "00001", "00010", "000110");
           assert_r_type_decode("0", R_TYPE_OPCODE, "01010", "11101", "01001", "00011", "000111");
           assert_r_type_decode("1", R_TYPE_OPCODE, "11111", "00000", "11111", "00000", "111111");
           -- Test i_type decode
           assert_i_type_decode("0","01010", "01010", "00101","0000001001101000");
           assert_i_type_decode("1","01110", "00010", "10111","0011011001101101");
           assert_i_type_decode("1","11111", "00000", "11111","1111111111100000"); 
           
           
         -- register_write_enable_out: out std_logic;
         -- lsu_load_enable_out: out std_logic;
         -- lsu_write_enable_out: out std_logic;
         -- thread_done_out: out std_logic
         -- Assert controll signals
         -- R type first. 
         instruction_in <= make_r_instruction("1", R_TYPE_OPCODE, "01010", "00101", "00001", "00010", "000110");
         wait for 1 ns;
         assert_equals('1', register_write_enable_out, "register_write_enable_out should be high on r_type instructions.");
         assert_equals('0', lsu_load_enable_out, "lsu_load_enable_out should be low on r_type instructions.");
         assert_equals('0', lsu_write_enable_out, "lsu_write_enable_out should be low on r_type instructions.");
         assert_equals('0', thread_done_out, "thread_done_out should be low on dead instructions.");   
         assert_equals('0', constant_write_enable_out, "constant_write_enable_out should be low on constant load instructions.");
         report "Passed R type" severity note;
         -- Test load
         instruction_in <= "0" & LW_OPCODE & "00000000000000000000000000";
         wait for 1 ns;
         assert_equals('1', lsu_load_enable_out, "lsu_load_enable_out should be high on loads.");
         assert_equals('0', register_write_enable_out, "register_write_enable_out should be low on r_type instructions.");
         assert_equals('0', lsu_write_enable_out, "lsu_write_enable_out should be low on r_type instructions.");
         assert_equals('0', thread_done_out, "thread_done_out should be low on dead instructions.");   
         assert_equals('0', constant_write_enable_out, "constant_write_enable_out should be low on constant load instructions.");
         report "Passed LW" severity note;
         -- Test store
         instruction_in <= "1" & SW_OPCODE & "00000000000000000000000000";
         wait for 1 ns;
         assert_equals('1', lsu_write_enable_out, "lsu_write_enable_out should be high on stores.");
         assert_equals('0', lsu_load_enable_out, "lsu_load_enable_out should be low on loads.");
         assert_equals('0', register_write_enable_out, "register_write_enable_out should be low on r_type instructions.");
         assert_equals('0', thread_done_out, "thread_done_out should be low on dead instructions.");    
         assert_equals('0', constant_write_enable_out, "constant_write_enable_out should be low on constant load instructions."); 
         report "Passed SW" severity note;
         -- Test dead/sync thingy.
         instruction_in <="1" & THREAD_FINISHED_OPCODE & "10000000000000000000000000";
         wait for 1 ns;
         assert_equals('1', thread_done_out, "thread_done_out should be high on dead instructions.");
         assert_equals('0', lsu_load_enable_out, "lsu_load_enable_out should be low on loads.");
         assert_equals('0', register_write_enable_out, "register_write_enable_out should be low on r_type instructions.");
         assert_equals('0', lsu_write_enable_out, "lsu_write_enable_out should be low on r_type instructions.");
         assert_equals('0', constant_write_enable_out, "constant_write_enable_out should be low on constant load instructions.");
         report "Passed thread finished" severity note;
         -- Test load constant.
         instruction_in <= "1" & LOAD_CONSTANT_OPCODE & "00000000000000000000000000";
         wait for 1 ns;
         assert_equals('1', constant_write_enable_out, "constant_write_enable_out should be high on constant load instructions.");
         assert_equals('0', lsu_load_enable_out, "lsu_load_enable_out should be low on loads.");
         assert_equals('1', register_write_enable_out, "register_write_enable_out should be low on r_type instructions.");
         assert_equals('0', lsu_write_enable_out, "lsu_write_enable_out should be low on r_type instructions.");
         assert_equals('0', thread_done_out, "thread_done_out should be low on dead instructions.");   
         report "Passed load constant" severity note;
         wait;
       end process tb;
  --  end test bench 

  end;
