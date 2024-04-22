-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_sprite.vhd,v 1.12 2005/10/10 22:02:14 arnim Exp $
--
-- Sprite Video Module of Lady Bug Machine.
--
-- This unit contains the whole sprite logic which is distributed on the
-- CPU and video boards.
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
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity ladybug_sprite is
port (
	-- Clock and Reset Interface ----------------------------------------------
	clk_20mhz_i      : in  std_logic;
	por_n_i          : in  std_logic;
	res_n_i          : in  std_logic;
	clk_en_10mhz_i   : in  std_logic;
	clk_en_10mhz_n_i : in  std_logic;
	clk_en_5mhz_i    : in  std_logic;
	clk_en_5mhz_n_i  : in  std_logic;
	-- CPU Interface ----------------------------------------------------------
	cs7_n_i          : in  std_logic;
	a_i              : in  std_logic_vector( 9 downto 0);
	d_from_cpu_i     : in  std_logic_vector( 7 downto 0);
	-- RGB Video Interface ----------------------------------------------------
	h_i              : in  std_logic_vector( 3 downto 0);
	h_t_i            : in  std_logic_vector( 3 downto 0);
	hx_i             : in  std_logic;
	ha_d_i           : in  std_logic;
	v_i              : in  std_logic_vector( 3 downto 0);
	v_t_i            : in  std_logic_vector( 3 downto 0);
	vbl_n_i          : in  std_logic;
	vbl_d_n_i        : in  std_logic;
	vc_d_i           : in  std_logic;
	blank_flont_i    : in  std_logic;
	blank_i          : in  std_logic;
	sig_o            : out std_logic_vector( 4 downto 1);
	-- Sprite ROM Interface ---------------------------------------------------
	rom_sprite_a_o   : out std_logic_vector(11 downto 0);
	rom_sprite_d_i   : in  std_logic_vector(15 downto 0)
);

end ladybug_sprite;

architecture rtl of ladybug_sprite is

	signal sprite_ram_cs_n_s,
			 sprite_ram_we_n_s,
			 clk_5mhz_n_q,
			 clk_en_eck_s,
			 clk_en_rd_s,
			 clk_en_5ck_n_s,
			 clk_en_6ck_n_s,
			 clk_en_7ck_n_s,
			 clk_en_b7_p3_s,
			 clk_en_e7_3_s,
			 s6ck_n_s,
			 s7ck_n_s,
			 e5_p8_s,
			 a8_p5_n_s,
			 ct0_s,
			 ct1_s,
			 cr_mux_sel_s,
			 ck_inh_s,
			 ck_inh_n_q,
			 qh1_s,
			 qh2_s           : std_logic;

	signal rb_s,
			 rb_unflip_s,
			 rc_s            : std_logic_vector( 7 downto 0);

	signal c_s             : std_logic_vector(10 downto 0);
	signal v_cnt_s         : std_logic_vector( 4 downto 0);
	signal ra_s            : std_logic_vector( 9 downto 0);

	signal ma_s            : std_logic_vector(11 downto 0);
	signal ma_q            : std_logic_vector(11 downto 6);
	signal mb_q            : std_logic_vector( 1 downto 0);
	signal mc_q            : std_logic_vector( 6 downto 0);
	signal cl_q            : std_logic_vector( 4 downto 0);

	signal j7_s            : std_logic_vector( 2 downto 0);
	signal df_muxed_s      : std_logic_vector( 7 downto 0);

	signal lu_a_s          : std_logic_vector( 4 downto 0);
	signal lu_d_s          : std_logic_vector( 7 downto 0);
	signal lu_d_mux_s      : std_logic_vector( 3 downto 0);

	signal rd_shift_s,
			 rd_shift_int,
			 rd_vram_s       : std_logic_vector(15 downto 0);
	signal rs_s,
			 rs_int,
			 rs_n_s          : std_logic_vector( 3 downto 0);
	signal rs_enable_s     : std_logic;
	signal shift_oc_n_s    : std_logic;

	signal j6_shifter      : std_logic_vector( 3 downto 0);
	signal h6_shifter      : std_logic_vector( 3 downto 0);
	signal ctrl_lu_a_s     : std_logic_vector( 4 downto 0);
	signal ctrl_lu_d_s     : std_logic_vector( 7 downto 0);
	signal v_cnt_a5_a6_s   : std_logic_vector( 7 downto 0);

	signal ctrl_lu_q_d_s,
			 ctrl_lu_q       : std_logic_vector( 6 downto 1);

	signal vram_we_n_s     : std_logic;
	signal vram_a6_in_s,
			 vram_a6_out_s,
			 vram_b6_in_s,
			 vram_b6_out_s,
			 vram_c6_in_s,
			 vram_c6_out_s,
			 vram_d6_in_s,
			 vram_d6_out_s   : std_logic_vector( 3 downto 0);

	signal ca_q            : std_logic_vector( 3 downto 1);
	signal ca6_s,
			 ca7_s,
			 ca8_s           : std_logic;
	signal x_s             : std_logic_vector( 5 downto 0);

	signal cr_s            : std_logic_vector( 9 downto 0);

	signal vram_q          : std_logic_vector(15 downto 0);

