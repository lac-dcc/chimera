library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.project_pkg.all;
use work.platform_pkg.all;

entity Graphics is
  port
  (
    bitmap_ctl_i    : in to_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
    bitmap_ctl_o    : out from_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
    tilemap_ctl_i   : in to_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);
    tilemap_ctl_o   : out from_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);

    sprite_reg_i    : in to_SPRITE_REG_t;
    sprite_ctl_i    : in to_SPRITE_CTL_t;
    sprite_ctl_o    : out from_SPRITE_CTL_t;
		spr0_hit				: out std_logic;
    
    graphics_i      : in to_GRAPHICS_t;
    graphics_o      : out from_GRAPHICS_t;

		palmode         : in std_logic;
		video_i					: in from_VIDEO_t;
		video_o					: out to_VIDEO_t
  );

end Graphics;

architecture SYN of Graphics is

	alias clk 					    : std_logic is video_i.clk;

  signal from_video_ctl   : from_VIDEO_CTL_t;
  signal bitmap_ctl_o_s   : from_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
  signal tilemap_ctl_o_s  : from_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);
  signal sprite_ctl_o_s   : from_SPRITE_CTL_t;
  signal sprite_pri       : std_logic;
  
  signal osd_active       : std_logic;
  signal osd_colour       : std_logic_vector(7 downto 0);

	signal rgb_data			    : RGB_t;
  -- before OSD is mixed in
  signal video_o_s        : to_VIDEO_t;
  
begin

  -- dodgy OSD transparency...
	video_o.clk <= video_o_s.clk;
	video_o.rgb.r <= video_o_s.rgb.r;
	video_o.rgb.g <= video_o_s.rgb.g;
	video_o.rgb.b <= video_o_s.rgb.b;
	video_o.hsync <= video_o_s.hsync;
	video_o.vsync <= video_o_s.vsync;
	video_o.hblank <= video_o_s.hblank;
	video_o.vblank <= video_o_s.vblank;

  graphics_o.y <= from_video_ctl.y;
  -- should this be the 'real' vblank or the 'active' vblank?
  -- - use the real for now
  graphics_o.hblank <= video_o_s.hblank;
  graphics_o.vblank <= video_o_s.vblank;
  --graphics_o.vblank <= from_video_ctl.vblank;
    
