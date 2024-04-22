library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mouse_led_sseg is
   port (
      clk, reset: in  std_logic;
      ps2d_1, ps2c_1: inout std_logic;
		btn : out std_logic_vector(2 downto 0);
		led : out std_logic_vector(1 downto 0)
   );
end mouse_led_sseg;

architecture arch of mouse_led_sseg is
   signal p_reg, p_next: unsigned(9 downto 0);
   signal xm: std_logic_vector(8 downto 0);
   signal btnm: std_logic_vector(2 downto 0);
   signal m_done_tick: std_logic;
	signal btn_reg: std_logic_vector(2 downto 0);

begin
   -- instantiation
   mouse_unit: entity work.mouse(arch)
      port map(clk=>clk, 
			reset=>reset,
			ps2d=>ps2d_1, 
			ps2c=>ps2c_1,	--!
         xm=>xm, ym=>open, btnm=>btnm,
         m_done_tick=>m_done_tick);
   -- register
   process (clk, reset)
   begin
      if reset='1' then
         p_reg <= (others=>'0');
			btn_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         p_reg <= p_next;
			btn_reg <= btnm;
      end if;
   end process;
   -- counter
   p_next <= p_reg when m_done_tick='0' else
             "0000000000" when btnm(0)='1' else --left button
             "1111111111" when btnm(1)='1' else --right button
             p_reg + unsigned(xm(8) & xm);

	led <= std_logic_vector(p_reg(3 downto 2));
	btn <= btn_reg;

end arch;