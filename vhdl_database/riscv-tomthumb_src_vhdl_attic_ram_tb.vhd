library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity ram_tb is
end ram_tb;

architecture Behavior of ram_tb is


	component ram
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_write: in std_logic;
			I_addr: in std_logic_vector(XLEN-1 downto 0);
			I_data: in std_logic_vector(XLEN-1 downto 0);
			O_data: out std_logic_vector(XLEN-1 downto 0);
			O_busy: out std_logic
		);
	end component;


	constant I_clk_period : time := 10 ns;
	signal I_clk : std_logic := '0';
	signal I_en: std_logic := '1';
	signal I_write: std_logic := '0';
	signal I_addr: std_logic_vector(XLEN-1 downto 0);
	signal I_data: std_logic_vector(XLEN-1 downto 0);
	signal O_data: std_logic_vector(XLEN-1 downto 0);
	signal O_busy: std_logic := '0';
	

begin

	-- instantiate unit under test
	uut: ram port map(
		I_clk => I_clk,
		I_en => I_en,
		I_write => I_write,
		I_addr => I_addr,
		I_data => I_data,
		O_data => O_data,
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
	
		-- ram works on falling edge, so stimulus should hapen on rising edge
		wait until rising_edge(I_clk);
		I_en <= '1';
		
		I_addr <= X"00000000";
		I_data <= X"01234567";
		I_write <= '1';
		wait until rising_edge(I_clk);
		I_write <= '0';
		wait until rising_edge(I_clk);
		assert O_data = X"01234567" report "wrong output value" severity failure;
		
		I_addr <= X"00000001";
		I_data <= X"BEEFBEEF";
		I_write <= '1';
		wait until falling_edge(O_busy);
		wait until rising_edge(I_clk);
		I_addr <= X"00000000";
		I_write <= '0';
		wait until rising_edge(I_clk);
		assert O_data = X"01BEEFBE";
		I_addr <= X"00000001";
		I_write <= '0';
		wait until falling_edge(O_busy);
		wait until rising_edge(I_clk);
		assert O_data = X"BEEFBEEF";		
		
		I_addr <= X"00000002";
		I_data <= X"AABBCCDD";
		I_write <= '1';
		wait until falling_edge(O_busy);
		wait until rising_edge(I_clk);
		I_addr <= X"00000000";
		I_write <= '0';
		wait until rising_edge(I_clk);
		assert O_data = X"01BEAABB";
		I_addr <= X"00000002";
		I_write <= '0';
		wait until falling_edge(O_busy);
		wait until rising_edge(I_clk);
		assert O_data = X"AABBCCDD";
	
		I_addr <= X"00000003";
		I_data <= X"1337EBAB";
		I_write <= '1';
		wait until falling_edge(O_busy);
		wait until rising_edge(I_clk);
		I_addr <= X"00000000";
		I_write <= '0';
		wait until rising_edge(I_clk);
		assert O_data = X"01BEAA13";
		I_addr <= X"00000003";
		I_write <= '0';
		wait until falling_edge(O_busy);
		wait until rising_edge(I_clk);
		assert O_data = X"1337EBAB";	

		
		wait for I_clk_period;		
		assert false report "end of simulation" severity failure;
	
	end process;
	

end architecture;