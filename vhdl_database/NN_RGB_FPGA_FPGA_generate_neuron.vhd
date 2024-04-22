-- neuron.vhd
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Thomas Florkowski, Hochschule Bonn-Rhein-Sieg, 16.05.2020

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.CONFIG.ALL;

entity neuron is
  generic ( weightsIn : constIntArray);
				
  port    ( clk : in std_logic;
				inputsIn : in input;
				output : out integer range 0 to 255);
end neuron;

architecture behave of neuron is
	signal sumAdress : std_logic_vector(15 downto 0); -- adress for the lookup table
	signal afterActivation : std_logic_vector(7 downto 0); -- result of the lookup table
	signal sumForActivation : integer range minSumRange to maxSumRange:= 0; --sum after accumulation of the bias plus all inputs multiplied by their weights
	signal accumulate : multResults (weightsIn'length-2 downto 0) :=(others => 0); -- Array with the results from the multiplication of input with its weight
begin
	
-- Generate a multiplier for each input to multiply it with its weight
-- Save the results in the array
-- This step is necessary because otherwise the mac operations would be to slow
gen : FOR I IN 0 TO weightsIn'length-2 GENERATE --Layers
        mult: entity work.multiplier 
			 generic map ( weight => weightsIn(I+weightsIn'right))
			 port map (  clk     => clk,
							 input => inputsIn(I+inputsIn'right),
							 output	=> accumulate(I));
END GENERATE;

	
process
-- Accumulate the results from the multiplier and the bias
variable sum : integer range minSumRange to maxSumRange:= 0;
begin
	wait until rising_edge(clk);
	
	sum := 0;
	for I in 0 to weightsIn'length-2  loop
		sum := sum + accumulate(I);
	end loop;
	
	--adding bias
	sumForActivation <= sum + weightsIn(weightsIn'left);

    
end process;	

process
begin
	wait until rising_edge(clk);
	-- limiting result for sigmoid
    if (sumForActivation < -32768) then
      sumAdress <= (others => '0');
    elsif (sumForActivation > 32767) then
		sumAdress <= (others => '1');
	 else 
      sumAdress <= std_logic_vector(to_unsigned(sumForActivation + 32768, 16));
    end if;
end process;

 
--lookup table for the sigmoid function
sigmoid : entity work.sigmoid_IP 
	port map (clock   => clk,
              address => sumAdress(15 downto 4),
              q       => afterActivation);

				  
 -- set output of the neuron
 output <= to_integer(unsigned(afterActivation));
	



end behave;