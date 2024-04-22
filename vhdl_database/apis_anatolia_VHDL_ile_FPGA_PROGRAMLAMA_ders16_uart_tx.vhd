library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_tx is
generic (
c_clkfreq		: integer := 100_000_000;
c_baudrate		: integer := 115_200;
c_stopbit		: integer := 2
);
port (
clk				: in std_logic;
din_i			: in std_logic_vector (7 downto 0);
tx_start_i		: in std_logic;
tx_o			: out std_logic;
tx_done_tick_o	: out std_logic
);
end uart_tx;

architecture Behavioral of uart_tx is

constant c_bittimerlim 	: integer := c_clkfreq/c_baudrate;
constant c_stopbitlim 	: integer := (c_clkfreq/c_baudrate)*c_stopbit;

type states is (S_IDLE, S_START, S_DATA, S_STOP);
signal state : states := S_IDLE;

signal bittimer : integer range 0 to c_stopbitlim := 0;
signal bitcntr	: integer range 0 to 7 := 0;
signal shreg	: std_logic_vector (7 downto 0) := (others => '0');


begin

P_MAIN : process (clk) begin
if (rising_edge(clk)) then

	case state is
	
		when S_IDLE =>
		
			tx_o			<= '1';
			tx_done_tick_o	<= '0';
			bitcntr			<= 0;
			
			if (tx_start_i = '1') then
				state	<= S_START;
				tx_o	<= '0';
				shreg	<= din_i;
			end if;
		
		when S_START =>
		
			-- tx_o	<= '0';
			if (bittimer = c_bittimerlim-1) then
				state				<= S_DATA;
				tx_o				<= shreg(0);
				shreg(7)			<= shreg(0);
				shreg(6 downto 0)	<= shreg(7 downto 1);
				-- shreg(7 downto 1) 	<= shreg(6 downto 0);
				-- shreg(0)			<= shreg(7);
				bittimer			<= 0;
			else
				bittimer			<= bittimer + 1;
			end if;
			
		when S_DATA =>
		
			-- tx_o	<= shreg(0);
		
			if (bitcntr = 7) then
				if (bittimer = c_bittimerlim-1) then
					-- shreg(7 downto 1) 	<= shreg(6 downto 0);
					-- shreg(0)			<= shreg(7);
					bitcntr				<= 0;
					state				<= S_STOP;
					tx_o				<= '1';
					bittimer			<= 0;
				else
					bittimer			<= bittimer + 1;					
				end if;			
			else
				if (bittimer = c_bittimerlim-1) then
					-- shreg(7 downto 1) 	<= shreg(6 downto 0);
					-- shreg(0)			<= shreg(7);
					shreg(7)			<= shreg(0);
					shreg(6 downto 0)	<= shreg(7 downto 1);					
					tx_o				<= shreg(0);
					bitcntr				<= bitcntr + 1;
					bittimer			<= 0;
				else
					bittimer			<= bittimer + 1;					
				end if;
			end if;
		
		when S_STOP =>
		
			if (bittimer = c_stopbitlim-1) then
				state				<= S_IDLE;
				tx_done_tick_o		<= '1';
				bittimer			<= 0;
			else
				bittimer			<= bittimer + 1;				
			end if;		
	
	end case;

end if;
end process;


end Behavioral;