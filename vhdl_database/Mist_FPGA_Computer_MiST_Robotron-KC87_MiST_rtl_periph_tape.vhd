-- Copyright (c) 2015, $ME
-- All rights reserved.
--
-- Redistribution and use in source and synthezised forms, with or without modification, are permitted 
-- provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions 
--    and the following disclaimer.
--
-- 2. Redistributions in synthezised form must reproduce the above copyright notice, this list of conditions
--    and the following disclaimer in the documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
-- WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR 
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
--
--
-- tape frequency generator
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity tape is 
    generic  (
        sysclk   : integer := 50000000; -- 50MHz
        basetone : integer := 2500
    );
    port (
        clk      : in std_logic;
        tape_out : out std_logic;
        test     : in std_logic_vector(1 downto 0)
    );
end tape;

architecture rtl of tape is
    constant pulse_length : integer := sysclk / 500000; -- 2us
    constant tone0        : integer := sysclk / (basetone);  -- 2500Hz * 2
    constant tone1        : integer := sysclk / (basetone/2);    -- 1250Hz * 2
    constant tone_space    : integer := sysclk / (basetone/4); --  625Hz * 2
    
    signal divider : integer range 0 to tone_space-1;

begin
    process
    begin
        wait until rising_edge(clk);
        
        if (divider = pulse_length) then
            tape_out <= '0';
        end if;
    
        if (divider = 0) then
            case test is
                when "01" => divider <= tone_space-1;
                when "10" => divider <= tone0-1;
                when "11" => divider <= tone1-1;
                when others => divider <= 0;
            end case;
            
            tape_out <= '1';
        else
            divider <= divider - 1;
        end if;
    end process;
end;