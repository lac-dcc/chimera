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
-- simple rs232 sender
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rs232tx is
    generic (
        sysclk   : integer := 50000000; -- 50MHz
        baudrate : integer := 115200 
    );
    port (
        clk   : in std_logic;
        
        rd_n  : in std_logic; -- negative 
        wr_n  : in std_logic; -- negative 

        dIn   : in std_logic_vector(7 downto 0); 
        dOut  : out std_logic_vector(7 downto 0);
        
        txd   : out std_logic
    );
end rs232tx;

architecture rtl of rs232tx is
    signal txCnt : integer range 0 to 10 := 0;
    signal txData : std_logic_vector(9 downto 0) := (others => '1');
    signal preScaler : integer range 0 to (sysclk/baudrate)-1;
begin
    dOut <= std_logic_vector(to_unsigned(txCnt,dOut'length));

    process
        
    begin
        wait until rising_edge(clk);
        
        if (wr_n='0' and txCnt=0) then
            txData <= '1' & dIn & '0';
            txCnt <= 10;
            preScaler <= (sysclk/baudrate)-1;
        elsif (txCnt/=0) then
            if (preScaler=0)  then 
                txData <= '1' & txData(txData'left downto 1);
                txCnt <= txCnt - 1;
                preScaler <= (sysclk/baudrate)-1;
            else
                preScaler <= preScaler - 1;
            end if; 
        end if;
    end process;
    
    txd <= txData(0);
end;
