--
-- A simulation of Crazy Balloon
--
-- Mike Coates
--
-- version 001 initial release
--
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity CRAZYBALLOON_VIDEO is
port (
	I_HCNT            : in    std_logic_vector(8 downto 0);
	I_VCNT            : in    std_logic_vector(8 downto 0);
	I_CHAR    			: in    std_logic_vector(7 downto 0);
	I_COL     			: in    std_logic_vector(3 downto 0);
	I_CLEAR           : in    std_logic;
	I_FLIP				: in    std_logic;
	O_COLLIDE 		   : out   std_logic_vector(11 downto 0);
	O_VADDR   			: out   std_logic_vector(9 downto 0);
	--
	I_SPRITE_H        : in    std_logic_vector(7 downto 0);
	I_SPRITE_V        : in    std_logic_vector(7 downto 0);
	I_SPRITE_C        : in    std_logic_vector(3 downto 0);
	I_SPRITE_I        : in    std_logic_vector(3 downto 0);
	--
--	dn_addr           : in    std_logic_vector(15 downto 0);
--	dn_data           : in    std_logic_vector(7 downto 0);
--	dn_wr             : in    std_logic;
--	dn_ld	     			: in    std_logic;
	--
	O_RED             : out   std_logic_vector(1 downto 0);
	O_GREEN           : out   std_logic_vector(1 downto 0);
	O_BLUE            : out   std_logic_vector(1 downto 0);
	PIX_CLK           : in    std_logic;
	CLK		         : in    std_logic
);
end;

architecture RTL of CRAZYBALLOON_VIDEO is

signal char_cs			: std_logic;
signal sprite_cs		: std_logic;
signal char_pix		: std_logic_vector(7 downto 0);
signal char_pix_n		: std_logic_vector(7 downto 0);
signal char_pix_l		: std_logic_vector(7 downto 0);
signal sprite_pix	   : std_logic_vector(7 downto 0);
signal char_addr		: std_logic_vector(10 downto 0);
signal sprite_addr	: std_logic_vector(10 downto 0);
signal char_ad			: std_logic_vector(10 downto 0);
signal sprite_ad		: std_logic_vector(10 downto 0);

--signal load          : std_logic;
signal charcolour    : std_logic_vector(3 downto 0);
signal back_red      : std_logic_vector(1 downto 0);
signal back_green    : std_logic_vector(1 downto 0);
signal back_blue     : std_logic_vector(1 downto 0);
signal sprite_red    : std_logic_vector(1 downto 0);
signal sprite_green  : std_logic_vector(1 downto 0);
signal sprite_blue   : std_logic_vector(1 downto 0);
signal sprite_pixel  : std_logic := '0';

begin
	
char_rom : entity work.gfx1
port map(
	clk    	=> clk,
	addr  	=> char_addr,
	data     => char_pix
);

sprite_rom : entity work.gfx2
port map(
	clk    	=> clk,
	addr  	=> sprite_addr,
	data     => sprite_pix
);	

vid_address : process
variable HADD, VADD : std_logic_vector(8 downto 0);
begin
	wait until rising_edge(PIX_CLK);
	
	if ((I_HCNT(8)='1' and I_VCNT(8)='1' and I_HCNT(2 downto 0)="101") or (I_HCNT="011111101")) then
		-- set address for character ram and colour ram
		HADD := I_HCNT + 3;   -- we want data for next character
		
		-- need to allow for screen flip!
		if I_FLIP='0' then
			O_VADDR <=  I_VCNT(7 downto 3) & HADD(7 downto 3);	-- character = ((v/8) * 32) + ((h+3)/8)   (H = 0 to 31, V = 0,32,64 etc)
		else
			-- first 4 characters are blank, so when inverted, we still want first 4 to be blank, so move reference point!
			VADD := I_VCNT - 32;
			O_VADDR <=  not (VADD(7 downto 3) & HADD(7 downto 3));	-- inverted draw from bottom up
		end if;
	end if;

	if ((I_HCNT(8)='1' and I_VCNT(8)='1' and I_HCNT(2 downto 0)="110") or (I_HCNT="011111110")) then
	   -- get character number and set address of character row in char-rom (based on character number and vertical line number of character 0-7)		
		if I_FLIP='0' then
			char_addr <= I_CHAR(7 downto 0) & I_VCNT(2 downto 0); -- combine character * 8 + lower 3 bits of vertical to get char image data
		else
			char_addr <= I_CHAR(7 downto 0) & not(I_VCNT(2 downto 0)); -- combine character * 8 + inverted lower 3 bits of vertical
		end if;
	end if;

	if ((I_HCNT(8)='1' and I_VCNT(8)='1' and I_HCNT(2 downto 0)="111") or (I_HCNT="011111111")) then
		-- get character data		** need to allow for screen flip! **
		charcolour <= not I_COL;
		if I_FLIP='0' then
			char_pix_n <= char_pix;
		else
			char_pix_n <= char_pix(0) & char_pix(1) & char_pix(2) & char_pix(3) & char_pix(4) & char_pix(5) & char_pix(6) & char_pix(7);
		end if;
	end if;

