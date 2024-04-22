-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
--
-- ============================================================================
-- Authors:				 	Martin Zabel
--									Patrick Lehmann
--
-- Package:				 	VHDL package for component declarations, types and functions
--									associated to the PoC.mem.ocram namespace
--
-- Description:
-- ------------------------------------
--		On-Chip RAMs and ROMs for FPGAs.
--
--		A detailed documentation is included in each module.
--
-- License:
-- ============================================================================
-- Copyright 2008-2015 Technische Universitaet Dresden - Germany
--										 Chair for VLSI-Design, Diagnostics and Architecture
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--		http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================

library	IEEE;
use			IEEE.std_logic_1164.all;
use			IEEE.numeric_std.all;

package ocram is
	-- Simple-Dual-Port
  component ocram_sdp
    generic (
      A_BITS		: positive;
      D_BITS		: positive
		);
    port (
      rclk : in  std_logic;
      rce  : in  std_logic;
      wclk : in  std_logic;
      wce  : in  std_logic;
      we   : in  std_logic;
      ra   : in  unsigned(A_BITS-1 downto 0);
      wa   : in  unsigned(A_BITS-1 downto 0);
      d    : in  std_logic_vector(D_BITS-1 downto 0);
      q    : out std_logic_vector(D_BITS-1 downto 0)
    );
  end component;
end package;
