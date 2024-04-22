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
-- Modified so PS/2 keys map to modern PS/2 keyboard
--		It was just to painful to figure out where they keys go otherwise
--
--	Harder to fix some keys that are shifted or not shifted differently between UK101 and PS2
--		UK101		Shift	Letter			PS2	Shift	Issue
--		(6)(3)	No		- (minus)		4e		No		OK
--		(6)(3)	Yes	= (equal			55		No		Issue due to shift (use shift -)
--		(6)(4)	No		: (colon)		52		Yes	Issue due to shift
--		(6)(4)	Yes	* (star)			3e		No		Issue due to shift
--		(5)(5)	No		L (letter)		4b		No		OK
--		(5)(5)	Yes	\ (backslash)	5d		No		Issue due to shift
--		(1)(2)	No		; (semicolon)	4c		No		OK
--		(1)(2)	Yes	+ (plus)			55		Yes	OK
--		(2)(2)	No		M (letter)		3a		No		OK
--		(2)(2)	Yes	] (left sq)		5b		No		Issue due to shift
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
signal keyb_data			:	std_logic_vector(7 downto 0);
signal keyb_valid			:	std_logic;
signal keyb_error			:	std_logic;

-- Internal signals
type key_matrix is array (7 downto 0) of std_logic_vector(7 downto 0);
signal keys					: key_matrix;
signal keyPressed_n	: std_logic;
signal extended			: std_logic;
signal shiftPressed		: std_logic;

signal FNkeysSig			: std_logic_vector(12 downto 0) := (others => '0');
signal FNtoggledKeysSig	: std_logic_vector(12 downto 0) := (others => '0');

-- Signal Tap Logic Analyzer signals
attribute syn_keep	: boolean;
attribute syn_keep of keyb_valid			: signal is true;
attribute syn_keep of keyb_data			: signal is true;
attribute syn_keep of A						: signal is true;
attribute syn_keep of KEYB					: signal is true;
attribute syn_keep of keys					: signal is true;
attribute syn_keep of keyPressed_n	: signal is true;
attribute syn_keep of shiftPressed		: signal is true;

begin	

	ps2 : ps2_intf port map (
		CLK, nRESET,
		PS2_CLK, PS2_DATA,
		keyb_data, keyb_valid, keyb_error
		);

	shiftPressed <= not(keys(0)(2) and keys(0)(1));
	
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

	process(nRESET,CLK)
	begin
		if nRESET = '0' then
			keyPressed_n <= '0';
			extended <= '0';
	
			keys(0) <= "11111110";			-- Shift lock is on, others are off
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
				elsif keyb_data = X"f0" then	-- Release code follows
					keyPressed_n <= '1';
--					keys(0) <= "11111110";			-- Shift lock is on, others are off
					keys(1) <= (others => '1');
					keys(2) <= (others => '1');
					keys(3) <= (others => '1');
					keys(4) <= (others => '1');
					keys(5) <= (others => '1');
					keys(6) <= (others => '1');
					keys(7) <= (others => '1');
				else
					-- Set shift pressesd, cancel extended/release1 flags for next time
					keyPressed_n <= '0';
					extended <= '0';
				
					case keyb_data&shiftPressed is				  -- Value on UK101 keyboard
						when X"16"&'0' => keys(7)(7) <= keyPressed_n; -- 1
						when X"16"&'1' => keys(7)(7) <= keyPressed_n; -- !
						when X"1e"&'0' => keys(7)(6) <= keyPressed_n; -- 2
						when X"52"&'1' => keys(7)(6) <= keyPressed_n; -- " double quote
						when X"26"&'0' => keys(7)(5) <= keyPressed_n; -- 3
						when X"26"&'1' => keys(7)(5) <= keyPressed_n; -- # pound
						when X"25"&'0' => keys(7)(4) <= keyPressed_n; -- 4
						when X"25"&'1' => keys(7)(4) <= keyPressed_n; -- $ dollar
						when X"2e"&'0' => keys(7)(3) <= keyPressed_n; -- 5		
						when X"2e"&'1' => keys(7)(3) <= keyPressed_n; -- % percent
						when X"36"&'0' => keys(7)(2) <= keyPressed_n; -- 6
						when X"3d"&'1' => keys(7)(2) <= keyPressed_n; -- & ampersand
						when X"3d"&'0' => keys(7)(1) <= keyPressed_n; -- 7
						when X"0e"&'1' => keys(7)(1) <= keyPressed_n; -- ' single quote
						
						when X"3e"&'0' => keys(6)(7) <= keyPressed_n; -- 8
						when X"46"&'1' => keys(6)(7) <= keyPressed_n; -- (
						when X"46"&'0' => keys(6)(6) <= keyPressed_n; -- 9
						when X"45"&'1' => keys(6)(6) <= keyPressed_n; -- )
						when X"45"&'0' => keys(6)(5) <= keyPressed_n; -- 0/0
