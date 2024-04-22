--
--	This file is a *derivative* work of MikeJ's Asteroids Deluxe implementation.
--	The original source can be downloaded from <http://www.fpgaarcade.com>
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;
use work.project_pkg.all;

entity PACE is
  port
  (
  	-- clocks and resets
    BUTTON          : in std_logic_vector(7 downto 0);
    clkrst_i        : in from_CLKRST_t;

    -- misc I/O
    buttons_i       : in from_BUTTONS_t;
    switches_i      : in from_SWITCHES_t;
    leds_o          : out to_LEDS_t;

    -- controller inputs
    inputs_i        : in from_INPUTS_t;

    -- video
    video_i         : in from_VIDEO_t;
    video_o         : out to_VIDEO_t;

    -- audio
    audio_i         : in from_AUDIO_t;
    audio_o         : out to_AUDIO_t;
    
    -- custom i/o
    project_i       : in from_PROJECT_IO_t;
    project_o       : out to_PROJECT_IO_t;
    platform_i      : in from_PLATFORM_IO_t;
    platform_o      : out to_PLATFORM_IO_t
  );
end entity PACE;

architecture SYN of PACE is

	alias clk_24M								: std_logic is clkrst_i.clk(0);
	alias clk_video						  : std_logic is clkrst_i.clk(1);
	signal reset_n							: std_logic;
	alias reset_6_l							: std_logic is reset_n;
	
  signal clk_6                : std_logic := '0';

  signal audio_s              : std_logic_vector(7 downto 0);

  signal x_vector             : std_logic_vector(9 downto 0);
  signal y_vector             : std_logic_vector(9 downto 0);
  signal z_vector             : std_logic_vector(3 downto 0);
  signal beam_on              : std_logic;
  signal beam_ena             : std_logic;

	-- video generator signals
	signal vid_addr							: std_logic_vector(15 downto 0);
	signal vid_q								: std_logic_vector(15 downto 0);
	
	-- video ram signals
	signal vram_addr						: std_logic_vector(14 downto 0);
	signal vram_data						: std_logic_vector(7 downto 0);
	signal vram_wren						: std_logic;
	signal vram_q								: std_logic_vector(7 downto 0);
	signal pixel_data						: std_logic_vector(7 downto 0);

	signal mapped_inputs				: from_MAPPED_INPUTS_t(0 to 1);
	alias game_reset						: std_logic is mapped_inputs(1).d(0);				
	alias toggle_erase					: std_logic is mapped_inputs(1).d(1);
	signal cpu_reset						: std_logic;
	signal erase								: std_logic;

  signal to_osd               : to_OSD_t;

