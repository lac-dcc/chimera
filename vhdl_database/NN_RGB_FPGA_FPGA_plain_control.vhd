-- sharp_control.vhd
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Marco Winzker, Hochschule Bonn-Rhein-Sieg, 22.05.2020

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control is
  generic ( delay : integer := 7 );
  port ( clk       : in  std_logic;
         reset     : in  std_logic;
         vs_in     : in  std_logic;
         hs_in     : in  std_logic;
         de_in     : in  std_logic;
         vs_out    : out std_logic;
         hs_out    : out std_logic;
         de_out    : out std_logic);
end control;

architecture behave of control is


  type delay_array is array (1 to delay) of std_logic;
  signal vs_delay : delay_array;
  signal hs_delay : delay_array;
  signal de_delay : delay_array;

begin

  process
  begin
    wait until rising_edge(clk);

     -- first value of array is current input
     vs_delay(1) <= vs_in;
     hs_delay(1) <= hs_in;
     de_delay(1) <= de_in;

    -- delay according to generic
    for i in 2 to delay loop
      vs_delay(i) <= vs_delay(i-1);
      hs_delay(i) <= hs_delay(i-1);
      de_delay(i) <= de_delay(i-1);
    end loop;

  end process;

  -- last value of array is output
  vs_out <= vs_delay(delay);
  hs_out <= hs_delay(delay);
  de_out <= de_delay(delay);

end behave;