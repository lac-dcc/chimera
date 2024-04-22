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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wishbone_gpio is
	generic(
		  wb_size : natural := 16
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
		  gpio: inout std_logic_vector(15 downto 0)
	 );
end wishbone_gpio;

architecture Behavioral of wishbone_gpio is

	signal dir : std_logic_vector(15 downto 0) ;
	signal input : std_logic_vector(15 downto 0) ;
	signal output : std_logic_vector(15 downto 0) ;
	signal read_ack : std_logic ;
	signal write_ack : std_logic ;
begin
wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        dir <= (others => '0');
		  output <= (others => '0');
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
		  if ((wbs_strobe and wbs_write and wbs_cycle) = '1') and wbs_address(0) = '1' then
            dir <= wbs_writedata;
            write_ack <= '1';
        elsif ((wbs_strobe and wbs_write and wbs_cycle) = '1') and wbs_address(0) = '0' then
            output <= wbs_writedata;
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;

gen_tristate : for i in gpio'range generate
gpio(i) <= output(i) when dir(i) = '1' else
			  'Z' ;
end generate ;

read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
		  input <= gpio ; -- latching inputs
		  if wbs_address(0) = '0' then
			wbs_readdata <= input ; 
		  else
			wbs_readdata <= dir ;
		  end if ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) and wbs_address(0)='0' then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
		  
    end if;
end process read_bloc;



end Behavioral;

