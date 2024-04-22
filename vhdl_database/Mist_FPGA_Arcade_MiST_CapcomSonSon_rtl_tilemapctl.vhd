library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.platform_pkg.all;
use work.video_controller_pkg.all;

--
--	SonSon Tilemap Controller
--

architecture TILEMAP_1 of tilemapCtl is

  alias clk       : std_logic is video_ctl.clk;
  alias clk_ena   : std_logic is video_ctl.clk_ena;
  alias stb       : std_logic is video_ctl.stb;
  alias hblank    : std_logic is video_ctl.hblank;
  alias vblank    : std_logic is video_ctl.vblank;
  alias x         : std_logic_vector(video_ctl.x'range) is video_ctl.x;
  alias y         : std_logic_vector(video_ctl.y'range) is video_ctl.y;
  
  alias scroll    : std_logic_vector(7 downto 0) is graphics_i.bit8(0);
  
begin

	-- these are constant for a whole line
  ctl_o.map_a(ctl_o.map_a'left downto 10) <= (others => '0');
  ctl_o.map_a(9 downto 5) <= y(7 downto 3);
  ctl_o.tile_a(ctl_o.tile_a'left downto 13) <= (others => '0');
  ctl_o.tile_a(2 downto 0) <= y(2 downto 0);

  -- generate attribute RAM address (same, different memory bank)
  ctl_o.attr_a(ctl_o.map_a'left downto 10) <= (others => '0');
  ctl_o.attr_a(9 downto 5) <= y(7 downto 3);
  
  -- generate pixel
  process (clk, clk_ena)

		variable x_adj		  : unsigned(x'range);
    variable tile_d_r   : std_logic_vector(15 downto 0);
		variable attr_d_r	  : std_logic_vector(7 downto 0);
		variable map_d_r	  : std_logic_vector(7 downto 0);
    variable pel        : std_logic_vector(1 downto 0);

    variable clut_i     : integer range 0 to 63;
    variable clut_entry : tile_clut_entry_t;
    variable pel_i      : integer range 0 to 3;
    variable pal_i      : integer range 0 to 255;
    variable pal_entry  : palette_entry_t;

  begin

  	if rising_edge(clk) then
      if clk_ena = '1' then

        -- don't scroll the fist 5 lines
        if unsigned(y) < 40 then
          x_adj := unsigned(x);
          else
          x_adj := unsigned(x) + unsigned(scroll);
        end if;

        -- 1st stage of pipeline
        -- - read tile from tilemap
        -- - read attribute data
        if stb = '1' then
          if x_adj(2 downto 0) = "000" then
            ctl_o.map_a(4 downto 0) <= std_logic_vector(x_adj(7 downto 3));
            ctl_o.attr_a(4 downto 0) <= std_logic_vector(x_adj(7 downto 3));
          end if;
        end if;

        -- 2nd stage of pipeline
        -- - read tile data from tile ROM
        if stb = '1' then
          if x_adj(2 downto 0) = "010" then
						ctl_o.tile_a(12 downto 11) <= ctl_i.attr_d(1 downto 0);
						ctl_o.tile_a(10 downto 3) <= ctl_i.map_d(7 downto 0);
          end if;
        end if;

        if stb = '1' then
          if x_adj(2 downto 0) = "111" then
            attr_d_r := ctl_i.attr_d(attr_d_r'range);
            tile_d_r := ctl_i.tile_d(tile_d_r'range);
          else
            tile_d_r(15 downto 8) := tile_d_r(14 downto 8) & '0';
            tile_d_r(7 downto 0) := tile_d_r(6 downto 0) & '0';
          end if;
        end if;
        -- 1 bit from each byte
        pel := tile_d_r(15) & tile_d_r(7);

        -- extract R,G,B from colour palette
        clut_i := to_integer(unsigned(attr_d_r(7 downto 2)));
        clut_entry := tile_clut(clut_i);
        pel_i := to_integer(unsigned(pel));
        pal_i := to_integer(unsigned(clut_entry(pel_i)));
        pal_entry := pal(pal_i);
        ctl_o.rgb.r <= pal_entry(0) & "0000";
        ctl_o.rgb.g <= pal_entry(1) & "0000";
        ctl_o.rgb.b <= pal_entry(2) & "0000";

        ctl_o.set <= '1';

      end if; -- clk_ena
		end if;
  end process;

end TILEMAP_1;
