-------------------------------------------------------------------------------
--
-- A VGA line-doubler for an Apple ][
--
-- Stephen A. Edwards, sedwards@cs.columbia.edu
--
--
-- FIXME: This is all wrong
--
-- The Apple ][ uses a 14.31818 MHz master clock.  It outputs a new
-- horizontal line every 65 * 14 + 2 = 912 14M cycles.  The extra two
-- are from the "extended cycle" used to keep the 3.579545 MHz
-- colorburst signal in sync.  Of these, 40 * 14 = 560 are active video.
--
-- In graphics mode, the Apple effectively generates 140 four-bit pixels
-- output serially (i.e., with 3.579545 MHz pixel clock).  In text mode,
-- it generates 280 one-bit pixels (i.e., with a 7.15909 MHz pixel clock).
--
-- We capture 140 four-bit nibbles for each line and interpret them in
-- one of the two modes.  In graphics mode, each is displayed as a
-- single pixel of one of 16 colors.  In text mode, each is displayed
-- as two black or white pixels.
-- 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_controller is
	port (
		CLK_14M    : in  std_logic;	     -- 14.31818 MHz master clock

		VIDEO      : in std_logic;         -- from the Apple video generator
		COLOR_LINE : in std_logic;
		SCREEN_MODE: in std_logic_vector(1 downto 0); -- 00: Color, 01: B&W, 10: Green, 11: Amber
		HBL        : in std_logic;
		VBL        : in std_logic;

		VGA_HS     : out std_logic;
		VGA_VS     : out std_logic;
		VGA_HBL    : out std_logic;
		VGA_VBL    : out std_logic;
		VGA_R      : out unsigned(7 downto 0);
		VGA_G      : out unsigned(7 downto 0);
		VGA_B      : out unsigned(7 downto 0)
	);
end vga_controller;

architecture rtl of vga_controller is

	-- RGB values from Linards Ticmanis (posted on comp.sys.apple2 on 29-Sep-2005)
	-- https://groups.google.com/g/comp.sys.apple2/c/uILy74pRsrk/m/G9XDxQhWi1AJ

	type basis_color is array(0 to 3) of unsigned(7 downto 0);
	constant basis_r : basis_color := ( X"88", X"38", X"07", X"38" );
	constant basis_g : basis_color := ( X"22", X"24", X"67", X"52" );
	constant basis_b : basis_color := ( X"2C", X"A0", X"2C", X"07" );

	signal shift_reg : unsigned(5 downto 0);  -- Last six pixels

	signal last_hbl : std_logic;
	signal hcount : unsigned(10 downto 0);
	signal vcount : unsigned(5 downto 0);

	constant VGA_HSYNC : integer := 68;
	constant VGA_ACTIVE : integer := 282 * 2;
	constant VGA_FRONT_PORCH : integer := 130;

	constant VBL_TO_VSYNC : integer := 33;
	constant VGA_VSYNC_LINES : integer := 3;

	signal vbl_delayed : std_logic;
	signal de_delayed : std_logic_vector(17 downto 0);

begin

process (CLK_14M)
begin
	if rising_edge(CLK_14M) then
		if last_hbl = '1' and HBL = '0' then  -- Falling edge
			hcount <= (others => '0');
			vbl_delayed <= VBL;
			if VBL = '1' then
				vcount <= vcount + 1;
			else
				vcount <= (others => '0');
			end if;
		else
			hcount <= hcount + 1;
		end if;
		last_hbl <= HBL;
	end if;
end process;

process (CLK_14M)
begin
	if rising_edge(CLK_14M) then
		if hcount = VGA_ACTIVE + VGA_FRONT_PORCH then
			VGA_HS <= '1';
			if vcount = VBL_TO_VSYNC then
				VGA_VS <= '1';
			elsif vcount = VBL_TO_VSYNC + VGA_VSYNC_LINES then
				VGA_VS <= '0';
			end if;
		elsif hcount = VGA_ACTIVE + VGA_FRONT_PORCH + VGA_HSYNC then
			VGA_HS <= '0';
		end if;
	end if;
end process;

process (CLK_14M)
	variable r, g, b : unsigned(7 downto 0); 
begin
	if rising_edge(CLK_14M) then
		shift_reg <= VIDEO & shift_reg(5 downto 1);

		r := X"00";
		g := X"00"; 
		b := X"00"; 
		
		-- alternate background for monochrome modes
		case SCREEN_MODE is 
			when "00" => r := X"00"; g := X"00"; b := X"00"; -- color mode background
			when "01" => r := X"00"; g := X"00"; b := X"00"; -- B&W mode background
			when "10" => r := X"00"; g := X"0F"; b := X"01"; -- green mode background color
			when "11" => r := X"20"; g := X"08"; b := X"01"; -- amber mode background color
		end case;
		
		if COLOR_LINE = '0' then  -- Monochrome mode
		 
			if shift_reg(2) = '1' then
				-- handle green/amber color modes
				case SCREEN_MODE is 
					when "00" => r := X"FF"; g := X"FF"; b := X"FF"; -- white (color mode)
					when "01" => r := X"FF"; g := X"FF"; b := X"FF"; -- white (B&W mode)
					when "10" => r := X"00"; g := X"C0"; b := X"01"; -- green
					when "11" => r := X"FF"; g := X"80"; b := X"01"; -- amber 
				end case;
			end if;
		elsif shift_reg(0) = shift_reg(4) and shift_reg(5) = shift_reg(1) then
		 
			-- Tint of adjacent pixels is consistent : display the color
			if shift_reg(3) = '1' then
				r := r + basis_r(to_integer(hcount + 1));
				g := g + basis_g(to_integer(hcount + 1));
				b := b + basis_b(to_integer(hcount + 1));
			end if;
			if shift_reg(4) = '1' then
				r := r + basis_r(to_integer(hcount + 2));
				g := g + basis_g(to_integer(hcount + 2));
				b := b + basis_b(to_integer(hcount + 2));
			end if;
			if shift_reg(1) = '1' then
				r := r + basis_r(to_integer(hcount + 3));
				g := g + basis_g(to_integer(hcount + 3));
				b := b + basis_b(to_integer(hcount + 3));
			end if;
			if shift_reg(2) = '1' then
				r := r + basis_r(to_integer(hcount));
				g := g + basis_g(to_integer(hcount));
				b := b + basis_b(to_integer(hcount));
			end if;
		else
		 
			-- Tint is changing: display only black, gray, or white
			case shift_reg(3 downto 2) is
				when "11"        => r := X"FF"; g := X"FF"; b := X"FF";
				when "01" | "10" => r := X"80"; g := X"80"; b := X"80";
				when others      => r := X"00"; g := X"00"; b := X"00";
			end case;
		end if;
		  
		VGA_R <= r;
		VGA_G <= g;
		VGA_B <= b;
		
		de_delayed <= de_delayed(16 downto 0) & last_hbl;
	end if;
end process pixel_generator;

VGA_VBL <= vbl_delayed;
VGA_HBL <= de_delayed(9) and de_delayed(17);

end rtl;
