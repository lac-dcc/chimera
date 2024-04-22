LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity parrmwram is
generic(
	awidth	:integer	:=4;
	dwidth	:integer	:=32
);
port(
	rdaddr0	:in integer range 0 to awidth-1;
	rddat0	:out std_logic_vector(dwidth-1 downto 0);
	rdaddr1	:in integer range 0 to awidth-1;
	rddat1	:out std_logic_vector(dwidth-1 downto 0);
	wraddr	:in integer range 0 to awidth-1;
	wrdat	:in std_logic_vector(dwidth-1 downto 0);
	wr		:in std_logic;
	clkr	:in std_logic;
	clkrmw	:in std_logic
);
end parrmwram;

architecture rtl of parrmwram is
subtype DAT_LAT_TYPE is std_logic_vector(dwidth-1 downto 0); 
type DAT_LAT_ARRAY is array (natural range <>) of DAT_LAT_TYPE; 
signal	RAM	:DAT_LAT_ARRAY(0 to awidth-1);
signal	raddr0,raddr1	:integer range 0 to awidth-1;
begin
	process(clkr)begin
		if(clkr' event and clkr='1')then
			raddr0<=rdaddr0;
			rddat0<=ram(raddr0);
		end if;
	end process;
	
	process(clkrmw)begin
		if(clkrmw' event and clkrmw='1')then
			raddr1<=rdaddr1;
			rddat1<=ram(raddr1);
		end if;
	end process;
	
	process(clkrmw)begin
		if(clkrmw' event and clkrmw='1')then
			if(wr='1')then
				ram(wraddr)<=wrdat;
			end if;
		end if;
	end process;
end rtl;
	