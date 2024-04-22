-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
--
-- =============================================================================
-- Authors:					Patrick Lehmann
--
-- Module:					Synchronizes a flag signal across clock-domain boundaries
--
-- Description:
-- ------------------------------------
--		This module synchronizes multiple flag bits from clock-domain 'Clock1' to
--		clock-domain 'Clock'. The clock-domain boundary crossing is done by two
--		synchronizer D-FFs. All bits are independent from each other. If a known
--		vendor like Altera or Xilinx are recognized, a vendor specific
--		implementation is chosen.
--
--		ATTENTION:
--			Use this synchronizer only for long time stable signals (flags).
--
--		CONSTRAINTS:
--			General:
--				Please add constraints for meta stability to all '_meta' signals and
--				timing ignore constraints to all '_async' signals.
--
--			Xilinx:
--				In case of a Xilinx device, this module will instantiate the optimized
--				module PoC.xil.SyncBits. Please attend to the notes of xil_SyncBits.vhdl.
--
--			Altera sdc file:
--				TODO
--
-- License:
-- =============================================================================
-- Copyright 2007-2015 Technische Universitaet Dresden - Germany
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
-- =============================================================================

library	IEEE;
use			IEEE.STD_LOGIC_1164.all;

library	PoC;
use			PoC.config.all;
use			PoC.utils.all;
use			PoC.sync.all;


entity sync_Bits is
  generic (
	  BITS								: POSITIVE						:= 1;									-- number of bit to be synchronized
		INIT								: STD_LOGIC_VECTOR		:= x"00000000"				-- initialitation bits
	);
  port (
		Clock								: in	STD_LOGIC;														-- <Clock>	output clock domain
		Input								: in	STD_LOGIC_VECTOR(BITS - 1 downto 0);	-- @async:	input bits
		Output							: out STD_LOGIC_VECTOR(BITS - 1 downto 0)		-- @Clock:	output bits
	);
end entity;


architecture rtl of sync_Bits is
	constant INIT_I		: STD_LOGIC_VECTOR		:= resize(descend(INIT), BITS);

begin
	genGeneric : if ((VENDOR /= VENDOR_ALTERA) and (VENDOR /= VENDOR_XILINX)) generate
		attribute ASYNC_REG							: STRING;
		attribute SHREG_EXTRACT					: STRING;

	begin
		gen : for i in 0 to BITS - 1 generate
			signal Data_async							: STD_LOGIC;
			signal Data_meta							: STD_LOGIC		:= INIT_I(i);
			signal Data_sync							: STD_LOGIC		:= INIT_I(i);

			-- Mark register DataSync_async's input as asynchronous and ignore timings (TIG)
			attribute ASYNC_REG			of Data_meta	: signal is "TRUE";

			-- Prevent XST from translating two FFs into SRL plus FF
			attribute SHREG_EXTRACT of Data_meta	: signal is "NO";
			attribute SHREG_EXTRACT of Data_sync	: signal is "NO";

		begin
			Data_async			<= Input(i);

			process(Clock)
			begin
				if rising_edge(Clock) then
					Data_meta		<= Data_async;
					Data_sync		<= Data_meta;
				end if;
			end process;

			Output(i)	<= Data_sync;
		end generate;
	end generate;

	-- use dedicated and optimized 2 D-FF synchronizer for Altera FPGAs
	genAltera : if (VENDOR = VENDOR_ALTERA) generate
		sync : sync_Bits_Altera
			generic map (
				BITS			=> BITS,
				INIT			=> INIT_I
			)
			port map (
				Clock			=> Clock,
				Input			=> Input,
				Output		=> Output
			);
	end generate;

	-- use dedicated and optimized 2 D-FF synchronizer for Xilinx FPGAs
	genXilinx : if (VENDOR = VENDOR_XILINX) generate
		sync : sync_Bits_Xilinx
			generic map (
				BITS			=> BITS,
				INIT			=> INIT_I
			)
			port map (
				Clock			=> Clock,
				Input			=> Input,
				Output		=> Output
			);
	end generate;

end architecture;
