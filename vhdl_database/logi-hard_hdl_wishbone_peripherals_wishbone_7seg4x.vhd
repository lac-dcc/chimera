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
-- Description: 4 sseg slave module.  Recieve 4x sseg values that will be used on LOGi-EDU board
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


library work ;
use work.logi_utils_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wishbone_7seg4x is

generic(
		  wb_size : natural := 16; -- Data port size for wishbone
		  clock_freq_hz : natural := 100_000_000;
		  refresh_rate_hz : natural := 100
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
		  -- SSEG to EDU from Host
		  sseg_cathode_out : out std_logic_vector(4 downto 0); -- common cathode
		  sseg_anode_out : out std_logic_vector(7 downto 0) -- sseg anode	  
	 );
end wishbone_7seg4x;

architecture Behavioral of wishbone_7seg4x is

	constant clk_divider : positive := clock_freq_hz/(refresh_rate_hz*5);
	--sseg register data
	signal sseg_edu_regs: slv16_array(0 to 2);

	signal read_ack : std_logic ;
	signal write_ack : std_logic ;
	
	signal divider_counter : std_logic_vector(nbit(clk_divider)-1 downto 0);
	signal divider_end : std_logic ;
	signal cathode_buffer : std_logic_vector(4 downto 0);
begin

wbs_ack <= read_ack or write_ack;

--WBM-WRITE 
write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';  
		  sseg_edu_regs <= (others => (others => '0')) ;
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
				sseg_edu_regs(conv_integer(wbs_address(1 downto 0))) <= wbs_writedata;
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
			wbs_readdata <= sseg_edu_regs(conv_integer(wbs_address)) ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;


-- sseg logic

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		divider_counter <= std_logic_vector(to_unsigned(clk_divider, nbit(clk_divider)));
	elsif gls_clk'event and gls_clk = '1' then
		if divider_counter = 0 then
			divider_counter <= std_logic_vector(to_unsigned(clk_divider, nbit(clk_divider)));
		else
			divider_counter <= divider_counter - 1 ;
		end if ;
	end if ;
end process ;

divider_end <= '1' when divider_counter = 0 else
					'0' ;



process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		cathode_buffer(0) <= '1' ;
		cathode_buffer(4 downto 1) <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
		if divider_end = '1' then
			cathode_buffer(4 downto 1) <= cathode_buffer(3 downto 0);
			cathode_buffer(0) <= cathode_buffer(4);
		end if ;
	end if ;
end process ;





with cathode_buffer select
	sseg_anode_out <= sseg_edu_regs(0)(7 downto 0) when 	"00001",
								 sseg_edu_regs(0)(15 downto 8) when "00010",
								 sseg_edu_regs(1)(7 downto 0) when 	"00100",
								 sseg_edu_regs(1)(15 downto 8) when "01000",
								 sseg_edu_regs(2)(7 downto 0) when 	"10000",
								 (others => '0') when others ;
								 
								 
sseg_cathode_out <= cathode_buffer ;

end Behavioral;

