library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  generic( W : natural := 4);                                -- Width of data
    port (clk          : in  std_logic;
          rst          : in  std_logic;                      -- active high sync to clock
          i_data_a     : in  std_logic_vector(W-1 downto 0); -- input data A
          i_data_b     : in  std_logic_vector(W-1 downto 0); -- input data B
          i_data_carry : in  std_logic;                      -- carry in or borrow in
          i_ctrl       : in  std_logic_vector(3 downto 0);   -- control signals
          o_data_c     : out std_logic_vector(W-1 downto 0); -- output data C
          o_data_carry : out std_logic;                      -- carry out or borrow out
          o_data_comp  : out std_logic_vector(1 downto 0);   -- output comparison
          o_valid      : out std_logic                       -- valid output
        );
end top;

architecture rtl of top is
  -- 1: FETCH
  signal reg_i_instr_1      : std_logic_vector( i_ctrl'RANGE )      := ( others => '0' );
  signal reg_i_data_a_1     : std_logic_vector( i_data_a'RANGE )    := ( others => '0' );
  signal reg_i_data_b_1     : std_logic_vector( i_data_b'RANGE )    := ( others => '0' );
  signal reg_i_data_carry_1 : std_logic                             := '0';

  -- 2: DECODE
  signal reg_i_instr_2      : std_logic_vector( i_ctrl'RANGE )      := ( others => '0' );
  signal reg_i_data_a_2     : std_logic_vector( i_data_a'RANGE )    := ( others => '0' );
  signal reg_i_data_b_2     : std_logic_vector( i_data_b'RANGE )    := ( others => '0' );
  signal reg_i_data_carry_2 : std_logic                             := '0';

  -- 3: Execute
  signal reg_i_instr_3      : std_logic_vector( i_ctrl'RANGE )      := ( others => '0' );
  signal reg_i_data_a_3     : std_logic_vector( i_data_a'RANGE )    := ( others => '0' );
  signal reg_i_data_b_3     : std_logic_vector( i_data_b'RANGE )    := ( others => '0' );
  signal reg_i_data_carry_3 : std_logic                             := '0';

  -- Output signals of ALU
  signal sig_data_c         : std_logic_vector( o_data_c'RANGE )    := ( others=> '0' );
  signal sig_data_carry     : std_logic                             := '0';
  signal sig_data_comp      : std_logic_vector( o_data_comp'RANGE ) := ( others=> '0' );
  signal sig_valid          : std_logic                             := '0';
  signal reg_valid          : std_logic                             := '0';

  -- Declare component ALU
  component alu is
    generic( W : natural := 4 );
    port (i_data_a     : in  std_logic_vector(W-1 downto 0); -- input data A
          i_data_b     : in  std_logic_vector(W-1 downto 0); -- input data B
          i_data_carry : in  std_logic;                      -- carry in or borrow in
          i_ctrl       : in  std_logic_vector(3 downto 0);   -- control signals
          o_data_c     : out std_logic_vector(W-1 downto 0); -- output data C
          o_data_carry : out std_logic;                      -- carry out or borrow out
          o_data_comp  : out std_logic_vector(1 downto 0)    -- output comparison
        );
  end component alu;
begin

  -- Instruction pipeline (1: FETCH, 2: DECODE, 3: EXECUTE)
  mem_instr: process(clk)
  begin
    if rising_edge(clk) then
      if( rst = '1' ) then
        -- 1: FETCH
        reg_i_instr_1 <= ( others => '0' ); -- NOP

        -- 2: DECODE
        reg_i_instr_2 <= ( others => '0' ); -- NOP

        -- 2: DECODE
        reg_i_instr_3 <= ( others => '0' ); -- NOP
      else
        -- 1: FETCH
        reg_i_instr_1 <= i_ctrl;

        -- 2: DECODE
        reg_i_instr_2 <= reg_i_instr_1;

        -- 3: Execute
        reg_i_instr_3 <= reg_i_instr_2;        
      end if;
    end if;
  end process mem_instr;

  -- Operand pipeline (1: FETCH, 2: DECODE, 3: EXECUTE)
  mem_operands: process(clk)
  begin
    if rising_edge(clk) then
      if( rst = '1' ) then
        -- 1: FETCH
        reg_i_data_a_1 <= ( others => '0' );
        reg_i_data_b_1 <= ( others => '0' );
        reg_i_data_carry_1 <= '0';

        -- 2: DECODE
        reg_i_data_a_2 <= ( others => '0' );
        reg_i_data_b_2 <= ( others => '0' );
        reg_i_data_carry_2 <= '0';

        -- 2: Execute
        reg_i_data_a_3 <= ( others => '0' );
        reg_i_data_b_3 <= ( others => '0' );
        reg_i_data_carry_3 <= '0';        
      else
        -- 1: FETCH
        reg_i_data_a_1 <= i_data_a;
        reg_i_data_b_1 <= i_data_b;
        reg_i_data_carry_1 <= i_data_carry;

        -- 2: DECODE
        reg_i_data_a_2 <= reg_i_data_a_1;
        reg_i_data_b_2 <= reg_i_data_b_1;        
        reg_i_data_carry_2 <= reg_i_data_carry_1;

        -- 2: EXECUTE
        reg_i_data_a_3 <= reg_i_data_a_2;
        reg_i_data_b_3 <= reg_i_data_b_2;        
        reg_i_data_carry_3 <= reg_i_data_carry_2;        
      end if;
    end if;
  end process mem_operands;

  -- 2: DECODE
  -- Check if fetched instruction is a valid instruction
  sig_valid <= '1' when reg_i_instr_2 = "0001" OR
                        reg_i_instr_2 = "0010" OR
                        reg_i_instr_2 = "0011" OR
                        reg_i_instr_2 = "0100" OR
                        reg_i_instr_2 = "0101" OR
                        reg_i_instr_2 = "0110" OR
                        reg_i_instr_2 = "0111" else '0';

  -- 2: DECODE
  mem_valid: process(clk)
  begin
    if rising_edge(clk) then
      if( rst = '1') then
        reg_valid <= '0';
      else
        reg_valid <= sig_valid;
      end if;
    end if;
  end process mem_valid;

  -- 2: DECODE
  o_valid <= reg_valid;

  -- 3: EXECUTE
  alu_inst:  alu
              generic map( W => W )
              port map( i_data_a      => reg_i_data_a_3,
                        i_data_b      => reg_i_data_b_3,
                        i_data_carry  => reg_i_data_carry_3,
                        i_ctrl        => reg_i_instr_3,
                        o_data_c      => sig_data_c,
                        o_data_carry  => sig_data_carry,
                        o_data_comp   => sig_data_comp );

  -- 3: EXECUTE
  mem_outputs: process(clk)
  begin
    if rising_edge(clk) then
      if( rst = '1') then
        o_data_c <= ( others => '0' );
        o_data_carry <= '0';
        o_data_comp <= ( others => '0' );
      else
        if( reg_valid = '1' ) then
          o_data_c <= sig_data_c;
          o_data_carry <= sig_data_carry;
          o_data_comp <= sig_data_comp;
        else
          o_data_c <= ( others => '0' );
          o_data_carry <= '0';
          o_data_comp <= ( others => '0' );
        end if;
      end if;
    end if;
  end process mem_outputs;
end rtl;