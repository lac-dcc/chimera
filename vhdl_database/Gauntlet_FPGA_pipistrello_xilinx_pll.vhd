--	(c) 2020 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

--------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity CLOCKS is
	generic (
		clk_type : string -- "CTR", "SIM", "DCM", "PLL"
	);
	port(
		I_CLK    : in  std_logic := '0';
		I_RST    : in  std_logic := '0';
		O_RST    : out std_logic := '0';
		O_CK0    : out std_logic := '0';
		O_CK1    : out std_logic := '0';
		O_CK2    : out std_logic := '0';
		O_CK3    : out std_logic := '0';
		O_CK4    : out std_logic := '0';
		O_CK5    : out std_logic := '0'
	);
end CLOCKS;

architecture RTL of CLOCKS is
	signal clkfb, pll_locked, clk0, clk1, clk2, clk3, clk4, clk5 : std_logic := '0';
	signal ctr1 : std_logic_vector(2 downto 0) := (others => '0');
	signal ctr2 : std_logic_vector(2 downto 0) := "011";
begin
-- Simulation times vastly different
-- with 28M counter 5ms takes  9 sec
-- with DCM_SP      5ms takes 16 sec
-- with PLL_BASE    5ms takes 50 sec

	O_RST <= I_RST or (not pll_locked);

	-- simulates the timing of the PLL for faster simulation
	gen_sim : if  clk_type = "SIM" generate
		-- PLL
		-- I_RST active high
		-- O_RST active high, goes low 830100ns after I_RST low
		-- all clocks start 270ns after I_RST goes low
		-- O_CK0 starts high
		-- O_CK1 starts low
		-- O_CK2 starts low
		-- O_CK3 starts low
		-- O_CK4 inverted CK3
		-- O_CK5 unused
		process
		begin
			pll_locked <= '0';
			wait until falling_edge(I_RST);
			wait for 830100 ps;
			pll_locked <= '1';
			wait;
		end process;

		process
		begin
			if now > 909999 ps then
				clk4 <= (not clk4);
				clk3 <= clk4;
				wait for 25000.0 ps/7.0;
			else
				wait for 1 ps;
			end if;
		end process;

		process
		begin
			wait until rising_edge(clk4);
			ctr1 <= ctr1 - 1;
			if ctr1 = "100" then
				ctr1 <= (others=>'0');
			end if;
		end process;

		process
		begin
			wait until rising_edge(ctr1(1));
			ctr2 <= ctr2 + 1;
		end process;

		O_CK0 <= not ctr2(1); -- 7MHz
		O_CK1 <=     ctr2(0); -- 14MHz
		O_CK2 <= not ctr1(1); -- 28MHz
		O_CK3 <=     clk3;    -- 140MHz pos
		O_CK4 <=     clk4;    -- 140MHz neg
		O_CK5 <=     clk5;    -- UNUSED
	end generate;

	-- acceptable speed in simulation
	gen_dcp : if  clk_type = "DCM" generate
		dcm_sp_inst: DCM_SP
		generic map(
			CLKFX_DIVIDE   => 7,
			CLKFX_MULTIPLY => 20,
			CLKIN_PERIOD   => 20.0
		)
		port map (
			CLKIN  => I_CLK,
			RST    => I_RST,
			CLKFB  => clkfb,
			CLK0   => clkfb,
			CLKFX  => clk3, -- 142857143 MHz
			LOCKED => pll_locked
		);

		-- derive 28.5MHz from 142.8MHz
		p_clk1 : process
		begin
			wait until rising_edge(clk3);
			if ctr1(2) = '1' or I_RST='1' then
				ctr1 <= (others=>'0');
			else
				ctr1 <= ctr1 + 1;
			end if;
		end process;
		clk2 <= ctr1(1) or ctr1(2);
		clk4 <= not clk3;

		-- derive 7.1MHz and 14.2MHz from 28.5MHz
		p_clk2 : process
		begin
			wait until rising_edge(clk2);
			ctr2 <= ctr2 - 1;
		end process;

		O_CK0 <= ctr1(1); -- 7MHz
		O_CK1 <= ctr1(0); -- 14MHz
		O_CK2 <= clk2;    -- 28MHz
		O_CK3 <= clk3;    -- 140MHz pos
		O_CK4 <= clk4;    -- 140MHz neg
		O_CK5 <= clk5;    -- UNUSED
	end generate;

	-- very slow in simulation
	gen_pll : if  clk_type = "PLL" generate
		-----------------------------------------------
		-- PLL generates all the system clocks required
		-----------------------------------------------
		PLL_BASE_inst : PLL_BASE
		generic map (
			-- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
			CLKOUT0_DIVIDE       => 100,
			CLKOUT1_DIVIDE       => 50,
			CLKOUT2_DIVIDE       => 25,
			CLKOUT3_DIVIDE       => 5,
			CLKOUT4_DIVIDE       => 5,
			CLKOUT5_DIVIDE       => 100,

			-- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
			CLKOUT0_DUTY_CYCLE   => 0.5,
			CLKOUT1_DUTY_CYCLE   => 0.5,
			CLKOUT2_DUTY_CYCLE   => 0.5,
			CLKOUT3_DUTY_CYCLE   => 0.5,
			CLKOUT4_DUTY_CYCLE   => 0.5,
			CLKOUT5_DUTY_CYCLE   => 0.5,

			-- CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
			CLKOUT0_PHASE        => 0.0,
			CLKOUT1_PHASE        => 180.0,
			CLKOUT2_PHASE        => 180.0,
			CLKOUT3_PHASE        => 180.0,
			CLKOUT4_PHASE        => 0.0,
			CLKOUT5_PHASE        => 0.0,

			CLKFBOUT_MULT        => 14,                   -- Multiply value for all CLKOUT clock outputs (1-64)
			DIVCLK_DIVIDE        => 1,                    -- Division value for all output clocks (1-52)
			CLKFBOUT_PHASE       => 0.0,                  -- Phase offset in degrees of the clock feedback output (0.0-360.0).
			CLKIN_PERIOD         => 20.0,                 -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
			BANDWIDTH            => "OPTIMIZED",          -- "HIGH", "LOW" or "OPTIMIZED"
			CLK_FEEDBACK         => "CLKFBOUT",           -- Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
			COMPENSATION         => "SYSTEM_SYNCHRONOUS", -- "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL"
			REF_JITTER           => 0.1,                  -- Reference Clock Jitter in UI (0.000-0.999).
			RESET_ON_LOSS_OF_LOCK=> FALSE                 -- Must be set to FALSE
		)
		port map (
			CLKOUT0  => O_CK0,      --  7MHz
			CLKOUT1  => O_CK1,      -- 14MHz
			CLKOUT2  => O_CK2,      -- 28MHz
			CLKOUT3  => O_CK3,      -- 140MHz pos
			CLKOUT4  => O_CK4,      -- 140MHz neg
			CLKOUT5  => O_CK5,      -- UNUSED
			LOCKED   => pll_locked, -- 1-bit output: PLL_BASE lock status output
			CLKIN    => I_CLK,      -- 1-bit input: Clock input
			RST      => I_RST,      -- 1-bit input: Reset input
			CLKFBIN  => clkfb,      -- 1-bit input: Feedback clock input
			CLKFBOUT => clkfb       -- 1-bit output: PLL_BASE feedback output
		);
	end generate;
end RTL;
