library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity decoder_tb is
end decoder_tb;

architecture Behavior of decoder_tb is

	constant I_clk_period : time := 10 ns;
	signal I_clk : std_logic := '0';
	signal I_en: std_logic := '1';
	signal I_instr: std_logic_vector(XLEN-1 downto 0) := X"00000000";
	signal O_rs1: std_logic_vector(4 downto 0);
	signal O_rs2: std_logic_vector(4 downto 0);
	signal O_rd: std_logic_vector(4 downto 0);
	signal O_imm: std_logic_vector(XLEN-1 downto 0) := X"00000000";
	signal O_opcode: std_logic_vector(4 downto 0);
	signal O_funct3: std_logic_vector(2 downto 0);
	signal O_funct7: std_logic_vector(6 downto 0);
	

begin

	-- instantiate unit under test
	uut: entity work.decoder port map(
		I_clk => I_clk,
		I_en => I_en,
		I_instr => I_instr,
		O_rs1 => O_rs1,
		O_rs2 => O_rs2,
		O_rd => O_rd,
		O_imm => O_imm,
		O_opcode => O_opcode,
		O_funct3 => O_funct3,
		O_funct7 => O_funct7
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

		I_instr <= X"00f00313"; -- addi t1,x0,15
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rd = T1 report "wrong rd decoded" severity failure;
		assert to_integer(signed(O_imm)) = 15 report "wrong immediate decoded" severity failure;
	
		
		I_instr <= X"006282b3"; -- add t0,t0,t1
		wait until falling_edge(I_clk);
		assert O_rs1 = T0 report "wrong rs1 decoded" severity failure;
		assert O_rs2 = T1 report "wrong rs2 decoded" severity failure;
		assert O_rd = T0 report "wrong rd decoded" severity failure;
		
		
		I_instr <= X"00502e23"; -- sw t0,28(x0)
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rs2 = T0 report "wrong rs2 decoded" severity failure;
		assert to_integer(signed(O_imm)) = 28 report "wrong immediate decoded" severity failure;

		
		I_instr <= X"e0502023"; -- sw t0,-512(x0)
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rs2 = T0 report "wrong rs2 decoded" severity failure;
		assert to_integer(signed(O_imm)) = -512 report "wrong immediate decoded" severity failure;
	

		I_instr <= X"01c02283"; -- lw t0,28(x0)
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rd = T0 report "wrong rd decoded" severity failure;
		assert to_integer(signed(O_imm)) = 28 report "wrong immediate decoded" severity failure;


		I_instr <= X"ff1ff3ef"; -- jal x7,4 (from 0x14)
		wait until falling_edge(I_clk);
		assert O_rd = R7 report "wrong rd decoded" severity failure;
		assert to_integer(signed(O_imm)) = -16 report "wrong immediate decoded" severity failure;
		
		
		I_instr <= X"fec003e7"; -- jalr x7,x0,-20
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rd = R7 report "wrong rd decoded" severity failure;
		assert to_integer(signed(O_imm)) = -20 report "wrong immediate decoded" severity failure;

		
		I_instr <= X"f0f0f2b7"; -- lui t0,0xf0f0f
		wait until falling_edge(I_clk);
		assert O_rs1 = R1 report "wrong rs1 decoded" severity failure;
		assert O_rd = T0 report "wrong rd decoded" severity failure;
		assert O_imm = X"f0f0f000" report "wrong immediate decoded" severity failure;

		
		I_instr <= X"fe7316e3"; -- bne t1,t2,4 (from 0x18)
		wait until falling_edge(I_clk);
		assert O_rs1 = T1 report "wrong rs1 decoded" severity failure;
		assert O_rs2 = T2 report "wrong rs2 decoded" severity failure;
		assert to_integer(signed(O_imm)) = -20 report "wrong immediate decoded" severity failure;
		
		
		I_instr <= X"c0002373"; -- rdcycle t1
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rs2 = R0 report "wrong rs2 decoded" severity failure;
		
		
		I_instr <= X"c80023f3"; -- rdcycleh t1
		wait until falling_edge(I_clk);
		assert O_rs1 = R0 report "wrong rs1 decoded" severity failure;
		assert O_rs2 = R0 report "wrong rs2 decoded" severity failure;

		
		wait for I_clk_period;		
		assert false report "end of simulation" severity failure;
	
	end process;
	

end architecture;