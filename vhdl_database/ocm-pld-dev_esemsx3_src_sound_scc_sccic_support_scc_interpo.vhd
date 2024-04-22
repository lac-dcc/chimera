--
-- scc_interpo.vhd
--   SCC intelligent interpolation
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

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity scc_interpo is
    port(
        reset       : in    std_logic;                          -- 非同期リセット
        clk         : in    std_logic;                          -- ベースクロック
        clkena      : in    std_logic;                          -- クロックイネーブラ
        clear       : in    std_logic;                          -- 同期リセット
        left        : in    std_logic_vector(  7 downto 0 );    -- 補間左側サンプル
        right       : in    std_logic_vector(  7 downto 0 );    -- 補間右側サンプル
        wave        : out   std_logic_vector(  7 downto 0 );    -- 出力サンプル
        reg_en      : in    std_logic;                          -- 補間有効/無効
        reg_th1     : in    std_logic_vector(  7 downto 0 );    -- 閾値1
        reg_th2     : in    std_logic_vector(  7 downto 0 );    -- 閾値2
        reg_th3     : in    std_logic_vector(  7 downto 0 );    -- 閾値3
        reg_cnt     : in    std_logic_vector( 11 downto 0 )     -- 分周比
    );
end scc_interpo;

architecture rtl of scc_interpo is
    signal ff_sign      : std_logic_vector(  1 downto 0 );      -- 符号付き
    signal ff_abs       : std_logic_vector(  7 downto 0 );
    signal ff_left_d1   : std_logic_vector(  7 downto 0 );      -- 符号付き
    signal ff_itg       : std_logic_vector( 12 downto 0 );
    signal ff_add       : std_logic_vector(  8 downto 0 );      -- 符号付き
    signal ff_ch_x      : std_logic_vector(  7 downto 0 );      -- 符号付き

    signal w_diff       : std_logic_vector(  8 downto 0 );      -- 符号付き
    signal w_dir        : std_logic_vector(  8 downto 0 );      -- 符号付き
    signal w_sign       : std_logic_vector(  1 downto 0 );      -- 符号付き
    signal w_msbfil     : std_logic_vector(  7 downto 0 );
    signal w_comp       : std_logic_vector(  7 downto 0 );      -- １の補数
    signal w_abs        : std_logic_vector(  7 downto 0 );
    signal w_abssft     : std_logic_vector(  7 downto 0 );
    signal w_preitg     : std_logic_vector( 12 downto 0 );
    signal w_itg        : std_logic_vector( 12 downto 0 );
    signal w_chuck      : std_logic_vector( 11 downto 0 );
    signal w_carry      : std_logic_vector( 11 downto 0 );
    signal w_addsign    : std_logic_vector(  1 downto 0 );
    signal w_addsign_s  : std_logic_vector(  8 downto 1 );
    signal w_preadd     : std_logic_vector(  8 downto 0 );      -- 符号付き
    signal w_prech_x    : std_logic_vector(  9 downto 0 );      -- 符号付き
    signal w_ch_x       : std_logic_vector(  7 downto 0 );      -- 符号付き
begin

    --  stage1
    w_diff  <=  (right(7) & right) - (left(7) & left);
    w_dir   <=  (right(7) & right) - (w_ch_x(7) & w_ch_x);
    w_sign  <=  w_dir(8) & '0' when( w_dir = "000000000" )else
                w_dir(8) & '1';
    w_msbfil<=  (others => w_diff(8));
    w_comp  <=  w_diff( 7 downto 0 ) xor w_msbfil;
    w_abs   <=  w_comp + ("0000000" & w_diff(8));

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_sign     <= "00";
            ff_abs      <= (others => '0');
            ff_left_d1  <= (others => '0');
        elsif( clk'event and clk = '1' )then
            if( clkena = '1' )then
                ff_sign     <= w_sign;
                ff_abs      <= w_abs;
                ff_left_d1  <= left;
            end if;
        end if;
    end process;

    --  stage2
    w_abssft    <=  ff_abs                          when( ff_abs < reg_th1 )else
                    '0' & ff_abs( 7 downto 1 )      when( ff_abs < reg_th2 )else
                    "00" & ff_abs( 7 downto 2 )     when( ff_abs < reg_th3 )else
                    "000" & ff_abs( 7 downto 3 );
    w_preitg    <=  ("00000" & w_abssft) + ff_itg;
    w_itg       <=  w_preitg - ('0' & w_chuck);

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_itg      <= (others => '0');
        elsif( clk'event and clk = '1' )then
            if( clkena = '1' )then
                ff_itg      <= w_itg;
            end if;
        end if;
    end process;

    w_chuck     <=  w_carry and reg_cnt;
    w_carry     <=  (others => '1') when( ff_itg > ('0' & reg_cnt) )else
                    (others => '0');
    w_addsign   <=  w_carry( 1 downto 0 ) and ff_sign;
    w_addsign_s <=  (others => w_addsign(1));
    w_preadd    <=  (w_addsign_s & w_addsign(0)) + ff_add;

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_add  <=  (others => '0');
        elsif( clk'event and clk = '1' )then
            if( clkena = '1' )then
                if( clear = '1' )then
                    ff_add  <=  (others => '0');
                else
                    ff_add  <=  w_preadd;
                end if;
            end if;
        end if;
    end process;

    w_prech_x   <=  (ff_add(8) & ff_add) + (ff_left_d1(7) & ff_left_d1(7) & ff_left_d1);
    w_ch_x      <=  "01111111" when( w_prech_x(9) = '0' and (w_prech_x(8) or  w_prech_x(7)) = '1' )else
                    "10000000" when( w_prech_x(9) = '1' and (w_prech_x(8) and w_prech_x(7)) = '0' )else
                    w_prech_x( 9 ) & w_prech_x( 6 downto 0 );

    process( reset, clk )
    begin
        if( reset = '1' )then
            ff_ch_x <=  (others => '0');
        elsif( clk'event and clk = '1' )then
            if( clkena = '1' )then
                if( reg_en = '1' )then
                    --  補間有効
                    ff_ch_x <=  w_ch_x;
                else
                    --  補間無効
                    ff_ch_x <=  ff_left_d1;
                end if;
            end if;
        end if;
    end process;

    --  stage3
    wave <= ff_ch_x;

end rtl;
