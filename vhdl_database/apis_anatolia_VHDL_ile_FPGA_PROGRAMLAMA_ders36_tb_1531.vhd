library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_1531 is
generic (
c_clkfreq		: integer 	:= 100_000_000;
c_baudrate		: integer 	:= 115_200;
c_stopbit		: integer 	:= 2;
RAM_WIDTH 		: integer 	:= 8;	 --16			
RAM_DEPTH 		: integer 	:= 256;	 --128			
RAM_PERFORMANCE : string 	:= "LOW_LATENCY"   
); 
end tb_1531;

architecture Behavioral of tb_1531 is

component top_1531 is
generic (
c_clkfreq		: integer 	:= 100_000_000;
c_baudrate		: integer 	:= 115_200;
c_stopbit		: integer 	:= 2;
RAM_WIDTH 		: integer 	:= 8;	 --16			
RAM_DEPTH 		: integer 	:= 256;	 --128			
RAM_PERFORMANCE : string 	:= "LOW_LATENCY"   
);  
port(
clk				: in std_logic;
rx_i			: in std_logic;
interrupt		: out std_logic;
tx_o			: out std_logic
);
end component;

signal clk				: std_logic := '0';
signal rx_i				: std_logic := '1';
signal interrupt		: std_logic;
signal tx_o				: std_logic;

constant baud_115200	: time := 8.68 us;
constant hex_AB			: std_logic_vector (9 downto 0) := "1" & x"AB" & '0';
constant hex_CD			: std_logic_vector (9 downto 0) := "1" & x"CD" & '0';
constant hex_11			: std_logic_vector (9 downto 0) := "1" & x"11" & '0';
constant hex_03			: std_logic_vector (9 downto 0) := "1" & x"03" & '0';
constant hex_67			: std_logic_vector (9 downto 0) := "1" & x"67" & '0';
constant hex_F3			: std_logic_vector (9 downto 0) := "1" & x"F3" & '0';
constant hex_22			: std_logic_vector (9 downto 0) := "1" & x"22" & '0';
constant hex_00			: std_logic_vector (9 downto 0) := "1" & x"00" & '0';
constant hex_9D			: std_logic_vector (9 downto 0) := "1" & x"9D" & '0';
constant hex_9E			: std_logic_vector (9 downto 0) := "1" & x"9E" & '0';

begin

DUT : top_1531
generic map(
c_clkfreq		=> 100_000_000,
c_baudrate		=> 115_200,
c_stopbit		=> 2,
RAM_WIDTH 		=> 8, --16			
RAM_DEPTH 		=> 256,	 --128			
RAM_PERFORMANCE => "LOW_LATENCY"   
) 
port map(
clk				=> clk		,	
rx_i			=> rx_i		,
interrupt		=> interrupt,	
tx_o			=> tx_o		
);

P_CLK_GEN : process begin

clk 	<= '0';
wait for 5 ns;
clk		<= '1';
wait for 5 ns;

end process;

P_STIMULI : process begin

wait for 10 us;

for i in 0 to 9 loop rx_i	<= hex_AB(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_CD(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_11(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_03(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_67(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_F3(i); wait for baud_115200; end loop;

wait for 1 ms;

for i in 0 to 9 loop rx_i	<= hex_AB(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_CD(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_22(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_03(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_00(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_9D(i); wait for baud_115200; end loop;

wait for 1 ms;

for i in 0 to 9 loop rx_i	<= hex_AB(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_CD(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_22(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_03(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_00(i); wait for baud_115200; end loop;
for i in 0 to 9 loop rx_i	<= hex_9E(i); wait for baud_115200; end loop;

wait for 1 ms;

assert false
report "SIM DONE"
severity failure;

end process;


end Behavioral;