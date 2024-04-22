-- This file was created and maintaned by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/    
-- and to the UK101 page at http://searle.hostei.com/grant/uk101FPGA/index.html
--
-- Please check on the above web pages to see if there are any updates before using this file.
-- If for some reason the page is no longer available, please search for "Grant Searle"
-- on the internet to see if I have moved to another web hosting service.
--
-- Grant Searle
-- eMail address available on my main web page link above.

-- Adapted from a creation by Mike Stirling.
-- Modifications are copyright by Grant Searle 2014.

-- Original copyright message shown below:

-- ZX Spectrum for Altera DE1
--
-- Copyright (c) 2009-2011 Mike Stirling
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
--
-- * Redistributions in synthesized form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
--
-- * Neither the name of the author nor the names of other contributors may
--   be used to endorse or promote products derived from this software without
--   specific prior written agreement from the author.
--
-- * License is granted for non-commercial use only.  A fee may not be charged
--   for redistributions as source code or in synthesized/hardware form without 
--   specific prior written agreement from the author.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--

-- PS/2 scancode to Spectrum matrix conversion
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UK101keyboard is
port (
	CLK			:	in	std_logic;
	nRESET		:	in	std_logic;

	-- PS/2 interface
	PS2_CLK		:	in	std_logic;
	PS2_DATA	:	in	std_logic;
	
	-- select bus
	A			:	in	std_logic_vector(7 downto 0);
	-- matrix return
	KEYB		:	out	std_logic_vector(7 downto 0);
	
	-- miscellaneous
	-- FN keys passed out as general signals (momentary and toggled versions)
	FNkeys	: out std_logic_vector(12 downto 0);
	FNtoggledKeys	: out std_logic_vector(12 downto 0)
	);
end UK101keyboard;

architecture rtl of UK101keyboard is

-- PS/2 interface
component ps2_intf is
generic (filter_length : positive := 8);
port(
	CLK			:	in	std_logic;
	nRESET		:	in	std_logic;
	
	-- PS/2 interface (could be bi-dir)
	PS2_CLK		:	in	std_logic;
	PS2_DATA	:	in	std_logic;
	
	-- Byte-wide data interface - only valid for one clock
	-- so must be latched externally if required
	DATA		:	out	std_logic_vector(7 downto 0);
	VALID		:	out	std_logic;
	ERROR		:	out	std_logic
	);
end component;

-- Interface to PS/2 block
signal keyb_data	:	std_logic_vector(7 downto 0);
signal keyb_valid	:	std_logic;
signal keyb_error	:	std_logic;

-- Internal signals
type key_matrix is array (7 downto 0) of std_logic_vector(7 downto 0);
signal keys		:	key_matrix;
signal release	:	std_logic;
signal extended	:	std_logic;
signal shiftPressed : std_logic;

signal FNkeysSig	: std_logic_vector(12 downto 0) := (others => '0');
signal FNtoggledKeysSig	: std_logic_vector(12 downto 0) := (others => '0');

