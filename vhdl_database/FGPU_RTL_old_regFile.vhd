-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity regFile is
port(
  rs_addr, rt_addr    : in unsigned(REG_FILE_BLOCK_W-1 downto 0); -- level 2.
  rd_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0); -- level 2.
  re                  : in std_logic; -- level 2.

  rs                  : out std_logic_vector(DATA_W-1 downto 0):= (others=>'0'); -- level 7.
  rt                  : out std_logic_vector(DATA_W-1 downto 0):= (others=>'0'); -- level 6.
  rd                  : out std_logic_vector(DATA_W-1 downto 0):= (others=>'0'); -- level 8.

  we                  : in std_logic; -- level 18.
  wrAddr              : in unsigned(REG_FILE_BLOCK_W-1 downto 0); -- level 18.
  wrData              : in std_logic_vector(DATA_W-1 downto 0); -- level 18.

  clk                 : in std_logic
);
end entity;

architecture Behavioral of regFile is
  -- signals definitions {{{
  signal regFile_rdAddr                   : unsigned(REG_FILE_BLOCK_W-1 downto 0) := (others=>'0');
  signal regFile_rdAddr_n                 : unsigned(REG_FILE_BLOCK_W-1 downto 0) := (others=>'0');
  signal regFile_outData                  : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal regFile_outData_n                : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal clk_stable_int                   : std_logic;

  signal regFile512: SLV32_ARRAY(0 to REG_FILE_BLOCK_SIZE-1) := (others => (others => '0'));

  type read_state_type is (prepare_rt_addr, read_rs, read_rt, read_rd);
  signal state, state_n                   : read_state_type := prepare_rt_addr;
  type read_state_vec_type is array (natural range<>) of read_state_type;
  signal state_vec                        : read_state_vec_type(5 downto 0) := (others=>prepare_rt_addr);
  signal rs_n, rt_n, rd_n                 : std_logic_vector(DATA_W-1 downto 0):= (others=>'0');
  signal we_d0                            : std_logic := '0';
  signal wrAddr_clk2x                     : unsigned(REG_FILE_BLOCK_W-1 downto 0) := (others=>'0');
  signal wrData_d0                        : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal wrAddr_d0                        : unsigned(REG_FILE_BLOCK_W-1 downto 0) := (others=>'0');
  -- }}}
begin
  process(state, re, rs_addr, rt_addr, rd_addr)
  begin
    state_n <= state;
    case state is
      when prepare_rt_addr => 
        if re = '1' then -- level 2.
          state_n <= read_rt;
        end if;
        regFile_rdAddr_n <= rt_addr;
      when read_rt => -- level 3.
        regFile_rdAddr_n <= rs_addr;
        state_n <= read_rs;
      when read_rs => -- level 4.
        regFile_rdAddr_n <= rd_addr;
        state_n <= read_rd;
      when read_rd => -- level 5
        regFile_rdAddr_n <= rd_addr;
        state_n <= prepare_rt_addr;
    end case;
  end process;


  process(clk)
  begin
    if rising_edge(clk) then
      state <= state_n; -- @ 3. reset not necesary since the FSM will go always to the first state and waits until re = '1'
      state_vec(state_vec'high-1 downto 0) <= state_vec(state_vec'high downto 1); -- @ 5.->8.
      state_vec(state_vec'high) <= state; -- @ 4.

      we_d0 <= we; -- @ 19.
      wrData_d0 <= wrData; -- @ 19.
      wrAddr_d0 <= wrAddr; -- @ 19.
      case state_vec(state_vec'high-1) is -- level 5.
        when prepare_rt_addr =>
        when read_rt =>
          rt <= regFile_outData; -- @ 6.
        when read_rs =>
          rs <= regFile_outData; -- @ 7.
        when read_rd =>
          rd <= regFile_outData; -- @ 8.
      end case;
    end if;
  end process;

  regFile_Instance: process (clk)
  begin
    if (clk'event and clk = '1') then
      regFile_rdAddr <= regFile_rdAddr_n; -- rt @ 3., rs @ 4., rd @ 5.
      if we_d0 = '1' then -- level 19.
        regFile512(to_integer(wrAddr_d0)) <= wrData_d0; -- @ 20.
      end if;
      regFile_outData_n <= regFile512(to_integer(regFile_rdAddr)); -- rt @ 4., rs @ 5., rd @ 6.
      regFile_outData <= regFile_outData_n; -- rt @ 5., rs @ 6., rd @ 7.
    end if;
  end process;
  
  
  


end Behavioral;

