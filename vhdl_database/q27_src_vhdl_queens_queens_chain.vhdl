-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-------------------------------------------------------------------------------
-- This file is part of the Queens@TUD solver suite
-- for enumerating and counting the solutions of an N-Queens Puzzle.
--
-- Copyright (C) 2008-2015
--      Thomas B. Preusser <thomas.preusser@utexas.edu>
-------------------------------------------------------------------------------
-- This design is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with this design.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity queens_chain is
  generic (
    -- Problem Size
    N : positive;
    L : positive;

    -- Design Spec
    SOLVERS      : positive;
    COUNT_CYCLES : boolean
  );
  port (
    -- Global Control
    clk : in  std_logic;
    rst : in  std_logic;

    -- Problem Chain
		piful : out std_logic;
		pidat : in  std_logic_vector(7 downto 0);
		pieof : in  std_logic;
		piput : in  std_logic;

		poful : in  std_logic := '1';  			-- Open-end as default
		podat : out std_logic_vector(7 downto 0);
		poeof : out std_logic;
		poput : out std_logic;

    -- Solution Chain
    sivld : in  std_logic                    := '0';
    sidat : in  std_logic_vector(7 downto 0) := (others => '-');
    sieof : in  std_logic                    := '-';
    sigot : out std_logic;

		sovld : out std_logic;
		sodat : out std_logic_vector(7 downto 0);
		soeof : out std_logic;
		sogot : in  std_logic
  );
end queens_chain;


library IEEE;
use IEEE.numeric_std.all;

library PoC;
use PoC.utils.all;
use PoC.fifo.all;

architecture rtl of queens_chain is

  -- Bit Length of Pre-Placement
  constant PRE_BITS  : positive := 4*L*log2ceil(N)-1;
  constant PRE_BYTES : positive := (PRE_BITS+7)/8;

	-- Inter-Stage Input Distribution
	signal pful : std_logic_vector(0 to SOLVERS);
	signal pdat : byte_vector(0 to SOLVERS);
	signal peof : std_logic_vector(0 to SOLVERS);
	signal pput : std_logic_vector(0 to SOLVERS);

	-- Inter-Stage Result Stream
	signal svld : std_logic_vector(0 to SOLVERS);
	signal sdat : byte_vector(0 to SOLVERS);
	signal seof : std_logic_vector(0 to SOLVERS);
	signal sgot : std_logic_vector(0 to SOLVERS);

