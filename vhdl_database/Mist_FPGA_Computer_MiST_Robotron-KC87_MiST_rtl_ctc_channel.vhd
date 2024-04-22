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
-- single ctc channel
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity ctc_channel is
    port (
        clk   : in std_logic;
        res_n : in std_logic;
        en    : in std_logic;
        
        dIn   : in std_logic_vector(7 downto 0);
        dOut  : out std_logic_vector(7 downto 0);
        
        rd_n    : in std_logic;
        
        int   : out std_logic;
        setTC : out std_logic;
        
        ctcClkEn : in std_logic;
        clk_trg : in std_logic;
        zc_to : out std_logic
    );
end ctc_channel;

architecture rtl of ctc_channel is
    type states is (default, setTimeConstant);
    signal state    : states := default;
    signal nextState : states := default;

    signal control  : std_logic_vector(7 downto 3) := (others => '0');
    
    signal preDivider : integer range 0 to 255 := 0;
    signal preDivVect : std_logic_vector(7 downto 0);
    signal edgeDet    : std_logic_vector(1 downto 0);
    
    signal dCounter : integer range 0 to 256 := 0;
    signal timeConstant : integer range 1 to 256 := 256;
    
    signal triggerIrq : boolean := false;
    signal running  : boolean := false;
    signal startUp  : boolean := true;

begin
    setTC <= '1' when state=setTimeConstant else '0';
    dOut <= std_logic_vector(to_unsigned(dCounter, dOut'length)); -- CTC Read
    
    int <= '1' when triggerIrq and control(7)='1' else '0'; 
    
--    zc_to <= '1' when control(7)='1' else '0';
--    zc_to <= edgeDet(1);
    
    preDivVect <= std_logic_vector(to_unsigned(preDivider, preDivVect'length));
    
    -- ctc counter
    counter : process
        variable cntrEvent : boolean;
    begin
        wait until rising_edge(clk);
        
        if (ctcClkEn='1') then
            if (preDivider=255) then
                preDivider <= 0;
            else
                preDivider <= preDivider + 1;
            end if;
        end if;
            
        -- edgeDetector
        if (control(6 downto 5)="00") then -- Timer mode + Prescaler 16
            edgeDet(0) <= preDivVect(3);
        elsif (control(6 downto 5)="01") then -- Timer mode  + Prescaler 256
            edgeDet(0) <= preDivVect(7);
        else -- Counter mode
            edgeDet(0) <= clk_trg;
        end if;
        edgeDet(1) <= edgeDet(0);
        
        triggerIrq <= false;
        cntrEvent := false;
        
        if (running) then
            if (edgeDet="01") then
                cntrEvent := true;
            end if;

            if (startUp) then
                startUp <= false;
                dCounter <= timeConstant;
            elsif (cntrEvent) then
                if (dCounter = 1) then -- next count 0 => reload
                    dCounter <= timeConstant;
                    triggerIrq <= true;
                    zc_to <= '1';
                else
                    dCounter <= dCounter - 1;
                    zc_to <= '0';
                end if;
            end if;
        else
            edgeDet <= (others => '0');
            startUp <= true;
            dCounter <= 0;
            preDivider <= 0;
            triggerIrq <= false;
            zc_to <= '0';
        end if;
    end process;
    
    -- cpu-interface
    cpu : process
        variable tcData : integer range 0 to 255;
    begin
        wait until rising_edge(clk);
        
        if (res_n='0') then
            nextState <= default;
            running <= false;
            timeConstant <= 256;
        elsif (en='1') then
            if (rd_n='1') then -- CTC Write
                if (state=setTimeConstant) then -- set Time Constant 
                    nextState <= default;
                    running <= true;
                    
                    tcData := to_integer(unsigned(dIn));
                    if (tcData=0) then
                        timeConstant <= 256;
                    else
                        timeConstant <= to_integer(unsigned(dIn));
                    end if;

                elsif (dIn(0)='1') then
                    control <= dIn(7 downto 3);
                    
                    if (dIn(2)='1') then -- Time Constant Follows
                        nextState <= setTimeConstant;
                    end if;
                    
                    if (dIn(1)='1') then -- reset
                        running <= false;
                    end if;
                end if;
            end if;
        else
            state <= nextState;
        end if;
    end process;
end;