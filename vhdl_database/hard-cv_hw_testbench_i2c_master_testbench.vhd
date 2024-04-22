library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;

library work ;
	use work.camera.all ;


entity i2c_master_testbench is
end i2c_master_testbench;

architecture test of i2c_master_testbench is
	constant clk_period : time := 100 ns ;
	signal clk : std_logic ;
	signal datai2c : std_logic_vector(7 downto 0) ;
	begin
	master_0: i2c_master
		port map(clock => clk, 
 		resetn => '1', 
 		slave_addr => "1000001", 
 		data => datai2c,
 		send => '1', 
 		rcv => '0');
datai2c <= "10100101";

process
	begin
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period; 
	end process;
end test ;
