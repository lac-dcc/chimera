--
-- A simulation of Universal Cosmic video hardware
--
-- Mike Coates
--
-- version 001 initial release
--
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity COSMIC_VIDEO is
port (
	I_HCNT            : in    std_logic_vector(8 downto 0);
	I_VCNT            : in    std_logic_vector(8 downto 0);
	I_BITMAP  			: in    std_logic_vector(7 downto 0);
	I_COL     			: in    std_logic_vector(2 downto 0); -- colour page
	I_H_FLIP				: in    std_logic;	
	I_S_FLIP				: in    std_logic;
	I_BACKGND   		: in    std_logic;
	O_VADDR   			: out   std_logic_vector(12 downto 0);
	--
	I_SPR_ADD 			: in    std_logic_vector(4 downto 0);
	I_SPR_DAT         : in    std_logic_vector(7 downto 0);
	I_SPR_WR  			: in    std_logic;
	--
	dn_addr           : in    std_logic_vector(15 downto 0);
	dn_data           : in    std_logic_vector(7 downto 0);
	dn_wr             : in    std_logic;
	dn_ld	     			: in    std_logic;
	--
	O_RED             : out   std_logic_vector(3 downto 0);
	O_GREEN           : out   std_logic_vector(3 downto 0);
	O_BLUE            : out   std_logic_vector(3 downto 0);
	PIX_CLK           : in    std_logic;
	CLK		         : in    std_logic;
	CPU_ENA	         : in    std_logic;
	GAME              : in    std_logic_vector(7 downto 0);
        PAUSED            : in    std_logic
);
end;

architecture RTL of COSMIC_VIDEO is

signal col_cs			: std_logic;
signal map_cs			: std_logic;
signal sprite_l_cs	: std_logic;
signal sprite_h_cs	: std_logic;
signal op_rom1_cs    : std_logic;
signal op_rom2_cs    : std_logic;
signal col_pix			: std_logic_vector(7 downto 0);
signal char_pix_n		: std_logic_vector(7 downto 0);
signal char_pix_l		: std_logic_vector(7 downto 0);
signal sprite_pix_l  : std_logic_vector(7 downto 0);
signal sprite_pix_h  : std_logic_vector(7 downto 0);
signal col_addr		: std_logic_vector(10 downto 0);
signal sprite_addr	: std_logic_vector(11 downto 0);
signal col_ad			: std_logic_vector(10 downto 0);
signal op_pix			: std_logic_vector(7 downto 0);
signal op_pix2			: std_logic_vector(7 downto 0);
signal op_ad			: std_logic_vector(10 downto 0);
signal op_ad2			: std_logic_vector(10 downto 0);
signal op_addr			: std_logic_vector(10 downto 0);

-- Sprites
signal linebuffer_wraddr  : std_logic_vector(8 downto 0);
signal linebuffer_wr      : std_logic;
signal linebuffer_wr_data : std_logic_vector(2 downto 0);

signal linebuffer_clr     : std_logic;
signal linebuffer_rdaddr  : std_logic_vector(8 downto 0);
signal SP                 : std_logic_vector(2 downto 0);

type SA is array (0 to 7) of std_logic_vector(7 downto 0);
signal Sprite_N      : SA;
signal Sprite_X 		: SA;
signal Sprite_Y 		: SA;
signal Sprite_C      : SA;

type LC is array (0 to 7, 0 to 3) of std_logic_vector(7 downto 0);
signal Colour_P 		: LC;

signal sprite_ad		: std_logic_vector(11 downto 0);
signal sprite_buffer : std_logic := '0';
signal sprite_line   : integer;
signal sprite        : integer;
signal sprite_pos    : integer;
signal draw_sprite   : std_logic := '0';
signal I_Flip        : std_logic := '0';

signal charcolour    : std_logic_vector(3 downto 0);
signal sprite_red    : std_logic_vector(3 downto 0);
signal sprite_green  : std_logic_vector(3 downto 0);
signal sprite_blue   : std_logic_vector(3 downto 0);
signal sprite_pixel  : std_logic := '0';

