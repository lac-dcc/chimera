library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_controller_pkg.all;

entity sonson_video_controller is
  port
  (
    -- clocking etc
    video_i       : in from_VIDEO_t;

    -- video input data
    rgb_i         : in RGB_t;

    -- control signals (out)
    video_ctl_o   : out from_VIDEO_CTL_t;

    -- video output control & data
    video_o       : out to_VIDEO_t
  );
end sonson_video_controller;

architecture SYN of sonson_video_controller is

  alias clk       : std_logic is video_i.clk;
  alias clk_ena   : std_logic is video_i.clk_ena;
  alias reset     : std_logic is video_i.reset;

  signal hcnt                   : unsigned(8 downto 0);
  signal vcnt                   : unsigned(8 downto 0);
  signal hsync                  : std_logic;
  signal vsync                  : std_logic;
  signal hblank                 : std_logic; -- hblank mux
  signal hblank1                : std_logic; -- normal hblank
  signal hblank2                : std_logic; -- shifted hblank for some games
  signal vblank                 : std_logic;
begin

  -------------------
  -- Video scanner --
  -------------------
  --  Note: this is not what the hardware originally has.
  --  hcnt [x180..x1FF-x000..x0FF] => 128+256 = 384 pixels,  384/6Mhz => 1 line is 64us (15.6KHz)
  --  vcnt [x1FA..x1FF-x000..x0FF] =>   6+256 = 262 lines, 1 frame is 262 x 64us = 16.76ms (59.6Hz)

  process (reset, clk, clk_ena)
  begin
    if reset='1' then
      hcnt  <= (others=>'0');
      vcnt  <= '1'&X"FC";
    elsif rising_edge(clk) and clk_ena = '1'then
      hcnt <= hcnt + 1;
      if hcnt = '0'&x"FF" then
        hcnt <= '1'&x"80";
        vcnt <= vcnt + 1;
        if vcnt = '0'&x"FF" then
            vcnt <= '1'&x"FA";
        end if;
      end if;
    end if;
  end process;

  process (reset, clk, clk_ena)
  begin
    if reset = '1' then
      hsync <= '0';
      vsync <= '0';
      hblank <= '1';
      vblank <= '1';
    elsif rising_edge(clk) and clk_ena = '1' then
      -- display blank
      if hcnt = '0'&x"0F" then
        hblank <= '0';
        if vcnt = '0'&x"00" then
          vblank <= '0';
        end if;
      end if;
      if hcnt = '0'&x"FF" then
        hblank <= '1';
        if vcnt = '0'&x"FF" then
          vblank <= '1';
        end if;
      end if;

      -- display sync
      if hcnt = '1'&x"A8" then
        hsync <= '1';
        if vcnt = '1'&x"FC" then
          vsync <= '1';
        end if;
      end if;
      if hcnt = '1'&x"DF" then
        hsync <= '0';
        if vcnt = '1'&x"FE" then
          vsync <= '0';
        end if;
      end if;

      -- registered rgb output
      if hblank = '1' or vblank = '1' then
        video_o.rgb <= RGB_BLACK;
      else
        video_o.rgb <= rgb_i;
      end if;

    end if;
  end process;

  video_o.hsync <= hsync;
  video_o.vsync <= vsync;
  video_o.hblank <= hblank;
  video_o.vblank <= vblank;
  video_ctl_o.stb <= '1';
  video_ctl_o.x <= "00"&std_logic_vector(hcnt);
  video_ctl_o.y <= "00"&std_logic_vector(vcnt);
  -- blank signal goes to tilemap/spritectl
  video_ctl_o.hblank <= hblank;
  video_ctl_o.vblank <= vblank;

  -- pass-through for tile/bitmap & sprite controllers
  video_ctl_o.clk <= clk;
  video_ctl_o.clk_ena <= clk_ena;

  -- for video DACs and TFT output
  video_o.clk <= clk;

end SYN;
