--Import primitive library and files
library ieee;
use ieee.std_logic_1164.all;
entity hexDisplay is 
                port (        S        : in         std_logic_vector(3 downto 0);  -- S is an intermediate signal (NOT A PHYSICAL INPUT)
                                        H        : out std_logic_vector(0 to 6));           -- Storage signal for result
end entity; 

-- Define the function of hexDisplay as one decoder
-- Create a switch case based on the intermediate signal S
ARCHITECTURE sstructure OF hexDisplay IS
BEGIN
        PROCESS (S)
        BEGIN
                CASE S IS                                
             WHEN "0000"=>H<="0000001";  --Based on input S(0000) decode to display 0;
                  WHEN "0001"=>H<="1001111";  --Based on input S(0001) decode to display 1;
             WHEN "0010"=>H<="0010010";  --Based on input S(0010) decode to display 2;
             WHEN "0011"=>H<="0000110";  --Based on input S(0011) decode to display 3;
                  WHEN "0100"=>H<="1001100";  --Based on input S(0100) decode to display 4;
                  WHEN "0101"=>H<="0100100";  --Based on input S(0101) decode to display 5;
             WHEN "0110"=>H<="0100000";  --Based on input S(0110) decode to display 6;
                  WHEN "0111"=>H<="0001111";  --Based on input S(0111) decode to display 7;
                  WHEN "1000"=>H<="0000000";  --Based on input S(1000) decode to display 8;
                  WHEN "1001"=>H<="0001100";  --Based on input S(1001) decode to display 9;
                  WHEN "1010"=>H<="0001000";  --Based on input S(1010) decode to display A;
                  WHEN "1011"=>H<="1100000";  --Based on input S(1011) decode to display b;
                  WHEN "1100"=>H<="1110010";  --Based on input S(1100) decode to display c;
                  WHEN "1101"=>H<="1000010";  --Based on input S(1101) decode to display d;
                  WHEN "1110"=>H<="0110000";  --Based on input S(1110) decode to display E;
                  WHEN "1111"=>H<="0111000";  --Based on input S(1111) decode to display F;
                END CASE;
         END PROCESS;
END sstructure;


