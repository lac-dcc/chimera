library ieee;
use ieee.std_logic_1164.all;

package ram_pkg is
    function clogb2 (depth: in natural) return integer;
end ram_pkg;

package body ram_pkg is

function clogb2( depth : natural) return integer is
variable temp    : integer := depth;
variable ret_val : integer := 0;
begin
    while temp > 1 loop
        ret_val := ret_val + 1;
        temp    := temp / 2;
    end loop;
  	return ret_val;
end function;

end package body ram_pkg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ram_pkg.all;

entity top is
generic (
c_clkfreq		: integer 	:= 100_000_000;
c_baudrate		: integer 	:= 115_200;
c_stopbit		: integer 	:= 2;
RAM_WIDTH 		: integer 	:= 16;				-- Specify RAM data width
RAM_DEPTH 		: integer 	:= 128;				-- Specify RAM depth (number of entries)
RAM_PERFORMANCE : string 	:= "LOW_LATENCY";    -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
C_RAM_TYPE 		: string 	:= "block"    -- Select "block" or "distributed" 
);
port (
clk				: in std_logic;
rx_i			: in std_logic;
tx_o			: out std_logic
);
end top;

architecture Behavioral of top is

component block_ram is
generic (
RAM_WIDTH 		: integer 	:= 16;				-- Specify RAM data width
RAM_DEPTH 		: integer 	:= 128;				-- Specify RAM depth (number of entries)
RAM_PERFORMANCE : string 	:= "LOW_LATENCY";    -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
-- RAM_PERFORMANCE : string 	:= "HIGH_PERFORMANCE";    -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY"
C_RAM_TYPE 		: string 	:= "block"    -- Select "block" or "distributed" 
-- C_RAM_TYPE 		: string 	:= "distributed"    -- Select "block" or "distributed" 
);
port (
addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);    -- Address bus, width determined from RAM_DEPTH
dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);		  		-- RAM input data
clka  : in std_logic;                       			  		-- Clock
wea   : in std_logic;                       			  		-- Write enable
douta : out std_logic_vector(RAM_WIDTH-1 downto 0)   			-- RAM output data
);
end component;

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

signal dout_o 			: std_logic_vector (7 downto 0) := (others => '0');
signal din_i 			: std_logic_vector (7 downto 0) := (others => '0');
signal rx_done_tick_o 	: std_logic := '0';
signal tx_done_tick_o 	: std_logic := '0';
signal tx_start_i 		: std_logic := '0';

-- bram signals
signal addra 			: std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);    
signal dina  			: std_logic_vector(RAM_WIDTH-1 downto 0);
signal wea   			: std_logic;  
signal douta 			: std_logic_vector(RAM_WIDTH-1 downto 0) ;              

type states is (S_IDLE, S_OKU, S_YAZ, S_TRANSMIT);
signal state : states := S_IDLE;

signal databuffer : std_logic_vector (4*8-1 downto 0) := (others => '0');

signal cntr			: integer range 0 to 255 := 0;

begin

i_uart_rx : uart_rx
generic map(
c_clkfreq		=> c_clkfreq,
c_baudrate		=> c_baudrate
)
port map(
clk				=> clk,
rx_i			=> rx_i,
dout_o			=> dout_o,
rx_done_tick_o	=> rx_done_tick_o
);

i_uart_tx : uart_tx
generic map(
c_clkfreq		=> c_clkfreq	,
c_baudrate		=> c_baudrate	,
c_stopbit		=> c_stopbit	
)
port map(
clk				=> clk,
din_i			=> din_i,
tx_start_i		=> tx_start_i,
tx_o			=> tx_o,
tx_done_tick_o	=> tx_done_tick_o
);

ram128x16 : block_ram
generic map(
RAM_WIDTH 		=> RAM_WIDTH 		  ,
RAM_DEPTH 		=> RAM_DEPTH 		  ,
RAM_PERFORMANCE => RAM_PERFORMANCE    ,
C_RAM_TYPE 		=> C_RAM_TYPE 		
)
port map(
addra => addra    ,
dina  => dina     ,
clka  => clk      ,
wea   => wea      ,
douta => douta
);

P_MAIN : process (clk) begin
if (rising_edge(clk)) then

	case state is
		
		when S_IDLE =>
		
			wea		<= '0';
			cntr	<= 0;
		
			if (rx_done_tick_o = '1') then
				databuffer(7 downto 0) 			<= dout_o;
				databuffer(4*8-1 downto 1*8) 	<= databuffer(3*8-1 downto 0*8);
			end if;
			
			if (databuffer(4*8-1 downto 3*8) = x"0A") then	-- yaz komutu
				state	<= S_YAZ;
			end if;
			
			if (databuffer(4*8-1 downto 3*8) = x"0B") then	-- oku komutu
				state	<= S_OKU;
			end if;
		
		when S_YAZ =>
		
			addra		<= databuffer(3*8-2 downto 2*8);
			dina		<= databuffer(2*8-1 downto 0*8);
			wea			<= '1';
			state		<= S_IDLE;
			databuffer	<= (others => '0');
		
		when S_OKU =>
		
			addra	<= databuffer(3*8-2 downto 2*8);
			cntr	<= cntr + 1;
			if (cntr = 1) then
				databuffer(2*8-1 downto 0*8)	<= douta;
				state							<= S_TRANSMIT;	
				cntr							<= 3;
				din_i							<= databuffer(4*8-1 downto 3*8);
				tx_start_i						<= '1';
			end if;
		
		when S_TRANSMIT => 
			
			if (cntr = 0) then
				tx_start_i	<= '0';
				if (tx_done_tick_o = '1') then
					state		<= S_IDLE;
					databuffer	<= (others => '0');
				end if;
			else
				din_i		<= databuffer(cntr*8-1 downto (cntr-1)*8);
				if (tx_done_tick_o = '1') then
					cntr	<= cntr - 1;
				end if;				
			end if;
		
	end case;

end if;
end process;


end Behavioral;