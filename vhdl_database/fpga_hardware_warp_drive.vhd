library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity warp_drive is
    generic(
      BARREL_BIT_WIDTH: integer := 4 
    );
    port (  tick: in std_logic;
            reset: in std_logic;
					  pc_write_enable_out: out std_logic;
						active_barrel_row_out: out std_logic_vector(BARREL_BIT_WIDTH -1 downto 0)
		);
		
end warp_drive;

architecture rtl of warp_drive is
  signal counter : unsigned(BARREL_BIT_WIDTH - 1 downto 0) := (BARREL_BIT_WIDTH - 1 downto 0 => '0'); 
begin

  pc_write_enable_out <= '1' when counter = 0 else '0';
  
  active_barrel_row_out <= std_logic_vector(counter);

  process (tick, reset) is
  begin
    if reset = '1' then
      counter <= (others => '0');
    elsif rising_edge(tick) then
      counter <= counter + 1;
    end if;
  end process;
      

end rtl;