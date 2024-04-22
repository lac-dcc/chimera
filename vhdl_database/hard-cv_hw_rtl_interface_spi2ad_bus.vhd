----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:45:03 06/19/2012 
-- Design Name: 
-- Module Name:    muxed_addr_interface - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

library work ;
use work.utils_pack.all ;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


--This component generates the addr/data bus from spi commands
-- communication is made in 16 bit per word in mode 0 at max speed 50Mhz (for now)
-- The first written byte is interprated as follow:
-- [15 : 3] 14 bit bus address
-- [1] : on for auto increment address, zero otherwise
-- [0] : one if read, zero if write
entity spi2ad_bus is
generic(ADDR_WIDTH : positive := 16 ; DATA_WIDTH : positive := 16 ; BIG_ENDIAN : boolean := true);
port(clk, resetn : in std_logic ;
	  mosi, ss, sck : in std_logic;
	  miso : out std_logic;
	  data_bus_out	: out	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  data_bus_in	: in	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr_bus	:	out	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wr, rd	:	out	std_logic
);
end spi2ad_bus;


architecture RTL of spi2ad_bus is

signal bit_count : std_logic_vector(3 downto 0) ;
signal data_byte : std_logic ;
signal data_in_sr, data_out_sr, addr_bus_latched : std_logic_vector(15 downto 0);
signal data_in_latched : std_logic_vector(15 downto 0);
signal data_out_temp : std_logic_vector(15 downto 0);
signal auto_inc, rd_wrn, data_confn : std_logic ; 
signal wr_latched,  rd_latched : std_logic ;
begin


process(sck, ss)
begin
if ss = '1' then
	data_in_sr <= (others => '0') ;
	bit_count <= (others => '0') ;
elsif sck'event and sck = '1' then
	data_in_sr(0) <= mosi ;
	data_in_sr(15 downto 1) <= data_in_sr(14 downto 0) ;
	bit_count <= bit_count + 1 ;
end if ;
end process ;

process(sck, ss)
begin
if ss = '1' then
	data_out_sr <= (others => '0') ;
--elsif sck'event and sck = '0' then
elsif sck'event and sck = '1' then
	if bit_count = 0 then
		data_out_sr(15 downto 1) <= data_out_temp(14 downto 0) ;
		data_out_sr(0) <= '0' ;
	else
		data_out_sr(15 downto 1) <= data_out_sr(14 downto 0) ;
		data_out_sr(0) <= '0' ;
	end if ;
end if ;
end process ;

miso <= data_out_temp(15) when  bit_count = 0 else 
		  data_out_sr(15);


process(sck, ss)
begin
	if ss = '1' then
		data_confn <= '0' ;
		auto_inc <= '0' ;
		rd_wrn <= '0' ;
		--data_in_latched <= (others => '0') ;
	elsif sck'event and sck = '1' then
		if data_confn = '0' and bit_count = 15 then
			addr_bus_latched <= "00" & data_in_sr(14 downto 1);
			auto_inc <= data_in_sr(0) ;
			rd_wrn <=  mosi ;
			data_confn <= '1' ;
		elsif data_confn = '1' and bit_count = 15 then
			data_in_latched <= data_in_sr(14 downto 0) &  mosi;
		end if ;
		
		if auto_inc = '1' and data_confn = '1' and bit_count = 7  then
			if rd_wrn = '1' or (rd_wrn = '0' and data_byte = '1') then
				addr_bus_latched <= addr_bus_latched + 1 ;
			end if;
		end if ;
		
	end if ;
end process ;


process(sck, ss)
begin
	if ss = '1' then
		data_byte <= '0' ;
		wr_latched <= '0' ;
		rd_latched <= '0' ;
	elsif sck'event and sck = '1' then
		if data_confn = '1' and rd_wrn = '0' and bit_count = 15 then
			wr_latched <= '1' ;
			data_byte <= '1' ;
		else
			wr_latched <= '0' ;
		end if ;
		
		if data_confn = '1' and bit_count = 1 and rd_wrn = '1' then
			rd_latched <= '1' ;
		else
			rd_latched <= '0' ;
		end if ;

	end if ;
end process ;


gen_le : if (NOT BIG_ENDIAN) generate
	data_out_temp <= data_bus_in ;
	data_bus_out <= data_in_latched ;
end generate ;

gen_be : if BIG_ENDIAN generate
	data_out_temp <= data_bus_in(7 downto 0) & data_bus_in(15 downto 8) ;
	data_bus_out <= data_in_latched(7 downto 0) & data_in_latched(15 downto 8);
end generate ;


process(clk, resetn)
begin
	if resetn = '0' then
		--addr_bus <= (others => '0');
		wr <= '0' ;
		rd <= '0' ;
	elsif clk'event and clk = '1' then
		--addr_bus <= addr_bus_latched ;
		wr <= wr_latched ;
		rd <= rd_latched ;
	end if ;
end process ;
addr_bus <= addr_bus_latched ;

end RTL ;