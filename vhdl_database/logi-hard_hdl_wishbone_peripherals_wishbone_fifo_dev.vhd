

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
use work.utils_pack.all ;


--! peripheral with fifo interface to the logic
--! fifo B can be written from logic and read from bus
--! fifo A can be written from bus and read from logic
entity wishbone_fifo is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			SIZE	: positive	:= 128; --! fifo depth
			B_BURST_SIZE : positive := 4;
			A_BURST_SIZE : positive := 4;
			SYNC_LOGIC_INTERFACE : boolean := false;
			AUTO_INC : boolean := false
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
	wrB, rdA : in std_logic ; --! logic side fifo control signal
	inputB: in std_logic_vector((WIDTH - 1) downto 0); --! data input of fifo B
	outputA	: out std_logic_vector((WIDTH - 1) downto 0); --! data output of fifo A
	emptyA, fullA, emptyB, fullB, burst_available_B, burst_available_A	:	out std_logic; --! fifo state signals
	fifoA_reset, fifoB_reset : out std_logic
);
end wishbone_fifo;



architecture RTL of wishbone_fifo is

constant address_space_nbit : integer := MAX((nbit(B_BURST_SIZE)+1), 3);
signal fifoA_wr, fifoB_rd, srazA, srazB : std_logic ;
signal fifoA_in,  fifoB_out : std_logic_vector((WIDTH - 1) downto 0 ); 
signal nb_availableA, nb_availableB  :  unsigned((WIDTH - 1) downto 0 ); 
signal nb_availableA_latched, nb_availableB_latched : std_logic_vector((WIDTH - 1) downto 0  );
signal data_bus_out_t	: std_logic_vector((WIDTH - 1) downto 0); 
signal access_addr, access_addr_old : std_logic ;
signal addr_inc : std_logic ;
signal write_ack, read_ack : std_logic ;
signal gls_resetn : std_logic ;
signal control_latched : std_logic_vector(15 downto 0) ;
signal control_data : std_logic_vector(15 downto 0) ;
signal fifo_data : std_logic_vector(15 downto 0) ;
signal data_access : std_logic ;
begin

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


fifo_A : dp_fifo -- write from bus, read from logic
	generic map(N => SIZE , W => WIDTH, SYNC_RD => SYNC_LOGIC_INTERFACE, SYNC_WR => false)
	port map(
 		clk => gls_clk, resetn => gls_resetn , sraz => srazA , 
 		wr => fifoA_wr, rd => rdA,
		empty => emptyA,
		full => fullA ,
 		data_out => outputA , 
 		data_in => fifoA_in ,
		nb_available => nb_availableA(nbit(SIZE)   downto 0)
	); 
	
fifo_B : dp_fifo -- read from bus, write from logic
	generic map(N => SIZE , W => WIDTH, SYNC_WR => SYNC_LOGIC_INTERFACE, SYNC_RD => AUTO_INC)
	port map(
 		clk => gls_clk, resetn => gls_resetn , sraz => srazB , 
 		wr => wrB, rd => fifoB_rd,
		empty => emptyB,
		full => fullB ,
 		data_out => fifoB_out , 
 		data_in => inputB ,
		nb_available => nb_availableB(nbit(SIZE)  downto 0)
	); 


nb_availableB_latched  <= std_logic_vector(nb_availableB) ;	  
nb_availableA_latched <= std_logic_vector(nb_availableA) ;

nb_availableB((WIDTH - 1) downto (nbit(SIZE) + 1)) <= (others => '0') ;
nb_availableA((WIDTH - 1) downto (nbit(SIZE) + 1)) <= (others => '0') ;


control_data <= std_logic_vector(to_unsigned(SIZE, 16)) when wbs_address(1 downto 0)= "00" else
				( nb_availableA_latched) when  wbs_address(1 downto 0)= "01" else
				( nb_availableB_latched) when wbs_address(1 downto 0)= "10"  else
				fifoB_out when wbs_address((address_space_nbit-1)) = '1' and wbs_address(1 downto 0)= "11" else -- peek !
				(others => '0');

fifo_data <= fifoB_out ;
				
				
--wbs_readdata <= control_latched when  wbs_address((address_space_nbit-1)) = '1' else
--					 fifo_data ; 
--
--
--fifoB_rd <= addr_inc when wbs_address((address_space_nbit-1)) = '0' and wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' else
--				'0' ;

wbs_readdata <= control_latched when wbs_address((address_space_nbit-1)) = '1' else --data_access = '0' else
					 fifo_data ; 

gen_auto_inc : if AUTO_INC = true generate
	fifoB_rd <= addr_inc when data_access = '1' and wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' else
				'0' ;
end generate ;

gen_no_auto_inc : if AUTO_INC = false generate
	fifoB_rd <= '1' when wbs_address((address_space_nbit-1)) = '0'  and wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' else
				'0' ;
end generate ;


				
fifoA_wr <= '1' when wbs_address((address_space_nbit-1)) = '0' and (wbs_strobe and wbs_write and wbs_cycle)= '1' else
				'0' ;
	
srazA <= '1' when wbs_strobe = '1' and wbs_write = '1' and wbs_cycle = '1' and wbs_address(address_space_nbit-1) = '1' and wbs_address(1 downto 0) = "01" else
			'0' ;

srazB <= '1' when wbs_strobe = '1' and wbs_write = '1' and wbs_cycle = '1' and wbs_address(address_space_nbit-1) = '1' and wbs_address(1 downto 0) = "10" else
			'0' ;

fifoA_reset <= srazA ;
fifoB_reset <= srazB ;

				
fifoA_in <= wbs_writedata ;

burst_available_B <= '1' when nb_availableB_latched > B_BURST_SIZE else
							'0' ;
							
burst_available_A <= '1' when nb_availableA_latched > A_BURST_SIZE else
							'0' ;



-- Following block takes care of generating reads when the wishbone bus generates burst
access_addr <= wbs_address(0) ;
process(gls_reset, gls_clk)
begin
	if gls_reset = '1' then
		access_addr_old <= '0';
	elsif gls_clk'event and gls_clk = '1' then
		access_addr_old <= access_addr ;
	end if ;
end process ;
addr_inc <= '1' when access_addr /= access_addr_old and read_ack = '1' else
				'0' ;
				
-- Following block takes care of correctly addressing fifo in burst mode. 
-- Address can be increase up to the control memory area without losing 2bytes on last read 				
-- Following block is a RS latch to latch current addressing mode control/data
process(gls_reset, gls_clk)
begin
	if gls_reset = '1' then
		data_access <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		if( wbs_strobe = '1' and wbs_cycle = '1' and wbs_address((address_space_nbit-1)) = '0') then
			data_access <= '1' ;
		elsif (wbs_strobe = '0' or wbs_cycle = '0') then
			data_access <= '0' ;
		end if ;
	end if ;
end process ;				
				


end RTL;

