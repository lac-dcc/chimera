library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Testbench is
	generic( BIT_SIZE : natural := 4 );
end Testbench;

architecture test of testbench is
	signal data_a		: std_logic_vector(BIT_SIZE-1 downto 0) := (others => '0');	-- input data A
	signal data_b		: std_logic_vector(BIT_SIZE-1 downto 0) := (others => '0');	-- input data B
	signal data_cin		: std_logic := '0';											-- carry in or borrow in
	signal ctrl			: std_logic_vector(2 downto 0) := (others => '0');			-- control signals
	signal data_c		: std_logic_vector(BIT_SIZE-1 downto 0) := (others => '0');	-- output data C
	signal data_cout	: std_logic := '0';											-- carry out or borrow out
	signal data_comp	: std_logic_vector(1 downto 0) := (others => '0');			-- output comparison
begin
	-- create instance of ALU (DUT)
	DUT_ALU: entity work.top(behavioral)
			 generic map( N => BIT_SIZE )
			 port map (	in_data_a 		=> data_a,
			 			in_data_b		=> data_b,
			 			in_data_carry	=> data_cin,
			 			in_ctrl			=> ctrl,
			 			out_data_c		=> data_c,
			 			out_data_carry	=> data_cout,
			 			out_data_comp	=> data_comp
			 			);

	-- test vectors
	stimulus : process
	begin
		-- initialize to 0 to all inputs
		data_a <= x"0";
		data_b <= x"0";
		data_cin <= '0';
		ctrl <= "000";
		wait for 200 ns;

		-- test stimulus 1: c = a, cout = cin
		data_a <= x"A";
		data_cin <= '1';
		ctrl <= "000";
		wait for 200 ns;

		-- test stimulus 2: {sum, cout} = a+b+cin
		data_a <= x"2";
		data_b <= x"C";
		data_cin <= '1';
		ctrl <= "001";
		wait for 200 ns;

		-- test stimulus 3 : {diff, cout} = a-b-bin
		data_a <= x"F";
		data_b <= x"C";
		data_cin <= '1';
		ctrl <= "010";
		wait for 200 ns;

		-- test stimulus 4: A > B
		data_a <= x"B";
		data_b <= x"F";
		ctrl <= "011";
		wait for 200 ns;		

		-- test stimulus 5: A < B
		data_a <= x"A";
		data_b <= x"E";
		ctrl <= "100";
		wait for 200 ns;

		-- test stimulus 6 : A == B
		data_a <= x"D";
		data_b <= x"D";
		ctrl <= "101";
		wait for 200 ns;

		-- test stimulus 7: right shift
		data_a <= x"F";
		data_b <= x"2";
		ctrl <= "110";
		wait for 200 ns;

		-- test stimulus 8: left shift
		data_a <= x"9";
		data_b <= x"1";
		ctrl <= "111";
		wait for 200 ns;
	end process stimulus;
end architecture test;