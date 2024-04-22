library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity pcu is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_op: in std_logic;
		I_newPC: in std_logic_vector(XLEN-1 downto 0);
		O_PC: out std_logic_vector(XLEN-1 downto 0)
	);
end pcu;


architecture Behavioral of pcu is
begin
	process(I_clk)
		variable newpc: std_logic_vector(XLEN-1 downto 0) := XLEN_ZERO;
	begin
		if rising_edge(I_clk) and I_en = '1' then
		
				case I_op is
					when PCOP_RESET =>
						newpc := XLEN_ZERO;
					when PCOP_NEWPC =>
						newpc := I_newPC;
					when others =>
						-- ignore unknown ops
				end case;
		
				O_PC <= newpc;
	
		end if;
	end process;
end Behavioral;