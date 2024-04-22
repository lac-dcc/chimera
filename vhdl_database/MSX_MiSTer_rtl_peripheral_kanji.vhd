--
-- kanji.vhd
--   Kanji ROM controller
--   Revision 1.00
--
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
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
-------------------------------------------------------------------------------
-- 16th, August, 2017 modified by KdL
-- Fixed kanjiptr2 counter
--
-- 05th, April, 2008 modified by t.hara
-- ���t�@�N�^�����O�B
--

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity kanji is
    port(
        clk21m      : in    std_logic;
        reset       : in    std_logic;
        clkena      : in    std_logic;
        req         : in    std_logic;
        ack         : out   std_logic;
        wrt         : in    std_logic;
        adr         : in    std_logic_vector( 15 downto  0 );
        dbi         : out   std_logic_vector(  7 downto  0 );
        dbo         : in    std_logic_vector(  7 downto  0 );

        ramreq      : out   std_logic;
        ramadr      : out   std_logic_vector( 17 downto  0 );
        ramdbi      : in    std_logic_vector(  7 downto  0 );
        ramdbo      : out   std_logic_vector(  7 downto  0 )
    );
end kanji;

architecture rtl of kanji is

    signal updatereq     : std_logic;
    signal updateack     : std_logic;
    signal kanjisel      : std_logic;
    signal kanjiptr1     : std_logic_vector( 16 downto  0 );
    signal kanjiptr2     : std_logic_vector( 16 downto  0 );

begin

    ----------------------------------------------------------------
    -- ram access
    ----------------------------------------------------------------
    ramreq  <=  req   when( wrt = '0' and adr(0) = '1' )else
                '0';
    ramadr  <=  ('0' & kanjiptr1) when( kanjisel = '0' )else
                ('1' & kanjiptr2);
    ramdbo  <=  dbo;

    ----------------------------------------------------------------
    -- kanji rom port access
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ack <= '0';
	    else
                if( wrt = '1' )then
                    ack <= req;
                else
                    ack <= '0';
                end if;
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                kanjisel    <= '0';
                updatereq   <= '0';
	    else
                if( req = '1' and wrt = '0' and adr(0) = '1' )then
                    kanjisel    <= adr(1);
                    updatereq   <= not updateack;
                end if;
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                updateack <= '0';
	    else
                if( req = '0' and (updatereq /= updateack) )then
                    updateack <= not updateack;
                end if;
            end if;
        end if;
    end process;

    -- JIS1 decoding
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                kanjiptr1 <= (others => '0');
	    else
                if( req = '1' and wrt = '1' and adr(1) = '0' )then
                    if( adr(0) = '0' )then
                        kanjiptr1( 10 downto  5 ) <= dbo( 5 downto  0 );
                    else
                        kanjiptr1( 16 downto 11 ) <= dbo( 5 downto  0 );
                    end if;
                    kanjiptr1(  4 downto  0 ) <= (others => '0');
                elsif( req = '0' and (updatereq /= updateack) and kanjisel = '0' )then
                    kanjiptr1(  4 downto  0 ) <= kanjiptr1( 4 downto  0 ) + 1;
                end if;
            end if;
        end if;
    end process;

    -- JIS2 decoding
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                kanjiptr2 <= (others => '0');
	    else
                if( req = '1' and wrt = '1' and adr(1) = '1' )then
                    if( adr(0) = '0' )then
                        kanjiptr2( 10 downto  5 ) <= dbo( 5 downto  0 );
                    else
                        kanjiptr2( 16 downto 11 ) <= dbo( 5 downto  0 );
                    end if;
                    kanjiptr2(  4 downto  0 ) <= (others => '0');
                elsif( req = '0' and (updatereq /= updateack) and kanjisel = '1' )then
                    kanjiptr2(  4 downto  0 ) <= kanjiptr2( 4 downto  0 ) + 1;
                end if;
            end if;
        end if;
    end process;

    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( req = '0' and (updatereq /= updateack) )then
                dbi <= ramdbi;
            end if;
        end if;
    end process;

end rtl;
