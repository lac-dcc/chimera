----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dither is
  generic(
    BITS_R : positive;
    BITS_G : positive;
    BITS_B : positive
  );
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;
    i_method : in std_logic_vector(1 downto 0);
    i_r : in std_logic_vector(7 downto 0);
    i_g : in std_logic_vector(7 downto 0);
    i_b : in std_logic_vector(7 downto 0);
    o_r : out std_logic_vector(BITS_R-1 downto 0);
    o_g : out std_logic_vector(BITS_G-1 downto 0);
    o_b : out std_logic_vector(BITS_B-1 downto 0)
  );
end dither;

architecture rtl of dither is
  constant C_DITHER_BITS_R : positive := 8 - BITS_R;
  constant C_DITHER_BITS_G : positive := 8 - BITS_G;
  constant C_DITHER_BITS_B : positive := 8 - BITS_B;

  constant C_METHOD_NONE : std_logic_vector(1 downto 0) := "00";
  constant C_METHOD_WHITE : std_logic_vector(1 downto 0) := "01";

  signal s_rnd_1 : std_logic_vector(7 downto 0);
  signal s_rnd_2 : std_logic_vector(7 downto 0);
  signal s_rnd_3 : std_logic_vector(7 downto 0);
  signal s_rnd_r : std_logic_vector(C_DITHER_BITS_R-1 downto 0);
  signal s_rnd_g : std_logic_vector(C_DITHER_BITS_G-1 downto 0);
  signal s_rnd_b : std_logic_vector(C_DITHER_BITS_B-1 downto 0);
  signal s_next_dither_r : std_logic_vector(C_DITHER_BITS_R-1 downto 0);
  signal s_next_dither_g : std_logic_vector(C_DITHER_BITS_G-1 downto 0);
  signal s_next_dither_b : std_logic_vector(C_DITHER_BITS_B-1 downto 0);
  signal s_dither_r : std_logic_vector(C_DITHER_BITS_R-1 downto 0);
  signal s_dither_g : std_logic_vector(C_DITHER_BITS_G-1 downto 0);
  signal s_dither_b : std_logic_vector(C_DITHER_BITS_B-1 downto 0);

  signal s_dither_r_ext : std_logic_vector(9 downto 0);
  signal s_dither_g_ext : std_logic_vector(9 downto 0);
  signal s_dither_b_ext : std_logic_vector(9 downto 0);
  signal s_next_r_unclamped : std_logic_vector(9 downto 0);
  signal s_next_g_unclamped : std_logic_vector(9 downto 0);
  signal s_next_b_unclamped : std_logic_vector(9 downto 0);
  signal s_r_unclamped : std_logic_vector(9 downto 0);
  signal s_g_unclamped : std_logic_vector(9 downto 0);
  signal s_b_unclamped : std_logic_vector(9 downto 0);

  signal s_next_r : std_logic_vector(BITS_R-1 downto 0);
  signal s_next_g : std_logic_vector(BITS_G-1 downto 0);
  signal s_next_b : std_logic_vector(BITS_B-1 downto 0);

  function clamp_and_trunc(x : std_logic_vector; bits : integer) return std_logic_vector is
  begin
    if x(9) = '1' then
      -- Underflow -> 0
      return std_logic_vector(to_signed(0, bits));
    elsif x(8) = '1' then
      -- Overflow -> "11...11"
      return std_logic_vector(to_signed(-1, bits));
    else
      return x(7 downto 8-bits);
    end if;
  end function;

