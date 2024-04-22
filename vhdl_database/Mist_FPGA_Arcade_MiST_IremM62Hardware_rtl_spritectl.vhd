library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
--use work.project_pkg.all;
use work.platform_pkg.all;    
use work.platform_variant_pkg.all;

entity spritectl is
  generic
  (
    INDEX   : natural;
    DELAY   : integer
  );
  port
  (
    hwsel       : in HWSEL_t;
    hires       : in std_logic;

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

  signal rowStore : std_logic_vector(47 downto 0);  -- saved row of spt to show during visibile period
  signal ld_r     : std_logic;

begin

  process (clk, clk_ena, reg_i)

    variable pel      : std_logic_vector(2 downto 0);
    variable x        : unsigned(video_ctl.x'range);
    variable y        : unsigned(video_ctl.y'range);
    variable xMat     : boolean;      -- raster in between left edge and end of line
    variable yMat     : boolean;      -- raster is between first and last line of sprite
    variable yMatNext : boolean;

    variable height   : unsigned(1 downto 0);
    variable rowCount : unsigned(5 downto 0);
    -- which part of the sprite is being drawn
    alias segment     : unsigned(1 downto 0) is rowCount(5 downto 4);

    variable code     : std_logic_vector(10 downto 0);

  begin

    if rising_edge(clk) then
      if clk_ena = '1' then
        ld_r <= ctl_i.ld;
        if video_ctl.hblank = '1' then
          yMat := yMatNext;
        else
          -- determine if the sprite is visible on the next line during active display
          y := 640 - unsigned(reg_i.y) - unsigned(video_ctl.y) - 1;

          -- hande sprite height, placement
          code := reg_i.n(10 downto 0); -- default
          rowCount := (others => '0');
          yMatNext := false;
          case ctl_i.height is
            when 0 =>
              -- normal height
              if y(video_ctl.y'left downto 4) = 0 then 
                yMatNext := true;
                rowCount := "00" & not y(3 downto 0);
              end if;
            when 1 =>
              -- double height
              if y(video_ctl.y'left downto 5) = 0 then
                yMatNext := true;
                rowCount := '0' & not y(4 downto 0);
              end if;
            when 2 =>
              -- quadruple height
              if y(video_ctl.y'left downto 6) = 0 then
                yMatNext := true;
                rowCount := not y(5 downto 0);
              end if;
            when others =>
              null;
          end case;

          case ctl_i.height is
            when 1 =>
              -- double height
              if reg_i.yflip = '1' then
                code(0) := not segment(0);
              else
                code(0) := segment(0);
              end if;
            when 2 =>
              -- quadruple height
              if reg_i.yflip = '1' then
                code(1 downto 0) := not std_logic_vector(segment);
              else
                code(1 downto 0) := std_logic_vector(segment);
              end if;
            when others =>
              null;
          end case;

          -- generate sprite data address
          ctl_o.a(15 downto 5) <= code;
          ctl_o.a(4) <= '0';
          if reg_i.yflip = '0' then
            ctl_o.a(3 downto 0) <= std_logic_vector(rowCount(3 downto 0));
          else
            ctl_o.a(3 downto 0) <=  not std_logic_vector(rowCount(3 downto 0));
          end if;
        end if; -- hblank='0'

        if ctl_i.ld = '1' and ld_r = '0' then
          xMat := false;
          ctl_o.a(4) <= not ctl_o.a(4);  -- switch sprite half
          if yMat then
            if ctl_o.a(4) = '1' then
              -- store first half of the sprite line data
              rowStore(39 downto 32) <= ctl_i.d(23 downto 16);
              rowStore(23 downto 16) <= ctl_i.d(15 downto  8);
              rowStore( 7 downto  0) <= ctl_i.d( 7 downto  0);
            else
              -- load sprite data
              rowStore(47 downto 40) <= ctl_i.d(23 downto 16);
              rowStore(31 downto 24) <= ctl_i.d(15 downto  8);
              rowStore(15 downto  8) <= ctl_i.d( 7 downto  0);
            end if;
          else
            rowStore <= (others => '0');
          end if;
        end if;

        if video_ctl.stb = '1' then
          x := unsigned(reg_i.x) + 256 - 64 + PACE_VIDEO_PIPELINE_DELAY + 1;
          if hwsel /= HW_KIDNIKI then x:=x-8; end if;
          if hires = '0' then x := x - 64; end if;

          if x = unsigned(video_ctl.x) then
              xMat := true;
          end if;

          if xMat then
            -- shift in next pixel
            if reg_i.xflip = '1' then
              pel := rowStore(rowStore'right) & rowStore(rowStore'right+16) & rowStore(rowStore'right+32);
              rowStore(47 downto 32) <= '0' & rowStore(47 downto 33);
              rowStore(31 downto 16) <= '0' & rowStore(31 downto 17);
              rowStore(15 downto  0) <= '0' & rowStore(15 downto  1);
            else
              pel := rowStore(rowStore'left-32) & rowStore(rowStore'left-16) & rowStore(rowStore'left);
              rowStore(47 downto 32) <= rowStore(46 downto 32) & '0';
              rowStore(31 downto 16) <= rowStore(30 downto 16) & '0';
              rowStore(15 downto  0) <= rowStore(14 downto  0) & '0';
            end if;
          end if;

        end if;

        ctl_o.pal_a <= reg_i.colour(4 downto 0) & pel;

        -- set pixel transparency based on match
        ctl_o.set <= '0';
        if xMat and pel /= "000" then
          if graphics_i.bit8(0)(4) = '1' then
            ctl_o.set <= '1';
          end if;
        end if;

      end if; -- clk_ena='1'
    end if; -- rising_edge(clk)

  end process;

end architecture SYN;