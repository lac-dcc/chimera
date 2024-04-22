

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
-- Create Date:    16:53:16 03/11/2013 
-- Design Name: 
-- Module Name:    interrupt_manager_peripheral - Behavioral 
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



-- vector interrupt can manage up to 8 interrupt source.
-- the vector is orgnized as follow, each interrupt source takes two bits, 
-- lower one for interrupt state, higher one for interrupt enable
entity wishbone_interrupt_manager is
generic(NB_INTERRUPT_LINES : positive := 3; 
		  NB_INTERRUPTS : positive := 1; 
		  ADDR_WIDTH : positive := 16;
		  DATA_WIDTH : positive := 16);
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	-- Wishbone signals
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( DATA_WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( DATA_WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
	
	interrupt_lines : out std_logic_vector(0 to NB_INTERRUPT_LINES-1);
	interrupts_req : in std_logic_vector(0 to NB_INTERRUPTS-1)
	
	);
end wishbone_interrupt_manager;

architecture RTL of wishbone_interrupt_manager is

signal write_ack, read_ack : std_logic ;
signal write_sig, read_sig : std_logic ;

signal interrupt_registers_d : std_logic_vector(DATA_WIDTH-1 downto 0); 
signal enabled_interrupts : std_logic_vector(0 to NB_INTERRUPTS-1);
begin


write_sig  <= wbs_strobe and wbs_write and wbs_cycle ;
write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if (write_sig = '1' ) then
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;

read_sig <= wbs_strobe  and (not wbs_write) and wbs_cycle ;
read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
        if read_sig = '1' then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;


gen_registers : for i in 0 to NB_INTERRUPTS-1 generate
	 process (gls_clk, gls_reset)
		begin
		  if gls_reset = '1' then
				interrupt_registers_d(i*2) <= '0' ;
				interrupt_registers_d((i*2)+1) <= '0' ;
		  elsif gls_clk'event and gls_clk = '1' then
				if write_sig = '1' then
					 interrupt_registers_d(i*2) <= wbs_writedata(i*2);
					 interrupt_registers_d((i*2)+1) <= wbs_writedata((i*2)+1);
				elsif interrupts_req(i) = '1' then
					interrupt_registers_d((i*2)+1) <= '1' ;
				end if;
		  end if;
	 end process;
	 
	 --interrupt is triggedred only if enabled and interrupt line high, synchronous
	 enabled_interrupts(i) <= interrupt_registers_d((i*2)+1) and interrupt_registers_d(i*2) ;
 end generate;
	
wbs_readdata <= interrupt_registers_d ;
	

	
gen_ints : for i in 0 to NB_INTERRUPT_LINES-1 generate
	 interrupt_lines(i) <= '0' when enabled_interrupts((i*NB_INTERRUPTS/NB_INTERRUPT_LINES) to (((i+1)*NB_INTERRUPTS/NB_INTERRUPT_LINES)-1)) /= 0 else
								  '1' ;
 end generate;		 



end RTL;

