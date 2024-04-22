-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity ALU is -- {{{
port(
  rs_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0); -- level 1.
  rt_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0); -- level 1.
  rd_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0); -- level 1.
  regBlock_re         : in std_logic_vector(N_REG_BLOCKS-1 downto 0); -- level 1.
  family              : in std_logic_vector(FAMILY_W-1 downto 0); -- level 1.

  op_arith_shift      : in op_arith_shift_type; -- level 6.
  code                : in std_logic_vector(CODE_W-1 downto 0); -- level 6.
  immediate           : in std_logic_vector(IMM_W-1 downto 0); -- level 6.

  rd_out              : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 10.
  reg_we_mov          : out std_logic := '0'; -- level 10.
  
  float_a             : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 9.
  float_b             : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 9.
  

  op_logical_v        : in std_logic := '0'; -- level 14.
  res_low             : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 16.
  res_high            : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 16.

  reg_wrData          : in slv32_array(N_REG_BLOCKS-1 downto 0) := (others=>(others=>'0'));  -- level 18.
  reg_wrAddr          : in reg_file_block_array(N_REG_BLOCKS-1 downto 0) := (others=>(others=>'0')); -- level 18.
  reg_we              : in std_logic_vector(N_REG_BLOCKS-1 downto 0) := (others=>'0');  -- level 18.


  clk                 : in std_logic
);
end ALU; -- }}}
architecture Behavioral of ALU is
  -- signals definitions {{{
  type regBlock_re_vec_type is array(natural range <>) of std_logic_vector(N_REG_BLOCKS-1 downto 0);
  signal regBlock_re_vec                  : regBlock_re_vec_type(6 downto 0) := (others=>(others=>'0'));
  -- attribute max_fanout of regBlock_re_vec : signal is 50;
  signal rs_vec, rt_vec, rd_vec           : slv32_array(N_REG_BLOCKS-1 downto 0) := (others=>(others=>'0'));
  signal rs_a, rt_a                       : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal rs_b, rt_b                       : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal a, a_p0, c                       : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal b, b_shifted                     : std_logic_vector(DATA_W downto 0) := (others=>'0');
  signal sra_sign                         : std_logic_vector(DATA_W downto 0) := (others=>'0');
  signal sra_sign_v                       : std_logic := '0';
  signal rs, rt, rd, rt_p0, rt_d0         : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal shift                            : std_logic_vector(5 downto 0) := (others=>'0');
  signal ignore                           : std_logic_vector(47-DATA_W-1 downto 0) := (others=>'0');
  signal sub_op                           : std_logic := '0';
  signal ce                               : std_logic := '0';
  signal res_p0                           : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  type immediate_vec_type is array(natural range <>) of std_logic_vector(IMM_W-1 downto 0);
  signal immediate_vec                    : immediate_vec_type(3 downto 0) := (others=>(others=>'0'));
  type op_arith_shift_vec_type is array(natural range <>) of op_arith_shift_type;
  signal op_arith_shift_vec               : op_arith_shift_vec_type(2 downto 0) := (others => op_add);
  signal rs_addr_vec, rt_addr_vec         : reg_file_block_array(3 downto 0) := (others=>(others=>'0'));
  signal rd_addr_vec                      : reg_file_block_array(3 downto 0) := (others=>(others=>'0'));
  type code_vec_type is array(natural range<>) of std_logic_vector(CODE_W-1 downto 0);
  signal code_vec                         : code_vec_type(2 downto 0) := (others=>(others=>'0'));
  signal res_low_p0                       : std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 8
  signal res_logical                      : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal res_logical_vec                  : SLV32_ARRAY(4 downto 0) := (others=>(others=>'0'));
  signal op_logical_v_d0                  : std_logic := '0';
  signal a_logical, b_logical             : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal instr_is_slt, instr_is_sltu      : std_logic_vector(5 downto 0) := (others=>'0');
  signal sltu_true                        : std_logic := '0';
  signal rt_zero                          : std_logic := '0';
  --}}}
