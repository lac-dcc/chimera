-- Copyright (c) 2014, Juha Turunen
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met: 
--
-- 1. Redistributions of source code must retain the above copyright notice, this
--    list of conditions and the following disclaimer. 
-- 2. Redistributions in binary form must reproduce the above copyright notice,
--    this list of conditions and the following disclaimer in the documentation
--    and/or other materials provided with the distribution. 
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity palette is Port ( 
    index : in std_logic_vector(3 downto 0);
    luma : out std_logic_vector(10 downto 0);
    phase : out std_logic_vector(7 downto 0);
    chroma : out std_logic_vector(2 downto 0)
 );
end palette;

architecture Behavioral of palette is
begin

	luma <=
		conv_std_logic_vector(430, 11) when index = "0000" else
		conv_std_logic_vector(489, 11) when index = "0001" else
		conv_std_logic_vector(598, 11) when index = "0010" else
		conv_std_logic_vector(636, 11) when index = "0011" else
		conv_std_logic_vector(685, 11) when index = "0100" else
		conv_std_logic_vector(790, 11) when index = "0101" else
		conv_std_logic_vector(803, 11) when index = "0110" else
		conv_std_logic_vector(868, 11) when index = "0111" else
		conv_std_logic_vector(835, 11) when index = "1000" else
		conv_std_logic_vector(897, 11) when index = "1001" else
		conv_std_logic_vector(892, 11) when index = "1010" else
		conv_std_logic_vector(858, 11) when index = "1011" else
		conv_std_logic_vector(953, 11) when index = "1100" else
		conv_std_logic_vector(1044, 11) when index = "1101" else
		conv_std_logic_vector(1097, 11) when index = "1110" else
		conv_std_logic_vector(1144, 11);

	chroma <=
		"100" when index = "0000" else
		"001" when index = "0001" else
		"010" when index = "0010" else
		"100" when index = "0011" else
		"101" when index = "0100" else
		"010" when index = "0101" else
		"001" when index = "0110" else
		"100" when index = "0111" else
		"101" when index = "1000" else
		"011" when index = "1001" else
		"100" when index = "1010" else
		"011" when index = "1011" else
		"110" when index = "1100" else
		"101" when index = "1101" else
		"100" when index = "1110" else
		"101";
	phase <=
		"10000100" when index = "0000" else
		"10011100" when index = "0001" else
		"11010011" when index = "0010" else
		"01100000" when index = "0011" else
		"11110010" when index = "0100" else
		"11010010" when index = "0101" else
		"01100101" when index = "0110" else
		"10011010" when index = "0111" else
		"01000111" when index = "1000" else
		"11100111" when index = "1001" else
		"11101100" when index = "1010" else
		"00110110" when index = "1011" else
		"00100111" when index = "1100" else
		"00100101" when index = "1101" else
		"11101101" when index = "1110" else
		"11111100";

end Behavioral;
