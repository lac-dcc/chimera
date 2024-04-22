-------------------------------------------------------------------------------
--
-- Title       : inbuf_half_path
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Simple input buffer with split & delay
-- 
-- Version 1.0 : 03.11.2017
--			   	 Description: Single input buffer w/o interleave modes.
--
--    Input data: {Re/Im} flow (w/o interleave mode)
--    Output data: {Re/Im} flow (as inputs)
--    Signle clock for input and output.
--
-- Example: ADDR = 3: (NFFT = (2^ADDR) = 8 points)
--
-- Timing diagram:
--
-- Input strobes: 
--        DI: ..0..123..4..5.6..7..0123..4.56.7....... > (0 to N-1),
--
-- Output strobes:
--  1st - DA: ...................0123..........0123... > (0   to N/2-1),
--  2nd - DB: ...................4567..........4567... > (N/2 to N-1).
--
--
-- OR:
--
--
-- Input strobes: 
--        DI: ..01234567_01234567_.... > (0 to N-1),
--
-- Output strobes:
--  1st - DA: .......0123.....0123.... > (0   to N/2-1),
--  2nd - DB: .......4567.....4567.... > (N/2 to N-1).
--                           
--
-- Parameters:
--		ADDR - number of FFT/iFFT stages (butterflies), ADDR = log2(NFFT). 
--		DATA - Data width (input / output).
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

entity inbuf_half_path is
	generic (	
		ADDR		: integer:=10;   --! FFT ADDR
		DATA		: integer:=32   --! Data width		
	);
	port(
		---- Common signals ----
		clk  		: in  std_logic; --! Clock
		reset 		: in  std_logic; --! Reset			
		
		---- Input data ----
		di_dt		: in  std_logic_vector(DATA-1 downto 0); --! Data In
		di_en		: in  std_logic; --! Data enable
		---- Output data ----
		da_dt		: out std_logic_vector(DATA-1 downto 0); --! Even Data
		db_dt		: out std_logic_vector(DATA-1 downto 0); --! Odd Data
		ab_vl		: out std_logic --! Data valid		
	);	
end inbuf_half_path;

architecture inbuf_half_path of inbuf_half_path is

signal cnt					: std_logic_vector(ADDR-0 downto 0);	  
signal addr_wr				: std_logic_vector(ADDR-1 downto 0);	  

signal cnt_rd				: std_logic_vector(ADDR-1 downto 0);
signal ena_rd				: std_logic;

signal ram_wea0				: std_logic;
signal ram_wea1				: std_logic;
signal ram_wrad				: std_logic_vector(ADDR-2 downto 0);	
signal ram_rdad				: std_logic_vector(ADDR-2 downto 0);	
signal ram_dia				: std_logic_vector(DATA-1 downto 0);	
signal ram_doa				: std_logic_vector(DATA-1 downto 0);	
signal ram_dob				: std_logic_vector(DATA-1 downto 0);	
signal ram_vl				: std_logic;


-- Shared mem signal
type mem_type is array ((2**(ADDR-1))-1 downto 0) of std_logic_vector(DATA-1 downto 0);
shared variable mem0 : mem_type:=(others => (others => '0'));
shared variable mem1 : mem_type:=(others => (others => '0'));

begin	
	
pr_cnt: process(clk) is
begin
	if rising_edge(clk) then
		if (reset = '1') then
			cnt			<= (0 => '1', others => '0');		
			addr_wr		<= (others => '0');		
			cnt_rd 		<= (0 => '1', others => '0');			
			ena_rd 		<= '0';		
			ram_wea0	<= '0';		
			ram_wea1	<= '0';		
			ram_rdad	<= (others => '0');
		else
			ram_wea0 <= di_en and not addr_wr(addr_wr'left);
			ram_wea1 <= di_en and     addr_wr(addr_wr'left);			
			
			if (di_en = '1') then
				if (cnt(cnt'left) = '1') then
					cnt <= (0 => '1', others => '0');
				else				
					cnt <= cnt + '1';
				end if;
			end if;	
			
			if (di_en = '1') then
				addr_wr <= addr_wr + '1';
			end if;				

			if (ena_rd = '1') then
				if (cnt_rd(cnt_rd'left) = '1') then
					cnt_rd   <= (0 => '1', others => '0');	
					ram_rdad <= (others => '0');	
				else				
					cnt_rd   <= cnt_rd + '1';
					ram_rdad <= ram_rdad + '1';
				end if;
			else
				-- cnt_rd <= (0 => '1', others => '0');	
			end if;
			
			if (cnt(cnt'left) = '1') then
				if (di_en = '1') then
					ena_rd <= '1';
				end if;			
			elsif (cnt_rd(cnt_rd'left) = '1') then
				ena_rd <= '0';
			end if;
			
		end if;
	end if;
end process;	
	
ram_wrad <= addr_wr(addr_wr'left-1 downto 0) when rising_edge(clk);
ram_dia <= di_dt when rising_edge(clk);
ram_vl <= ena_rd when rising_edge(clk);

---- Port A write ----
pr_ram0: process(clk)
begin
    if (clk'event and clk='1') then
		if (ena_rd = '1') then		
			ram_doa <= mem0(conv_integer(ram_rdad));
		end if;			
		if (ram_wea0 = '1') then
			mem0(conv_integer(ram_wrad)) := ram_dia;
		end if;
    end if;
end process;

-- Port B write ----	
pr_ram1: process(clk)
begin
    if (clk'event and clk='1') then
		if (ena_rd = '1') then		
			ram_dob <= mem1(conv_integer(ram_rdad));
		end if;			
		if (ram_wea1 = '1') then
			mem1(conv_integer(ram_wrad)) := ram_dia;
		end if;
    end if;
end process;	

da_dt <= ram_doa when rising_edge(clk);
db_dt <= ram_dob when rising_edge(clk);
ab_vl <= ram_vl  when rising_edge(clk);

end inbuf_half_path;