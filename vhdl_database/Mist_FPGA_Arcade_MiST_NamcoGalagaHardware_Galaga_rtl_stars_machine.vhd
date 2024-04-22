---------------------------------------------------------------------------------
-- Galaga starfield generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
--
-- Done from only available MAME information
--
-- star set data description
--
--  |    8 bits    |    8 bits           |
--  |------------------------------------| 
--	|    0x80      | scan line number    |  0x80 id for line number
--  | star 1 color | star 1 position     |  star color alway < 0x40
--  | star 2 color | star 2 position     |
--	|    0x80      | scan line number    |
--  | star 1 color | star 1 position     |
--	|    0x80      | scan line number    |
--  | star 1 color | star 1 position     |  from 1 up to 3 stars for 
--  | star 2 color | star 2 position     |  the given scan lien number
--  | star 3 color | star 3 position     |
--                ...
--	|    0xC0      | N.U.                |  end of list
--
--  Scan line number are 1 less than MAME list because of way of realisation
--  Scan line number are ordered from lower to higher. 

--  Machine wait for current scan line number to be reach by vcnt then it read
--  from 1 to 3 stars (stop reading if reaching next 0x80). After that machine
--  is ready to wait for next scan line, and so on. Machine loops at start of 
--  list if 0xC0 is reached.  

library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all,ieee.numeric_std.all;

entity stars_machine is
port (
	clk              : in  std_logic;
	ena_hcnt         : in  std_logic;
	hcnt             : in  std_logic_vector( 8 downto 0);
	vcnt             : in  std_logic_vector( 8 downto 0);
	stars_set_addr_o : out std_logic_vector( 6 downto 0);
  stars_set_data   : in  std_logic_vector(15 downto 0);
  offset_y         : in  std_logic_vector( 7 downto 0);
  star_color       : out std_logic_vector( 5 downto 0) 
);
end entity;

architecture behaviour of stars_machine is

 signal stars_set_addr : std_logic_vector( 6 downto 0);
 signal stars_state    : std_logic_vector( 2 downto 0);
 signal star_0         : std_logic_vector(13 downto 0);
 signal star_1         : std_logic_vector(13 downto 0);
 signal star_2         : std_logic_vector(13 downto 0);

begin

stars_set_addr_o <= stars_set_addr;

process (clk)
begin
 if rising_edge(clk) then 
	-- chercher la ligne suivante
	if stars_state = "000" then
		if stars_set_data(15) = '1' then 
			if stars_set_data(14) = '1' then 
				stars_set_addr <= "0000000";
			else
				stars_state <= "001";
			end if;
		else
			stars_set_addr <= stars_set_addr + "0000001";
		end if;
	end if; 
	-- attendre que la ligne soit jouée
	if stars_state = "001" then
		if stars_set_data(7 downto 0) = vcnt(7 downto 0) then
				stars_state <= "010";		
				stars_set_addr <= stars_set_addr + "0000001";
		end if;
	end if; 	
  -- oublier toutes les étoiles en début de balayage ligne
	-- attendre que la ligne soit jouée
	if hcnt = std_logic_vector(to_unsigned(256,9)) and ena_hcnt = '1' then
		star_0 <= (others => '0');
		star_1 <= (others => '0');
		star_2 <= (others => '0');
		if stars_state = "010" then
			stars_state <= "011";
		end if;
	end if; 
	-- récupérer la première étoile
	if stars_state = "011" then
		if stars_set_data(15) = '0' then 
			star_0 <= stars_set_data(13 downto 0);
			stars_set_addr <= stars_set_addr + "0000001";
		end if;
	  stars_state <= "100";
	end if; 
  -- récupérer la seconde étoile si il y en a une 
	if stars_state = "100"then
		if stars_set_data(15) = '0' then 
			star_1 <= stars_set_data(13 downto 0);
			stars_set_addr <= stars_set_addr + "0000001";
		end if;
	  stars_state <= "101";
	end if; 
  -- récupérer la troisième étoile si il y en a une 
	if stars_state = "101" then
		if stars_set_data(15) = '0' then 
			star_2 <= stars_set_data(13 downto 0);
			stars_set_addr <= stars_set_addr + "0000001";
		end if;
	  stars_state <= "000";
	end if; 
	
	-- jouer les étoiles récupérées
	star_color <= "000000";
	if (hcnt(7 downto 0)- offset_y = star_0(7 downto 0)) and hcnt(8) = '0' then star_color <= star_0(13 downto 8); end if;
	if (hcnt(7 downto 0)- offset_y = star_1(7 downto 0)) and hcnt(8) = '0' then star_color <= star_1(13 downto 8); end if;
	if (hcnt(7 downto 0)- offset_y = star_2(7 downto 0)) and hcnt(8) = '0' then star_color <= star_2(13 downto 8); end if;
	
 end if;
end process; 	
end architecture;

