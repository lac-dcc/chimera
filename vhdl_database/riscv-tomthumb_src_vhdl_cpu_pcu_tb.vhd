library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;

entity pcu_tb is
end pcu_tb;

architecture Behavior of pcu_tb is

	constant I_clk_period : time := 10 ns;
	signal I_clk, I_reset : std_logic := '0';
	signal I_en: std_logic := '1';
	signal I_op: pcuops_t;
	signal I_data, O_data, O_trapret: std_logic_vector(XLEN-1 downto 0);

begin

	-- instantiate unit under test
	uut: entity work.pcu port map(
		I_clk => I_clk,
		I_en => I_en,
		I_reset => I_reset,
		I_op => I_op,
		I_data => I_data,
		O_data => O_data,
		O_trapret => O_trapret
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
	
		-- test setting the program counter
		wait until falling_edge(I_clk);
		I_data <= X"CAFEBABE";
		I_op <= PCU_SETPC;
		wait until falling_edge(I_clk);
		assert O_data = X"CAFEBABE" report "wrong value" severity failure;

		-- test entering and returning from a trap
		wait until falling_edge(I_clk);
		I_data <= X"CAFEBABE";
		I_op <= PCU_SETPC;
		wait until falling_edge(I_clk);
		assert O_data = X"CAFEBABE" report "wrong value" severity failure;
		I_data <= X"BEEFCAFE";
		I_op <= PCU_ENTERTRAP;
		wait until falling_edge(I_clk);
		assert O_data = TRAP_VECTOR report "wrong value" severity failure;
		I_op <= PCU_RETTRAP;
		wait until falling_edge(I_clk);
		assert O_data = X"BEEFCAFE" report "wrong value" severity failure;
		I_data <= X"CAFEBABE";
		I_op <= PCU_SETPC;
		wait until falling_edge(I_clk);
		assert O_data = X"CAFEBABE" report "wrong value" severity failure;
		assert O_trapret = X"BEEFCAFE" report "wrong value" severity failure;
		
		
		-- test entering and returning from an interrupt
		wait until falling_edge(I_clk);
		I_data <= X"CAFEBABE";
		I_op <= PCU_SETPC;
		wait until falling_edge(I_clk);
		assert O_data = X"CAFEBABE" report "wrong value" severity failure;
		I_data <= X"BEEFCAFE";
		I_op <= PCU_ENTERINT;
		wait until falling_edge(I_clk);
		assert O_data = INTERRUPT_VECTOR report "wrong value" severity failure;
		I_op <= PCU_RETINT;
		wait until falling_edge(I_clk);
		assert O_data = X"CAFEBABE" report "wrong value" severity failure;
		
		
		
		wait for I_clk_period;		
		assert false report "end of simulation" severity failure;
	
	end process;
	

end architecture;