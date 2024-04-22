------------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Demo core that produces a test image including test sound, so that MiSTer2MEGA65
-- can be synthesized and tested stand alone even before the MiSTer core is being
-- applied. The MEGA65 "Help" menu can be used to change the behavior of the core.
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity democore_audio is
   generic (
      G_CLOCK_FREQ_HZ : natural
   );
   port (
      clk_i         : in  std_logic;
      rst_i         : in  std_logic;

      freq_i        : in  std_logic_vector(15 downto 0);
      vol_left_i    : in  std_logic_vector(15 downto 0);
      vol_right_i   : in  std_logic_vector(15 downto 0);

      -- Audio output (Signed PCM)
      audio_left_o  : out signed(15 downto 0);
      audio_right_o : out signed(15 downto 0)
   );
end entity democore_audio;

architecture synthesis of democore_audio is

   signal x : signed(15 downto 0) := X"7C00";
   signal y : signed(15 downto 0) := X"0000";

   signal x_d      : signed(15 downto 0);
   signal x_dd     : signed(15 downto 0);
   signal left_d   : signed(15 downto 0);
   signal left_dd  : signed(15 downto 0);
   signal right_d  : signed(15 downto 0);
   signal right_dd : signed(15 downto 0);

   signal accum : std_logic_vector(15 downto 0) := X"0000";
   signal step  : std_logic := '0';

   function sign_extend(arg : signed(7 downto 0)) return signed is
      variable res : signed(15 downto 0);
   begin
      res(15 downto 8) := (others => arg(7));
      res(7 downto 0) := arg;
      return res;
   end function sign_extend;

begin

   -- Generate a sine wave (actually a circular motion)
   p_xy : process (clk_i)
      variable nx : signed(15 downto 0);
      variable ny : signed(15 downto 0);
   begin
      if rising_edge(clk_i) then
         if step = '1' then
            nx := x + sign_extend(y(15 downto 8));
            ny := y - sign_extend(nx(15 downto 8));
            x <= nx;
            y <= ny;
         end if;
      end if;
   end process p_xy;

   -- Control frequency (i.e. angular speed)
   p_step : process (clk_i)
      variable res : unsigned(16 downto 0);
   begin
      if rising_edge(clk_i) then
         res := unsigned("0" & accum) + unsigned("0" & freq_i);
         accum <= std_logic_vector(res(15 downto 0));
         step  <= res(16);
      end if;
   end process p_step;

   -- Control volume
   p_out : process (clk_i)
      variable prod     : signed(31 downto 0);
   begin
      if rising_edge(clk_i) then

         -- Pipeline stage 1 input to DSP
         x_d     <= x;
         left_d  <= signed(vol_left_i);
         right_d <= signed(vol_right_i);
         -- Pipeline stage 2 input to DSP
         x_dd     <= x_d;
         left_dd  <= left_d;
         right_dd <= right_d;

         prod := x_dd * left_dd;
         audio_left_o <= prod(27 downto 12);

         prod := x_dd * right_dd;
         audio_right_o <= prod(27 downto 12);

      end if;
   end process p_out;

end architecture synthesis;

