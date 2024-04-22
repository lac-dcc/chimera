----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:32:49 01/15/2007 
-- Design Name: 
-- Module Name:    div - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity div_seq is
  Generic (
         nbits     : natural := 12
  );
  Port ( resetN    : in  std_logic;  
         clk       : in  std_logic;
         divide    : in  std_logic;
         Dividendo : in  std_logic_vector (nbits-1 downto 0);
         Divisor   : in  std_logic_vector (nbits-1 downto 0);
         Cociente  : out std_logic_vector (nbits-1 downto 0);
         Resto     : out std_logic_vector (nbits-1 downto 0);
         AvisoDiv  : out std_logic);
end div_seq;

architecture Behavioral of div_seq is
  signal Ddo     : unsigned (nbits-1 downto 0);  -- Dividendo  Registrados
  signal Dsor    : unsigned (nbits-1 downto 0);  -- Divisor
  signal C       : unsigned (nbits-1 downto 0);
  signal R       : unsigned (nbits-1 downto 0);
  signal bitsdesplz : natural range 0 to nbits-1;
  type   estados_div is (ESPERA, DESPLAZA, OPERA); 
  signal EstadoDiv : estados_div; 

--  signal msbDdo  : natural range 0 to nbits-1;
--  signal msbDsor  : natural range 0 to nbits-1;
begin

   Resto <= std_logic_vector(R);
   Cociente <= std_logic_vector(C);

   REG: process (resetN, clk)
     variable Ddo_aux : unsigned (nbits-1 downto 0);
   begin
     if resetN='0' then 
       Ddo        <= (others => '0');
       Dsor       <= (others => '0');
       C          <= (others => '0');
       R          <= (others => '0');
       bitsdesplz <= 0;
       EstadoDiv <= ESPERA;
       AvisoDiv <= '0';
     elsif clk'event and clk='1' then
       case EstadoDiv is 
         when ESPERA =>
           AvisoDiv <= '0';
           if divide = '1' then
             Ddo <= unsigned(Dividendo);
             Dsor <= unsigned(Divisor);
             C <= (others => '0');
             R <= (others => '0');
             if (unsigned(Dividendo) = 0 OR (unsigned(Divisor)=0)) then
               EstadoDiv <= ESPERA;
               AvisoDiv <= '1';
             else 
               EstadoDiv <= DESPLAZA;
               bitsdesplz <= 0;
             end if;
           end if;
         when DESPLAZA =>
           if (Ddo > Dsor) then
             if (Dsor(nbits-1) = '0') then
               Dsor(nbits-1 downto 1) <= Dsor(nbits-2 downto 0);
               Dsor(0) <= '0';
               bitsdesplz <= bitsdesplz + 1;
               EstadoDiv <= DESPLAZA;
             else
               EstadoDiv <= OPERA;
             end if;
           else
             EstadoDiv <= OPERA;
           end if;
         when OPERA =>
           if (Ddo >= Dsor) then
             Ddo_aux := Ddo - Dsor;
             Ddo <= Ddo_aux;
             C(bitsdesplz) <= '1';
             if (bitsdesplz = 0) then
               EstadoDiv <= ESPERA;
               AvisoDiv <= '1';
               R <= Ddo_aux;
             else 
               Dsor(nbits-2 downto 0) <= Dsor(nbits-1 downto 1);
               Dsor(nbits-1) <= '0';
               EstadoDiv <= OPERA;
               bitsdesplz <= bitsdesplz - 1;
             end if;
           else
             if (bitsdesplz = 0) then
               EstadoDiv <= ESPERA;
               R <= Ddo;
               AvisoDiv <= '1';
             else 
               Dsor(nbits-2 downto 0) <= Dsor(nbits-1 downto 1);
               EstadoDiv <= OPERA;
               bitsdesplz <= bitsdesplz - 1;
             end if;
           end if;
         when others =>
           Ddo  <= (others => '0');
           Dsor <= (others => '0');
           C    <= (others => '0');
           R    <= (others => '0');
           bitsdesplz <= 0;
           EstadoDiv <= ESPERA;
       end case;
     end if;
   end process;

--   MSB_Ddo: process (Divendo)
--  begin
--     msbDdo <= 0;
--     for i in nbits-1 to 0 loop
--       if Dividendo(i) = '1' then
--          msbDdo <= i;
--          exit;
--       end if;
--     end loop;
--   end process;
--  a <= msbDdo;

end Behavioral;

