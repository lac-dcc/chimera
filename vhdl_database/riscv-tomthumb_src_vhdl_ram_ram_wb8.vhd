library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;
use work.ram_wb8_init.all;

entity ram_wb8 is
	-- signal naming according to Wishbone B4 spec
	Port(
		CLK_I: in std_logic;
		STB_I: in std_logic;
		WE_I: in std_logic;
		ADR_I: in std_logic_vector(XLEN-1 downto 0);
		DAT_I: in std_logic_vector(7 downto 0);
		DAT_O: out std_logic_vector(7 downto 0);
		ACK_O: out std_logic
	);
end ram_wb8;


architecture Behavioral of ram_wb8 is
	signal ram: store_t := RAM_INIT;
	attribute ramstyle : string;
	attribute ramstyle of ram : signal is "no_rw_check";
begin

	process(CLK_I, STB_I)
		variable ack: std_logic := '0';
	begin
	
		if rising_edge(CLK_I) then
			ack := '0';
		
			if STB_I = '1' then
				if(WE_I = '1') then
					ram(to_integer(unsigned(ADR_I(ADDRLEN-1 downto 0)))) <= DAT_I;
				else
					DAT_O <= ram(to_integer(unsigned(ADR_I(ADDRLEN-1 downto 0))));
				end if;
				ack := '1';
			end if;
	
		end if;
		
		ACK_O <= STB_I and ack;
		
	end process;
end Behavioral;