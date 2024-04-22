----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Optional crop/zoom feature used by the digital pipeline.
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crop is
   port (
      video_crop_mode_i : in  std_logic;

      -- Input video stream
      video_clk_i       : in  std_logic;
      video_rst_i       : in  std_logic;
      video_ce_i        : in  std_logic;
      video_red_i       : in  std_logic_vector(7 downto 0);
      video_green_i     : in  std_logic_vector(7 downto 0);
      video_blue_i      : in  std_logic_vector(7 downto 0);
      video_hs_i        : in  std_logic;
      video_vs_i        : in  std_logic;
      video_hblank_i    : in  std_logic;
      video_vblank_i    : in  std_logic;

      -- Output video stream
      video_ce_o        : out std_logic;
      video_red_o       : out std_logic_vector(7 downto 0);
      video_green_o     : out std_logic_vector(7 downto 0);
      video_blue_o      : out std_logic_vector(7 downto 0);
      video_hs_o        : out std_logic;
      video_vs_o        : out std_logic;
      video_hblank_o    : out std_logic;
      video_vblank_o    : out std_logic
   );
end entity crop;

architecture synthesis of crop is

   -- These constants are properties of the input stream
   constant LEFT_BORDER_IN    : natural := 33;
   constant TOP_BORDER_IN     : natural := 35;
   constant IMAGE_SIZE_X      : natural := 320;
   constant IMAGE_SIZE_Y      : natural := 200;

   -- These are the new desired borders
   constant LEFT_BORDER_NEW   : natural := 14;
   constant RIGHT_BORDER_NEW  : natural := 14;
   constant TOP_BORDER_NEW    : natural := 4;
   constant BOTTOM_BORDER_NEW : natural := 4;

   constant X_MIN : natural := LEFT_BORDER_IN-LEFT_BORDER_NEW;
   constant X_MAX : natural := LEFT_BORDER_IN+IMAGE_SIZE_X+RIGHT_BORDER_NEW-1;
   constant Y_MIN : natural := TOP_BORDER_IN-TOP_BORDER_NEW;
   constant Y_MAX : natural := TOP_BORDER_IN+IMAGE_SIZE_Y+BOTTOM_BORDER_NEW-1;

   signal video_hblank_d : std_logic;
   signal video_vblank_d : std_logic;
   signal x_count : natural range 0 to 2047;
   signal y_count : natural range 0 to 1023;

   signal crop_active : std_logic;

begin

   p_count : process (video_clk_i)
   begin
      if rising_edge(video_clk_i) then
         if video_ce_i = '1' then
            video_hblank_d <= video_hblank_i;
            video_vblank_d <= video_vblank_i;

            x_count <= x_count + 1;
            if video_hblank_d = '1' and video_hblank_i = '0' then
               x_count <= 0;
               y_count <= y_count + 1;
            end if;

            if video_vblank_d = '1' and video_vblank_i = '0' then
               y_count <= 0;
            end if;
         end if;

         video_ce_o    <= video_ce_i;
         video_red_o   <= video_red_i;
         video_green_o <= video_green_i;
         video_blue_o  <= video_blue_i;
         video_hs_o    <= video_hs_i;
         video_vs_o    <= video_vs_i;
      end if;
   end process p_count;

   crop_active <= video_crop_mode_i when x_count < X_MIN or x_count > X_MAX or
                                         y_count < Y_MIN or y_count > Y_MAX else '0';

   video_hblank_o <= video_hblank_d or crop_active;
   video_vblank_o <= video_vblank_d or crop_active;

end architecture synthesis;

