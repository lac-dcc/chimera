----------------------------------------------------------------------------------------------------
-- brief: This file implements a slope ADC which uses the output impedance in the ouput buffers to 
--        create a reference slope which is then compared to the signal-to-be-measured. A TDC 
--        measures the time from the beginning of the slope until the slope crosses the voltage-to-
--        be-measured. Different linearization and correction techniques are also deployed.
-- file: adc.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 12.05.2020 | L. Leuenberger     | Created
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
entity adc is
	generic(
		g_NUM_OF_ELEMS              : integer                       := 1024; -- number of elements in the delay chain (must be a multiple of 8 and blocksize of transition detektor because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_X_POS_CARRY               : integer                       := 66; -- defines the X position of the carry chain on the FPGA
		g_Y_POS_CARRY               : integer                       := 240; -- defines the starting Y position of the carry chain on the FPGA
		g_SORT_DELAY_STA            : boolean                       := true; -- Sorts the carry outputs according to the delay from the STA
		g_BLOCKSIZE_SUM             : integer range 16 to 64        := 16; -- No of carry elements which are summed together, must be 16, 32 or 64
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer                       := 11; -- ceil(log2(g_NUM_OF_ELEMS))
		g_NO_OF_SAMPLES_HIST        : integer                       := 14; -- 2** g_NO_OF_SAMPLES_HIST
		g_NO_OF_FRACTIONAL          : integer                       := 10; -- Number of factionals which shall be used in bin by bin correction block
		g_X_POS_DELAY               : integer                       := 1; -- defines the X position of the io delays on the FPGA
		g_Y_POS_DELAY               : integer                       := 232; -- defines the starting Y position of the delays on the FPGA
		g_DIVIDE_VALUE              : integer                       := 2; -- Division value of attached MMCM
		g_DUTY_VALUE                : integer                       := 50000; -- Duty value of attached MMCM, Multiplied by factor 1000 -> 50% Duty Cycle
		g_ADDR_REG1                 : std_logic_vector(6 downto 0)  := "0001000"; -- First address reg in the MMCM which corresponds to the clock attached at clk_600MHz_Calibration (Default value is set for clock output 1)
		g_ADDR_REG2                 : std_logic_vector(6 downto 0)  := "0001001"; -- Second address reg in the MMCM which corresponds to the clock attached at clk_600MHz_Calibration (Default value is set for clock output 1)
		g_BITMASK_REG1              : std_logic_vector(15 downto 0) := "0001000000000000"; -- Bitmask for first address reg (Default value is set for clock output 1)
		g_BITMASK_REG2              : std_logic_vector(15 downto 0) := "1111110000000000"; -- Bitmask for second address reg (Default value is set for clock output 1)
		g_NO_OF_SAMPLES_ALIGN       : integer                       := 13; -- No of samples which shall be used to align the comparator to the middle of the delay chain
		g_NUM_OF_TDC                : integer range 0 to 4          := 2 -- 2**g_NUM_OF_TDC 
	);
	port(	
		comparator_in           : in  std_logic;  -- Input signal from comparator (comp_out from block diffInputPad)
		pulse_out               : out std_logic; -- Pulse, needs to be connected to pulse_in from block diffInputPad
		calibrationValue_out    : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS * 2 - 1 downto 0);  -- Position of falling and rising edge, can be used to calcualte voltage characteristic
		ADCOutput_600MHz_out    : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- ADC output for 600 MSample/s
		ADCOutput1_1200MHz_out  : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- ADC output for 1.2 GSample/s
		ADCOutput2_1200MHz_out  : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- ADC output for 1.2 GSample/s
		maxLengthCarryChain_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Detected length of carry chain
		startLength_in          : in  std_logic; -- Start calibration of carry chain length
		startAlign_in           : in  std_logic; -- Start calibration of alignment
		startINL_in             : in  std_logic; -- Start calculation of LUT for bin-by-bin correction
		runLength_out           : out std_logic; -- Is set if carry chain length calibration is running
		runAlign_out            : out std_logic; -- Is set if alignment calibration is running
		runINL_out              : out std_logic; -- Is set if calculation of LUT for bin-by-bin correction is running
		locked_in               : in  std_logic; -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		reset_clk_out           : out std_logic; -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		drp_den                 : out std_logic; -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		drp_daddr               : out std_logic_vector(6 downto 0); -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		drp_di                  : out std_logic_vector(15 downto 0); -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		drp_do                  : in  std_logic_vector(15 downto 0); -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		drp_drdy                : in  std_logic; -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		drp_dwe                 : out std_logic; -- DRP interface which is used to calibrate the length of the delay chain (connect to MMCM)
		startSetValue_in        : in  std_logic; -- Used to set the input and output delay to a specific value which is provided by setValueDelayIn_in and setValueDelayOut_in
		setValueDelayIn_in      : in  std_logic_vector(8 downto 0); -- Used to set the input and output delay to a specific value which is provided by setValueDelayIn_in and setValueDelayOut_in
		setValueDelayOut_in     : in  std_logic_vector(8 downto 0); -- Used to set the input and output delay to a specific value which is provided by setValueDelayIn_in and setValueDelayOut_in
		delayInDelayTaps_out    : out std_logic_vector(8 downto 0); -- Current delay value of input delay
		delayOutDelayTaps_out   : out std_logic_vector(8 downto 0); -- Current delay value of output delay
		lutFallWrEn_in          : in  std_logic; -- Ports to set the data in the LUT for voltage charactetistic, Write Enable
		lutFallData_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);  -- Ports to set the data in the LUT for voltage charactetistic, Data, Attention one bit more -- MSb signalizes if this is valid data
		lutFallAddr_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Ports to set the data in the LUT for voltage charactetistic, Address
		lutRiseWrEn_in          : in  std_logic; -- Ports to set the data in the LUT for voltage charactetistic, Write Enable
		lutRiseData_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Ports to set the data in the LUT for voltage charactetistic, Data, Attention one bit more -- MSb signalizes if this is valid data
		lutRiseAddr_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Ports to set the data in the LUT for voltage charactetistic, Address
		resetDelay_in           : in  std_logic; -- Reset
		clk_600MHz              : in  std_logic; -- 600 MHz Clock
		clk_600MHz_Calibration  : in  std_logic; -- 600 MHz Clock which is used to calibrate the length of the delay chain
		clk_571Mhz              : in  std_logic; -- 571 MHz Clock which is used to calculate the LUT in the bin-by-bin correction block
		clk_200MHz              : in  std_logic -- 200 MHz Clock
	);
