-- neuron.vhd
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Thomas Florkowski, Hochschule Bonn-Rhein-Sieg, 16.05.2020

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.CONFIG.ALL;

--the multiplier takes an input and multiplies it with the given weight

entity multiplier is		
  generic ( weight : integer);
  port    ( clk : in std_logic;
				input : in integer range 0 to 255;
				output : out integer range minMultRange to maxMultRange :=0);
end multiplier;

--multiplication is done inside a process
--to give the fitter more possibilities
architecture behave of multiplier is
begin
process
begin	
   wait until rising_edge(clk);
	output <= input*weight;
end process;
end behave;