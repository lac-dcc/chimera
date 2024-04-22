--
-- A simulation model of Pacman hardware
-- Copyright (c) MikeJ & CarlW - January 2006
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email pacman@fpgaarcade.com
--
-- Revision list
--
-- version 003 Jan 2006 release, general tidy up
-- version 001 initial release
--
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity PACMAN_VRAM_ADDR is
port (
	AB      : out   std_logic_vector (11 downto 0);
	H       : in    std_logic_vector ( 8 downto 0); -- H256_L H128 H64 H32 H16 H8 H4 H2 H1
	V       : in    std_logic_vector ( 7 downto 0); --        V128 V64 v32 V16 V8 V4 V2 V1
	FLIP    : in    std_logic
);
end;

architecture RTL of PACMAN_VRAM_ADDR is
	signal sel      : std_logic;
	signal y157_bus : std_logic_vector (11 downto 0);
	signal y257_bus : std_logic_vector (11 downto 0);
	signal hp       : std_logic_vector ( 4 downto 0);
	signal vp       : std_logic_vector ( 4 downto 0);
begin
	hp <= H(7 downto 3) xor (FLIP & FLIP & FLIP & FLIP & FLIP);
	vp <= V(7 downto 3) xor (FLIP & FLIP & FLIP & FLIP & FLIP);

	sel      <= not ( (H(5) xor H(4)) or (H(5) xor H(6)) );
	y157_bus <= '0' & H(2) & hp(3) & hp(3) & hp(3) & hp(3) & hp(0) & vp when sel='1' else x"FF" & H(6 downto 4) & H(2);
	y257_bus <= y157_bus when H(8)='0' else '0' & H(2) & vp & hp;
	AB <= y257_bus when H(1) = '1' else (others => 'Z');

end RTL;
