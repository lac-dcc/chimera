library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity wb_burstctrl_shreg is
  generic (
    WIDTH_BITS: natural := 16
  );
  port (
    clk:    in std_logic;
    rst:    in std_logic;
    clr:    in std_logic;
    msb:    out std_logic;
    last:   out std_logic;
    shift:  in std_logic
  );
end entity wb_burstctrl_shreg;

architecture behave of wb_burstctrl_shreg is
  signal shreg: std_logic_vector(WIDTH_BITS downto 0);
begin

process(clk)
begin
  if rising_edge(clk) then
    if rst='1' or clr='1' then
      shreg(WIDTH_BITS-1 downto 0) <= (others => '1');
      shreg(WIDTH_BITS) <= '0';
    else
      if shift='1' then
        shreg <= shreg(WIDTH_BITS-1 downto 0) & '0';
      end if;
    end if;
  end if;
end process;

msb <= shreg(WIDTH_BITS);
last <= shreg(WIDTH_BITS) and not shreg(WIDTH_BITS-1);

end behave;
