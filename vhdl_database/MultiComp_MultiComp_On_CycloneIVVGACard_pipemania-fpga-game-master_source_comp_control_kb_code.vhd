-- kb_code.vhd - Modul pro dekodovani kodu klavesy
-- Autori: Jakub Cabal
-- Posledni zmena: 14.10.2014
-- Popis: Tato komponenta generuje kod prave zmackle klavesy
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KB_CODE is
   Port (
      CLK          : in  STD_LOGIC; -- Vychozi hodinovy signal
      RST          : in  STD_LOGIC; -- Vychozi synchronni reset
      PS2RX_DATA   : in  STD_LOGIC_VECTOR(7 downto 0); -- Vstupní data z PS2_RX
      PS2RX_VALID  : in  STD_LOGIC; -- Data z PS2_RX jsou pripravena na vycteni
      KEY_CODE     : out STD_LOGIC_VECTOR(7 downto 0) -- Kod klavesy
   );
end KB_CODE;

architecture FULL of KB_CODE is

   signal ps2_code      : STD_LOGIC_VECTOR(7 downto 0);
   signal ps2_code_last : STD_LOGIC_VECTOR(7 downto 0);

begin

   ----------------------------------------------------------------
   -- ZPRACOVANI DAT
   ----------------------------------------------------------------

   -- Vycteni dat z PS2_RX
   process (CLK) 
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then 
            ps2_code      <= (others => '0');
            ps2_code_last <= (others => '0');
         elsif (PS2RX_VALID = '1') then  
            ps2_code      <= PS2RX_DATA;
            ps2_code_last <= ps2_code;
         end if;
      end if;
   end process; 

   -- Propagace kodu klavesy na vystup, pri uvolneni klavesy
   process (CLK) 
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then 
            KEY_CODE <= (others => '0');
         elsif (ps2_code_last /= X"F0") then  
            KEY_CODE <= ps2_code;
         end if;
      end if;
   end process;

end FULL;