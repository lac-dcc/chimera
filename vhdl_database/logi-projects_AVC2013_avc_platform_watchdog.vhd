----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:49:01 06/02/2013 
-- Design Name: 
-- Module Name:    watchdog - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;

entity watchdog is
generic (NB_CHANNEL : positive := 7; DIVIDER : positive := 1000 ;TIMEOUT : positive := 16000);
port(clk, resetn : in std_logic;
	  cs, wr : in std_logic ;
	  enable_channels : out std_logic_vector(NB_CHANNEL-1 downto 0);
	  status : out std_logic
	  );
end watchdog;


architecture Behavioral of watchdog is
signal count_divider : std_logic_vector(nbit(DIVIDER)-1 downto 0);
signal count_timeout : std_logic_vector(nbit(TIMEOUT)-1 downto 0);
signal reset_watchdog, reset_watchdog_old, reset_watchdog_rising_edge : std_logic ;
signal enable, enable_count : std_logic ;
begin

reset_watchdog <= wr and cs ;

process(clk, resetn)
begin
	if resetn = '0' then
		reset_watchdog_old <= '0' ;
	elsif clk'event and clk = '1' then 
		reset_watchdog_old <= reset_watchdog;
	end if;
end process ;
reset_watchdog_rising_edge <= (NOT reset_watchdog_old) and reset_watchdog ;

process(clk, resetn)
begin
	if resetn = '0' then
		count_divider <= std_logic_vector(to_unsigned(DIVIDER, nbit(DIVIDER))) ;
	elsif clk'event and clk = '1' then 
		if count_divider /= 0 then
			count_divider <= count_divider - 1 ;
		else
			count_divider <= std_logic_vector(to_unsigned(DIVIDER, nbit(DIVIDER))) ;
		end if ;
	end if;
end process ;
enable_count <= '1' when count_divider = 0 else
					 '0' ;
					 
					 
process(clk, resetn)
begin
	if resetn = '0' then
		count_timeout <= std_logic_vector(to_unsigned(TIMEOUT, nbit(TIMEOUT))) ;
	elsif clk'event and clk = '1' then 
		if reset_watchdog_rising_edge = '1' then
			count_timeout <= std_logic_vector(to_unsigned(TIMEOUT, nbit(TIMEOUT))) ;
		elsif count_timeout /= 0 and enable_count = '1' then
			count_timeout <= count_timeout - 1 ;
		end if ;
	end if;
end process ;
enable <= '1' when count_timeout /= 0 else
			 '0' ;
			 
process(clk, resetn)
begin
	if resetn = '0' then
		status <= '0';
	elsif clk'event and clk = '1' then 
		if reset_watchdog_rising_edge = '1' then
			status <= '0' ;
		elsif count_timeout = 0 then
			status <= '1' ;
		end if ;
	end if;
end process ;			 
			 
			 
gen_outputs :for i in 0 to (NB_CHANNEL-1) generate	 
	enable_channels(i) <= enable ;		 
end generate ;


end Behavioral;

