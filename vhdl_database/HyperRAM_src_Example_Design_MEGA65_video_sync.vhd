library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_modes_pkg.all;

entity video_sync is
   generic (
      G_VIDEO_MODE : video_modes_t
   );
   port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      vs_o      : out std_logic;
      hs_o      : out std_logic;
      de_o      : out std_logic;
      pixel_x_o : out std_logic_vector(G_VIDEO_MODE.PIX_SIZE-1 downto 0);
      pixel_y_o : out std_logic_vector(G_VIDEO_MODE.PIX_SIZE-1 downto 0)
   );
end entity video_sync;

architecture synthesis of video_sync is

   signal pixel_x : std_logic_vector(G_VIDEO_MODE.PIX_SIZE-1 downto 0) := (others => '0');
   signal pixel_y : std_logic_vector(G_VIDEO_MODE.PIX_SIZE-1 downto 0) := (others => '0');

   constant C_HS_START : integer := G_VIDEO_MODE.H_PIXELS + G_VIDEO_MODE.H_FP;
   constant C_VS_START : integer := G_VIDEO_MODE.V_PIXELS + G_VIDEO_MODE.V_FP;

begin

   -------------------------------------
   -- Generate horizontal pixel counter
   -------------------------------------

   p_pixel_x : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if unsigned(pixel_x) = G_VIDEO_MODE.H_MAX-1 then
            pixel_x <= (others => '0');
         else
            pixel_x <= std_logic_vector(unsigned(pixel_x) + 1);
         end if;

         if rst_i = '1' then
            pixel_x <= (others => '0');
         end if;
      end if;
   end process p_pixel_x;


   -----------------------------------
   -- Generate vertical pixel counter
   -----------------------------------

   p_pixel_y : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if unsigned(pixel_x) = G_VIDEO_MODE.H_MAX-1 then
            if unsigned(pixel_y) = G_VIDEO_MODE.V_MAX-1 then
               pixel_y <= (others => '0');
            else
               pixel_y <= std_logic_vector(unsigned(pixel_y) + 1);
            end if;
         end if;

         if rst_i = '1' then
            pixel_y <= (others => '0');
         end if;
      end if;
   end process p_pixel_y;


   -----------------------------------
   -- Generate sync pulses
   -----------------------------------

   p_sync : process (clk_i)
   begin
      if rising_edge(clk_i) then
         -- Generate horizontal sync signal
         if unsigned(pixel_x) >= C_HS_START and
            unsigned(pixel_x) < C_HS_START+G_VIDEO_MODE.H_PULSE then

            hs_o <= G_VIDEO_MODE.H_POL;
         else
            hs_o <= not G_VIDEO_MODE.H_POL;
         end if;

         -- Generate vertical sync signal
         if unsigned(pixel_y) >= C_VS_START and
            unsigned(pixel_y) < C_VS_START+G_VIDEO_MODE.V_PULSE then

            vs_o <= G_VIDEO_MODE.V_POL;
         else
            vs_o <= not G_VIDEO_MODE.V_POL;
         end if;

         -- Default is black
         de_o <= '0';

         -- Only show color when inside visible screen area
         if unsigned(pixel_x) < G_VIDEO_MODE.H_PIXELS and
            unsigned(pixel_y) < G_VIDEO_MODE.V_PIXELS then

            de_o <= '1';
         end if;

         if rst_i = '1' then
            hs_o <= '1';
            vs_o <= '1';
            de_o <= '0';
         end if;
      end if;
   end process p_sync;

   pixel_x_o <= pixel_x;
   pixel_y_o <= pixel_y;

end architecture synthesis;

