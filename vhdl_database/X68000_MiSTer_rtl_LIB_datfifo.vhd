library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity datfifo	is
generic(
	datwidth	:integer	:=8;
	depth		:integer	:=32
);
port(
	datin		:in std_logic_vector(datwidth-1 downto 0);
	datwr		:in std_logic;
	
	datout	:out std_logic_vector(datwidth-1 downto 0);
	datrd		:in std_logic;
	
	datnum	:out integer range 0 to depth-1;
	empty		:out std_logic;
	full		:out std_logic;
	
	clr		:in std_logic	:='0';
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end datfifo;
architecture rtl of datfifo is
subtype DAT_LAT_TYPE is std_logic_vector(datwidth-1 downto 0); 
type DAT_LAT_ARRAY is array (natural range <>) of DAT_LAT_TYPE; 
signal	RAM	:DAT_LAT_ARRAY(0 to depth-1);

signal	rdaddr	:integer range 0 to depth-1;
signal	wraddr	:integer range 0 to depth-1;
begin
	datnum<=wraddr-rdaddr;
	full<=	'1' when rdaddr=((wraddr+1)mod depth) else '0';
	empty<='1' when rdaddr=wraddr else '0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				wraddr<=0;
			elsif(ce = '1')then
				if(clr='1')then
					wraddr<=0;
				elsif(datwr='1')then
					RAM(wraddr)<=datin;
					if((wraddr+1)=depth)then
						wraddr<=0;
					else
						wraddr<=wraddr+1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	datout<=RAM(rdaddr);
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				rdaddr<=0;
			elsif(ce = '1')then
				if(clr='1')then
					rdaddr<=0;
				elsif(datrd='1')then
					if((rdaddr+1)=depth)then
						rdaddr<=0;
					else
						rdaddr<=rdaddr+1;
					end if;
				end if;
			end if;
		end if;
	end process;
end rtl;
