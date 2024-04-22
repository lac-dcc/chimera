-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_char.vhd,v 1.18 2005/10/10 22:02:14 arnim Exp $
--
-- Character Video Module of Lady Bug Machine.
--
-- This unit contains most of the logic found on schematic page three.
-- Excluded parts are:
--   * the 10 MHz and 5 MHz clock generation
--     moved into separate module on toplevel of Lady Bug machine
--   * the video timing circuitry
--     moved into separate module on toplevel of video unit
--   * the video MUX and RGB conversion unit
--     moved into separate module at toplevel of video unit
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
	use ieee.numeric_std.all;

entity ladybug_char is
  port (
    -- Clock and Reset Interface ----------------------------------------------
    clk_20mhz_i   : in  std_logic;
    por_n_i       : in  std_logic;
    res_n_i       : in  std_logic;
    clk_en_5mhz_i : in  std_logic;
    clk_en_4mhz_i : in  std_logic;
    -- CPU Interface ----------------------------------------------------------
    cs10_n_i      : in  std_logic;
    cs13_n_i      : in  std_logic;
    a_i           : in  std_logic_vector(10 downto 0);
    rd_n_i        : in  std_logic;
    wr_n_i        : in  std_logic;
    wait_n_o      : out std_logic;
    d_from_cpu_i  : in  std_logic_vector( 7 downto 0);
    d_from_char_o : out std_logic_vector( 7 downto 0);
    -- RGB Video Interface ----------------------------------------------------
    h_i           : in  std_logic_vector( 3 downto 0);
    h_t_i         : in  std_logic_vector( 3 downto 0);
    ha_t_rise_i   : in  std_logic;
    hx_i          : in  std_logic;
    v_i           : in  std_logic_vector( 3 downto 0);
    v_t_i         : in  std_logic_vector( 3 downto 0);
    hbl_i         : in  std_logic;
    blank_flont_i : in  std_logic;
    blank_o       : out std_logic;
    crg_o         : out std_logic_vector( 5 downto 1);
	 vblank_o      : out std_logic;
	 hblank_o      : out std_logic;
    -- Character ROM Interface ------------------------------------------------
    rom_char_a_o  : out std_logic_vector(11 downto 0);
    rom_char_d_i  : in  std_logic_vector(15 downto 0)
  );

end ladybug_char;

architecture rtl of ladybug_char is

  signal flip_screen_q : std_logic;

  signal h0_s,
         h1_s,
         h2_s  : std_logic;
  signal h_flip_s,
         h_t_flip_s : std_logic_vector(3 downto 0);
  signal v_flip_s,
         v_t_flip_s : std_logic_vector(3 downto 0);

  signal h_ctrl_d_s,
         h_ctrl_s,
         h_ctrl_n_s,
         h_ctrl_d_out_s,
         h_ctrl_d_n_out_s,
         h_ctrl_rise_s,
         h_ctrl_n_rise_s : std_logic_vector(4 downto 1);

  signal hx_ctrl_q,
         hx_ctrl_s,
         hx_ctrl_n_rise_s : std_logic;
  signal hx_ctrl_clear_q  : std_logic;

  signal b1_ff_q,
         b1_ff_s,
         b1_ff_n_rise_s   : std_logic;

  signal wait_q       : std_logic;
  signal wait_clear_q : std_logic;

  signal cgs_q,
         cgs_s,
         cgs_rise_s : std_logic;

  signal ram_addr_s : std_logic_vector(9 downto 0);
  signal select_a_s : std_logic;

  signal char_ram_cs_n_s,
         char_ram_we_n_s   : std_logic;
  signal col_ram_cs_n_s,
         col_ram_we_n_s    : std_logic;
  signal d_from_char_ram_s : std_logic_vector(7 downto 0);
  signal d_from_col_ram_s  : std_logic_vector(3 downto 0);

  signal s_q           : std_logic_vector( 7 downto 0);
  signal d_char_ram_q  : std_logic_vector( 7 downto 0);
  signal d_col_ram_q   : std_logic_vector( 3 downto 0);

  signal d_char_rom_q  : std_logic_vector(15 downto 0);
  signal crg1_s,
         crg2_s,
         crg3_q,
         crg4_q,
         crg5_q        : std_logic;

  signal hbl_q,hbl_d   : std_logic;

  signal hcnt  : integer;
  signal vdd_s : std_logic;