-- Background related
signal back_red    : std_logic_vector(3 downto 0);
signal back_green  : std_logic_vector(3 downto 0);
signal back_blue   : std_logic_vector(3 downto 0);
signal frame       : std_logic_vector(7 downto 0) := "00000000";
signal RLECount    : std_logic_vector(7 downto 0);
signal RLEPIX      : std_logic_vector(7 downto 0) := "00000000";
signal RLEMask     : std_logic_vector(7 downto 0);
signal RLEDelay    : std_logic;
signal Tree    	 : std_logic_vector(3 downto 0);
signal River   	 : std_logic_vector(3 downto 0);
signal Riverframe  : std_logic_vector(7 downto 0) := "00000000";
type VA is array (0 to 255) of std_logic;
signal Vertical  : VA;

begin
	-- Load rom signals
	sprite_l_cs <= '1' when dn_addr(15 downto 12) = "0100" else '0';   		-- 4000-4FFF
	sprite_h_cs <= '1' when dn_addr(15 downto 12) = "0101" else '0';   		-- 5000-5FFF
	col_cs      <= '1' when dn_addr(15 downto 11) = "01100" else '0';  		-- 6000-67FF
	map_cs      <= '1' when dn_addr(15 downto 5) = "01101000000" else '0';  -- 6800-681F
	op_rom1_cs  <= '1' when dn_addr(15 downto 11) = "01110" else '0';  		-- 7000-77FF
	op_rom2_cs  <= '1' when dn_addr(15 downto 5) = "01111000000" else '0'; 	-- 7800-781F

	-- Address multiplex
	col_ad <= dn_addr(10 downto 0) when dn_ld='1' else col_addr;
	sprite_ad <= dn_addr(11 downto 0) when dn_ld='1' else sprite_addr;
	op_ad <= dn_addr(10 downto 0) when dn_ld='1' else op_addr;
	
	col_rom : entity work.spram
	generic map (
	  addr_width => 11
	)
	port map (
	  q        => col_pix,
	  data     => dn_data(7 downto 0),
	  address  => col_ad,
	  wren     => dn_wr and col_cs,
	  clock    => clk
   );

	sprite_rom_l : entity work.spram 
	generic map (
	  addr_width => 12
	)
	port map (
	  q        => sprite_pix_l,
	  data     => dn_data(7 downto 0),
	  address  => sprite_ad,
	  wren     => dn_wr and sprite_l_cs,
	  clock    => clk
   );	

	sprite_rom_h : entity work.spram 
	generic map (
	  addr_width => 12
	)
	port map (
	  q        => sprite_pix_h,
	  data     => dn_data(7 downto 0),
	  address  => sprite_ad,
	  wren     => dn_wr and sprite_h_cs,
	  clock    => clk
   );	

	-- RLE data for DevZone add 1, else second plane add $400
	op_ad2 <= op_ad + '1' when Game=4 else op_ad + "10000000000";
	
	op_rom : entity work.dpram
	generic map (
	  addr_width => 11
	)
	port map (
	  q_a       => op_pix,
	  data_a    => dn_data(7 downto 0),
	  address_a => op_ad,
	  wren_a    => dn_wr and op_rom1_cs,
	  clock     => clk,
	  
	  address_b => op_ad2,
	  q_b       => op_pix2
   );

	linebuffer : entity work.dpram
	generic map (
		addr_width => 9,
		data_width => 3
	)
	port map (
		q_a       => SP,
		data_a    => "000",
		address_a => linebuffer_rdaddr,
		wren_a    => linebuffer_clr,
		clock     => not CLK,

		address_b => linebuffer_wraddr,
		data_b    => linebuffer_wr_data,
		wren_b    => linebuffer_wr,
		q_b       => open
	);

-- Load pallette array
pallette : process
variable Entry, Color : integer;
begin
    wait until rising_edge(CLK);
	 
	 if (dn_wr='1') then
		if (map_cs='1') then
			Entry := to_integer(unsigned(dn_addr(4 downto 2)));
			Color := to_integer(unsigned(dn_addr(1 downto 0)));
			Colour_P(Entry,Color) <= dn_data(7 downto 0);
		 end if;
	 end if;
end process;

