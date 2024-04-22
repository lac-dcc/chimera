-- Speck_Constants.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package SPECK_CONSTANTS is

function  Round_Count_Lookup(key_size,block_size : integer range 0 to 256) return integer;
function  Beta_Lookup(key_size,block_size : integer range 0 to 256) return integer;
function  Alpha_Lookup(key_size,block_size : integer range 0 to 256) return integer;

end SPECK_CONSTANTS;

package body SPECK_CONSTANTS is

function  Round_Count_Lookup(key_size,block_size : integer range 0 to 256) return integer is
  variable round_count_tmp : integer range 0 to 63 := 0;
begin
	-- Block Size 32 and Key Size 64 use 22 rounds
	if (BLOCK_SIZE = 32 and KEY_SIZE = 64) then
		round_count_tmp := 22;

	-- Block Size 48 and Key Size 72 use 22 rounds
	elsif (BLOCK_SIZE = 48 and KEY_SIZE = 72) then
		round_count_tmp := 22;

	-- Block Size 48 and Key Size 96 use 23 rounds
	elsif (BLOCK_SIZE = 48 and KEY_SIZE = 96) then
		round_count_tmp := 23;

	-- Block Size 64 and Key Size 96 use 26 rounds
	elsif (BLOCK_SIZE = 64 and KEY_SIZE = 96 ) then
		round_count_tmp := 26;

	-- Block Size 64 and Key Size 128 use 27 rounds
	elsif (BLOCK_SIZE = 64 and KEY_SIZE = 128) then
		round_count_tmp := 27;

	-- Block Size 96 and Key Size 96  use 28 rounds
	elsif (BLOCK_SIZE = 96 and KEY_SIZE = 96) then
		round_count_tmp := 28;

	-- Block Size 96 and Key Size 144 use 29 rounds
	elsif (BLOCK_SIZE = 96 and KEY_SIZE = 144) then
		round_count_tmp := 29;

	-- Block Size 128 and Key Size 128 use 32 rounds 
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 128) then
		round_count_tmp := 32;

	-- Block Size 128 and Key Size 192 used 33 rounds
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 192) then
		round_count_tmp := 33;

	-- Block Size 128 and Key Size 256 use 34 rounds
	elsif (BLOCK_SIZE = 128 and KEY_SIZE = 256) then
		round_count_tmp := 34;

	end if;
  	return round_count_tmp;
end Round_Count_Lookup;


function  Beta_Lookup(key_size,block_size : integer range 0 to 256) return integer is
  variable b_tmp : integer range 0 to 3 := 0;
begin
	-- Block Size 32 and Key Size 64 use beta rotate 2 bits
	if (BLOCK_SIZE = 32 and KEY_SIZE = 64) then
		b_tmp := 2;

	-- All other key/block combinations use beta rotate 3 bits
	else 
		b_tmp := 3;
	
    end if;
  	return b_tmp;
end Beta_Lookup;


function  Alpha_Lookup(key_size,block_size : integer range 0 to 256) return integer is
  variable a_tmp : integer range 0 to 15 := 0;
begin
	-- Block Size 32 and Key Size 64 use alpha rotate 7 bits
	if (BLOCK_SIZE = 32 and KEY_SIZE = 64) then
		a_tmp := 7;

	-- All other key/block combinations use alpha rotate 8 bits
	else 
		a_tmp := 8;
	
    end if;
  	return a_tmp;
end Alpha_Lookup;

end SPECK_CONSTANTS;