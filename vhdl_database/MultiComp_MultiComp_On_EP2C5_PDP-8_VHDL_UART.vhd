----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Tom Almy
-- 
-- Create Date:    12:35:26 04/19/2014 
-- Design Name: 
-- Module Name:    UART - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART is
    Port ( clk : in  STD_LOGIC;
           rx : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           clear_3 : in  STD_LOGIC;
           load_3 : in  STD_LOGIC;
           dataout_3 : in  STD_LOGIC_VECTOR (7 downto 0);
           ready_3 : out  STD_LOGIC;
           clearacc_3 : out  STD_LOGIC;
           datain_3 : out  STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           clear_4 : in  STD_LOGIC;
           load_4 : in  STD_LOGIC;
           dataout_4 : in  STD_LOGIC_VECTOR (7 downto 0);
           ready_4 : out  STD_LOGIC;
           clearacc_4 : out  STD_LOGIC;
           datain_4 : out  STD_LOGIC_VECTOR (7 downto 0));
end UART;

architecture Behavioral of UART is
constant divisor : integer := 100000000/(9600*16);
signal counter : integer range 0 to divisor-1 := 0;
signal enable : std_logic;
-- receiver
signal rxa, rxb : std_logic := '1';
signal rxshifter : std_logic_vector (7 downto 0) := (others => '0');
signal rx_ready_flag : std_logic := '0';
signal rxcomplete : std_logic;
signal rxcounter : std_logic_vector (7 downto 0) := (others => '0');
signal rxshift : std_logic;
-- transmitter
signal txshifter : std_logic_vector (10 downto 0) := (others => '1');
signal tx_ready_flag : std_logic := '0';
signal txcomplete : std_logic;
signal txcounter : std_logic_vector (7 downto 0) := (others => '0');
signal txshift : std_logic;
signal txstart : std_logic := '0';
begin

process (clk) begin -- generate the slow "clock"
	if rising_edge(clk) then
		if enable = '1' then	
			counter <= 0;
		else	
			counter <= counter + 1;
		end if;
	end if;
end process;
enable <= '1' when counter = divisor-1 else '0';

-- unit 3 (RX, Keyboard and PTR)
clearacc_3 <= '1';
ready_3 <= rx_ready_flag;

process (clk) begin -- receive buffer
	if rising_edge(clk) then
		if rxcomplete = '1' then
			datain_3 <= rxshifter; -- capture the data
		end if;
	end if;
end process;

process (clk) begin -- synchronizer
	if rising_edge(clk) then
		rxa <= rx;
		rxb <= rxa;
	end if;
end process;

process (clk) begin -- RX shift register
	if rising_edge(clk) then
		if rxshift = '1' then	
			rxshifter <= rxb & rxshifter(7 downto 1);
		end if;
	end if;
end process;

process (clk) begin -- RX ready flag
	if rising_edge(clk) then
		if clear_3 = '1' then
			rx_ready_flag <= '0'; -- no data, so ready to receive
		elsif rxcomplete = '1' then
			rx_ready_flag <= '1'; -- got data!
		end if;
	end if;
end process;

process (clk, enable) begin -- state machine for receiver
	if rising_edge(clk) and enable = '1' then
		if rxcounter = 0 then
			if rxb = '0' then -- we may receive now (ignore the flag)
				rxcounter <= "00000001";
			end if;
		elsif rxcounter = 8 and rxb = '1' then -- start bit not detected
			rxcounter <= (others => '0');
		elsif rxcomplete = '1' then -- finished
			rxcounter <= (others => '0');
		else
			rxcounter <= rxcounter + 1;
		end if;
	end if;
end process;
rxshift <= '1' when rxcounter(3 downto 0) = "1000" and enable = '1' else '0';
rxcomplete <= '1' when enable = '1' and rxcounter = 16*9 + 7 -- just shy of shifting the stop bit
			  else '0';
		
-- unit 4 (TX, printer and PTP)
clearacc_4 <= '0';
datain_4 <= "00000000";
process (clk) begin -- tx shift register
	if rising_edge(clk) then
		if load_4 = '1' then -- load value
			txshifter <= "1" & dataout_4 & "01";
		elsif txshift = '1' then
			txshifter <= "1" & txshifter(10 downto 1);
		end if;
	end if;
end process;
tx <= txshifter(0);

process (clk) begin -- TX ready flag
	if rising_edge(clk) then
		if clear_4 = '1' then
			tx_ready_flag <= '0';	-- not ready
		elsif txcomplete = '1' then
			tx_ready_flag <= '1';
		end if;
	end if;
end process;
ready_4 <= tx_ready_flag;

process (clk) begin -- TX Start Flag, starts tranmission
	if rising_edge(clk) then
		if load_4 = '1' then 
			txstart <= '1';
		elsif txcounter /= 0 then
			txstart <= '0';
		end if;
	end if;
end process;

process (clk, enable) begin -- state machine for transmitter
	if rising_edge(clk) and enable = '1' then
		if txcounter = 0 then
			if txstart = '1' then -- start shifting
				txcounter <= "00000001";
			end if;
		elsif txcomplete = '1' then -- finish transmitting
			txcounter <= (others => '0');
	    else				  -- continue operation
	    	txcounter <= txcounter + 1; 
	    end if;
	end if;
end process;
txshift <= '1' when txcounter(3 downto 0) = "0001" and enable = '1' else '0';
txcomplete <= '1' when txcounter = 161 and enable = '1' else '0'; -- right on last shift



end Behavioral;

