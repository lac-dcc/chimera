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
-- ps/2-keyboard interface
--

library IEEE;
use IEEE.std_logic_1164.all;

entity ps2if is
    generic (
        sysclk : integer := 50000000 -- 50MHz
    );
    port (
        clk     : in std_logic;
        res     : in std_logic;
        ps2clk  : in std_logic;
        ps2data : in std_logic;
        data    : out std_logic_vector(7 downto 0);
        error   : out std_logic;
        rcvd    : out std_logic
    );
end;

architecture rtl of ps2if is
    constant maxTimeout : integer := sysclk/10000; -- max. 10kHz

    type ps2state is (stateWaitLow, stateLow, stateWaitHigh, stateHigh);
    signal state : ps2state := stateWaitLow;
    
    signal ps2clkDebounce  : std_logic_vector(7 downto 0) := (others => '0');
    signal ps2dataDebounce : std_logic_vector(7 downto 0) := (others => '0');
    
    signal ps2c : std_logic := '1';
    signal ps2d : std_logic := '1';
    
    signal bitCount : integer range 0 to 11;
    signal timeout  : integer range 0 to maxTimeout := maxTimeout;
    signal intData  : std_logic_vector(7 downto 0);
    signal parity   : std_logic;

    signal ps2clkH  : boolean;
    signal ps2clkL  : boolean;
    signal ps2dataH : boolean;
    signal ps2dataL : boolean;
    
begin
--    ps2clk <= '0' when (timeout<maxTimeout/2) and bitCount = 11 else 'Z';
--    ps2data <= 'Z';
     
    ps2clkH  <= ps2clkDebounce ="11111111";
    ps2clkL  <= ps2clkDebounce ="00000000";
    ps2dataH <= ps2dataDebounce="11111111";
    ps2dataL <= ps2dataDebounce="00000000";
    
--    test <= '1' when ps2ack else '0';
--    test <= '1' when bitCount = 11 else '0';
    
    -- debounce lines
    process 
    begin
        wait until rising_edge(clk); 
        
        ps2clkDebounce  <= ps2clkDebounce(6 downto 0) & ps2clk;
        ps2dataDebounce <= ps2dataDebounce(6 downto 0) & ps2data;
    end process;
    
    -- read signals
    process 
    begin
        wait until rising_edge(clk); 
        
        rcvd <= '0';
        case state is
            when stateWaitLow  => 
                if (ps2clkL and bitCount /= 11) then
                    state <= stateLow;
                end if;
                
                if (timeout /= 0) then
                    timeout <= timeout - 1;
                else
                    bitCount <= 0;
                    parity <= '1';
                end if;
            when stateLow  =>
                timeout <= maxTimeout;
                
                if (ps2dataH or ps2dataL) then
                    state <= stateWaitHigh;
                    intData <= ps2dataDebounce(7) & intData(7 downto 1);
                end if;
            when stateWaitHigh  =>
                if (ps2clkH) then
                    state <= stateHigh;
                end if;
            when stateHigh  =>
                state <= stateWaitLow;
                parity <= parity xor intData(7);
                                    
                if (bitCount < 11) then
                    bitCount <= bitCount + 1;
                end if;
                
                if (bitCount=0) then
                    error <= intData(7);
                elsif (bitCount=8) then
                    data <= intData(7 downto 0);
                elsif (bitCount=9) then
                    if (parity/=intData(7)) then 
                        error <= '1';
                    end if;
                elsif (bitCount=10) then
                    if (intData(7)='0') then
                        error <= '1';
                    end if;
                    rcvd <= '1';
                end if;
        end case;
    end process;
end;