end entity adc;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of adc is

	--------------------------------------------------------------------------------------------
	-- Signals
	--------------------------------------------------------------------------------------------
	signal fallTransition : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal riseTransition : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

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
	ATTRIBUTE X_INTERFACE_INFO of resetDelay_in : SIGNAL is "xilinx.com:signal:reset:1.0 resetDelay_in RST";
	ATTRIBUTE X_INTERFACE_PARAMETER of resetDelay_in : SIGNAL is "POLARITY ACTIVE_HIGH";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_600MHz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_600MHz CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_600MHz_Calibration : SIGNAL is "xilinx.com:signal:clock:1.0 clk_600MHz_Calibration CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_571Mhz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_571Mhz CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_200MHz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_200MHz CLK";
begin
	------------------------------------------------------------------------------------------------
	-- Output signal
	------------------------------------------------------------------------------------------------
	calibrationValue_out <= riseTransition & fallTransition;

	------------------------------------------------------------------------------------------------
	-- Instantiate the Correction block
	------------------------------------------------------------------------------------------------
	inst_lutTransition : entity work.lutTransition
		generic map(
			g_NUM_OF_ELEMS              => g_NUM_OF_ELEMS,
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS
		)
		port map(
			fallTransition_in           => fallTransition,
			riseTransition_in           => riseTransition,
			correctedTransitionMean_out => ADCOutput_600MHz_out,
			correctedTransition1_out    => ADCOutput1_1200MHz_out,
			correctedTransition2_out    => ADCOutput2_1200MHz_out,
			fallWrEn_in                 => lutFallWrEn_in,
			fallData_in                 => lutFallData_in,
			fallAddr_in                 => lutFallAddr_in,
			riseWrEn_in                 => lutRiseWrEn_in,
			riseData_in                 => lutRiseData_in,
			riseAddr_in                 => lutRiseAddr_in,
			clk                         => clk_600MHz,
			clkSlow                     => clk_200MHz
		);

	------------------------------------------------------------------------------------------------
	-- Instantiate the TDC
	------------------------------------------------------------------------------------------------
	inst_TDC : entity work.tdc
		generic map(
			g_NUM_OF_ELEMS              => g_NUM_OF_ELEMS,
			g_X_POS_CARRY               => g_X_POS_CARRY,
			g_Y_POS_CARRY               => g_Y_POS_CARRY,
			g_SORT_DELAY_STA            => g_SORT_DELAY_STA,
			g_BLOCKSIZE_SUM             => g_BLOCKSIZE_SUM,
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => g_NO_OF_FRACTIONAL,
			g_X_POS_DELAY               => g_X_POS_DELAY,
			g_Y_POS_DELAY               => g_Y_POS_DELAY,
			g_DIVIDE_VALUE              => g_DIVIDE_VALUE,
			g_DUTY_VALUE                => g_DUTY_VALUE,
			g_ADDR_REG1                 => g_ADDR_REG1,
			g_ADDR_REG2                 => g_ADDR_REG2,
			g_BITMASK_REG1              => g_BITMASK_REG1,
			g_BITMASK_REG2              => g_BITMASK_REG2,
			g_NO_OF_SAMPLES_ALIGN       => g_NO_OF_SAMPLES_ALIGN,
			g_NUM_OF_TDC                => g_NUM_OF_TDC
		)
		port map(
			comparator_in           => comparator_in,
			pulse_in                => clk_600MHz,
			pulse_out               => pulse_out,
			fallTransition_out      => fallTransition,
			riseTransition_out      => riseTransition,
			maxLengthCarryChain_out => maxLengthCarryChain_out,
			startLength_in          => startLength_in,
			startAlign_in           => startAlign_in,
			startINL_in             => startINL_in,
			runLength_out           => runLength_out,
			runAlign_out            => runAlign_out,
			runINL_out              => runINL_out,
			locked_in               => locked_in,
			reset_clk_out           => reset_clk_out,
			drp_den                 => drp_den,
			drp_daddr               => drp_daddr,
			drp_di                  => drp_di,
			drp_do                  => drp_do,
			drp_drdy                => drp_drdy,
			drp_dwe                 => drp_dwe,
			startSetValue_in        => startSetValue_in,
			setValueDelayIn_in      => setValueDelayIn_in,
			setValueDelayOut_in     => setValueDelayOut_in,
			delayInDelayTaps_out    => delayInDelayTaps_out,
			delayOutDelayTaps_out   => delayOutDelayTaps_out,
			resetDelay_in           => resetDelay_in,
			clk_600MHz              => clk_600MHz,
			clk_600MHz_Calibration  => clk_600MHz_Calibration,
			clk_571Mhz              => clk_571Mhz,
			clk_200MHz              => clk_200MHz
		);

end architecture behavioral;
