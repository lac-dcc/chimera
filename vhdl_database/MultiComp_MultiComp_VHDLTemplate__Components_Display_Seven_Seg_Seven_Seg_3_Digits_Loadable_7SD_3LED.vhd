---------------------------------------------------------------------------------------------
-- File - Loadable_7SD_3LED.vhd
-- Taken from fpga4student.com
-- https://www.fpga4student.com/2017/09/vhdl-code-for-seven-segment-display.html
-- VHDL code for seven-segment display
--  A
-- F B
--  G
-- E C
--  D
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Loadable_7SD_3LED is
    Port ( i_clock_50Mhz 			: in STD_LOGIC;								-- 50 MHz clock
           i_reset 					: in STD_LOGIC; 								-- i_reset active-high
			  i_displayed_number 	: in STD_LOGIC_VECTOR (11 downto 0);	-- 3 digits
           o_Anode_Activate 		: out STD_LOGIC_VECTOR (2 downto 0);	-- 3 Anode signals
           o_LED_out 				: out STD_LOGIC_VECTOR (7 downto 0));	-- Cathode patterns of 7-segment display
end Loadable_7SD_3LED;

architecture Behavioral of Loadable_7SD_3LED is
signal w_LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal w_refresh_counter: STD_LOGIC_VECTOR (19 downto 0);	-- creating 10.5ms refresh period
signal w_LED_activating_counter: std_logic_vector(1 downto 0);
-- the other 2-bit for creating 4 LED-activating signals
-- count         0    ->  1  ->  2  ->  3
-- activates    LED1    LED2   LED3   LED4
-- and repeat
begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
process(w_LED_BCD)
begin
    case w_LED_BCD is		--	 .gfedcba
    when x"0" => o_LED_out <= "11000000"; -- "0" - bit order is dp, g through a
    when x"1" => o_LED_out <= "11111001"; -- "1" 
    when x"2" => o_LED_out <= "10100100"; -- "2" 
    when x"3" => o_LED_out <= "10110000"; -- "3" 
    when x"4" => o_LED_out <= "10011001"; -- "4" 
    when x"5" => o_LED_out <= "10010010"; -- "5" 
    when x"6" => o_LED_out <= "10000010"; -- "6" 
    when x"7" => o_LED_out <= "11111000"; -- "7" 
    when x"8" => o_LED_out <= "10000000"; -- "8"     
    when x"9" => o_LED_out <= "10010000"; -- "9" 
    when x"A" => o_LED_out <= "10100000"; -- a
    when x"B" => o_LED_out <= "10000011"; -- b
    when x"C" => o_LED_out <= "11000110"; -- C
    when x"D" => o_LED_out <= "10100001"; -- d
    when x"E" => o_LED_out <= "10000110"; -- E
    when x"F" => o_LED_out <= "10001110"; -- F
    end case;
end process;
-- 7-segment display controller
-- generate refresh period of 10.5ms
process(i_clock_50Mhz,i_reset)
begin 
    if(i_reset='1') then
        w_refresh_counter <= (others => '0');
    elsif(rising_edge(i_clock_50Mhz)) then
        w_refresh_counter <= w_refresh_counter + 1;
    end if;
end process;
 w_LED_activating_counter <= w_refresh_counter(19 downto 18);
-- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
process(w_LED_activating_counter,i_displayed_number)
begin
    case w_LED_activating_counter is
    when "00" =>
        o_Anode_Activate <= "100"; 
        -- activate LED1 and Deactivate LED2, LED3, LED4
        w_LED_BCD <= i_displayed_number(11 downto 8);
        -- the first hex digit of the 12-bit number
    when "01" =>
        o_Anode_Activate <= "010"; 
        -- activate LED2 and Deactivate LED1, LED3, LED4
        w_LED_BCD <= i_displayed_number(7 downto 4);
        -- the second hex digit of the 12-bit number
    when "10" =>
        o_Anode_Activate <= "001"; 
        -- activate LED3 and Deactivate LED2, LED1, LED4
        w_LED_BCD <= i_displayed_number(3 downto 0);
        -- the third hex digit of the 12-bit number
	when "11" =>
        o_Anode_Activate <= "000"; 
    end case;
end process;
end Behavioral;
