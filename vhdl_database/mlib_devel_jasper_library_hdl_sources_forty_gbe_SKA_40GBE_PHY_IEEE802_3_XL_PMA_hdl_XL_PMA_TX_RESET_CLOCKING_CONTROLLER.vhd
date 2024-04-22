----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 05.11.2014 11:10:19
-- Design Name: 
-- Module Name: XL_PMA_TX_RESET_CLOCKING_CONTROLLER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity XL_PMA_TX_RESET_CLOCKING_CONTROLLER is
	Port(
		GTREFCLK_I          : in  std_logic;

		REFCLK_I            : in  std_logic;
		REFCLK_RST_I        : in  std_logic;

		XL_TX_CLK_156M25_O  : out std_logic;
		XL_TX_CLK_161M133_O : out std_logic;
		XL_TX_CLK_322M266_O : out std_logic;
		XL_TX_CLK_625M_O    : out std_logic;
		XL_TX_CLK_RST_O     : out std_logic;
		XL_TX_CLK_LOCKED_O  : out std_logic
	);
end XL_PMA_TX_RESET_CLOCKING_CONTROLLER;

architecture Behavioral of XL_PMA_TX_RESET_CLOCKING_CONTROLLER is
	signal ref_clk_BUFMR : std_logic;

	-- Output clock A buffering / unused connectors
	signal clkAfbout : std_logic;
	signal clkAfbin  : std_logic;
	signal clkAout0  : std_logic;
	signal clkAout1  : std_logic;

	signal ref_clkA_locked : std_logic;

begin

    txoutclk_bufg_gt: BUFG_GT
      port map(
        CE => '1',
        CEMASK => '0',
        CLR => '0',
        CLRMASK => '0',
        DIV => "000",
        I => REFCLK_I,
        O => XL_TX_CLK_322M266_O -- 322.266 MHz
      );
      
    txoutclk2_bufg_gt: BUFG_GT
      port map(
        CE => '1',
        CEMASK => '0',
        CLR => '0',
        CLRMASK => '0',
        DIV => "001",
        I => REFCLK_I,
        O => XL_TX_CLK_161M133_O -- 322.266 MHz
      );
   
	
--    XL_TX_CLK_161M133_O <= ref_clk_BUFMR;
     
--	XL_TX_CLK_161M133_bufr : BUFR
--		generic map(
--			BUFR_DIVIDE => "2",         -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
--			SIM_DEVICE  => "7SERIES"    -- Must be set to "7SERIES" 
--		)
--		port map(
--			O   => XL_TX_CLK_161M133_O, -- 1-bit output: Clock output port
--			CE  => '1',                 -- 1-bit input: Active high, clock enable (Divided modes only)
--			CLR => '0',                 -- 1-bit input: Active high, asynchronous clear (Divided modes only)
--			I   => ref_clk_BUFMR        -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
--		);

