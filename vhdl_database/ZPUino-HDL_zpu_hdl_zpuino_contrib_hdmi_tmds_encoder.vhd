----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: TMDS Encoder 
--     8 bits colour, 2 control bits and one blanking bits in
--       10 bits of TMDS encoded data out
--     Clocked at the pixel clock
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TMDS_encoder is
    generic (
      CHANNEL : integer range 0 to 2 := 0
    );
    Port ( clk     : in  STD_LOGIC;
           data    : in  STD_LOGIC_VECTOR (7 downto 0);
           c       : in  STD_LOGIC_VECTOR (1 downto 0);
           blank   : in  STD_LOGIC;
           guard   : in  STD_LOGIC;
           indata  : in  STD_LOGIC;
           encoded : out  STD_LOGIC_VECTOR (9 downto 0));
end TMDS_encoder;

architecture Behavioral of TMDS_encoder is
   signal xored  : STD_LOGIC_VECTOR (8 downto 0);
   signal xnored : STD_LOGIC_VECTOR (8 downto 0);
   
   signal ones                : STD_LOGIC_VECTOR (3 downto 0);
   signal data_word           : STD_LOGIC_VECTOR (8 downto 0);
   signal data_word_inv       : STD_LOGIC_VECTOR (8 downto 0);
   signal data_word_disparity : STD_LOGIC_VECTOR (3 downto 0);
   signal dc_bias             : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
   signal bg                  : STD_LOGIC_VECTOR (2 downto 0);
begin
   -- Work our the two different encodings for the byte
   xored(0) <= data(0);
   xored(1) <= data(1) xor xored(0);
   xored(2) <= data(2) xor xored(1);
   xored(3) <= data(3) xor xored(2);
   xored(4) <= data(4) xor xored(3);
   xored(5) <= data(5) xor xored(4);
   xored(6) <= data(6) xor xored(5);
   xored(7) <= data(7) xor xored(6);
   xored(8) <= '1';

   xnored(0) <= data(0);
   xnored(1) <= data(1) xnor xnored(0);
   xnored(2) <= data(2) xnor xnored(1);
   xnored(3) <= data(3) xnor xnored(2);
   xnored(4) <= data(4) xnor xnored(3);
   xnored(5) <= data(5) xnor xnored(4);
   xnored(6) <= data(6) xnor xnored(5);
   xnored(7) <= data(7) xnor xnored(6);
   xnored(8) <= '0';
   
   -- Count how many ones are set in data
   ones <= "0000" + data(0) + data(1) + data(2) + data(3)
                   + data(4) + data(5) + data(6) + data(7);
 
   -- Decide which encoding to use
   process(ones, data(0), xnored, xored)
   begin
      if ones > 4 or (ones = 4 and data(0) = '0') then
         data_word     <= xnored;
         data_word_inv <= NOT(xnored);
      else
         data_word     <= xored;
         data_word_inv <= NOT(xored);
      end if;
   end process;                                          

   -- Work out the DC bias of the dataword;
   data_word_disparity  <= "1100" + data_word(0) + data_word(1) + data_word(2) + data_word(3) 
                                    + data_word(4) + data_word(5) + data_word(6) + data_word(7);

   bg <= blank & guard & indata;
   -- Now work out what the output should be
   process(clk)
   begin
      if rising_edge(clk) then
        case bg is
          when "110"  =>
            -- Video guard band (two pixels wide)
            case CHANNEL is
              when 0 => encoded <= "1011001100";
              when 1 => encoded <= "0100110011";
              when 2 => encoded <= "1011001100";
              when others => encoded <= (others => 'X');
            end case;
          when "111"  =>
            -- Data guard band (two pixels wide)
            case CHANNEL is
              when 0 => encoded <= "0101100011";
              when 1 => encoded <= "0100110011";
              when 2 => encoded <= "0100110011";
              when others => encoded <= (others => 'X');
            end case;
          when "100" | "101" =>
            -- In the control periods, all values have and have balanced bit count
            case c is            
               when "00"   => encoded <= "1101010100";
               when "01"   => encoded <= "0010101011";
               when "10"   => encoded <= "0101010100";
               when others => encoded <= "1010101011";
            end case;
            dc_bias <= (others => '0');

          when "000"|"001" =>
            if dc_bias = "00000" or data_word_disparity = 0 then
               -- dataword has no disparity
               if data_word(8) = '1' then
                  encoded <= "01" & data_word(7 downto 0);
                  dc_bias <= dc_bias + data_word_disparity;
               else
                  encoded <= "10" & data_word_inv(7 downto 0);
                  dc_bias <= dc_bias - data_word_disparity;
               end if;
            elsif (dc_bias(3) = '0' and data_word_disparity(3) = '0') or 
                  (dc_bias(3) = '1' and data_word_disparity(3) = '1') then
               encoded <= '1' & data_word(8) & data_word_inv(7 downto 0);
               dc_bias <= dc_bias + data_word(8) - data_word_disparity;
            else
               encoded <= '0' & data_word;
               dc_bias <= dc_bias - data_word_inv(8) + data_word_disparity;
            end if;
          when others => encoded <= (others => 'X');
         end case;
      end if;
   end process;      
end Behavioral;