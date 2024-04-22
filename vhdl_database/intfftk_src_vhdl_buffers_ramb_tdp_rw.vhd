-------------------------------------------------------------------------------
--
-- Title       : ramb_tdp_rw
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : version 1.0
--
-------------------------------------------------------------------------------
--
--	Version 1.0  29.09.2017
--			 Description: A parameterized, true dual-port, single-clock RAM.
--               Read-first mode     
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--	GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--	Copyright (c) 2018 Kapitanov Alexander
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
--  APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT 
--  HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY 
--  OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, 
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
--  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM 
--  IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF 
--  ALL NECESSARY SERVICING, REPAIR OR CORRECTION. 
-- 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity ramb_tdp_rw is
	generic (
	    DATA    : integer := 16;
	    ADDR    : integer := 10
		);
	port (
	    -- rst     : in  std_logic;
		clk     : in  std_logic;	    
		-- Port A
	    a_wr    : in  std_logic;		
	    a_rd    : in  std_logic;		
		a_addr  : in  std_logic_vector(ADDR-1 downto 0);
	    a_din   : in  std_logic_vector(DATA-1 downto 0); 
	    a_dout  : out std_logic_vector(DATA-1 downto 0); 
	    -- Port B
	    b_wr    : in  std_logic;		
	    b_rd    : in  std_logic;		
	    b_addr  : in  std_logic_vector(ADDR-1 downto 0);
	    b_din   : in  std_logic_vector(DATA-1 downto 0);
	    b_dout  : out std_logic_vector(DATA-1 downto 0)
	);
end ramb_tdp_rw;
 
architecture ramb_rtl of ramb_tdp_rw is
-- Shared mem signal
type mem_type is array ((2**ADDR)-1 downto 0) of std_logic_vector(DATA-1 downto 0);
shared variable mem : mem_type:=(others => (others => '0'));
	
-- attribute ram_style : string;
-- attribute ram_style of mem : variable is "block";

begin

---- Port A write ----
pr_wa: process(clk) is
begin
    if (clk'event and clk='1') then
		if (a_rd = '1') then		
			a_dout <= mem(conv_integer(a_addr));
		end if;
		if (a_wr = '1') then
			mem(conv_integer(a_addr)) := a_din;
		end if;	
    end if;
end process;

---- Port B write ----
pr_wb: process(clk) is
begin
    if (clk'event and clk='1') then
		if (b_rd = '1') then		
			b_dout <= mem(conv_integer(b_addr));
		end if; 
		if (b_wr = '1') then
			mem(conv_integer(b_addr)) := b_din;
		end if; 
    end if;
end process; 

end ramb_rtl;