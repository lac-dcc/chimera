

-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
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
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  use IEEE.numeric_std.all;

-- ----------------------------------------------------------------------------
   entity spi_wishbone_wrapper is
-- ----------------------------------------------------------------------------
	generic(BIG_ENDIAN : boolean := true);
    port
    (
      -- SPI SIGNALS
      mosi, ss, sck : in std_logic;
	   miso : out std_logic;
		
      -- Global Signals
      gls_reset : in std_logic;
      gls_clk   : in std_logic;
      -- Wishbone interface signals
      wbm_address    : out std_logic_vector(15 downto 0);  -- Address bus
      wbm_readdata   : in  std_logic_vector(15 downto 0);  -- Data bus for read access
      wbm_writedata  : out std_logic_vector(15 downto 0);  -- Data bus for write access
      wbm_strobe     : out std_logic;                      -- Data Strobe
      wbm_write      : out std_logic;                      -- Write access
      wbm_ack        : in std_logic ;                      -- acknowledge
      wbm_cycle      : out std_logic                       -- bus cycle in progress
    );
    end entity;

-- ----------------------------------------------------------------------------
Architecture RTL of spi_wishbone_wrapper is
-- ----------------------------------------------------------------------------

signal bit_count : std_logic_vector(3 downto 0) ;
signal data_byte : std_logic ;
signal data_in_sr, data_out_sr, addr_bus_latched : std_logic_vector(15 downto 0);
signal data_in_latched : std_logic_vector(15 downto 0);
signal data_out_temp : std_logic_vector(15 downto 0);
signal auto_inc, rd_wrn, data_confn : std_logic ; 
signal wr_latched,  rd_latched : std_logic ;

signal write      : std_logic;
signal read       : std_logic;
signal strobe     : std_logic;
signal writedata  : std_logic_vector(15 downto 0);
signal address    : std_logic_vector(15 downto 0);

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
elsif sck'event and sck = '1' then -- data change should only occur on falling edge ...
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
		rd_latched <= '0' ;		
	elsif sck'event and sck = '1' then
		if data_confn = '0' and bit_count = 14 then
			addr_bus_latched <= "00" & data_in_sr(13 downto 0);-- getting address ready as early as possible to ease on reads ...
		elsif data_confn = '0' and bit_count = 15 then
			--addr_bus_latched <= "00" & data_in_sr(14 downto 1);
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
		
		if bit_count = 15 and data_confn = '0' then
			rd_latched <= mosi ;
		elsif data_confn = '1' and bit_count = 0 and rd_wrn = '1' then
			rd_latched <= '1' ;
		else
			rd_latched <= '0' ;
		end if ;
	end if ;
end process ;

-- write occurs only when in data mode
process(sck, ss)
begin
	if ss = '1' then
		data_byte <= '0' ;
		wr_latched <= '0' ;
	elsif sck'event and sck = '1' then
		if data_confn = '1' and rd_wrn = '0' and bit_count = 15 then
			wr_latched <= '1' ;
			data_byte <= '1' ;
		else
			wr_latched <= '0' ;
		end if ;
	end if ;
end process ;


gen_le : if (NOT BIG_ENDIAN) generate
	data_out_temp <= wbm_readdata ;
	writedata <= data_in_latched ;
end generate ;

gen_be : if BIG_ENDIAN generate
	data_out_temp <= wbm_readdata(7 downto 0) & wbm_readdata(15 downto 8) ;
	writedata <= data_in_latched(7 downto 0) & data_in_latched(15 downto 8);
end generate ;


process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		write <= '0' ;
		read <= '0' ;
		strobe <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		write <= wr_latched ;
		read <= rd_latched ;
		strobe <= wr_latched OR rd_latched;
	end if ;
end process ;
address <= addr_bus_latched ;


wbm_address    <= address ;
wbm_writedata  <= writedata ;
wbm_strobe     <= strobe;
wbm_write      <= write;
wbm_cycle      <= strobe;


end architecture RTL;
