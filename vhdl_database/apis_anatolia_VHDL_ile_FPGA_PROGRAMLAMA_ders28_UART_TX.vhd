----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Mehmet Burak AYKENAR
-- 
-- Create Date:    17:10:35 04/03/2017 
-- Design Name: 
-- Module Name:    UART_TX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_TX is
generic (
CLK_FREQ: integer := 100_000_000;
BAUD	: integer := 115_200;
DBIT	: integer := 8;
SB_TICK	: integer := 2
);
port (
CLK				: in std_logic;
TX_START		: in std_logic;
DIN				: in std_logic_vector (7 downto 0);
TX_DONE_TICK	: out std_logic;
TX				: out std_logic
);
end UART_TX;

architecture Behavioral of UART_TX is

constant s_reg_lim	: integer := CLK_FREQ/BAUD;
constant SB_TICK_lim: integer := s_reg_lim*SB_TICK;

type states is (idle, start, data, stop);
signal state : states := idle;
signal s_reg	: integer range 0 to SB_TICK_lim := 0;
signal n_reg 	: integer range 0 to 7	:= 0;
signal b_reg 	: std_logic_vector (7 downto 0 ) := (others => '0');
signal tx_reg	: std_logic	:= '1';
signal tx_done_tick_reg	: std_logic	:= '0';

begin

process (clk)
begin
if (clk'event and clk = '1') then
	
	case state is
		
		when idle	=>
	
			tx_done_tick_reg	<= '0';
			tx_reg	<= '1';
			if (tx_start = '1') then
				state		<= start;
				s_reg		<= 0;
				b_reg		<= din;
			end if;
		
		when start	=>
			
			tx_reg	 <= '0';
			if (s_reg = s_reg_lim-1) then
				state	 		<= data;
				s_reg 			<= 0;
				n_reg			<= 0;
			else
				s_reg			<= s_reg + 1;
			end if;
		
		when data	=>
		
			tx_reg	<= b_reg(0);
			
			if (s_reg = s_reg_lim-1) then
				s_reg 	<= 0;
				b_reg	<= ('0' & b_reg(7 downto 1));
				if (n_reg = (DBIT-1)) then
					state 	<= stop;
				else
					n_reg		<= n_reg + 1;
				end if;
			else
				s_reg <= s_reg + 1;
			end if;
		
		when stop	=>
		
			tx_reg <= '1';
			if (s_reg = (SB_TICK_lim-1)) then
				state 			<= idle;
				tx_done_tick_reg 	<= '1';
			else
				s_reg <= s_reg + 1;
			end if;
		
	end case;
	
end if;
end process;


tx	<= tx_reg;
tx_done_tick	<= tx_done_tick_reg;

end Behavioral;