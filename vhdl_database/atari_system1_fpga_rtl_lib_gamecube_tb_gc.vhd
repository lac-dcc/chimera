--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   00:00:00 01/01/2020
-- Design Name:
-- Module Name:   tb_gc.vhd
-- Project Name:  gamecube
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: gamecube
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;


entity tb_gc is
end tb_gc;

architecture rtl of tb_gc is
	--Inputs
	signal clk   : std_logic := '0';
	signal reset : std_logic := '0';
	signal ready : std_logic := '0';

	--BiDirs
	signal serio : std_logic;

	--Outputs
	signal but_S : std_logic;
	signal but_X : std_logic;
	signal but_Y : std_logic;
	signal but_Z : std_logic;
	signal but_A : std_logic;
	signal but_B : std_logic;
	signal but_L : std_logic;
	signal but_R : std_logic;
	signal but_DU : std_logic;
	signal but_DD : std_logic;
	signal but_DL : std_logic;
	signal but_DR : std_logic;
	signal joy_X : std_logic_vector(7 downto 0);
	signal joy_Y : std_logic_vector(7 downto 0);
	signal cst_X : std_logic_vector(7 downto 0);
	signal cst_Y : std_logic_vector(7 downto 0);
	signal ana_L : std_logic_vector(7 downto 0);
	signal ana_R : std_logic_vector(7 downto 0);

	-- Clock period definitions
	constant clk_period : time := 1000 ns / 28;		-- 28MHz clock
	constant bit_period : time := 1 us;

begin
	uut: entity work.gamecube
	port map (
		clk    => clk,
		reset  => reset,
		ready  => ready,
		serio  => serio,
		but_S  => but_S,
		but_X  => but_X,
		but_Y  => but_Y,
		but_Z  => but_Z,
		but_A  => but_A,
		but_B  => but_B,
		but_L  => but_L,
		but_R  => but_R,
		but_DU => but_DU,
		but_DD => but_DD,
		but_DL => but_DL,
		but_DR => but_DR,
		joy_X  => joy_X,
		joy_Y  => joy_Y,
		cst_X  => cst_X,
		cst_Y  => cst_Y,
		ana_L  => ana_L,
		ana_R  => ana_R
	);

	-- clock process
	p_clk :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

	-- reset process
	p_reset : process
	begin
		I_RESET <= '1';
		wait for clk_period*2;
		I_RESET <= '0';
		wait;
	end process;

   -- Stimulus process
	p_stim : process
	begin
		-- wait for tx cmd to finish
		serio <= 'Z';
		wait for 229 us;

		-- idle a bit
		serio <= '1';
		wait for 1 us;

		-- send rx data to controller
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period*3; serio <= '1'; wait for bit_period;   -- 0

		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1
		serio <= '0'; wait for bit_period;   serio <= '1'; wait for bit_period*3; -- 1

		serio <= 'Z';

		wait;
	end process;

end rtl;
