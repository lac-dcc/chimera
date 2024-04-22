----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:16:01 04/24/2013 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


library work ;
use work.utils_pack.all ;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
  generic(
    slow_clock_period   : integer := 20000000;
    system_clock_period : integer := 50
    );
  port (clk     : in  std_logic;
        rst     : in  std_logic;
        pwm_clk : out std_logic;
        pwm_rst : out std_logic);
end clock_divider;

architecture Behavioral of clock_divider is
  constant clock_divider_value : integer := ((slow_clock_period /2) / system_clock_period);

  signal clock_divider_counter    : std_logic_vector((nbit(clock_divider_value) + 1) downto 0);
  signal slow_clk_internal        : std_logic;
  signal slow_rst_internal_stage1 : std_logic;
  signal slow_rst_internal_stage2 : std_logic;


begin
  clock_divider : process(clk)
  begin
    if (clk'event and clk = '1') then
      if (rst = '0') then
        clock_divider_counter <= (others => '0');
        slow_clk_internal     <= '0';
      elsif clock_divider_counter >= clock_divider_value then
        slow_clk_internal     <= not slow_clk_internal;
        clock_divider_counter <= (others => '0');
      else
        clock_divider_counter <= clock_divider_counter + 1;
      end if;
    end if;
  end process;

  pwm_clk <= slow_clk_internal;
  reset_pulse_extension : process(rst, slow_clk_internal)
  begin
    if (rst = '0') then
      slow_rst_internal_stage1 <= '1';
      slow_rst_internal_stage2 <= '1';
    elsif (slow_clk_internal = '1' and slow_clk_internal'event) then
      slow_rst_internal_stage1 <= '0';
      slow_rst_internal_stage2 <= slow_rst_internal_stage1;
    end if;
  end process;
  pwm_rst <= slow_rst_internal_stage1 or slow_rst_internal_stage2;

end Behavioral;

