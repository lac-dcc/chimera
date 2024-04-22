----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Tom Almy 
-- 
-- Create Date:    10:46:38 04/19/2014 
-- Design Name: 
-- Module Name:    Panel_phoney - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Panel_Phoney is
    Port ( clk : in  STD_LOGIC;
           dispout : in  STD_LOGIC_VECTOR (11 downto 0);
           linkout : in  STD_LOGIC;
           halt : in  STD_LOGIC;
           swreg : out  STD_LOGIC_VECTOR (11 downto 0);
           dispsel : out  STD_LOGIC_VECTOR (1 downto 0);
           run : out  STD_LOGIC;
           loadpc : out  STD_LOGIC := '0';
			  loadac : out  STD_LOGIC := '0'; -- Added
           step : out  STD_LOGIC := '0';
           deposit : out  STD_LOGIC := '0';
		sw : in std_logic_vector(15 downto 0);   -- SW 15 is Run/Stop. 
												 -- SW 12 loads link with load AC button (eventually)
												 -- SW 11 to SW 0 is Switch Register
		btnc : in std_logic;                     -- display select button
		btnu : in std_logic;                     -- step button
		btnd : in std_logic;                     -- deposit button
		btnl : in std_logic;                     -- load PC button
		btnr : in std_logic;                     -- load AC button
		btnCpuReset : in std_logic;
		reset : out std_logic;
           led : out  STD_LOGIC_VECTOR (15 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (7 downto 0));
end Panel_Phoney;

architecture Behavioral of Panel_Phoney is
type RUNSTOPSTATE is (RSSTOPPED, RSRUN, RSSTOPPING);
signal rs_state : RUNSTOPSTATE := RSSTOPPED;
signal rs : std_logic := '0'; -- runstop switch
signal prereset, resetout : std_logic := '0';
begin
swreg <= "000010000000"; -- 200 (start address)
dispsel <= "00";
led <= (others => '0');
seg <= (others => '1');
an <= (others => '1');

	process (clk) begin -- Synchronize reset signal
		if rising_edge(clk) then
			prereset <= not btnCpuReset;
			resetout <= prereset; -- Make this non-inverted
		end if;
	end process;
reset <= resetout;	


-- Run/Stop Switch
	process (clk) begin
		if rising_edge(clk) then
			case rs_state is
				when RSSTOPPED => if rs = '1' then rs_state <= RSRUN; end if;
				when RSRUN => if rs = '0' then rs_state <= RSSTOPPED;
							     elsif halt = '1' then rs_state <= RSSTOPPING; -- cannot stop until switch moved
								  end if;
				when RSSTOPPING => if rs = '0' then rs_state <= RSSTOPPED; end if;
				when others => rs_state <= RSSTOPPED;
			end case;
		end if;
	end process;
run <= '1' when rs_state = RSRUN else '0';

process begin
	wait for 130 us; -- stimulus goes here
	wait until falling_edge(clk);
	loadpc <= '1';
	wait until falling_edge(clk);
	loadpc <= '0';
	wait until falling_edge(clk);
	rs <= '1';
	wait until halt = '1';
	rs <= '0';
	wait for 10 ms; -- done with simulation
end process;

end Behavioral;