begin
  -- regFiles -------------------------------------------------------------------------------------------{{{
  reg_blocks: for i in 0 to N_REG_BLOCKS-1 generate
  begin
    reg_file: entity regFile port map (
      rs_addr => rs_addr_vec(rs_addr_vec'high-i), -- level i+2.
      rt_addr  => rt_addr_vec(rt_addr_vec'high-i), -- level i+2.
      rd_addr  => rd_addr_vec(rd_addr_vec'high-i), -- level i+2.
      re => regBlock_re_vec(regBlock_re_vec'high)(i), -- level i+2.

      rs => rs_vec(i), -- level i+7.
      rt => rt_vec(i), -- level i+6.
      rd => rd_vec(i), -- level i+8.

      we => reg_we(i), -- level 18.
      wrAddr => reg_wrAddr(i), --  level 18.
      wrData => reg_wrData(i), -- level 18.

      clk => clk
    );
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- logical  -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      res_logical_vec(res_logical_vec'high) <= res_logical; -- @ 11.
      res_logical_vec(res_logical_vec'high-1 downto 0) <= res_logical_vec(res_logical_vec'high downto 1); -- @ 12.->15.
      op_logical_v_d0 <= op_logical_v; -- @ 15.

      a_logical <= rs; --@ 9.
      if code_vec(code_vec'high-1)(0) = '1' then -- level 8.
        b_logical(DATA_W-1 downto IMM_ARITH_W) <= (others=>'0'); -- @ 9.
        b_logical(IMM_ARITH_W-1 downto 0) <= immediate_vec(immediate_vec'high-1)(IMM_ARITH_W-1 downto 0); -- @ 9.
      else
        b_logical <= rt; -- @ 9.
      end if;

      res_logical <= a_logical and b_logical; -- @ 10.
      if code_vec(code_vec'high-2)(1) = '1' then -- level 9.
        res_logical <= a_logical or b_logical; -- @ 10.
      end if;
      if code_vec(code_vec'high-2)(2) = '1' then
        res_logical <= a_logical xor b_logical; -- @ 10.
      end if;
      if code_vec(code_vec'high-2)(3) = '1' then
        res_logical <= a_logical nor b_logical; -- @ 10.
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- output mux -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if op_logical_v_d0 = '0' then -- level 15.
        if instr_is_slt(0) = '1' then -- level 15.
          res_low <= (others=>'0'); 
          res_low(0) <= res_low_p0(res_low_p0'high); -- @ 16.
        elsif instr_is_sltu(0) = '1' then -- level 15.
          res_low <= (others=>'0');
          res_low(0) <= sltu_true; -- @ 16.
        else
          res_low <= res_low_p0; -- @ 16.
        end if;
      else
        res_low <= res_logical_vec(0); -- @ 16.
      end if;
      
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- pipelines & muxes ------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      -- pipes {{{
      rs_addr_vec(rs_addr_vec'high-1 downto 0) <= rs_addr_vec(rs_addr_vec'high downto 1); -- @ 1.->2.
      rs_addr_vec(rs_addr_vec'high) <= rs_addr; -- @ 2.
      rt_addr_vec(rt_addr_vec'high-1 downto 0) <= rt_addr_vec(rt_addr_vec'high downto 1); -- @ 1.->2.
      rt_addr_vec(rt_addr_vec'high) <= rt_addr; -- @ 2.
      rd_addr_vec(rd_addr_vec'high-1 downto 0) <= rd_addr_vec(rd_addr_vec'high downto 1); -- @ 1.->2.
      rd_addr_vec(rd_addr_vec'high) <= rd_addr; -- @ 2.

      op_arith_shift_vec(op_arith_shift_vec'high-1 downto 0) <= op_arith_shift_vec(op_arith_shift_vec'high downto 1); -- @ 8.->9.
      op_arith_shift_vec(op_arith_shift_vec'high) <= op_arith_shift; -- @ 7.
      code_vec(code_vec'high-1 downto 0) <= code_vec(code_vec'high downto 1); -- @ 8.->9.
      code_vec(code_vec'high) <= code; -- @ 7.
      immediate_vec(immediate_vec'high-1 downto 0) <= immediate_vec(immediate_vec'high downto 1);  -- @ 8.->10.
      immediate_vec(immediate_vec'high) <= immediate; -- @ 7
      regBlock_re_vec(regBlock_re_vec'high-1 downto 0) <= regBlock_re_vec(regBlock_re_vec'high downto 1); --@ 3.->8.
      regBlock_re_vec(regBlock_re_vec'high) <= regBlock_re; -- @ 2.
      --}}}
      -- @ 7 {{{
      rt_p0 <= rt_vec(0);  -- @ 7.
      for i in 1 to N_REG_BLOCKS-1 loop
        if regBlock_re_vec(2)(i) = '1' then
          rt_p0 <= rt_vec(i); -- @ i+7.
        end if;
      end loop;
      -- }}}
      -- @ 8 {{{
      rt <= rt_p0; -- @ 8.
      rs <= rs_vec(0); -- @ 8.
      for i in 1 to N_REG_BLOCKS-1 loop
        if regBlock_re_vec(1)(i) = '1' then -- level 7.
          rs <= rs_vec(i);  -- @ i+8.
        end if;
      end loop;
      if code_vec(code_vec'high)(CODE_W-1) = '0' then -- level 7.
        shift(5) <= '0'; -- @ 8.
        if code_vec(code_vec'high)(0) = '0' then -- level 7.
          shift(4 downto 0) <= rt_p0(4 downto 0); -- sll @8.
        else
          shift(4 downto 0) <= immediate_vec(immediate_vec'high)(4 downto 0); --slli -- @ 8.
        end if;
      else
        if code_vec(code_vec'high)(0) = '0' then -- shift right -- level 7
          -- the width of port b of the mutiplier needs to be extended to 33, or the high part to 17 to enable a shift right logical with zero
          shift(5 downto 0) <= std_logic_vector("100000" - resize(unsigned(rt_p0(4 downto 0)), 6)); --srl & sra -- @ 8.
        else
          shift(5 downto 0) <= std_logic_vector("100000" - resize(unsigned(immediate_vec(immediate_vec'high)(4 downto 0)), 6)); -- srli & srai -- @ 8.
        end if;
      end if;
      -- }}}
      -- @ 9 {{{
      float_a <= rs; -- @ 9.
      float_b <= rt; -- @ 9.
      rt_d0 <= rt; -- @ 9.
      rt_zero <= '0'; -- @ 9.
      if rt = (rt'reverse_range=>'0') then -- level 8.
        rt_zero <= '1'; -- @ 9.
      end if;

      b_shifted <= (others=>'0'); -- @ 9.
      b_shifted(to_integer(unsigned(shift))) <= '1'; -- @ 9.
      
      a_p0 <= rs; -- @ 9.
      
      rd <= rd_vec(0); -- @ 9.
      for i in 1 to N_REG_BLOCKS-1 loop
        if regBlock_re_vec(0)(i) = '1' then -- level 8.
          rd <= rd_vec(i);  -- @ i+9.
        end if;
      end loop;

      -- }}}
      -- @ 10 {{{
      rd_out <= rd; -- @ 10.
      a <= a_p0; -- @ 10.
      reg_we_mov <= rt_zero; -- movz, @10.
      if op_arith_shift_vec(0) = op_mov then -- level 9.
        if code_vec(code_vec'high-2)(CODE_W-1) = '0' then -- movn, level 9.
          reg_we_mov <= not rt_zero; -- @ 10.
        end if;
      end if;

      case op_arith_shift_vec(0) is -- level 9.
        when op_shift =>
          if code_vec(code_vec'high-2)(CODE_W-1) = '1' and code_vec(code_vec'high-2)(CODE_W-2) = '1' and a_p0(DATA_W-1) = '1' then  -- level 9.
                -- CODE_W-1 for right shift & CODE_W-2 for arithmetic & a_p0(DATA_W-1) for negative
            sra_sign <= b_shifted; -- @ 10.
            sra_sign_v <= '1';    -- @ 10.
          else
            sra_sign <= (others=>'0'); -- @ 10.
            sra_sign_v <= '0'; -- @ 10.
          end if;
        when others =>
          sra_sign <= (others=>'0'); -- @ 10.
          sra_sign_v <= '0'; -- @ 10.
      end case;
      -- b {{{
      case op_arith_shift_vec(0) is -- level 9.
        when op_lw =>
          b(DATA_W downto 3) <= (others=>'0');
          b(2 downto 0) <= code_vec(code_vec'high-2)(2 downto 0); -- @ 10.
        when op_mult =>
          b(DATA_W) <= '0';
          b(rt_d0'range) <= rt_d0; -- @ 10.
        when op_shift =>
          b <= b_shifted; -- @ 10.
        when others =>
          b <= (0=>'1', others=>'0'); -- @ 10.
      end case;
      -- }}}
      -- c {{{
      case op_arith_shift_vec(0) is -- level 9.
        when op_add | op_slt =>
          if code_vec(code_vec'high-2)(0) = '0' then -- "use immediate"-bit not set, level 9.
            c <= rt_d0; -- @ 10.
          elsif code_vec(code_vec'high-2)(CODE_W-1) = '0' then -- addi, slti, sltiu -- level 9.
            c <= std_logic_vector(resize(signed(immediate_vec(immediate_vec'high-2)(IMM_ARITH_W-1 downto 0)), DATA_W)); -- @ 10.
          elsif code_vec(code_vec'high-2)(CODE_W-2) = '0' then -- li  -- level 4 & 4.5
            c <= std_logic_vector(resize(signed(immediate_vec(immediate_vec'high-2)(IMM_W-1 downto 0)), DATA_W)); -- @ 10.
          else --lui
            c(DATA_W-1 downto DATA_W-IMM_W) <= immediate_vec(immediate_vec'high-2)(IMM_W-1 downto 0); -- @ 10.
            c(DATA_W-IMM_W-1 downto 0) <= rd(DATA_W-IMM_W-1 downto 0); -- @ 10.
          end if;
        when op_lw | op_ato =>
          c <= rt_d0; -- @ 10.
        when op_lmem =>
            c <= std_logic_vector(resize(signed(immediate_vec(immediate_vec'high-2)(IMM_ARITH_W-1 downto 0)), DATA_W)); -- @ 10.
        when op_mult =>
          if code_vec(code_vec'high-2)(CODE_W-1) = '1' then -- macc -- level 9
            c <= rd; -- @ 10.
          else
            c <= (others=>'0'); -- @ 10.
          end if;
        when op_bra =>
          c <= rd; -- @ 10.
        when others => -- when op_shift | op_mov | nop
          c <= (others=>'0'); -- @ 10.
      end case;
      -- }}}
      -- slt & sltu {{{
      instr_is_slt(instr_is_slt'high) <= '0'; -- @ 10.
      instr_is_sltu(instr_is_sltu'high) <= '0'; -- @ 10.
      if op_arith_shift_vec(0) = op_slt then -- level 9
        if code_vec(code_vec'high-2)(2) = '0' then -- slt & slti, level 9
          instr_is_slt(instr_is_slt'high) <= '1'; -- @ 10.
        else --sltu & sltiu
          instr_is_sltu(instr_is_sltu'high) <= '1'; -- @ 10.
        end if;
      end if;
      instr_is_slt(instr_is_slt'high-1 downto 0) <= instr_is_slt(instr_is_slt'high downto 1); -- @ 11.->15.
      instr_is_sltu(instr_is_sltu'high-1 downto 0) <= instr_is_sltu(instr_is_sltu'high downto 1); -- @ 11.->15.
      -- }}}
      sub_op <= '0'; -- @ 10.
      case op_arith_shift_vec(0) is -- level 9.
        when op_add | op_bra | op_slt =>
          sub_op <= code_vec(code_vec'high-2)(1); -- @ 10.
        when op_lmem | op_lw | op_mult | op_shift | op_mov | op_ato=>
      end case;
      -- }}}
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- mult_add_sub {{{
  ce <= '1';
  mult_adder: entity mult_add_sub port map (
    clk         => clk,
    ce          => ce,
    sub         => sub_op, -- level 10.
    a           => unsigned(a), -- level 10.
    b           => unsigned(b), -- level 10.
    c           => unsigned(c), -- level 10.
    sra_sign    => unsigned(sra_sign), -- 10.
    sra_sign_v  => sra_sign_v, -- level 10.

    res_low_p0  => res_low_p0, -- level 15.
    sltu_true_p0=> sltu_true, --level 15.
    res_high    => res_high -- level 16.
  );
  -- }}}
end Behavioral;
