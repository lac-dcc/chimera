

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
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:41 12/17/2013 
-- Design Name: 
-- Module Name:    logi_virtual_pb - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logi_virtual_pb is
generic(
		  wb_size : natural := 16  -- Data port size for wishbone
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
		  pb : out std_logic_vector(15 downto 0)
	 );
end logi_virtual_pb;

architecture Behavioral of logi_virtual_pb is
	signal reg_out_d : std_logic_vector(15 downto 0) ;
	signal read_ack : std_logic ;
	signal write_ack : std_logic ;
begin
	wbs_ack <= read_ack or write_ack;

	write_bloc : process(gls_clk,gls_reset)
	begin
		 if gls_reset = '1' then 
			  reg_out_d <= (others => '0');
			  write_ack <= '0';
		 elsif rising_edge(gls_clk) then
			  if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
					reg_out_d <= wbs_writedata;
					write_ack <= '1';
			  else
					write_ack <= '0';
			  end if;
		 end if;
	end process write_bloc;
	pb <= reg_out_d ;


	read_bloc : process(gls_clk, gls_reset)
	begin
		 if gls_reset = '1' then
			  
		 elsif rising_edge(gls_clk) then
			  if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
					read_ack <= '1';
			  else
					read_ack <= '0';
			  end if;
			  
		 end if;
	end process read_bloc;


end Behavioral;

