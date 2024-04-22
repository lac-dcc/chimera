-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, <names> All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library work ;
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_utils_pack.all ;

entity wishbone_watchdog is
	generic(
		  wb_size : natural := 16; -- Data port size for wishbone
		  watchdog_timeout_ms : positive := 1000;
		  clock_period_ns : positive := 10
	 );
	 port 
	 (
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		 
		  -- out signals
		  reset_out : out std_logic  
	 );
end wishbone_watchdog;

architecture RTL of wishbone_watchdog is
	signal read_ack : std_logic ;
	signal write_ack : std_logic ;

	-- declare your signals here
	
	constant DIVIDER : positive := 1_000_000/clock_period_ns;
	signal enable_watchdog : std_logic ;
	signal count_divider : std_logic_vector(nbit(DIVIDER)-1 downto 0);
	signal count_timeout : std_logic_vector(nbit(watchdog_timeout_ms)-1 downto 0);
	signal reset_watchdog, reset_watchdog_old, reset_watchdog_rising_edge : std_logic ;
	signal enable, enable_count : std_logic ;

begin
wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
		  enable_watchdog <= '0' ;
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
            -- complete with what to do on a write
				enable_watchdog <= wbs_writedata(0) ;
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;


read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
	 -- complete with what to do on a read
		  wbs_readdata(0) <= enable_watchdog ;
		  wbs_readdata(15 downto 1) <= (others => '0');
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
		  
    end if;
end process read_bloc;

--- watchdog logic 
reset_watchdog <= write_ack ;
process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		reset_watchdog_old <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then 
		reset_watchdog_old <= reset_watchdog;
	end if;
end process ;
reset_watchdog_rising_edge <= (NOT reset_watchdog_old) and reset_watchdog ;

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		count_divider <= std_logic_vector(to_unsigned(DIVIDER, nbit(DIVIDER))) ;
	elsif gls_clk'event and gls_clk = '1' then 
		if count_divider /= 0 then
			count_divider <= count_divider - 1 ;
		else
			count_divider <= std_logic_vector(to_unsigned(DIVIDER, nbit(DIVIDER))) ;
		end if ;
	end if;
end process ;
enable_count <= '1' when count_divider = 0 else
					 '0' ;
					 
					 
process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		count_timeout <= std_logic_vector(to_unsigned(watchdog_timeout_ms, nbit(watchdog_timeout_ms))) ;
	elsif gls_clk'event and gls_clk = '1' then 
		if reset_watchdog_rising_edge = '1' then
			count_timeout <= std_logic_vector(to_unsigned(watchdog_timeout_ms, nbit(watchdog_timeout_ms))) ;
		elsif count_timeout /= 0 and enable_count = '1' then
			count_timeout <= count_timeout - 1 ;
		end if ;
	end if;
end process ;

reset_out <= '1' when count_timeout = 0 and enable_watchdog = '1' else
			 '0' ;	 

end RTL;

