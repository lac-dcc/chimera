----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 05.11.2014 11:10:19
-- Design Name: 
-- Module Name: XL_PMA_RX_RESET_CLOCKING_CONTROLLER - Behavioral
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

entity XL_PMA_RX_RESET_CLOCKING_CONTROLLER is
	Port(
		REFCLK_I            : in  std_logic;
		REFCLK_RST_I        : in  std_logic;

		XL_RX_CLK_156M25_O  : out std_logic;
		XL_RX_CLK_161M133_O : out std_logic;
		XL_RX_CLK_322M266_O : out std_logic;
		XL_RX_CLK_625M_O    : out std_logic;
		XL_RX_CLK_RST_O     : out std_logic;
		XL_RX_CLK_LOCKED_O  : out std_logic
	);
end XL_PMA_RX_RESET_CLOCKING_CONTROLLER;

architecture Behavioral of XL_PMA_RX_RESET_CLOCKING_CONTROLLER is
	signal ref_clk_BUFMR : std_logic;

	-- Output clock A buffering / unused connectors
	signal clkAfbout : std_logic;
	signal clkAfbin  : std_logic;
	signal clkAout0  : std_logic;
	signal clkAout1  : std_logic;

	signal ref_clkA_locked : std_logic;

begin
	REFCLK_I_bufmr : BUFMR
		port map(
			O => ref_clk_BUFMR,         -- 1-bit output: Clock output (connect to BUFIOs/BUFRs)
			I => REFCLK_I               -- 1-bit input: Clock input (Connect to IBUF)
		);

	XL_RX_CLK_322M266_bufr : BUFR
		generic map(
			BUFR_DIVIDE => "BYPASS",    -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
			SIM_DEVICE  => "7SERIES"    -- Must be set to "7SERIES" 
		)
		port map(
			O   => XL_RX_CLK_322M266_O, -- 1-bit output: Clock output port
			CE  => '1',                 -- 1-bit input: Active high, clock enable (Divided modes only)
			CLR => '0',                 -- 1-bit input: Active high, asynchronous clear (Divided modes only)
			I   => ref_clk_BUFMR        -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
		);

	XL_RX_CLK_161M133_bufr : BUFR
		generic map(
			BUFR_DIVIDE => "2",         -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
			SIM_DEVICE  => "7SERIES"    -- Must be set to "7SERIES" 
		)
		port map(
			O   => XL_RX_CLK_161M133_O, -- 1-bit output: Clock output port
			CE  => '1',                 -- 1-bit input: Active high, clock enable (Divided modes only)
			CLR => '0',                 -- 1-bit input: Active high, asynchronous clear (Divided modes only)
			I   => ref_clk_BUFMR        -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
		);

	ref_clkB_MMCME2_BASE_inst : MMCME2_BASE
		generic map(
			BANDWIDTH          => "OPTIMIZED", -- Jitter programming (OPTIMIZED, HIGH, LOW)
			CLKFBOUT_MULT_F    => 48.000, -- Multiply value for all CLKOUT (2.000-64.000).
			CLKFBOUT_PHASE     => 0.0,  -- Phase offset in degrees of CLKFB (-360.000-360.000).
			CLKIN1_PERIOD      => 3.103, -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
			-- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
			CLKOUT1_DIVIDE     => 9,
			CLKOUT2_DIVIDE     => 1,
			CLKOUT3_DIVIDE     => 1,
			CLKOUT4_DIVIDE     => 1,
			CLKOUT5_DIVIDE     => 1,
			CLKOUT6_DIVIDE     => 1,
			CLKOUT0_DIVIDE_F   => 2.250, -- Divide amount for CLKOUT0 (1.000-128.000).
			-- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
			CLKOUT0_DUTY_CYCLE => 0.5,
			CLKOUT1_DUTY_CYCLE => 0.5,
			CLKOUT2_DUTY_CYCLE => 0.5,
			CLKOUT3_DUTY_CYCLE => 0.5,
			CLKOUT4_DUTY_CYCLE => 0.5,
			CLKOUT5_DUTY_CYCLE => 0.5,
			CLKOUT6_DUTY_CYCLE => 0.5,
			-- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
			CLKOUT0_PHASE      => -80.0,
			CLKOUT1_PHASE      => 0.0,
			CLKOUT2_PHASE      => 0.0,
			CLKOUT3_PHASE      => 0.0,
			CLKOUT4_PHASE      => 0.0,
			CLKOUT5_PHASE      => 0.0,
			CLKOUT6_PHASE      => 0.0,
			CLKOUT4_CASCADE    => FALSE, -- Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
			DIVCLK_DIVIDE      => 11,   -- Master division value (1-106)
			REF_JITTER1        => 0.010, -- Reference input jitter in UI (0.000-0.999).
			STARTUP_WAIT       => FALSE -- Delays DONE until MMCM is locked (FALSE, TRUE)
		)
		port map(
			-- Clock Outputs: 1-bit (each) output: User configurable clock outputs
			CLKOUT0   => clkAout0,      -- 1-bit output: CLKOUT0
			CLKOUT0B  => open,          -- 1-bit output: Inverted CLKOUT0
			CLKOUT1   => clkAout1,      -- 1-bit output: CLKOUT1
			CLKOUT1B  => open,          -- 1-bit output: Inverted CLKOUT1
			CLKOUT2   => open,          -- 1-bit output: CLKOUT2
			CLKOUT2B  => open,          -- 1-bit output: Inverted CLKOUT2
			CLKOUT3   => open,          -- 1-bit output: CLKOUT3
			CLKOUT3B  => open,          -- 1-bit output: Inverted CLKOUT3
			CLKOUT4   => open,          -- 1-bit output: CLKOUT4
			CLKOUT5   => open,          -- 1-bit output: CLKOUT5
			CLKOUT6   => open,          -- 1-bit output: CLKOUT6
			-- Feedback Clocks: 1-bit (each) output: Clock feedback ports
			CLKFBOUT  => clkAfbout,     -- 1-bit output: Feedback clock
			CLKFBOUTB => open,          -- 1-bit output: Inverted CLKFBOUT
			-- Status Ports: 1-bit (each) output: MMCM status ports
			LOCKED    => ref_clkA_locked, -- 1-bit output: LOCK
			-- Clock Inputs: 1-bit (each) input: Clock input
			CLKIN1    => REFCLK_I,      -- 1-bit input: Clock
			-- Control Ports: 1-bit (each) input: MMCM control ports
			PWRDWN    => '0',           -- 1-bit input: Power-down
			RST       => REFCLK_RST_I,  -- 1-bit input: Reset
			-- Feedback Clocks: 1-bit (each) input: Clock feedback ports
			CLKFBIN   => clkAfbin       -- 1-bit input: Feedback clock
		);

	-- Output buffering
	-------------------------------------

	--	clkAf_buf : BUFH
	--		port map(
	--			O => clkAfbin,
	--			I => clkAfbout
	--		);

	clkAfbin <= clkAfbout;

	XL_RX_CLK_625M_bufh : BUFH
		port map(
			O => XL_RX_CLK_625M_O,
			I => clkAout0
		);

	XL_RX_CLK_156M25_bufh : BUFH
		port map(
			O => XL_RX_CLK_156M25_O,
			I => clkAout1
		);

	XL_RX_CLK_RST_O    <= not ref_clkA_locked;
	XL_RX_CLK_LOCKED_O <= ref_clkA_locked;

end Behavioral;
