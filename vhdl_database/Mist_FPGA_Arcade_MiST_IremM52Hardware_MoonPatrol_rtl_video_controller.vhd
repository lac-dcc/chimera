library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_controller_pkg.all;

entity pace_video_controller is
  generic
  (
		CONFIG		  : PACEVideoController_t := PACE_VIDEO_NONE;
		DELAY       : integer := 1;
		H_SIZE      : integer;
		V_SIZE      : integer;
    L_CROP      : integer range 0 to 255;
    R_CROP      : integer range 0 to 255;
		H_SCALE     : integer;
		V_SCALE     : integer;
    H_SYNC_POL  : std_logic := '1';
    V_SYNC_POL  : std_logic := '1';
		BORDER_RGB  : RGB_t := RGB_BLACK
  );
  port
  (
    -- clocking etc
    video_i       : in from_VIDEO_t;

		-- register interface
		reg_i			    : in VIDEO_REG_t;
    
    -- video input data
    rgb_i         : in RGB_t;

		-- control signals (out)
		video_ctl_o   : out from_VIDEO_CTL_t;

    -- video output control & data
    video_o       : out to_VIDEO_t
  );
end pace_video_controller;

architecture SYN of pace_video_controller is

  constant SIM_DELAY          : time := 2 ns;

	constant VIDEO_H_SIZE				: integer := H_SIZE * H_SCALE;
	constant VIDEO_V_SIZE				: integer := V_SIZE * V_SCALE;

  subtype reg_t is integer range 0 to 2047;

  alias clk       : std_logic is video_i.clk;
  alias clk_ena   : std_logic is video_i.clk_ena;
  alias reset     : std_logic is video_i.reset;
  
  -- registers
  signal h_front_porch_r        : reg_t := 0;
  signal h_sync_r               : reg_t := 0;
  signal h_back_porch_r         : reg_t := 0;
  signal h_border_r             : reg_t := 0;
  signal h_video_r              : reg_t := 0;
  signal v_front_porch_r        : reg_t := 0;
  signal v_sync_r               : reg_t := 0;
  signal v_back_porch_r         : reg_t := 0;
  signal v_border_r             : reg_t := 0;
  signal v_video_r              : reg_t := 0;

  signal border_rgb_r           : RGB_t := ((others=>'0'), (others=>'0'), (others=>'0'));
  
  -- derived values
  signal h_sync_start           : reg_t := 0;
  signal h_back_porch_start     : reg_t := 0;
  signal h_left_border_start    : reg_t := 0;
  signal h_video_start          : reg_t := 0;
  signal h_right_border_start   : reg_t := 0;
  signal h_line_end             : reg_t := 0;
  signal v_sync_start           : reg_t := 0;
  signal v_back_porch_start     : reg_t := 0;
  signal v_top_border_start     : reg_t := 0;
  signal v_video_start          : reg_t := 0;
  signal v_bottom_border_start  : reg_t := 0;
  signal v_screen_end           : reg_t := 0;

  signal hsync_s                : std_logic := '0';
  signal vsync_s                : std_logic := '0';
  signal hactive_s              : std_logic := '0';
  signal vactive_s              : std_logic := '0';
  signal hblank_s               : std_logic := '0';
  signal vblank_s               : std_logic := '0';
  
  subtype count_t is integer range 0 to 2047;
  signal x_count                : count_t := 0;
  signal y_count                : count_t := 0;
  
  signal x_s                    : unsigned(10 downto 0) := (others => '0');
  signal y_s                    : unsigned(10 downto 0) := (others => '0');
  
  --signal extended_reset         : std_logic := '1';
  alias extended_reset          : std_logic is video_i.reset;
  
