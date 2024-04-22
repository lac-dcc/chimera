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

-- Emard
-- buttons for B, C, ENTER

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

-- 4 buttons to UK101 matrix conversion
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity orao_keyboard_buttons is
generic (
        ps2set : integer := 2  -- keycode scanset
);
port (
	CLK    : in std_logic;
	nRESET : in std_logic;

	-- PS/2 interface
	PS2_CLK  : in std_logic;
	PS2_DATA : in std_logic;
	
	-- input keys
	key_b     : in std_logic;
	key_c     : in std_logic;
	key_enter : in std_logic;
	
	-- select bus
	A : in std_logic_vector(10 downto 0);
	-- matrix return
	Q : out std_logic_vector(7 downto 0);
	
	-- miscellaneous
	-- FN keys passed out as general signals (momentary and toggled versions)
	FNkeys : out std_logic_vector(12 downto 0);
	FNtoggledKeys : out std_logic_vector(12 downto 0)
	);
end orao_keyboard_buttons;

architecture rtl of orao_keyboard_buttons is

-- PS/2 interface
component ps2_intf is
generic (filter_length : positive := 8);
port(
	CLK     : in std_logic;
	nRESET  : in std_logic;
	
	-- PS/2 interface (could be bi-dir)
	PS2_CLK  : in std_logic;
	PS2_DATA : in std_logic;
	
	-- Byte-wide data interface - only valid for one clock
	-- so must be latched externally if required
	DATA  :	out std_logic_vector(7 downto 0);
	VALID :	out std_logic;
	ERROR :	out std_logic
	);
end component;

-- Interface to PS/2 block
signal keyb_data : std_logic_vector(7 downto 0);
signal keyb_valid : std_logic;
signal keyb_error : std_logic;

-- Internal signals
type key_matrix is array (10 downto 1) of std_logic_vector(7 downto 0);
signal keys : key_matrix;
signal release : std_logic;
signal extended : std_logic;
signal shiftPressed : std_logic;

signal FNkeysSig : std_logic_vector(12 downto 0) := (others => '0');
signal FNtoggledKeysSig	: std_logic_vector(12 downto 0) := (others => '0');

signal KEYB : std_logic_vector(7 downto 0);

-- PS/2 scan codes which are different in set2 and set3

-- PS/2 Set2
constant scan_zh          : std_logic_vector(7 downto 0) := x"5d";
constant scan_left_ctrl   : std_logic_vector(7 downto 0) := x"14";
constant scan_right_ctrl  : std_logic_vector(7 downto 0) := x"14"; -- extended
constant scan_ltgt        : std_logic_vector(7 downto 0) := x"5d";
constant scan_arrow_left  : std_logic_vector(7 downto 0) := x"6b";
constant scan_arrow_right : std_logic_vector(7 downto 0) := x"74";
constant scan_arrow_up    : std_logic_vector(7 downto 0) := x"75";
constant scan_arrow_down  : std_logic_vector(7 downto 0) := x"72";
constant scan_f1          : std_logic_vector(7 downto 0) := x"05";
constant scan_f2          : std_logic_vector(7 downto 0) := x"06";
constant scan_f3          : std_logic_vector(7 downto 0) := x"04";
constant scan_f4          : std_logic_vector(7 downto 0) := x"0c";

-- PS/2 Set3
--constant scan_zh          : std_logic_vector(7 downto 0) := x"5c";
--constant scan_left_ctrl   : std_logic_vector(7 downto 0) := x"11";
--constant scan_right_ctrl  : std_logic_vector(7 downto 0) := x"58";
--constant scan_ltgt        : std_logic_vector(7 downto 0) := x"13";
--constant scan_arrow_left  : std_logic_vector(7 downto 0) := x"61";
--constant scan_arrow_right : std_logic_vector(7 downto 0) := x"6a";
--constant scan_arrow_up    : std_logic_vector(7 downto 0) := x"63";
--constant scan_arrow_down  : std_logic_vector(7 downto 0) := x"60";
--constant scan_f1          : std_logic_vector(7 downto 0) := x"07";
--constant scan_f2          : std_logic_vector(7 downto 0) := x"0f";
--constant scan_f3          : std_logic_vector(7 downto 0) := x"17";
--constant scan_f4          : std_logic_vector(7 downto 0) := x"1f";

