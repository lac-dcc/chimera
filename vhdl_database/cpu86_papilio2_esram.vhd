----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:00 02/25/2015 
-- Design Name: 
-- Module Name:    esram - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity esram is
   PORT (
      addra : IN     std_logic_VECTOR (7 DOWNTO 0);
      clka  : IN     std_logic;
      dina  : IN     std_logic_VECTOR (7 DOWNTO 0);
      wea   : IN     std_logic_VECTOR (0 DOWNTO 0);
      douta : OUT    std_logic_VECTOR (7 DOWNTO 0)
   );
end esram;

architecture Behavioral of esram is

begin


end Behavioral;

