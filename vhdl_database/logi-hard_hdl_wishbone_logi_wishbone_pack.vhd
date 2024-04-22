

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



--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package logi_wishbone_pack is

function find_X(slv : std_logic_vector) return natural;

type wishbone16_bus is
record
	address : std_logic_vector(15 downto 0);
	writedata : std_logic_vector(15 downto 0);
	readdata : std_logic_vector(15 downto 0);
	cycle: std_logic;
	write : std_logic;
	strobe : std_logic;
	ack : std_logic;
end record;


type array_of_addr is array(NATURAL range <>) of std_logic_vector(15 downto 0);
type array_of_slv16 is array(NATURAL range <>) of std_logic_vector(15 downto 0);


 component gpmc_wishbone_wrapper is
    generic(sync : boolean := false ; burst : boolean := false );
	 port
    (
      -- GPMC SIGNALS
      gpmc_ad : inout   std_logic_vector(15 downto 0);
      gpmc_csn    : in    std_logic;
      gpmc_oen    : in    std_logic;
		gpmc_wen    : in    std_logic;
		gpmc_advn    : in    std_logic;
		gpmc_clk    : in    std_logic;
		
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
end component;

component gpmc_wishbone_wrapper_aad is
	generic(
		sync : boolean := true;
		burst : boolean := false;
		addr_width : natural := 28
	);
	port (
		-- GPMC SIGNALS
		gpmc_ad    : inout std_logic_vector(15 downto 0);
		gpmc_csn   : in    std_logic;
		gpmc_oen   : in    std_logic;
		gpmc_wen   : in    std_logic;
		gpmc_advn  : in    std_logic;
		gpmc_clk   : in    std_logic;
		-- Global Signals
		gls_reset  : in std_logic;
		gls_clk    : in std_logic;
		-- Wishbone master interface signals
		wbm_address   : out std_logic_vector(ADDR_WIDTH-1 downto 0);  -- Address bus
		wbm_readdata  : in  std_logic_vector(15 downto 0);  -- Data bus for read access
		wbm_writedata : out std_logic_vector(15 downto 0);  -- Data bus for write access
		wbm_strobe    : out std_logic;                      -- Data Strobe
		wbm_write     : out std_logic;                      -- Write access
		wbm_ack       : in std_logic;                       -- acknowledge
		wbm_cycle     : out std_logic                       -- bus cycle in progress
	);
end component;
 
component spi_wishbone_wrapper is
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
end component;


component wishbone_intercon is
generic(memory_map : array_of_addr );
port(
		-- Syscon signals
		gls_reset    : in std_logic ;
		gls_clk      : in std_logic ;
		
		
		-- Wishbone slave signals
		wbs_address       : in std_logic_vector(15 downto 0) ;
		wbs_writedata : in std_logic_vector(15 downto 0);
		wbs_readdata  : out std_logic_vector(15 downto 0);
		wbs_strobe    : in std_logic ;
		wbs_cycle      : in std_logic ;
		wbs_write     : in std_logic ;
		wbs_ack       : out std_logic;
		
		-- Wishbone master signals
		wbm_address       : out array_of_slv16((memory_map'length-1) downto 0) ;
		wbm_writedata : out array_of_slv16((memory_map'length-1) downto 0);
		wbm_readdata  : in array_of_slv16((memory_map'length-1) downto 0);
		wbm_strobe    : out std_logic_vector((memory_map'length-1) downto 0) ;
		wbm_cycle     : out std_logic_vector((memory_map'length-1) downto 0) ;
		wbm_write     : out std_logic_vector((memory_map'length-1) downto 0) ;
		wbm_ack       : in std_logic_vector((memory_map'length-1) downto 0)
		
);
end component;

end logi_wishbone_pack;

package body logi_wishbone_pack is

 function find_X(slv : std_logic_vector) return natural is
	begin
	  for i in slv'range loop
		 if slv(i) ='X' then
			return i+1 ;
		 end if;
	  end loop;
  return 0;
end function find_X;

--function sim_wishbone_write(data :integer; address : integer; wish_bus : wishbone16_bus ; clk : std_logic) return natural is
--  
--	begin
--		wish_bus.cycle <= '0' ;
--		wish_bus.strobe <= '0';
--		wish_bus.write <= '0' ;
--		wish_bus.writedata <= std_logic_vector(to_unsigned(data, 16));
--		wish_bus.address <= std_logic_vector(to_unsigned(address, 16));
--		wait for rising_edge(clk);
--		wish_bus.cycle <= '1' ;
--		wish_bus.strobe <= '1';
--		wish_bus.write <= '1' ;
--		wait for wish_bus.ack = '1' ;
--		wish_bus.cycle <= '0' ;
--		wish_bus.strobe <= '0';
--		wish_bus.write <= '0' ;
--		wait for falling_edge(clk);
--		return 1;
--end function sim_wishbone_write;
--
--function sim_wishbone_write(data :integer; address : integer; wish_bus : wishbone16_bus ; clk : std_logic) return std_logic_vector(15 downto 0) is
--  
--	begin
--		wish_bus.cycle <= '0' ;
--		wish_bus.strobe <= '0';
--		wish_bus.write <= '0' ;
--		wish_bus.writedata <= std_logic_vector(to_unsigned(0, 16));
--		wish_bus.address <= std_logic_vector(to_unsigned(address, 16));
--		wait for rising_edge(clk);
--		wish_bus.cycle <= '1' ;
--		wish_bus.strobe <= '1';
--		wish_bus.write <= '0' ;
--		wait for wish_bus.ack = '1' ;
--		wish_bus.cycle <= '0' ;
--		wish_bus.strobe <= '0';
--		wish_bus.write <= '0' ;
--		wait for falling_edge(clk);
--		return wish_bus.readdata;
--end function sim_wishbone_write;

end logi_wishbone_pack;