--						when X"45"&'1' => keys(6)(5) <= keyPressed_n; -- 0/0
						when X"4c"&'1' => keys(6)(4) <= keyPressed_n; -- : colon
						when X"3e"&'1' => keys(6)(4) <= keyPressed_n; -- * star
						when X"4e"&'0' => keys(6)(3) <= keyPressed_n; -- - minus
						when X"4e"&'1' => keys(6)(3) <= keyPressed_n; -- = equal
						when X"66"&'0' => keys(6)(2) <= keyPressed_n; -- Backspace
						when X"66"&'1' => keys(6)(2) <= keyPressed_n; -- Backspace
						
						when X"49"&'0' => keys(5)(7) <= keyPressed_n; -- . period)
						when X"49"&'1' => keys(5)(7) <= keyPressed_n; -- >
						when X"4b"&'0' => keys(5)(6) <= keyPressed_n; -- L
						when X"f0"&'1' => keys(5)(6) <= keyPressed_n; -- \
						when X"44"&'0' => keys(5)(5) <= keyPressed_n; -- O
						when X"44"&'1' => keys(5)(5) <= keyPressed_n; -- O
						when X"63"&'0' => keys(5)(4) <= keyPressed_n; -- up arrow
						when X"62"&'1' => keys(5)(4) <= keyPressed_n; -- up arror
						when X"5a"&'0' => keys(5)(3) <= keyPressed_n; -- ENTER
						when X"5a"&'1' => keys(5)(3) <= keyPressed_n; -- ENTER
						
						when X"1d"&'0' => keys(4)(7) <= keyPressed_n; -- W
						when X"1d"&'1' => keys(4)(7) <= keyPressed_n; -- W
						when X"24"&'0' => keys(4)(6) <= keyPressed_n; -- E
						when X"24"&'1' => keys(4)(6) <= keyPressed_n; -- E
						when X"2d"&'0' => keys(4)(5) <= keyPressed_n; -- R
						when X"2d"&'1' => keys(4)(5) <= keyPressed_n; -- R
						when X"2c"&'0' => keys(4)(4) <= keyPressed_n; -- T				
						when X"2c"&'1' => keys(4)(4) <= keyPressed_n; -- T				
						when X"35"&'0' => keys(4)(3) <= keyPressed_n; -- Y
						when X"35"&'1' => keys(4)(3) <= keyPressed_n; -- Y
						when X"3c"&'0' => keys(4)(2) <= keyPressed_n; -- U
						when X"3c"&'1' => keys(4)(2) <= keyPressed_n; -- U
						when X"43"&'0' => keys(4)(1) <= keyPressed_n; -- I
						when X"43"&'1' => keys(4)(1) <= keyPressed_n; -- I
						
						when X"1b"&'0' => keys(3)(7) <= keyPressed_n; -- S
						when X"1b"&'1' => keys(3)(7) <= keyPressed_n; -- S
						when X"23"&'0' => keys(3)(6) <= keyPressed_n; -- D
						when X"23"&'1' => keys(3)(6) <= keyPressed_n; -- D
						when X"2b"&'0' => keys(3)(5) <= keyPressed_n; -- F
						when X"2b"&'1' => keys(3)(5) <= keyPressed_n; -- F
						when X"34"&'0' => keys(3)(4) <= keyPressed_n; -- G
						when X"34"&'1' => keys(3)(4) <= keyPressed_n; -- G
						when X"33"&'0' => keys(3)(3) <= keyPressed_n; -- H
						when X"33"&'1' => keys(3)(3) <= keyPressed_n; -- H
						when X"3b"&'0' => keys(3)(2) <= keyPressed_n; -- J
						when X"3b"&'1' => keys(3)(2) <= keyPressed_n; -- LF - no key
						when X"42"&'0' => keys(3)(1) <= keyPressed_n; -- K
						when X"54"&'1' => keys(3)(1) <= keyPressed_n; -- [

						when X"22"&'0' => keys(2)(7) <= keyPressed_n; -- X
						when X"22"&'1' => keys(2)(7) <= keyPressed_n; -- X
						when X"21"&'0' => keys(2)(6) <= keyPressed_n; -- C
						when X"21"&'1' => keys(2)(6) <= keyPressed_n; -- ETX ?
						when X"2a"&'0' => keys(2)(5) <= keyPressed_n; -- V
						when X"2a"&'1' => keys(2)(5) <= keyPressed_n; -- V
						when X"32"&'0' => keys(2)(4) <= keyPressed_n; -- B
						when X"32"&'1' => keys(2)(4) <= keyPressed_n; -- B
						when X"31"&'0' => keys(2)(3) <= keyPressed_n; -- N
						when X"31"&'1' => keys(2)(3) <= keyPressed_n; -- N
						when X"3a"&'0' => keys(2)(2) <= keyPressed_n; -- M
						when X"5b"&'1' => keys(2)(2) <= keyPressed_n; -- ]
