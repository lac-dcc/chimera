--======================================================================
-- Clock-domain crossing for reset signals. The usual asyncronous
-- assert and synchronous release.
--======================================================================

library ieee;
use ieee.std_logic_1164.all;

entity cdc_reset is
  port (
    reset_in : in  std_logic;
    clk_dst : in  std_logic;
    reset_out : out std_logic
  );
end cdc_reset;

architecture rtl of cdc_reset is

  signal reset_d1 : std_logic;
  signal reset_d2 : std_logic;

  attribute ASYNC_REG : string;
  attribute ASYNC_REG of reset_d1 : signal is "TRUE";
  attribute ASYNC_REG of reset_d2 : signal is "TRUE";

  attribute SHREG_EXTRACT: string;
  attribute SHREG_EXTRACT of reset_d1 : signal is "no";
  attribute SHREG_EXTRACT of reset_d2 : signal is "no";

begin

  process(clk_dst, reset_in) is
  begin
    if reset_in = '1' then
      reset_d1 <= '1';
      reset_d2 <= '1';
    elsif rising_edge(clk_dst) then
      reset_d1 <= reset_in;
      reset_d2 <= reset_d1;
    end if;
  end process;

  reset_out <= reset_d2;

end rtl;

--======================================================================
