----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Module Name:    tmds_decode - Behavioral 
--
-- Description: TMDS decode as per Digital Display Working Groups Digital Visual 
--              Interface Revision 1.0 section 3.3.3
--
-- This doesn't seem 100% correct - "elsif sometimes_inverted(8) = '0' then" should
-- be "elsif sometimes_inverted(8) = '1' then" according to the standard.
-- 
-- However it does actually work!
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tmds_decode is
    Port ( clk         : in  STD_LOGIC;
           data_in     : in  STD_LOGIC_VECTOR (9 downto 0);
           data_out    : out  STD_LOGIC_VECTOR (7 downto 0);
           c           : out  STD_LOGIC_VECTOR (1 downto 0);
           active_data : out std_logic);
end tmds_decode;

architecture Behavioral of tmds_decode is
   signal data_delayed       : STD_LOGIC_VECTOR(9 downto 0);
   signal sometimes_inverted : STD_LOGIC_VECTOR(8 downto 0);
   signal next_c             : STD_LOGIC_VECTOR(1 downto 0);
   signal next_active_data   : STD_LOGIC;
begin
   
process(clk)
   begin
      if rising_edge(clk) then
      
         c           <= next_c;
         active_data <= next_active_data;
 
         if next_active_data = '0' then
            data_out <= (others => '0');
         elsif sometimes_inverted(8) = '0' then
            data_out(0) <= sometimes_inverted(0);
            data_out(1) <= sometimes_inverted(1) XOR sometimes_inverted(0);
            data_out(2) <= sometimes_inverted(2) XOR sometimes_inverted(1);
            data_out(3) <= sometimes_inverted(3) XOR sometimes_inverted(2);
            data_out(4) <= sometimes_inverted(4) XOR sometimes_inverted(3);
            data_out(5) <= sometimes_inverted(5) XOR sometimes_inverted(4);
            data_out(6) <= sometimes_inverted(6) XOR sometimes_inverted(5);
            data_out(7) <= sometimes_inverted(7) XOR sometimes_inverted(6);
         else
            data_out(0) <= sometimes_inverted(0);
            data_out(1) <= sometimes_inverted(1) XNOR sometimes_inverted(0);
            data_out(2) <= sometimes_inverted(2) XNOR sometimes_inverted(1);
            data_out(3) <= sometimes_inverted(3) XNOR sometimes_inverted(2);
            data_out(4) <= sometimes_inverted(4) XNOR sometimes_inverted(3);
            data_out(5) <= sometimes_inverted(5) XNOR sometimes_inverted(4);
            data_out(6) <= sometimes_inverted(6) XNOR sometimes_inverted(5);
            data_out(7) <= sometimes_inverted(7) XNOR sometimes_inverted(6);
         end if;
 
         if data_delayed(9) = '1' then
            sometimes_inverted <= data_delayed(8 downto 0) xor "011111111";
         else
            sometimes_inverted <= data_delayed(8 downto 0);
         end if;
 
         case data_in is
            when "0010101011" => next_c <= "01"; next_active_data <= '0';
            when "1101010100" => next_c <= "00"; next_active_data <= '0';
            when "0101010100" => next_c <= "10"; next_active_data <= '0';
            when "1010101011" => next_c <= "11"; next_active_data <= '0';
            when others       => next_c <= "00"; next_active_data <= '1';
         end case;
         
         data_delayed <= data_in;
      end if;
   end process;
end Behavioral;