begin	

	ps2 : ps2_intf port map (
		CLK, nRESET,
		PS2_CLK, PS2_DATA,
		keyb_data, keyb_valid, keyb_error
		);

	shiftPressed <= keys(0)(2) or keys(0)(1);
	
	FNkeys <= FNkeysSig;
	FNtoggledKeys <= FNtoggledKeysSig;
	
	-- Output addressed matrix row/col
	-- Original monitor scans for more than one row at a time, so more than one address may be low !
	KEYB(0) <= (keys(0)(0) or A(0)) and (keys(1)(0) or A(1)) and (keys(2)(0) or A(2)) and (keys(3)(0) or A(3)) and (keys(4)(0) or A(4)) and (keys(5)(0) or A(5)) and (keys(6)(0) or A(6)) and (keys(7)(0) or A(7));
	KEYB(1) <= (keys(0)(1) or A(0)) and (keys(1)(1) or A(1)) and (keys(2)(1) or A(2)) and (keys(3)(1) or A(3)) and (keys(4)(1) or A(4)) and (keys(5)(1) or A(5)) and (keys(6)(1) or A(6)) and (keys(7)(1) or A(7));
	KEYB(2) <= (keys(0)(2) or A(0)) and (keys(1)(2) or A(1)) and (keys(2)(2) or A(2)) and (keys(3)(2) or A(3)) and (keys(4)(2) or A(4)) and (keys(5)(2) or A(5)) and (keys(6)(2) or A(6)) and (keys(7)(2) or A(7));
	KEYB(3) <= (keys(0)(3) or A(0)) and (keys(1)(3) or A(1)) and (keys(2)(3) or A(2)) and (keys(3)(3) or A(3)) and (keys(4)(3) or A(4)) and (keys(5)(3) or A(5)) and (keys(6)(3) or A(6)) and (keys(7)(3) or A(7));
	KEYB(4) <= (keys(0)(4) or A(0)) and (keys(1)(4) or A(1)) and (keys(2)(4) or A(2)) and (keys(3)(4) or A(3)) and (keys(4)(4) or A(4)) and (keys(5)(4) or A(5)) and (keys(6)(4) or A(6)) and (keys(7)(4) or A(7));
	KEYB(5) <= (keys(0)(5) or A(0)) and (keys(1)(5) or A(1)) and (keys(2)(5) or A(2)) and (keys(3)(5) or A(3)) and (keys(4)(5) or A(4)) and (keys(5)(5) or A(5)) and (keys(6)(5) or A(6)) and (keys(7)(5) or A(7));
	KEYB(6) <= (keys(0)(6) or A(0)) and (keys(1)(6) or A(1)) and (keys(2)(6) or A(2)) and (keys(3)(6) or A(3)) and (keys(4)(6) or A(4)) and (keys(5)(6) or A(5)) and (keys(6)(6) or A(6)) and (keys(7)(6) or A(7));
	KEYB(7) <= (keys(0)(7) or A(0)) and (keys(1)(7) or A(1)) and (keys(2)(7) or A(2)) and (keys(3)(7) or A(3)) and (keys(4)(7) or A(4)) and (keys(5)(7) or A(5)) and (keys(6)(7) or A(6)) and (keys(7)(7) or A(7));

--	KEYB <= keys(0) when A(0) = '0' else
--		keys(1) when A(1) = '0' else
--		keys(2) when A(2) = '0' else
--		keys(3) when A(3) = '0' else
--		keys(4) when A(4) = '0' else
--		keys(5) when A(5) = '0' else
--		keys(6) when A(6) = '0' else
--		keys(7) when A(7) = '0' else
--		(others => '1');

	process(nRESET,CLK)
	begin
		if nRESET = '0' then
			release <= '0';
			extended <= '0';
	
			keys(0) <= "11111110";
			keys(1) <= (others => '1');
			keys(2) <= (others => '1');
			keys(3) <= (others => '1');
			keys(4) <= (others => '1');
			keys(5) <= (others => '1');
			keys(6) <= (others => '1');
			keys(7) <= (others => '1');
		elsif rising_edge(CLK) then
			if keyb_valid = '1' then
				if keyb_data = X"e0" then
					-- Extended key code follows
					extended <= '1';
				elsif keyb_data = X"f0" then
					-- Release code follows
					release <= '1';
				else
					-- Cancel extended/release flags for next time
					release <= '0';
					extended <= '0';
				
					case keyb_data is					
					
--					when X"0e" => keys(0)(0) <= release; -- pipe
					when X"16" => keys(7)(7) <= release; -- 1
					when X"1e" => keys(7)(6) <= release; -- 2
					when X"26" => keys(7)(5) <= release; -- 3
					when X"25" => keys(7)(4) <= release; -- 4
					when X"2e" => keys(7)(3) <= release; -- 5			
					when X"36" => keys(7)(2) <= release; -- 6
					when X"3d" => keys(7)(1) <= release; -- 7
					when X"3e" => keys(6)(7) <= release; -- 8
					when X"46" => keys(6)(6) <= release; -- 9
					when X"45" => keys(6)(5) <= release; -- 0
					when X"4e" => keys(6)(4) <= release; -- -
					when X"55" => keys(6)(3) <= release; -- =
					when X"66" => keys(6)(2) <= release; -- Backspace
					
