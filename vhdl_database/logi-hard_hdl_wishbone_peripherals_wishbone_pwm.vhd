

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
-- Create Date:    15:34:11 08/28/2013 
-- Design Name: 
-- Module Name:    wishbone_pwm - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.control_pack.all ;

entity wishbone_pwm is
generic( nb_chan : positive := 7;
			wb_addr_size : natural := 16; -- Address port size for wishbone
			wb_size : natural := 16  -- Data port size for wishbone
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(wb_addr_size-1 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  
		  pwm_out : out std_logic_vector(nb_chan-1 downto 0)
);
end wishbone_pwm;

architecture Behavioral of wishbone_pwm is
signal pwm_regs : slv16_array(0 to (nb_chan+1)) ;

signal read_ack : std_logic ;
signal write_ack : std_logic ;

signal reverse_outputs : std_logic_vector(0 to (nb_chan-1));

begin

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
		  wbs_readdata <= pwm_regs(conv_integer(wbs_address)) ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;


register_mngmt : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
            pwm_regs(conv_integer(wbs_address)) <= wbs_writedata;
        end if ;
    end if;
end process register_mngmt;




pwm_ctrl : pwm 
	generic map(NB_CHANNEL => nb_chan)
	port map(
	clk => gls_clk,
	resetn => (NOT gls_reset),
	divider => pwm_regs(0),
	period => pwm_regs(1),
	pulse_width => pwm_regs(2 to (2+(nb_chan-1))),
	pwm => reverse_outputs
	);


gen_reverse : for i in 0 to nb_chan-1 generate
pwm_out(i) <= reverse_outputs(i) ;
end generate ;

end Behavioral;

