library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity arbiter is
	Port(
		I_addr: in std_logic_vector(31 downto 0);
		I_busy0, I_busy1, I_busy2, I_busy3: in std_logic;
		I_data0, I_data1, I_data2, I_data3: in std_logic_vector(31 downto 0);
		I_en: in std_logic;
		O_busy: out std_logic := '1';
		O_data: out std_logic_vector(31 downto 0);
		O_en0, O_en1, O_en2, O_en3: out std_logic
	);
end arbiter;


architecture Behavioral of arbiter is
begin
	process(I_addr, I_en, I_data0, I_data1, I_data2, I_data3, I_busy0, I_busy1, I_busy2, I_busy3)
	begin
		if I_en = '1' then
		
			O_en0 <= '0';
			O_en1 <= '0';
			O_en2 <= '0';
			O_en3 <= '0';
		
			-- most significant nibble selects device - room for 16 devices
			case I_addr(29 downto 28) is
				when "00" =>
					O_en0 <= '1';
					O_data <= I_data0;
					O_busy <= I_busy0;
				
				when "01" =>
					O_en1 <= '1';
					O_data <= I_data1;
					O_busy <= I_busy1;
					
				when "10" =>
					O_en2 <= '1';
					O_data <= I_data2;
					O_busy <= I_busy2;
					
				when others => -- "11" presumably
					O_en3 <= '1';
					O_data <= I_data3;
					O_busy <= I_busy3;
			
			end case;		
		else
			O_en0 <= '0';
			O_en1 <= '0';
			O_en2 <= '0';
			O_en3 <= '0';
			O_data <= X"00000000";
			O_busy <= '0';

		end if;
	end process;
end Behavioral;