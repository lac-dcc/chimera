-- Play scales on the board buzzer
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY buzzer IS
   PORT (
      clk  : IN std_logic;   
      rst  : IN std_logic;   
      out_bit  : OUT std_logic);   
END buzzer;

ARCHITECTURE arch OF buzzer IS


   SIGNAL clk_div1   :  std_logic_vector(3 DOWNTO 0); 
   SIGNAL clk_div2   :  std_logic_vector(12 DOWNTO 0);
   SIGNAL cnt        :  std_logic_vector(21 DOWNTO 0);
   SIGNAL state      :  std_logic_vector(2 DOWNTO 0);   
	-- Counter start values
   CONSTANT  doe   :  std_logic_vector(12 DOWNTO 0) :="0111011101110";     
   CONSTANT  ray  :  std_logic_vector(12 DOWNTO 0) := "0110101001101";    
   CONSTANT  mee   :  std_logic_vector(12 DOWNTO 0) := "0101111011010";    
   CONSTANT  Fah    :  std_logic_vector(12 DOWNTO 0) := "0101100110001";    
   CONSTANT  suo   :  std_logic_vector(12 DOWNTO 0) := "0100111110111";    
   CONSTANT  lah    :  std_logic_vector(12 DOWNTO 0) := "0100011100001";    
   CONSTANT  tea    :  std_logic_vector(12 DOWNTO 0) := "0011111101000";    
   CONSTANT  doe2   :  std_logic_vector(12 DOWNTO 0) := "0011101110111";   
   SIGNAL out_bit_tmp :std_logic; 

BEGIN
   out_bit<=out_bit_tmp;
   PROCESS(clk,rst)
   BEGIN
      
      IF (NOT rst = '1') THEN
         clk_div1 <= "0000";    
      ELSIF(clk'EVENT AND clk='1')THEN
         IF (clk_div1 /= "1001") THEN
            clk_div1 <= clk_div1 + "0001";    
         ELSE
            clk_div1 <= "0000";    
         END IF;
      END IF;
   END PROCESS;

   PROCESS(clk,rst)
   BEGIN
    
      IF (NOT rst = '1') THEN
         clk_div2 <= "0000000000000";    
         state <= "000";    
         cnt <= "0000000000000000000000";    
         out_bit_tmp <= '0';    
      ELSIF(clk'EVENT AND clk='1')THEN
         IF (clk_div1 = "1001") THEN
            CASE state IS
               WHEN "000" =>             --????
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "001";    
                        END IF;
                        IF (clk_div2 /= doe) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "001" =>             --????
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "010";    
                        END IF;
                        IF (clk_div2 /=ray) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "010" =>             --?"??
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "011";    
                        END IF;
                        IF (clk_div2 /=mee) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "011" =>             --?"??
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "100";    
                        END IF;
                        IF (clk_div2 /=Fah) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "100" =>            --?"??   
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "101";    
                        END IF;
                        IF (clk_div2 /=suo) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "101" =>            --?"??
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "110";    
                        END IF;
                        IF (clk_div2 /= lah) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "110" =>            --?"??
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "111";    
                        END IF;
                        IF (clk_div2 /= tea) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN "111" =>            --?"??????
                        cnt <= cnt + "0000000000000000000001";    
                        IF (cnt = "1111111111111111111111") THEN
                           state <= "000";    
                        END IF;
                        IF (clk_div2 /= doe2) THEN
                           clk_div2 <= clk_div2 + "0000000000001";    
                        ELSE
                           clk_div2 <= "0000000000000";    
                           out_bit_tmp <= NOT out_bit_tmp;    
                        END IF;
               WHEN OTHERS =>
                        NULL;
               
            END CASE;
         END IF;
      END IF;
   END PROCESS;

END arch;
