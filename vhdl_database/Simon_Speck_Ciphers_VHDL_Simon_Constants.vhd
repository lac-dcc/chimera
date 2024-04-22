-- Simon_Constants.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package SIMON_CONSTANTS is

type ARRAY_5x62 is ARRAY (0 to 4) of STD_LOGIC_VECTOR(61 downto 0); -- 5 by 62 bit 2D array type

-- Z Arrays (stored bit reversed for easier usage)
constant z_array : ARRAY_5x62 := ("01100111000011010100100010111110110011100001101010010001011111",
								 "01011010000110010011111011100010101101000011001001111101110001",
								 "11001101101001111110001000010100011001001011000000111011110101",
								 "11110000101100111001010001001000000111101001100011010111011011",
								 "11110111001001010011000011101000000100011011010110011110001011");

function  Round_Count_Lookup(key_size,block_size : integer range 0 to 256) return integer;
function  Z_Array_Lookup(key_size,block_size : integer range 0 to 256) return std_logic_vector;

end SIMON_CONSTANTS;

package body SIMON_CONSTANTS is


function  Round_Count_Lookup(key_size,block_size : integer range 0 to 256) return integer is
  variable round_count_tmp : integer range 0 to 127 := 0;
begin
	-- Block Size 32 and Key Size 64 use z0 and 32 rounds
	if (BLOCK_SIZE = 32 and KEY_SIZE = 64) then
		round_count_tmp := 32;

	-- Block Size 48 and Key Size 72 use z0 and 36 rounds
	elsif (BLOCK_SIZE = 48 and KEY_SIZE = 72) then
		round_count_tmp := 36;

	-- Block Size 48 and Key Size 96 use z1 and 36 rounds
	elsif (BLOCK_SIZE = 48 and KEY_SIZE = 96) then
		round_count_tmp := 36;

	-- Block Size 64 and Key Size 96 use z2 and 42 rounds
	elsif (BLOCK_SIZE = 64 and KEY_SIZE = 96 ) then
		round_count_tmp := 42;

	-- Block Size 64 and Key Size 128 use z3 and 44 rounds
	elsif (BLOCK_SIZE = 64 and KEY_SIZE = 128) then
		round_count_tmp := 44;

	-- Block Size 96 and Key Size 96  use z2 and 52 rounds
	elsif (BLOCK_SIZE = 96 and KEY_SIZE = 96) then
		round_count_tmp := 52;

	-- Block Size 96 and Key Size 144 use z3 and 54 rounds
	elsif (BLOCK_SIZE = 96 and KEY_SIZE = 144) then
		round_count_tmp := 54;

	-- Block Size 128 and Key Size 128 use z2 and 68 rounds 
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 128) then
		round_count_tmp := 68;

	-- Block Size 128 and Key Size 192 use z3  and 69 rounds
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 192) then
		round_count_tmp := 69;

	-- Block Size 128 and Key Size 256 use z4 and 72 rounds
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 256) then
		round_count_tmp := 72;

	end if;
  	return round_count_tmp;
end Round_Count_Lookup;



function  Z_Array_Lookup(key_size,block_size : integer range 0 to 256) return std_logic_vector is
  variable z_tmp : std_logic_vector(61 downto 0) := (OTHERS => '0');
begin
	-- Block Size 32 and Key Size 64 use z0 and 32 rounds
	if (BLOCK_SIZE = 32 and KEY_SIZE = 64) then
		z_tmp := z_array(0);

	-- Block Size 48 and Key Size 72 use z0 and 36 rounds
	elsif (BLOCK_SIZE = 48 and KEY_SIZE = 72) then
		z_tmp := z_array(0);

	-- Block Size 48 and Key Size 96 use z1 and 36 rounds
	elsif (BLOCK_SIZE = 48 and KEY_SIZE = 96) then
		z_tmp := z_array(1);

	-- Block Size 64 and Key Size 96 use z2 and 42 rounds
	elsif (BLOCK_SIZE = 64 and KEY_SIZE = 96 ) then
		z_tmp := z_array(2);

	-- Block Size 64 and Key Size 128 use z3 and 44 rounds
	elsif (BLOCK_SIZE = 64 and KEY_SIZE = 128) then
		z_tmp := z_array(3);

	-- Block Size 96 and Key Size 96  use z2 and 52 rounds
	elsif (BLOCK_SIZE = 96 and KEY_SIZE = 96) then
		z_tmp := z_array(2);

	-- Block Size 96 and Key Size 144 use z3 and 54 rounds
	elsif (BLOCK_SIZE = 96 and KEY_SIZE = 144) then
		z_tmp := z_array(3);

	-- Block Size 128 and Key Size 128 use z2 and 68 rounds 
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 128) then
		z_tmp := z_array(2);

	-- Block Size 128 and Key Size 192 use z3  and 69 rounds
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 192) then
		z_tmp := z_array(3);

	-- Block Size 128 and Key Size 256 use z4 and 72 rounds
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 256) then
		z_tmp := z_array(4);

	end if;
  	return z_tmp;
end Z_Array_Lookup;


end SIMON_CONSTANTS;