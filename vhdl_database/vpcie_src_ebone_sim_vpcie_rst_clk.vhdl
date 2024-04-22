library ieee;
use ieee.std_logic_1164.all;


entity rst_clk is
 port
 (
  rst: out std_ulogic;
  clk: out std_ulogic
 );
end entity;


architecture behav of rst_clk is
 signal internal_clk: std_ulogic := '0';
begin

 clk <= internal_clk;

 process
  variable once: integer := 0;
 begin
  -- force default values
  rst <= '0';

  if once = 0 then
   once := 1;

   rst <= '1';

   internal_clk <= internal_clk xor '1';
   wait for 1 us;
   internal_clk <= internal_clk xor '1';
   wait for 1 us;

   internal_clk <= internal_clk xor '1';
   wait for 1 us;
   internal_clk <= internal_clk xor '1';
   wait for 1 us;

   internal_clk <= internal_clk xor '1';
   wait for 1 us;
   internal_clk <= internal_clk xor '1';
   wait for 1 us;

   internal_clk <= internal_clk xor '1';
   wait for 1 us;
   internal_clk <= internal_clk xor '1';
   wait for 1 us;

  end if;

  internal_clk <= internal_clk xor '1';
  wait for 1 us;
 end process;
end behav;
