library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;
use IEEE.STD_LOGIC_TEXTIO.ALL;


entity tb_FIR_LP_50_TAP is
end tb_FIR_LP_50_TAP;

architecture Behavioral of tb_FIR_LP_50_TAP is

component FIR_LP_50_TAP is
generic (
c_clkfreq : integer := 100_000_000
);
port (
clk         : in std_logic;
reset_i     : in std_logic;
datain_i    : in std_logic_vector (31 downto 0);
datavalid_i : in std_logic;
dataout_o   : out std_logic_vector (31 downto 0);
dataready_o : out std_logic
);
end component;

signal clk         : std_logic := '0';
signal reset_i     : std_logic := '0';
signal datain_i    : std_logic_vector (31 downto 0) := (others => '0');
signal datavalid_i : std_logic := '0';
signal dataout_o   : std_logic_vector (31 downto 0);
signal dataready_o : std_logic;


constant c_clkperiod					: time 		:= 10 ns;
constant C_FILE_NAME_WR :string  := "C:\Users\ayken\OneDrive\Documents\FPGA_youtube\VivadoProjects\ders45_2016\ders45_2016.srcs\sim_1\filter_out_noisy.txt";
constant C_FILE_NAME_RD :string  := "C:\Users\ayken\OneDrive\Documents\FPGA_youtube\VivadoProjects\ders45_2016\ders45_2016.srcs\sim_1\sin_noisy.txt";

begin

  DUT : FIR_LP_50_TAP
  port map(
    clk         => clk,
    reset_i     => reset_i,
    datain_i    => datain_i,
    datavalid_i => datavalid_i,
    dataout_o   => dataout_o,
    dataready_o => dataready_o
  );

P_CLKGEN : process begin
clk 	<= '0';
wait for c_clkperiod/2;
clk		<= '1';
wait for c_clkperiod/2;
end process P_CLKGEN;

P_STIMULI : process 

	variable VEC_LINE_WR : line;
    variable VEC_VAR_WR : std_logic_vector (31 downto 0);
	file VEC_FILE_WR : text open write_mode is C_FILE_NAME_WR;
	
	variable VEC_LINE_RD 		: line;
    variable VEC_VAR_RD 		: std_logic_vector (31 downto 0);
	file VEC_FILE_RD 			: text open read_mode is C_FILE_NAME_RD;

begin

reset_i	<= '1';
wait for 100 ns;
reset_i	<= '0';
wait for 100 ns;

while not endfile(VEC_FILE_RD) loop
	readline (VEC_FILE_RD, VEC_LINE_RD);
	hread (VEC_LINE_RD, VEC_VAR_RD);		-- VHDL-2008, use HREAD to read hex values from file, use READ to read binary or integer values from file
	wait until falling_edge(clk);
	datain_i <= VEC_VAR_RD;	
	datavalid_i	<= '1';
	wait for c_clkperiod;
	datavalid_i	<= '0';
	wait until rising_edge(dataready_o);
	-- write filter output to file
	hwrite(VEC_LINE_WR, dataout_o);
	writeline(VEC_FILE_WR,VEC_LINE_WR);
	wait for c_clkperiod;	
end loop;


assert false
report "SIM DONE"
severity failure;

end process P_STIMULI;

end Behavioral;