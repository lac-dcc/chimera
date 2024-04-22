-- Listing 9.5
-- notes to run on logi:
-- * using led sseg module to view 8x leds on the 4x ssegs
-- * adding onboards leds to view bit7 and bit0 of the 8 led bits.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mouse_led is
   port (
      clk, reset_n: in  std_logic;
		an: out std_logic_vector(3 downto 0);
		sseg: out std_logic_vector(7 downto 0);
		led: out std_logic_vector(1 downto 0);
      ps2d_1, ps2c_1: inout std_logic
   );
end mouse_led;

architecture arch of mouse_led is
   signal p_reg, p_next: unsigned(9 downto 0);
   signal xm: std_logic_vector(8 downto 0);
   signal btnm: std_logic_vector(2 downto 0);
   signal m_done_tick: std_logic;
	signal reset: std_logic;
	signal led_sseg: std_logic_vector(7 downto 0);

begin
	
	reset <= not(reset_n);

   -- instantiation
   mouse_unit: entity work.mouse(arch)
      port map(clk=>clk, reset=>reset,
               ps2d=>ps2d_1, ps2c=>ps2c_1,	--!
               xm=>xm, ym=>open, btnm=>btnm,
               m_done_tick=>m_done_tick);
   -- register
   process (clk, reset)
   begin
      if reset='1' then
         p_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         p_reg <= p_next;
      end if;
   end process;
   -- counter
   p_next <= p_reg when m_done_tick='0' else
             "0000000000" when btnm(0)='1' else --left button
             "1111111111" when btnm(1)='1' else --right button
             p_reg + unsigned(xm(8) & xm);

   with p_reg(9 downto 7) select
      led_sseg <= "10000000" when "000",
             "01000000" when "001",
             "00100000" when "010",
             "00010000" when "011",
             "00001000" when "100",
             "00000100" when "101",
             "00000010" when "110",
             "00000001" when others;
				 
				 
 led8_sseg_unit: entity work.led8_sseg
	 port map (
		   clk  => clk,
		   reset  => '0', 
		   led => led_sseg, 
		   an_edu => an, 
		   sseg_out => sseg
	 );
				 
	led(0) <= led_sseg(7);
	led(1) <= led_sseg(0);
				 
end arch;