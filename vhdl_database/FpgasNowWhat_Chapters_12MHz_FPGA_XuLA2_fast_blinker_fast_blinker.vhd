----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:43 07/09/2011 
-- Design Name: 
-- Module Name:    blinker - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fast_blinker is
    Port ( clk_i : in  STD_LOGIC;
           blinker_o : out  STD_LOGIC);
end fast_blinker;

architecture Behavioral of fast_blinker is
signal clk_fast : std_logic;
signal cnt_r : std_logic_vector(22 downto 0) := (others=>'0');
begin

DCM_SP_inst : DCM_SP
   generic map (
      CLKFX_DIVIDE   => 1, --  Can be any interger from 1 to 32
      CLKFX_MULTIPLY => 4  --  Can be any integer from 1 to 32
   )
   port map (
      CLKFX => clk_fast,  -- DCM CLK synthesis out (M/D)
      CLKIN => clk_i,     -- Clock input (from IBUFG, BUFG or DCM)
      RST   => '0'        -- No reset
   );
   
process(clk_fast) is
begin
  if rising_edge(clk_fast) then
    cnt_r <= cnt_r + 1;
  end if;  
end process;

blinker_o <= cnt_r(22);

end Behavioral;

