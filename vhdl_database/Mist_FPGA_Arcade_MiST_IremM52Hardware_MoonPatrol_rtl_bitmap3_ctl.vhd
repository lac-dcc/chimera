library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.pace_pkg.all;
use work.platform_pkg.all;
use work.video_controller_pkg.all;

--
--	Moon Patrol Mountains Renderer
--

architecture BITMAP_3 of bitmapCtl is

  alias clk       : std_logic is video_ctl.clk;
  alias clk_en    : std_logic is video_ctl.clk_ena;
  alias stb       : std_logic is video_ctl.stb;
  alias hblank    : std_logic is video_ctl.hblank;
  alias vblank    : std_logic is video_ctl.vblank;
  alias x         : std_logic_vector(video_ctl.x'range) is video_ctl.x;
  alias y         : std_logic_vector(video_ctl.y'range) is video_ctl.y;

  alias rgb       : RGB_t is ctl_o.rgb;
  
--  alias m52_bg1xpos   : std_logic_vector(7 downto 0) is graphics_i.bit16(0)(15 downto 8);
--  alias m52_bg1ypos   : std_logic_vector(7 downto 0) is graphics_i.bit16(0)(7 downto 0);
  alias m52_bg2xpos   : std_logic_vector(7 downto 0) is graphics_i.bit16(1)(15 downto 8);
  alias m52_bg2ypos   : std_logic_vector(7 downto 0) is graphics_i.bit16(1)(7 downto 0);
  alias m52_bgcontrol : std_logic_vector(7 downto 0) is graphics_i.bit16(2)(7 downto 0);
  
begin

  process (clk, reset)
    variable y_r          : std_logic_vector(y'range);
    -- ensure bgy won't wrap on the screen
    variable bgy          : unsigned(7 downto 0);
    -- must wrap at 256!!!
    variable bgx          : unsigned(7 downto 0);
    variable bitmap_d_r   : std_logic_vector(7 downto 0);
		variable pel          : std_logic_vector(1 downto 0);
    variable pal_i        : std_logic_vector(4 downto 0);
		variable pal_rgb      : pal_rgb_t;
  begin
		if reset = '1' then
      y_r := (others => '0');
		elsif rising_edge (clk) then
      -- default
      ctl_o.set <= '0';
      -- same for a whole line
      ctl_o.a(11 downto 6) <= std_logic_vector(bgy(5 downto 0));
      if clk_en = '1' then
        -- handle line changes
        if vblank = '1' then
          bgy := (others => '1');
        elsif y /= y_r then
          if y(7 downto 0) = m52_bg2ypos then
            bgy := (others => '0');
          else
            -- need to invert to scroll in the right direction
            bgx := not unsigned(m52_bg2xpos);
            if bgy < 63 then
              bgy := bgy + 1;
            end if;
          end if;
        end if;
        -- bit 5 is background enable, bit 4 is layer enable
        if m52_bgcontrol(5) = '0' and m52_bgcontrol(4) = '0' and graphics_i.bit8(0)(2) = '1' then
          if bgy < 64 then
            ctl_o.a(5 downto 0) <= std_logic_vector(bgx(7 downto 2));
            if hblank = '0' then
              if bgx(1 downto 0) = "01" then
                bitmap_d_r := ctl_i.d(7 downto 0);
              else
                bitmap_d_r := bitmap_d_r(6 downto 0) & '0';
              end if;
              bgx := bgx + 1;
              --/* the colors to pick is as follows: */
              --/* xbb00: mountains */
              pel := bitmap_d_r(3) & bitmap_d_r(7);
              pal_i := '0' & pel & "00";
              pal_rgb := bg_pal(to_integer(unsigned(pal_i)));
              ctl_o.rgb.r <= pal_rgb(0) & "00";
              ctl_o.rgb.g <= pal_rgb(1) & "00";
              ctl_o.rgb.b <= pal_rgb(2) & "00";
              if 	pel /= "00" then
                ctl_o.set <= '1';
              end if;
            end if; -- hblank='0'
          end if; -- bgy<64
        end if; -- m52_bgcontrol
        y_r := y;
      end if; -- clk_en='1'
    end if; -- rising_edge(clk)
  end process;

  -- unused
  ctl_o.a(ctl_o.a'left downto 12) <= (others => '0');
	
end architecture BITMAP_3;
