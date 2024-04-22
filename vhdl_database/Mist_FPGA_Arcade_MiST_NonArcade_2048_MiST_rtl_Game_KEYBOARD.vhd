library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GAME_KEYBOARD is
    Port 
		( 	
			-- INPUT
			clk 				: in STD_LOGIC;
			keyboardClock 	: in STD_LOGIC;
			keyboardData 	: in STD_LOGIC;
			
			-- OUTPUT
			keyCode			: out STD_LOGIC_VECTOR(7 downto 0)
		);
end GAME_KEYBOARD;

architecture Behavioral of GAME_KEYBOARD is
	signal bitCount 		: INTEGER range 0 to 100 := 0;
	signal scanCodeReady 	: STD_LOGIC := '0';
	signal scanCode 		: STD_LOGIC_VECTOR(7 downto 0);
	signal breakReceived 	: STD_LOGIC_VECTOR(1 downto 0) := "00";
	
	-- Breakcode viene generato quando viene rilasciato il dito dal tasto della tastiera
	constant breakCode 		: STD_LOGIC_VECTOR(7 downto 0) := X"F0";
begin

	Keyboard : process(keyboardClock)
	begin
		if falling_edge(keyboardClock) 
		then
			if (bitCount = 0 and keyboardData = '0')
			then
				scanCodeReady <= '0';
				bitCount <= bitCount + 1;
			elsif bitCount > 0 and bitCount < 9 
			then
			-- si shifta di un bit lo scancode da sinistra
				scancode <= keyboardData & scancode(7 downto 1);
				bitCount <= bitCount + 1;
			-- bit di parità
			elsif (bitCount = 9)
			then
				bitCount <= bitCount + 1;
			-- fine messaggio
			elsif (bitCount = 10) 
			then
				scanCodeReady <= '1';
				bitCount <= 0;
			end if;
		end if;		
	end process Keyboard;
	
	sendData : process(scanCodeReady, scanCode)
	begin
		if (scanCodeReady'event and scanCodeReady = '1')
		then
			case breakReceived is
			when "00" => 
				if (scanCode = breakCode)
				then
					breakReceived <= "01";
				end if;
				keyCode <= scanCode;
			when "01" =>
				breakReceived <= "10";
				keyCode <= breakCode;
			when "10" => 
				breakReceived <= "00";
				keyCode <= breakCode;
			when others => 
				keyCode <= scanCode;
			end case;
		end if;
	end process sendData;

end Behavioral;
