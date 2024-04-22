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
 signal internal_clk: std_ulogic;
begin
 process
  variable once: integer := 0;
 begin
  -- force default values
  internal_clk <= '0';
  rst <= '0';
  clk <= '0';

  if once = 0 then
   rst <= '1';
   wait for 1 us;
   rst <= '0';
   wait for 1 us;
   once := 1;
   wait for 1 us;
  end if;

  internal_clk <= internal_clk xor '1';
  clk <= internal_clk;
  wait for 1 us;
 end process;
end behav;