begin

  -- Connect Subproblem Chain
  piful <= pful(0);
  pdat(0) <= pidat;
  peof(0) <= pieof;
  pput(0) <= piput;

  pful(SOLVERS) <= poful;
  podat <= pdat(SOLVERS);
  poeof <= peof(SOLVERS);
  poput <= pput(SOLVERS);

	-- Connect Result Chain
	svld(0) <= sivld;
	sdat(0) <= sidat;
	seof(0) <= sieof;
	sigot <= sgot(0);

	sovld <= svld(SOLVERS);
	sodat <= sdat(SOLVERS);
	soeof <= seof(SOLVERS);
	sgot(SOLVERS) <= sogot;

	-- Linear Solver Chain
	--  Input  @index i
	--  Output @index i+1
	genSolvers: for i in 0 to SOLVERS-1 generate

		-- Widened Tap for this Stage
		signal tful : std_logic;
		signal tput : std_logic;
		signal tdat : std_logic_vector(8*PRE_BYTES-1 downto 0);

		-- Decoded Pre-Placement
		signal bh, bv : std_logic_vector(L to N-L-1);
		signal bu, bd : std_logic_vector(0 to 2*N-4*L-2);

		-- Solver Strobes
		signal sol, done : std_logic;

		-- Computation State
		signal Act : std_logic := '0';
		signal Vld : std_logic := '0';

		-- Result Buffer
		constant BUF_LEN : positive := ite(COUNT_CYCLES, 48, 0) + 8*PRE_BYTES + 52;

		signal Buf : unsigned(BUF_LEN-1 downto 0)                 := (others => '-');
		signal Cnt : unsigned(log2ceil((BUF_LEN+7)/8-1) downto 0) := (others => '-');

		alias Cycles : unsigned(47 downto 0) is Buf(BUF_LEN-1 downto BUF_LEN-48);
		alias Pre    : unsigned(8*PRE_BYTES-1 downto 0) is Buf(8*PRE_BYTES+51 downto 52);
		alias Sols13 : unsigned( 3 downto 0) is Buf(51 downto 48);
		alias Sols15 : unsigned( 3 downto 0) is Buf(47 downto 44);
		alias Sols   : unsigned(43 downto 0) is Buf(43 downto  0);

		-- Streamed Stage Result
		signal rvld : std_logic;
		signal rdat : byte;
		signal reof : std_logic;
		signal rgot : std_logic;

	begin

		-- Input Tap
		tap: entity work.msg_tap
			generic map (
				D => PRE_BYTES
      )
			port map (
				clk  => clk,
				rst  => rst,
				iful => pful(i),
				idat => pdat(i),
				ieof => peof(i),
				iput => pput(i),
				oful => pful(i+1),
				odat => pdat(i+1),
				oeof => peof(i+1),
				oput => pput(i+1),
				tful => tful,
				tdat => tdat,
				tput => tput
      );

		-- Pre-Placement Expansion
		expander: entity work.expand_blocking
			generic map (
				N => N,
				L => L
			)
			port map (
				pre => tdat(PRE_BITS-1 downto 0),
				bh  => bh,
				bv  => bv,
				bu  => bu,
				bd  => bd
      );

		-- Solver Slice
		slice: entity work.queens_slice
			generic map (
				N => N,
				L => L
      )
			port map (
				clk   => clk,
				rst   => rst,
				start => tput,
				BH_l  => bh,
				BU_l  => bu,
				BD_l  => bd,
				BV_l  => bv,
				sol   => sol,
				done  => done
      );

		-- Computation Control
		process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					Act <= '0';
					Vld <= '0';
					Cnt <= (others => '-');
					Buf <= (others => '-');
				else

					if tput = '1' then
						-- Start
						Act <= '1';
						Buf <= (others => '-');
						if COUNT_CYCLES then
							Cycles <= (others => '0');
						end if;
						Pre    <= unsigned(tdat);
						Sols   <= (others => '0');
						Sols13 <= (others => '0');
						Sols15 <= (others => '0');
					else

						-- Counting Cycles
						if COUNT_CYCLES and Act = '1' and Vld = '0' then
							Cycles <= Cycles + 1;
						end if;

						-- Counting Solutions
						if sol = '1' then
							Sols   <= Sols + 1;
							Sols13 <= Sols13 - ("11" & (1 downto 0 => (not(Sols13(3) and Sols13(2)))));
							Sols15 <= Sols15 - ("111" & (not(Sols15(3) and Sols15(2) and Sols15(1))));
						end if;

						-- Result Output
						if done = '1' then
							Vld <= '1';
							Cnt <= to_unsigned((BUF_LEN+7)/8-2, Cnt'length);
						end if;

						if rgot = '1' then
							Buf <= Buf(Buf'left-8 downto 0) & (1 to 8 => '-');
							Cnt <= Cnt - 1;
							if Cnt(Cnt'left) = '1' then
								Act <= '0';
								Vld <= '0';
							end if;
						end if;

					end if;
				end if;
			end if;
		end process;
		tful <= Act;

		rvld <= Vld;
		rdat <= byte(Buf(Buf'left downto Buf'left-7));
		reof <= Cnt(Cnt'left);

		-- Connect Result Stream
		blkFunnel: block

			-- Funnel-to-FIFO Interface
			signal f2f_ful : std_logic;
			signal f2f_dat : std_logic_vector(8 downto 0);
			signal f2f_put : std_logic;

		begin

			-- Merge local Output with Result Stream
			funnel: entity work.msg_funnel
				generic map (
					N => 2
        )
				port map (
					clk  => clk,
					rst  => rst,

					ivld(0) => rvld,
					ivld(1) => svld(i),
					idat(0) => rdat,
					idat(1) => sdat(i),
					ieof(0) => reof,
					ieof(1) => seof(i),
					igot(0) => rgot,
					igot(1) => sgot(i),

					oful => f2f_ful,
					odat => f2f_dat(7 downto 0),
					oeof => f2f_dat(8),
					oput => f2f_put
        );

			-- Stage Output through FIFO
			glue : fifo_glue
				generic map (
					D_BITS => 9
				)
				port map (
					clk => clk,
					rst => rst,

					ful => f2f_ful,
					di  => f2f_dat,
					put => f2f_put,

					vld            => svld(i+1),
					do(7 downto 0) => sdat(i+1),
					do(8)          => seof(i+1),
					got            => sgot(i+1)
				);

		end block blkFunnel;

	end generate genSolvers;

end rtl;
