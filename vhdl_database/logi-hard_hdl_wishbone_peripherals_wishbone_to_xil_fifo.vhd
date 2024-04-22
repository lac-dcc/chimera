

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
entity wishbone_to_xil_fifo is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			WR_FIFO_SIZE : natural := 128;
			RD_FIFO_SIZE : natural := 128
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
			
			
	-- fifo signals
	fifo_rst : out std_logic;	  
	-- write xil_fifo signals
	wr_clk : out std_logic ;
	dout : out std_logic_vector(15 downto 0);
	wr_en : out std_logic ;
	full : in std_logic ;
	wr_data_count : in std_logic_vector(15 downto 0);
	overflow : in std_logic;
	-- read xil_fifo signals
	rd_clk : out std_logic ;
	din : in std_logic_vector(15 downto 0);
	rd_en : out std_logic ;
	empty : in std_logic ;
	rd_data_count : in std_logic_vector(15 downto 0);
	underflow : in std_logic 
);
end wishbone_to_xil_fifo;



architecture RTL of wishbone_to_xil_fifo is

constant address_space_nbit : integer := MAX(nbit(WR_FIFO_SIZE), nbit(RD_FIFO_SIZE));
signal write_ack, read_ack : std_logic ;
signal gls_resetn : std_logic ;
signal control_latched : std_logic_vector(15 downto 0) ;
signal control_data, fifo_status : std_logic_vector(15 downto 0) ;
signal fifo_data : std_logic_vector(15 downto 0) ;
signal data_access : std_logic ;
signal control_space_data_spacen : std_logic ;
begin

rd_clk <= gls_clk ;
wr_clk <= gls_clk ;

gls_resetn <= NOT gls_reset ;

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
    end if;
end process write_bloc;

read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
		  control_latched  <= control_data ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;

wbs_ack <= read_ack or write_ack;


control_space_data_spacen <= wbs_address(address_space_nbit) ;

				
wbs_readdata <= control_latched when control_space_data_spacen = '1' else --data_access = '0' else
					 fifo_data ; 

rd_en <= '1' when control_space_data_spacen = '0'  and wbs_strobe = '1' and wbs_write = '0' and wbs_cycle = '1' and read_ack = '0' else
			'0' ;
		
wr_en <= '1' when control_space_data_spacen = '0' and (wbs_strobe and wbs_write and wbs_cycle)= '1' and write_ack = '0' else				
			'0' ;

with conv_integer(wbs_address(address_space_nbit-1 downto 0)) select
control_data <= std_logic_vector(to_unsigned(RD_FIFO_SIZE, 16)) when 0,
					 std_logic_vector(to_unsigned(WR_FIFO_SIZE, 16)) when 1,
					 std_logic_vector(resize(unsigned(rd_data_count), 16)) when 2,
					 std_logic_vector(resize(unsigned(wr_data_count), 16)) when 3,
					 fifo_status when others;

fifo_status <= X"000" & empty & underflow & full & overflow ;

fifo_rst <= '1' when gls_reset = '1' else
				'1' when control_space_data_spacen = '1' and (wbs_strobe and wbs_write and wbs_cycle)= '1' else
				'0' ;
dout <= wbs_writedata ;

process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        fifo_data <= (others => '0');
    elsif rising_edge(gls_clk) then
		  if control_space_data_spacen = '0'  and wbs_strobe = '1' and wbs_write = '0' and wbs_cycle = '1' and read_ack = '0' then
				fifo_data <= din ;
		  end if ;
    end if;
end process;

end RTL;

