library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
 
entity Ring_osc_3 is
    port (    clk        : in     STD_LOGIC;
            D_out    : out     STD_LOGIC
        );
end Ring_osc_3;
 
architecture Behavioral of Ring_osc_3 is
---------------------------------------
-- Interial signal in the Ring_OSC
---------------------------------------
signal delay1 : std_logic;
signal delay2 : std_logic;
signal delay3 : std_logic;
 
---------------------------------------------------------------------
--Attributes to stop delay logic from being optimised.
---------------------------------------------------------------------
attribute keep : string;
attribute keep  of delay1 :signal is "true";
attribute keep  of delay2 :signal is "true";
attribute keep  of delay3 :signal is "true";
 
---------------------------------------------------------------------
--Attributes to stop trim logic from being optimised
---------------------------------------------------------------------
attribute s     : string;
attribute s     of delay1 : signal is "true";
attribute s     of delay2 : signal is "true";
attribute s     of delay3 : signal is "true";
 
---------------------------------------
--Code start
---------------------------------------
 
begin
    --osc_out is the last invertor output, 
    --and also the output feeds back to the first invertor
    --invertor 1
    inv_lut1: LUT1
    generic map (init => X"1")
    port map (
            I0 => delay1,
            O     =>    delay2);
    
    --invertor 2
    inv_lut2: LUT1
    generic map (init => X"1")
    port map (
            I0    => delay2,
            O     =>    delay3);
    
    --invertor 3
    inv_lut3: LUT1
    generic map (init => X"1")
    port map (
            I0 => delay3,
            O     =>    delay1);
 
    --D Flip-flop
    D_ff : FD
    port map (
        D => delay3,
        Q => D_out,
        C => clk);
        
end Behavioral;