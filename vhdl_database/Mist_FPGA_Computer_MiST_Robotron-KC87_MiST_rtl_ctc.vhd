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
-- implementation of a z80 ctc
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity ctc is
    generic (
        sysclk : integer := 500000; -- 50MHz
        ctcclk : integer :=  24576  --  2.4576MHz
    );
    port (
        clk   : in std_logic;
        res_n : in std_logic; -- negative
        en    : in std_logic; -- negative
        
        dIn   : in std_logic_vector(7 downto 0);
        dOut  : out std_logic_vector(7 downto 0);
        
        cs    : in std_logic_vector(1 downto 0);
        m1_n  : in std_logic; -- negative
        iorq_n : in std_logic; -- negative
        rd_n  : in std_logic; -- negative
        
        int   : out std_logic_vector(3 downto 0);
        intAck : in std_logic_vector(3 downto 0);
        
        clk_trg : in std_logic_vector(3 downto 0);
        zc_to   : out std_logic_vector(3 downto 0);
        kcSysClk : out std_logic
    );
end ctc;

architecture rtl of ctc is
    type byteArray is array (natural range <>) of std_logic_vector(7 downto 0);
    
    signal clkCounter : integer range 0 to sysclk+ctcclk-1 := 0;
    signal ctcClkEn   : std_logic := '0';
    
    signal cEn        : std_logic_vector(3 downto 0);
    signal cDOut      : byteArray(3 downto 0);
    signal cSetTC     : std_logic_vector(3 downto 0);
    signal setTC      : std_logic;
    
    signal irqVect    : std_logic_vector(7 downto 3) := (others => '0');
    
    signal intAckChannel : std_logic_vector(1 downto 0);

begin
    kcSysClk <= ctcClkEn;
    
    intAckChannel <= 
        "00" when intAck(0)='1' else
        "01" when intAck(1)='1' else
        "10" when intAck(2)='1' else
        "11";
    
    dOut <= 
        irqVect & intAckChannel & "0" when intAck/="0000" else -- int acknowledge
        cDOut(0) when cEn(0)='1' else
        cDOut(1) when cEn(1)='1' else
        cDOut(2) when cEn(2)='1' else
        cDOut(3);

    setTC <= 
        cSetTC(0) when cs="00" else
        cSetTC(1) when cs="01" else
        cSetTC(2) when cs="10" else
        cSetTC(3);
      
    -- generate clock for ctc timer
    clkGen : process 
    begin
        wait until rising_edge(clk);

        if (clkCounter>=sysclk-ctcclk) then
            clkCounter <= clkCounter - sysclk + ctcclk;
            ctcClkEn <= '1';
        else
            clkCounter <= clkCounter + ctcclk;
            ctcClkEn <= '0';
        end if;
    end process;
    
    cpuInt : process
    begin
        wait until rising_edge(clk);

        if (en='0' and rd_n='1' and iorq_n='0' and m1_n='1' and dIn(0)='0' and setTC='0') then -- set irq vector
            irqVect <= dIn(7 downto 3);
        end if;
    end process;
    
    channels: for i in 0 to 3 generate
        channel : entity work.ctc_channel
        port map (
            clk     => clk,
            res_n   => res_n,
            en      => cEn(i),
            
            dIn     => dIn,
            dOut    => cDOut(i),
            
            rd_n    => rd_n,
            
            int     => int(i),
            setTC   => cSetTC(i),
            ctcClkEn => ctcClkEn,
            clk_trg  => clk_trg(i),
            zc_to    => zc_to(i)
        );
            
        cEn(i) <= '1' when (en='0' and iorq_n='0' and m1_n='1' and to_integer(unsigned(cs))=i) else '0';
    end generate;
end;