library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity bus_wb8_tb is
end bus_wb8_tb;

architecture Behavior of bus_wb8_tb is

	component bus_wb8
		Port(
			I_en: in std_logic;
			I_op: in busops_t; -- memory opcodes
			I_addr: in std_logic_vector(31 downto 0); -- address
			I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
			O_data : out std_logic_vector(31 downto 0);
			O_busy: out std_logic := '0';

			-- wired to outside world, RAM, devices etc.
			-- naming of signals taken from Wishbone B4 spec
			CLK_I: in std_logic := '0';
			ACK_I: in std_logic := '0';
			DAT_I: in std_logic_vector(7 downto 0);
			RST_I: in std_logic := '0';
			ADR_O: out std_logic_vector(31 downto 0);
			DAT_O: out std_logic_vector(7 downto 0);
			CYC_O: out std_logic := '0';
			STB_O: out std_logic := '0';
			WE_O: out std_logic := '0'		
		);
	end component;

	signal I_en: std_logic;
	signal I_op: busops_t; -- memory opcodes
	signal I_addr: std_logic_vector(31 downto 0); -- address
	signal I_data: std_logic_vector(31 downto 0); -- data to be stored on write ops
	signal O_data: std_logic_vector(31 downto 0);
	signal O_busy: std_logic := '0';
	signal O_clk: std_logic := '0';
	signal O_reset: std_logic := '0';
	signal CLK_I: std_logic := '0';
	signal ACK_I: std_logic := '0';
	signal DAT_I: std_logic_vector(7 downto 0);
	signal RST_I: std_logic := '0';
	signal ADR_O: std_logic_vector(31 downto 0);
	signal DAT_O: std_logic_vector(7 downto 0);
	signal CYC_O: std_logic := '0';
	signal STB_O: std_logic := '0';
	signal WE_O: std_logic := '0';

	constant I_clk_period : time := 10 ns;
begin

	uut: bus_wb8 port map(
		I_en => I_en,
		I_op => I_op,
		I_addr => I_addr,
		I_data => I_data,
		O_data => O_data,
		O_busy => O_busy,

		CLK_I => CLK_I,
		ACK_I => ACK_I,
		DAT_I => DAT_I,
		RST_I => RST_I,
		ADR_O => ADR_O,
		DAT_O => DAT_O,
		CYC_O => CYC_O,
		STB_O => STB_O,
		WE_O => WE_O
	);


	proc_clock: process
	begin
		CLK_I <= '0';
		wait for I_clk_period/2;
		CLK_I <= '1';
		wait for I_clk_period/2;
	end process;

	proc_stimuli: process
	begin
	
		-- test read of words
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_addr <= X"CAFE0000";
		I_op <= BUS_READW;
		DAT_I <= X"CC";
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert O_data = X"CCCCCCCC" report "wrong data read" severity failure;
		I_en <= '0';
		
		-- test read of half words and sign extension (here: sign set)
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_addr <= X"CAFE0000";
		I_op <= BUS_READH;
		DAT_I <= X"CC";
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert O_data = X"FFFFCCCC" report "wrong data read" severity failure;
		I_en <= '0';
		
		-- test read of half words and sign extension (here sign not set)
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_addr <= X"CAFE0000";
		I_op <= BUS_READH;
		DAT_I <= X"0F";
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert O_data = X"00000F0F" report "wrong data read" severity failure;
		I_en <= '0';
		
		-- test read of byte and sign extension (here: sign set)
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_addr <= X"CAFE0000";
		I_op <= BUS_READB;
		DAT_I <= X"CC";
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert O_data = X"FFFFFFCC" report "wrong data read" severity failure;
		I_en <= '0';
		
		-- test read of byte and sign extension (here sign not set)
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_addr <= X"CAFE0000";
		I_op <= BUS_READB;
		DAT_I <= X"0F";
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert O_data = X"0000000F" report "wrong data read" severity failure;
		I_en <= '0';
		
		-- test writing a word
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_data <= X"CAFEBABE";
		I_addr <= X"CAFE0000";
		I_op <= BUS_WRITEW;
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert DAT_O = X"CA" report "wrong data written" severity failure;
		I_en <= '0';
		
		-- test writing a half word
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_data <= X"CAFEBABE";
		I_addr <= X"CAFE0000";
		I_op <= BUS_WRITEH;
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert DAT_O = X"BA" report "wrong data written" severity failure;
		I_en <= '0';
		
		-- test writing a byte
		wait until falling_edge(CLK_I);
		I_en <= '1';
		I_data <= X"CAFEBABE";
		I_addr <= X"CAFE0000";
		I_op <= BUS_WRITEB;
		ACK_I <= '1';
		wait until falling_edge(O_busy);
		assert DAT_O = X"BE" report "wrong data written" severity failure;
		I_en <= '0';
		
		
		wait for I_clk_period;		
		assert false report "end of simulation" severity failure;
	
	end process;

end architecture;
