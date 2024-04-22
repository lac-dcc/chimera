library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_driver is
  port(
    clk        : in  std_ulogic;
    rst        : in  std_ulogic;
    input_val  : in  std_ulogic_vector(7 downto 0);
    led_output : out std_ulogic);
end pwm_driver;

architecture syn of pwm_driver is
begin
  process(clk, rst)
    variable tick_counter : integer range 0 to 255;
  begin
    if rst = '1' then
      -- Reset stuff
      led_output   <= '0';
      tick_counter := 0;
    elsif rising_edge(clk) then
      if tick_counter < 255 then
        tick_counter := tick_counter + 1;
        if tick_counter < to_integer(unsigned(input_val)) then
          led_output <= '1';
        else
          led_output <= '0';
        end if;
      else
        tick_counter := 0;
      end if;
    end if;
  end process;

end syn;
