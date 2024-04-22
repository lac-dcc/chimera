library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.target_pkg.all;
use work.platform_pkg.all;
use work.project_pkg.all;

entity PACE is
  port
  (
  	-- clocks and resets
    clkrst_i        : in from_CLKRST_t;
    palmode         : in std_logic;
		IN0			: in std_logic_vector(7 downto 0);
		IN1			: in std_logic_vector(7 downto 0);
		IN2			: in std_logic_vector(7 downto 0);
		DIP1			: in std_logic_vector(7 downto 0);
		DIP2			: in std_logic_vector(7 downto 0);
    -- misc I/O
    buttons_i       : in from_BUTTONS_t;
    switches_i      : in from_SWITCHES_t;
    leds_o          : out to_LEDS_t;

    -- controller inputs
    inputs_i        : in from_INPUTS_t;

    -- video
    video_i         : in from_VIDEO_t;
    video_o         : out to_VIDEO_t;

	 sound_data_o    : out std_logic_vector(7 downto 0)

  );
end entity PACE;

architecture SYN of PACE is

	constant CLK_1US_COUNTS : integer :=
		integer(PACE_CLKIN0 * PACE_CLK0_MULTIPLY_BY / PACE_CLK0_DIVIDE_BY);

	signal mapped_inputs		: from_MAPPED_INPUTS_t(0 to 6-1);

  signal to_tilemap_ctl   : to_TILEMAP_CTL_a(1 to 1);
  signal from_tilemap_ctl : from_TILEMAP_CTL_a(1 to 1);

  signal to_bitmap_ctl    : to_BITMAP_CTL_a(1 to 3);
  signal from_bitmap_ctl  : from_BITMAP_CTL_a(1 to 3);

  signal to_sprite_reg    : to_SPRITE_REG_t;
  signal to_sprite_ctl    : to_SPRITE_CTL_t;
  signal from_sprite_ctl  : from_SPRITE_CTL_t;
	signal spr0_hit					: std_logic;

  signal to_graphics      : to_GRAPHICS_t;
	signal from_graphics    : from_GRAPHICS_t;

begin


  platform_inst : entity work.platform
    generic map
    (
      NUM_INPUT_BYTES => 6
    )
    port map
    (
      -- clocking and reset
      clkrst_i        => clkrst_i,
      
      -- misc inputs and outputs
      buttons_i      => buttons_i,
      switches_i     => switches_i,
      leds_o         => leds_o,
      
      -- controller inputs
      inputs_i       => mapped_inputs,
      IN0        		=> IN0,
		IN1        		=> IN1,
		IN2        		=> IN2,
		DIP1        	=> DIP1,
		DIP2        	=> DIP2,
      -- graphics
      bitmap_i       => from_bitmap_ctl,
      bitmap_o       => to_bitmap_ctl,
      
      tilemap_i      => from_tilemap_ctl,
      tilemap_o      => to_tilemap_ctl,
      
      sprite_reg_o   => to_sprite_reg,
      sprite_i       => from_sprite_ctl,
      sprite_o       => to_sprite_ctl,
		spr0_hit			=> spr0_hit,
      
      graphics_i     => from_graphics,
      graphics_o     => to_graphics,
		
		sound_data_o   => sound_data_o
    );

  graphics_inst : entity work.Graphics                                    
    Port Map
    (
      bitmap_ctl_i    => to_bitmap_ctl,
      bitmap_ctl_o    => from_bitmap_ctl,

      tilemap_ctl_i   => to_tilemap_ctl,
      tilemap_ctl_o   => from_tilemap_ctl,

      sprite_reg_i    => to_sprite_reg,
      sprite_ctl_i    => to_sprite_ctl,
      sprite_ctl_o    => from_sprite_ctl,
      spr0_hit				=> spr0_hit,
      
      graphics_i      => to_graphics,
      graphics_o      => from_graphics,

			-- video (incl. clk)
      palmode         => palmode,
			video_i					=> video_i,
			video_o					=> video_o
    );
		
end SYN;
