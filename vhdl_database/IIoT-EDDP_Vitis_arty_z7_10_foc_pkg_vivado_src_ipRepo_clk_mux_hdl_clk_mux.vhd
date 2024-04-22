-- The 3-Clause BSD License
-- 
-- SPDX short identifier: BSD-3-Clause
-- 
-- Copyright 2016-2017 Trenz Electronic GmbH
-- 
-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
-- 
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
-- 
-- 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
-- 
-- 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


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
