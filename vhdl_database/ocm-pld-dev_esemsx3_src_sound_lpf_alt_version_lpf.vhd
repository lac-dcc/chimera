--
-- lpf.vhd
--   low pass filter
--   Revision 1.00
--
-- Copyright (c) 2007 Takayuki Hara.
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--


--  LPF [1:4:6:4:1]/16
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity lpf1 is
    generic (
        msbi    : integer
    );
    port(
        clk21m  : in    std_logic;
        reset   : in    std_logic;
        clkena  : in    std_logic;
        idata   : in    std_logic_vector( msbi downto 0 );
        odata   : out   std_logic_vector( msbi downto 0 )
    );
end lpf1;

architecture rtl of lpf1 is
    signal ff_d1    : std_logic_vector( msbi downto 0 );
    signal ff_d2    : std_logic_vector( msbi downto 0 );
    signal ff_d3    : std_logic_vector( msbi downto 0 );
    signal ff_d4    : std_logic_vector( msbi downto 0 );
    signal ff_d5    : std_logic_vector( msbi downto 0 );
    signal ff_out   : std_logic_vector( msbi downto 0 );

    signal w_0      : std_logic_vector( msbi + 3 downto 0 );
    signal w_1      : std_logic_vector( msbi + 3 downto 0 );
    signal w_2      : std_logic_vector( msbi + 1 downto 0 );
    signal w_out    : std_logic_vector( msbi + 4 downto 0 );
begin

    odata   <= ff_out;

    w_0     <= (ff_d3(msbi) & ff_d3 & "00") + (ff_d3(msbi) & ff_d3(msbi) & ff_d3 & '0');    --  ff_d3 * 6
    w_1     <= ((ff_d2(msbi) & ff_d2) + (ff_d4(msbi) & ff_d4)) & "00";                      --  (ff_d2 + dd_d4) * 4
    w_2     <= (ff_d1(msbi) & ff_d1) + (ff_d5(msbi) & ff_d5);                               --  ff_d1 + ff_d5

    w_out   <= (w_0(msbi+3) & w_0) + (w_1(msbi+3) & w_1) + (w_2(msbi+1) & w_2(msbi+1) & w_2(msbi+1) & w_2);

    -- delay line
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_d1   <= ( others => '0' );
            ff_d2   <= ( others => '0' );
            ff_d3   <= ( others => '0' );
            ff_d4   <= ( others => '0' );
            ff_d5   <= ( others => '0' );
            ff_out  <= ( others => '0' );
        elsif( clk21m'event and clk21m = '1' )then
            if( clkena = '1' )then
                ff_d1   <= idata;
                ff_d2   <= ff_d1;
                ff_d3   <= ff_d2;
                ff_d4   <= ff_d3;
                ff_d5   <= ff_d4;
                ff_out  <= w_out( w_out'high downto 4 );
            end if;
        end if;
    end process;
end rtl;

--  LPF [1:1:1:1:1:1:1:1]/8
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity lpf2 is
    generic (
        msbi    : integer
    );
    port(
        clk21m  : in    std_logic;
        reset   : in    std_logic;
        clkena  : in    std_logic;
        idata   : in    std_logic_vector( msbi downto 0 );
        odata   : out   std_logic_vector( msbi downto 0 )
    );
end lpf2;

architecture rtl of lpf2 is
    signal ff_d1    : std_logic_vector( msbi downto 0 );
    signal ff_d2    : std_logic_vector( msbi downto 0 );
    signal ff_d3    : std_logic_vector( msbi downto 0 );
    signal ff_d4    : std_logic_vector( msbi downto 0 );
    signal ff_d5    : std_logic_vector( msbi downto 0 );
    signal ff_d6    : std_logic_vector( msbi downto 0 );
    signal ff_d7    : std_logic_vector( msbi downto 0 );
    signal ff_d8    : std_logic_vector( msbi downto 0 );
    signal ff_out   : std_logic_vector( msbi downto 0 );

    signal w_1      : std_logic_vector( msbi + 1 downto 0 );
    signal w_3      : std_logic_vector( msbi + 1 downto 0 );
    signal w_5      : std_logic_vector( msbi + 1 downto 0 );
    signal w_7      : std_logic_vector( msbi + 1 downto 0 );

    signal w_11     : std_logic_vector( msbi + 2 downto 0 );
    signal w_13     : std_logic_vector( msbi + 2 downto 0 );

    signal w_out    : std_logic_vector( msbi + 3 downto 0 );
begin

    odata   <= ff_out;

    w_1     <= (ff_d1(msbi) & ff_d1) + (ff_d2(msbi) & ff_d2);
    w_3     <= (ff_d3(msbi) & ff_d1) + (ff_d4(msbi) & ff_d2);
    w_5     <= (ff_d5(msbi) & ff_d1) + (ff_d6(msbi) & ff_d2);
    w_7     <= (ff_d7(msbi) & ff_d1) + (ff_d7(msbi) & ff_d2);

    w_11    <= (w_1(msbi+1) & w_1) + (w_3(msbi+1) & w_3);
    w_13    <= (w_5(msbi+1) & w_5) + (w_7(msbi+1) & w_7);

    w_out   <= (w_11(msbi+2) & w_11) + (w_13(msbi+2) & w_13);

    -- delay line
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_d1   <= ( others => '0' );
            ff_d2   <= ( others => '0' );
            ff_d3   <= ( others => '0' );
            ff_d4   <= ( others => '0' );
            ff_d5   <= ( others => '0' );
            ff_d6   <= ( others => '0' );
            ff_d7   <= ( others => '0' );
            ff_d8   <= ( others => '0' );
            ff_out  <= ( others => '0' );
        elsif( clk21m'event and clk21m = '1' )then
            if( clkena = '1' )then
                ff_d1   <= idata;
                ff_d2   <= ff_d1;
                ff_d3   <= ff_d2;
                ff_d4   <= ff_d3;
                ff_d5   <= ff_d4;
                ff_d6   <= ff_d4;
                ff_d7   <= ff_d4;
                ff_d8   <= ff_d4;
                ff_out  <= w_out( w_out'high downto 3 );
            end if;
        end if;
    end process;
end rtl;