-- Vertical lines for Devil Zone
Vertical_Load : process
variable Entry : integer;
begin
    wait until rising_edge(CLK);

	 if (dn_wr='1') then
		if (op_rom2_cs='1') then
			Entry := to_integer(unsigned(dn_addr(4 downto 0))) * 8;
			Vertical(Entry)   <= dn_data(7);
			Vertical(Entry+1) <= dn_data(6);
			Vertical(Entry+2) <= dn_data(5);
			Vertical(Entry+3) <= dn_data(4);
			Vertical(Entry+4) <= dn_data(3);
			Vertical(Entry+5) <= dn_data(2);
			Vertical(Entry+6) <= dn_data(1);
			Vertical(Entry+7) <= dn_data(0);
		end if;
	 end if;
end process;

-- if both software and hardware flip the same, then don't flip background
I_FLIP <= '0' when (I_S_FLIP = I_H_FLIP) else '1';	
	
-- Video is bitmap using paged colour rom for colour map
vid_address : process
variable HADD : std_logic_vector(8 downto 0);
begin
	wait until rising_edge(CLK);

	 if (PIX_CLK = '1') then	

		if ((I_HCNT(8)='1' and I_VCNT(8)='1' and I_HCNT(2 downto 0)="101") or (I_HCNT="011111101")) then
			-- set address for video ram and colour ram
			HADD := I_HCNT + 3;   -- we want data for next character
			
			-- need to allow for screen flip (hardware and software!)
			if I_FLIP='0' then
				O_VADDR  <= I_VCNT(7 downto 0) & HADD(7 downto 3);	-- character = (v * 32) + ((h+3)/8)   (H = 0 to 31, V = 0,32,64 etc)	
				case Game is
					when x"01" => 
						-- Space Panic
						col_addr <= I_COL(2) & I_COL(0) & HADD(7 downto 4) & I_VCNT(7 downto 3);	-- col = page + (v/8 * 32) + ((h+3)/8)   (H = 0 to 31, V = 0,32,64 etc)
					when x"02" | x"04" | x"05" => 
						-- Magical Spot, Devil Zone and No Mans Land
						col_addr <= '0' & I_COL(0) & HADD(7 downto 3) & I_VCNT(7 downto 4);
					when x"03" =>
						-- Cosmic Alien
						col_addr <= '0' & I_COL(0) & HADD(7 downto 4) & I_VCNT(7 downto 3);
					when others => 
						null;
				end case;
			else
				O_VADDR  <= not I_VCNT(7 downto 0) & not HADD(7 downto 3);	-- inverted draw from bottom up
				case Game is
					when x"01" => 
						col_addr <= I_COL(2) & I_COL(0) & not HADD(7 downto 4) & not I_VCNT(7 downto 3);
					when x"02" | x"04" | x"05" =>
						col_addr <= '0' & I_COL(0) & not HADD(7 downto 3) & not I_VCNT(7 downto 4);
					when x"03" =>
						col_addr <= '0' & I_COL(0) & not HADD(7 downto 4) & not I_VCNT(7 downto 3);
					when others => 
						null;
				end case;
			end if;
		end if;

		if ((I_HCNT(8)='1' and I_VCNT(8)='1' and I_HCNT(2 downto 0)="111") or (I_HCNT="011111111")) then

			if (I_COL(1)='1') then
				charcolour <= col_pix(7 downto 4);
			else
				charcolour <= col_pix(3 downto 0);
			end if;
			
			-- Only space panic uses 4 bits of colour info
			if GAME /= 1 then
				charcolour(3) <= '0';
			end if;
			
			if I_FLIP='1' then
				char_pix_n <= I_BITMAP;
			else
				char_pix_n <= I_BITMAP(0) & I_BITMAP(1) & I_BITMAP(2) & I_BITMAP(3) & I_BITMAP(4) & I_BITMAP(5) & I_BITMAP(6) & I_BITMAP(7);
			end if;
		end if;
	end if;
end process;

