library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.camera.all ;

entity hsvdivrom is
	port(
	   clk, en	:	in std_logic ;
 		data : out std_logic_vector(15 downto 0 ); 
 		addr : in std_logic_vector(4 downto 0 )
	); 
end hsvdivrom;

architecture final of hsvdivrom is
 
	type vals is array (0 to 31) of std_logic_vector(15 downto 0 ); 
	
	signal rom : vals :=( 
	D"1360",
	D"680",
	D"453",
	D"340",
	D"272",
	D"226",
	D"194",
	D"170",
	D"151",
	D"136",
	D"123",
	D"113",
	D"104",
	D"97",
	D"90",
	D"85",
	D"80",
	D"75",
	D"71",
	D"68",
	D"64",
	D"61",
	D"59",
	D"56",
	D"54",
	D"52",
	D"50",
	D"48",
	D"46",
	D"45",
	D"43"
	);

	begin
	
	
	-- rom_process
	process(clk)
		 begin
		 if clk'event and clk = '1' then
			if en = '1' then
				data <= rom(conv_integer(addr)) ;
			end if;
		 end if;
		 end process;  
	
end final ;