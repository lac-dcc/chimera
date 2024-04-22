library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity uart_rx is
generic (
c_clkfreq		: integer := 100_000_000;
c_baudrate		: integer := 115_200
);
port (
clk				: in std_logic;
rx_i			: in std_logic;
dout_o			: out std_logic_vector (7 downto 0);
rx_done_tick_o	: out std_logic
);
end uart_rx;

architecture Behavioral of uart_rx is

constant c_bittimerlim 	: integer := c_clkfreq/c_baudrate;

type states is (S_IDLE, S_START, S_DATA, S_STOP);
signal state : states := S_IDLE;

signal bittimer : integer range 0 to c_bittimerlim := 0;
signal bitcntr	: integer range 0 to 7 := 0;
signal shreg	: std_logic_vector (7 downto 0) := (others => '0');

begin

P_MAIN : process (clk) begin
if (rising_edge(clk)) then

	case state is
	
		when S_IDLE =>
			
			rx_done_tick_o	<= '0';
			bittimer		<= 0;
			
			if (rx_i = '0') then
				state	<= S_START;
			end if;
		
		when S_START =>
		
			if (bittimer = c_bittimerlim/2-1) then
				state		<= S_DATA;
				bittimer	<= 0;
			else
				bittimer	<= bittimer + 1;
			end if;
		
		when S_DATA =>
		
			if (bittimer = c_bittimerlim-1) then
				if (bitcntr = 7) then
					state	<= S_STOP;
					bitcntr	<= 0;
				else
					bitcntr	<= bitcntr + 1;
				end if;
				shreg		<= rx_i & (shreg(7 downto 1));
				bittimer	<= 0;
			else
				bittimer	<= bittimer + 1;
			end if;
		
		when S_STOP =>
		
			if (bittimer = c_bittimerlim-1) then
				state			<= S_IDLE;
				bittimer		<= 0;
				rx_done_tick_o	<= '1';
			else
				bittimer	<= bittimer + 1;
			end if;			
	
	end case;

end if;
end process P_MAIN;

dout_o	<= shreg;

end Behavioral;