backround_draw : process
variable pixel  : std_logic;
begin
    wait until rising_edge(CLK);
	 
    if (PIX_CLK = '1') then	

			if (PAUSED = '0') then
				-- Frame counter (for background circuits)
				if I_HCNT="011111100" then
					if I_VCNT="011111111" then
						frame <= frame + 1;
						if I_FLIP='0' then
							Riverframe <= frame;
						else
							Riverframe <= not frame;
						end if;
					else
						Riverframe <= Riverframe + 1;
					end if;
				end if;
		end if;
	 
		--  if in visible area 
		if I_HCNT(8)='1' and I_VCNT(8)='1' and I_VCNT(7 downto 5) /= "111" then -- skip rows one side and > 224 : and I_VCNT(7 downto 3) /= "00000"
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

			 -- Sprite have priority over background
			 if (sprite_blue /= "0000" or sprite_green /= "0000" or sprite_red /= "0000") then
					O_BLUE <=  sprite_blue;
					O_GREEN <= sprite_green;
					O_RED <= sprite_red;
			 else
					if pixel='1' then				  
						-- Blue has 2 options on Space Panic (using charcolour 3)
						if charcolour(2)='1' then
						  O_BLUE <= "1111";
						elsif charcolour(3)='1' then
						  O_BLUE <= "1100";
						else
						  O_BLUE <= "0000";
						end if;
						O_GREEN <= charcolour(1) & charcolour(1) & charcolour(1) & charcolour(1);
						O_RED <=   charcolour(0) & charcolour(0) & charcolour(0) & charcolour(0);
					else
						if I_BACKGND='1' or Game=3 then
							-- use feed from background generator
							O_BLUE  <= back_blue;
							O_RED   <= back_red;
							O_GREEN <= back_green;
						else
							-- No background, so black
							O_BLUE  <= "0000";
							O_GREEN <= "0000";
							O_RED   <= "0000";
						end if;
					end if;
			 end if;			 
		else
			O_BLUE  <= "0000";
			O_GREEN <= "0000";
			O_RED   <= "0000";
		end if;
	end if;
end process;


-- Some games have prom drive backgrounds

