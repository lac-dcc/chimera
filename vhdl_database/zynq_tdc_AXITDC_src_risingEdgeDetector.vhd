----------------------------------------------------------------------------------
-- Rising Edge Detector
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 27.6.2019
-- Modified: 27.6.2019
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity risingEdgeDetector is
   Port (
      clk: in std_logic;
      sig_i : in std_logic;
      sig_o : out std_logic
   );
end risingEdgeDetector;

architecture rtl of risingEdgeDetector is
   signal q : std_logic;
begin

   FF: process(clk)  -- flip-flop
   begin
      if rising_edge(clk) then
         q <= sig_i;
      end if;
   end process;
   
   sig_o <= sig_i and not q;  -- AND gate

end rtl;
