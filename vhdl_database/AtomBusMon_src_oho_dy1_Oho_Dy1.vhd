----------------------------------------------------------------------------------
-- Company:        OHO-Elektronik
-- Engineer:       M.Randelzhofer
-- 
-- Create Date:    20:55:43 02/02/2009 
-- Design Name: 
-- Module Name:    Oho_Dy1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.00 - File Created
-- Revision 1.01 - Brightness support
-- Revision 1.02 - Added display test
-- Revision 1.03 - display update support, new interface signal names

-- Additional Comments: 
-- Dispay module OHO_DY1 core
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;
use work.OhoPack.all ;

entity Oho_Dy1 is
Port (
  dy_clock:         in std_logic ;
  dy_rst_n:         in std_logic ;
  dy_data:          in y2d_type ;
  dy_update:        in std_logic ;
  dy_frame:         out std_logic ;
  dy_frameend:      out std_logic ;
  dy_frameend_c:    out std_logic ;
  dy_pwm:           in std_logic_vector(3 downto 0) ;
  dy_counter:       out std_logic_vector(31 downto 0) ;
  dy_sclk:          out std_logic ;
  dy_ser:           out std_logic ;
  dy_rclk:          out std_logic
) ;
end Oho_Dy1 ;

-- display core for OHO_DY1 module
architecture Behavioral of Oho_Dy1 is

signal sclk:                            std_logic ;
signal ser:                             std_logic ;
signal rclk:                            std_logic ;
signal frameend:                        std_logic ;
signal frameend_q:                      std_logic ;
signal frameend_c:                      std_logic ;
signal frame:                           std_logic ;

signal actualdigit:	                    std_logic_vector (8 downto 0) ;
signal dupcnt:	                        std_logic_vector (11 downto 0) ;
signal displaycounter:	                std_logic_vector (31 downto 0) ;

begin

-- display up to 15 digits on 5 stacked OHO_DY1 modules
Display_Proc: process(dy_clock,dy_rst_n)
begin
  if (dy_rst_n = '0') then
-- init signals on reset
    displaycounter <= (others => '0') ;
    dupcnt <= (others => '0') ;
    frame <= '0' ;
    frameend <= '1' ;
    frameend_q <= '1' ;
    frameend_c <= '0' ;
    sclk <= '0' ;
    ser <= '0' ;
    rclk <= '1' ;
  elsif rising_edge(dy_clock) then
-- use a free running binary counter as a timing source
    displaycounter <= std_logic_vector(unsigned(displaycounter) + 1) ;
-- start of display frame
-- generate frame and rising edge of rclk
    if (displaycounter(15 downto 0) = X"0000") then
-- decrease display update counter dupcnt
      if (dupcnt /= X"000") then
        dupcnt <= std_logic_vector(unsigned(dupcnt) - 1) ;
        frame <= '1' ;     -- indicate start of display frame
        frameend <= '0' ;  -- inactivate frameend
      else
        frame <= '0' ;     -- indicate end of sclk/ser, rclk still active
      end if ;
-- generate rclk rising edge
      if (frame = '1') then
        rclk <= '1' ;
      end if ;
    else
-- remaining display frame
      if (frame = '0') then
-- display frame end, set rclk low on next sclk rising
        if (displaycounter(8) = '1') then
          rclk <= '0' ;
          frameend <= '1' ;
        end if ;
      else
-- display frame continues with PWM brightness control
        if (displaycounter(15 downto 12) = not dy_pwm) and (displaycounter(8) = '1') then
          rclk <= '0' ;
        end if ;
      end if ;
    end if ;
-- setup display update counter (must be after dupcnt-1 statement)
    if (dy_update = '1') then -- display update
		  dupcnt <= DupVal ;
    end if ;
-- use dy_clock/256 as shift register clock
    sclk <= frame and displaycounter(8) ;
-- feed display data from function SerialHexDecode in OhoPack.vhd
    ser <= frame and not SerialHexDecode(displaycounter(11 downto 9),actualdigit) ;
-- digit data 16:1 mux
    case displaycounter(15 downto 12) is
-- first shift out 16. digit, normally not used
      when "0000" => actualdigit <= "000000000" ; -- blank
-- 15. digit is on the 5.th stacked module on the left side
      when "0001" => actualdigit <= dy_data(14) ;
-- 14. digit is on the 5.th stacked module in the middle
      when "0010" => actualdigit <= dy_data(13) ;
-- 13. digit is on the 5.th stacked module on the right side
      when "0011" => actualdigit <= dy_data(12) ;
      when "0100" => actualdigit <= dy_data(11) ;
      when "0101" => actualdigit <= dy_data(10) ;
      when "0110" => actualdigit <= dy_data(9) ;
      when "0111" => actualdigit <= dy_data(8) ;
      when "1000" => actualdigit <= dy_data(7) ;
      when "1001" => actualdigit <= dy_data(6) ;
      when "1010" => actualdigit <= dy_data(5) ;
      when "1011" => actualdigit <= dy_data(4) ;
      when "1100" => actualdigit <= dy_data(3) ;
      when "1101" => actualdigit <= dy_data(2) ;
      when "1110" => actualdigit <= dy_data(1) ;
-- first digit on the first module on the right side
      when "1111" => actualdigit <= dy_data(0) ;
      
      when others =>
    end case ;
-- generate single frameend clock pulse
    frameend_q <= frameend ;
    if Rise(frameend,frameend_q) then
      frameend_c <= '1' ;
    else
      frameend_c <= '0' ;
    end if ;
-- use output registers for the display signals
    dy_sclk <= sclk ;
    dy_ser <= ser ;
    dy_rclk <= rclk ;
  end if ;
end process ;

-- making internal signals externally available
dy_counter <= displaycounter ;
dy_frame <= frame ;
dy_frameend <= frameend_q ;
dy_frameend_c <= frameend_c ;


end Behavioral;

