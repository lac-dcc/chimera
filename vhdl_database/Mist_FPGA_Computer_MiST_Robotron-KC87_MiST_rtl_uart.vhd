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
-- complete uart
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart is
    generic (
        sysclk   : integer := 50_000_000; -- 50MHz
        baudrate : integer := 115_200 
    );
    port (
        clk   : in std_logic;
        
        cs_n  : in std_logic; -- negative 
        rd_n  : in std_logic; -- negative 
        wr_n  : in std_logic; -- negative 

        addr  : in std_logic_vector(0 downto 0); 
        
        dIn   : in std_logic_vector(7 downto 0); 
        dOut  : out std_logic_vector(7 downto 0);
        
        txd   : out std_logic;
        rxd   : in std_logic
    );
end uart;

architecture rtl of uart is
    constant maxPreScaler : integer := (sysclk/baudrate)-1;
    constant halfBitCnt   : integer := maxPreScaler*2/3;
    
    signal preScalerTx : integer range 0 to maxPreScaler;
    signal txCnt     : integer range 0 to 10 := 0;
    signal txShift   : std_logic_vector(9 downto 0) := (others => '1');
         
    signal preScalerRx : integer range 0 to maxPreScaler;
    signal rxShift   : std_logic_vector(8 downto 0) := (others => '1');
    signal rxInShift : std_logic_vector(3 downto 0) := (others => '0');
    signal rxBuff    : std_logic_vector(7 downto 0) := (others => '0');
    signal receiving : boolean := false;
begin
    dOut <= std_logic_vector(to_unsigned(txCnt,dOut'length)) when addr(0)='0'
        else rxBuff;
    
    -- transmit data
    tx : process    
    begin
        wait until rising_edge(clk);
        
        if (wr_n='0' and cs_n='0' and addr(0)='0' and txCnt=0) then
            txShift <= '1' & dIn & '0';
            txCnt <= 10;
            preScalerTx <= 0;
        elsif (txCnt/=0) then
            if (preScalerTx=maxPreScaler) then
                preScalerTx <= 0;
                    
                txShift <= '1' & txShift(txShift'left downto 1);
                
                txCnt <= txCnt - 1;
            else
                preScalerTx <= preScalerTx + 1;
            end if; 
        end if;
    end process;
    
    txd <= txShift(0);
    
    -- receive data
    rx : process
    begin
        wait until rising_edge(clk);
        
        rxInShift <= rxInShift(rxInShift'left-1 downto 0) & rxd;
        
        if (wr_n='0' and cs_n='0' and addr(0)='1') then
            rxBuff <= (others => '0');
        end if;
        
        if (receiving) then
            if (preScalerRx=maxPreScaler) then
                preScalerRx <= 0;
                rxShift <= rxInShift(rxInShift'left) & rxShift(rxShift'left downto 1);
                
                if (rxShift(0)='0') then
                    receiving <= false;
                    rxBuff <= rxShift(rxShift'left downto 1);
                end if;
            else
                preScalerRx <= preScalerRx + 1;
            end if;
        elsif (rxInShift(rxInShift'left)='1' and rxInShift(rxInShift'left-1)='0') then
            receiving <= true;
            rxShift <= (others => '1');
            preScalerRx <= halfBitCnt;
        end if;
    end process;
end;
