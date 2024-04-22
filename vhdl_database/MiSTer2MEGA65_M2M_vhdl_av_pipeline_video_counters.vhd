----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Debug module to provide information about video resolution.
-- The values provided are comparable to the video parameters
-- in M2M/vhdl/av_pipeline/video_modes_pkg.vhd
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;
   use ieee.numeric_std_unsigned.all;

entity video_counters is
   port (
      clk_i      : in    std_logic;
      rst_i      : in    std_logic;
      ce_i       : in    std_logic;                     -- Must be active high
      vs_i       : in    std_logic;                     -- Must be active high
      hs_i       : in    std_logic;                     -- Must be active high
      hblank_i   : in    std_logic;                     -- Must be active high
      vblank_i   : in    std_logic;                     -- Must be active high
      pps_i      : in    std_logic;                     -- Must be active high
      h_pixels_o : out   std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
      v_pixels_o : out   std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
      h_pulse_o  : out   std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
      h_bp_o     : out   std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
      h_fp_o     : out   std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
      v_pulse_o  : out   std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
      v_bp_o     : out   std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
      v_fp_o     : out   std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
      h_freq_o   : out   std_logic_vector(15 downto 0)  -- horizontal sync frequency
   );
end entity video_counters;

architecture synthesis of video_counters is

   signal hblank_d  : std_logic;
   signal hs_d      : std_logic;
   signal h_count   : std_logic_vector(11 downto 0);
   signal h_total   : std_logic_vector(11 downto 0);
   signal h_rising  : std_logic_vector(11 downto 0);
   signal h_falling : std_logic_vector(11 downto 0);
   signal h_pixels  : std_logic_vector(11 downto 0);
   signal h_lps     : std_logic_vector(15 downto 0);
   signal h_freq    : std_logic_vector(15 downto 0);

   signal vblank_d  : std_logic;
   signal vs_d      : std_logic;
   signal v_count   : std_logic_vector(11 downto 0);
   signal v_total   : std_logic_vector(11 downto 0);
   signal v_rising  : std_logic_vector(11 downto 0);
   signal v_falling : std_logic_vector(11 downto 0);
   signal v_pixels  : std_logic_vector(11 downto 0);

   signal pps_d     : std_logic;

begin

   count_proc : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if ce_i = '1' then
            hblank_d <= hblank_i;
            vblank_d <= vblank_i;

            h_count <= h_count + 1;
            if hblank_d = '1' and hblank_i = '0' then
               v_count <= v_count + 1;
               h_total <= h_count;
               h_count <= X"001";
            end if;

            if vblank_d = '1' and vblank_i = '0' then
               v_total <= v_count;
               v_count <= X"000";
               if hblank_d = '1' and hblank_i = '0' then
                  v_total <= v_count + 1;
               end if;
            end if;
         end if;
      end if;
   end process count_proc;

   stats_proc : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if pps_i = '1' then
            pps_d <= pps_i;
         end if;

         if ce_i = '1' then
            hs_d  <= hs_i;
            vs_d  <= vs_i;

            if hblank_d = '0' and hblank_i = '1' then
               h_pixels <= h_count;
            end if;
            if vblank_d = '0' and vblank_i = '1' then
               v_pixels <= v_count;
               if hblank_d = '1' and hblank_i = '0' then
                  v_pixels <= v_count + 1;
               end if;
            end if;

            if hs_d = '0' and hs_i = '1' then
               h_lps    <= h_lps + 1;
               h_rising <= h_count;
            end if;
            if hs_d = '1' and hs_i = '0' then
               h_falling <= h_count;
            end if;

            if vs_d = '0' and vs_i = '1' then
               v_rising <= v_count;
            end if;
            if vs_d = '1' and vs_i = '0' then
               v_falling <= v_count;
            end if;

            if pps_d = '1' then
               pps_d  <= '0';
               h_freq <= h_lps;
               h_lps  <= (others => '0');
            end if;
         end if;
      end if;
   end process stats_proc;

   reg_proc : process (clk_i)
   begin
      if rising_edge(clk_i) then
         h_pixels_o <= h_pixels;
         h_fp_o     <= h_rising - h_pixels;
         h_pulse_o  <= h_falling - h_rising;
         h_bp_o     <= h_total - h_falling;
         h_freq_o   <= h_freq;

         v_pixels_o <= v_pixels;
         v_fp_o     <= v_rising - v_pixels;
         v_pulse_o  <= v_falling - v_rising;
         v_bp_o     <= v_total - v_falling;
      end if;
   end process reg_proc;

end architecture synthesis;

