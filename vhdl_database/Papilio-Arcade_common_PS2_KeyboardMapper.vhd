-- (C) Rui T. Sousa from http://sweet.ua.pt/~a16360

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity KeyboardMapper is
	port (
		Clock     : in  std_logic;
		Reset     : in  std_logic;
		PS2Busy   : in  std_logic;
		PS2Error  : in  std_logic;
		DataReady : in  std_logic;
		DataByte  : in  std_logic_vector(7 downto 0);
		Send      : out std_logic;
		Command   : out std_logic_vector(7 downto 0);
		CodeReady : out std_logic;
		ScanCode  : out std_logic_vector(9 downto 0)
	);
end KeyboardMapper;

-- ScanCode(9) = 1 -> Extended
--             = 0 -> Regular (Not Extended)
-- ScanCode(8) = 1 -> Break
--             = 0 -> Make
-- ScanCode(7 downto 0) -> Key Code

architecture Behavioral of KeyboardMapper is

	type StateType is (ResetKbd, ResetAck, WaitForBAT, Start, Extended, ExtendedBreak, Break, LEDs, CheckAck);
	signal State      : StateType;
	signal CapsLock   : STD_LOGIC;
	signal NumLock    : STD_LOGIC;
	signal ScrollLock : STD_LOGIC;
--	signal PauseON    : STD_LOGIC;
--	signal i          : natural range 0 to 7;
	signal KbdFound 	: std_logic := '0';
begin

	process(Reset, PS2Error, Clock)
	begin
		if Reset = '1' or PS2Error = '1' then
			CapsLock <= '0';
			NumLock <= '0';
			ScrollLock <= '0';
--			PauseON <= '0';
--			i <= 0;
			Send <= '0';
			Command <= (others => '0');
			CodeReady <= '0';
			ScanCode <= (others => '0');
			KbdFound <= '0';
			State <= Start;
		elsif rising_edge(Clock) then
			case State is
				when ResetKbd =>
					if PS2Busy = '0' then
						Send <= '1';
						Command <= x"FF";
						State <= ResetAck;
					end if;
				when ResetAck =>
					Send <= '0';
					if Dataready = '1' then
						if DataByte = x"FA" then
							State <= WaitForBAT;
						else
							State <= ResetKbd;
						end if;
					end if;
				when WaitForBAT =>
					if DataReady = '1' then
						if DataByte = x"AA" then -- BAT(self test) completed successfully
							State <= Start;
							KbdFound <= '1';
						else
							State <= ResetKbd;
						end if;
					end if;
				when Start =>
					CodeReady <= '0';
					if DataReady = '1' then
						case DataByte is
							when x"E0" =>
								State <= Extended;
							when x"F0" =>
								State <= Break;
							when x"FA" => --Acknowledge
								null;
							when x"AA" =>  
								State <= Start;
							when x"FC" =>
								State <= ResetKbd;
							when x"58" =>
									Send <= '1';
									Command <= x"ED";
									CapsLock <= not CapsLock;
									ScanCode <= "00" & DataByte;
									CodeReady <= '1';
									State <= LEDs;
							when x"77" =>
									Send <= '1';
									Command <= x"ED";
									NumLock <= not NumLock;
									ScanCode <= "00" & DataByte;
									CodeReady <= '1';
									State <= LEDs;
							when x"7E" =>
									Send <= '1';
									Command <= x"ED";
									ScrollLock <= not ScrollLock;
									ScanCode <= "00" & DataByte;
									CodeReady <= '1';
									State <= LEDs;
							when others =>
								ScanCode <= "00" & DataByte;
								CodeReady <= '1';
								State <= Start;
						end case;
					end if;
				when Extended =>
					if DataReady = '1' then
						if DataByte = x"F0" then
							State <= ExtendedBreak;
						else
							ScanCode <= "10" & DataByte;
							CodeReady <= '1';
							State <= Start;
						end if;
					end if;
				when ExtendedBreak =>
					if DataReady = '1' then
						ScanCode <= "11" & DataByte;
						CodeReady <= '1';
						State <= Start;
					end if;
				when Break =>
					if DataReady = '1' then
						ScanCode <= "01" & DataByte;
						CodeReady <= '1';
						State <= Start;
					end if;
				when LEDs =>
					Send <= '0';
					CodeReady <= '0';
					if Dataready = '1' then
						if DataByte = x"FA" then
							Send <= '1';
							Command <= "00000" & CapsLock & NumLock & ScrollLock;
							State <= CheckAck;
						elsif DataByte = x"FE" then
							Send <= '1';
						end if;
					end if;
				when CheckAck =>
					Send <= '0';
					if Dataready = '1' then
						if DataByte = x"FA" then
							State <= Start;
						elsif DataByte = x"FE" then
							Send <= '1';
						end if;
					end if;
				when others => null;
			end case;
		end if;
	end process;

end Behavioral;