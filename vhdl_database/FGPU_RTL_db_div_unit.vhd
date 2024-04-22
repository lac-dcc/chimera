-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity div_unit is -- {{{
port(
  div_a, div_b        : in std_logic_vector(DATA_W-1 downto 0); -- level 8.
  div_valid           : in std_logic; -- level 8.
  code                : in std_logic_vector(CODE_W-1 downto 0); -- level 8.

  res_div             : out std_logic_vector(DATA_W-1 downto 0); -- level 8+DIV_DELAY+1.

  clk, nrst           : in std_logic
);
end entity; -- }}}
architecture Behavioral of div_unit is

  -- signals definitions {{{
  signal signed_valid   : std_logic;
  signal unsigned_valid : std_logic;

  signal sdiv_a : std_logic_vector(DATA_W-1 downto 0);
  signal sdiv_b : std_logic_vector(DATA_W-1 downto 0);
  signal udiv_a : std_logic_vector(DATA_W-1 downto 0);
  signal udiv_b : std_logic_vector(DATA_W-1 downto 0);

  signal div_res   : std_logic_vector(DATA_W-1 downto 0);
  signal udiv_res  : std_logic_vector(DATA_W-1 downto 0);
  signal rem_res   : std_logic_vector(DATA_W-1 downto 0);
  signal urem_res  : std_logic_vector(DATA_W-1 downto 0);

  signal signed_res   : std_logic_vector((2*DATA_W)-1 downto 0);
  signal unsigned_res : std_logic_vector((2*DATA_W)-1 downto 0);

  signal code_vec : code_vec_type(DIV_DELAY-1 downto 0);
  --}}}

begin

  -- unpacked results
  div_res  <= signed_res((2*DATA_W)-1 downto DATA_W);
  rem_res  <= signed_res(DATA_W-1 downto 0);
  udiv_res <= unsigned_res((2*DATA_W)-1 downto DATA_W);
  urem_res <= unsigned_res(DATA_W-1 downto 0);

  -- chip enables
  process (div_valid, code(0))
  begin
    signed_valid   <= '0';
    unsigned_valid <= '0';

    if div_valid = '1' and code(0) = '0' then
      signed_valid <= '1';
    elsif div_valid = '1' and code(0) = '1' then
      unsigned_valid <= '1';
    end if;
  end process;

  sdiv_a <= div_a and (DATA_W-1 downto 0 => signed_valid);
  sdiv_b <= div_b and (DATA_W-1 downto 0 => signed_valid);
  udiv_a <= div_a and (DATA_W-1 downto 0 => unsigned_valid);
  udiv_b <= div_b and (DATA_W-1 downto 0 => unsigned_valid);

  -- pipes
  process(clk)
  begin
  if rising_edge(clk) then
    code_vec <= code & code_vec(code_vec'high downto 1); -- @ 9.->18.
  end if;
  end process;

  -- output mux
  process(clk)
  begin
  if rising_edge(clk) then
    if nrst = '0' then
      res_div <= (others => '0');
    else
      if code_vec(0)(0) = '0' then -- level 8+DIV_DELAY.
        -- signed
        case code_vec(0)(2 downto 1) is -- level 8+DIV_DELAY.
          when "01" => -- div
            res_div <= div_res; -- @ 8+DIV_DELAY+1.
          when "10" => -- rem
            res_div <= rem_res; -- @ 8+DIV_DELAY+1.
          when others =>
            res_div <= (others => '0'); -- @ 8+DIV_DELAY+1.
        end case;
      else
        -- unsigned
        case code_vec(0)(2 downto 1) is -- level 8+DIV_DELAY.
          when "01" => -- udiv
            res_div <= udiv_res; -- @ 8+DIV_DELAY+1.
          when "10" => -- urem
            res_div <= urem_res; -- @ 8+DIV_DELAY+1.
          when others =>
            res_div <= (others => '0'); -- @ 8+DIV_DELAY+1.
        end case;
      end if;
    end if;
  end if;
  end process;

  signed_divisor: sdiv
  port map (
    -- Global signals
    aclk                   => clk,
    -- AXI4-Stream slave channel for dividend
    s_axis_dividend_tvalid => '1',
    s_axis_dividend_tdata  => sdiv_a, -- level 8.
    -- AXI4-Stream slave channel for divisor
    s_axis_divisor_tvalid  => '1',
    s_axis_divisor_tdata   => sdiv_b, -- level 8.
    -- AXI4-Stream master channel for output result
    m_axis_dout_tvalid     => open,
    m_axis_dout_tdata      => signed_res -- level 8+DIV_DELAY.
  );

  unsigned_divisor: udiv
  port map (
    -- Global signals
    aclk                   => clk,
    -- AXI4-Stream slave channel for dividend
    s_axis_dividend_tvalid => '1',
    s_axis_dividend_tdata  => udiv_a, -- level 8.
    -- AXI4-Stream slave channel for divisor
    s_axis_divisor_tvalid  => '1',
    s_axis_divisor_tdata   => udiv_b, -- level 8.
    -- AXI4-Stream master channel for output result
    m_axis_dout_tvalid     => open,
    m_axis_dout_tdata      => unsigned_res -- level 8+DIV_DELAY.
  );

end Behavioral;
