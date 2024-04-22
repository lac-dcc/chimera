-- (C) Rui T. Sousa from http://sweet.ua.pt/~a16360

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PS2Controller is
GENERIC(
    clk_freq              : INTEGER := 32 );-- system clock frequency in MHz
    port (
		Reset     : in     std_logic;
		Clock     : in     std_logic;
		PS2Clock  : inout  std_logic;
		PS2Data   : inout  std_logic;
		Send      : in     std_logic;
		Command   : in     std_logic_vector(7 downto 0);
		PS2Busy   : out    std_logic;
		PS2Error  : buffer std_logic;
		DataReady : out    std_logic;
		DataByte  : out    std_logic_vector(7 downto 0)
	);
end PS2Controller;

architecture Behavioral of PS2Controller is

	constant ClockFreq     : natural := clk_freq; -- MHz
	constant Time100us     : natural := 100 * ClockFreq;
	constant Time20us      : natural := 20 * ClockFreq;
	constant DebounceDelay : natural := 16;
	
	type StateType is (Idle, ReceiveData, InhibitComunication, RequestToSend, SendData, CheckAck, WaitRiseClock);
	signal State            : StateType;
	signal BitsRead         : natural range 0 to 10;
	signal BitsSent         : natural range 0 to 10;
	signal Byte             : std_logic_vector(7 downto 0);
	signal CountOnes        : std_logic; -- One bit only to know if even or odd number of ones
	signal DReady           : std_logic;
	signal PS2ClockPrevious : std_logic;
	signal PS2ClockOut      : std_logic;
	signal PS2Clock_Z       : std_logic;
	signal PS2Clock_D       : std_logic;
	signal PS2DataOut       : std_logic;
	signal PS2Data_Z        : std_logic;
	signal PS2Data_D        : std_logic;	
	signal TimeCounter      : natural range 0 to Time100us;

begin

	DebounceClock: entity work.Debouncer
	generic map (Delay => DebounceDelay)
	port map (
		Clock  => Clock,
		Reset  => Reset,
		Input  => PS2Clock,
		Output => PS2Clock_D
	);

	DebounceData: entity work.Debouncer
	generic map (Delay => DebounceDelay)
	port map (
		Clock  => Clock,
		Reset  => Reset,
		Input  => PS2Data,
		Output => PS2Data_D
	);

	PS2Clock <= PS2ClockOut when PS2Clock_Z <= '0' else 'Z';
	PS2Data  <= PS2DataOut  when PS2Data_Z  <= '0' else 'Z';

	process(Reset, Clock)
	begin
		if Reset = '1' then
			PS2Clock_Z <= '1';
			PS2ClockOut <= '1';
			PS2Data_Z <= '1';
			PS2DataOut <= '1';
			DataReady <= '0';
			DReady <= '0';
			DataByte <= (others => '0');
			PS2Busy <= '0';
			PS2Error <= '0';
			BitsRead <= 0;
			BitsSent <= 0;
			CountOnes <= '0';
			TimeCounter <= 0;
			PS2ClockPrevious <= '1';
			Byte <= x"FF";
			State <= InhibitComunication;
		elsif rising_edge(Clock) then
			PS2ClockPrevious <= PS2Clock_D;
			case State is
				when Idle =>
					DataReady <= '0';
					DReady <= '0';
					BitsRead <= 0;
					PS2Error <= '0';
					CountOnes <= '0';
					if PS2Data_D = '0' then                  -- Start bit
						PS2Busy <= '1';
						State <= ReceiveData;
					elsif Send = '1' then
						Byte <= Command;
						PS2Busy <= '1';
						TimeCounter <= 0;
						State <= InhibitComunication;
					else
						State <= Idle;
					end if;
				when ReceiveData =>
					if PS2ClockPrevious = '1' and PS2Clock_D = '0' then -- falling edge
						case BitsRead is
							when 1 to 8 =>						-- 8 Data bits
								Byte(BitsRead - 1) <= PS2Data_D;
								if PS2Data_D = '1' then
									CountOnes <= not CountOnes;
								end if;
							when 9 =>							-- Parity bit
								case CountOnes is
									when '0' =>
										if PS2Data_D = '0' then
											PS2Error <= '1';	-- Error when CountOnes is even (0)
										else				    -- and parity bit is unasserted
											PS2Error <= '0';
										end if;
									when others =>
										if PS2Data_D = '1' then
											PS2Error <= '1';	-- Error when CountOnes is odd (1)
										else				    -- and parity bit is asserted
											PS2Error <= '0';
										end if;
								end case;
							when 10 =>							-- Stop bit
								if PS2Error = '0' then
									DataByte <= Byte;
									DReady <= '1';
								else
									DReady <= '0';
								end if;
								State <= WaitRiseClock;
							when others => null;
						end case;
						BitsRead <= BitsRead + 1;
					end if;
				when InhibitComunication =>
					PS2Clock_Z <= '0';
					PS2ClockOut <= '0';
					if TimeCounter = Time100us then
						TimeCounter <= 0;
						State <= RequestToSend;
					else
						TimeCounter <= TimeCounter + 1;
					end if;
				when RequestToSend =>
					PS2Clock_Z <= '1';
					PS2Data_Z <= '0';
					PS2DataOut <= '0'; -- Sets the start bit, valid when PS2Clock is high
					if TimeCounter = Time20us then
						TimeCounter <= 0;
						PS2ClockOut <= '1';
						BitsSent <= 1;
						State <= SendData;
					else
						TimeCounter <= TimeCounter + 1;
					end if;
				when SendData =>
					PS2Clock_Z <= '1';
					if PS2ClockPrevious = '1' and PS2Clock_D = '0' then -- falling edge
						case BitsSent is
							when 1 to 8 =>						-- 8 Data bits
								if Byte(BitsSent - 1) = '0' then
									PS2DataOut <= '0';
								else
									CountOnes <= not CountOnes;
									PS2DataOut <= '1';
								end if;
							when 9 =>							-- Parity bit
								if CountOnes = '0' then
									PS2DataOut <= '1';
								else
									PS2DataOut <= '0';
								end if;
							when 10 =>							-- Stop bit
								PS2DataOut <= '1';
								State <= CheckAck;
							when others => null;
						end case;
						BitsSent <= BitsSent + 1;
					end if;
				when CheckAck =>
					PS2Data_Z <= '1';
					if PS2ClockPrevious = '1' and PS2Clock_D = '0' then
						if PS2Data_D = '1' then -- no Acknowledge received
							PS2Error <= '1';
						end if;
						State <= WaitRiseClock;
					end if;
				when WaitRiseClock =>
					if PS2ClockPrevious = '0' and PS2Clock_D = '1' then
						PS2Busy <= '0';
						DataReady <= DReady;
						State <= Idle;
					end if;
				when others => null;
			end case;
		end if;
	end process;

end Behavioral;