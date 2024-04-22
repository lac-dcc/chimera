library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity sys_tb is
end sys_tb;

architecture Behavior of sys_tb is


	component sys_toplevel
		Port(
		I_clk: in std_logic;
		I_en: in std_logic := '1';
		I_reset: in std_logic := '1'; -- gets inverted 
		I_serial_rx: in std_logic;

		O_addr: out std_logic_vector(XLEN-1 downto 0);
		O_data: out std_logic_vector(XLEN-1 downto 0);
		O_leds: out std_logic_vector(7 downto 0);
		O_serial_tx: out std_logic;
		O_busy: out std_logic
		);
	end component;


	constant I_clk_period : time := 10 ns;
	signal I_clk : std_logic := '0';
	signal I_en: std_logic := '1';
	signal I_reset: std_logic := '0';
	signal I_serial_rx: std_logic;
	signal O_addr: std_logic_vector(XLEN-1 downto 0);
	signal O_data: std_logic_vector(XLEN-1 downto 0);
	signal O_leds: std_logic_vector(7 downto 0);
	signal O_serial_tx: std_logic;
	signal O_busy: std_logic;


begin

	-- instantiate unit under test
	uut: sys_toplevel port map(
		I_clk => I_clk,
		I_en => I_en,
		I_reset => I_reset,
		I_serial_rx => I_serial_rx,
		O_addr => O_addr,
		O_data => O_data,
		O_leds => O_leds,
		O_serial_tx => O_serial_tx,
		O_busy => O_busy
	);

	proc_clock: process
	begin
		I_clk <= '0';
		wait for I_clk_period/2;
		I_clk <= '1';
		wait for I_clk_period/2;
	end process;
	
	proc_stimuli: process
	begin
		I_en <= '1';
		I_reset <= '1';
		
		wait for 1000 * I_clk_period;		
		assert false report "end of simulation" severity failure;
	
	end process;
	

end architecture;