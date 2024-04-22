--======================================================================

library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
  port (
    clk : in  std_logic;
    rst : in  std_logic;
    signal_in : in  std_logic;
    pulse_out : out std_logic);
end edge_detector;

architecture rtl of edge_detector is
  signal in_d1 : std_logic;
  signal in_d2 : std_logic;
begin
  edge_detect : process(clk)

  begin
    if rising_edge(clk) then
      if rst = '1' then
        in_d1 <= '0';
        in_d2 <= '0';
      else
        in_d1 <= signal_in;
        in_d2 <= in_d1;
      end if;
    end if;

  end process edge_detect;

  pulse_out <= not in_d2 and in_d1;

end rtl;

--======================================================================
