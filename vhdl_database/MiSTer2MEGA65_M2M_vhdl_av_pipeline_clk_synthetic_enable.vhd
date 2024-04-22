library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generate a Clock Enable signal with a given sample rate

entity clk_synthetic_enable is
   port (
      clk_i       : in  std_logic;        -- reference clock
      src_speed_i : in  natural range 1 to 100_000_000;  -- Clock speed of clk_i in Hz
      dst_speed_i : in  natural range 1 to 100_000_000;  -- Target sample rate in Hz
      enable_o    : out std_logic
   );
end entity clk_synthetic_enable;

architecture synthesis of clk_synthetic_enable is

   signal counter_r : natural range 0 to 100_000_000;
   signal diff_s    : natural range 0 to 100_000_000;

begin

   -- This is assumed to be a non-negative value,
   -- i.e. that src_speed_i >= dst_speed_i.
   diff_s <= src_speed_i - dst_speed_i;

   p_counter : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if counter_r >= diff_s then
            counter_r <= counter_r - diff_s;
            enable_o <= '1';
         else
            counter_r <= counter_r + dst_speed_i;
            enable_o <= '0';
         end if;
      end if;
   end process p_counter;

end architecture synthesis;

