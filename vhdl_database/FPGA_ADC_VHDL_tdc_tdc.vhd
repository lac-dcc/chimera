----------------------------------------------------------------------------------------------------
-- brief: Implements a multichannel TDC
-- file: tdc.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 23.04.2020 | L. Leuenberger     | Auto-Created
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
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity tdc is
	generic(
		g_NUM_OF_ELEMS              : integer                       := 960; -- number of elements in the delay chain (must be a multiple of 8 and blocksize of transition detektor because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_X_POS_CARRY               : integer                       := 66; -- defines the X position of the carry chain on the FPGA
		g_Y_POS_CARRY               : integer                       := 240; -- defines the starting Y position of the carry chain on the FPGA
		g_SORT_DELAY_STA            : boolean                       := true; -- Sorts the carry outputs according to the delay from the STA
		g_BLOCKSIZE_SUM             : integer range 16 to 64        := 16; -- No of carry elements which are summed together, must be 16, 32 or 64
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer                       := 10;
		g_NO_OF_SAMPLES_HIST        : integer                       := 14; -- 2** g_NO_OF_SAMPLES_HIST
		g_NO_OF_FRACTIONAL          : integer                       := 10;
		g_X_POS_DELAY               : integer                       := 1; -- defines the X position of the io delays on the FPGA
		g_Y_POS_DELAY               : integer                       := 232; -- defines the starting Y position of the delays on the FPGA
		g_DIVIDE_VALUE              : integer                       := 2;
		g_DUTY_VALUE                : integer                       := 50000; -- Multiplied by factor 1000 -> 50% Duty Cycle
		g_ADDR_REG1                 : std_logic_vector(6 downto 0)  := "0001000";
		g_ADDR_REG2                 : std_logic_vector(6 downto 0)  := "0001001";
		g_BITMASK_REG1              : std_logic_vector(15 downto 0) := "0001000000000000";
		g_BITMASK_REG2              : std_logic_vector(15 downto 0) := "1111110000000000";
		g_NO_OF_SAMPLES_ALIGN       : integer                       := 13;
		g_NUM_OF_TDC                : integer range 0 to 4          := 1 -- 2**g_NUM_OF_TDC 
	);
	port(
		-- Input signal from comparator
		comparator_in           : in  std_logic;
		-- Pulse
		pulse_in                : in  std_logic;
		pulse_out               : out std_logic;
		-- Measured transition out
		fallTransition_out      : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseTransition_out      : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Detected length of carry chain
		maxLengthCarryChain_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Configuration signals
		startLength_in          : in  std_logic;
		startAlign_in           : in  std_logic;
		startINL_in             : in  std_logic;
		runLength_out           : out std_logic;
		runAlign_out            : out std_logic;
		runINL_out              : out std_logic;
		-- DRP interface for length calibration
		locked_in               : in  std_logic;
		reset_clk_out           : out std_logic;
		drp_den                 : out std_logic; -- Enable (required)
		drp_daddr               : out std_logic_vector(6 downto 0); -- Address (required)
		drp_di                  : out std_logic_vector(15 downto 0); -- Data In (required)
		drp_do                  : in  std_logic_vector(15 downto 0); --  (required) -- Is not used in this design!
		drp_drdy                : in  std_logic; --  (required)
		drp_dwe                 : out std_logic; --  (required)
		-- Signals to set the delay to a specific value
		startSetValue_in        : in  std_logic;
		setValueDelayIn_in      : in  std_logic_vector(8 downto 0);
		setValueDelayOut_in     : in  std_logic_vector(8 downto 0);
		-- Detected delay values out
		delayInDelayTaps_out    : out std_logic_vector(8 downto 0);
		delayOutDelayTaps_out   : out std_logic_vector(8 downto 0);
		-- Reset
		resetDelay_in           : in  std_logic;
		-- Clocks
		clk_600MHz              : in  std_logic;
		clk_600MHz_Calibration  : in  std_logic;
		clk_571Mhz              : in  std_logic;
		clk_200MHz              : in  std_logic
	);
end entity tdc;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of tdc is
	------------------------------------------------------------------------------------------------
	-- Internal signals
	------------------------------------------------------------------------------------------------
	type transitionSingle is array (0 to 2**g_NUM_OF_TDC - 1) of std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS + g_NUM_OF_TDC - 1 downto 0);
	type transition is array (0 to g_NUM_OF_TDC) of transitionSingle;

	------------------------------------------------------------------------------------------------
	-- Internal signals
	------------------------------------------------------------------------------------------------
	signal fallTransition      : transition := (others => (others => (others => '0')));
	signal riseTransition      : transition := (others => (others => (others => '0')));
	signal maxLengthCarryChain : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal sumOnes             : transition := (others => (others => (others => '0')));

	signal runLength : std_logic;
	signal runINL    : std_logic;

	signal comparatorDelay : std_logic;

	signal delayInStart      : std_logic;
	signal delayInIncDec     : std_logic;
	signal delayInReady      : std_logic;
	signal delayInDelayTaps  : std_logic_vector(8 downto 0);
	signal delayOutStart     : std_logic;
	signal delayOutIncDec    : std_logic;
	signal delayOutReady     : std_logic;
	signal delayOutDelayTaps : std_logic_vector(8 downto 0);
	signal idelayCtrlRdy     : std_logic;

	signal fallTransitionReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal riseTransitionReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal sumOnesReg        : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	ATTRIBUTE X_INTERFACE_INFO      : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_INFO of drp_den : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DEN";
	ATTRIBUTE X_INTERFACE_INFO of drp_daddr : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DADDR";
	ATTRIBUTE X_INTERFACE_INFO of drp_di : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DI";
	ATTRIBUTE X_INTERFACE_INFO of drp_do : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DO";
	ATTRIBUTE X_INTERFACE_INFO of drp_drdy : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DRDY";
	ATTRIBUTE X_INTERFACE_INFO of drp_dwe : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DWE";
	ATTRIBUTE X_INTERFACE_INFO of reset_clk_out : SIGNAL is "xilinx.com:signal:reset:1.0 reset_clk_out RST";
	ATTRIBUTE X_INTERFACE_PARAMETER of reset_clk_out : SIGNAL is "POLARITY ACTIVE_HIGH";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_600MHz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_600MHz CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_600MHz_Calibration : SIGNAL is "xilinx.com:signal:clock:1.0 clk_600MHz_Calibration CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_571Mhz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_571Mhz CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_200MHz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_200MHz CLK";