--  pace_video_controller_inst : entity work.pace_video_controller
--    generic map
--    (
--      CONFIG		  => PACE_VIDEO_CONTROLLER_TYPE,
--      DELAY       => PACE_VIDEO_PIPELINE_DELAY,
--      H_SIZE      => PACE_VIDEO_H_SIZE,
--      V_SIZE      => PACE_VIDEO_V_SIZE,
--      L_CROP      => PACE_VIDEO_L_CROP,
--      R_CROP      => PACE_VIDEO_R_CROP,
--      H_SCALE     => PACE_VIDEO_H_SCALE,
--      V_SCALE     => PACE_VIDEO_V_SCALE,
--      H_SYNC_POL  => PACE_VIDEO_H_SYNC_POLARITY,
--      V_SYNC_POL  => PACE_VIDEO_V_SYNC_POLARITY,
--      BORDER_RGB  => PACE_VIDEO_BORDER_RGB
--    )
--    port map
--    (
--      -- clocking etc
--      video_i         => video_i,
--      
--			-- register interface
--			reg_i.h_scale	=> "000",
--			reg_i.v_scale 	=> "000",
--      -- video data signals (in)
--      rgb_i		    		=> rgb_data,
--
--      -- video control signals (out)
--      video_ctl_o     => from_video_ctl,
--
--      -- VGA signals (out)
--      video_o     		=> video_o_s
--    );

  pace_video_controller_inst : entity work.iremm52_video_controller
    port map
    (
      -- clocking etc
      video_i         => video_i,
      palmode         => palmode,

      -- video data signals (in)
      rgb_i		    		=> rgb_data,

      -- video control signals (out)
      video_ctl_o     => from_video_ctl,

      -- VGA signals (out)
      video_o     		=> video_o_s
    );

  pace_video_mixer_inst : entity work.pace_video_mixer
    port map
    (
        bitmap_ctl_o  => bitmap_ctl_o_s,
        tilemap_ctl_o => tilemap_ctl_o_s,
        sprite_rgb    => sprite_ctl_o_s.rgb,
        sprite_set    => sprite_ctl_o_s.set,
        sprite_pri    => sprite_pri,
        
        video_ctl_i   => from_video_ctl,
        graphics_i    => graphics_i,
        rgb_o         => rgb_data
    );
    
	GEN_NO_BITMAPS : if PACE_VIDEO_NUM_BITMAPS = 0 generate
    --bitmap_ctl_o_s <= ((others => '0'), (others => (others => '0')), '0');
	end generate GEN_NO_BITMAPS;
	
	GEN_BITMAP_1 : if PACE_VIDEO_NUM_BITMAPS > 0 generate
	
	  forground_bitmapctl_inst : entity work.bitmapCtl(BITMAP_1)
      generic map
      (
        DELAY         => PACE_VIDEO_PIPELINE_DELAY
      )
	    port map
	    (
				reset					=> video_i.reset,
				
				video_ctl     => from_video_ctl,

	      ctl_i         => bitmap_ctl_i(1),
	      ctl_o         => bitmap_ctl_o_s(1),

        graphics_i    => graphics_i
	    );
		end generate GEN_BITMAP_1;

	GEN_BITMAP_2 : if PACE_VIDEO_NUM_BITMAPS > 1 generate

	  forground_bitmapctl_inst : entity work.bitmapCtl(BITMAP_2)
      generic map
      (
        DELAY         => PACE_VIDEO_PIPELINE_DELAY
      )
	    port map
	    (
				reset					=> video_i.reset,
				
				video_ctl     => from_video_ctl,

	      ctl_i         => bitmap_ctl_i(2),
	      ctl_o         => bitmap_ctl_o_s(2),

        graphics_i    => graphics_i
	    );
      
  end generate GEN_BITMAP_2;

	GEN_BITMAP_3 : if PACE_VIDEO_NUM_BITMAPS > 2 generate

	  forground_bitmapctl_inst : entity work.bitmapCtl(BITMAP_3)
      generic map
      (
        DELAY         => PACE_VIDEO_PIPELINE_DELAY
      )
	    port map
	    (
				reset					=> video_i.reset,
				
				video_ctl     => from_video_ctl,

	      ctl_i         => bitmap_ctl_i(3),
	      ctl_o         => bitmap_ctl_o_s(3),

        graphics_i    => graphics_i
	    );
      
  end generate GEN_BITMAP_3;
  
  bitmap_ctl_o <= bitmap_ctl_o_s;
  
	GEN_NO_TILEMAPS : if PACE_VIDEO_NUM_TILEMAPS = 0 generate
    --tilemap_ctl_o_s(1) <= ((others => '0'), (others => '0'), (others => '0'), 
    --                      (others => (others => '0')), '0');
	end generate GEN_NO_TILEMAPS;
	
	GEN_TILEMAP_1 : if PACE_VIDEO_NUM_TILEMAPS > 0 generate
	
	  foreground_mapctl_inst : entity work.tilemapCtl(TILEMAP_1)
      generic map
      (
        DELAY         => PACE_VIDEO_PIPELINE_DELAY
      )
	    port map
	    (
				reset					=> video_i.reset,
				
				video_ctl     => from_video_ctl,

				ctl_i         => tilemap_ctl_i(1),
				ctl_o         => tilemap_ctl_o_s(1),

        graphics_i    => graphics_i
	    );

		end generate GEN_TILEMAP_1;

	GEN_TILEMAP_2 : if PACE_VIDEO_NUM_TILEMAPS > 1 generate
	
	  background_mapctl_inst : entity work.tilemapCtl(TILEMAP_2)
      generic map
      (
        DELAY         => PACE_VIDEO_PIPELINE_DELAY
      )
	    port map
	    (
				reset					=> video_i.reset,
				
				video_ctl     => from_video_ctl,

				ctl_i         => tilemap_ctl_i(2),
				ctl_o         => tilemap_ctl_o_s(2),

        graphics_i    => graphics_i
	    );

		end generate GEN_TILEMAP_2;
    
  tilemap_ctl_o <= tilemap_ctl_o_s;

	GEN_NO_SPRITES : if PACE_VIDEO_NUM_SPRITES = 0 generate
    sprite_ctl_o_s <= ((others => '0'), (others => (others => '0')), '0');
    sprite_pri <= '0';
    spr0_hit <= '0';
	end generate GEN_NO_SPRITES;
	
	GEN_SPRITES : if PACE_VIDEO_NUM_SPRITES > 0 generate
	
		sprites_inst : sprite_array
      generic map
      (
        N_SPRITES     => PACE_VIDEO_NUM_SPRITES,
        DELAY         => PACE_VIDEO_PIPELINE_DELAY
      )
			port map
			(
				reset				  => video_i.reset,
  
        -- register interface
        reg_i         => sprite_reg_i,

        -- video control signals
        video_ctl     => from_video_ctl,

        graphics_i    => graphics_i,

				row_a         => sprite_ctl_o_s.a,
				row_d         => sprite_ctl_i.d,
				
				rgb					  => sprite_ctl_o_s.rgb,
				set           => sprite_ctl_o_s.set,
				pri           => sprite_pri,
				spr0_set	    => spr0_hit
			);

	end generate GEN_SPRITES;

  sprite_ctl_o <= sprite_ctl_o_s;

end SYN;
