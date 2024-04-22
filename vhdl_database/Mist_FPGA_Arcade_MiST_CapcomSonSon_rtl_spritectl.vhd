library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;    

--
-- SonSon Sprite Controller
--
--  Sprite data is 48 bits wide:
--  <bitplane2><bitplane1><bitplane0>
--  < 16 bits >< 16 bits >< 16 bits >
--

entity spritectl is
	generic
	(
		INDEX		: natural;
		DELAY   : integer
	);
	port               
	(
    -- sprite registers
    reg_i       : in from_SPRITE_REG_t;
    
    -- video control signals
    video_ctl   : in from_VIDEO_CTL_t;

    -- sprite control signals
    ctl_i       : in to_SPRITE_CTL_t;
    ctl_o       : out from_SPRITE_CTL_t;
    
		graphics_i  : in to_GRAPHICS_t
	);
end entity spritectl;

architecture SYN of spritectl is

  alias clk       : std_logic is video_ctl.clk;
  alias clk_ena   : std_logic is video_ctl.clk_ena;

  signal flipData : std_logic_vector(47 downto 0);   -- flipped row data
   
begin

  flipData(47 downto 32) <= ctl_i.d(47 downto 32);
  flipData(31 downto 16) <= ctl_i.d(31 downto 16);
  flipData(15 downto 0) <= ctl_i.d(15 downto 0);
  
	process (clk)

   	variable rowStore : std_logic_vector(47 downto 0);  -- saved row of spt to show during visibile period
		variable pel      : std_logic_vector(2 downto 0);
    variable x        : unsigned(video_ctl.x'range);
    variable y        : unsigned(video_ctl.y'range);
    variable yMat     : boolean;    -- raster is between first and last line of sprite
    variable xMat     : boolean;    -- raster in between left edge and end of line

  	variable rowCount : std_logic_vector(4 downto 0);

    variable clut_i     : integer range 0 to 31;
		variable clut_entry : sprite_clut_entry_t;
    variable pel_i      : integer range 0 to 7;
		variable pal_i      : integer range 0 to 15;
		variable pal_entry  : palette_entry_t;

  begin

		if rising_edge(clk) then
      if clk_ena = '1' then

        x := unsigned(reg_i.x) + 8;
        y := unsigned(reg_i.y);
        
        if video_ctl.hblank = '1' then

          xMat := false;
          -- stop sprites wrapping from bottom of screen
          if unsigned(video_ctl.y) = 0 then
            yMat := false;
          end if;
          
          if y = unsigned(video_ctl.y) then
            -- start counting sprite row
            rowCount := (others => '0');
            yMat := true;
          elsif rowCount(4 downto 0) = "10000" then
            yMat := false;				
          end if;

          if ctl_i.ld = '1' then
            if yMat then
              rowStore := flipData;			-- load sprite data
            else
              rowStore := (others => '0');
            end if;
          end if;

        elsif video_ctl.stb = '1' then

          if unsigned(video_ctl.x) = x then
            -- count up at left edge of sprite
            rowCount := std_logic_vector(unsigned(rowCount) + 1);
            xMat := true;
          end if;

          if xMat then
            -- shift in next pixel
            if reg_i.xflip = '1' then
              pel := rowStore(47) & rowStore(31) & rowStore(15);
              rowStore(47 downto 32) := rowStore(46 downto 32) & '0';
              rowStore(31 downto 16) := rowStore(30 downto 16) & '0';
              rowStore(15 downto  0) := rowStore(14 downto  0) & '0';
            else
              pel := rowStore(32) & rowStore(16) & rowStore(0);
              rowStore(47 downto 32) := '0' & rowStore(47 downto 33);
              rowStore(31 downto 16) := '0' & rowStore(31 downto 17);
              rowStore(15 downto  0) := '0' & rowStore(15 downto  1);
            end if;
          end if;

        end if;

        -- extract R,G,B from colour palette
        clut_i := to_integer(unsigned(reg_i.colour(4 downto 0)));
        clut_entry := sprite_clut(clut_i);
        pel_i := to_integer(unsigned(pel));
        pal_i := to_integer(unsigned(clut_entry(pel_i)));
        pal_entry := pal(16 + pal_i);
        ctl_o.rgb.r <= pal_entry(0) & "0000";
        ctl_o.rgb.g <= pal_entry(1) & "0000";
        ctl_o.rgb.b <= pal_entry(2) & "0000";

        -- set pixel transparency based on match
        ctl_o.set <= '0';
        if xMat and yMat and (pel_i /= 0) then
          ctl_o.set <= '1';
        end if;

      end if; -- clk_ena='1'

      -- generate sprite data address
      ctl_o.a(ctl_o.a'left downto 14) <= (others => '0');
      ctl_o.a(13 downto 5) <= reg_i.n(8 downto 0);
      -- - sprite data consists of 16 consecutive bytes for the 1st half
      -- then the next 16 bytes for the 2nd half
      -- - because we need to fetch an entire row at once
      --   use dual-port memory to access both halves of each row
      ctl_o.a(4) <= '0'; -- used for 1st/2nd port of dual-port memory
      if reg_i.yflip = '1' then
        ctl_o.a(3 downto 0) <= not rowCount(3 downto 0);
      else
        ctl_o.a(3 downto 0) <= rowCount(3 downto 0);
      end if;

    end if; -- rising_edge(clk)
  end process;

end SYN;
