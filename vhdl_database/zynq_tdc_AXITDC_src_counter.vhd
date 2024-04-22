----------------------------------------------------------------------------------
-- TDC Coarse counter
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 6.5.2019
-- Modified: 6.5.2019
--
-- Simple counter for coarse time measurement
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
   generic (
      BITS : integer := 24  -- counter bit range
   );
   Port ( 
      clk : in STD_LOGIC;
      coarse : out STD_LOGIC_VECTOR (BITS-1 downto 0)
   );
end counter;

architecture RTL of counter is
   signal count : unsigned(coarse'range) := (others => '0');
   
begin
   process(clk)
   begin
      if rising_edge(clk) then
         count <= count + 1;
      end if;
   end process;
   
   coarse <= std_logic_vector(count);
end RTL;
