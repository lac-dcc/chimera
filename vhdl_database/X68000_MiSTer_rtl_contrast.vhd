library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use	ieee.std_logic_unsigned.all;

entity contrast is
generic(
	datwidth		:integer	:=5;
	contwidth	:integer	:=4;
	outwidth		:integer	:=8
);
port(
	indat	:in std_logic_vector(datwidth-1 downto 0);
	contrast:in std_logic_vector(contwidth-1  downto 0);
	
	outdat	:out std_logic_vector(outwidth-1 downto 0)
);
end contrast;

architecture rtl of contrast is
signal	mul	:std_logic_vector(datwidth+contwidth-1 downto 0);
begin
	mul<=indat * contrast;
	outdat<=mul(datwidth+contwidth-1 downto datwidth+contwidth-outwidth);
end rtl;


	