library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
--use work.project_pkg.all;
use work.platform_pkg.all;
use work.platform_variant_pkg.all;
use work.video_controller_pkg.all;

--
--  Irem M62 Tilemap Controller
--
--  Tile data is 2 BPP.
--
entity tilemapCtl is
  generic
  (
    DELAY       : integer
  );
  port
  (
    reset       : in std_logic;
    hwsel       : in HWSEL_t;
    hires       : in std_logic;

    -- video control signals
    video_ctl   : in from_VIDEO_CTL_t;

    -- tilemap controller signals
    ctl_i       : in to_TILEMAP_CTL_t;
    ctl_o       : out from_TILEMAP_CTL_t;

    graphics_i  : in to_GRAPHICS_t
  );
end entity tilemapCtl;

architecture TILEMAP_1 of tilemapCtl is

  alias clk       : std_logic is video_ctl.clk;
  alias clk_ena   : std_logic is video_ctl.clk_ena;
  alias stb       : std_logic is video_ctl.stb;
  alias hblank    : std_logic is video_ctl.hblank;
  alias vblank    : std_logic is video_ctl.vblank;
  
  signal x        : std_logic_vector(video_ctl.x'range);
  signal y        : std_logic_vector(video_ctl.y'range);
  
  alias rot_en    : std_logic is graphics_i.bit8(0)(0);
  alias hscroll   : std_logic_vector(15 downto 0) is graphics_i.bit16(0);
  alias vscroll   : std_logic_vector(15 downto 0) is graphics_i.bit16(1);

begin

  ctl_o.rgb <= ctl_i.rgb;

  -- not used
  ctl_o.map_a(ctl_o.map_a'left downto 12) <= (others => '0');
  ctl_o.attr_a(ctl_o.attr_a'left downto 12) <= (others => '0');
  ctl_o.tile_a(ctl_o.tile_a'left downto 15) <= (others => '0');

  -- tilemap scroll

  x <= std_logic_vector(unsigned(video_ctl.x) - 256 + 128 + 8) when unsigned(y) < 6*8 and hwsel = HW_KUNGFUM else
       std_logic_vector(unsigned(video_ctl.x) - 256 + unsigned(hscroll(8 downto 0)) + 64 + 10) when hwsel = HW_LDRUN4 else
       std_logic_vector(unsigned(video_ctl.x) - 256 + unsigned(hscroll(8 downto 0)) + 64 + 8) when hires = '1' else
       std_logic_vector(unsigned(video_ctl.x) - 256 + unsigned(hscroll(8 downto 0)) + 128 + 8);
  y <= std_logic_vector(unsigned(video_ctl.y) - 256 + unsigned(vscroll(8 downto 0)) + 128) when hwsel = HW_SPELUNKR or hwsel = HW_SPELUNK2 else
       std_logic_vector(unsigned(video_ctl.y) - 256 + unsigned(vscroll(8 downto 0)));

  -- generate pixel
  process (clk, clk_ena)

    variable tile_d_r   : std_logic_vector(23 downto 0);
    variable attr_d_r   : std_logic_vector(7 downto 0);
    variable flipx      : std_logic;
    variable pel        : std_logic_vector(2 downto 0);
    variable prio       : std_logic;

  begin
  
    if rising_edge(clk) then
      if clk_ena = '1' then

        -- 1st stage of pipeline
        -- - set tilemap, attribute address
        if x(2 downto 0) = "000" then
          if hwsel = HW_SPELUNKR or hwsel = HW_SPELUNK2 then
            -- 64x64 tilemap
            ctl_o.map_a(11) <= y(8);
            ctl_o.attr_a(11) <= y(8);
          else
            ctl_o.map_a(11) <= '0';
            ctl_o.attr_a(11) <= '0';
          end if;
          if hwsel = HW_YOUJYUDN then
            -- 8x16 tiles, 64x16 tilemap
            ctl_o.map_a(10 downto 6) <= '0' & y(7 downto 4);
            ctl_o.attr_a(10 downto 6) <= '0' & y(7 downto 4);
          else
            -- 8x8 tiles, 64x32(64) tilemap
            ctl_o.map_a(10 downto 6) <= y(7 downto 3);
            ctl_o.attr_a(10 downto 6) <= y(7 downto 3);
          end if;
          ctl_o.map_a(5 downto 0) <= x(8 downto 3);
          ctl_o.attr_a(5 downto 0) <= x(8 downto 3);
        end if;

        -- 2nd stage of pipeline
        -- - set tile address
        if x(2 downto 0) = "001" then
          if hwsel = HW_SPELUNKR then
            ctl_o.tile_a(14) <= ctl_i.attr_d(5);
          elsif hwsel = HW_SPELUNK2 then
            ctl_o.tile_a(14) <= ctl_i.attr_d(7);
          elsif hwsel = HW_YOUJYUDN then
            ctl_o.tile_a(14) <= '1'; -- first half of the ROMs are empty
          else
            ctl_o.tile_a(14) <= '0';
          end if;

          if hwsel = HW_YOUJYUDN then
            ctl_o.tile_a(13 downto 12) <= ctl_i.attr_d(6 downto 5);
            ctl_o.tile_a(11 downto 4) <= ctl_i.map_d(7 downto 0);
            ctl_o.tile_a(3 downto 0) <= y(3 downto 0);
          else
            if hwsel = HW_LDRUN4 or hwsel = HW_HORIZON then
              ctl_o.tile_a(13) <= ctl_i.attr_d(5);
            elsif hwsel = HW_KIDNIKI or hwsel = HW_SPELUNKR then
              ctl_o.tile_a(13) <= ctl_i.attr_d(7);
            elsif hwsel = HW_SPELUNK2 then
              ctl_o.tile_a(13) <= ctl_i.attr_d(6);
            else
              ctl_o.tile_a(13) <= '0';
            end if;
            if hwsel = HW_BATTROAD or hwsel = HW_SPELUNKR then
              ctl_o.tile_a(12 downto 11) <= ctl_i.attr_d(6) & ctl_i.attr_d(4);
            elsif hwsel = HW_KIDNIKI then
              ctl_o.tile_a(12 downto 11) <= ctl_i.attr_d(6 downto 5);
            elsif hwsel = HW_SPELUNK2 then
              ctl_o.tile_a(12 downto 11) <= ctl_i.attr_d(5 downto 4);
            else
              ctl_o.tile_a(12 downto 11) <= ctl_i.attr_d(7 downto 6);
            end if;
            ctl_o.tile_a(10 downto 3) <= ctl_i.map_d(7 downto 0);
            ctl_o.tile_a(2 downto 0) <= y(2 downto 0);
          end if;
        end if;

        -- 3rd stage of pipeline
        -- - read tile, attribute data from ROM
        if x(2 downto 0) = "111" then
          attr_d_r := ctl_i.attr_d(7 downto 0);
          if hwsel = HW_KUNGFUM or
             hwsel = HW_LOTLOT or
             hwsel = HW_LDRUN or
             hwsel = HW_LDRUN2 or
             hwsel = HW_LDRUN3 or
             hwsel = HW_BATTROAD
          then
            flipx := attr_d_r(5);
          else
            flipx := '0';
          end if;
          tile_d_r := ctl_i.tile_d(tile_d_r'range);
        elsif stb = '1' then
          if flipx = '0' then
            tile_d_r := tile_d_r(tile_d_r'left-1 downto 0) & '0';
          else
            tile_d_r := '0' & tile_d_r(tile_d_r'left downto 1);
          end if;
        end if;

        -- extract R,G,B from colour palette
        if flipx = '0' then
          pel := tile_d_r(tile_d_r'left-16) & tile_d_r(tile_d_r'left-8) & tile_d_r(tile_d_r'left);
        else
          pel := tile_d_r(tile_d_r'right) & tile_d_r(tile_d_r'right+8) & tile_d_r(tile_d_r'right+16);
        end if;

        -- sprite priority
        -- B Board:
        -- J1: selects whether bit 4 of obj color code selects or not high priority over tiles
        -- J2: selects whether bit 4 of obj color code goes to A7 of obj color PROMS
        -- G Board
        -- JP1-4 - Tiles with color code >= the value set here have priority over sprites
        -- J1: selects whether bit 4 of obj color code selects or not high priority over tiles
        -- prio := '0';
        if ((hwsel = HW_YOUJYUDN or hwsel = HW_HORIZON) and attr_d_r(4 downto 1) >= x"8") or
           (hwsel = HW_LDRUN and attr_d_r(4 downto 1) >= x"c") or
           ((hwsel = HW_LDRUN2 or hwsel = HW_LDRUN3 or hwsel = HW_BATTROAD) and attr_d_r(4 downto 1) >= x"4") or
           (hwsel = HW_KIDNIKI and attr_d_r(7 downto 5) = "111") or
			  --For Kung Fu Master, not sure how the hardware actually does it, and couldn't determine from color code for sprite priority
			  --so, as a hack, giving tiles priority over sprites for the first ~106 lines to hide sprite above top rung of stairs.
			  (hwsel = HW_KUNGFUM and unsigned(video_ctl.y) < x"150") 
            then
          prio := '1';
			 		  else prio := '0';
        end if;

--        if (pel = "000") then
--          prio := '0';
--        end if;

        ctl_o.pal_a <= attr_d_r(4 downto 0) & pel;
        ctl_o.prio <= prio;
        ctl_o.set <= '0'; -- default
--        if pel /= "000" then
--            pal_rgb(0)(7 downto 5) /= "000" or
--            pal_rgb(1)(7 downto 5) /= "000" or
--            pal_rgb(2)(7 downto 5) /= "000" then
--          if graphics_i.bit8(0)(3) = '1' then
            ctl_o.set <= '1';
--          end if;
--        end if;

      end if; -- clk_ena
    end if; -- rising_edge_clk

  end process;

end architecture TILEMAP_1;

-- Irem M62 second tilemap background

architecture TILEMAP_2 of tilemapCtl is

  alias clk       : std_logic is video_ctl.clk;
  alias clk_ena   : std_logic is video_ctl.clk_ena;
  alias stb       : std_logic is video_ctl.stb;
  alias hblank    : std_logic is video_ctl.hblank;
  alias vblank    : std_logic is video_ctl.vblank;
  
  signal x        : std_logic_vector(video_ctl.x'range);
  signal y        : std_logic_vector(video_ctl.y'range);

  signal x12      : unsigned(3 downto 0);
  signal xtile    : unsigned(4 downto 0);

  alias rot_en    : std_logic is graphics_i.bit8(0)(0);
  alias vscroll   : std_logic_vector(15 downto 0) is graphics_i.bit16(2);

begin

  ctl_o.rgb <= ctl_i.rgb;
  --ctl_o.rgb.r <= x"aa"&"10";

  -- not used
  ctl_o.map_a(ctl_o.map_a'left downto 11) <= (others => '0');
  ctl_o.attr_a(ctl_o.attr_a'left downto 11) <= (others => '0');
  ctl_o.tile_a(ctl_o.tile_a'left downto 15) <= (others => '0');

  -- tilemap scroll
  x <= std_logic_vector(unsigned(video_ctl.x) - 256 + 64 + 8) when hires = '1' else
       std_logic_vector(unsigned(video_ctl.x) - 256 + 8);
  y <= std_logic_vector(unsigned(video_ctl.y) - 256) when hwsel = HW_SPELUNKR or hwsel = HW_SPELUNK2 else
       std_logic_vector(unsigned(video_ctl.y) - 256 + 128 + unsigned(vscroll(8 downto 0))) when hwsel = HW_KIDNIKI else
       std_logic_vector(unsigned(video_ctl.y) - 256);

  -- generate pixel
  process (clk, clk_ena)

    variable tile_d_r   : std_logic_vector(23 downto 0);
    variable attr_d_r   : std_logic_vector(7 downto 0);
    variable flipx      : std_logic;
    variable pel        : std_logic_vector(2 downto 0);

  begin

    if rising_edge(clk) then
      if clk_ena = '1' then

        ctl_o.tile_a(14) <= '0';
        ctl_o.prio <= '0';

        if hwsel = HW_BATTROAD then
          -- 8x8 tiles, 32x32 tilemap

          -- 1st stage of pipeline
          -- - set tilemap, attribute address
          if x(2 downto 0) = "000" then
            ctl_o.map_a(10 downto 5) <= '0' & y(7 downto 3);
            ctl_o.attr_a(10 downto 5) <= '0' & y(7 downto 3);
            ctl_o.map_a(4 downto 0) <= x(7 downto 3);
            ctl_o.attr_a(4 downto 0) <= x(7 downto 3);
          end if;

          -- 2nd stage of pipeline
          -- - set tile address
          if x(2 downto 0) = "001" then
            ctl_o.tile_a(13 downto 11) <= '0' & ctl_i.attr_d(6) & ctl_i.attr_d(4);
            ctl_o.tile_a(10 downto 3) <= ctl_i.map_d(7 downto 0);
            ctl_o.tile_a(2 downto 0) <= y(2 downto 0);
          end if;

          -- 3rd stage of pipeline
          -- - read tile, attribute data from ROM
          if x(2 downto 0) = "111" then
            attr_d_r := ctl_i.attr_d(7 downto 0);
            tile_d_r := ctl_i.tile_d(tile_d_r'range);
          elsif stb = '1' then
            tile_d_r := tile_d_r(tile_d_r'left-1 downto 0) & '0';
          end if;

          -- extract R,G,B from colour palette
          pel := tile_d_r(tile_d_r'left-16) & tile_d_r(tile_d_r'left-8) & tile_d_r(tile_d_r'left);

          ctl_o.pal_a <= "00" & attr_d_r(3 downto 0) & pel(1 downto 0);
          ctl_o.set <= '0'; -- default
          if pel /= "000" then
            ctl_o.set <= '1';
          end if;

        elsif hwsel = HW_KIDNIKI or hwsel = HW_SPELUNKR or hwsel = HW_SPELUNK2 or hwsel = HW_YOUJYUDN then
          -- 12x8 tiles, 32x32(64) tilemap

          -- 1st stage of pipeline
          -- - set tilemap, attribute address
          if x12 = "0000" then
            if hwsel = HW_KIDNIKI then
              ctl_o.map_a(10 downto 5) <= y(8 downto 3);
              ctl_o.attr_a(10 downto 5) <= y(8 downto 3);
            else
              ctl_o.map_a(10 downto 5) <= '0' & y(7 downto 3);
              ctl_o.attr_a(10 downto 5) <= '0' & y(7 downto 3);
            end if;
            ctl_o.map_a(4 downto 0) <= std_logic_vector(xtile);
            ctl_o.attr_a(4 downto 0) <= std_logic_vector(xtile);
          end if;

          -- 2nd stage of pipeline
          -- - set tile address
          if x12 = "0001" then
            if hwsel = HW_KIDNIKI or hwsel = HW_YOUJYUDN then
              ctl_o.tile_a(13 downto 12) <= ctl_i.attr_d(7 downto 6);
              ctl_o.tile_a(11 downto 4) <= ctl_i.map_d(7 downto 0);
              ctl_o.tile_a(3) <= '0';
            else
              ctl_o.tile_a(13) <= '0';
              ctl_o.tile_a(12) <= ctl_i.attr_d(4);
              ctl_o.tile_a(11) <= '0';
              ctl_o.tile_a(10 downto 3) <= ctl_i.map_d(7 downto 0);
            end if;
            ctl_o.tile_a(2 downto 0) <= y(2 downto 0);
          end if;

          if x12 = "0100" then
            -- switch to second 8 pixels of the tile
            if hwsel = HW_KIDNIKI or hwsel = HW_YOUJYUDN then
              ctl_o.tile_a(3) <= '1';
            else
              ctl_o.tile_a(11) <= '1';
            end if;
          end if;

          -- 3rd stage of pipeline
          -- - read tile, attribute data from ROM
          if x12 = "0100" or x12 = "1000" then
            attr_d_r := ctl_i.attr_d(7 downto 0);
            tile_d_r := ctl_i.tile_d(tile_d_r'range);
          elsif stb = '1' then
            tile_d_r := tile_d_r(tile_d_r'left-1 downto 0) & '0';
          end if;

          -- extract R,G,B from colour palette
          pel := tile_d_r(tile_d_r'left-16) & tile_d_r(tile_d_r'left-8) & tile_d_r(tile_d_r'left);

          ctl_o.pal_a <=  attr_d_r(4 downto 0) & pel(2 downto 0);
          ctl_o.set <= '0'; -- default
          if pel /= "000" then
            ctl_o.set <= '1';
          end if;

          -- advance pixel/tile counters
          if (hwsel  = HW_KIDNIKI and video_ctl.x = "000"&x"FF") or
             (hwsel  = HW_YOUJYUDN and video_ctl.x = "000"&x"BB") or
             (hwsel /= HW_KIDNIKI and hwsel /= HW_YOUJYUDN and video_ctl.x = "000"&x"F7")
          then
            xtile <= (others => '0');
            x12 <= (others => '0');
          elsif x12 = x"B" then
            xtile <= xtile + 1;
            x12 <= "0000";
          else
            x12 <= x12 + 1;
          end if;

        end if;

      end if; -- clk_ena
    end if; -- rising_edge_clk

  end process;

end architecture TILEMAP_2;
