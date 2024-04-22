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
-- more complete interrupt controller
--   - does not work atm
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity intController is
    generic (
        numInts : integer := 8
    );
    port (
        clk     : in std_logic;
        res     : in std_logic;
        int     : out std_logic;
        intPeriph : in std_logic_vector(numInts-1 downto 0);
        intAck  : out std_logic_vector(numInts-1 downto 0);
        cpuDIn  : in std_logic_vector(7 downto 0);
        m1      : in std_logic;
        iorq    : in std_logic;
        rd      : in std_logic;
        test    : out std_logic_vector(numInts-1 downto 0);
        RETI_n  : in std_logic
    );
end intController;

architecture rtl of intController is
    constant zeroVect   : std_logic_vector(numInts-1 downto 0) := (others => '0');
    
    signal intInternal  : std_logic_vector(numInts-1 downto 0);
    signal intMask      : std_logic_vector(numInts-1 downto 0);
    signal currentInt   : std_logic_vector(numInts-1 downto 0);
    signal currentAck   : std_logic_vector(numInts-1 downto 0);
    
    signal intReti      : std_logic_vector(numInts-1 downto 0);
    signal intRetiMask  : std_logic_vector(numInts-1 downto 0);
    
    signal reti         : integer range 0 to 2 := 0;
begin
    intAck <= currentAck when m1='0' and iorq='0' else (others => '0');
  
    test <= intReti;
  
    int_mask : process(intInternal,intReti)
    begin
        intMask <= (others => '0');
        for i in 0 to numInts-1 -- 0 is highest prio
        loop
            if intInternal(i)='1' and intReti(i)='0' then
                intMask(i) <= '1';
                exit;
            end if;
        end loop;
    end process;
    
    ack_mask : process(intReti)
    begin
        intRetiMask <= (others => '0');
        for i in 0 to numInts-1 -- 0 is highest prio
        loop
            if intReti(i)='1' then
                intRetiMask(i) <= '1';
                exit;
            end if;
        end loop;
    end process;
    
    process
        variable intResetMask : std_logic_vector(numInts-1 downto 0);
    begin
        wait until rising_edge(clk);
    
        if (res='0') then
            reti <= 0;
            int <= '1';
            currentInt <= (others => '0');
            intInternal <= (others => '0');
            intReti <= (others => '0');
        else
            intResetMask := (others => '1');
            
            if (m1='1') then
                currentAck <= (others => '0');
                if intMask/=zeroVect then -- new int (with higher prio?)
                    int <= '0';
                    currentInt <= intMask;
                    currentAck <= intMask;
                end if;
                
                if RETI_n='0' and reti=0 then
                    reti <= 1;
                elsif RETI_n='1' and reti=1 then
                    reti <= 2;
                elsif reti=2 then
                    intReti <= intReti and not intRetiMask; -- reset highest reti-flag -> new int can be triggered
                    reti <= 0;
                end if;
            else
                if iorq='0' then -- int ack
                    int <= '1';
                    intReti <= intReti or currentInt; -- update "wait for reti"-flags -> no more int for this until reti
                    intResetMask := not currentInt; -- reset current int
                    currentInt <= (others => '0');
                elsif rd='0' then -- reti?

                    
--                    if cpuDIn=x"ED" and reti=0 then -- reti 1
--                        reti <= 1;
--                    elsif cpuDIn=x"4D" and reti=1 then -- reti 2
--                        reti <= 2;
--                    elsif reti /= 2 then
--                        reti <= 0; -- something else -> reset statemachine
--                    end if;
                end if;
            end if;
            
            intInternal <= (intInternal and intResetMask) or intPeriph;
        end if;
        
    end process;
    
end;
