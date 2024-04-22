----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:12:02 06/27/2011 
-- Design Name: 
-- Module Name:    deltasigma - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity deltasigma is
	generic (
		width: integer :=8
   );
	Port ( inval : in  STD_LOGIC_VECTOR (width-1 downto 0);
           output : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end deltasigma;

architecture Behavioral of deltasigma is
signal reg: STD_LOGIC_VECTOR(width+1 downto 0);
signal reg_d: STD_LOGIC_VECTOR(width+1 downto 0);
signal ddcout: STD_LOGIC_VECTOR(width+1 downto 0);

begin
ds: process(clk, reset)
begin
	if reset='1' then
		reg<=(others => '0');
		output<='0';
	elsif rising_edge(clk) then
		reg<=reg_d;
		output<=reg(width);
	end if;
end process;
ddcout(width+1 downto width)<="00";
ddcout(width-1 downto 0)<=(others=>'1') when reg(width)='1' else (others => '0');
reg_d<=(("00"&inval)-ddcout)+reg;
end Behavioral;

