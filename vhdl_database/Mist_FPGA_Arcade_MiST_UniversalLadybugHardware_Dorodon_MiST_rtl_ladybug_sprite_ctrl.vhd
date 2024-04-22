-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_sprite_ctrl.vhd,v 1.8 2005/10/10 22:02:14 arnim Exp $
--
-- Control logic of the Sprite module.
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2005, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;

entity ladybug_sprite_ctrl is

  port (
    clk_20mhz_i     : in  std_logic;
    clk_en_5mhz_i   : in  std_logic;
    clk_en_5mhz_n_i : in  std_logic;
    por_n_i         : in  std_logic;
    vbl_n_i         : in  std_logic;
    vbl_d_n_i       : in  std_logic;
    vc_i            : in  std_logic;
    vc_d_i          : in  std_logic;
    ha_i            : in  std_logic;
    ha_d_i          : in  std_logic;
    rb6_i           : in  std_logic;
    rb7_i           : in  std_logic;
    rc3_i           : in  std_logic;
    rc4_i           : in  std_logic;
    rc5_i           : in  std_logic;
    j7_b_i          : in  std_logic;
    j7_c_i          : in  std_logic;
    clk_en_eck_i    : in  std_logic;
    c_o             : out std_logic_vector(10 downto 0);
    clk_en_5ck_n_o  : out std_logic;
    clk_en_6ck_n_o  : out std_logic;
    clk_en_7ck_n_o  : out std_logic;
    s6ck_n_o        : out std_logic;
    s7ck_n_o        : out std_logic;
    clk_en_b7_p3_o  : out std_logic;
    e5_p8_o         : out std_logic;
    clk_en_e7_3_o   : out std_logic;
    a8_p5_n_o       : out std_logic
  );

end ladybug_sprite_ctrl;


architecture rtl of ladybug_sprite_ctrl is

  signal clk_5mhz_q : std_logic;

  signal a7_p5_s,
         a7_p5_q    : std_logic;
  signal a7_p9_q    : std_logic;

  signal a8_p5_q    : std_logic;

  signal n4_p5_s,
         n4_p5_q    : std_logic;

  signal f7_ck_en_s,
         f7_cl_s,
         f7_qa_s, f7_qb_s, f7_qc_s, f7_qd_s,
         f7_da_s, f7_db_s, f7_dc_s, f7_dd_s  : std_logic_vector(2 downto 1);

  signal j5_ck_en_s,
         j5_cl_s,
         j5_qa_s, j5_qb_s, j5_qc_s, j5_qd_s,
         j5_da_s, j5_db_s, j5_dc_s, j5_dd_s  : std_logic_vector(2 downto 1);

  signal e7_ck_en_s,
         e7_cl_n_s                           : std_logic;
  signal e7_d_s,
         e7_q_s, e7_q_n_s,
         e7_d_out_s, e7_d_out_n_s            : std_logic_vector(4 downto 1);

  signal h5_n_s                              : std_logic_vector(7 downto 0);

