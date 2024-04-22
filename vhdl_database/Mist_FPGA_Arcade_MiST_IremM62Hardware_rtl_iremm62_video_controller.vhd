library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_controller_pkg.all;
use work.platform_variant_pkg.all;

entity iremm62_video_controller is
  port
  (
    -- clocking etc
    video_i       : in from_VIDEO_t;
    hwsel         : in HWSEL_t;
    palmode       : in std_logic;
    hires         : in std_logic;

    -- video input data
    rgb_i         : in RGB_t;
    topbottom_mask: in std_logic;

    -- control signals (out)
    video_ctl_o   : out from_VIDEO_CTL_t;

    -- video output control & data
    video_o       : out to_VIDEO_t
  );
end iremm62_video_controller;

architecture SYN of iremm62_video_controller is

  alias clk       : std_logic is video_i.clk;
  alias clk_ena   : std_logic is video_i.clk_ena;
  alias reset     : std_logic is video_i.reset;
 
  signal hcnt                   : unsigned(9 downto 0);
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
  --  hcnt [x080..x0FF-x100..x1FF] => 128+256 = 384 pixels,  384/6.144Mhz => 1 line is 62.5us (16.000KHz) (lores)
  --  hcnt [x080..x0FF-x100..x27F] => 128+384 = 512 pixels,  512/8.192Mhz => 1 line is 62.5us (16.000KHz) (hires)
  --  vcnt [x0E6..x0FF-x100..x1FF] =>  26+256 = 282 lines, 1 frame is 260 x 62.5us = 17.625ms (56.74Hz)

  process (reset, clk, clk_ena)
  begin
    if reset='1' then
      hcnt  <= (others=>'0');
      vcnt  <= '0'&X"FC";
    elsif rising_edge(clk) and clk_ena = '1'then
      hcnt <= hcnt + 1;
      if (hires = '0' and hcnt = "01"&x"FF") or hcnt = "10"&x"7F" then
        hcnt <= "00"&x"80";
        vcnt <= vcnt + 1;
        if vcnt = '1'&x"FF" then
          if palmode = '1' then
            vcnt <= '0'&x"C8";  -- 312 lines/PAL 50 Hz
          else
            vcnt <= '0'&x"E6";  -- from M52 schematics
          end if;
        end if;
      end if;
    end if;
  end process;

  process (reset, clk, clk_ena)
  begin
    if reset = '1' then
      hsync <= '0';
      vsync <= '0';
      hblank1 <= '1';
      hblank2 <= '1';
      vblank <= '1';
    elsif rising_edge(clk) and clk_ena = '1' then
      -- display blank
      if hcnt = "00"&x"FF" then
        hblank1 <= '0';
        if vcnt = '1'&x"00" and topbottom_mask = '0' then
          vblank <= '0';
        end if;
        if vcnt = '1'&x"08" then
          vblank <= '0';
        end if;
      end if;
      if (hires = '0' and hcnt = "01"&x"FF") or hcnt = "10"&x"7F" then
        hblank1 <= '1';
      end if;
      -- alternate blanking to hide hscroll garbage
      if hcnt = "01"&x"07" then
        hblank2 <= '0';
      end if;
      if hcnt = "00"&x"87" then
        hblank2 <= '1';
        if vcnt = '1'&x"F7" and topbottom_mask = '1' then
          vblank <= '1';
        end if;
        if vcnt = '1'&x"FF" then
          vblank <= '1';
        end if;
      end if;

      -- display sync
      if hcnt = "00"&x"8B" then
        hsync <= '1';
        if vcnt = '0'&x"F2" then
          vsync <= '1';
        end if;
      end if;
      if hcnt = "00"&x"B1" then
        hsync <= '0';
        if vcnt = '0'&x"F4" then
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
  hblank <= hblank2 when hwsel = HW_KIDNIKI else hblank1;
  video_o.hblank <= hblank;
  video_o.vblank <= vblank;
  video_ctl_o.stb <= '1';
  video_ctl_o.x <= '0'&std_logic_vector(hcnt);
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
