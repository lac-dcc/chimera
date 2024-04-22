---------------------------------------------------------------------------------
-- Xevious video horizontal/vertical and sync generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.ALL;

entity gen_video is
port(
clk     : in std_logic;
enable  : in std_logic;
hcnt    : out std_logic_vector(8 downto 0);
vcnt    : out std_logic_vector(8 downto 0);
hsync   : out std_logic;
vsync   : out std_logic;
csync   : out std_logic; -- composite sync for TV 
vbl     : out std_logic;
blankn  : out std_logic
);
end gen_video;

architecture struct of gen_video is
signal hclkReg : unsigned (1 DOWNTO 0);
signal hblank  : std_logic; 
signal vblank  : std_logic; 
signal hcntReg : unsigned (8 DOWNTO 0) := to_unsigned( 0,9);
signal vcntReg : unsigned (8 DOWNTO 0) := to_unsigned(15,9);

signal hsync0       : std_logic;
signal hsync1       : std_logic; 
signal hsync2       : std_logic; 

begin

hcnt  <= std_logic_vector(hcntReg);
vcnt  <= std_logic_vector(vcntReg);
hsync <= hsync0;
vbl <= vblank;

-- Compteur horizontal : 511-128+1=384 pixels (48 tiles)
-- 128 à 191 :  64 pixels debut de ligne  (8 dont 2 dernières tiles affichées)
-- 192 à 447 : 256 pixels centre de ligne (32 tiles affichées)
-- 448 à 511 :  64 pixels fin de ligne    (8 dont 2 premières tiles affichées)

-- Compteur vertical   : 263-000+1=264 lignes (33 tiles)
-- 000 à 015 :  16 lignes debut de trame  (2 tiles)
-- 016 à 239 : 224 lignes centrales       (28 tiles affichées)
-- 240 à 263 :  24 lignes fin de trame    (3 tiles

-- Synchro horizontale : hcnt=[495-511/128-140] (29 pixels)
-- Synchro verticale   : vcnt=[260-263/000-003] ( 8 lignes)

process(clk, enable)
begin

if rising_edge(clk) and enable = '1' then    -- clk & ena at 6MHz : 1 pixel

  if hcntReg = 511 then 
    hcntReg <= to_unsigned (128,9);
  else
    hcntReg <= hcntReg + 1;
  end if;

  if hcntReg = 511 then
    if vcntReg = 263 then
      vcntReg <= to_unsigned(0,9);
    else
      vcntReg <= vcntReg + 1;
    end if;
  end if;

  if    hcntReg = (495)        then hsync0 <= '0'; -- 1
  elsif hcntReg = (495+29-384) then	hsync0 <= '1';
  end if;

  if    hcntReg = (495)            then hsync1 <= '0';
  elsif hcntReg = (495+13)         then hsync1 <= '1'; -- 11
  elsif hcntReg = (495   +192-384) then hsync1 <= '0';
  elsif hcntReg = (495+13+192-384) then hsync1 <= '1'; -- 11
  end if;

  if    hcntReg = (495)     then hsync2 <= '0';
  elsif hcntReg = (495-28)  then hsync2 <= '1';
  end if;

  if     vcntReg = 252-1+2 then csync <= hsync1;
  elsif  vcntReg = 253-1+2 then csync <= hsync1;
  elsif  vcntReg = 254-1+2 then csync <= hsync1; -- and hsync2;
  elsif  vcntReg = 255-1+2 then csync <= hsync2; -- not(hsync1);
  elsif  vcntReg = 256-1+2 then csync <= hsync2; -- not(hsync1);
  elsif  vcntReg = 257-1+2 then csync <= hsync2; -- not(hsync1) or not(hsync2);
  elsif  vcntReg = 258-1+2 then csync <= hsync1;
  elsif  vcntReg = 259-1+2 then csync <= hsync1;
  elsif  vcntReg = 260-1+2 then csync <= hsync1;
  else                        csync <= hsync0;
  end if;

  if    vcntReg = 260 then vsync <= '0';
  elsif vcntReg = 003 then vsync <= '1';
  end if;

  if    hcntReg = (447+16+8+1) then hblank <= '1'; 
  elsif hcntReg = (191-16+8+1) then hblank <= '0';
  end if;

  if    vcntReg = (240+2) then vblank <= '1';
  elsif vcntReg = (016+2) then vblank <= '0';
  end if;

  blankn <= not (hblank or vblank); 

end if;

end process;

end architecture;