begin

  -----------------------------------------------------------------------------
  -- Process seq
  --
  -- Purpose:
  --   Implements various sequential elements.
  --
  seq: process (clk_20mhz_i, por_n_i)
  begin
    if por_n_i = '0' then
      clk_5mhz_q <= '0';
      a7_p5_q    <= '0';
      a7_p9_q    <= '0';
      a8_p5_q    <= '0';
      n4_p5_q    <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      -- Turn clk_5mhz enable into clock waveform -----------------------------
      if clk_en_5mhz_i = '1' then
        clk_5mhz_q <= '1';
      elsif clk_en_5mhz_n_i = '1' then
        clk_5mhz_q <= '0';
      end if;

      -- Flip-Flop A7 ---------------------------------------------------------
      a7_p5_q   <= a7_p5_s;
      --
      if clk_en_5mhz_n_i = '1' then
        a7_p9_q <= j5_qd_s(2);
      end if;

      -- Flip-Flop A8 ---------------------------------------------------------
      if clk_en_eck_i = '1' then
        a8_p5_q <= j7_b_i nand j7_c_i;
      end if;

      -- Flip-Flop N4 ---------------------------------------------------------
      n4_p5_q <= n4_p5_s;

    end if;
  end process seq;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process comb
  --
  -- Purpose:
  --   Implements various combinational signals.
  --
  comb: process (a7_p5_q,
                 vc_i, vc_d_i,
                 n4_p5_q,
                 ha_i, ha_d_i,
                 f7_qd_s)
  begin
    -- D Input for Flip-Flop N4 -----------------------------------------------
    if a7_p5_q = '0' then
      -- pseudo-asynchronous clear
      n4_p5_s <= '0';
    elsif (vc_i and not vc_d_i) = '1' then
      -- falling edge on VC
      n4_p5_s <= '1';
    else
      n4_p5_s <= n4_p5_q;
    end if;

    -- D-Input for Flip-Flop A7.5 ---------------------------------------------
    if (ha_i and not ha_d_i) = '1' then
      -- falling edge on HA
      a7_p5_s <= f7_qd_s(2);
    else
      a7_p5_s <= a7_p5_q;
    end if;

  end process comb;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- F7 - Dual 4-Bit Binary Counter
  -----------------------------------------------------------------------------
  f7_cl_s(1) <= n4_p5_q and ha_i and vbl_n_i;
  f7_cl_s(2) <= f7_cl_s(1);
  --
  f7_b : entity work.ttl_393
    port map (
      ck_i    => clk_20mhz_i,
      ck_en_i => f7_ck_en_s,
      por_n_i => por_n_i,
      cl_i    => f7_cl_s,
      qa_o    => f7_qa_s,
      qb_o    => f7_qb_s,
      qc_o    => f7_qc_s,
      qd_o    => f7_qd_s,
      da_o    => f7_da_s,
      db_o    => f7_db_s,
      dc_o    => f7_dc_s,
      dd_o    => f7_dd_s
    );


  -----------------------------------------------------------------------------
  -- Process f7_ck_en
  --
  -- Purpose:
  --   Build the clock enable for the two counters in F7.
  --
  f7_ck_en: process (j5_qd_s, j5_dd_s,
                     vbl_n_i, vbl_d_n_i,
                     ha_i, ha_d_i,
                     n4_p5_q, n4_p5_s,
                     f7_qd_s, f7_dd_s,
                     e7_q_n_s, e7_d_out_n_s,
                     f7_qb_s, f7_db_s)

    variable ff_q_v, ff_d_v : std_logic;

  begin

    -- combinational result based on flip-flop outputs
    ff_q_v := j5_qd_s(2) or ( not ( not ( vbl_n_i   and ha_i   and n4_p5_q ) ) or not ( not f7_qd_s(2) nand not e7_q_n_s(1) ) );

    -- combinational result based on flip-flop inputs
    ff_d_v := j5_dd_s(2) or ( not ( not ( vbl_d_n_i and ha_d_i and n4_p5_s ) ) or not ( not f7_qd_s(2) nand not e7_d_out_n_s(1) ) );