--						when X"5b"&'1' => keys(2)(2) <= keyPressed_n; -- ]
						when X"41"&'0' => keys(2)(1) <= keyPressed_n; -- ,
						when X"41"&'1' => keys(2)(1) <= keyPressed_n; -- <
						
						when X"15"&'0' => keys(1)(7) <= keyPressed_n; -- Q
						when X"15"&'1' => keys(1)(7) <= keyPressed_n; -- Q
						when X"1c"&'0' => keys(1)(6) <= keyPressed_n; -- A
						when X"1c"&'1' => keys(1)(6) <= keyPressed_n; -- A
						when X"1a"&'0' => keys(1)(5) <= keyPressed_n; -- Z
						when X"1a"&'1' => keys(1)(5) <= keyPressed_n; -- Z
						when X"29"&'0' => keys(1)(4) <= keyPressed_n; -- SPACE
						when X"29"&'1' => keys(1)(4) <= keyPressed_n; -- SPACE
						when X"4a"&'0' => keys(1)(3) <= keyPressed_n; -- / slash
						when X"4a"&'1' => keys(1)(3) <= keyPressed_n; -- ? question mark
						when X"4c"&'0' => keys(1)(2) <= keyPressed_n; -- ; semi colon
						when X"55"&'1' => keys(1)(2) <= keyPressed_n; -- + plus
						when X"4d"&'0' => keys(1)(1) <= keyPressed_n; -- P
						when X"1e"&'1' => keys(1)(1) <= keyPressed_n; -- @ at sign
						
						when X"14"&'0' => keys(0)(6) <= keyPressed_n; -- CTRL
						when X"14"&'1' => keys(0)(6) <= keyPressed_n; -- CTRL
						when X"12"&'0' => keys(0)(2) <= keyPressed_n; -- Left shift
						when X"12"&'1' => keys(0)(2) <= keyPressed_n; -- Left shift
						when X"59"&'0' => keys(0)(1) <= keyPressed_n; -- Right shift
						when X"59"&'1' => keys(0)(1) <= keyPressed_n; -- Right shift

						when X"58"&'0' => 
						if keyPressed_n = '0' then
							keys(0)(0) <= not (keys(0)(0)); 		-- Caps lock toggles
						end if;
						
						when X"05"&'0' => --F1 
						FNkeysSig(1) <= keyPressed_n;
						if keyPressed_n = '0' then
							FNtoggledKeysSig(1) <= not FNtoggledKeysSig(1);
						end if;
--						when X"06" => --F2 
--						FNkeysSig(2) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(2) <= not FNtoggledKeysSig(2);
--						end if;
--						when X"04" => --F3 
--						FNkeysSig(3) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(3) <= not FNtoggledKeysSig(3);
--						end if;
--						when X"0C" => --F4 
--						FNkeysSig(4) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(4) <= not FNtoggledKeysSig(4);
--						end if;
--						when X"03" => --F5 
--						FNkeysSig(5) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(5) <= not FNtoggledKeysSig(5);
--						end if;
--						when X"0B" => --F6 
--						FNkeysSig(6) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(6) <= not FNtoggledKeysSig(6);
--						end if;
--						when X"83" => --F7 
--						FNkeysSig(7) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(7) <= not FNtoggledKeysSig(7);
--						end if;
--						when X"0A" => --F8 
--						FNkeysSig(8) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(8) <= not FNtoggledKeysSig(8);
--						end if;
--						when X"01" => --F9 
--						FNkeysSig(9) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(9) <= not FNtoggledKeysSig(9);
--						end if;
--						when X"09" => --F10 
--						FNkeysSig(10) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(10) <= not FNtoggledKeysSig(10);
--						end if;
--						when X"78" => --F11
--						FNkeysSig(11) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(11) <= not FNtoggledKeysSig(11);
--						end if;
--						when X"07" => --F12 
--						FNkeysSig(12) <= keyPressed_n;
--						if keyPressed_n = '0' then
--							FNtoggledKeysSig(12) <= not FNtoggledKeysSig(12);
--						end if;

						
						-- Cursor keys - these are actually extended (E0 xx), but
						-- the scancodes for the numeric keypad cursor keys are
						-- are the same but without the extension, so we'll accept
						-- the codes whether they are extended or not
	--					when X"6B" => keys(0)(0) <= keyPressed_n; -- Left
	--					when X"72" => keys(0)(0) <= keyPressed_n; -- Down
	--					when X"75" => keys(0)(0) <= keyPressed_n; -- Up
	--					when X"74" => keys(0)(0) <= keyPressed_n; -- Right
						
						when others =>
							null;
					end case;
				end if;
			end if;
		end if;
	end process;

end architecture;
