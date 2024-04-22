----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Tom Almy 
-- 
-- Create Date:    July 24, 2014
-- Design Name:    Nexys4 implementation of the PDP8 Front panel
-- Module Name:    Panel - Behavioral 
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

entity Panel is
	PORT(
		clk : IN std_logic;
		dispout : IN std_logic_vector(11 downto 0);
		linkout : IN std_logic;
		halt : IN std_logic;
		swreg : OUT std_logic_vector(11 downto 0);
		dispsel : OUT std_logic_vector(1 downto 0);
		run : OUT std_logic;
		loadpc : OUT std_logic;
		loadac : OUT std_logic;
		step : OUT std_logic;
		deposit : OUT std_logic;
		sw : in std_logic_vector(15 downto 0);   -- SW 15 is Run/Stop. 
												 -- SW 12 loads link with load AC button (eventually)
												 -- SW 11 to SW 0 is Switch Register
		btnc : in std_logic;                     -- display select button
		btnu : in std_logic;                     -- step button
		btnd : in std_logic;                     -- deposit button
		btnl : in std_logic;                     -- load PC button
		btnr : in std_logic;                     -- load AC button
		btnCpuReset : in std_logic;				  -- master reset
		reset : out std_logic;
		led : OUT std_logic_vector(15 downto 0); -- led 15 is Running light, 3 to 0 is selection
		seg : OUT std_logic_vector(7 downto 0);  -- four now we just use 4 of 8 digits.
		an : OUT std_logic_vector(7 downto 0)
		);
end Panel;

architecture Behavioral of Panel is
signal cath_drive : std_logic_vector (2 downto 0);
signal dig_counter : std_logic_vector (19 downto 0) := (others => '0');
signal digit_mux : std_logic_vector (1 downto 0);
signal sw1 : std_logic_vector (11 downto 0);
signal rs1, rs, ss1, ss2, ss, lpc1, lpc2, lpc, dep1, dep2, dep, ds2, ds1, ds : std_logic := '0';
signal lac1, lac2, lac : std_logic := '0';
signal rsdb, ssdb, lpcdb, depdb, lacdb, dsdb : std_logic := '0';
signal dispstep  : std_logic := '0';
signal dispselcnt : std_logic_vector (1 downto 0) := "00";
type RUNSTOPSTATE is (RSSTOPPED, RSRUN, RSSTOPPING);
signal rs_state : RUNSTOPSTATE := RSSTOPPED;
signal prereset, resetout : std_logic := '0';
begin
	led (14 downto 4) <= (others => '0');
	an (7 downto 4) <= (others => '1');

-- Synchronizing

reset <= resetout;	


	process (clk) begin
		if rising_edge(clk) then
			prereset <= not btnCpuReset;
			resetout <= prereset; -- Make this non-inverted
			rs1 <= sw(15);
			rs <= rs1;
			ss1 <= btnu;
			ss <= ss1;
			lpc1 <= btnl;
			lpc <= lpc1;
			dep1 <= btnd;
			dep <= dep1;
			ds1 <= btnc;
			ds <= ds1;
			lac1 <= btnr;
			lac <= lac1;
			sw1 <= sw(11 downto 0); -- switches for switch register
			swreg <= sw1;
		end if;
	end process;
	
	
-- Debounce for pushbuttons and run/stop switch	 NEEDED
	
	process (clk) begin
		if rising_edge(clk) then
			if dig_counter(17 downto 0) = 0 then
				rsdb <= rs;
				ssdb <= ss;
				lpcdb <= lpc;
				depdb <= dep;
				lacdb <= lac;
				dsdb <= ds;
			end if;
		end if;
	end process;
	
-- One shots for step, loadpc, and deposit switches.
	process (clk) begin
		if rising_edge(clk) then
		ss2 <= ssdb;
		step <= ssdb and not ss2;
		lpc2 <= lpcdb;
		loadpc <= lpcdb and not lpc2;
		dep2 <= depdb;
		deposit <= depdb and not dep2;
		ds2 <= dsdb;
		dispstep <= dsdb and not ds2;
		lac2 <= lacdb;
		loadac <= lacdb and not lac2;
	   end if;
	end process;
-- Display selection
	process (clk) begin 
		if rising_edge(clk) then
			if dispstep = '1' then
				dispselcnt <= dispselcnt + 1;
			end if;
		end if;
	end process;
	dispsel <= dispselcnt;
	led(3) <= '1' when dispselcnt = 0 else '0';
	led(2) <= '1' when dispselcnt = 1 else '0';
	led(1) <= '1' when dispselcnt = 2 else '0';
	led(0) <= '1' when dispselcnt = 3 else '0';
-- Run/Stop Switch
	process (clk) begin
		if rising_edge(clk) then
			case rs_state is
				when RSSTOPPED => if rsdb = '1' then rs_state <= RSRUN; end if;
				when RSRUN => if rsdb = '0' then rs_state <= RSSTOPPED;
							     elsif halt = '1' then rs_state <= RSSTOPPING; -- cannot stop until switch moved
								  end if;
				when RSSTOPPING => if rsdb = '0' then rs_state <= RSSTOPPED; end if;
				when others => rs_state <= RSSTOPPED;
			end case;
		end if;
	end process;
	run <= '1' when rs_state = RSRUN else '0';
	led(15) <= '1' when rs_state = RSRUN else '0';
-- The Seven Segment Display
	process (clk) begin
		if rising_edge(clk) then
			dig_counter <= dig_counter+1;
		end if;
	end process;
	digit_mux <= dig_counter(19 downto 18);
	an(3) <= '0' when digit_mux = 3 else '1';
	an(2) <= '0' when digit_mux = 2 else '1';
   an(1) <= '0' when digit_mux = 1 else '1';
   an(0) <= '0' when digit_mux = 0 else '1';

	cath_drive <= dispout(2 downto 0) when digit_mux = 0 else
					  dispout(5 downto 3) when digit_mux = 1 else
					  dispout(8 downto 6) when digit_mux = 2 else
					  dispout(11 downto 9);
	
	seg(6 downto 0) <= "1000000" when cath_drive = 0 else 
				  "1111001" when cath_drive = 1 else
				  "0100100" when cath_drive = 2 else
				  "0110000" when cath_drive = 3 else
				  "0011001" when cath_drive = 4 else
				  "0010010" when cath_drive = 5 else
				  "0000010" when cath_drive = 6 else
				  "1111000" when cath_drive = 7 else
				  "1111111";
	seg(7) <= (not linkout) when digit_mux = 0 else '1';  -- Link bit is decimal point on leftmost digit


end Behavioral;

