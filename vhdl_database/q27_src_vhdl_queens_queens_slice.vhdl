-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-------------------------------------------------------------------------------
-- This file is part of the Queens@TUD solver suite
-- for enumerating and counting the solutions of an N-Queens Puzzle.
--
-- Copyright (C) 2008-2015
--      Thomas B. Preusser <thomas.preusser@utexas.edu>
--      Benedikt Reuter    <breutr@gmail.com>
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

entity queens_slice is
  generic (
    N : positive;                       -- size of field
    L : natural                         -- number of preplaced outer rings
  );
  port (
    -- Global Clock
    clk : in std_logic;
    rst : in std_logic;

    -- Inputs (strobed)
    start : in std_logic;  -- Strobe for Start
    BH_l  : in std_logic_vector(0 to N-2*L-1);  -- Blocking for leftmost Column
    BU_l  : in std_logic_vector(0 to 2*N-4*L-2);
    BD_l  : in std_logic_vector(0 to 2*N-4*L-2);
    BV_l  : in std_logic_vector(0 to N-2*L-1);

    -- Output Strobes
    sol  : out std_logic;
    done : out std_logic
  );
end queens_slice;


library IEEE;
use IEEE.numeric_std.all;

architecture rtl of queens_slice is

  ---------------------------------------------------------------------------
  -- Matrix to iterate through
  --   These types are plain ugly but the multidiemsional tMatrix(<>, <>)
  --   is not slicable. Thus, these types are still better than lots of
  --   generate loops working through the columns.
  subtype tColumn is std_logic_vector(L to N-L-1);
  type tField is array(L to N-L-1) of tColumn;

  -- Placed Queen Matrix
  signal QN : tField := (others => (others => '-'));

  component arbit_forward
    generic (
      N : positive                            -- Length of Token Chain
    );
    port (
      tin  : in  std_logic;                   -- Fed Token
      have : in  std_logic_vector(0 to N-1);  -- Token Owner
      pass : in  std_logic_vector(0 to N-1);  -- Token Passers
      grnt : out std_logic_vector(0 to N-1);  -- Token Output
      tout : out std_logic                    -- Unused Token
    );
  end component;

  -- Blocking Signals
  signal BH : std_logic_vector(L to N-L-1) := (others => '-');  -- Window: L to N-L-1
  signal BV : std_logic_vector(L to N-L-1) := (others => '-');  -- Window: L
																																-- put rotates left

  signal BU : std_logic_vector(2*L to 2*N-2*L-2) := (others => '-'); -- Window: N-1 to 2*N-2*L-2
                                                                     -- put rotates right
  signal BD : std_logic_vector(2*L to 2*N-2*L-2) := (others => '-'); -- Window: 2*L to N-1
                                                                     -- put rotates left
  signal s    : std_logic_vector(L to N-L-1);
  signal put  : std_logic;

begin

  assert false
    report LF&
      "Queens@TUD Solver Slice [N="&integer'image(N)&", L="&integer'image(L)&']' &LF&
      "Copyright (C) 2015-2016 Thomas B. Preusser <thomas.preusser@utexas.edu> " &LF&
      "                        Benedikt Reuter    <breutr@gmail.com>" &LF&
      "This design is free software, and you are welcome to redistribute it " &LF&
      "under the conditions of the GPL version 3. " &LF&
      "It comes with ABSOLUTELY NO WARRANTY. " &LF&
      "For details see the notice in the file COPYING."&LF
    severity note;

	----------------------------------------------------------------------------
	-- Queen Matrix
	process(clk)
	begin
		if rising_edge(clk) then
			if put = '1' then
				QN(L to N-L-2) <= QN(L+1 to N-L-1);
			else
				QN(L to N-L-2) <= tColumn'(tColumn'range => '-') & QN(L to N-L-3);
			end if;
		end if;
	end process;

	----------------------------------------------------------------------------
	-- Blocking Signals
	process(clk)
		variable b : std_logic_vector(2*L to 2*N-2*L-2);
	begin
		if rising_edge(clk) then
			-- Initialization
			if start = '1' then
				BH <= BH_l;
				BV <= BV_l;
				BU <= BU_l;
				BD <= BD_l;
			else

				-- In Progress
				if put = '1' then
					-- Add placed Queen
					BH <= BH or s;
					BV <= BV(BV'left+1 to BV'right) & BV(BV'left);

					b := BU(BU'left to N-2) & (BU(N-1 to BU'right) or s);
					BU <= b(b'right) & b(b'left to b'right-1);

					b := (BD(BD'left to N-1) or s) & BD(N to BD'right);
					BD <= b(b'left+1 to b'right) & b(b'left);
				else
					-- Clear Queen
					BH <= BH and not QN(N-L-2);
					BV <= BV(BV'right) & BV(BV'left to BV'right-1);

					b := BU(BU'left+1 to BU'right) & BU(BU'left);
					BU <= b(b'left to N-2) & (b(N-1 to b'right) and not QN(N-L-2));

					b := BD(BD'right) & BD(BD'left to BD'right-1);
					BD <= (b(b'left to N-1) and not QN(N-L-2)) & b(N to b'right);
				end if;

			end if;
		end if;
	end process;

	----------------------------------------------------------------------------
	-- Placement Calculation
	blkPlace : block
		-- State
		signal CS  : std_logic_vector(L to N-L-1) := (others => '0');  -- Column Front Selector
		signal Ins : std_logic                    := '-';  -- Direction
		signal H   : std_logic_vector(L to N-L-1) := (others => '-');  -- Last Placement in active Col

		-- Combined Blocking
		signal pass : std_logic_vector(L to N-L-1);
		signal tout : std_logic;

	begin
		-- Combine Blocking Signals
		pass <= BH or BD(2*L to N-1) or BU(N-1 to 2*N-2*L-2) when BV(L) = '0' else (others => '1');

		col : arbit_forward
			generic map (
				N => N-2*L
      )
			port map (
				tin  => Ins,
				have => H,
				pass => pass,
				grnt => s,
				tout => tout
      );
		QN(N-L-1) <= s;

		-- Column Front Selector, a shift-based counter with:
		process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					CS <= (others => '0');
				elsif start = '1' then
					CS          <= (others => '0');
					CS(CS'left) <= '1';
				else
					if put = '1' then
						CS <= '0' & CS(CS'left to CS'right-1);
					else
						CS <= CS(CS'left+1 to CS'right) & '0';
					end if;
				end if;
			end if;
		end process;

		-- Direction Control
		process(clk)
		begin
			if rising_edge(clk) then
				if start = '1' then
					H   <= (others => '0');
					Ins <= not BV_l(BV_l'left);
				elsif put = '1' then
					H   <= (others => '0');
					Ins <= not BV(L+1);
				else
					H   <= QN(N-L-2);
					Ins <= BV(BV'right);
				end if;
			end if;
		end process;

		-- Control
		put <= (not tout) and not CS(CS'right);

		-- Outputs
		process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' or start = '1' then
					sol  <= '0';
					done <= '0';
				else
					sol  <= (not tout) and CS(CS'right);
					done <= tout and CS(CS'left);
				end if;
			end if;
		end process;

	end block blkPlace;

end rtl;
