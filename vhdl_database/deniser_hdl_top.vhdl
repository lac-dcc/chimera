--  Copyright (C) 2020-2021 Martin Åberg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License along
--  with this program; if not, write to the Free Software Foundation, Inc.,
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ocs;

-- Technology-independent top level
entity top is
  port (
    -- 7.15909 MHz
    clk7            : in    std_ulogic;
    -- Color clock
    cck             : in    std_ulogic;
    rga             : in    std_ulogic_vector( 8 downto  1);
    drd             : inout std_ulogic_vector(15 downto  0);
    video_r         : out   std_ulogic_vector( 3 downto  0);
    video_b         : out   std_ulogic_vector( 3 downto  0);
    video_g         : out   std_ulogic_vector( 3 downto  0);
    m0v             : in    std_ulogic;
    m0h             : in    std_ulogic;
    m1v             : in    std_ulogic;
    m1h             : in    std_ulogic;

    -- Color burst, only for color composite
    nburst          : out   std_ulogic;
    -- "PIXELSW", "Background indicator", "zero detect", to RGB port
    nzd             : out   std_ulogic;

    -- Composite sync (ECS)
    ncsync          : in    std_ulogic;
    -- CDAC (ECS)
    ncdac           : in    std_ulogic;

    -- external bus driver control
    drd_noe         : out   std_ulogic;
    drd_rl_to_fpga  : out   std_ulogic;

    user0           : inout std_ulogic;
    user1           : inout std_ulogic;
    led0            : out   std_ulogic
  );
end;

architecture rtl of top is
  signal deni       : work.ocs.denise_in_t;
  signal deno       : work.ocs.denise_out_t;

begin
  den0 : entity ocs.denise
  port map (
    deni  => deni,
    deno  => deno
  );


  -- Connect the inputs

  deni.clk7   <= clk7;
  deni.cck    <= cck;
  deni.rga    <= rga;
  deni.drd    <= drd;
  deni.m0v    <= m0v;
  deni.m0h    <= m0h;
  deni.m1v    <= m1v;
  deni.m1h    <= m1h;
  deni.ncsync <= ncsync;
  deni.ncdac  <= ncdac;


  -- Drive the outputs

  drd             <= deno.drd when deno.drd_oe = '1' else "ZZZZZZZZZZZZZZZZ";
  drd_noe         <= deno.drd_ext_noe;
  drd_rl_to_fpga  <= deno.drd_ext_to_denice;
  nburst          <= deno.nburst;

  -- All logic is clocked in the clk7 domain which corresponds to lores pixel
  -- resolution. DDR output registers are used to emit hires RGB pixels.
  vidx : for i in 0 to 3 generate
    r : entity ocs.oddr
    port map (
      d0  => deno.rgb(0)(8+i),
      d1  => deno.rgb(1)(8+i),
      clk => clk7,
      q   => video_r(i)
    );

    g : entity ocs.oddr
    port map (
      d0  => deno.rgb(0)(4+i),
      d1  => deno.rgb(1)(4+i),
      clk => clk7,
      q   => video_g(i)
    );

    b : entity ocs.oddr
    port map (
      d0  => deno.rgb(0)(0+i),
      d1  => deno.rgb(1)(0+i),
      clk => clk7,
      q   => video_b(i)
    );
  end generate;

  vidnzd : entity ocs.oddr
  port map (
    d0  => deno.nzd(0),
    d1  => deno.nzd(1),
    clk => clk7,
    q   => nzd
  );


  -- Set low brightness on user LED when clk7 is available.

  blinkz : block
    signal cnt : unsigned(15 downto 0) := (others => '0');
  begin
    cnt <= cnt + 1 when rising_edge(clk7);
    led0 <= '0' when cnt(cnt'high downto cnt'high-4) = "1111" else '1';
  end block;

end;

