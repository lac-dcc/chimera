--
-- esefir5.vhd
--   5 Tap FIR low-pass filter (cutoff=20000Hz)
--   Revision 1.00
--
-- Copyright (c) 2006 Mitsutaka Okazaki (ESE Artists' factory)
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
--------------------------------------------------------------------------------
-- Description
--------------------------------------------------------------------------------
--   This component is an implementation of 5 tap FIR low-pass
--   simulation circut for ESE-MSX system II.
--   21MHz rate is assumed for an input clock. 3.58MHz is
--   assumed for streaming sample rate of 'wavin' and 'wavout'.
--------------------------------------------------------------------------------

--  修正 t.hara
--  TAP-RAM の読み出し用アドレスと、描き込み用アドレスが共通の FF になっているが
--  この気持ちがずれていて、フィルタ係数の掛かり方がおかしかったのを修正

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity esefir5 is
    generic (
        msbi    : integer
    );
    port (
        clk     : in    std_logic;
        reset   : in    std_logic;
        wavin   : in    std_logic_vector ( msbi downto 0 );
        wavout  : out   std_logic_vector ( msbi downto 0 )
    );
end esefir5;

architecture rtl of esefir5 is

    component tapram is
        generic (
            msbi : integer
        );
        port(
            clk     : in    std_logic;
            tapidx  : in    integer range 0 to 4;
            wr      : in    std_logic;
            tapin   : in    std_logic_vector( msbi downto 0 );
            tapout  : out   std_logic_vector( msbi downto 0 )
        );
    end component;

    subtype h_type  is std_logic_vector( 7 downto 0 );
    type h_array    is array( 0 to 5 ) of h_type;

    constant h          : h_array := ( X"09", X"3d", X"72", X"3d", X"09", X"00" );
    signal tapout       : std_logic_vector( msbi downto 0 );
    signal ff_state     : std_logic_vector( 2 downto 0 );
    signal ff_tapidx    : integer range 0 to 4;
    signal ff_sum       : std_logic_vector( msbi + 8 downto 0 );
    signal ff_wavout    : std_logic_vector( msbi downto 0 );
    signal w_we         : std_logic;
    signal ff_mute      : std_logic_vector( 3 downto 0 );
begin

    ---------------------------------------------------------------------------
    --  出力
    ---------------------------------------------------------------------------
    wavout  <=  ff_wavout when ff_mute = "0000" else (others => '0');

    ---------------------------------------------------------------------------
    --  内部ステート
    ---------------------------------------------------------------------------
    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_state <= "000";
        elsif( clk'event and clk = '1' )then
            if( ff_state = "101" )then
                ff_state <= "000";
            else
                ff_state <= ff_state + 1;
            end if;
        end if;
    end process;

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_tapidx <= 0;
        elsif( clk'event and clk = '1' )then
            if( ff_tapidx = 4 )then
                ff_tapidx <= 0;
            else
                ff_tapidx <= ff_tapidx + 1;
            end if;
        end if;
    end process;

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_mute <= "1010";
        elsif( clk'event and clk = '1' )then
            if( ff_tapidx = 4 )then
                if( ff_mute /= "0000" )then
                    ff_mute <= ff_mute - "0001";
                end if;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    --  積分器
    ---------------------------------------------------------------------------
    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_sum <= (others => '0');
        elsif( clk'event and clk = '1' )then
            if( ff_state = "101" )then
                ff_sum <= (others => '0');
            else
                ff_sum <= ff_sum + tapout * h( conv_integer( ff_state ) );
            end if;
        end if;
    end process;

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_wavout <= (others => '0');
        elsif( clk'event and clk = '1' )then
            if( ff_state = "101" )then
                ff_wavout <= ff_sum( ff_sum'high downto 8 );
            else
                -- hold
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    --  タップメモリ書き込み制御
    ---------------------------------------------------------------------------
    w_we <= '1' when( ff_state = "101" )else
            '0';

    ---------------------------------------------------------------------------
    --  タップメモリインスタンス
    ---------------------------------------------------------------------------
    u0 : tapram generic map (
        msbi    => msbi
    )
    port map (
        clk     => clk      ,
        tapidx  => ff_tapidx,
        wr      => w_we     ,
        tapin   => wavin    ,
        tapout  => tapout
    );
end rtl;
