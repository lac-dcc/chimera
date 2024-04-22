---------------------------------------------------------------------------------
-- Galaga video horizontal/vertical and sync generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,
    ieee.std_logic_1164.all,
    ieee.std_logic_unsigned.all,
    ieee.numeric_std.all;


entity gen_video is
port(
	clk     : in std_logic;
	enable  : in std_logic;
	hcnt    : out std_logic_vector(8 downto 0);
	vcnt    : out std_logic_vector(8 downto 0);
	hsync   : out std_logic;
	vsync   : out std_logic;
	csync   : out std_logic; -- composite sync for TV
	hblank  : out std_logic;
	vblank  : out std_logic;
	h_offset: in signed(3 downto 0);
	v_offset: in signed(3 downto 0)
);
end gen_video;

architecture struct of gen_video is
signal hclkReg : unsigned (1 DOWNTO 0);
signal hcntReg : unsigned (8 DOWNTO 0) := to_unsigned(000,9);
signal vcntReg : unsigned (8 DOWNTO 0) := to_unsigned(015,9);

signal hsync0       : std_logic;
signal hsync1       : std_logic;
signal hsync2       : std_logic;

signal hsync_base : integer;
signal vsync_base : integer;
begin

hcnt  <= std_logic_vector(hcntReg);
vcnt  <= std_logic_vector(vcntReg);
hsync <= hsync0;

-- Compteur horizontal : 511-128+1=384 pixels (48 tiles)
-- 192 à 255 :  64 pixels debut de ligne  (8 dont 2 dernières tiles affichées)
-- 256 à 511 : 256 pixels centre de ligne (32 tiles affichées)
-- 128 à 191 :  64 pixels fin de ligne    (8 dont 2 premières tiles affichées)

-- Compteur vertical   : 263-000+1=264 lignes (33 tiles)
-- 000 à 015 :  16 lignes debut de trame  (2 tiles)
-- 016 à 239 : 224 lignes centrales       (28 tiles affichées)
-- 240 à 263 :  24 lignes fin de trame    (3 tiles)

-- Synchro horizontale : hcnt=[176 à 204] (29 pixels)
-- Synchro verticale   : vcnt=[260 à 003] ( 8 lignes)

process(clk)
begin
	if rising_edge(clk) then
		if enable = '1' then    -- clk & ena at 6MHz

			if hcntReg = 511 then
			       hcntReg <= to_unsigned (128,9);
			else
			       hcntReg <= hcntReg + 1;
			end if;

			if hcntReg = 191 then
			       if vcntReg = 263 then
				vcntReg <= to_unsigned(0,9);
			       else
				vcntReg <= vcntReg + 1;
			       end if;
			end if;

			hsync_base <= 175 + to_integer(resize(h_offset, 9));
			if    hcntReg = (hsync_base+ 0-8+8) then hsync0 <= '0'; -- 1
			elsif hcntReg = (hsync_base+29-8+8) then hsync0 <= '1';
			end if;

			if    hcntReg = (hsync_base-8+8)        then hsync1 <= '0';
			elsif hcntReg = (hsync_base+13-8+8)     then hsync1 <= '1'; -- 11
			elsif hcntReg = (hsync_base   +192-8+8) then hsync1 <= '0';
			elsif hcntReg = (hsync_base+13+192-8+8) then hsync1 <= '1'; -- 11
			end if;

			if    hcntReg = (hsync_base-8+8)     then hsync2 <= '0';
			elsif hcntReg = (hsync_base-28-8+8)  then hsync2 <= '1';
			end if;

			vsync_base <= 250+to_integer(resize(v_offset, 9));
			if     vcntReg = (vsync_base+ 2-1+2) mod 264 then csync <= hsync1;
			elsif  vcntReg = (vsync_base+ 3-1+2) mod 264 then csync <= hsync1;
			elsif  vcntReg = (vsync_base+ 4-1+2) mod 264 then csync <= hsync1; -- and hsync2;
			elsif  vcntReg = (vsync_base+ 5-1+2) mod 264 then csync <= hsync2; -- not(hsync1);
			elsif  vcntReg = (vsync_base+ 6-1+2) mod 264 then csync <= hsync2; -- not(hsync1);
			elsif  vcntReg = (vsync_base+ 7-1+2) mod 264 then csync <= hsync2; -- not(hsync1) or not(hsync2);
			elsif  vcntReg = (vsync_base+ 8-1+2) mod 264 then csync <= hsync1;
			elsif  vcntReg = (vsync_base+ 9-1+2) mod 264 then csync <= hsync1;
			elsif  vcntReg = (vsync_base+10-1+2) mod 264 then csync <= hsync1;
			else                          csync <= hsync0;
			end if;

			if    vcntReg = (vsync_base+10) mod 264 then vsync <= '1';
			elsif vcntReg = (vsync_base+17) mod 264 then vsync <= '0';
			end if;

			if    hcntReg = (127+16+9) then hblank <= '1';
			elsif hcntReg = (255-17+9+1) then hblank <= '0';
			end if;

			if    vcntReg = (240+1-1) then vblank <= '1';
			elsif vcntReg = (015+1) then vblank <= '0';
			end if;
		end if;
	end if;
end process;

end architecture;
