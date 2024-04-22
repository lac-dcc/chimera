library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
Port ( 
clk 	: in STD_LOGIC;
rx_i 	: in STD_LOGIC;
btn_i	: in std_logic;
leds_o 	: out STD_LOGIC_VECTOR (15 downto 0)
);
end top;

architecture Behavioral of top is

component uart_rx is
generic (
c_clkfreq		: integer := 100_000_000;
c_baudrate		: integer := 115_200
);
port (
clk				: in std_logic;
rx_i			: in std_logic;
dout_o			: out std_logic_vector (7 downto 0);
rx_done_tick_o	: out std_logic
);
end component;

component synchonizer is
generic (
c_ff_number	: integer := 3
);
Port ( 
clk 	: in STD_LOGIC;
data_i 	: in STD_LOGIC;
data_o 	: out STD_LOGIC
);
end component;

signal rx_done_tick		: std_logic 						:= '0';
signal rx_done_tick_2	: std_logic 						:= '0';
signal rx_sync			: std_logic 						:= '1';
signal dout				: std_logic_vector (7 downto 0) 	:= (others => '0');
signal leds	 			: std_logic_vector (15 downto 0) 	:= (others => '0');

begin	

rx_sync_i : synchonizer
generic map(
c_ff_number	=> 3
)
Port map( 
clk 	=> clk       ,
data_i 	=> rx_i      ,
data_o 	=> rx_sync
);

uart_rx_i : uart_rx
generic map(
c_clkfreq		=> 100_000_000,
c_baudrate		=> 2_000_000
)
port map(
clk				=> clk				,
rx_i			=> rx_i			    ,
dout_o			=> dout			    ,
rx_done_tick_o	=> rx_done_tick
);

uart_rx_sync : uart_rx
generic map(
c_clkfreq		=> 100_000_000,
c_baudrate		=> 2_000_000
)
port map(
clk				=> clk				,
rx_i			=> rx_sync			    ,
dout_o			=> open			    ,
rx_done_tick_o	=> rx_done_tick_2
);

process (clk) begin
if (rising_edge(clk)) then

	if (rx_done_tick = '1' and rx_done_tick_2 = '1') then
		if (btn_i = '0') then
			leds	<= leds + 1;
		else
			leds	<= leds - 1;
		end if;
	end if;

end if;
end process;

leds_o	<= leds;

end Behavioral;