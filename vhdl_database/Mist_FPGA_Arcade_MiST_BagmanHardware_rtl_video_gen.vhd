---------------------------------------------------------------------------------
-- Video generator - Dar - Feb 2014
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity video_gen is
port(
	clock_12    : in std_logic;
	ena_pixel   : in std_logic;
	hsync       : out std_logic;
	vsync       : out std_logic;
	csync       : out std_logic;
	hblank       : out std_logic;
	vblank       : out std_logic;

	is_sprite   : out std_logic;
	sprite      : out std_logic_vector(2 downto 0);
	x_tile      : out std_logic_vector(4 downto 0);
	y_tile      : out std_logic_vector(4 downto 0);
	x_pixel     : out std_logic_vector(2 downto 0);
	y_pixel     : out std_logic_vector(2 downto 0);

	cpu_clock   : out std_logic;
	cpu_clock_en: out std_logic;
	ym_clock_en : out std_logic
);
end video_gen;

architecture struct of video_gen is
signal hcnt    : unsigned (8 downto 0) := to_unsigned(511,9);
signal vcnt    : unsigned (8 downto 0) := to_unsigned(511,9);
signal vcnt_r  : unsigned (8 downto 0) := to_unsigned(511,9);

signal hsync0  : std_logic;
signal hsync1  : std_logic;
signal hsync2  : std_logic;

signal enable_clk : std_logic := '0';

begin

cpu_clock  <= not hcnt(0);
is_sprite  <= not hcnt(8);
sprite     <= std_logic_vector(hcnt(6 downto 4));
x_tile     <= std_logic_vector(hcnt(7 downto 3));
y_tile     <= std_logic_vector(vcnt_r(7 downto 3));
x_pixel    <= std_logic_vector(hcnt(2 downto 0));
y_pixel    <= std_logic_vector(vcnt_r(2 downto 0));

hsync <= hsync0;

-- Compteur horizontal : 511-128+1=384 pixels
-- 128 à 175 :  48 pixels fin de ligne 
-- 176 à 255 :  80 pixels debut de ligne
-- 256 à 511 : 256 pixels affichés (32 tiles)

-- Compteur vertical   : 511-248+1=264 lignes
-- 496 à 511 :  16 lignes fin de trame 
-- 248 à 271 :  24 lignes debut de trame
-- 272 à 495 : 224 lignes affichées (28 tiles)

-- Synchro horizontale : hcnt=[176 à 207] (32 pixels)
-- Synchro verticale   : vcnt=[248 à 255] ( 8 lignes)

process(clock_12)
begin

	if rising_edge(clock_12) then

--		enable_clk <= not enable_clk;
--		cpu_clock <= not hcnt(0);
		cpu_clock_en <= '0';
		ym_clock_en <= '0';

		if ena_pixel = '1' then
			cpu_clock_en <= not hcnt(0);
			if hcnt(1 downto 0) = "01" then
				ym_clock_en <= '1';
			end if;

			if hcnt = 511 then 
				hcnt <= to_unsigned (128,9);
				vcnt_r <= vcnt;
			else
				hcnt <= hcnt + 1;
			end if; 

			if hcnt = 175 then
				if vcnt = 511 then
					vcnt <= to_unsigned(248,9);
				else
					vcnt <= vcnt + 1;
				end if;
			end if;

			if    hcnt = (175+ 0) then hsync0 <= '0';
			elsif hcnt = (175+29) then hsync0 <= '1';
			end if;    

			if    hcnt = (175)        then hsync1 <= '0';
			elsif hcnt = (175+13)     then hsync1 <= '1';
			elsif hcnt = (175   +192) then hsync1 <= '0';
			elsif hcnt = (175+13+192) then hsync1 <= '1';
			end if;    

			if    hcnt = (175)       then hsync2 <= '0';
			elsif hcnt = (175-28)    then hsync2 <= '1';
			end if;    

			if    vcnt = 509 then csync <= hsync1;
			elsif vcnt = 510 then csync <= hsync1;
			elsif vcnt = 511 then csync <= hsync1;
			elsif vcnt = 248 then csync <= hsync2;
			elsif vcnt = 249 then csync <= hsync2;
			elsif vcnt = 250 then csync <= hsync2;
			elsif vcnt = 251 then csync <= hsync1;
			elsif vcnt = 252 then csync <= hsync1;
			elsif vcnt = 253 then csync <= hsync1;
			else                  csync <= hsync0; 
			end if;

			if    vcnt = 511 then vsync <= '0';
			elsif vcnt = 250 then vsync <= '1';--
			end if;    

			if    hcnt = (127+8+2) then hblank <= '1'; -- +8 = retard du shift_register + 1 pixel--
			elsif hcnt = (255+8+1) then hblank <= '0'; -- +8 = retard du shift_register + 1 pixel--
			end if;    

			if    vcnt = (495+1+0) then vblank <= '1';
			elsif vcnt = (271+1+1) then vblank <= '0';
			end if;   

		end if;
	end if;
end process;

end architecture;