--
-- File: macc.vhd
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library fgpu;
use fgpu.components.all;

entity dsp is
generic (
  SIZE_A              : natural := 16;
  SIZE_B              : natural := 16;
  SUB                 : boolean := false
); port (
  clk, nrst, ce       : in std_logic;
  ain                 : in unsigned(SIZE_A-1 downto 0);
  bin                 : in unsigned(SIZE_B-1 downto 0);
  cin                 : in unsigned(SIZE_A+SIZE_B-1 downto 0); -- should be delayed 1 clock cycle after ain & bin
  res                 : out unsigned(SIZE_A+SIZE_B-1 downto 0) -- ready after 3 clock cycles (reference is ain or bin)
);
end entity;

architecture rtl of dsp is

  -- Declare intermediate values
  signal a_reg        : unsigned(SIZE_A-1 downto 0);
  signal b_reg        : unsigned(SIZE_B-1 downto 0);
  signal c_reg        : unsigned(SIZE_A+SIZE_B-1 downto 0);
  signal mult_reg     : unsigned(SIZE_A+SIZE_B-1 downto 0);
  -- signal sload_reg    : std_logic;

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        a_reg    <= (others => '0'); -- NOT NEEDED
        b_reg    <= (others => '0'); -- NOT NEEDED
        c_reg    <= (others => '0'); -- NOT NEEDED
        mult_reg <= (others => '0'); -- NOT NEEDED
        res      <= (others => '0'); -- NOT NEEDED
      else
        if ce = '1' then
          -- pipe 0
          a_reg <= unsigned(ain);
          b_reg <= unsigned(bin);
          c_reg <= cin;
          -- pipe 1
          mult_reg  <= a_reg * b_reg;
          -- pipe 2
          -- Store accumulation result into a register
          if SUB then
            res <= mult_reg - c_reg;
          else
            res <= mult_reg + c_reg;
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture;