background_circuits : process
variable X1,X2 : unsigned(9 downto 0);
variable H,V : integer;
variable Plane1, Plane2 : std_logic;
begin
   wait until rising_edge(CLK);
	
   if (PIX_CLK = '1') then	

		back_red <= "0000";
		back_green <= "0000";
		back_blue <= "0000";
	
		if Game = 3 then

			-- Cosmic Alien - Stars
			
			if (I_VCNT(8)='1' and (I_HCNT(8)='1' or I_HCNT="011111101" or I_HCNT="011111110")) then

				-- Pixel we are looking for
				X2 := "0000000011" + unsigned(I_HCNT(7 downto 0));
				if I_FLIP='1' then
					X1 := X2 - unsigned(frame);
				else
					X1 := X2 + unsigned(frame);
				end if;
			
				-- Set address for prom
				if X1(4 downto 0) = "00000" then
					op_addr(10) <= '0';
					op_addr(9 downto 3) <= std_logic_vector(I_VCNT(7 downto 1));
					op_addr(2 downto 0)  <= std_logic_vector(X1(7 downto 5));
				end if;
				
				-- Use prom to set stars
				if (X1(2)='0' or I_VCNT(0)='0') and (I_HCNT(5) /= I_VCNT(1)) then
					if X1(4) /= op_pix(4) and X1(3) /= op_pix(3) and X1(2) /= op_pix(2) and X1(1) /= op_pix(1) and (X1(0) = op_pix(0) or X1(2)='0') then
						-- Draw a star!
						back_red <= op_pix(7) & op_pix(7) & op_pix(7) & op_pix(7);
						back_green <= op_pix(6) & op_pix(6) & op_pix(6) & op_pix(6);
						back_blue <= op_pix(5) & op_pix(5) & op_pix(5) & op_pix(5);
					end if;
				end if;

			end if;
			
		elsif Game = 4 then
		
			-- Devil Zone : Grid
		
			if (I_VCNT(8)='1' and (I_HCNT(8)='1' or I_HCNT="011111111")) then

				-- Get Horizontal and Vertical counters
				H := to_integer(unsigned(I_HCNT(7 downto 0))) + 1;
				V := to_integer(unsigned(I_VCNT(7 downto 0)));
				
				-- Adjust So doesn't exceed boundary
				if H > 255 then
					H := 0;
				end if;
					
				
				-- Other lines (RLE from prom 1)
				-- only goes from vertical row 32 to 224
				CASE V is
				
					when 30 =>
						-- Start of screen
						if I_HCNT="100000000" then -- "011111111"
							if I_FLIP='1' then
								-- go backwards
								op_addr <= "11111111101"; -- $7FD
							else
								-- Skip 1st 2 bytes
								op_addr <= "00000000010"; -- $002
							end if;
						end if;
				
					when 31 =>
						-- Load starter characters
						if I_HCNT="100000000" then -- "011111111"
							if I_FLIP='1' then
								-- go backwards (data and count reversed)
								RLECount <= op_pix2;
								RLEMask  <= op_pix(0) & op_pix(1) & op_pix(2) & op_pix(3) & op_pix(4) & op_pix(5) & op_pix(6) & op_pix(7);
								op_addr  <= op_addr - 2;
							else
								RLECount <= op_pix;
								RLEMask  <= op_pix2;
								op_addr  <= op_addr + 2;
							end if;
						end if;
						
					when 32 to 224 =>

						-- every pixel, rotate PIX to use on screen
						RLEPIX <= RLEPIX(6 downto 0) & '1';
											
						-- every character, increment counter and check if next data pair needed
						if I_H_FLIP='1' and I_S_FLIP='1' then
							X2(2 downto 0) := unsigned(I_HCNT(2 downto 0)) + 1;
						else
							X2(2 downto 0) := unsigned(I_HCNT(2 downto 0));							
						end if;
						
						if X2(2 downto 0) = "110" then -- check 6 as we want 7! - was I_HCNT
							if RLECount = "11111111" then
								-- Action data for this pair and load next pair
								RLEPIX   <= RLEMask;
								RLECount <= op_pix;
								if I_FLIP='1' then
									-- go backwards (data and count reversed)
									RLECount <= op_pix2;
									RLEMask  <= op_pix(0) & op_pix(1) & op_pix(2) & op_pix(3) & op_pix(4) & op_pix(5) & op_pix(6) & op_pix(7);
									op_addr  <= op_addr - 2;
								else
									RLECount <= op_pix;
									RLEMask  <= op_pix2;
									op_addr  <= op_addr + 2;
								end if;
							else
								RLECount <= RLECount + 1;
							end if;
						end if;
						
					when others => null;
				end case;

				-- Hardware flip needs offset each mode (real hardware doesn't have it, just cocktail flip)
				if I_H_FLIP='1' then
					if I_S_FLIP='1' then
						H := H + 2;
					else
						H := 255 - H;
					end if;
				else
					if I_S_FLIP='1' then
						H := 257 - H;
					end if;
				end if;
				
				-- Vertical lines or RLE data
				if I_H_FLIP='1' then
					if Vertical(H)='0' or RLEPIX(7)='0' then
						back_blue <= "1111";
					end if;
				else
					if I_S_FLIP='0' then
						if Vertical(H)='0' or RLEPIX(7)='0' then
							back_blue <= "1111";
						end if;
					else
						-- Delay RLE data by 1 pixel if software flipped
						if Vertical(H)='0' or RLEDelay='0' then
							back_blue <= "1111";
						end if;
						RLEDelay <= RLEPIX(7);
					end if;
				end if;
								
			end if;

		elsif Game = 5 then
		
			-- No mans land : Trees and River
			Tree  <= "0000";
			River <= "0000";

			if (I_VCNT(8)='1' and (I_HCNT(8)='1' or I_HCNT="011111110"or I_HCNT="011111111")) then

				-- Hardware flip needs offset each mode (real hardware doesn't have it, just cocktail flip)
				if I_H_FLIP='0' then
					-- Get corrected Horizontal and Vertical counters (H in 2 pixels time)
					if I_S_FLIP='0' then
						X1 := "0000000010" + unsigned(I_HCNT(7 downto 0));
						X2(8 downto 0) := unsigned(I_VCNT);
					else
						X1 := 511 - ("0000000000" + unsigned(I_HCNT(7 downto 0)));
						X2(8 downto 0) := 511 - unsigned(I_VCNT);
					end if;
				else
					-- Hardware Flip On - so software flip does the opposite
					if I_S_FLIP='1' then
						X1 := "0000000010" + unsigned(I_HCNT(7 downto 0)) + 2;
						X2(8 downto 0) := unsigned(I_VCNT);
					else
						X1 := 511 - ("0000000010" + unsigned(I_HCNT(7 downto 0)));
						X2(8 downto 0) := 511 - unsigned(I_VCNT);
					end if;
				end if;
				

				if X2(7 downto 5)="010" or X2(7 downto 5)="101" then

					-- Trees 
					if X1(7 downto 5)="010" then
					
						op_addr <= "000" & I_FLIP & std_logic_vector(X2(4 downto 0)) & std_logic_vector(X1(4 downto 3));
						Tree  <= '1' & std_logic_vector(X1(2 downto 0));
					
					end if;
				
				else
				
					-- Water
					if X1(7 downto 4)="1010" then
					
						op_addr <= "01" & std_logic_vector(Riverframe) & X1(3);
						River   <= '1' & std_logic_vector(X1(2 downto 0));
						
					end if;
				
				end if;
				
				if Tree(3)='1' then
					
					Plane1 := op_pix(7 - to_integer(unsigned(Tree(2 downto 0))));
					Plane2 := op_pix2(7 - to_integer(unsigned(Tree(2 downto 0))));
					
					if plane1='1' and plane2='1' then back_red <= "1111"; end if;
					if plane2='1' then back_green <= "1111"; end if;
					if plane1='1' and plane2='0' then back_blue <= "1111"; end if;

				elsif River(3)='1' then

					Plane1 := op_pix(7 - to_integer(unsigned(River(2 downto 0))));
					Plane2 := op_pix2(7 - to_integer(unsigned(River(2 downto 0))));
				
					if plane1='1' and plane2='1' then back_red <= "1111"; end if;
					if plane1='1' or Plane2='1' then back_green <= "1111"; end if;
					if plane1='0' and op_addr(0)='1' then back_blue <= "1111"; end if;
					
				end if;
				
			end if;
				
		end if;
	
	end if;
	
end process;
	
-- ditto for sprite drawing (sprite block, which could be any position H & V!)

-- _N 	zero = no sprite to be drawn
-- 		bit 7 : 0 = 32x32,1 = 16x16
--       bit 6 : 0 = left to right, 1 = right to left
--       rest  : inverse of sprite number (see C)
-- _X    horizontal position inverted
-- _Y    vertical position inverted - 1 (from Mame)
-- _C    bit 3 : extended sprite number (for some games)
--       bits 0-2 : colour map entry

-- hardware supports 8 sprites in 16x16 or 32x32
sprite_draw : process
	variable V_OFF,H_OFF : integer;
	variable pixel : std_logic_vector(1 downto 0);
	variable Entry : integer;
	variable Color : integer;
begin
   wait until rising_edge(CLK);

   linebuffer_wr <= '0';
   linebuffer_clr <= '0';
   if I_H_FLIP='0' then
      H_OFF := to_integer(unsigned(I_HCNT(7 downto 0))) + 1;
   else
      H_OFF := 254-to_integer(unsigned(I_HCNT(7 downto 0))); -- Was 255
   end if;
   linebuffer_rdaddr <= std_logic_vector((not sprite_buffer)&""&to_unsigned(H_OFF,8));

   if (PIX_CLK = '1') then	
	
		if (I_HCNT = "011111110") then
			-- just before start of line, set up variables to use
			if I_H_FLIP='0' then
				sprite_line <= to_integer(unsigned(I_VCNT(7 downto 0))) + 1;	-- Line to draw
			else
				sprite_line <= 254 - to_integer(unsigned(I_VCNT(7 downto 0)));	-- Line to draw
			end if;
			sprite_buffer <= I_VCNT(0);												-- buffer to write to
			sprite <= 0;																	-- sprite number to draw
		elsif (I_HCNT(8)='1' and I_HCNT(4 downto 0)="11110") then
			sprite <= sprite + 1;
		end if;
		
		if ((I_HCNT(8)='1' and I_HCNT(4 downto 0)="11111") or I_HCNT = "011111111") then
			if (Sprite_N(sprite) /= "00000000") then
				-- see if sprite visible on this line
				V_OFF := sprite_line - to_integer(unsigned(Sprite_Y(sprite)));
				-- 16x16 or 32x32 - based on Sprite_N(sprite)(7)
				if ((Sprite_N(sprite)(7)='1' and V_OFF>=0 and V_OFF<=15) or (Sprite_N(sprite)(7)='0' and V_OFF>=0 and V_OFF<=31)) then
					-- Sprite inverted, modify row data to draw correct sprite data. 
					if (Sprite_N(sprite)(6)='0') then
						if (Sprite_N(sprite)(7)='1') then
							V_OFF := 15 - V_OFF;
						else
							V_OFF := 31 - V_OFF;
						end if;
					end if;
					-- set address for sprite data 
					if GAME = 1 then
						-- Extended sprite range
						sprite_addr <= Sprite_C(sprite)(3) & (not Sprite_N(sprite)(5 downto 0)) & std_logic_vector(to_unsigned(V_OFF, 5));
					else
						-- Normal sprite range
						sprite_addr <= '0' & (not Sprite_N(sprite)(5 downto 0)) & std_logic_vector(to_unsigned(V_OFF, 5));
					end if;
					sprite_pos <= 256 - to_integer(unsigned(Sprite_X(sprite)));
					draw_sprite <= '1';
				else
					draw_sprite <= '0';
				end if;
			else
				draw_sprite <= '0';
			end if;
		end if;
	
		-- Copy sprite to buffer
		if (draw_sprite='1' and I_HCNT(8)='1') then
			H_OFF := to_integer(unsigned(I_HCNT(4 downto 0)));
			sprite_pos <= sprite_pos + 1;

			case H_OFF is
		
				when  0 | 8 | 16 | 24 =>  pixel := sprite_pix_l(7) & sprite_pix_h(7);
				when  1 | 9 | 17 | 25 =>  pixel := sprite_pix_l(6) & sprite_pix_h(6);
				when  2 | 10 | 18 | 26 => pixel := sprite_pix_l(5) & sprite_pix_h(5);
				when  3 | 11 | 19 | 27 => pixel := sprite_pix_l(4) & sprite_pix_h(4);
				when  4 | 12 | 20 | 28 => pixel := sprite_pix_l(3) & sprite_pix_h(3);
				when  5 | 13 | 21 | 29 => pixel := sprite_pix_l(2) & sprite_pix_h(2);
				when  6 | 14 | 22 | 30 => pixel := sprite_pix_l(1) & sprite_pix_h(1);
				when  7 =>
					pixel := sprite_pix_l(0) & sprite_pix_h(0);
					-- get next byte of sprite data
					if Sprite_N(sprite)(7)='1' then
						sprite_addr <= sprite_addr + 16;
					else
						sprite_addr <= sprite_addr + 32;
					end if;
				when  15 =>
					pixel := sprite_pix_l(0) & sprite_pix_h(0);
					if Sprite_N(sprite)(7)='1' then
						draw_sprite <= '0';
					else
						sprite_addr <= sprite_addr + 32;
					end if;
				when 23 =>
					pixel := sprite_pix_l(0) & sprite_pix_h(0);
					sprite_addr <= sprite_addr + 32;
				when 31 => 
					pixel := sprite_pix_l(0) & sprite_pix_h(0);
					draw_sprite <= '0';
					
				when others => pixel := "00";
			end case;
			
			-- plot pixel into linebuffer (after converting to colours)
			if (pixel /= "00") then -- Transparency
				Entry := to_integer(unsigned(not Sprite_C(sprite)(2 downto 0)));
				Color := to_integer(unsigned(pixel));

				linebuffer_wraddr <= std_logic_vector(sprite_buffer&""&to_unsigned(sprite_pos,8));
				linebuffer_wr_data <= Colour_P(Entry,Color)(2 downto 0);
				linebuffer_wr <= '1';
			end if;
		end if;

		-- Read and clear other buffer for drawing
		if (I_HCNT(8)='1' or I_HCNT = "011111111") then
			sprite_blue  <= SP(2) & SP(2) & SP(2) & SP(2);
			sprite_green <= SP(1) & SP(1) & SP(1) & SP(1);
			sprite_red   <= SP(0) & SP(0) & SP(0) & SP(0);
			linebuffer_clr <= '1';
		end if;

	end if;
	
end process;

-- Sprite register writes, store in arrays for ease of processing
SPR_Write : process (CLK)
variable spr_no : integer;
begin
	if rising_edge(CLK) then
		if (CPU_ENA='1' and I_SPR_WR ='1') then

			spr_no := to_integer(unsigned(I_SPR_ADD(4 downto 2)));

			case I_SPR_ADD(1 downto 0) is
				when "00" => Sprite_N(spr_no) <= I_SPR_DAT;
				when "01" => Sprite_Y(spr_no) <= I_SPR_DAT;
				when "10" => Sprite_X(spr_no) <= I_SPR_DAT;
				when "11" => Sprite_C(spr_no) <= I_SPR_DAT;
				when others => null;
			end case;
		end if;
	end if;
end process;

end architecture;