begin

	-----------------------------------------------------------------------------
	-- The Vertical Counters C5 D5
	-----------------------------------------------------------------------------
	v_cnt_c5_c6_b : process(clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			v_cnt_s <= (others=>'0');
		elsif rising_edge(clk_20mhz_i) then
			if clk_en_b7_p3_s = '1' then
				if e5_p8_s = '0' then
					v_cnt_s <= (v_t_i & "0");
				else
					v_cnt_s <= v_cnt_s + 1;
				end if;
			end if;
		end if;
	end process;

	-----------------------------------------------------------------------------
	-- Counter J7
	-----------------------------------------------------------------------------
	j7_b : process(clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			j7_s <= (others=>'0');
		elsif rising_edge(clk_20mhz_i) then
			if clk_en_10mhz_i = '1' then
				if s6ck_n_s = '0' then
					j7_s <= not mc_q(6) & mc_q(6) & '0';
				elsif (ct0_s or ct1_s or a8_p5_n_s or ck_inh_s) = '0' then
					j7_s <= j7_s + 1;
				end if;
			end if;
		end if;
	end process;

	-----------------------------------------------------------------------------
	-- Sprite VRAM Counters A5 A6
	-----------------------------------------------------------------------------
	ct0_s  <= v_cnt_a5_a6_s(0);
	ct1_s  <= v_cnt_a5_a6_s(1);
	x_s    <= v_cnt_a5_a6_s(7 downto 2);

	v_cnt_a5_a6_b : process(clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			v_cnt_a5_a6_s <= (others=>'0');
		elsif rising_edge(clk_20mhz_i) then
			if clk_en_10mhz_i = '1' then
				if s7ck_n_s = '0' then
					v_cnt_a5_a6_s(7 downto 4) <= (rb_s(7 downto 4));
					v_cnt_a5_a6_s(3 downto 0) <= (rb_s(3 downto 2) & not rc_s(7) & not rc_s(6));
				elsif ck_inh_n_q = '1' then
					v_cnt_a5_a6_s <=v_cnt_a5_a6_s + 1;
				end if;
			end if;
		end if;
	end process;

	-----------------------------------------------------------------------------
	-- Process sprite_ram_ctrl
	--
	-- Purpose:
	--   Generates the control signals for the sprite RAM.
	--
	sprite_ram_ctrl: process ( cs7_n_i,
										vbl_n_i,
										a_i,
										c_s, v_cnt_s)
		variable cpu_access_v : std_logic;
	begin
		cpu_access_v      := not cs7_n_i and not vbl_n_i;

		sprite_ram_we_n_s <= not cpu_access_v;
		sprite_ram_cs_n_s <= cpu_access_v nor vbl_n_i;

		if vbl_n_i = '0' then
			ra_s <= a_i;
		else
			ra_s <= v_cnt_s(4 downto 0) & c_s(4 downto 0);
		end if;
	end process sprite_ram_ctrl;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- The Sprite RAM P5 N5
	-----------------------------------------------------------------------------
	sprite_ram_b : entity work.ladybug_sprite_ram
	port map (
		clk_i    => clk_20mhz_i,
		clk_en_i => clk_en_5mhz_i,
		a_i      => ra_s,
		cs_n_i   => sprite_ram_cs_n_s,
		we_n_i   => sprite_ram_we_n_s,
		d_i      => d_from_cpu_i,
		d_o      => rb_s
	);

	-----------------------------------------------------------------------------
	-- Process rc_add
	--
	-- Purpose:
	--   Implements IC N6 and E6 which add sprite RAM data and Cx signals to
	--   form RCx bus.
	--
	rc_add: process (rb_s, c_s, v_i)
		variable a_v, b_v,
		sum_v     : std_logic_vector(7 downto 0);
	begin
		-- prepare the inputs of the adder
		a_v(3 downto 0) := rb_s(3 downto 0);
		a_v(4)          := '1';
		a_v(5)          := '0';
		a_v(7 downto 6) := rb_s(1 downto 0);

		b_v(0)          := not c_s(6);
		b_v(1)          := not c_s(7);
		b_v(2)          := not c_s(8);
		b_v(3)          := not v_i(3);
		b_v(4)          := c_s(10);
		b_v(5)          := '0';
		b_v(7 downto 6) := "11";

		sum_v := a_v + b_v;

		rc_s  <= sum_v;

	end process rc_add;
	--
	-----------------------------------------------------------------------------


	-----------------------------------------------------------------------------
	-- Sprite Control Logic
	-----------------------------------------------------------------------------
	sprite_ctrl_b : entity work.ladybug_sprite_ctrl
	port map (
		clk_20mhz_i     => clk_20mhz_i,
		clk_en_5mhz_i   => clk_en_5mhz_i,
		clk_en_5mhz_n_i => clk_en_5mhz_n_i,
		por_n_i         => por_n_i,
		vbl_n_i         => vbl_n_i,
		vbl_d_n_i       => vbl_d_n_i,
		vc_i            => v_i(2),
		vc_d_i          => vc_d_i,
		ha_i            => h_i(0),
		ha_d_i          => ha_d_i,
		rb6_i           => rb_s(6),
		rb7_i           => rb_s(7),
		rc3_i           => rc_s(3),
		rc4_i           => rc_s(4),
		rc5_i           => rc_s(5),
		j7_b_i          => j7_s(1),
		j7_c_i          => j7_s(2),
		clk_en_eck_i    => clk_en_eck_s,
		c_o             => c_s,
		clk_en_5ck_n_o  => clk_en_5ck_n_s,
		clk_en_6ck_n_o  => clk_en_6ck_n_s,
		clk_en_7ck_n_o  => clk_en_7ck_n_s,
		s6ck_n_o        => s6ck_n_s,
		s7ck_n_o        => s7ck_n_s,
		clk_en_b7_p3_o  => clk_en_b7_p3_s,
		e5_p8_o         => e5_p8_s,
		clk_en_e7_3_o   => clk_en_e7_3_s,
		a8_p5_n_o       => a8_p5_n_s
	);

	-----------------------------------------------------------------------------
	-- Process misc_seq
	--
	-- Purpose:
	--   Implements several sequential elements.
	--
	misc_seq: process (clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			clk_5mhz_n_q <= '0';
			ma_q         <= (others => '0');
			mb_q         <= (others => '0');
			mc_q         <= (others => '0');
			cl_q         <= (others => '0');
			ck_inh_n_q   <= '1';

		elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
			-- Turn clk_5mhz_n into clock waveform ----------------------------------
			if clk_en_5mhz_n_i = '1' then
				clk_5mhz_n_q <= '1';
			elsif clk_en_5mhz_i = '1' then
				clk_5mhz_n_q <= '0';
			end if;

			-- 8-Bit Register M6 ----------------------------------------------------
			if clk_en_5ck_n_s = '1' then
				mb_q <= rb_s(1 downto 0);
				ma_q <= rb_s(7 downto 2);
			end if;

			-- 8-Bit Register P6 ----------------------------------------------------
			if clk_en_e7_3_s = '1' then
				-- these are inverted based on mc_q(4)
				mc_q(3 downto 0) <= rc_s(3 downto 0);
				 -- inverts sprites horizontally
				mc_q(4)          <= rb_s(4);
				 -- inverts sprites vertically
				mc_q(5)          <= rb_s(5);
				-- 
				mc_q(6)          <= rb_s(6);
			end if;

			-- 6-Bit Register B6 ----------------------------------------------------
			if clk_en_6ck_n_s = '1' then
				cl_q <= rb_s(4 downto 0);
			end if;

			-- Flip-Flop H8 ---------------------------------------------------------
			if clk_en_10mhz_n_i = '1' then
				ck_inh_n_q <= not ck_inh_s;
			end if;

		end if;
	end process misc_seq;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Process ma_vec
	--
	-- Purpose:
	--   Build the ma_s vector.
	--
	ma_vec: process ( ma_q,
							mb_q,
							mc_q,
							j7_s)
	begin
		ma_s(11 downto 6)   <= ma_q;

		if mc_q(6) = '0' then
			ma_s(5) <= mb_q(1);
			ma_s(4) <= mb_q(0);
		else
			ma_s(5) <= mc_q(3) xor mc_q(4);
			ma_s(4) <= mc_q(5) xor j7_s(2);
		end if;

		ma_s(3)    <= mc_q(2) xor mc_q(4);
		ma_s(2)    <= mc_q(1) xor mc_q(4);
		ma_s(1)    <= mc_q(0) xor mc_q(4);
		ma_s(0)    <= mc_q(5) xor j7_s(0);
	end process ma_vec;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Process df_mux
	--
	-- Purpose:
	--   Builds the multiplexed data from Sprite ROM.
	--   Two-stage multiplexer:
	--     1) ROM data to DFx: 16->8
	--     2) DF to input for shift register: 8->8
	--        This is actually a scrambler.
	--
	df_mux: process ( rom_sprite_d_i,
							cl_q,
							mc_q)
		variable df_v : std_logic_vector(7 downto 0);
	begin
		if cl_q(4) = '0' then
			-- ROM L7
			df_v := rom_sprite_d_i( 7 downto 0);
		else
			-- ROM M7
			df_v := rom_sprite_d_i(15 downto 8);
		end if;

		if mc_q(5) = '0' then
			df_muxed_s(0) <= df_v(1);
			df_muxed_s(1) <= df_v(3);
			df_muxed_s(2) <= df_v(5);
			df_muxed_s(3) <= df_v(7);
			--
			df_muxed_s(4) <= df_v(0);
			df_muxed_s(5) <= df_v(2);
			df_muxed_s(6) <= df_v(4);
			df_muxed_s(7) <= df_v(6);
		else
			df_muxed_s(0) <= df_v(7);
			df_muxed_s(1) <= df_v(5);
			df_muxed_s(2) <= df_v(3);
			df_muxed_s(3) <= df_v(1);
			--
			df_muxed_s(4) <= df_v(6);
			df_muxed_s(5) <= df_v(4);
			df_muxed_s(6) <= df_v(2);
			df_muxed_s(7) <= df_v(0);
		end if;

	end process df_mux;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- The Two 8-Bit Shift Registers H6 J6
	-----------------------------------------------------------------------------
	shifters_h6_j6 : process(clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			h6_shifter <= (others=>'0');
			j6_shifter <= (others=>'0');
		elsif rising_edge(clk_20mhz_i) then
			if (clk_en_10mhz_i and not ck_inh_s) = '1' then
				if (ct0_s or ct1_s or a8_p5_n_s) = '0' then
					h6_shifter <= df_muxed_s(3 downto 0);
					j6_shifter <= df_muxed_s(7 downto 4);
				else
					h6_shifter <= h6_shifter(2 downto 0) & "0";
					j6_shifter <= j6_shifter(2 downto 0) & "0";
				end if;
			end if;
		end if;
	end process;

	qh1_s <= h6_shifter(3);
	qh2_s <= j6_shifter(3);

	-----------------------------------------------------------------------------
	-- Sprite Look-up PROM F4
	-----------------------------------------------------------------------------
	lu_a_s(4 downto 2) <= cl_q(2 downto 0);
	lu_a_s(1)          <= qh2_s;
	lu_a_s(0)          <= qh1_s;

	prom_F4 : entity work.prom_10_1
	port map (
		CLK    => clk_20mhz_i,
		ADDR   => lu_a_s,
		DATA   => lu_d_s
	);

	lu_d_mux_s <= lu_d_s(3 downto 0) when cl_q(3) = '0' else lu_d_s(7 downto 4);

	-----------------------------------------------------------------------------
	-- Sprite Control Look-up PROM C4
	-----------------------------------------------------------------------------
	ctrl_lu_a_s(0) <= '1';
	ctrl_lu_a_s(1) <= hx_i;
	ctrl_lu_a_s(2) <= clk_5mhz_n_q;
	ctrl_lu_a_s(3) <= h_i(0);
	ctrl_lu_a_s(4) <= h_i(1);

	prom_C4 : entity work.prom_10_3
	port map (
		CLK    => clk_20mhz_i,
		ADDR   => ctrl_lu_a_s,
		DATA   => ctrl_lu_d_s
	);

	-----------------------------------------------------------------------------
	-- Process ctrl_lu_seq
	--
	-- Purpose:
	--   Registers output of Sprite Control Look-up PROM.
	--
	ctrl_lu_seq: process (clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			ctrl_lu_q <= (others => '0');
		elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
			ctrl_lu_q <= ctrl_lu_q_d_s;
		end if;
	end process ctrl_lu_seq;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Process ctrl_lu_comb
	--
	-- Purpose:
	--   Combinational logic for the sprite control registers.
	--
	ctrl_lu_comb: process ( clk_en_10mhz_i,
									ctrl_lu_d_s,
									ctrl_lu_q,
									ctrl_lu_q_d_s)
	begin
		-- default assignments
		ctrl_lu_q_d_s <= ctrl_lu_q;
		clk_en_eck_s  <= '0';
		clk_en_rd_s   <= '0';

		-- register control
		if clk_en_10mhz_i = '1' then
			ctrl_lu_q_d_s  <= ctrl_lu_d_s(5 downto 0);

			if ctrl_lu_q(1) = '0' and ctrl_lu_q_d_s(1) = '1' then
				-- detect rising edge on ctrl_lu_q(1)
				clk_en_eck_s <= '1';
			end if;

			if ctrl_lu_q(6) = '0' and ctrl_lu_q_d_s(6) = '1' then
				-- detect rising edge on ctrl_lu_q(6)
				clk_en_rd_s  <= '1';
			end if;
		end if;

	end process ctrl_lu_comb;
	--
	shift_oc_n_s <= ctrl_lu_q(1) nand res_n_i;
	ck_inh_s     <= ctrl_lu_q(2);
	cr_mux_sel_s <= ctrl_lu_q(3);
	vram_we_n_s  <= ctrl_lu_q(4);
	rs_enable_s  <= ctrl_lu_q(5);
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Process ca_seq
	--
	-- Purpose:
	--   Implements B5, the register that holds the CS flip-flops.
	--
	ca_seq: process (clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			ca_q   <= (others => '0');
		elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
			if clk_en_7ck_n_s = '1' then
				ca_q <= c_s(8 downto 6);
			end if;
		end if;
	end process ca_seq;
	--
	ca6_s <= ca_q(1);
	ca7_s <= ca_q(2);
	ca8_s <= ca_q(3);
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Process vram_mux
	--
	-- Purpose:
	--   Generates the VRAM address CRx.
	--   It implements chips D5, C5 and B5.
	--
	vram_mux: process (  h_i, h_t_i,
								v_i,
								x_s,
								ca6_s, ca7_s, ca8_s,
								cr_mux_sel_s)
	begin
		if cr_mux_sel_s = '0' then
			-- D5
			cr_s(0) <= h_i(2);
			cr_s(1) <= h_i(3);
			cr_s(2) <= h_t_i(0);
			cr_s(3) <= h_t_i(1);
			-- C5
			cr_s(4) <= h_t_i(2);
			cr_s(5) <= h_t_i(3);
			cr_s(6) <= v_i(0);
			cr_s(7) <= v_i(1);
			-- B5
			cr_s(8) <= v_i(2);
			cr_s(9) <= v_i(3);

		else
			-- D5
			cr_s(0) <= x_s(0);
			cr_s(1) <= x_s(1);
			cr_s(2) <= x_s(2);
			cr_s(3) <= x_s(3);
			-- C5
			cr_s(4) <= x_s(4);
			cr_s(5) <= x_s(5);
			cr_s(6) <= ca6_s;
			cr_s(7) <= ca7_s;
			-- B5
			cr_s(8) <= ca8_s;
			cr_s(9) <= not v_i(3);

		end if;
	end process vram_mux;
	--
	-----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- Shift Registers
  -----------------------------------------------------------------------------
	shifters_a7_a8_d7_d8_f8 : process(clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			rd_shift_int <= (others=>'1');
		elsif rising_edge(clk_20mhz_i) then
			if (clk_en_10mhz_i and not ck_inh_s) = '1' then
				rs_int       <= (qh1_s nor qh2_s) & rs_int(3 downto 1);
				rd_shift_int <=
					lu_d_mux_s(0) & rd_shift_int(15 downto 13) &
					lu_d_mux_s(1) & rd_shift_int(11 downto  9) &
					lu_d_mux_s(2) & rd_shift_int( 7 downto  5) &
					lu_d_mux_s(3) & rd_shift_int( 3 downto  1);
			end if;
		end if;
	end process;

	rd_shift_s <= rd_shift_int when shift_oc_n_s = '0' else (others=>'1');
	rs_s       <= rs_int       when shift_oc_n_s = '0' else (others=>'1');
--	rs_n_s(3) <= not rs_s(3) or not rs_enable_s;
--	rs_n_s(2) <= not rs_s(2) or not rs_enable_s;
--	rs_n_s(1) <= not rs_s(1) or not rs_enable_s;
--	rs_n_s(0) <= not rs_s(0) or not rs_enable_s;
	rs_n_s(3) <= rs_s(3) and rs_enable_s;
	rs_n_s(2) <= rs_s(2) and rs_enable_s;
	rs_n_s(1) <= rs_s(1) and rs_enable_s;
	rs_n_s(0) <= rs_s(0) and rs_enable_s;

	-----------------------------------------------------------------------------
	-- Sprite VRAM
	-----------------------------------------------------------------------------
	vram_a6_in_s(0) <= rd_shift_s( 0);
	vram_a6_in_s(1) <= rd_shift_s( 4);
	vram_a6_in_s(2) <= rd_shift_s( 8);
	vram_a6_in_s(3) <= rd_shift_s(12);
	vram_a6_b : entity work.ladybug_sprite_vram
	port map (
		clk_i    => clk_20mhz_i,
		clk_en_i => '1',
		a_i      => cr_s,
		cs_n_i   => rs_n_s(0),
		we_n_i   => vram_we_n_s,
		d_i      => vram_a6_in_s,
		d_o      => vram_a6_out_s
	);
	--
	vram_b6_in_s(0) <= rd_shift_s( 1);
	vram_b6_in_s(1) <= rd_shift_s( 5);
	vram_b6_in_s(2) <= rd_shift_s( 9);
	vram_b6_in_s(3) <= rd_shift_s(13);
	vram_b6_b : entity work.ladybug_sprite_vram
	port map (
		clk_i    => clk_20mhz_i,
		clk_en_i => '1',
		a_i      => cr_s,
		cs_n_i   => rs_n_s(1),
		we_n_i   => vram_we_n_s,
		d_i      => vram_b6_in_s,
		d_o      => vram_b6_out_s
	);
	--
	vram_c6_in_s(0) <= rd_shift_s( 2);
	vram_c6_in_s(1) <= rd_shift_s( 6);
	vram_c6_in_s(2) <= rd_shift_s(10);
	vram_c6_in_s(3) <= rd_shift_s(14);
	vram_c6_b : entity work.ladybug_sprite_vram
	port map (
		clk_i    => clk_20mhz_i,
		clk_en_i => '1',
		a_i      => cr_s,
		cs_n_i   => rs_n_s(2),
		we_n_i   => vram_we_n_s,
		d_i      => vram_c6_in_s,
		d_o      => vram_c6_out_s
	);
	--
	vram_d6_in_s(0) <= rd_shift_s( 3);
	vram_d6_in_s(1) <= rd_shift_s( 7);
	vram_d6_in_s(2) <= rd_shift_s(11);
	vram_d6_in_s(3) <= rd_shift_s(15);
	vram_d6_b : entity work.ladybug_sprite_vram
	port map (
		clk_i    => clk_20mhz_i,
		clk_en_i => '1',
		a_i      => cr_s,
		cs_n_i   => rs_n_s(3),
		we_n_i   => vram_we_n_s,
		d_i      => vram_d6_in_s,
		d_o      => vram_d6_out_s
	);
	-- Remap VRAM data outputs to the complete bus ------------------------------
	rd_vram_s(15) <= vram_d6_out_s(3) or rs_n_s(3);
	rd_vram_s(14) <= vram_c6_out_s(3) or rs_n_s(2);
	rd_vram_s(13) <= vram_b6_out_s(3) or rs_n_s(1);
	rd_vram_s(12) <= vram_a6_out_s(3) or rs_n_s(0);
	--
	rd_vram_s(11) <= vram_d6_out_s(2) or rs_n_s(3);
	rd_vram_s(10) <= vram_c6_out_s(2) or rs_n_s(2);
	rd_vram_s( 9) <= vram_b6_out_s(2) or rs_n_s(1);
	rd_vram_s( 8) <= vram_a6_out_s(2) or rs_n_s(0);
	--
	rd_vram_s( 7) <= vram_d6_out_s(1) or rs_n_s(3);
	rd_vram_s( 6) <= vram_c6_out_s(1) or rs_n_s(2);
	rd_vram_s( 5) <= vram_b6_out_s(1) or rs_n_s(1);
	rd_vram_s( 4) <= vram_a6_out_s(1) or rs_n_s(0);
	--
	rd_vram_s( 3) <= vram_d6_out_s(0) or rs_n_s(3);
	rd_vram_s( 2) <= vram_c6_out_s(0) or rs_n_s(2);
	rd_vram_s( 1) <= vram_b6_out_s(0) or rs_n_s(1);
	rd_vram_s( 0) <= vram_a6_out_s(0) or rs_n_s(0);
	-----------------------------------------------------------------------------


	-----------------------------------------------------------------------------
	-- Process rd_seq
	--
	-- Purpose:
	--   Implements the registers saving the RDx bus.
	--
	rd_seq: process (clk_20mhz_i, por_n_i)
	begin
		if por_n_i = '0' then
			vram_q <= (others => '0');
		elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
			if blank_flont_i = '0' then
				-- pseudo-asynchronous clear
				vram_q   <= (others => '0');

			elsif clk_en_rd_s = '1' then
				if shift_oc_n_s = '0' then
					-- take data from shift registers
					vram_q <= rd_shift_s;
				else
					-- take data from VRAM
					vram_q <= rd_vram_s;
				end if;
			end if;
		end if;
	end process rd_seq;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Process sig_mux
	--
	-- Purpose:
	--   Multiplexes the saved VRAM data to generate the four SIG outputs.
	--
	sig_mux: process (vram_q,
							h_i,
							blank_i)
		variable vec_v : std_logic_vector(1 downto 0);
	begin
		-- default assignment
		sig_o <= (others => '0');

		vec_v := (h_i(1) & h_i(0));

		if blank_i = '0' then
			case vec_v is
				when "00" =>
					sig_o(1) <= vram_q( 1);
					sig_o(2) <= vram_q( 5);
					sig_o(3) <= vram_q( 9);
					sig_o(4) <= vram_q(13);
				when "01" =>
					sig_o(1) <= vram_q( 2);
					sig_o(2) <= vram_q( 6);
					sig_o(3) <= vram_q(10);
					sig_o(4) <= vram_q(14);
				when "10" =>
					sig_o(1) <= vram_q( 3);
					sig_o(2) <= vram_q( 7);
					sig_o(3) <= vram_q(11);
					sig_o(4) <= vram_q(15);
				when "11" =>
					sig_o(1) <= vram_q( 0);
					sig_o(2) <= vram_q( 4);
					sig_o(3) <= vram_q( 8);
					sig_o(4) <= vram_q(12);
				when others =>
					null;
			end case;
		end if;
	end process sig_mux;
	--
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	-- Output Mapping
	-----------------------------------------------------------------------------
	rom_sprite_a_o <= ma_s;

end rtl;