begin

	-- map inputs
	
	reset_n <= not clkrst_i.arst;

	-- PLL can't produce a 6M clock
	process (clk_24M, clkrst_i.arst)
		variable count : std_logic_vector(1 downto 0) := (others => '0');
	begin
		if clkrst_i.arst = '1' then
      count := (others => '0');
			clk_6 <= '0';
		elsif rising_edge(clk_24M) then
			count := count + 1;
			clk_6 <= count(1);
		end if;
	end process;
		
	-- process to toggle erase with <F4>
	process (clk_24M, clkrst_i.arst)
		variable f4_r : std_logic := '0';
	begin
		if clkrst_i.arst = '1' then
			erase <= '1';
		elsif rising_edge(clk_24M) then
			if f4_r = '0' and toggle_erase = '1' then
				erase <= not erase;
			end if;
			-- latch for rising_edge detect
			f4_r := toggle_erase;
		end if;
	end process;
	
	-- process to update video ram and do a _crude_ decay
	-- decay just wipes one byte of video ram
	-- each time a set number of points is displayed
	-- given by (count'length - vram_addr'length)
	process (clk_24M, reset_6_l)
		variable state 				: integer range 0 to 4;
    variable beam_ena_r 	: std_logic := '0';
		variable count				: std_logic_vector(15 downto 0);
	begin
		if reset_6_l = '0' then
			state := 0;
      beam_ena_r := '0';
			count := (others => '0');
		elsif rising_edge(clk_24M) then

			-- default case
			vram_wren <= '0' after 2 ns;

			case state is
			
				when 0 =>
					-- prepare to draw a pixel if it's on
					if beam_on = '1' and beam_ena_r = '0' and beam_ena = '1' then
						vram_addr(5 downto 0) <= x_vector(9 downto 4);
						vram_addr(14 downto 6) <= not y_vector(9 downto 1);
						case x_vector(3 downto 1) is
							when "000" =>		pixel_data <= "00000001";
							when "001" =>		pixel_data <= "00000010";
							when "010" =>		pixel_data <= "00000100";
							when "011" =>		pixel_data <= "00001000";
							when "100" =>		pixel_data <= "00010000";
							when "101" =>		pixel_data <= "00100000";
							when "110" =>		pixel_data <= "01000000";
							when others =>	pixel_data <= "10000000";
						end case;
						-- only draw if beam intensity is non-zero
						if z_vector /= "0000" then
							state := 1;
						else
							state := 3;
						end if;
					end if;

				when 1 =>
          state := 2;

				when 2 =>
					-- do the write-back
					vram_data <= pixel_data or vram_q after 2 ns;
					vram_wren <= '1' after 2 ns;
					state := 3;

				when 3 =>
					state := 4;
					
				when 4 =>
					-- only erase if it's activated
					if erase = '1' then
						-- latch the 'erase' counter value for vram_addr
						vram_addr <= count(count'left downto count'length-vram_addr'length);
						-- only erase once per address
						if count(count'length-vram_addr'length-1 downto 0) = 0 then
							-- erase the whole byte
							vram_data <= (others => '0') after 2 ns;
							vram_wren <= '1' after 2 ns;
						end if;
					end if;
					count := count + 1;
					state := 0;

				when others =>
					state := 0;
			end case;
			-- latch for rising-edge detect
      beam_ena_r := beam_ena;
		end if;
	end process;

	-- construct the pixel address and data value
	--vram_addr(5 downto 0) <= x_vector(9 downto 4);
	--vram_addr(14 downto 6) <= not y_vector(9 downto 1);
		
	asteroids_inst : entity work.ASTEROIDS
	  port map
		(
	    BUTTON            => BUTTON,--mapped_inputs(0).d,
	    --
	    AUDIO_OUT         => audio_s,
	    --
	    X_VECTOR          => x_vector,
	    Y_VECTOR          => y_vector,
	    Z_VECTOR          => z_vector,
	    BEAM_ON           => beam_on,
	    BEAM_ENA          => beam_ena,
	    --
	    RESET_6_L         => reset_6_l,
	    CLK_6             => clk_6
		);

	vram_inst : entity work.dpram
		generic map
		(
			numwords_a				=> 32768,
			widthad_a					=> 15
  -- pragma translate_off
      ,init_file         => "null32k.hex"
  -- pragma translate_on
		)
		port map
		(
			-- video interface
			clock_a						=> clk_video,
			address_a					=> vid_addr(14 downto 0),
			wren_a						=> '0',
			data_a						=> (others => 'X'),
			q_a								=> vid_q(7 downto 0),
			
			-- vector-generator interface
			clock_b						=> clk_24M,
			address_b					=> vram_addr(14 downto 0),
			wren_b						=> vram_wren,
			data_b						=> vram_data,
			q_b								=> vram_q
		);


  BLK_GRAPHICS : block

    signal to_tilemap_ctl   : to_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);
    signal from_tilemap_ctl : from_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);

    signal to_bitmap_ctl    : to_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
    signal from_bitmap_ctl  : from_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);

    signal to_sprite_reg    : to_SPRITE_REG_t;
    signal to_sprite_ctl    : to_SPRITE_CTL_t;
    signal from_sprite_ctl  : from_SPRITE_CTL_t;
    signal spr0_hit					: std_logic;

    signal to_graphics      : to_GRAPHICS_t;
    signal from_graphics    : from_GRAPHICS_t;

    signal to_osd           : to_OSD_t;
    signal from_osd         : from_OSD_t;

  begin
  
    vid_addr <= from_bitmap_ctl(1).a;
    to_bitmap_ctl(1).d(15 downto 0) <= vid_q;
    
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
        
        -- OSD
        to_osd          => to_osd,
        from_osd        => from_osd,

        -- video (incl. clk)
        video_i					=> video_i,
        video_o					=> video_o
      );

  end block BLK_GRAPHICS;
  
  -- hook up sound
  audio_o.ldata(15 downto 8) <= audio_s;
  audio_o.ldata(7 downto 0) <= (others => '0');
  audio_o.rdata(15 downto 8) <= audio_s;
  audio_o.rdata(7 downto 0) <= (others => '0');


end SYN;

