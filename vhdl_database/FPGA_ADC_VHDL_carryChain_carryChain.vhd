----------------------------------------------------------------------------------------------------
-- brief: This block implements a carry chain.
-- file: carryChain.vhd
-- author: Felix Haller, Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
-- This VHDL code is initially based on code written by h.a.r.homulle@tudelft.nl found on http://cas.tudelft.nl/fpga_tdc/TDC_basic.html	
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 1.0     | 19.10.2017 | F. Haller     	 | Auto-Created
-- 1.1     | --.--.---- | F. Haller     	 | XOR stage added
-- 1.2     | --.--.---- | F. Haller     	 | XOR stage removed from carry_chain and moved behind clock domain crossing buffer in <TDC_top>; added BEL attributes for FF stage to ensure proper routing
-- 1.3     | 12.05.2020 | L. Leuenberger   	 | Added abbility to sort the data before the second FF stage according to the typical STA
-- 1.4     | 12.05.2020 | L. Leuenberger   	 | Added MUX to be able to input three different signals
-- 1.5     | 12.05.2020 | L. Leuenberger   	 | Added also XOR outputs and updated simulation model
----------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Library declarations
------------------------------------------------------------------------------------------------
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;
-- This package provides functions for the calcualtion with real values.
use ieee.math_real.all;
-- Vivado Components library
library unisim;
-- This package contains the iobuf component.
use unisim.vcomponents.all;

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity carryChain is
	generic(
		g_NUM_OF_ELEMS   : integer := 960; -- number of elements in the delay chain (must be a multiple of 8 and blocksize of transition detektor because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_X_POS          : integer := 66; -- defines the X position of the carry chain on the FPGA
		g_Y_POS          : integer := 240; -- defines the starting Y position of the carry chain on the FPGA
		g_RTL_SIMULATION : boolean := false; -- Take a simple delay line in RTL simulation
		g_SORT_DELAY_STA : boolean := true -- Sorts the carry outputs according to the delay from the STA
	);

	port(
		clk              : in  std_logic; -- system clock
		carry_chain_in   : in  std_logic; -- input signal that propagates through carry chain (bitstream produced by output of comparator)
		carry_chain2_in  : in  std_logic; -- second input, is used for configuration purposes
		carry_chain3_in  : in  std_logic; -- third input, is used for configuration purposes
		carry_chain_out  : out std_logic_vector(g_NUM_OF_ELEMS - 1 downto 0); -- carry chain output raw
		carry_mux_sel_in : in  std_logic_vector(1 downto 0) -- '0' to select signal on CIN carry_chain_in, '01' to select signal on DI_in(0) carry_chain2_in, '10' to select signal on DI_in(0) carry_chain3_in
	);
end entity carryChain;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of carryChain is

	-- -------------------------------------------------------------------------
	--  CONSTANT DECLARATIONS
	-- -------------------------------------------------------------------------
	constant c_NUM_OF_ELEMS_PER_SLICE : integer := 16;
	constant c_NUM_OF_CARRY8S         : integer := g_NUM_OF_ELEMS / c_NUM_OF_ELEMS_PER_SLICE; -- number of CARRY8 blocks

	-- -------------------------------------------------------------------------
	--  SIGNAL DECLARATIONS
	-- -------------------------------------------------------------------------
	signal w_carryChainOut : std_logic_vector(2 * g_NUM_OF_ELEMS - 1 downto 0); -- outputs of the carry chain unregistered
	signal r_carryChainOut : std_logic_vector(2 * g_NUM_OF_ELEMS - 1 downto 0); -- outputs of the carry chain registered
	signal carryMuxSel     : std_logic;
	signal carryMuxIn      : std_logic;

	-- -------------------------------------------------------------------------
	--  ATTRIBUTES
	-- -------------------------------------------------------------------------
	-- to manually place the delayline in a particular spot (best for linearities and resolution), the LOC constraint is used
	attribute LOC            : string;
	attribute BEL            : string;
	attribute keep_hierarchy : string;
	attribute ASYNC_REG      : string;
	attribute keep_hierarchy of behavioral : architecture is "true";

begin
	-- -------------------------------------------------------------------------
	--  CARRY CHAIN INPUT MUX
	-- -------------------------------------------------------------------------
	carryMuxIn  <= carry_chain2_in when carry_mux_sel_in = "01"
	               else carry_chain3_in when carry_mux_sel_in = "10"
	               else '0';
	carryMuxSel <= '1' when carry_mux_sel_in = "01"
	               else '1' when carry_mux_sel_in = "10"
	               else '0';

	-- -------------------------------------------------------------------------
	--  CARRY CHAIN GENERATION/PLACEMENT
	-- -------------------------------------------------------------------------
	rtl_simulation : if g_RTL_SIMULATION = true generate -- @suppress "Redundant boolean equality check with true"
		carry_delay_line : for i in 0 to 2 * c_NUM_OF_CARRY8S - 1 generate
			first_carry8 : if i = 0 generate
				w_carryChainOut(0)                                                                <= transport carry_chain_in after 4 ps;
				place_all_rtl_delay_elements : for f in 1 to c_NUM_OF_ELEMS_PER_SLICE / 2 - 1 generate
					w_carryChainOut(f) <= transport w_carryChainOut(f - 1) after 4 ps;
				end generate place_all_rtl_delay_elements;
				w_carryChainOut(c_NUM_OF_ELEMS_PER_SLICE - 1 downto c_NUM_OF_ELEMS_PER_SLICE / 2) <= not w_carryChainOut(c_NUM_OF_ELEMS_PER_SLICE / 2 - 1 downto 0);
			end generate first_carry8;

			next_carry8 : if i > 0 generate
				w_carryChainOut(i * c_NUM_OF_ELEMS_PER_SLICE)                                                                              <= transport w_carryChainOut((i - 1) * c_NUM_OF_ELEMS_PER_SLICE + c_NUM_OF_ELEMS_PER_SLICE / 2 - 1) after 4 ps;
				place_all_rtl_delay_elements : for f in 1 to c_NUM_OF_ELEMS_PER_SLICE / 2 - 1 generate
					w_carryChainOut(i * c_NUM_OF_ELEMS_PER_SLICE + f) <= transport w_carryChainOut(i * c_NUM_OF_ELEMS_PER_SLICE + f - 1) after 4 ps;
				end generate place_all_rtl_delay_elements;
				w_carryChainOut((i + 1) * c_NUM_OF_ELEMS_PER_SLICE - 1 downto i * c_NUM_OF_ELEMS_PER_SLICE + c_NUM_OF_ELEMS_PER_SLICE / 2) <= not w_carryChainOut(i * c_NUM_OF_ELEMS_PER_SLICE + c_NUM_OF_ELEMS_PER_SLICE / 2 - 1 downto i * c_NUM_OF_ELEMS_PER_SLICE);
			end generate next_carry8;
		end generate carry_delay_line;
	else generate
		-- generates and places the carry chain, which starts at the specified X, Y coordinate (g_X_POS and g_Y_POS). 
		carry_delay_line : for i in 0 to 2 * c_NUM_OF_CARRY8S - 1 generate
			first_carry8 : if i = 0 generate
				attribute LOC of delayblock : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + i); -- define X and Y position of CARRY8 block on FPGA
			begin
				delayblock : CARRY8     -- first CARRY8 block
					generic map(
						CARRY_TYPE => "SINGLE_CY8" -- sets single 8-bit carry configuration (vs dual 4-bit)
					)
					port map(
						CO     => w_carryChainOut(7 downto 0), -- carry out of each stage (/element) of the carry chain
						O      => w_carryChainOut(15 downto 8), -- 8-bit output: Carry chain XOR data out 
						CI     => carry_chain_in, -- carry input for 8-bit carry (directly connected to output of comparator)
						CI_TOP => '0',  -- tie to ground if CARRY_TYPE=SINGLE_CY8 (upper carry input when CARRY_TYPE=DUAL_CY4)
						DI     => "0000000" & carryMuxIn, -- carry-MUX data input
						S      => "1111111" & not carryMuxSel); -- carry-MUX select line
					--					
			end generate first_carry8;

			next_carry8 : if i > 0 generate
				attribute LOC of delayblock : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + i); -- define X and Y position of carry8 block on FPGA

			begin
				delayblock : CARRY8     -- next CARRY8 block
					generic map(
						CARRY_TYPE => "SINGLE_CY8" -- sets single 8-bit carry configuration (vs dual 4-bit)
					)
					port map(
						CO     => w_carryChainOut(((c_NUM_OF_ELEMS_PER_SLICE * i) + 7) downto (c_NUM_OF_ELEMS_PER_SLICE * i)), -- carry out of each stage (/element) of the carry chain
						O      => w_carryChainOut(((c_NUM_OF_ELEMS_PER_SLICE * i) + 15) downto ((c_NUM_OF_ELEMS_PER_SLICE * i) + 8)), -- 8-bit output: Carry chain XOR data out
						CI     => w_carryChainOut((c_NUM_OF_ELEMS_PER_SLICE * (i - 1)) + 7), -- carry input for 8-bit carry (first CARRY8 element is connected with last element of previous CARRY8)
						CI_TOP => '0',  -- tie to ground if CARRY_TYPE=SINGLE_CY8 (upper carry input when CARRY_TYPE=DUAL_CY4)
						DI     => (others => '0'), -- carry-MUX data input
						S      => (others => '1')); -- carry-MUX select line
			end generate next_carry8;
		end generate carry_delay_line;
	end generate rtl_simulation;

	-- -------------------------------------------------------------------------
	--  OUTPUT BUFFER GENERATION/PLACEMENT
	-- -------------------------------------------------------------------------

	-- generates and places flip-flops (type FDRE) for capturing the carry chain every rising clock
	output_buffer : for j in 0 to c_NUM_OF_CARRY8S - 1 generate
		attribute LOC of CO1_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO1_FF : label is "AFF2"; -- possibly take out 2
		attribute LOC of CO2_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO2_FF : label is "AFF"; -- possibly take out 2
		attribute LOC of CO3_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO3_FF : label is "BFF2"; -- possibly take out 2
		attribute LOC of CO4_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO4_FF : label is "BFF"; -- possibly take out 2
		attribute LOC of CO5_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO5_FF : label is "CFF2"; -- possibly take out 2
		attribute LOC of CO6_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO6_FF : label is "CFF"; -- possibly take out 2
		attribute LOC of CO7_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO7_FF : label is "DFF2"; -- possibly take out 2
		attribute LOC of CO8_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO8_FF : label is "DFF"; -- possibly take out 2
		attribute LOC of CO9_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO9_FF : label is "EFF2"; -- possibly take out 2
		attribute LOC of CO10_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO10_FF : label is "EFF"; -- possibly take out 2
		attribute LOC of CO11_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO11_FF : label is "FFF2"; -- possibly take out 2
		attribute LOC of CO12_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO12_FF : label is "FFF"; -- possibly take out 2
		attribute LOC of CO13_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO13_FF : label is "GFF2"; -- possibly take out 2
		attribute LOC of CO14_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO14_FF : label is "GFF"; -- possibly take out 2
		attribute LOC of CO15_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO15_FF : label is "HFF2"; -- possibly take out 2
		attribute LOC of CO16_FF : label is "SLICE_X" & INTEGER'image(g_X_POS) & "Y" & INTEGER'image(g_Y_POS + j); -- define X and Y position of first flip-flop on FPGA
		attribute BEL of CO16_FF : label is "HFF"; -- possibly take out 2
		attribute ASYNC_REG of CO1_FF : label is "true";
		attribute ASYNC_REG of CO2_FF : label is "true";
		attribute ASYNC_REG of CO3_FF : label is "true";
		attribute ASYNC_REG of CO4_FF : label is "true";
		attribute ASYNC_REG of CO5_FF : label is "true";
		attribute ASYNC_REG of CO6_FF : label is "true";
		attribute ASYNC_REG of CO7_FF : label is "true";
		attribute ASYNC_REG of CO8_FF : label is "true";
		attribute ASYNC_REG of CO9_FF : label is "true";
		attribute ASYNC_REG of CO10_FF : label is "true";
		attribute ASYNC_REG of CO11_FF : label is "true";
		attribute ASYNC_REG of CO12_FF : label is "true";
		attribute ASYNC_REG of CO13_FF : label is "true";
		attribute ASYNC_REG of CO14_FF : label is "true";
		attribute ASYNC_REG of CO15_FF : label is "true";
		attribute ASYNC_REG of CO16_FF : label is "true";

	begin
		CO1_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO2_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 1), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 8), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO3_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 2), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 1), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO4_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 3), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 9), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO5_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 4), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 2), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO6_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 5), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 10), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO7_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 6), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 3), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO8_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 7), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 11), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset

		CO9_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 8), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 4), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO10_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 9), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 12), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO11_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 10), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 5), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO12_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 11), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 13), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO13_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 12), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 6), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO14_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 13), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 14), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO15_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 14), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 7), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
		CO16_FF : FDRE
			generic map(
				INIT          => '0',   -- Initial value of register, 1'b0, 1'b1
				IS_C_INVERTED => '0',
				IS_D_INVERTED => '0',
				IS_R_INVERTED => '0'
			)
			port map(
				Q  => r_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 15), -- 1-bit output: Data
				C  => clk,              -- 1-bit input: Clock
				CE => '1',              -- 1-bit input: Clock enable (always enabled)
				D  => w_carryChainOut(j * c_NUM_OF_ELEMS_PER_SLICE + 15), -- 1-bit input: Data
				R  => '0');             -- 1-bit input: Synchronous reset
	end generate output_buffer;


	-- -------------------------------------------------------------------------
	--  OUTPUT LOGIC
	-- -------------------------------------------------------------------------
	output_stage : if g_SORT_DELAY_STA = false generate
		buffer_ff : process(clk) is
		begin
			if rising_edge(clk) then
				for i in 0 to (g_NUM_OF_ELEMS - 1) loop
					if ((i mod 2) = 0) then
						carry_chain_out(i) <= r_carryChainOut(i); --add a second FF stage to avoid unstable signals in the subsequent logic
					else
						carry_chain_out(i) <= not r_carryChainOut(i); --add a second FF stage to avoid unstable signals in the subsequent logic
					end if;
				end loop;
			end if;
		end process buffer_ff;

	else generate

		-- Sort the outputs according to the STA
		buffer_ff : process(clk) is
		begin
			if rising_edge(clk) then
				-- Signals of first slice
				carry_chain_out(0)  <= r_carryChainOut(14);
				carry_chain_out(1)  <= r_carryChainOut(2);
				carry_chain_out(2)  <= r_carryChainOut(0);
				carry_chain_out(3)  <= not r_carryChainOut(1);
				carry_chain_out(4)  <= r_carryChainOut(4);
				carry_chain_out(5)  <= r_carryChainOut(6);
				carry_chain_out(6)  <= not r_carryChainOut(5);
				carry_chain_out(7)  <= not r_carryChainOut(3);
				carry_chain_out(8)  <= r_carryChainOut(10);
				carry_chain_out(10) <= not r_carryChainOut(7);
				carry_chain_out(11) <= not r_carryChainOut(9);
				carry_chain_out(13) <= r_carryChainOut(8);
				carry_chain_out(14) <= r_carryChainOut(12);
				carry_chain_out(15) <= not r_carryChainOut(13);
				carry_chain_out(21) <= not r_carryChainOut(11);
				carry_chain_out(22) <= not r_carryChainOut(15);

				-- Signals of middle slices
				for j in 1 to c_NUM_OF_CARRY8S - 2 loop
					carry_chain_out(j * 16 - 7)  <= r_carryChainOut(j * 16 + 14);
					carry_chain_out(j * 16 - 4)  <= r_carryChainOut(j * 16 + 2);
					carry_chain_out(j * 16 + 0)  <= r_carryChainOut(j * 16 + 0);
					carry_chain_out(j * 16 + 1)  <= not r_carryChainOut(j * 16 + 1);
					carry_chain_out(j * 16 + 2)  <= r_carryChainOut(j * 16 + 4);
					carry_chain_out(j * 16 + 3)  <= r_carryChainOut(j * 16 + 6);
					carry_chain_out(j * 16 + 4)  <= not r_carryChainOut(j * 16 + 5);
					carry_chain_out(j * 16 + 7)  <= not r_carryChainOut(j * 16 + 3);
					carry_chain_out(j * 16 + 8)  <= r_carryChainOut(j * 16 + 10);
					carry_chain_out(j * 16 + 10) <= not r_carryChainOut(j * 16 + 7);
					carry_chain_out(j * 16 + 11) <= not r_carryChainOut(j * 16 + 9);
					carry_chain_out(j * 16 + 13) <= r_carryChainOut(j * 16 + 8);
					carry_chain_out(j * 16 + 14) <= r_carryChainOut(j * 16 + 12);
					carry_chain_out(j * 16 + 15) <= not r_carryChainOut(j * 16 + 13);
					carry_chain_out(j * 16 + 21) <= not r_carryChainOut(j * 16 + 11);
					carry_chain_out(j * 16 + 22) <= not r_carryChainOut(j * 16 + 15);
				end loop;

				-- Signals of last slice
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 - 7)  <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 14);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 - 4)  <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 2);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 0)  <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 0);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 1)  <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 1);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 2)  <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 4);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 3)  <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 6);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 4)  <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 5);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 7)  <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 3);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 8)  <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 10);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 9)  <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 7);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 10) <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 9);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 11) <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 8);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 12) <= r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 12);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 13) <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 13);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 14) <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 11);
				carry_chain_out((c_NUM_OF_CARRY8S - 1) * 16 + 15) <= not r_carryChainOut((c_NUM_OF_CARRY8S - 1) * 16 + 15);
			end if;
		end process buffer_ff;
	end generate;

end architecture behavioral;
