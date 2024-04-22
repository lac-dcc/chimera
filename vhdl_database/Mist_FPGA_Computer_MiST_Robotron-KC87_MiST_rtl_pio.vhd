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
-- implementation of a z80 pio
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity pio is
    port (
        clk   : in std_logic;
        res_n : in std_logic;
        en    : in std_logic;

        dIn   : in std_logic_vector(7 downto 0);
        dOut  : out std_logic_vector(7 downto 0);
        baSel : in std_logic;
        cdSel : in std_logic;
        cs_n  : in std_logic;
        m1_n  : in std_logic;
        iorq_n : in std_logic;
        rd_n  : in std_logic;

        int   : out std_logic_vector(1 downto 0);
        intAck : in std_logic_vector(1 downto 0);
        
        aIn   : in std_logic_vector(7 downto 0);
        aOut  : out std_logic_vector(7 downto 0);
        aRdy  : out std_logic;
        aStb  : in std_logic;
        
        bIn   : in std_logic_vector(7 downto 0);
        bOut  : out std_logic_vector(7 downto 0);
        bRdy  : out std_logic;
        bStb  : in std_logic
    ); 
end pio;

architecture rtl of pio is
    type byteArray is array (natural range <>) of std_logic_vector(7 downto 0);

    signal pioDataOut : byteArray(1 downto 0);
    signal pioPortIn : byteArray(1 downto 0);
    signal pioPortOut : byteArray(1 downto 0);
    
    signal pioEn    : std_logic_vector(1 downto 0);
    signal pioRdy   : std_logic_vector(1 downto 0);
    signal pioStb   : std_logic_vector(1 downto 0);

begin
    pioEn(0) <= '1' when baSel='0' and cs_n='0' and en='1' else '0';
    pioEn(1) <= '1' when baSel='1' and cs_n='0' and en='1' else '0';
    
    -- connect ports internal
    pioPortIn(0) <= aIn;
    aOut <= pioPortOut(0);
    aRdy <= pioRdy(0);
    pioStb(0) <= aStb;
    
    pioPortIn(1) <= bIn;
    bOut <= pioPortOut(1);
    bRdy <= pioRdy(1);
    pioStb(1) <= bStb;
    
    dOut <= pioDataOut(0) when ((baSel='0' and rd_n='0') or (intAck(0)='1')) else pioDataOut(1);

    -- create 2 ports
    ports: for i in 0 to 1 generate
        pioPort : entity work.pio_port
        port map (
          clk   => clk,
          res_n => res_n,
          en    => pioEn(i),
          dIn   => dIn,
          dOut  => pioDataOut(i),
          cdSel => cdSel,
          m1_n  => m1_n,
          iorq_n => iorq_n,
          rd_n  => rd_n,
          int   => int(i),
          intAck => intAck(i),
          pIn   => pioPortIn(i),
          pOut  => pioPortOut(i),
          pRdy  => pioRdy(i),
          pStb  => pioStb(i));
    end generate;
end;