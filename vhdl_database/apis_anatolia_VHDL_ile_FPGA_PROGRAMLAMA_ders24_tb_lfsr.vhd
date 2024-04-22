library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_lfsr is
generic (
c_clkfreq	: integer := 100_000_000;	-- Hz
c_datawidth	: integer := 10;			-- bit
c_shiftfreq	: integer := 100_000_000	-- Hz	: 100_000_000 means shift at each clock cycle
);
end tb_lfsr;

architecture Behavioral of tb_lfsr is

component lfsr is
generic (
c_clkfreq	: integer := 100_000_000;	-- Hz
c_datawidth	: integer := 10;			-- bit
c_shiftfreq	: integer := 100			-- Hz
);
port (
clk			: in std_logic;
load_i		: in std_logic;
enable_i	: in std_logic;
poly_i		: in std_logic_vector (c_datawidth-1 downto 0);
number_o	: out std_logic_vector (c_datawidth-1 downto 0)
);
end component;

signal clk			: std_logic := '0';
signal load_i		: std_logic := '0';
signal enable_i		: std_logic := '0';
signal poly_i		: std_logic_vector (c_datawidth-1 downto 0) := (c_datawidth-1 => '1', others => '0');
signal number_o		: std_logic_vector (c_datawidth-1 downto 0);

constant c_clkperiod	: time := 10 ns;
signal binary		: std_logic_vector (c_datawidth-1 downto 0) := (others => '0');

begin

P_CLKGEN : process begin

clk	<= '0';
wait for c_clkperiod/2;
clk	<= '1';
binary <= binary + '1';
wait for c_clkperiod/2;

end process P_CLKGEN;

DUT : lfsr
generic map(
c_clkfreq	=> c_clkfreq	    ,
c_datawidth	=> c_datawidth      ,
c_shiftfreq	=> c_shiftfreq
)
port map(
clk			=> clk		  ,
load_i		=> load_i	  ,
enable_i	=> enable_i   ,
poly_i		=> poly_i	  ,
number_o	=> number_o
);

STIMULI : process begin

	enable_i	<= '1';
	
	wait for c_clkperiod*20;
	
	poly_i	<= "1001000000";
	-- poly_i	<= "1001100001";
	load_i	<= '1';
	
	wait for c_clkperiod;
	
	load_i	<= '0';
	
	wait for c_clkperiod*1100;
	
	assert false
	report "SIM DONE"
	severity failure;

end process;

end Behavioral;