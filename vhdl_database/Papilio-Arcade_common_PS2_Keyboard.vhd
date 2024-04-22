-- (C) Rui T. Sousa from http://sweet.ua.pt/~a16360

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Keyboard is
	GENERIC(
    clk_freq              : INTEGER := 32 );-- system clock frequency in MHz
	port (
		Reset     : in    std_logic;
		Clock     : in    std_logic;
		PS2Clock  : inout std_logic;
		PS2Data   : inout std_logic;
		CodeReady : out   std_logic;
		ScanCode  : out   std_logic_vector(9 downto 0)
	);
end Keyboard;

architecture Behavioral of Keyboard is

	signal Send      : std_logic;
	signal Command   : std_logic_vector(7 downto 0);
	signal PS2Busy   : std_logic;
	signal PS2Error  : std_logic;
	signal DataReady : std_logic;
	signal DataByte  : std_logic_vector(7 downto 0);

begin

	PS2_Controller: entity work.PS2Controller
	generic map (clk_freq => clk_freq)
	port map (
		Reset     => Reset,
		Clock     => Clock,
		PS2Clock  => PS2Clock,
		PS2Data   => PS2Data,
		Send      => Send,
		Command   => Command,
		PS2Busy   => PS2Busy,
		PS2Error  => PS2Error,
		DataReady => DataReady,
		DataByte  => DataByte
	);

	Keyboard_Mapper: entity work.KeyboardMapper
	port map (
		Clock     => Clock,
		Reset     => Reset,
		PS2Busy   => PS2Busy,
		PS2Error  => PS2Error,
		DataReady => DataReady,
		DataByte  => DataByte,
		Send      => Send,
		Command   => Command,
		CodeReady => CodeReady,
		ScanCode  => ScanCode
	);

end Behavioral;