--                       B7.3                       D7.8       D7.8            F6.3                    B7.6
    -- rising edge detector on B7.3
    f7_ck_en_s(1) <= not ff_q_v and ff_d_v;

    -- falling edge detector on F7.QB(1)
    f7_ck_en_s(2) <=  f7_qb_s(1) and not  f7_db_s(1);

  end process f7_ck_en;
  --
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- J5 - Dual 4-Bit Binary Counter
  -----------------------------------------------------------------------------
  j5_cl_s(1) <= not vbl_n_i
                or                      -- D7.6
                not(
                    not clk_5mhz_q
                    nand                -- F5.8
                    not h5_n_s(0)
                   )
                or                      -- D7.6
                n4_p5_q;
  j5_cl_s(2) <= a7_p9_q
                or                      -- B7.8
                (
                 not (
                      not (
                           n4_p5_q
                           and          -- D7.8
                           ha_i
                           and          -- D7.8
                           vbl_n_i
                          )
                     )
                 or                     -- F6.3
                 not (
                      not f7_qd_s(2)
                      nand              -- B7.6
                      not e7_q_n_s(1)
                     )
                );
  --
  j5_b : entity work.ttl_393
    port map (
      ck_i    => clk_20mhz_i,
      ck_en_i => j5_ck_en_s,
      por_n_i => por_n_i,
      cl_i    => j5_cl_s,
      qa_o    => j5_qa_s,
      qb_o    => j5_qb_s,
      qc_o    => j5_qc_s,
      qd_o    => j5_qd_s,
      da_o    => j5_da_s,
      db_o    => j5_db_s,
      dc_o    => j5_dc_s,
      dd_o    => j5_dd_s
    );


  -----------------------------------------------------------------------------
  -- Process j5_ck_en
  --
  -- Purpose:
  --   Build the clock enable for the two counters in J5.
  --
  j5_ck_en: process (ha_i, ha_d_i,
                     e7_q_s, e7_d_out_s,
                     j5_qc_s, j5_dc_s)
  begin
    -- falling edge detector on F6.11
    j5_ck_en_s(1) <= -- Flip-Flop Outputs
                     (
                      not ha_i
                      nand
                      e7_q_s(3)
                     )
                     and not -- Flip-Flop Inputs
                     (
                      not ha_d_i
                      nand
                      e7_d_out_s(3)
                     );

    -- falling edge detector on C7.10
    j5_ck_en_s(2) <= -- Flip-Flop Outputs
                     (
                      j5_qc_s(1)
                      nor
                      e7_q_s(2)
                     )
                     and not -- Flip-Flop Inputs
                     (
                       j5_dc_s(1)
                       nor
                       e7_d_out_s(2)
                     );
  end process j5_ck_en;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- E7 - Quad D-Type Flip-Flops with Clear
  -----------------------------------------------------------------------------
  e7_d_s(1) <= not rb7_i;
  e7_d_s(2) <= not (
                    rb7_i
                    and                 -- D7.12
                    rc5_i
                    and                 -- D7.12
                    (
                     not rc4_i
                     and                -- C7.1
                     not (
                          not rc3_i
                          nor           -- C6.3
                          rb6_i
                         )
                    )
                   );
  e7_d_s(3) <= not e7_d_s(2)
               and                      -- C7.4
               not a8_p5_q;
  e7_d_s(4) <= '0';

  -- This clock enable is not 100% equivalent to the schematics.
  -- There, h5_n_s(4) could also generate a rising edge for E7
  -- but this is ignored here. It is believed that h5_n_s(4) acts
  -- only as a clock enable/suppress for the 5 MHz clock.
  -- This implementation suppresses as well a combinational feedback
  -- loop from J5/1.
  e7_ck_en_s <= clk_en_5mhz_i and not h5_n_s(4);

  e7_cl_n_s  <= f7_qd_s(2)
                or                      -- B7.3??
                (
                  not clk_5mhz_q
                  nand                  -- F5.8
                  not h5_n_s(0)
                ) after 20 ns;

  e7_b : entity work.ttl_175
    port map (
      ck_i    => clk_20mhz_i,
      ck_en_i => e7_ck_en_s,
      por_n_i => por_n_i,
      cl_n_i  => e7_cl_n_s,
      d_i     => e7_d_s,
      q_o     => e7_q_s,
      q_n_o   => e7_q_n_s,
      d_o     => e7_d_out_s,
      d_n_o   => e7_d_out_n_s
    );

  clk_en_e7_3_o <= not e7_q_s(3) and e7_d_out_s(3);


  -----------------------------------------------------------------------------
  -- Process h5
  --
  -- Purpose:
  --   Implements all functionality regarding H5.
  --
  h5: process (j5_qa_s, j5_da_s,
               j5_qb_s, j5_db_s,
               ha_i, ha_d_i,
               vbl_n_i, vbl_d_n_i,
               a7_p5_q, a7_p5_s)
    variable ff_q_v, ff_d_v       : std_logic_vector(7 downto 0);
    variable f5_p3_q_v, f5_p3_d_v : std_logic;

	  -----------------------------------------------------------------------------
	  -- 7445 - BCD to Decimal Decoder
	  -----------------------------------------------------------------------------
	  function ttl_45_f(a, b, c, d : in std_logic) return
		 std_logic_vector is
		 variable idx_v : std_logic_vector( 3 downto 0);
		 variable vec_v : std_logic_vector(15 downto 0);
	  begin
		 vec_v := (others => '1');

		 idx_v := d & c & b & a;
		 vec_v(to_integer(unsigned(idx_v))) := '0';

		 return vec_v(7 downto 0);
	  end ttl_45_f;

  begin
    -- combinational result based on flip-flop outputs
    f5_p3_q_v := not a7_p5_q nand vbl_n_i;
    ff_q_v    := ttl_45_f(a => j5_qa_s(1),
                          b => j5_qb_s(1),
                          c => ha_i,
                          d => f5_p3_q_v);
    -- combinational result based on flip-flop inputs
    f5_p3_d_v := not a7_p5_s nand vbl_d_n_i;
    ff_d_v    := ttl_45_f(a => j5_da_s(1),
                          b => j5_db_s(1),
                          c => ha_d_i,
                          d => f5_p3_d_v);

    -- combinational output of H5 is based on flip-flop outputs
    h5_n_s         <= ff_q_v;

    -- clock enable for flip-flops on /5CK
    clk_en_5ck_n_o <= not ff_q_v(5) and ff_d_v(5);
    -- clock enable for flip-flops on /6CK
    clk_en_6ck_n_o <= not ff_q_v(6) and ff_d_v(6);
    -- clock enable for flip-flops on /7CK
    clk_en_7ck_n_o <= not ff_q_v(7) and ff_d_v(7);

    s6ck_n_o       <= ff_q_v(6);
    s7ck_n_o       <= ff_q_v(7);
  end process h5;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output Mapping
  -----------------------------------------------------------------------------
  clk_en_b7_p3_o <= f7_ck_en_s(1);
  e5_p8_o        <= n4_p5_q
                    nor                 -- E5.8
                    not (
                         f7_qa_s(1)
                         nand            -- F6.8
                         f7_qb_s(1)
                        );
  a8_p5_n_o      <= not a8_p5_q;

  c_o( 0) <= j5_qa_s(1);
  c_o( 1) <= j5_qb_s(1);
  c_o( 2) <= j5_qa_s(2);
  c_o( 3) <= j5_qb_s(2);
  c_o( 4) <= j5_qc_s(2);
  c_o( 5) <= j5_qd_s(2);
  c_o( 6) <= f7_qa_s(2);
  c_o( 7) <= f7_qb_s(2);
  c_o( 8) <= f7_qc_s(2);
  c_o( 9) <= f7_qa_s(1);
  c_o(10) <= f7_qb_s(1);

end rtl;