end process;

backround_draw : process
variable pixel : std_logic;
begin
	wait until rising_edge(PIX_CLK);

	-- Clear collision position
	if I_CLEAR='1' then
		O_COLLIDE <= x"000";
	end if;
	
   --   if in visible area 
	if I_HCNT(8)='1' and I_VCNT(8)='1' and I_VCNT(7 downto 4) /= "0000" then -- skip rows one side
		 case I_HCNT(2 downto 0) is
			when "000" => pixel := char_pix_n(0);
			              char_pix_l <= char_pix_n;
			when "001" => pixel := char_pix_l(1);
			when "010" => pixel := char_pix_l(2);
			when "011" => pixel := char_pix_l(3);
			when "100" => pixel := char_pix_l(4);
			when "101" => pixel := char_pix_l(5);
			when "110" => pixel := char_pix_l(6);
			when "111" => pixel := char_pix_l(7);
		 end case;
	
		 if pixel='1' then
		     O_BLUE <= (charcolour(3) and charcolour(2)) & charcolour(2);
		     O_GREEN <= (charcolour(3) and charcolour(1)) & charcolour(1);
		     O_RED <= (charcolour(3) and charcolour(0)) & charcolour(0);
		 else
			  -- No background, show sprite
			  O_BLUE <=  sprite_blue;
			  O_GREEN <= sprite_green;
			  O_RED <= sprite_red;
		 end if;
		 
		 if pixel='1' and sprite_pixel='1' then
			-- if sprite and background present we have collision
			O_COLLIDE <= ("00" & I_VCNT(7 downto 3) & I_HCNT(7 downto 3)) + 1;
		 end if;
	else
		O_BLUE <= "00";
		O_GREEN <= "00";
		O_RED <= "00";
	end if;

end process;
	
-- ditto for sprite drawing (sprite block, which could be any position H & V!)

sprite_draw : process
variable V_OFF,H_OFF : integer;
variable pixel : std_logic;
begin
	wait until rising_edge(PIX_CLK);
	
	-- sprite draws from position to position+31 in each direction
	
	V_OFF := to_integer(unsigned(I_VCNT(7 downto 0)) - unsigned(I_SPRITE_V));
	H_OFF := to_integer(unsigned(I_HCNT(7 downto 0)) - unsigned(I_SPRITE_H) + 33); -- offset by 32, but we want everything 1 pixel earlier
	
	if (V_OFF>=0 and V_OFF<=31) then
	
		case H_OFF is
		
			WHEN -1 =>
				-- Set sprite address to get sprite pixel data 
				sprite_addr <= I_SPRITE_I & "00" & std_logic_vector(to_unsigned(V_OFF, 5));
				pixel := '0';
			when  0 | 8 | 16 | 24 => pixel := sprite_pix(0);
			when  1 | 9 | 17 | 25 => pixel := sprite_pix(1);
			when  2 | 10 | 18 | 26 => pixel := sprite_pix(2);
			when  3 | 11 | 19 | 27 => pixel := sprite_pix(3);
			when  4 | 12 | 20 | 28 => pixel := sprite_pix(4);
			when  5 | 13 | 21 | 29 => pixel := sprite_pix(5);
			when  6 | 14 | 22 | 30 => pixel := sprite_pix(6);
			when  7 | 15 | 23 =>
				pixel := sprite_pix(7);
				-- get next byte
				sprite_addr <= sprite_addr + 32; -- 1;
			when 31 => pixel := sprite_pix(7);
			when others => pixel := '0';
		end case;

		sprite_pixel <= pixel;
		if pixel='1' then
		     sprite_blue <= (I_SPRITE_C(3) and I_SPRITE_C(2)) & I_SPRITE_C(2);
		     sprite_green <= (I_SPRITE_C(3) and I_SPRITE_C(1)) & I_SPRITE_C(1);
		     sprite_red <= (I_SPRITE_C(3) and I_SPRITE_C(0)) & I_SPRITE_C(0);
		else
			  sprite_blue <=  "00";
			  sprite_green <= "00";
			  sprite_red <= "00";
		end if;	
	else
		  sprite_blue <=  "00";
		  sprite_green <= "00";
		  sprite_red <= "00";	
	end if;	
				
end process;

end architecture;
