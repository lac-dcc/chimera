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

-------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:53 12/17/2013 
-- Design Name: 
-- Module Name:    
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
-- Description: NES (nintendo) controller wishbone driver to access NES data from the EDU board
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wishbone_nes is

generic(
		  wb_size : natural := 16; -- Data port size for wishbone
		  N: integer :=  17		--17 bit overflow 131k
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
		
		--nes data signals
			nes1_dat : in std_logic;
			nes2_dat : in std_logic;
			nes_lat : out std_logic;
			nes_clk : out std_logic;
			nes1_data_out: out std_logic_vector(7 downto 0);
			nes2_data_out: out std_logic_vector(7 downto 0)
	  
	 );
end wishbone_nes;

architecture Behavioral of wishbone_nes is

	signal read_ack : std_logic ;
	signal write_ack : std_logic ;
	
	signal nes1_data_out_buf: std_logic_vector(7 downto 0);
	signal nes2_data_out_buf: std_logic_vector(7 downto 0);
begin

wbs_ack <= read_ack or write_ack;

--WBM-WRITE 
write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';  
		  --sseg_edu_regs <= (others => (others => '0')) ;	--RESET REGISTERS HERE
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
				--sseg_edu_regs(conv_integer(wbs_address(1 downto 0))) <= wbs_writedata; --WRITE TO REGISTERS HERE
            write_ack <= '1'; 
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;

--WBM-READ
read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
			wbs_readdata <= nes2_data_out_buf & nes1_data_out_buf;		--MASTER READ FROM REGISTERS HERE
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;



nes1: entity work.nes_ctl
	port map(
			clk => gls_clk,
			reset => gls_reset,
			nes_dat => nes1_dat,
			nes_lat => nes_lat,
			nes_clk => nes_clk,	
			nes_data_out =>  nes1_data_out_buf
	);

	
nes2: entity work.nes_ctl
	port map(
			clk => gls_clk,
			reset => gls_reset,
			nes_dat => nes2_dat,
			nes_lat => open,
			nes_clk => open,	
			nes_data_out =>  nes2_data_out_buf
	);
	

nes1_data_out <= nes1_data_out_buf;
nes2_data_out <= nes2_data_out_buf;


end Behavioral;