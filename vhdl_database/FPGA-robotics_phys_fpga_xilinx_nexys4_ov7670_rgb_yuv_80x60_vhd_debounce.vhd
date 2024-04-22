--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   Pulse detector, converts a bouncing signal in just one pulse
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.ov7670_pkg.all;

entity debounce_1pulse is
    port ( rst       : in  std_logic;
           clk       : in  std_logic;
           sig_in    : in  std_logic;
           sig_out   : out  std_logic);
end debounce_1pulse;

architecture behav of debounce_1pulse is
   signal count : unsigned(23 downto 0);
   signal counting      : std_logic;
   signal sig_in_rg1    : std_logic;
   signal sig_in_rg2    : std_logic;
   signal sig_risevent  : std_logic;
   signal sig_fallevent : std_logic;
begin

  P_reg_in: process(rst, clk)
  begin
    if rst = c_on then
      sig_in_rg1 <= '0';
      sig_in_rg2 <= '0';
    elsif clk'event and clk='1' then
      sig_in_rg1 <= sig_in;
      sig_in_rg2 <= sig_in_rg1;
    end if;
  end process;

  sig_risevent <= '1' when (sig_in_rg1 = '1' and sig_in_rg2 = '0') else '0';
  sig_fallevent <= '1' when (sig_in_rg1 = '0' and sig_in_rg2 = '1') else '0';

  P_deb: process(rst, clk)
  begin
    if rst = c_on then
      counting <='0'; 
      sig_out  <='0'; 
      count <= (others => '1');
    elsif clk'event and clk='1' then
      sig_out <= '0';
      if sig_risevent = '1' then
        counting <='1'; 
      elsif sig_fallevent = '1' then
        counting <='0'; 
        count <= (others => '1');
      elsif count = 0 then
        sig_out <= '1';
        counting <= '0'; 
        count <= (others => '1');
      elsif counting = '1' then
        count <= count - 1;
      else
        counting <='0'; 
        count <= (others => '1');
      end if;
    end if;
  end process;
  
end behav;

