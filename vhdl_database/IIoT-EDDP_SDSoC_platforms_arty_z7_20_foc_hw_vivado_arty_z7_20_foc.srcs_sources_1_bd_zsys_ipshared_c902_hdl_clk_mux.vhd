----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2014 18:06:10
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
Library UNISIM;
    use UNISIM.VComponents.all;

--Library UNIMACRO;
--    use UNIMACRO.vcomponents.all;

entity clk_mux is
        generic (
            --C_REFCLK_HZ : integer := 100000000;
            --C_CHANNELS : integer range 1 to 32 := 4;
            --C_MODE : integer range 0 to 1 := 0;
            C_IDLE_VAL : integer range 0 to 1 := 0
        );  
        port ( 
            clk0     : in STD_LOGIC;
            clk1     : in STD_LOGIC;
            sel      : in STD_LOGIC;            

            clkout   : out STD_LOGIC
        );
end clk_mux;

architecture Behavioral of clk_mux is

constant High : std_logic := '1';
constant Low : std_logic := '0';

signal toggle: STD_LOGIC;

begin

BUFGMUX_inst : BUFGMUX
    port map (
        O        => clkout,      -- 1-bit output: Clock output
        I0       => clk0,        -- 1-bit input: Clock input (S=0)
        I1       => clk1,        -- 1-bit input: Clock input (S=1)
        S        => sel          -- 1-bit input: Clock select
    );

end Behavioral;
