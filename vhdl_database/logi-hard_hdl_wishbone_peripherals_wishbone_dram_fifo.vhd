

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



----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:54:36 06/19/2012 
-- Design Name: 
-- Module Name:    fifo_peripheral - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 Spartan 6 
-- Tool versions: ISE 14.1 ISE 14.1 
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

library work ;
use work.logi_utils_pack.all ;


--! peripheral with fifo interface to the logic
--! fifo B can be written from logic and read from bus
--! fifo A can be written from bus and read from logic
entity wishbone_dram_fifo is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			SIZE	: positive	:= 128; --! fifo depth;
			BURST_SIZE : positive := 4;
			THRESHOLD : positive := 4;
			FIFO_SIZE : positive := 8_000_000;
			SYNC_LOGIC_INTERFACE : boolean := false;
			IS_READ : boolean := true ;
			sdram_address_width : positive := 24;
			CACHE_ADDRESS : std_logic_vector(31 downto 0) := (others => '0')
			); 
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	-- Wishbone signals
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
		  
	-- logic signals
	write_fifo, read_fifo : in std_logic ;
	fifo_input: in std_logic_vector((WIDTH - 1) downto 0); --! data input of fifo B
	fifo_output	: out std_logic_vector((WIDTH - 1) downto 0); --! data output of fifo A
	
	fifo_empty, fifo_full : out std_logic ;
	fifo_reset : out std_logic ;
	fifo_threshold : out std_logic;
	
	refresh_active, flush_active : out std_logic ;

	
	-- Interface to issue reads or write data
	cmd_ready         : in STD_LOGIC;                     -- '1' when a new command will be acted on
	cmd_enable        : out  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
	cmd_wr            : out  STD_LOGIC;                     -- Is this a write?
	cmd_address       : out  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
	cmd_byte_enable   : out  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
	cmd_data_in       : out  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command

	sdram_data_out         : in STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
	sdram_data_ready    : in STD_LOGIC
);
end wishbone_dram_fifo;



architecture RTL of wishbone_dram_fifo is


component dram_fifo is
generic(CACHE_SIZE : positive := 2048;
		  FIFO_SIZE : positive := 8_000_000;
		  sdram_address_width : positive := 24;
		  SYNC_READ : boolean := true;
		  SYNC_WRITE : boolean := true;
		  CACHE_ADDRESS : std_logic_vector(31 downto 0) := (others => '0'));
