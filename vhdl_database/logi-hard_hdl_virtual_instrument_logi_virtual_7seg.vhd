

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
-- Create Date:    15:25:53 12/17/2013 
-- Design Name: 
-- Module Name:    logi_virtual_7seg - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logi_virtual_7seg is

generic(
		  wb_size : natural := 16 ;-- Data port size for wishbone
		  fade_cycle : positive := 3_600_000
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
		  --cathodes : in std_logic_vector(8 downto 0); -- common cathode
		  --anodes : in std_logic_vector(8 downto 0)
		  cathodes : in std_logic_vector(7 downto 0); -- common cathode
		  anodes : in std_logic_vector(7 downto 0)
	 );
end logi_virtual_7seg;

architecture Behavioral of logi_virtual_7seg is
	type u32_array is array (0 to 7) of std_logic_vector(31 downto 0);
	type u8_array is array (0 to 7) of std_logic_vector(7 downto 0);
	signal counter_array : u32_array ; 
	signal seg_states : u8_array ;
	
	signal read_ack : std_logic ;
	signal write_ack : std_logic ;
begin


-- sgement behavior, register loaded on cathode = '0' then value is kept until 
-- the fade counter reaches 0
gen_segi : for i in 0 to 7 generate
	process(gls_clk, gls_reset)
	begin
		if gls_reset = '1' then
			counter_array(i) <= (others => '0') ;
			seg_states(i) <= (others => '0');
		elsif gls_clk'event and gls_clk = '1' then
			if cathodes(i) = '0' then
				seg_states(i) <= anodes ;
				counter_array(i) <= std_logic_vector(to_unsigned(fade_cycle, 32));
			elsif counter_array(i) > 0 then
				counter_array(i) <= counter_array(i)  - 1 ;
			else
				seg_states(i) <= (others => '0') ;
				counter_array(i) <= (others => '0') ;
			end if ;
		end if ;
	
	end process ;
end generate ;


wbs_ack <= read_ack or write_ack;

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
		  wbs_readdata <= seg_states(conv_integer(wbs_address & '1')) & seg_states(conv_integer(wbs_address & '0')) ; -- this is not clear if this should only happen in the read part
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
		  
    end if;
end process read_bloc;


end Behavioral;

