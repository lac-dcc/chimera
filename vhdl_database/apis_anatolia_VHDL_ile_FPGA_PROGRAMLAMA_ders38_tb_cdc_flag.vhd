library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cdc_flag is
generic (
N		: integer	:= 3	-- shift register depth
);
end tb_cdc_flag;

architecture Behavioral of tb_cdc_flag is

component cdc_flag is
generic (
N		: integer	:= 2	-- shift register depth
);
Port ( 
clka 	: in STD_LOGIC;
flaga_i : in STD_LOGIC;
clkb 	: in STD_LOGIC;
flagb_o : out STD_LOGIC
);
end component;

signal clka 	: STD_LOGIC := '0';
signal flaga_i 	: STD_LOGIC := '0';
signal clkb 	: STD_LOGIC := '0';
signal flagb_o 	: STD_LOGIC;

-- flag transfer from low-frequency domain to high-frequency domain
-- constant c_clk100mperiod	: time := 10 ns;
-- constant c_clk133mperiod	: time := 7.5 ns;

-- flag transfer from high-frequency domain to low-frequency domain
-- constant c_clk100mperiod	: time := 7.5 ns;		-- 133.33 MHz
-- constant c_clk100mperiod	: time := 3.33 ns;		-- 333.33 MHz
constant c_clk100mperiod	: time := 4 ns;			-- 250 MHz
-- constant c_clk100mperiod	: time := 6.666 ns;		-- 150 MHz
constant c_clk133mperiod	: time := 10 ns;		-- 100 MHz

begin


DUT : cdc_flag
generic map(
N		=> N	-- shift register depth
)
Port map( 
clka 	=> clka 	,
flaga_i => flaga_i  ,
clkb 	=> clkb 	,
flagb_o => flagb_o
);


P_CLK100MGEN : process begin
clka	<= '0';
wait for c_clk100mperiod/2;
clka <= '1';
wait for c_clk100mperiod/2;
end process P_CLK100MGEN;

P_CLK133MGEN : process begin
clkb	<= '0';
wait for c_clk133mperiod/2;
clkb 	<= '1';
wait for c_clk133mperiod/2;
end process P_CLK133MGEN;

P_STIMULI : process begin

wait for 100 ns;

wait until falling_edge(clka);
flaga_i	<= not flaga_i;
wait for c_clk100mperiod;
flaga_i	<= not flaga_i;

wait for c_clk100mperiod*4;
wait until falling_edge(clka);
flaga_i	<= not flaga_i;
wait for c_clk100mperiod;
flaga_i	<= not flaga_i;

wait for c_clk100mperiod*4;
wait until falling_edge(clka);
flaga_i	<= not flaga_i;
wait for c_clk100mperiod;
flaga_i	<= not flaga_i;

wait for c_clk100mperiod*4;
wait until falling_edge(clka);
flaga_i	<= not flaga_i;
wait for c_clk100mperiod;
flaga_i	<= not flaga_i;

wait for c_clk100mperiod*4;
wait until falling_edge(clka);
flaga_i	<= not flaga_i;
wait for c_clk100mperiod;
flaga_i	<= not flaga_i;

wait for 100 ns;

assert false
report "SIM DONE"
severity failure;

end process P_STIMULI;

end Behavioral;