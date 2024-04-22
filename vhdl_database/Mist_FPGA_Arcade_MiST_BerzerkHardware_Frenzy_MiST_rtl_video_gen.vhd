---------------------------------------------------------------------------------
-- Berzerk Video generator - Dar - Juin 2018
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity video_gen is
port(
	clock      : in std_logic;
	reset      : in std_logic;
	ena_pixel  : in std_logic;
	hsync      : out std_logic;
	vsync      : out std_logic;
	csync      : out std_logic;
	hblank      : out std_logic;
	vblank      : out std_logic;
	hcnt_o      : out std_logic_vector(8 downto 0);
	vcnt_o      : out std_logic_vector(8 downto 0)
);
end video_gen;

architecture struct of video_gen is

signal hcnt    : std_logic_vector(8 downto 0);
signal vcnt    : std_logic_vector(8 downto 0);

signal hsync0  : std_logic;
signal hsync1  : std_logic;
signal hsync2  : std_logic;

begin

hcnt_o  <= hcnt;
vcnt_o  <= vcnt;

hsync <= hsync0;


-- Compteur horizontal 
-- 1C0..1FF-000..0FF : 64+256 = 320 pixels
-- 448..511-000..255

-- Compteur vertical  
-- 1DA..1FF-020..0FF : 38+224 = 262 lignes
-- 474..511-032..255

-- Synchro horizontale : hcnt=[] (xx pixels)
-- Synchro verticale   : vcnt=[] ( x lignes)

process(clock,reset)
begin

	if reset = '1' then
		hcnt <= (others=>'0');	
		vcnt <= (others=>'0');
	else

		if rising_edge(clock) then
	
			if ena_pixel = '1' then

				if hcnt = std_logic_vector(to_unsigned(511,9)) then   -- 511
					hcnt <= (others=>'0');
				else	
					if hcnt = std_logic_vector(to_unsigned(255,9)) then  -- 255
						hcnt <= std_logic_vector(to_unsigned(448,9));     -- 448
					else
						hcnt <= hcnt + '1';
					end if;
				end if; 

				if hcnt = std_logic_vector(to_unsigned(255,9)) then
					if vcnt = std_logic_vector(to_unsigned(511,9)) then
						vcnt <= std_logic_vector(to_unsigned(32,9));
					else
						if vcnt = 255 then
							vcnt <= std_logic_vector(to_unsigned(474,9));					
						else
							vcnt <= vcnt + '1';
						end if;	
					end if;
				end if;
				
				if hcnt = std_logic_vector(to_unsigned(448+16,9)) then
				--	vblank_r <= vblank;
				end if;
				
				
				if    hcnt = (466+ 0) then hsync0 <= '0';
				elsif hcnt = (466+24) then hsync0 <= '1';
				end if;    

				if    hcnt = (466+ 0)         then hsync1 <= '0';
				elsif hcnt = (466+11)         then hsync1 <= '1';
				elsif hcnt = (466   +160-512) then hsync1 <= '0';
				elsif hcnt = (466+11+160-512) then hsync1 <= '1';
				end if;    

				if    hcnt = (466)       then hsync2 <= '0';
				elsif hcnt = (466-10)    then hsync2 <= '1';
				end if;    

				if    vcnt = (490-7) then csync <= hsync1;
				elsif vcnt = (491-7) then csync <= hsync1;
				elsif vcnt = (492-7) then csync <= hsync1;
				elsif vcnt = (493-7) then csync <= hsync2;
				elsif vcnt = (494-7) then csync <= hsync2;
				elsif vcnt = (495-7) then csync <= hsync2;
				elsif vcnt = (496-7) then csync <= hsync1;
				elsif vcnt = (497-7) then csync <= hsync1;
				elsif vcnt = (498-7) then csync <= hsync1;
				else                      csync <= hsync0; 
				end if;

				if    vcnt = (490) then vsync <= '0';
				elsif vcnt = (498) then vsync <= '1';
				end if;    

				if    hcnt = (448+8) then hblank <= '1'; 
				elsif hcnt = (8) then hblank <= '0'; 
				end if;    
			
				if    vcnt = (474) then vblank <= '1';
				elsif vcnt = (032) then vblank <= '0';
				end if;   
			
			end if;
		end if;
	end if;
end process;

end architecture;