--					when X"0d" => keys(0)(0) <= release; -- TAB
					when X"15" => keys(1)(7) <= release; -- Q
					when X"1d" => keys(4)(7) <= release; -- W
					when X"24" => keys(4)(6) <= release; -- E
					when X"2d" => keys(4)(5) <= release; -- R
					when X"2c" => keys(4)(4) <= release; -- T				
					when X"35" => keys(4)(3) <= release; -- Y
					when X"3c" => keys(4)(2) <= release; -- U
					when X"43" => keys(4)(1) <= release; -- I
					when X"44" => keys(5)(5) <= release; -- O
					when X"4d" => keys(1)(1) <= release; -- P
					when X"54" => keys(5)(4) <= release; -- [
--					when X"5b" => keys(0)(0) <= release; -- ]
					when X"5a" => keys(5)(3) <= release; -- ENTER
					
					when X"58" => 
					if release = '0' then
						keys(0)(0) <= not (keys(0)(0)); -- Caps lock
					end if;
					when X"1c" => keys(1)(6) <= release; -- A
					when X"1b" => keys(3)(7) <= release; -- S
					when X"23" => keys(3)(6) <= release; -- D
					when X"2b" => keys(3)(5) <= release; -- F
					when X"34" => keys(3)(4) <= release; -- G
					when X"33" => keys(3)(3) <= release; -- H
					when X"3b" => keys(3)(2) <= release; -- J
					when X"42" => keys(3)(1) <= release; -- K
					when X"4b" => keys(5)(6) <= release; -- L
					when X"4c" => keys(1)(2) <= release; -- ;
					when X"52" => keys(6)(1) <= release; -- '
					when X"5d" => keys(6)(1) <= release; -- #

					when X"12" => keys(0)(2) <= release; -- Left shift
					when X"1a" => keys(1)(5) <= release; -- Z
					when X"22" => keys(2)(7) <= release; -- X
					when X"21" => keys(2)(6) <= release; -- C
					when X"2a" => keys(2)(5) <= release; -- V
					when X"32" => keys(2)(4) <= release; -- B
					when X"31" => keys(2)(3) <= release; -- N
					when X"3a" => keys(2)(2) <= release; -- M
					when X"41" => keys(2)(1) <= release; -- ,
					when X"49" => keys(5)(7) <= release; -- .
					when X"4a" => keys(1)(3) <= release; -- /
					when X"59" => keys(0)(1) <= release; -- Right shift
					
--					when X"76" => keys(0)(0) <= release; -- Escape
					when X"29" => keys(1)(4) <= release; -- SPACE
					when X"14" => keys(0)(6) <= release; -- CTRL

					when X"05" => --F1 
					FNkeysSig(1) <= release;
					if release = '0' then
						FNtoggledKeysSig(1) <= not FNtoggledKeysSig(1);
					end if;
					when X"06" => --F2 
					FNkeysSig(2) <= release;
					if release = '0' then
						FNtoggledKeysSig(2) <= not FNtoggledKeysSig(2);
					end if;
					when X"04" => --F3 
					FNkeysSig(3) <= release;
					if release = '0' then
						FNtoggledKeysSig(3) <= not FNtoggledKeysSig(3);
					end if;
					when X"0C" => --F4 
					FNkeysSig(4) <= release;
					if release = '0' then
						FNtoggledKeysSig(4) <= not FNtoggledKeysSig(4);
					end if;
					when X"03" => --F5 
					FNkeysSig(5) <= release;
					if release = '0' then
						FNtoggledKeysSig(5) <= not FNtoggledKeysSig(5);
					end if;
					when X"0B" => --F6 
					FNkeysSig(6) <= release;
					if release = '0' then
						FNtoggledKeysSig(6) <= not FNtoggledKeysSig(6);
					end if;
					when X"83" => --F7 
					FNkeysSig(7) <= release;
					if release = '0' then
						FNtoggledKeysSig(7) <= not FNtoggledKeysSig(7);
					end if;
					when X"0A" => --F8 
					FNkeysSig(8) <= release;
					if release = '0' then
						FNtoggledKeysSig(8) <= not FNtoggledKeysSig(8);
					end if;
					when X"01" => --F9 
					FNkeysSig(9) <= release;
					if release = '0' then
						FNtoggledKeysSig(9) <= not FNtoggledKeysSig(9);
					end if;
					when X"09" => --F10 
					FNkeysSig(10) <= release;
					if release = '0' then
						FNtoggledKeysSig(10) <= not FNtoggledKeysSig(10);
					end if;
					when X"78" => --F11
					FNkeysSig(11) <= release;
					if release = '0' then
						FNtoggledKeysSig(11) <= not FNtoggledKeysSig(11);
					end if;
					when X"07" => --F12 
					FNkeysSig(12) <= release;
					if release = '0' then
						FNtoggledKeysSig(12) <= not FNtoggledKeysSig(12);
					end if;

					
					-- Cursor keys - these are actually extended (E0 xx), but
					-- the scancodes for the numeric keypad cursor keys are
					-- are the same but without the extension, so we'll accept
					-- the codes whether they are extended or not
--					when X"6B" => keys(0)(0) <= release; -- Left
--					when X"72" => keys(0)(0) <= release; -- Down
--					when X"75" => keys(0)(0) <= release; -- Up
--					when X"74" => keys(0)(0) <= release; -- Right
					
					when others =>
						null;
					end case;
				end if;
			end if;
		end if;
	end process;

end architecture;
