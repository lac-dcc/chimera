LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fmparram is
generic(
	CHANNELS	:integer	:=8;
	SLOTS		:integer	:=4;
	PARWIDTH	:integer	:=5
);
port(
	wrchannel	:in integer range 0 to CHANNELS-1;
	wrslot		:in integer range 0 to SLOTS-1;
	wrdat		:in std_logic_vector(PARWIDTH-1 downto 0);
	wr			:in std_logic;
	clkw		:in std_logic;
	cew         :in std_logic := '1';
	
	rdchannel	:in integer range 0 to CHANNELS-1;
	rdslot		:in integer range 0 to SLOTS-1;
	rddat		:out std_logic_vector(PARWIDTH-1 downto 0);
	clkr		:in std_logic;
	cer         :in std_logic := '1'
);
end fmparram;

architecture rtl of fmparram is
constant ramsize	:integer	:=CHANNELS*SLOTS;
subtype DAT_LAT_TYPE is std_logic_vector(PARWIDTH-1 downto 0); 
type DAT_LAT_ARRAY is array (natural range <>) of DAT_LAT_TYPE; 
signal	RAM	:DAT_LAT_ARRAY(0 to ramsize-1);

begin
	process(clkw)begin
		if rising_edge(clkw) then
			if(cew = '1')then
				if(wr='1')then
					RAM((wrchannel*SLOTS)+wrslot)<=wrdat;
				end if;
			end if;
		end if;
	end process;
	
	process(clkr)begin
		if rising_edge(clkr) then
			if(cer = '1')then
				rddat<=RAM((rdchannel*SLOTS)+rdslot);
			end if;
		end if;
	end process;
end rtl;
	
	
	