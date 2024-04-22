----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:49 11/26/2013 
-- Design Name: 
-- Module Name:    textLineRAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
library work;
-- this line also is must.This includes the particular package into your program.
use work.commonPak.all;

entity basicBlockRAM is
	generic(
		numElements: integer := 128;
		dataWidth: integer := 8
	);
	port(
		clkA: in std_logic;
		writeEnableA: in std_logic;
		addrA: in std_logic_vector(log2_float(numElements-1) downto 0);
		dataOutA: out std_logic_vector(dataWidth-1 downto 0);
		dataInA: in std_logic_vector(dataWidth-1 downto 0)
	);
end basicBlockRAM;

architecture Behavioral of basicBlockRAM is
	type rom_type is array (0 to numElements-1) of std_logic_vector(dataWidth-1 downto 0);
	signal RAM: rom_type := (others => (others => '0'));
begin
	-- addr register to infer block RAM
	setRegA: process (clkA)
	begin
		if rising_edge(clkA) then
			-- Write to rom
			if(writeEnableA = '1') then
				RAM(to_integer(unsigned(addrA))) <= dataInA;
			end if;
			-- Read from it
			dataOutA <= RAM(to_integer(unsigned(addrA)));
		end if;
	end process;
end Behavioral;