begin

  -- registers
	reg_proc: process (reset, clk)

	begin
		--if reset = '1' then
			case CONFIG is

        when PACE_VIDEO_VGA_240x320_60Hz =>
          -- P3M, clk=11.136MHz, clk_ena=5.568MHz
          h_front_porch_r <= 272-240;
          h_sync_r <= 5;
          h_back_porch_r <= 22;
          h_border_r <= (240-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 326-320;
          v_sync_r <= 1;
          v_back_porch_r <= 5;
          v_border_r <= (320-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_320x480_60Hz =>
          -- VGA, clk=12.588MHz
          --# 320x240 @ 60 Hz, 31.5 kHz hsync, 4:3 aspect ratio
          --Modeline "320x240"    12.588    320  336  384  400    240  245  246  262 Doublescan
          h_front_porch_r <= 16;
          h_sync_r <= 48;
          h_back_porch_r <= 16;
          h_border_r <= (320-VIDEO_H_SIZE)/2;
          v_front_porch_r <= (5*2);
          v_sync_r <= (1*2);
          v_back_porch_r <= (16*2);
          v_border_r <= (480-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_640x480_60Hz =>
          -- VGA, clk=25.175MHz
          h_front_porch_r <= 16;
          h_sync_r <= 96;
          h_back_porch_r <= 48;
          h_border_r <= (640-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 10;
          v_sync_r <= 2;
          v_back_porch_r <= 33;
          v_border_r <= (480-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_800x600_60Hz =>
          -- SVGA, clk=40MHz
          h_front_porch_r <= 40;
          h_sync_r <= 128;
          h_back_porch_r <= 88;
          h_border_r <= (800-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 1;
          v_sync_r <= 4;
          v_back_porch_r <= 23;
          v_border_r <= (600-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_1024x768_60Hz =>
          -- XVGA, clk=65MHz
          h_front_porch_r <= 24;
          h_sync_r <= 136;
          h_back_porch_r <= 160;
          h_border_r <= (1024-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 3;
          v_sync_r <= 6;
          v_back_porch_r <= 29;
          v_border_r <= (768-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_1366x768_60Hz =>
          -- XVGA(NAVICO ROCKY), clk=72MHz
          h_front_porch_r <= 88; --64;
          h_sync_r <= 44; --112;
          h_back_porch_r <= 148; --248;
          h_border_r <= (1366-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 4; --3;
          v_sync_r <= 5; --6;
          v_back_porch_r <= 36; --18;
          v_border_r <= (768-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_1280x800_60Hz =>
          -- Sentinel Mode 36, clk=103.2MHz
          h_front_porch_r <= 64;
          h_sync_r <= 32;
          h_back_porch_r <= 362-32-64;
          h_border_r <= (1280-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 3;
          v_sync_r <= 4;
          v_back_porch_r <= 38-4-3;
          v_border_r <= (800-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_1280x1024_60Hz =>
          -- SXGA, clk=108MHz
          h_front_porch_r <= 48;
          h_sync_r <= 112;
          h_back_porch_r <= 248;
          h_border_r <= (1280-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 1;
          v_sync_r <= 3;
          v_back_porch_r <= 38;
          v_border_r <= (1024-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_VGA_1680x1050_60Hz =>
          -- WSXGA+, clk=147.14MHz
          h_front_porch_r <= 104;
          h_sync_r <= 184;
          h_back_porch_r <= 288;
          v_front_porch_r <= 1;
          v_sync_r <= 3;
          v_back_porch_r <= 33;
          -- WSXGA+, clk=118MHz
          --h_front_porch_r <= 48;
          --h_sync_r <= 32;
          --h_back_porch_r <= 80;
          --v_front_porch_r <= 3;
          --v_sync_r <= 6;
          --v_back_porch_r <= 21;
          h_border_r <= (1680-VIDEO_H_SIZE)/2;
          v_border_r <= (1050-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_ARCADE_STD_336x240_60Hz =>
          -- arcade standard resolution, clk=7.16MHz
          h_front_porch_r <= 34;
          h_sync_r <= 34;
          h_back_porch_r <= 51;
          h_border_r <= (336-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 3;
          v_sync_r <= 3;
          v_back_porch_r <= 16;
          v_border_r <= (240-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_ARCADE_STD_336x240_60Hz_28M64 =>
          -- arcade standard resolution, clk=28.64MHz
          h_front_porch_r <= 4*34;
          h_sync_r <= 4*34;
          h_back_porch_r <= 4*51;
          h_border_r <= 4*(336-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 3;
          v_sync_r <= 3;
          v_back_porch_r <= 16;
          v_border_r <= (240-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_CVBS_720x288p_50Hz =>
          -- generic composite, clk=13.5MHz
          h_front_porch_r <= (8+12);
          h_sync_r <= 64;
          h_back_porch_r <= (144-64-(8+12));
          h_border_r <= (720-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 1;
          v_sync_r <= 3;
          v_back_porch_r <= 20;
          v_border_r <= (288-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_LCM_320x240_60Hz =>
          -- DE1/2, clk=18MHz
          h_front_porch_r <= 59;
          h_sync_r <= 1;
          h_back_porch_r <= 151;
          h_border_r <= (320-VIDEO_H_SIZE)*3/2;
          v_front_porch_r <= 8;
          v_sync_r <= 1;
          v_back_porch_r <= 13;
          v_border_r <= (240-VIDEO_V_SIZE)/2;

        when PACE_VIDEO_PAL_320x288_50Hz =>
          h_front_porch_r <= 6;
          h_sync_r <= 28;
          h_back_porch_r <= 30;
          h_border_r <= (320-VIDEO_H_SIZE)/2;
          v_front_porch_r <= 8;
          v_sync_r <= 3;
          v_back_porch_r <= 13;
          v_border_r <= (288-VIDEO_V_SIZE)/2;

				when others =>
					null;
			end case;

      h_video_r <= VIDEO_H_SIZE;
      v_video_r <= VIDEO_V_SIZE;
      border_rgb_r <= BORDER_RGB;
      
		--end if;
	end process reg_proc;

  -- register some arithmetic
  init_proc: process (reset, clk, clk_ena)
  begin
    if reset = '1' then
      null;
    elsif rising_edge(clk) then
      h_sync_start <= h_front_porch_r - 1;
      h_back_porch_start <= h_sync_start + h_sync_r;
      h_left_border_start <= h_back_porch_start + h_back_porch_r;
      h_video_start <= h_left_border_start + h_border_r;
      h_right_border_start <= h_video_start + h_video_r;
      h_line_end <= h_right_border_start + h_border_r;
      v_sync_start <= v_front_porch_r - 1;
      v_back_porch_start <= v_sync_start + v_sync_r;
      v_top_border_start <= v_back_porch_start + v_back_porch_r;
      v_video_start <= v_top_border_start + v_border_r;
      v_bottom_border_start <= v_video_start + v_video_r;
      v_screen_end <= v_bottom_border_start + v_border_r;
    end if;
  end process init_proc;
  
  reset_proc: process (reset, clk)
    variable count_v : integer;
  begin
    if reset = '1' then
      --extended_reset <= '1';
      count_v := 7;
    elsif rising_edge(clk) then
      if count_v = 0 then
        --extended_reset <= '0';
      else
        count_v := count_v - 1;
      end if;
    end if;
  end process reset_proc;

  -- video control outputs
  timer_proc: process (extended_reset, clk, clk_ena)
  begin
    if extended_reset = '1' then
      hblank_s <= '1';
      vblank_s <= '1';
      hactive_s <= '0';
      vactive_s <= '0';
      hsync_s <= not H_SYNC_POL;
      x_count <= 0;
      y_count <= 0;
    elsif rising_edge(clk) and clk_ena = '1' then
      if x_count = h_line_end then
        hblank_s <= '1';
        hactive_s <= '0';     -- for 0 borders
        if y_count = v_screen_end then
          vblank_s <= '1';
          vactive_s <= '0';   -- for 0 borders
          y_count <= 0;
        else
          y_s <= y_s + 1;
          if y_count = v_sync_start then
            vsync_s <= V_SYNC_POL;
          elsif y_count = v_back_porch_start then
            vsync_s <= not V_SYNC_POL;
          elsif y_count = v_video_start then
            vblank_s <= '0';  -- for 0 borders
            vactive_s <= '1';
            y_s <= (others => '0');
          -- check the borders last in case they're 0
          elsif y_count = v_top_border_start then
            vblank_s <= '0';
          elsif y_count = v_bottom_border_start then
            vactive_s <= '0';
          end if;
          y_count <= y_count + 1;
        end if;
        x_count <= 0;
      else
        x_s <= x_s + 1;
        if x_count = h_sync_start then
          hsync_s <= H_SYNC_POL;
        elsif x_count = h_back_porch_start then
          hsync_s <= not H_SYNC_POL;
        elsif x_count = h_video_start then
          hblank_s <= '0'; -- for 0 borders
          hactive_s <= '1';
          x_s <= (others => '0');
          -- check the borders last in case they're 0
        elsif x_count = h_left_border_start then
          hblank_s <= '0';
        elsif x_count = h_right_border_start then
          hactive_s <= '0';
        end if;
        x_count <= x_count + 1;
      end if;
    end if; -- rising_edge(clk) and clk_ena = '1'
  end process timer_proc;

  -- pass-through for tile/bitmap & sprite controllers
  video_ctl_o.clk <= clk;
  video_ctl_o.clk_ena <= clk_ena;
  
  -- for video DACs and TFT output
  video_o.clk <= clk;

  BLK_VIDEO_O : block

    constant PIPELINE_DELAY : natural := DELAY+1;

    -- won't synthesize correctly under ISE if these are variables
    signal hactive_v_r  : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
    signal vactive_v_r  : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');

  begin
  
    video_o_proc: process (extended_reset, clk, clk_ena)
      variable hsync_v_r    : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
      variable vsync_v_r    : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
      --variable hactive_v_r  : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
      --variable vactive_v_r  : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
      variable hblank_v_r   : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
      variable vblank_v_r   : std_logic_vector(PIPELINE_DELAY-1 downto 0) := (others => '0');
      alias hsync_v         : std_logic is hsync_v_r(hsync_v_r'left);
      alias vsync_v         : std_logic is vsync_v_r(vsync_v_r'left);
      alias hactive_v       : std_logic is hactive_v_r(hactive_v_r'left);
      alias vactive_v       : std_logic is vactive_v_r(vactive_v_r'left);
      alias hblank_v        : std_logic is hblank_v_r(hblank_v_r'left);
      alias vblank_v        : std_logic is vblank_v_r(vblank_v_r'left);
      variable stb_cnt_v    : unsigned(3 downto 0); -- up to 16x scaling
    begin
      if extended_reset = '1' then
        hsync_v_r := (others => not H_SYNC_POL);
        vsync_v_r := (others => not V_SYNC_POL);
        hactive_v_r <= (others => '0');
        vactive_v_r <= (others => '0');
        hblank_v_r := (others => '0');
        vblank_v_r := (others => '0');
        stb_cnt_v := (others => '1');
      elsif rising_edge(clk) and clk_ena = '1' then
  
        -- register control signals and handle scaling
        video_ctl_o.hblank <= not hactive_s after SIM_DELAY;	-- used only by the bitmap/tilemap/sprite controllers
        video_ctl_o.vblank <= not vactive_s after SIM_DELAY;	-- used only by the bitmap/tilemap/sprite controllers
        -- handle scaling
        video_ctl_o.stb <= stb_cnt_v(H_SCALE-1) after SIM_DELAY;
        if hactive_s = '1' and vactive_s = '1' then
          stb_cnt_v := stb_cnt_v + 2;
        elsif hblank_s = '0' and vblank_s = '0' then    
          stb_cnt_v := (others => '1');
        end if;
        video_ctl_o.x <= std_logic_vector(resize(x_s(x_s'left downto H_SCALE-1), video_ctl_o.x'length)) after SIM_DELAY;
        video_ctl_o.y <= std_logic_vector(resize(y_s(y_s'left downto V_SCALE-1), video_ctl_o.y'length)) after SIM_DELAY;
  
        -- register video outputs
        if hactive_v = '1' and vactive_v = '1' then
          -- active video
          if  x_s(x_s'left downto H_SCALE-1) < (L_CROP + PIPELINE_DELAY) or 
              x_s(x_s'left downto H_SCALE-1) >= (H_SIZE - R_CROP + PIPELINE_DELAY) then
            video_o.rgb <= RGB_BLACK after SIM_DELAY;
          else
            video_o.rgb <= rgb_i after SIM_DELAY;
          end if;
        elsif hblank_v = '0' and vblank_v = '0' then
          -- border
          video_o.rgb <= border_rgb_r after SIM_DELAY;
        else
          video_o.rgb.r <= (others => '0') after SIM_DELAY;
          video_o.rgb.g <= (others => '0') after SIM_DELAY;
          video_o.rgb.b <= (others => '0') after SIM_DELAY;
        end if;
        video_o.hsync <= hsync_v after SIM_DELAY;
        video_o.vsync <= vsync_v after SIM_DELAY;
        video_o.hblank <= not hactive_v; -- hblank_v after SIM_DELAY;
        video_o.vblank <= not vactive_v; -- vblank_v after SIM_DELAY;
        -- pipelined signals
        hsync_v_r := hsync_v_r(hsync_v_r'left-1 downto 0) & hsync_s;
        vsync_v_r := vsync_v_r(vsync_v_r'left-1 downto 0) & vsync_s;
        hactive_v_r <= hactive_v_r(hactive_v_r'left-1 downto 0) & hactive_s;
        vactive_v_r <= vactive_v_r(vactive_v_r'left-1 downto 0) & vactive_s;
        hblank_v_r := hblank_v_r(hblank_v_r'left-1 downto 0) & hblank_s;
        vblank_v_r := vblank_v_r(vblank_v_r'left-1 downto 0) & vblank_s;
      end if;
    end process video_o_proc;

  end block BLK_VIDEO_O;
  
end SYN;