--	PLLE2_BASE_inst : PLLE3_BASE
--		generic map(
--			CLKFBOUT_MULT      => 16,    -- Multiply value for all CLKOUT, (2-64)
--			CLKFBOUT_PHASE     => 0.0,  -- Phase offset in degrees of CLKFB, (-360.000-360.000).
--			CLKIN_PERIOD       => 6.400, -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
--			-- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
--			CLKOUT0_DIVIDE     => 3,
--			CLKOUT1_DIVIDE     => 11,
--			-- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
--			CLKOUT0_DUTY_CYCLE => 0.5,
--			CLKOUT1_DUTY_CYCLE => 0.5,
--			-- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
--			CLKOUT0_PHASE      => -90.0,
--			CLKOUT1_PHASE      => 0.0,
--			DIVCLK_DIVIDE      => 3,     -- Master division value, (1-56)
--			REF_JITTER         => 0.010, -- Reference input jitter in UI, (0.000-0.999).
--			STARTUP_WAIT       => "FALSE" -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
--		)
--		port map(
--			-- Clock Outputs: 1-bit (each) output: User configurable clock outputs
--			CLKOUT0  => clkAout0,       -- 1-bit output: CLKOUT0
--			CLKOUT1  => clkAout1,       -- 1-bit output: CLKOUT1
--			CLKOUTPHYEN => '0',
--			-- Feedback Clocks: 1-bit (each) output: Clock feedback ports
--			CLKFBOUT => clkAfbout,      -- 1-bit output: Feedback clock
--			LOCKED   => ref_clkA_locked, -- 1-bit output: LOCK
--			CLKIN    => GTREFCLK_I,     -- 1-bit input: Input clock
--			-- Control Ports: 1-bit (each) input: PLL control ports
--			PWRDWN   => '0',            -- 1-bit input: Power-down
--			RST      => REFCLK_RST_I,   -- 1-bit input: Reset
--			-- Feedback Clocks: 1-bit (each) input: Clock feedback ports
--			CLKFBIN  => clkAfbin        -- 1-bit input: Feedback clock
--		);
	PLLE2_BASE_inst : MMCME2_BASE
		generic map(
			BANDWIDTH          => "OPTIMIZED", -- Jitter programming (OPTIMIZED, HIGH, LOW)
			CLKFBOUT_MULT_F    => 8.0,    -- Multiply value for all CLKOUT, (2-64)
			CLKFBOUT_PHASE     => 0.0,  -- Gives all output clocks a negative 90 degree offset)
			CLKIN1_PERIOD      => 6.400, -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
			-- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
			CLKOUT0_DIVIDE_F   => 2.0,
			CLKOUT1_DIVIDE     => 8,
			-- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
			CLKOUT0_DUTY_CYCLE => 0.5,
			CLKOUT1_DUTY_CYCLE => 0.5,
			-- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
			CLKOUT0_PHASE      => -90.0,  -- overall -90 phase shift
			CLKOUT1_PHASE      => 0.0, --90.0 -- overall 0 phase shift
			DIVCLK_DIVIDE      => 1,    -- Master division value, (1-56)
			REF_JITTER1        => 0.010, -- Reference input jitter in UI, (0.000-0.999).
			STARTUP_WAIT       => FALSE -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
		)
		port map(
			-- Clock Outputs: 1-bit (each) output: User configurable clock outputs
			CLKOUT0  => clkAout0,       -- 1-bit output: CLKOUT0
			CLKOUT0B  => open,          -- 1-bit output: Inverted CLKOUT0
			CLKOUT1  => clkAout1,       -- 1-bit output: CLKOUT1
			CLKOUT1B  => open,          -- 1-bit output: Inverted CLKOUT1
			CLKOUT2   => open,          -- 1-bit output: CLKOUT2
			CLKOUT2B  => open,          -- 1-bit output: Inverted CLKOUT2
			CLKOUT3   => open,          -- 1-bit output: CLKOUT3
			CLKOUT3B  => open,          -- 1-bit output: Inverted CLKOUT3
			CLKOUT4   => open,          -- 1-bit output: CLKOUT4
			CLKOUT5   => open,          -- 1-bit output: CLKOUT5
			CLKOUT6   => open,          -- 1-bit output: CLKOUT6
			-- Feedback Clocks: 1-bit (each) output: Clock feedback ports
			CLKFBOUTB => open,          -- 1-bit output: Inverted CLKFBOUT
			CLKFBOUT => clkAfbout,      -- 1-bit output: Feedback clock
			LOCKED   => ref_clkA_locked, -- 1-bit output: LOCK
			CLKIN1   => GTREFCLK_I,     -- 1-bit input: Input clock
			-- Control Ports: 1-bit (each) input: PLL control ports
			PWRDWN   => '0',            -- 1-bit input: Power-down
			RST      => REFCLK_RST_I,   -- 1-bit input: Reset
			-- Feedback Clocks: 1-bit (each) input: Clock feedback ports
			CLKFBIN  => clkAfbin        -- 1-bit input: Feedback clock
		);


	-- Output buffering
	-------------------------------------

	--	clkAf_buf : BUFH
	--		port map(
	--			O => clkAfbin,
	--			I => clkAfbout
	--		);

	clkAfbin <= clkAfbout;

	XL_TX_CLK_625M_bufh : BUFH
		port map(
			O => XL_TX_CLK_625M_O,
			I => clkAout0
		);

	XL_TX_CLK_156M25_bufh : BUFH
		port map(
			O => XL_TX_CLK_156M25_O,
			I => clkAout1
		);

	XL_TX_CLK_RST_O    <= not ref_clkA_locked;
	XL_TX_CLK_LOCKED_O <= ref_clkA_locked;

end Behavioral;