begin	

	ps2 : ps2_intf port map (
		CLK, nRESET,
		PS2_CLK, PS2_DATA,
		keyb_data, keyb_valid, keyb_error
		);

	-- shiftPressed <= keys(0)(2) or keys(0)(1);
	
	FNkeys <= FNkeysSig;
	FNtoggledKeys <= FNtoggledKeysSig;
	
	-- Output addressed matrix row/col
	-- Original monitor scans for more than one row at a time, so more than one address may be low !
	-- key(x)(y) have inverted logic. 0 when key pressed
	KEYB(0) <=  (keys( 1)(0) or A(1))
               and ((not key_enter) or A(1)) 
               and  (keys( 2)(0) or A(2))    
               and  (keys( 3)(0) or A(3))    
               and  (keys( 4)(0) or A(4))    
               and  (keys( 5)(0) or A(5))    
               and  (keys( 6)(0) or A(6))    
               and  (keys( 7)(0) or A(7))    
               and  (keys( 8)(0) or A(8))    
               and ((not key_b) or A(8))     
               and  (keys( 9)(0) or A(9))    
               and  (keys(10)(0) or A(10));  
	KEYB(1) <=   (keys( 1)(1) or A(1))
               and  (keys( 2)(1) or A(2))  
               and  (keys( 3)(1) or A(3))  
               and  (keys( 4)(1) or A(4))  
               and  (keys( 5)(1) or A(5))  
               and  (keys( 6)(1) or A(6))  
               and  (keys( 7)(1) or A(7))  
               and ((not key_c) or A(7))   
               and  (keys( 8)(1) or A(8))  
               and  (keys( 9)(1) or A(9))  
               and  (keys(10)(1) or A(10));
	KEYB(2) <= '1';
	KEYB(3) <= '1';

	KEYB(4) <= (keys( 1)(4) or A(1)) 
	       and (keys( 2)(4) or A(2)) 
	       and (keys( 3)(4) or A(3)) 
	       and (keys( 4)(4) or A(4)) 
	       and (keys( 5)(4) or A(5)) 
	       and (keys( 6)(4) or A(6)) 
	       and (keys( 7)(4) or A(7)) 
	       and (keys( 8)(4) or A(8)) 
	       and (keys( 9)(4) or A(9)) 
	       and (keys(10)(4) or A(10));
	KEYB(5) <= (keys( 1)(5) or A(1)) 
	       and (keys( 2)(5) or A(2)) 
	       and (keys( 3)(5) or A(3)) 
	       and (keys( 4)(5) or A(4)) 
	       and (keys( 5)(5) or A(5)) 
	       and (keys( 6)(5) or A(6)) 
	       and (keys( 7)(5) or A(7)) 
	       and (keys( 8)(5) or A(8)) 
	       and (keys( 9)(5) or A(9)) 
	       and (keys(10)(5) or A(10));
	KEYB(6) <= (keys( 1)(6) or A(1)) 
	       and (keys( 2)(6) or A(2)) 
	       and (keys( 3)(6) or A(3)) 
	       and (keys( 4)(6) or A(4)) 
	       and (keys( 5)(6) or A(5)) 
	       and (keys( 6)(6) or A(6)) 
	       and (keys( 7)(6) or A(7)) 
	       and (keys( 8)(6) or A(8)) 
	       and (keys( 9)(6) or A(9)) 
	       and (keys(10)(6) or A(10));
	KEYB(7) <= (keys( 1)(7) or A(1)) 
	       and (keys( 2)(7) or A(2)) 
	       and (keys( 3)(7) or A(3)) 
	       and (keys( 4)(7) or A(4)) 
	       and (keys( 5)(7) or A(5)) 
	       and (keys( 6)(7) or A(6)) 
	       and (keys( 7)(7) or A(7)) 
	       and (keys( 8)(7) or A(8)) 
	       and (keys( 9)(7) or A(9)) 
	       and (keys(10)(7) or A(10));

        Q <= KEYB(7 downto 4) & x"0" when A(0) = '0' 
        else KEYB(3 downto 0) & x"0";

	process(nRESET,CLK)
	begin
		if nRESET = '0' then
			release <= '0';
			extended <= '0';
	
			keys(1) <= (others => '1');
			keys(2) <= (others => '1');
			keys(3) <= (others => '1');
			keys(4) <= (others => '1');
			keys(5) <= (others => '1');
			keys(6) <= (others => '1');
			keys(7) <= (others => '1');
			keys(8) <= (others => '1');
			keys(9) <= (others => '1');
			keys(10) <= (others => '1');
		elsif rising_edge(CLK) then
			if keyb_valid = '1' then
				-- keyb_data contains scan code of PS/2 Set2
				-- http://www.computer-engineering.org/ps2keyboard/scancodes2.html
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
					
					when X"0e" => keys(9)(7) <= release; -- pipe -> :*
					when X"16" => keys(5)(7) <= release; -- 1
					when X"1e" => keys(5)(0) <= release; -- 2
					when X"26" => keys(5)(1) <= release; -- 3
					when X"25" => keys(3)(1) <= release; -- 4
					when X"2e" => keys(3)(0) <= release; -- 5			
					when X"36" => keys(3)(7) <= release; -- 6
					when X"3d" => keys(4)(7) <= release; -- 7
					when X"3e" => keys(4)(0) <= release; -- 8
					when X"46" => keys(4)(1) <= release; -- 9
					when X"45" => keys(10)(1) <= release; -- 0
					when X"4e" => keys(10)(0) <= release; -- -=
					when X"55" => keys(10)(7) <= release; -- ;+
					when X"66" => keys(1)(4) <= release; -- Backspace same as cursor left
					
					when X"0d" => keys(9)(1) <= release; -- TAB -> ^@
					when X"15" => keys(5)(5) <= release; -- Q
					when X"1d" => keys(5)(6) <= release; -- W
					when X"24" => keys(5)(4) <= release; -- E
					when X"2d" => keys(3)(4) <= release; -- R
					when X"2c" => keys(3)(6) <= release; -- T				
					when X"35" => keys(3)(5) <= release; -- Y
					when X"3c" => keys(4)(6) <= release; -- U
					when X"43" => keys(4)(5) <= release; -- I
					when X"44" => keys(4)(4) <= release; -- O
					when X"4d" => keys(10)(4) <= release; -- P
					when X"54" => keys(10)(6) <= release; -- [ sh
					when X"5b" => keys(10)(5) <= release; -- ] dj
					when X"5a" => keys(1)(0) <= release; -- ENTER
					
					-- when X"58" => -- Caps Lock
					when X"1c" => keys(7)(5) <= release; -- A
					when X"1b" => keys(7)(6) <= release; -- S
					when X"23" => keys(7)(4) <= release; -- D
					when X"2b" => keys(8)(4) <= release; -- F
					when X"34" => keys(8)(6) <= release; -- G
					when X"33" => keys(8)(5) <= release; -- H
					when X"3b" => keys(6)(5) <= release; -- J
					when X"42" => keys(6)(6) <= release; -- K
					when X"4b" => keys(6)(4) <= release; -- L
					when X"4c" => keys(9)(4) <= release; -- Č
					when X"52" => keys(9)(5) <= release; -- Ć
					when scan_zh => keys(9)(6) <= release; -- Ž
					--when X"5D" => keys(9)(6) <= release; -- Ž
					--when X"5c" => keys(9)(6) <= release; -- Set3: Ž

					when X"12" => keys(2)(1) <= release; -- Left shift
					--when scan_ltgt => keys(9)(1) <= release; -- international < > -> ^@
					--when X"61" => keys(9)(1) <= release; -- international < >
					--when X"13" => keys(9)(1) <= release; -- Set3: international < >
					when X"1a" => keys(7)(7) <= release; -- Z
					when X"22" => keys(7)(0) <= release; -- X
					when X"21" => keys(7)(1) <= release; -- C
					when X"2a" => keys(8)(1) <= release; -- V
					when X"32" => keys(8)(0) <= release; -- B
					when X"31" => keys(8)(7) <= release; -- N
					when X"3a" => keys(6)(7) <= release; -- M
					when X"41" => keys(6)(0) <= release; -- ,<
					when X"49" => keys(6)(1) <= release; -- .>
					when X"4a" => keys(9)(0) <= release; -- /? extended = KP /
					when X"59" => keys(2)(1) <= release; -- Right shift
					
					--when X"76" => keys(0)(0) <= release; -- Escape not on ORAO
					when X"29" => keys(2)(0) <= release; -- SPACE
					when scan_left_ctrl => keys(1)(1) <= release; -- CTRL
					
					-- Cursor keys - these are actually extended (E0 xx), but
					-- the scancodes for the numeric keypad cursor keys are
					-- are the same but without the extension, so we'll accept
					-- the codes whether they are extended or not
					when scan_arrow_left => keys(1)(4) <= release; -- left arrow
					when scan_arrow_right => keys(1)(7) <= release; -- right arrow
					when scan_arrow_up => keys(1)(5) <= release; -- up arrow
					when scan_arrow_down => keys(1)(6) <= release; -- down arrow
					-- Set2: arrow keys
					--when X"6b" => keys(1)(4) <= release; -- left arrow
					--when X"74" => keys(1)(7) <= release; -- right arrow
					--when X"75" => keys(1)(5) <= release; -- up arrow
					--when X"72" => keys(1)(6) <= release; -- down arrow
					-- Set3: arrow keys
					--when X"61" => keys(1)(4) <= release; -- left arrow
					--when X"6a" => keys(1)(7) <= release; -- right arrow
					--when X"63" => keys(1)(5) <= release; -- up arrow
					--when X"60" => keys(1)(6) <= release; -- down arrow

					when X"05" => keys(2)(4) <= release; -- F1
					when X"06" => keys(2)(5) <= release; -- F2
					when X"04" => keys(2)(6) <= release; -- F3
					when X"0C" => keys(2)(7) <= release; -- F4

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

					
					when others =>
						null;
					end case;
				end if;
			end if;
		end if;
	end process;

end architecture;
