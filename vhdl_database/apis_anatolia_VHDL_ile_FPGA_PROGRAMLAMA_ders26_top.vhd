library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
generic (
c_clkfreq 	: integer 	:= 100_000_000;
-- spi
c_sclkfreq 	: integer 	:= 1_000_000;
c_cpol		: std_logic := '0';
c_cpha		: std_logic := '0';
-- ADXL362
c_readfreq	: integer 	:= 2;
-- uart
c_baudrate	: integer 	:= 115_200;
c_stopbit	: integer 	:= 2
);
port (
clk			: in std_logic;
miso_i 		: in std_logic;
mosi_o 		: out std_logic;
sclk_o 		: out std_logic;
cs_o 		: out std_logic;
tx			: out std_logic
);
end top;

architecture Behavioral of top is

component ADXL362 is
generic (
c_clkfreq 	: integer := 100_000_000;
c_sclkfreq 	: integer := 1_000_000;
c_readfreq	: integer := 100;
c_cpol		: std_logic := '0';
c_cpha		: std_logic := '0'
);
Port ( 
clk_i 		: in STD_LOGIC;
miso_i 		: in STD_LOGIC;
mosi_o 		: out STD_LOGIC;
sclk_o 		: out STD_LOGIC;
cs_o 		: out STD_LOGIC;
ax_o 		: out STD_LOGIC_VECTOR (15 downto 0);
ay_o 		: out STD_LOGIC_VECTOR (15 downto 0);
az_o 		: out STD_LOGIC_VECTOR (15 downto 0);
ready_o		: out STD_LOGIC
);
end component;

component uart_tx is
generic (
c_clkfreq		: integer := 100_000_000;
c_baudrate		: integer := 115_200;
c_stopbit		: integer := 2
);
port (
clk				: in std_logic;
din_i			: in std_logic_vector (7 downto 0);
tx_start_i		: in std_logic;
tx_o			: out std_logic;
tx_done_tick_o	: out std_logic
);
end component;

signal ax			: std_logic_vector (15 downto 0)	:= (others => '0');
signal ay			: std_logic_vector (15 downto 0)	:= (others => '0');
signal az			: std_logic_vector (15 downto 0)	:= (others => '0');
signal din			: std_logic_vector (7 downto 0)		:= (others => '0');
signal tx_buffer	: std_logic_vector (6*8-1 downto 0)	:= (others => '0');

signal ready		: std_logic	:= '0';
signal tx_start		: std_logic	:= '0';
signal tx_done_tick	: std_logic	:= '0';
signal sent_trig	: std_logic	:= '0';

signal cntr			: integer range 0 to 7 := 0;

begin

ADXL362_i : ADXL362
generic map(
c_clkfreq 	=> c_clkfreq 	,
c_sclkfreq 	=> c_sclkfreq 	,
c_readfreq	=> c_readfreq	,
c_cpol		=> c_cpol		,
c_cpha		=> c_cpha		
)
port map( 
clk_i 		=> clk          ,
miso_i 		=> miso_i 	    ,
mosi_o 		=> mosi_o 	    ,
sclk_o 		=> sclk_o 	    ,
cs_o 		=> cs_o 	    ,
ax_o 		=> ax           ,
ay_o 		=> ay           ,
az_o 		=> az           ,
ready_o		=> ready
);

uart_tx_i : uart_tx
generic map(
c_clkfreq	=> c_clkfreq	,
c_baudrate	=> c_baudrate	,
c_stopbit	=> c_stopbit	
)
port map(
clk				=> clk,
din_i			=> din,
tx_start_i		=> tx_start,
tx_o			=> tx,
tx_done_tick_o	=> tx_done_tick
);

P_MAIN	: process (clk) begin
if (rising_edge(clk)) then
	
	if (ready = '1') then
		tx_buffer	<= ax & ay & az;
		cntr		<= 6;
		sent_trig	<= '1';
	end if;
	
	din <= tx_buffer(6*8-1 downto 5*8);
	
	if (sent_trig = '1') then
		if (cntr = 6) then
			-- din							<= tx_buffer(6*8-1 downto 6*8);
			tx_start					<= '1';
			tx_buffer(6*8-1 downto 8)	<= tx_buffer(5*8-1 downto 0);
			cntr						<= cntr - 1;	
		elsif (cntr = 0) then
			tx_start	<= '0';
			if (tx_done_tick = '1') then
				sent_trig	<= '0';
			end if;
		else
			-- din <= tx_buffer(6*8-1 downto 6*8);
			if (tx_done_tick = '1') then
				cntr						<= cntr - 1;
				tx_buffer(6*8-1 downto 8)	<= tx_buffer(5*8-1 downto 0);
			end if;
		end if;
	end if;

end if;
end process P_MAIN;

end Behavioral;