begin
  --------------------------------------------------------------------------------------------------
  -- Stage 1: Generate dithering noise.
  --------------------------------------------------------------------------------------------------

  -- We use three PRNG:s to generate enough entropy for the dithering logic.
  prng1: entity work.prng
    generic map (
      START_VALUE => x"8654af40"
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      o_rnd => s_rnd_1
    );
  prng2: entity work.prng
    generic map (
      START_VALUE => x"a654f813"
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      o_rnd => s_rnd_2
    );
  prng3: entity work.prng
    generic map (
      START_VALUE => x"54543844"
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      o_rnd => s_rnd_3
    );

  -- Extract different random numbers for R, G and B.
  s_rnd_r <= s_rnd_1(7 downto (8 - C_DITHER_BITS_R));
  s_rnd_g <= s_rnd_2(7 downto (8 - C_DITHER_BITS_G));
  s_rnd_b <= s_rnd_3(7 downto (8 - C_DITHER_BITS_B));

  -- Select dithering type.
  DitherMuxR: with i_method select
    s_next_dither_r <= s_rnd_r         when C_METHOD_WHITE,
                       (others => '0') when others;

  DitherMuxG: with i_method select
    s_next_dither_g <= s_rnd_g         when C_METHOD_WHITE,
                       (others => '0') when others;

  DitherMuxB: with i_method select
    s_next_dither_b <= s_rnd_b         when C_METHOD_WHITE,
                       (others => '0') when others;

  process(i_rst, i_clk)
  begin
    if i_rst = '1' then
      s_dither_r <= (others => '0');
      s_dither_g <= (others => '0');
      s_dither_b <= (others => '0');
    elsif rising_edge(i_clk) then
      s_dither_r <= s_next_dither_r;
      s_dither_g <= s_next_dither_g;
      s_dither_b <= s_next_dither_b;
    end if;
  end process;


  --------------------------------------------------------------------------------------------------
  -- Stage 2: Apply dithering.
  --------------------------------------------------------------------------------------------------

  -- Sign extend dithering data.
  s_dither_r_ext(C_DITHER_BITS_R-1 downto 0) <= s_dither_r;
  s_dither_r_ext(9 downto C_DITHER_BITS_R) <= (others => s_dither_r(C_DITHER_BITS_R-1));
  s_dither_g_ext(C_DITHER_BITS_G-1 downto 0) <= s_dither_g;
  s_dither_g_ext(9 downto C_DITHER_BITS_G) <= (others => s_dither_g(C_DITHER_BITS_G-1));
  s_dither_b_ext(C_DITHER_BITS_B-1 downto 0) <= s_dither_b;
  s_dither_b_ext(9 downto C_DITHER_BITS_B) <= (others => s_dither_b(C_DITHER_BITS_B-1));

  -- Perform dithering.
  s_next_r_unclamped <= std_logic_vector(signed("00" & i_r) + signed(s_dither_r_ext));
  s_next_g_unclamped <= std_logic_vector(signed("00" & i_g) + signed(s_dither_g_ext));
  s_next_b_unclamped <= std_logic_vector(signed("00" & i_b) + signed(s_dither_b_ext));

  process(i_rst, i_clk)
  begin
    if i_rst = '1' then
      s_r_unclamped <= (others => '0');
      s_g_unclamped <= (others => '0');
      s_b_unclamped <= (others => '0');
    elsif rising_edge(i_clk) then
      s_r_unclamped <= s_next_r_unclamped;
      s_g_unclamped <= s_next_g_unclamped;
      s_b_unclamped <= s_next_b_unclamped;
    end if;
  end process;


  --------------------------------------------------------------------------------------------------
  -- Stage 3: Clamp and truncate.
  --------------------------------------------------------------------------------------------------

  -- Form the final result via clamping and truncation.
  s_next_r <= clamp_and_trunc(s_r_unclamped, BITS_R);
  s_next_g <= clamp_and_trunc(s_g_unclamped, BITS_G);
  s_next_b <= clamp_and_trunc(s_b_unclamped, BITS_B);

  process(i_rst, i_clk)
  begin
    if i_rst = '1' then
      o_r <= (others => '0');
      o_g <= (others => '0');
      o_b <= (others => '0');
    elsif rising_edge(i_clk) then
      o_r <= s_next_r;
      o_g <= s_next_g;
      o_b <= s_next_b;
    end if;
  end process;
end rtl;