begin

	------------------------------------------------------------------------------------------------
	-- outputs
	------------------------------------------------------------------------------------------------
	runINL_out              <= runINL;
	runLength_out           <= runLength;
	maxLengthCarryChain_out <= maxLengthCarryChain;

	------------------------------------------------------------------------------------------------
	-- Calculate the output transitions
	------------------------------------------------------------------------------------------------
	proc_outputTrans : process(clk_600MHz)
	begin
		if (rising_edge(clk_600MHz)) then
			-- Sum all results up
			for i in 1 to g_NUM_OF_TDC loop
				for f in 0 to (2**(g_NUM_OF_TDC - i) - 1) loop
					fallTransition(i)(f) <= std_logic_vector(unsigned(fallTransition(i - 1)(2 * f)) + unsigned(fallTransition(i - 1)(2 * f + 1)));
					riseTransition(i)(f) <= std_logic_vector(unsigned(riseTransition(i - 1)(2 * f)) + unsigned(riseTransition(i - 1)(2 * f + 1)));
					sumOnes(i)(f)        <= std_logic_vector(unsigned(sumOnes(i - 1)(2 * f)) + unsigned(sumOnes(i - 1)(2 * f + 1)));
				end loop;
			end loop;

			-- Register
			fallTransitionReg <= fallTransition(g_NUM_OF_TDC)(0)(g_NUM_OF_BITS_FOR_MAX_ELEMS + g_NUM_OF_TDC - 1 downto g_NUM_OF_TDC);
			riseTransitionReg <= riseTransition(g_NUM_OF_TDC)(0)(g_NUM_OF_BITS_FOR_MAX_ELEMS + g_NUM_OF_TDC - 1 downto g_NUM_OF_TDC);
			sumOnesReg        <= sumOnes(g_NUM_OF_TDC)(0)(g_NUM_OF_BITS_FOR_MAX_ELEMS + g_NUM_OF_TDC - 1 downto g_NUM_OF_TDC);
		end if;
	end process;

	------------------------------------------------------------------------------------------------
	-- Instantiate the INL correction
	------------------------------------------------------------------------------------------------
	inst_inlCorrection : entity work.inlCorrection
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => g_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => startINL_in,
			calculationRunning_out => runINL,
			maxLengthCarryChain_in => maxLengthCarryChain,
			fallTransition_in      => fallTransitionReg,
			riseTransition_in      => riseTransitionReg,
			fallTransition_out     => fallTransition_out,
			riseTransition_out     => riseTransition_out,
			clk                    => clk_600MHz,
			clkSlow                => clk_200MHz
		);

	------------------------------------------------------------------------------------------------
	-- Instantitate the length calibration
	------------------------------------------------------------------------------------------------
	inst_calLength : entity work.calibrationTDCLength
		generic map(
			g_NUMBER_OF_STEPS_CLOCK_SHIFT => 8,
			g_DIVIDE_VALUE                => g_DIVIDE_VALUE,
			g_DUTY_VALUE                  => g_DUTY_VALUE,
			g_ADDR_REG1                   => g_ADDR_REG1,
			g_ADDR_REG2                   => g_ADDR_REG2,
			g_BITMASK_REG1                => g_BITMASK_REG1,
			g_BITMASK_REG2                => g_BITMASK_REG2,
			g_NUM_OF_ELEMS                => g_NUM_OF_ELEMS,
			g_NUM_OF_BITS_FOR_MAX_ELEMS   => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SUM_MEAN              => 13
		)
		port map(
			start_in                 => startLength_in,
			locked_in                => locked_in,
			reset_clk_out            => reset_clk_out,
			drp_den                  => drp_den,
			drp_daddr                => drp_daddr,
			drp_di                   => drp_di,
			drp_do                   => drp_do,
			drp_drdy                 => drp_drdy,
			drp_dwe                  => drp_dwe,
			sumOnes_in               => sumOnesReg,
			maxLengthCarryChain_out  => maxLengthCarryChain,
			configurationRunning_out => runLength,
			clk                      => clk_200MHz
		);

	------------------------------------------------------------------------------------------------
	-- Instantitate the alignment calibration block
	------------------------------------------------------------------------------------------------
	inst_calAlign : entity work.calibrationTDCAlign
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_MEAN        => g_NO_OF_SAMPLES_ALIGN
		)
		port map(
			startConfig_in           => startAlign_in,
			startSetValue_in         => startSetValue_in,
			setValueDelayIn_in       => setValueDelayIn_in,
			setValueDelayOut_in      => setValueDelayOut_in,
			fallTransition_in        => fallTransitionReg,
			riseTransition_in        => riseTransitionReg,
			delayInStart_out         => delayInStart,
			delayInIncDec_out        => delayInIncDec,
			delayInReady_in          => delayInReady,
			delayInDelayTaps_in      => delayInDelayTaps,
			delayOutStart_out        => delayOutStart,
			delayOutIncDec_out       => delayOutIncDec,
			delayOutReady_in         => delayOutReady,
			delayOutDelayTaps_in     => delayOutDelayTaps,
			delayInDelayTaps_out     => delayInDelayTaps_out,
			delayOutDelayTaps_out    => delayOutDelayTaps_out,
			maxLengthCarryChain_in   => maxLengthCarryChain,
			configurationRunning_out => runAlign_out,
			clk                      => clk_600MHz,
			clkSlow                  => clk_200MHz
		);

	------------------------------------------------------------------------------------------------
	-- Instantitate the delays for the alignment
	------------------------------------------------------------------------------------------------
	inst_inDelay : entity work.carryDelay
		generic map(
			g_DELAY    => 500,
			g_CLK_FREQ => 200,
			g_LOC      => "BITSLICE_RX_TX_X" & INTEGER'image(g_X_POS_DELAY) & "Y" & INTEGER'image(g_Y_POS_DELAY)
		)
		port map(
			data_out          => comparatorDelay,
			data_in           => comparator_in,
			start_in          => delayInStart,
			incDec_in         => delayInIncDec,
			ready_out         => delayInReady,
			idelayCtrlRdy_out => idelayCtrlRdy,
			delayTaps_out     => delayInDelayTaps,
			clk               => clk_200MHz,
			reset             => resetDelay_in
		);

	inst_outDelay : entity work.pulseDelay
		generic map(
			g_DELAY    => 500,
			g_CLK_FREQ => 200,
			g_LOC      => "BITSLICE_RX_TX_X" & INTEGER'image(g_X_POS_DELAY) & "Y" & INTEGER'image(g_Y_POS_DELAY)
		)
		port map(
			data_out         => pulse_out,
			data_in          => pulse_in,
			start_in         => delayOutStart,
			incDec_in        => delayOutIncDec,
			ready_out        => delayOutReady,
			idelayCtrlRdy_in => idelayCtrlRdy,
			delayTaps_out    => delayOutDelayTaps,
			clk              => clk_200MHz
		);

	------------------------------------------------------------------------------------------------
	-- Instantitate all TDCs
	------------------------------------------------------------------------------------------------
	gen_TDC : for i in 0 to 2**g_NUM_OF_TDC - 1 generate
		gen_FirstTDC : if (i = 0) generate
			inst_TDC : entity work.tdcSingle
				generic map(
					g_NUM_OF_ELEMS              => g_NUM_OF_ELEMS,
					g_X_POS_CARRY               => g_X_POS_CARRY,
					g_Y_POS_CARRY               => g_Y_POS_CARRY,
					g_SORT_DELAY_STA            => g_SORT_DELAY_STA,
					g_BLOCKSIZE_SUM             => g_BLOCKSIZE_SUM,
					g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS
				)
				port map(
					comparator_in          => comparatorDelay,
					fallTransition_out     => fallTransition(0)(i)(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0),
					riseTransition_out     => riseTransition(0)(i)(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0),
					sumOnes_out            => sumOnes(0)(i)(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0),
					runLength_in           => runLength,
					runINL_in              => runINL,
					clk_600MHz             => clk_600MHz,
					clk_600MHz_Calibration => clk_600MHz_Calibration,
					clk_571Mhz             => clk_571Mhz
				);
		end generate;

		gen_NextTDC : if (i > 0) generate
			inst_TDC : entity work.tdcSingle
				generic map(
					g_NUM_OF_ELEMS              => g_NUM_OF_ELEMS,
					g_X_POS_CARRY               => g_X_POS_CARRY + i,
					g_Y_POS_CARRY               => g_Y_POS_CARRY,
					g_SORT_DELAY_STA            => g_SORT_DELAY_STA,
					g_BLOCKSIZE_SUM             => g_BLOCKSIZE_SUM,
					g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS
				)
				port map(
					comparator_in          => comparatorDelay,
					fallTransition_out     => fallTransition(0)(i)(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0),
					riseTransition_out     => riseTransition(0)(i)(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0),
					sumOnes_out            => sumOnes(0)(i)(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0),
					runLength_in           => runLength,
					runINL_in              => runINL,
					clk_600MHz             => clk_600MHz,
					clk_600MHz_Calibration => clk_600MHz_Calibration,
					clk_571Mhz             => clk_571Mhz
				);
		end generate;
	end generate;

end architecture behavioral;
