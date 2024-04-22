library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package arbiter_types is
	constant ARB_DEVICES: integer := 8;
	type arb_ACK_I_t is array(0 to ARB_DEVICES-1) of std_logic;
	type arb_DAT_I_t is array(0 to ARB_DEVICES-1) of std_logic_vector(7 downto 0);
	type arb_STB_O_t is array(0 to ARB_DEVICES-1) of std_logic;
end package;


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.arbiter_types.ALL;


entity arbiter_wb8 is

	Port(
		ADR_I: in std_logic_vector(31 downto 0);
		ACK_I: in arb_ACK_I_t;
		DAT_I: in arb_DAT_I_t;
		STB_I: in std_logic := '0';
		ACK_O: out std_logic := '0';
		DAT_O: out std_logic_vector(7 downto 0);
		STB_O: out arb_STB_O_t
	);
end arbiter_wb8;


architecture Behavioral of arbiter_wb8 is
begin
	process(ADR_I, STB_I, DAT_I, ACK_I)
		variable device: integer range 0 to ARB_DEVICES-1;
	begin
		
		for i in 0 to ARB_DEVICES-1 loop
			STB_O(i) <= '0';
		end loop;
		
		device := to_integer(unsigned(ADR_I(31 downto 28)));
		STB_O(device) <= STB_I;
		DAT_O <= DAT_I(device);
		ACK_O <= ACK_I(device);

	end process;
end Behavioral;