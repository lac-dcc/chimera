---------------------------------------------------------------------------------
-- Galaga video horizontal/vertical and sync generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.ALL;

entity gen_video is
port(
	clk     : in std_logic;
	enable  : in std_logic;
	hcnt    : out std_logic_vector(5 downto 0);
	vcnt    : out std_logic_vector(5 downto 0);
	hsync   : out std_logic;
	vsync   : out std_logic;
	blankn  : out std_logic
);
end gen_video;

architecture struct of gen_video is
	signal hblank  : std_logic; 
	signal vblank  : std_logic; 
	signal hcntReg : unsigned (5 DOWNTO 0) := to_unsigned(000,9);
	signal vcntReg : unsigned (5 DOWNTO 0) := to_unsigned(015,9);
begin

hcnt  <= std_logic_vector(hcntReg);
vcnt  <= std_logic_vector(vcntReg);


process(clk) begin

		if enable = '1' then

			if hcntReg = 511 then 
				hcntReg <= to_unsigned (128,9);
			else
				hcntReg <= hcntReg + 1;
			end if;

			if hcntReg = 191 then
				if vcntReg = 261 then
					vcntReg <= to_unsigned(0,9);
				else
					vcntReg <= vcntReg + 1;
				end if;
			end if;

			if    hcntReg = (175+ 0-8+8) then hsync <= '1'; -- 1
			elsif hcntReg = (175+29-8+8) then hsync <= '0';
			end if;

			if    vcntReg = 252 then vsync <= '1';
			elsif vcntReg = 260 then vsync <= '0';
			end if;

			if    hcntReg = (127+16+8) then hblank <= '1'; 
			elsif hcntReg = (255-17+8+1) then hblank <= '0';
			end if;

			if    vcntReg = (240+1-1) then vblank <= '1';
			elsif vcntReg = (015+1) then vblank <= '0';
			end if;

			blankn <= not (hblank or vblank); 
		end if;

end process;

end architecture;