library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 
use ieee.numeric_std.all;

entity clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    rstout: out std_logic
  );
end entity clkgen;

architecture behave of clkgen is

  signal locked, rstq1, rstq2: std_logic;
  signal clki: std_logic;

begin

  pll_inst: ENTITY work.mypll
	PORT map
	(
		inclk0		=> clkin,
		c0		    => clki,
		locked		=> locked
	);
  clkout<=clki;

  process(locked, clki)
  begin
    if locked='0' or rstin='1' then
      rstq1<='1';
      rstq2<='1';
    elsif rising_edge(clki) then
      rstq1<=rstq2;
      rstq2<='0';
    end if;
  end process;

  rstout <= rstq1;

end behave;