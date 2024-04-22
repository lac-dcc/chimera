--
-- OPLL.vhd
--
-- Copyright (c) 2006 Mitsutaka Okazaki (brezza@pokipoki.org)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--

--
--  modified by t.hara
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.vm2413.all;

entity OPLL is
	port(
		clock_i		: in    std_logic;
		clock_en_i	: in    std_logic;
		reset_i		: in    std_logic;
		data_i		: in    std_logic_vector(7 downto 0);
		addr_i		: in    std_logic;
		cs_n_i      : in    std_logic;
		we_n_i		: in    std_logic;
		wait_n_o	: out   std_logic;
		melody_o	: out   signed(12 downto 0);
		rythm_o		: out   signed(12 downto 0)
	);
end entity;

architecture rtl of OPLL is

	signal opllptr  : std_logic_vector( 7 downto 0 );
	signal oplldat  : std_logic_vector( 7 downto 0 );
	signal opllwr   : std_logic;

	signal am       : std_logic;
	signal pm       : std_logic;
	signal wf       : std_logic;
	signal tl       : std_logic_vector(6 downto 0);
	signal fb       : std_logic_vector(2 downto 0);
	signal ar       : std_logic_vector(3 downto 0);
	signal dr       : std_logic_vector(3 downto 0);
	signal sl       : std_logic_vector(3 downto 0);
	signal rr       : std_logic_vector(3 downto 0);
	signal ml       : std_logic_vector(3 downto 0);
	signal fnum     : std_logic_vector(8 downto 0);
	signal blk      : std_logic_vector(2 downto 0);
	signal rks      : std_logic_vector(3 downto 0);
	signal key      : std_logic;

	signal rhythm   : std_logic;

	signal noise    : std_logic;
	signal pgout    : std_logic_vector( 17 downto 0 );  --  整数部 9bit, 小数部 9bit

	signal egout    : std_logic_vector( 12 downto 0 );

	signal opout    : std_logic_vector( 13 downto 0 );


	signal faddr    : integer range 0 to 9-1;
	signal maddr    : std_logic_vector( 4 downto 0 );
	signal fdata    : signed_li_type;
	signal mdata    : signed_li_type;

	signal state2   : std_logic_vector( 6 downto 0 );
	signal state5   : std_logic_vector( 6 downto 0 );
	signal state8   : std_logic_vector( 6 downto 0 );
	signal slot     : std_logic_vector( 4 downto 0 );
	signal slot2    : std_logic_vector( 4 downto 0 );
	signal slot5    : std_logic_vector( 4 downto 0 );
	signal slot8    : std_logic_vector( 4 downto 0 );
	signal stage    : std_logic_vector( 1 downto 0 );
	signal stage2   : std_logic_vector( 1 downto 0 );
	signal stage5   : std_logic_vector( 1 downto 0 );
	signal stage8   : std_logic_vector( 1 downto 0 );

begin

    --  CPUアクセス制御 ------------------------------------------------------
	process( clock_i, reset_i, clock_en_i )
	begin
		if reset_i ='1' then
			opllwr  <= '0';
			opllptr <= (others =>'0');
		elsif rising_edge(clock_i) and clock_en_i = '1' then
			if cs_n_i = '0' and we_n_i = '0' and addr_i = '0' then			-- write port 0
				opllptr <= data_i;
				opllwr  <= '0';
			elsif cs_n_i = '0' and we_n_i = '0' and addr_i = '1' then		-- write port 1
				oplldat <= data_i;
				opllwr  <= '1';
			end if;
		end if;

	end process;

    --  タイミングジェネレータ -----------------------------------------------
	s0: entity work.SlotCounter
	generic map(
		delay   => 0
	)
	port map(
		clk     => clock_i,
		reset   => reset_i,
		clkena  => clock_en_i,
		slot    => slot,
		stage   => stage
	);

	s2: entity work.SlotCounter
	generic map(
		delay   => 2
	)
	port map(
		clk     => clock_i,
		reset   => reset_i,
		clkena  => clock_en_i,
		slot    => slot2,
		stage   => stage2
	);

	s5: entity work.SlotCounter
	generic map(
		delay   => 5
	)
	port map(
		clk     => clock_i,
		reset   => reset_i,
		clkena  => clock_en_i,
		slot    => slot5,
		stage   => stage5
	);

	s8: entity work.SlotCounter
	generic map(
		delay   => 8
	)
	port map(
		clk     => clock_i,
		reset   => reset_i,
		clkena  => clock_en_i,
		slot    => slot8,
		stage   => stage8
	);

	-- no delay
	ct: entity work.Controller
	port map (
		clk			=> clock_i,
		reset		=> reset_i,
		clkena		=> clock_en_i,
		slot		=> slot,
		stage		=> stage,
		wr_i		=> opllwr,
		addr		=> opllptr,
		data		=> oplldat,
		wait_n_o	=> wait_n_o,
		-- output parameters for phasegenerator and envelopegenerator
		am			=> am,
		pm			=> pm,
		wf			=> wf,
		ml			=> ml,
		tl			=> tl,
		fb			=> fb,
		ar			=> ar,
		dr			=> dr,
		sl			=> sl,
		rr			=> rr,
		blk		=> blk,
		fnum		=> fnum,
		rks		=> rks,
		key		=> key,
		rhythm	=> rhythm
	);

	-- 2 stages delay
	eg: entity work.EnvelopeGenerator
	port map (
		clk		=> clock_i,
		reset		=> reset_i,
		clkena	=> clock_en_i,
		slot		=> slot2,
		stage		=> stage2,
		rhythm	=> rhythm,
		am			=> am,
		tl			=> tl,
		ar			=> ar,
		dr			=> dr,
		sl			=> sl,
		rr			=> rr,
		rks		=> rks,
		key		=> key,
		egout		=> egout
	);

	pg: entity work.PhaseGenerator
	port map (
		clk		=> clock_i,
		reset		=> reset_i,
		clkena	=> clock_en_i,
		slot		=> slot2,
		stage		=> stage2,
		rhythm	=> rhythm,
		pm			=> pm,
		ml			=> ml,
		blk		=> blk,
		fnum		=> fnum,
		key		=> key,
		noise		=> noise,
		pgout		=> pgout
	);

	-- 5 stages delay
	op: entity work.Operator
	port map (
		clk		=> clock_i,
		reset		=> reset_i,
		clkena	=> clock_en_i,
		slot		=> slot5,
		stage		=> stage5,
		rhythm	=> rhythm,
		WF			=> wf,
		FB			=> fb,
		noise		=> noise,
		pgout		=> pgout,
		egout		=> egout,
		faddr		=> faddr,
		fdata		=> fdata,
		opout		=> opout
	);

	-- 8 stages delay
	og: entity work.OutputGenerator
	port map (
		clk		=> clock_i,
		reset		=> reset_i,
		clkena	=> clock_en_i,
		slot		=> slot8,
		stage		=> stage8,
		rhythm	=> rhythm,
		opout		=> opout,
		faddr		=> faddr,
		fdata		=> fdata,
		maddr		=> maddr,
		mdata		=> mdata
	);

	-- by Fabio Belavenuto
	sm: entity work.SumMixer
	port map (
		clk		=> clock_i,
		reset		=> reset_i,
		clkena	=> clock_en_i,
		slot		=> slot,
		stage		=> stage,
		rhythm	=> rhythm,
		maddr		=> maddr,
		mdata		=> mdata,
		melody_o	=> melody_o,
		rhythm_o	=> rythm_o
	);

end architecture;
