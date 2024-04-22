library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.ram_pkg.all;


entity top_1531 is
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
end top_1531;

architecture Behavioral of top_1531 is

	-- uart receiver signals 
	signal databuffer_sig	: std_logic_vector(6*8-1 downto 0) := (others => '0');
	signal dout_o_sig		: std_logic_vector(7 downto 0) 	:= (others => '0');
	signal rx_done_tick		: std_logic	:= '0';
	
	
	-- ram signals
	signal addra : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0) := (others => ('0'));
	signal dina  : std_logic_vector(RAM_WIDTH-1 downto 0)		  	:= (others => ('0'));
	signal wea   : std_logic	                       			  	:= '0';
	signal douta : std_logic_vector(RAM_WIDTH-1 downto 0)   		:= (others => ('0'));
	
	-- state declarations
	type states is (S_IDLE, S_COMMAND, S_OKU, S_YAZ, S_TRANSMIT);
	signal state : states := S_IDLE;
	
	
	signal checksum : std_logic_vector(1*8-1 downto 0) := (others => '0');
	signal cntr 	: integer range 0 to 7 := 0;
	
	
	-- uart transmitter signals
	signal din_i			: std_logic_vector (7 downto 0)	:= (others => ('0'));
	signal tx_start_i		: std_logic 	                := '0';
    signal tx_done_tick_o	: std_logic                     := '0';
begin

-- entity instantiation for uart_rx
uart_rx_ins: entity work.uart_rx(Behavioral)
generic map(
c_clkfreq		=> c_clkfreq,
c_baudrate		=> c_baudrate
)
port map(
clk				=> clk,
rx_i			=> rx_i,
dout_o			=> dout_o_sig,
rx_done_tick_o	=> rx_done_tick
);

-- entity instantiation for block ram
block_ram_ins : entity work.block_ram(Behavioral)
generic map(
RAM_WIDTH 		=> RAM_WIDTH,
RAM_DEPTH 		=> RAM_DEPTH,
RAM_PERFORMANCE => RAM_PERFORMANCE
)
port map(
addra => addra ,
dina  => dina  ,
clka  => clk   ,
wea   => wea   ,
douta => douta
);


-- entity instantiation for uart_tx
uart_tx_ins : entity work.uart_tx(Behavioral)
generic map(
c_clkfreq		=> c_clkfreq	,
c_baudrate		=> c_baudrate	,
c_stopbit		=> c_stopbit	
)
port map(
clk				=> clk			,	
din_i			=> din_i		,	
tx_start_i		=> tx_start_i	,	
tx_o			=> tx_o			,
tx_done_tick_o	=> tx_done_tick_o
);


P_MAIN : process(clk) begin
	
if (rising_edge(clk)) then
	
	case state is 
	
		when S_IDLE => 
		
			cntr 	<= 0;
			wea		<= '1';
			interrupt	<= '0';
		
			if (rx_done_tick = '1') then
				databuffer_sig	<= databuffer_sig(5*8-1 downto 0*8) & dout_o_sig;
				checksum		<= checksum + databuffer_sig(7 downto 0);
			end if;
						
			if (databuffer_sig(6*8-1 downto 4*8) = x"ABCD") then
							
								
				if (databuffer_sig(1*8-1 downto 0*8) = checksum) then
					state	<= S_COMMAND;
				else
					databuffer_sig						<= x"ABCDEE000066";
					state								<= S_TRANSMIT;
					cntr 								<= 5;
					din_i								<= x"AB";
					tx_start_i							<= '1';
				end if;	
				
			end if;
			
			
		
		when S_COMMAND =>
		
			if (databuffer_sig(4*8-1 downto 3*8) = x"11") then -- yaz komutu
				state	<= S_YAZ;
				databuffer_sig(4*8-1 downto 3*8)	<= x"33";
			end if;
				
			if (databuffer_sig(4*8-1 downto 3*8) = x"22") then -- oku komutu 
				state	<= S_OKU;
				databuffer_sig(4*8-1 downto 3*8)	<= x"44";
			end if;
			
		
		
		when S_YAZ =>
		
			
			addra	<= databuffer_sig(3*8-1 downto 2*8);
			dina	<= databuffer_sig(2*8-1 downto 1*8);
			wea		<= '1';
			
			databuffer_sig(1*8-1 downto 0*8)	<= 	databuffer_sig(6*8-1 downto 5*8) + databuffer_sig(5*8-1 downto 4*8) + 
													databuffer_sig(4*8-1 downto 3*8) + databuffer_sig(3*8-1 downto 2*8) +
													databuffer_sig(2*8-1 downto 1*8);
			
			state	<= S_TRANSMIT;
			cntr 								<= 5;
			din_i								<= databuffer_sig(6*8-1 downto 5*8);
			tx_start_i							<= '1';
			
			
			
			
		when S_OKU =>
			
			addra	<= databuffer_sig(3*8-1 downto 2*8);
			cntr	<= cntr + 1;
			
			if (cntr = 1) then
				
				databuffer_sig(2*8-1 downto 1*8)	<= douta;
				
				databuffer_sig(1*8-1 downto 0*8)	<= 	databuffer_sig(6*8-1 downto 5*8) + databuffer_sig(5*8-1 downto 4*8) + 
														databuffer_sig(4*8-1 downto 3*8) + databuffer_sig(3*8-1 downto 2*8) + 
														douta;
				
				state								<= S_TRANSMIT;
				cntr 								<= 5;
				din_i								<= databuffer_sig(6*8-1 downto 5*8);
				tx_start_i							<= '1';
				
			end if;


		when S_TRANSMIT =>
		
			wea		<= '0';
					
			if (cntr = 0) then
				tx_start_i	<= '0';
				
				if (tx_done_tick_o = '1') then
					state			<= S_IDLE;
					interrupt		<= '1';
					databuffer_sig	<= (others => '0');
					checksum		<= (others => '0');
				end if;
				
			else
				din_i		<= databuffer_sig(cntr*8-1 downto (cntr-1)*8);
				
				if (tx_done_tick_o = '1') then
					cntr	<= cntr - 1;
				end if;				
			end if;

	end case;
end if;
end process;


end Behavioral;