begin

  vdd_s <= '1';

  -----------------------------------------------------------------------------
  -- Process flip
  --
  -- Purpose:
  --   Implement the flip_screen flag.
  --
  flip: process (clk_20mhz_i, res_n_i)
  begin
    if res_n_i = '0' then
      -- Actually, this asynchronous reset of the ls259 is not 100%
      -- equivalent to the real behavior of this circuit. However,
      -- the flip_screen latch is modelled like this for the sake of
      -- simplicity. It's sufficient for the purpose here.
      flip_screen_q <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      if a_i(2 downto 0) = "000" and cs10_n_i = '0' then
          flip_screen_q <= d_from_cpu_i(0);
      end if;

    end if;
  end process flip;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process h_flip
  --
  -- Purpose:
  --   Build the flipped horizontal timing signals.
  --
  h_flip: process (flip_screen_q,
                   h_i, h_t_i,
                   s_q)
    variable a_v, b_v,
             sum_v     : unsigned(8 downto 0);
  begin
    -- calculate sum
    a_v   := '0' & unsigned(s_q);
    b_v   := '0' & unsigned(h_t_i) & unsigned(h_i);
    sum_v := a_v + b_v;

    -- h0,1,2 are taken from directly from sum
    h0_s  <= sum_v(0);
    h1_s  <= sum_v(1);
    h2_s  <= sum_v(2);

    -- now flip
    for idx in 3 downto 0 loop
      h_flip_s(idx)   <= flip_screen_q xor sum_v(idx);
      h_t_flip_s(idx) <= flip_screen_q xor sum_v(idx + 4);
    end loop;
  end process h_flip;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process v_flip
  --
  -- Purpose:
  --   Build the flipped horizontal timing signals.
  --
  v_flip: process (flip_screen_q,
                   v_i, v_t_i)
  begin
    for idx in 3 downto 0 loop
      v_flip_s(idx)   <= flip_screen_q xor v_i(idx);
      v_t_flip_s(idx) <= flip_screen_q xor v_t_i(idx);
    end loop;
  end process v_flip;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- The Horizontal Control Signals
  -- Detailed purpose/meaning is unknown.
  -----------------------------------------------------------------------------
  h_ctrl_d_s(1) <= not (not h2_s and (h1_s xor h0_s));
  h_ctrl_d_s(2) <= hx_i;
  h_ctrl_d_s(3) <= not ((h1_s xor h0_s) or (not h2_s xor h1_s));
  h_ctrl_d_s(4) <= '0';
  h_ctrl_b : entity work.ttl_175
    port map (
      ck_i    => clk_20mhz_i,
      ck_en_i => clk_en_5mhz_i,
      por_n_i => por_n_i,
      cl_n_i  => vdd_s,
      d_i     => h_ctrl_d_s,
      q_o     => h_ctrl_s,
      q_n_o   => h_ctrl_n_s,
      d_o     => h_ctrl_d_out_s,
      d_n_o   => h_ctrl_d_n_out_s
    );
  h_ctrl_rise_s   <= not h_ctrl_s and h_ctrl_d_out_s;
  h_ctrl_n_rise_s <= h_ctrl_s and not h_ctrl_d_n_out_s;


  -----------------------------------------------------------------------------
  -- Process ctrl_seq
  --
  -- Purpose:
  --   Implemente the various sequential elements for horizontal control.
  --
  ctrl_seq: process (clk_20mhz_i, por_n_i)
  begin
    if por_n_i = '0' then
      hx_ctrl_q        <= '0';
      hx_ctrl_clear_q  <= '0';
      b1_ff_q          <= '0';
      wait_q           <= '0';
      wait_clear_q     <= '0';
      cgs_q            <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      -- the HX control flip-flop
      hx_ctrl_q <= hx_ctrl_s;

      -- the clear counterpart of hx_ctrl_q
      if h_ctrl_s(2) = '0' then
        -- pseudo-asynchronous clear
        hx_ctrl_clear_q <= '0';
      elsif hx_ctrl_n_rise_s = '1' then
        -- rising edge indicator acts as clock enable instead of clock
        hx_ctrl_clear_q <= '1';
      end if;

      -- the mysterious B1 flip-flop
      b1_ff_q <= b1_ff_s;

      -- the CGS rising edge indicator support flip-flops
      cgs_q <= cgs_s;

      -- the WAIT flip-flop
      if wait_clear_q = '1' then
        -- pseudo-asynchronous clear
        wait_q <= '0';
      elsif cgs_rise_s = '1' then
        -- rising edge indicator acts as clock enable instead of clock
        wait_q <= '1';
      end if;

      -- the clear counterpart of wait_q
      if clk_en_4mhz_i = '1' then
        wait_clear_q <= wait_q and (h_ctrl_s(3) and (b1_ff_q or hx_ctrl_q));
      end if;

    end if;
  end process ctrl_seq;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process ctrl_comp
  --
  -- Purpose:
  --   Implements the combination logic for the horizontal control
  --   elements.
  --
  ctrl_comp: process (h_ctrl_rise_s,
                      hx_i, hx_ctrl_q,
                      hx_ctrl_clear_q,
                      h_ctrl_n_rise_s,
                      b1_ff_q,
                      cgs_q, cs13_n_i)
  begin
    -- default assignments
    hx_ctrl_s        <= hx_ctrl_q;
    hx_ctrl_n_rise_s <= '0';
    b1_ff_s          <= b1_ff_q;
    b1_ff_n_rise_s   <= '0';
    cgs_s            <= cgs_q;
    cgs_rise_s       <= '0';

    -- the HX control flip-flop -----------------------------------------------
    if hx_ctrl_clear_q = '1' then
      -- pseudo-asynchronous clear
      hx_ctrl_s          <= '0';

      if (not hx_ctrl_q) = '0' then
        -- detct rising edge of inverted ouput
        hx_ctrl_n_rise_s <= '1';
      end if;
    elsif h_ctrl_rise_s(1) = '1' then
      -- rising edge indicator acts as clock enable instead of clock
      if hx_i = '1' then
        -- toggle FF
        hx_ctrl_s        <= not hx_ctrl_q;

        if (not hx_ctrl_q) = '0' then
          -- detct rising edge of inverted ouput
          hx_ctrl_n_rise_s <= '1';
        end if;
      end if;
    end if;

    -- the mysterious B1 flip-flop --------------------------------------------
    if hx_ctrl_q = '1' then
      -- pseudo-asynchronous clear
      b1_ff_s <= '0';

      if (not b1_ff_q) = '0' then
        -- detct rising edge of inverted ouput
        b1_ff_n_rise_s <= '1';
      end if;
    elsif h_ctrl_n_rise_s(3) = '1' then
      -- rising edge indicator acts as clock enable instead of clock
      b1_ff_s <= '1';
    end if;

    -- the CGS rising edge indicator support flip-flop ------------------------
    cgs_s      <= not cs13_n_i;
    cgs_rise_s <= not cgs_q and not cs13_n_i;

  end process ctrl_comp;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process ram_addr
  --
  -- Purpose:
  --   Multiplexes the CPU address bus and the h+v timing control signals to
  --   form the RAM address bus.
  --
  ram_addr: process (h_flip_s, h_t_flip_s,
                     v_flip_s, v_t_flip_s,
                     a_i,
                     h_ctrl_s, h_ctrl_n_s,
                     hx_ctrl_q,
                     b1_ff_q)
    variable a_v, b_v, g_n_v : std_logic;
    variable vec_v : std_logic_vector(1 downto 0);
  begin
    -- default assignment
    ram_addr_s <= (others => '0');

    -- logic that drives A input of IC L4 and K4
    a_v := not (h_ctrl_n_s(1) and (b1_ff_q or hx_ctrl_q));
    -- logic that drives B input of IC L4 and K4
    b_v := hx_ctrl_q;
    -- logic that drives /G input of IC J4
    g_n_v := hx_ctrl_q and (h_ctrl_n_s(1) and (b1_ff_q or hx_ctrl_q));

    -- IC L4 and K4: Dual 4:1 Multiplexer -------------------------------------
    vec_v := b_v & a_v;
    case vec_v is
      when "00" =>
        ram_addr_s(0) <= h_flip_s  (3);
        ram_addr_s(1) <= h_t_flip_s(0);
        --
        ram_addr_s(2) <= h_t_flip_s(1);
        ram_addr_s(3) <= h_t_flip_s(2);
      when "01" =>
        ram_addr_s(0) <= a_i  (0);
        ram_addr_s(1) <= a_i  (1);
        --
        ram_addr_s(2) <= a_i  (2);
        ram_addr_s(3) <= a_i  (3);
      when "10" =>
        ram_addr_s(0) <= v_t_flip_s(1);
        ram_addr_s(1) <= v_t_flip_s(2);
        --
        ram_addr_s(2) <= v_t_flip_s(3);
        ram_addr_s(3) <= '0';
      when "11" =>
        ram_addr_s(0) <= a_i  (0);
        ram_addr_s(1) <= a_i  (1);
        --
        ram_addr_s(2) <= a_i  (2);
        ram_addr_s(3) <= a_i  (3);
      when others =>
        null;
    end case;

    -- IC J4 and H4: Quad 2:1 Multiplexer -------------------------------------
    case a_v is
      when '0' =>
        ram_addr_s(4) <= h_t_flip_s(3) and not g_n_v;
        ram_addr_s(7) <= v_t_flip_s(1) and not g_n_v;
        ram_addr_s(8) <= v_t_flip_s(2) and not g_n_v;
        ram_addr_s(9) <= v_t_flip_s(3) and not g_n_v;
        --
        ram_addr_s(5) <= v_flip_s  (3);
        ram_addr_s(6) <= v_t_flip_s(0);
      when '1' =>
        ram_addr_s(4) <= a_i  (4)      and not g_n_v;
        ram_addr_s(7) <= a_i  (7)      and not g_n_v;
        ram_addr_s(8) <= a_i  (8)      and not g_n_v;
        ram_addr_s(9) <= a_i  (9)      and not g_n_v;
        --
        ram_addr_s(5) <= a_i  (5);
        ram_addr_s(6) <= a_i  (6);
      when others =>
        null;
    end case;

    select_a_s <= a_v;

  end process ram_addr;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process ram_ctrl
  --
  -- Purpose:
  --   Generate the control signals for the character and color RAMs.
  --   This comprises:
  --     * reading RAMs while the beam sweeps the screen
  --     * reading RAMs to the CPU
  --     * writing RAMs from the CPU
  --
  ram_ctrl: process (cs13_n_i,
                     wait_q,
                     select_a_s,
                     a_i,
                     wr_n_i, rd_n_i,
                     d_from_char_ram_s, d_from_col_ram_s,
                     clk_en_4mhz_i)
    variable cpu_read_char_ram_v  : boolean;
    variable cpu_write_char_ram_v : boolean;
    variable cpu_read_col_ram_v   : boolean;
    variable cpu_write_col_ram_v  : boolean;
    variable vec_v                : std_logic_vector(2 downto 0);
  begin
    -- default assignments
    char_ram_cs_n_s      <= '1';
    char_ram_we_n_s      <= '1';
    col_ram_cs_n_s       <= '1';
    col_ram_we_n_s       <= '1';
    d_from_char_o        <= (others => '1');
    cpu_read_char_ram_v  := false;
    cpu_write_char_ram_v := false;
    cpu_read_col_ram_v   := false;
    cpu_write_col_ram_v  := false;

    -- detect and decode CPU access
    if clk_en_4mhz_i = '1' and          -- operate RAMs with CPU clock
       (not cs13_n_i and select_a_s and not wait_q) = '1' then
      vec_v := a_i(10) & rd_n_i & wr_n_i;
      case vec_v is
        when "001" =>
          cpu_read_char_ram_v  := true;
        when "010" =>
          cpu_write_char_ram_v := true;
        when "101" =>
          cpu_read_col_ram_v   := true;
        when "110" =>
          cpu_write_col_ram_v  := true;
        when others =>
          null;
      end case;
    end if;

    -- now we are prepared to generate the /CS and /WE signals for the RAMs
    if select_a_s = '0' or
       cpu_read_char_ram_v or cpu_write_char_ram_v then
      char_ram_cs_n_s <= '0';
    end if;
    if select_a_s = '0' or
       cpu_read_col_ram_v or cpu_write_col_ram_v then
      col_ram_cs_n_s  <= '0';
    end if;
    if cpu_write_char_ram_v then
      char_ram_we_n_s <= '0';
    end if;
    if cpu_write_col_ram_v then
      col_ram_we_n_s  <= '0';
    end if;

    -- and we can multiplex the data bus towards the CPU
    if cpu_read_char_ram_v then
      d_from_char_o <= d_from_char_ram_s;
    elsif cpu_read_col_ram_v then
      d_from_char_o(3 downto 0) <= d_from_col_ram_s;
    end if;

  end process ram_ctrl;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- The character RAM
  -----------------------------------------------------------------------------
  char_ram_b : entity work.ladybug_char_ram
    port map (
      clk_i    => clk_20mhz_i,
      clk_en_i => clk_en_4mhz_i,
      a_i      => ram_addr_s,
      cs_n_i   => char_ram_cs_n_s,
      we_n_i   => char_ram_we_n_s,
      d_i      => d_from_cpu_i,
      d_o      => d_from_char_ram_s
    );
  -----------------------------------------------------------------------------
  -- The color RAM
  -----------------------------------------------------------------------------
  col_ram_b : entity work.ladybug_char_col_ram
    port map (
      clk_i    => clk_20mhz_i,
      clk_en_i => clk_en_4mhz_i,
      a_i      => ram_addr_s,
      cs_n_i   => col_ram_cs_n_s,
      we_n_i   => col_ram_we_n_s,
      d_i      => d_from_cpu_i(3 downto 0),
      d_o      => d_from_col_ram_s
    );


  -----------------------------------------------------------------------------
  -- Process ram_d_seq
  --
  -- Purpose:
  --   Implements three latch banks that save the output of the character
  --   and color RAMs.
  --
  ram_d_seq: process (clk_20mhz_i, por_n_i)
    variable complex_rising_edge_v : boolean;
  begin
    if por_n_i = '0' then
      s_q          <= (others => '0');
      d_char_ram_q <= (others => '0');
      d_col_ram_q  <= (others => '0');

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      -- latch data from the character RAM to form input for h_flip -----------
      if hx_ctrl_n_rise_s = '1' then
        s_q <= d_from_char_ram_s;
      end if;

      -- latch data from the character RAM for ROM address generation ---------
      -- there are three sources for a rising edge:
      --   1) falling edge of h_ctrl_n_s(1)
      --      => equivalen to rising edge of h_ctrl_s(1)
      --   2) rising edge of hx_ctrl_n_q
      --   3) rising edge of b1_ff_n
      -- For each source, the two have to be in a defined state to let
      -- the edge propage to the latches.
      complex_rising_edge_v := ((h_ctrl_rise_s(1) and
                                 (b1_ff_q or hx_ctrl_q))              or
                                (hx_ctrl_n_rise_s and
                                 (not b1_ff_q and not h_ctrl_n_s(1))) or
                                (b1_ff_n_rise_s and
                                 (not hx_ctrl_q and not h_ctrl_s(1)))) = '1';
      if complex_rising_edge_v then
        d_char_ram_q <= d_from_char_ram_s;
        d_col_ram_q  <= d_from_col_ram_s;
      end if;

    end if;
  end process ram_d_seq;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process latch_rom_d
  --
  -- Purpose:
  --   Latch the output of the character ROM.
  --
  latch_rom_d: process (clk_20mhz_i, por_n_i)
  begin
    if por_n_i = '0' then
      d_char_rom_q  <= (others => '0');
      crg3_q        <= '0';
      crg4_q        <= '0';
      crg5_q        <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      if (clk_en_5mhz_i and
          h2_s and h1_s and h0_s) = '1' then
        d_char_rom_q <= rom_char_d_i;
        crg3_q       <= d_col_ram_q(0);
        crg4_q       <= d_col_ram_q(1);
        crg5_q       <= d_col_ram_q(2);
      end if;

    end if;
  end process latch_rom_d;
  --
  -----------------------------------------------------------------------------
  -- Process hbl_seq
  --
  -- Purpose:
  --   Implements the flip-flop that latches HBL.
  --
  hbl_seq: process (clk_20mhz_i, por_n_i)
  begin
    if por_n_i = '0' then
      hbl_q <= '0';
    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
		if clk_en_5mhz_i = '1' then
			if hcnt /= 255 then
				hcnt <= hcnt + 1;
			end if;
		end if;
      if ha_t_rise_i = '1' then
        hbl_q <= hbl_i;
		  if hbl_q = '1' and hbl_i = '0' then
				hcnt <= 0;
		  end if;
      end if;
    end if;
  end process hbl_seq;
  --
  -----------------------------------------------------------------------------

  process (clk_20mhz_i)
  begin
    if rising_edge(clk_20mhz_i) then
      if clk_en_5mhz_i = '1' then
			hbl_d <= hbl_q;

			if hcnt < 240 then
				hblank_o <= '0';
			else
				hblank_o <= '1';
			end if;

			if hbl_d = '0' and hbl_q = '1' then
				vblank_o <= not blank_flont_i;
			end if;
      end if;
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- Process crg_mux
  --
  -- Purpose:
  --   Multiplexes the latched character ROM data to CRG1 and CRG2.
  --
  crg_mux: process (d_char_rom_q,
                    h_flip_s,
                    blank_flont_i,
                    hbl_q)
    variable blank_v : std_logic;
    variable idx_v   : unsigned(2 downto 0);
  begin
    blank_v := not (blank_flont_i and not hbl_q);
    idx_v   := unsigned(h_flip_s(2 downto 0));

    if blank_v = '0' then
      crg1_s <= d_char_rom_q(to_integer('0' & idx_v));
      crg2_s <= d_char_rom_q(to_integer('1' & idx_v));
    else
      crg1_s <= '0';
      crg2_s <= '0';
    end if;

    blank_o <= blank_v;
  end process crg_mux;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output Mapping
  -----------------------------------------------------------------------------
  wait_n_o <= not wait_q;
  crg_o(5) <= crg5_q;
  crg_o(4) <= crg4_q;
  crg_o(3) <= crg3_q;
  crg_o(2) <= crg2_s;
  crg_o(1) <= crg1_s;
  rom_char_a_o( 2 downto 0) <= v_flip_s(2 downto 0);
  rom_char_a_o(10 downto 3) <= d_char_ram_q;
  rom_char_a_o(11)          <= d_col_ram_q(3);

end rtl;
