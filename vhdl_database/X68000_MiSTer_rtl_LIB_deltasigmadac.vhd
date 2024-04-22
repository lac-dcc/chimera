---------------------------------
-- Delta-Sigma D/A converter  ---
---------------------------------


library IEEE,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity deltasigmadac is
	generic(
		width	:integer	:=8
	);
	port(
		data	:in	std_logic_vector(width-1 downto 0);
		datum	:out std_logic;
		
		sft		:in std_logic;
		clk		:in std_logic;
		ce      :in std_logic := '1';
		rstn	:in std_logic
	);
end deltasigmadac;

architecture main of deltasigmadac is
signal	delta		:std_logic_vector(width+1 downto 0);
signal	sigma		:std_logic_vector(width+1 downto 0);
signal	sigmalat	:std_logic_vector(width+1 downto 0);
begin

	delta<=sigmalat(width+1) & sigmalat(width+1) & data;
	sigma<=delta+sigmalat;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				sigmalat(width+1)<='1';
				sigmalat(width downto 0)<=(others=>'0');
				datum<='0';
			elsif(clk' event and clk='1')then
				if(sft='1')then
					sigmalat<=sigma;
					datum<=sigmalat(width);
				end if;
			end if;
		end if;
	end process;
end main;