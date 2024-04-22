library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

entity oddrff is
  port (
    CLK:  in std_ulogic;
    D0:   in std_logic;
    D1:   in std_logic;
    O:   out std_ulogic
  );

end entity oddrff;

architecture behave of oddrff is

  signal CLKN: std_ulogic;

begin

  CLKN <= not CLK;

  inst: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => D0,
      D1 => D1,
      Q => O,
      C0 => CLK,
      C1 => CLKN,
      CE => '1',
      R => '0',
      S => '0'
    );

end behave;