port(
		clk           : in  STD_LOGIC;
		reset         : in  STD_LOGIC;

		
		-- FIFO interface
		reset_fifo : in std_logic ;
		write_fifo, read_fifo : in std_logic ;
		nb_available : out std_logic_vector(31 downto 0);
		data_out : out std_logic_vector(15 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		
		refresh_active, flush_active : out std_logic ;

		-- Interface to issue reads or write data
		cmd_ready         : in STD_LOGIC;                     -- '1' when a new command will be acted on
		cmd_enable        : out  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
		cmd_wr            : out  STD_LOGIC;                     -- Is this a write?
		cmd_address       : out  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
		cmd_byte_enable   : out  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
		cmd_data_in       : out  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command

		sdram_data_out         : in STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
		sdram_data_ready    : in STD_LOGIC
);
end component;




constant address_space_nbit : integer := MAX((nbit(BURST_SIZE)+1), 3);
signal read_from_bus, write_from_bus, reset_fifo: std_logic ;
signal data_from_bus,  data_to_bus : std_logic_vector((WIDTH - 1) downto 0 ); 
signal nb_available_fifo  :  std_logic_vector(31 downto 0 ); 
signal write_ack, read_ack, read_ack_old, write_ack_old, write_ack_re, read_ack_fe : std_logic ;
signal control_latched : std_logic_vector(15 downto 0) ;
signal control_data : std_logic_vector(15 downto 0) ;
signal control_space_data_spacen : std_logic ;
begin


write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
		  write_ack_old <= write_ack ;
    end if;
end process write_bloc;
write_ack_re <= (not write_ack_old) and write_ack ;

read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        read_ack <= '0';
		  control_latched <= (others => '0');
    elsif rising_edge(gls_clk) then
		  control_latched  <= control_data ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
		  read_ack_old <= read_ack ;
    end if;
end process read_bloc;
read_ack_fe <= (not read_ack) and read_ack_old;

wbs_ack <= read_ack or write_ack;


gen_read_fifo : if IS_READ generate
fifo_read_from_bus : dram_fifo
generic map(CACHE_SIZE => 2048,
		  FIFO_SIZE => FIFO_SIZE,
		  sdram_address_width => 24,
		  SYNC_READ => false,
		  SYNC_WRITE => true,
		  CACHE_ADDRESS =>CACHE_ADDRESS)
port map(
		clk  => gls_clk,
		reset  => gls_reset,

		
		-- FIFO interface
		reset_fifo => reset_fifo,
		write_fifo => write_fifo, 
		read_fifo => read_from_bus, 
		nb_available => nb_available_fifo,
		data_out => data_to_bus, -- to bus
		data_in => fifo_input, -- from logic
		refresh_active => refresh_active,
		flush_active => flush_active,
		-- Interface to issue reads or write data
		cmd_ready      => cmd_ready,
		cmd_enable     => cmd_enable,  
		cmd_wr			=> cmd_wr,
		cmd_address		=> cmd_address,
		cmd_byte_enable => cmd_byte_enable,
		cmd_data_in		 => cmd_data_in,
		sdram_data_out	 => sdram_data_out,
		sdram_data_ready => sdram_data_ready
		);

end generate ;


gen_write_fifo : if NOT IS_READ generate
fifo_write_from_bus : dram_fifo
generic map(CACHE_SIZE => 2048,
		  FIFO_SIZE => FIFO_SIZE,
		  sdram_address_width => 24,
		  SYNC_READ => true,
		  SYNC_WRITE => false,
		  CACHE_ADDRESS =>CACHE_ADDRESS)
port map(
		clk  => gls_clk,
		reset  => gls_reset,

		
		-- FIFO interface
		reset_fifo => reset_fifo,
		write_fifo => write_from_bus, 
		read_fifo => read_fifo, 
		nb_available => nb_available_fifo,
		data_out => fifo_output, -- to logic
		data_in => data_from_bus, -- from bus
		
		refresh_active => refresh_active,
		flush_active => flush_active,
		-- Interface to issue reads or write data
		cmd_ready      => cmd_ready,
		cmd_enable     => cmd_enable,  
		cmd_wr			=> cmd_wr,
		cmd_address		=> cmd_address,
		cmd_byte_enable => cmd_byte_enable,
		cmd_data_in		 => cmd_data_in,
		sdram_data_out	 => sdram_data_out,
		sdram_data_ready => sdram_data_ready
		);
data_to_bus <= (others => '0');
end generate ;



control_space_data_spacen <= wbs_address((address_space_nbit-1)) ;

control_data <= std_logic_vector(to_unsigned(SIZE, 16)) when wbs_address(1 downto 0)= "00" else
				( nb_available_fifo(15 downto 0)) when  wbs_address(1 downto 0)= "01" else
				( nb_available_fifo(31 downto 16)) when  wbs_address(1 downto 0)= "10" else
				(others => '0');
				
wbs_readdata <= control_latched when control_space_data_spacen = '1' else 
					 data_to_bus ; 

--read_from_bus <= read_ack_fe when control_space_data_spacen = '0'  else
--					  '0' ;

read_from_bus <= '1' when control_space_data_spacen = '0'  and wbs_strobe = '1' and wbs_write = '0' and wbs_cycle = '1' else
					  '0' ;
		
	
--write_from_bus <= write_ack_re when control_space_data_spacen = '0' else
--						'0' ;

write_from_bus <= '1' when control_space_data_spacen = '0' and wbs_strobe = '1' and wbs_write = '1' and wbs_cycle = '1' else
						'0' ;
	
reset_fifo <= '1' when wbs_strobe = '1' and wbs_write = '1' and wbs_cycle = '1' and control_space_data_spacen = '1' and wbs_address(1 downto 0) = "01"else
			'1' when wbs_strobe = '1' and wbs_write = '1' and wbs_cycle = '1' and control_space_data_spacen = '1' and wbs_address(1 downto 0) = "10"else
			'0' ;
	
fifo_reset <= reset_fifo ;
	
data_from_bus <= wbs_writedata ;

fifo_threshold <= '1' when nb_available_fifo > THRESHOLD else
							'0' ;

fifo_full <= '1' when nb_available_fifo >= FIFO_SIZE else
				 '0' ;

end RTL;

