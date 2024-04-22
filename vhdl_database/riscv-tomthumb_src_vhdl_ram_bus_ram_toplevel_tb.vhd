library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity bus_ram_toplevel_tb is
end bus_ram_toplevel_tb;

architecture Behavior of bus_ram_toplevel_tb is

	component bus_ram_toplevel
		Port(
			I_clk: in std_logic;
			I_reset: in std_logic;
			I_en: in std_logic;
			I_op: in busops_t; -- memory opcodes
			I_iaddr: in std_logic_vector(31 downto 0); -- instruction address, provided by PCU
			I_daddr: in std_logic_vector(31 downto 0); -- data address, provided by ALU
			I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
			I_mem_imem: in std_logic := '0'; -- denotes if instruction memory is accessed (signal from control unit)
			O_data : out std_logic_vector(31 downto 0);
			O_busy: out std_logic := '0';
			O_clk: out std_logic := '0';
			O_reset: out std_logic := '0'
		);
	end component;
	
	signal I_clk, I_reset, I_en, I_mem_imem, O_busy, O_clk, O_reset: std_logic := '0';
	signal I_iaddr, I_daddr, I_data, O_data: std_logic_vector(31 downto 0) := X"00000000";
	signal I_op: busops_t;

	constant I_clk_period : time := 10 ns;
begin

	uut: bus_ram_toplevel port map(
		I_clk => I_clk,
		I_reset => I_reset,
		I_en => I_en,
		I_op => I_op,
		I_iaddr => I_iaddr,
		I_daddr => I_daddr,
		I_data => I_data,
		I_mem_imem => I_mem_imem,
		O_data => O_data,
		O_busy => O_busy,
		O_clk => O_clk,
		O_reset => O_reset
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
	
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_daddr <= X"00000000";
		I_op <= BUS_READW;
		wait until falling_edge(O_busy);
		I_en <= '0';
	
		-- test writing a word
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_data <= X"CAFEBABE";
		I_daddr <= X"CAFE0000";
		I_mem_imem <= '0';
		I_op <= BUS_WRITEW;
		wait until falling_edge(O_busy);
		I_en <= '0';
		
		-- read a word from memory, check if contents match what we've written
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_op <= BUS_READW;
		wait until falling_edge(O_busy);
		I_en <= '0';
		assert O_data = X"CAFEBABE" report "wrong data read" severity failure;
		
		-- read a half word from memory, check sign extension
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_op <= BUS_READH;
		wait until falling_edge(O_busy);
		I_en <= '0';
		assert O_data = X"FFFFBABE" report "wrong data read" severity failure;
		
		-- read a half word from memory, check zero extension
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_op <= BUS_READHU;
		wait until falling_edge(O_busy);
		I_en <= '0';
		assert O_data = X"0000BABE" report "wrong data read" severity failure;	
		
		-- read a byte from memory, check sign extension
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_op <= BUS_READB;
		wait until falling_edge(O_busy);
		I_en <= '0';
		assert O_data = X"FFFFFFBE" report "wrong data read" severity failure;
		
		-- read a byte from memory, check zero extension
		wait until falling_edge(I_clk);
		I_en <= '1';
		I_op <= BUS_READBU;
		wait until falling_edge(O_busy);
		I_en <= '0';
		assert O_data = X"000000BE" report "wrong data read" severity failure;	

	
	
		wait for I_clk_period;		
		assert false report "end of simulation" severity failure;
	end process;

end architecture;
