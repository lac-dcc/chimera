-- Generate clocks needed for the HyperRAM controller.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;

entity clk is
   port (
      clk_o          : out std_logic;
      clk_del_o      : out std_logic;
      delay_refclk_o : out std_logic;   -- 200 MHz, for IDELAYCTRL
      rst_o          : out std_logic
   );
end entity clk;

architecture simulation of clk is

   constant C_CLK_PERIOD          : time := 10 ns; -- 100 MHz
   constant C_DELAY_REFCLK_PERIOD : time := 5 ns;  -- 200 MHz

begin

   p_clk : process
   begin
      clk_o <= '1';
      wait for C_CLK_PERIOD/2;
      clk_o <= '0';
      wait for C_CLK_PERIOD/2;
   end process p_clk;

   p_clk_del : process
   begin
      wait for C_CLK_PERIOD/4;
      while true loop
         clk_del_o <= '1';
         wait for C_CLK_PERIOD/2;
         clk_del_o <= '0';
         wait for C_CLK_PERIOD/2;
      end loop;
      wait;
   end process p_clk_del;

   p_delay_refclk : process
   begin
      delay_refclk_o <= '1';
      wait for C_DELAY_REFCLK_PERIOD/2;
      delay_refclk_o <= '0';
      wait for C_DELAY_REFCLK_PERIOD/2;
   end process p_delay_refclk;

   p_rst : process
   begin
      rst_o <= '1';
      wait for 10*C_CLK_PERIOD;
      wait until clk_o = '1';
      rst_o <= '0';
      wait;
   end process p_rst;

end architecture simulation;

