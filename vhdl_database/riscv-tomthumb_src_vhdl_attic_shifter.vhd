library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity shifter is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_op: in std_logic_vector(1 downto 0);
		I_input: in std_logic_vector(XLEN-1 downto 0);
		I_count: in std_logic_vector(4 downto 0);
		O_data: out std_logic_vector(XLEN-1 downto 0)
	);
end shifter;


architecture Behavioral of shifter is
begin
	--process(I_clk)
	process(I_clk, I_en, I_op, I_input, I_count)
	begin
		if rising_edge(I_clk) and I_en = '1' then
		
			case I_op is
		
				when SHIFTER_SLL =>
					O_data <= std_logic_vector(shift_left(unsigned(I_input),to_integer(unsigned(I_count))));
				
				when SHIFTER_SRL =>
					O_data <= std_logic_vector(shift_right(unsigned(I_input),to_integer(unsigned(I_count))));
				
				when SHIFTER_SRA =>
					O_data <= std_logic_vector(shift_right(signed(I_input),to_integer(unsigned(I_count))));
	
				when others =>
					null;
				
			end case;
			
--			if I_op = SHIFTER_SLL then
--					O_data <= std_logic_vector(shift_left(unsigned(I_input),to_integer(unsigned(I_count))));
--			elsif I_op = SHIFTER_SRL then
--					O_data <= std_logic_vector(shift_right(unsigned(I_input),to_integer(unsigned(I_count))));
--			else -- SHIFTER_SRA
--					O_data <= std_logic_vector(shift_right(signed(I_input),to_integer(unsigned(I_count))));
--			end if;
		
		end if;
	end process;
end Behavioral;