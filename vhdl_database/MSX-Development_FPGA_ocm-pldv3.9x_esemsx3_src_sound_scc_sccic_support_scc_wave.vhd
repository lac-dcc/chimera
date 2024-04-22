--
-- scc_wave.vhd
--   Sound generator with wave table
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

--  2007/01/31  modified by t.hara

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

entity scc_wave_mul is
    port(
        a           : in    std_logic_vector(  7 downto 0 );    -- 8bit ２の補数
        b           : in    std_logic_vector(  3 downto 0 );    -- 4bit バイナリ
        c           : out   std_logic_vector( 11 downto 0 )     -- 12bit ２の補数
    );
end scc_wave_mul;

architecture rtl of scc_wave_mul is
    signal w_mul    : std_logic_vector( 12 downto 0 );
begin
    w_mul   <= a * ('0' & b);
    c       <= w_mul( 11 downto 0 );
end rtl;

------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

entity scc_mix_mul is
    port(
        a           : in    std_logic_vector( 15 downto 0 );    -- 16bit ２の補数
        b           : in    std_logic_vector(  2 downto 0 );    -- 3bit バイナリ
        c           : out   std_logic_vector( 18 downto 0 )     -- 19bit ２の補数
    );
end scc_mix_mul;

architecture rtl of scc_mix_mul is
    signal w_mul    : std_logic_vector( 19 downto 0 );
begin
    w_mul   <= a * ('0' & b);
    c       <= w_mul( 18 downto 0 );
end rtl;

------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity scc_wave is
    port(
        clk21m      : in    std_logic;
        reset       : in    std_logic;
        clkena      : in    std_logic;
        req         : in    std_logic;
        ack         : out   std_logic;
        wrt         : in    std_logic;
        adr         : in    std_logic_vector( 7 downto 0 );
        dbi         : out   std_logic_vector( 7 downto 0 );
        dbo         : in    std_logic_vector( 7 downto 0 );
        wave        : out   std_logic_vector( 14 downto 0 )
    );
end scc_wave;

architecture rtl of scc_wave is

    component scc_ram is
        port (
            adr     : in    std_logic_vector( 7 downto 0 );
            clk     : in    std_logic;
            we      : in    std_logic;
            dbi     : in    std_logic_vector( 7 downto 0 );
            dbo1    : out   std_logic_vector( 7 downto 0 );
            dbo2    : out   std_logic_vector( 7 downto 0 )
        );
    end component;

    component scc_interpo is
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
    end component;

    component scc_wave_mul
        port(
            a   : in    std_logic_vector(  7 downto 0 );    -- 8bit ２の補数
            b   : in    std_logic_vector(  3 downto 0 );    -- 4bit バイナリ
            c   : out   std_logic_vector( 11 downto 0 )     -- 12bit ２の補数
        );
    end component;

    -- wire signal
    signal w_wave_ce        : std_logic;
    signal ff_wave_ce       : std_logic;
    signal w_wave_we        : std_logic;
    signal w_wave_adr       : std_logic_vector(  7 downto 0 );
    signal w_ch_dec         : std_logic_vector(  4 downto 0 );
    signal w_ch_bit         : std_logic;
    signal w_ch_mask        : std_logic_vector(  7 downto 0 );
    signal w_ch_vol         : std_logic_vector(  3 downto 0 );
    signal w_wave           : std_logic_vector(  7 downto 0 );
    signal w_mul            : std_logic_vector( 11 downto 0 );
    signal ram_dbi1         : std_logic_vector(  7 downto 0 );
    signal ram_dbi2         : std_logic_vector(  7 downto 0 );
    signal lpf1_wave        : std_logic_vector( 14 downto 0 );
    signal lpf2_wave        : std_logic_vector( 14 downto 0 );
    signal lpf3_wave        : std_logic_vector( 14 downto 0 );

    -- scc resisters
    signal reg_freq_ch_a    : std_logic_vector( 11 downto 0 );
    signal reg_freq_ch_b    : std_logic_vector( 11 downto 0 );
    signal reg_freq_ch_c    : std_logic_vector( 11 downto 0 );
    signal reg_freq_ch_d    : std_logic_vector( 11 downto 0 );
    signal reg_freq_ch_e    : std_logic_vector( 11 downto 0 );
    signal reg_vol_ch_a     : std_logic_vector(  3 downto 0 );
    signal reg_vol_ch_b     : std_logic_vector(  3 downto 0 );
    signal reg_vol_ch_c     : std_logic_vector(  3 downto 0 );
    signal reg_vol_ch_d     : std_logic_vector(  3 downto 0 );
    signal reg_vol_ch_e     : std_logic_vector(  3 downto 0 );
    signal reg_ch_sel       : std_logic_vector(  4 downto 0 );
    signal reg_mode_sel     : std_logic_vector(  7 downto 0 );
    signal reg_th1          : std_logic_vector(  7 downto 0 );
    signal reg_th2          : std_logic_vector(  7 downto 0 );
    signal reg_th3          : std_logic_vector(  7 downto 0 );
    signal reg_interpo_en   : std_logic_vector(  4 downto 0 );

    -- internal registers
    signal ff_cnt_ch_a      : std_logic_vector( 11 downto 0 );
    signal ff_cnt_ch_b      : std_logic_vector( 11 downto 0 );
    signal ff_cnt_ch_c      : std_logic_vector( 11 downto 0 );
    signal ff_cnt_ch_d      : std_logic_vector( 11 downto 0 );
    signal ff_cnt_ch_e      : std_logic_vector( 11 downto 0 );

    signal ff_rst_ch_a      : std_logic;
    signal ff_rst_ch_b      : std_logic;
    signal ff_rst_ch_c      : std_logic;
    signal ff_rst_ch_d      : std_logic;
    signal ff_rst_ch_e      : std_logic;

    signal ff_ptr_ch_a      : std_logic_vector(  4 downto 0 );
    signal ff_ptr_ch_b      : std_logic_vector(  4 downto 0 );
    signal ff_ptr_ch_c      : std_logic_vector(  4 downto 0 );
    signal ff_ptr_ch_d      : std_logic_vector(  4 downto 0 );
    signal ff_ptr_ch_e      : std_logic_vector(  4 downto 0 );

    signal ff_wav_ch_al     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_bl     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_cl     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_dl     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_el     : std_logic_vector(  7 downto 0 );

    signal ff_wav_ch_ar     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_br     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_cr     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_dr     : std_logic_vector(  7 downto 0 );
    signal ff_wav_ch_er     : std_logic_vector(  7 downto 0 );

    signal ff_sample_state  : std_logic_vector(  2 downto 0 );
    signal ff_mix_state     : std_logic_vector(  2 downto 0 );
    signal ff_mix           : std_logic_vector( 14 downto 0 );
    signal ff_req_dl        : std_logic;
    signal ff_wave          : std_logic_vector( 14 downto 0 );

    signal w_upd_ch_a       : std_logic;
    signal w_upd_ch_b       : std_logic;
    signal w_upd_ch_c       : std_logic;
    signal w_upd_ch_d       : std_logic;
    signal w_upd_ch_e       : std_logic;

    signal w_wav_ch_a       : std_logic_vector(  7 downto 0 );
    signal w_wav_ch_b       : std_logic_vector(  7 downto 0 );
    signal w_wav_ch_c       : std_logic_vector(  7 downto 0 );
    signal w_wav_ch_d       : std_logic_vector(  7 downto 0 );
    signal w_wav_ch_e       : std_logic_vector(  7 downto 0 );

    signal w_wave_dat       : std_logic_vector(  7 downto 0 );
begin

    ----------------------------------------------------------------
    -- scc register access
    ----------------------------------------------------------------
    process(clk21m, reset)
    begin
        if( reset = '1' )then
            ff_req_dl       <= '0';

            reg_freq_ch_a   <= (others => '0');
            reg_freq_ch_b   <= (others => '0');
            reg_freq_ch_c   <= (others => '0');
            reg_freq_ch_d   <= (others => '0');
            reg_freq_ch_e   <= (others => '0');

            reg_vol_ch_a    <= (others => '0');
            reg_vol_ch_b    <= (others => '0');
            reg_vol_ch_c    <= (others => '0');
            reg_vol_ch_d    <= (others => '0');
            reg_vol_ch_e    <= (others => '0');

            reg_ch_sel      <= (others => '0');
            reg_mode_sel    <= (others => '0');

            ff_rst_ch_a     <= '0';
            ff_rst_ch_b     <= '0';
            ff_rst_ch_c     <= '0';
            ff_rst_ch_d     <= '0';
            ff_rst_ch_e     <= '0';

            -- 補間関連のレジスタ初期値設定
            reg_th1         <= "00100000";
            reg_th2         <= "01000000";
            reg_th3         <= "10000000";
            reg_interpo_en  <= "00000";

        elsif (clk21m'event and clk21m = '1') then
            -- mapped i/o port access on b8a0-b8afh (9880-988fh) ... register write
            if( req = '1' and ff_req_dl = '0' and adr(7 downto 5) = "101" and wrt = '1' )then   -- xxAxh, xxBxh が該当
                case adr(3 downto 0) is
                    when "0000" => reg_freq_ch_a(  7 downto 0 ) <= dbo( 7 downto 0 ); ff_rst_ch_a <= reg_mode_sel(5);
                    when "0001" => reg_freq_ch_a( 11 downto 8 ) <= dbo( 3 downto 0 ); ff_rst_ch_a <= reg_mode_sel(5);
                    when "0010" => reg_freq_ch_b(  7 downto 0 ) <= dbo( 7 downto 0 ); ff_rst_ch_b <= reg_mode_sel(5);
                    when "0011" => reg_freq_ch_b( 11 downto 8 ) <= dbo( 3 downto 0 ); ff_rst_ch_b <= reg_mode_sel(5);
                    when "0100" => reg_freq_ch_c(  7 downto 0 ) <= dbo( 7 downto 0 ); ff_rst_ch_c <= reg_mode_sel(5);
                    when "0101" => reg_freq_ch_c( 11 downto 8 ) <= dbo( 3 downto 0 ); ff_rst_ch_c <= reg_mode_sel(5);
                    when "0110" => reg_freq_ch_d(  7 downto 0 ) <= dbo( 7 downto 0 ); ff_rst_ch_d <= reg_mode_sel(5);
                    when "0111" => reg_freq_ch_d( 11 downto 8 ) <= dbo( 3 downto 0 ); ff_rst_ch_d <= reg_mode_sel(5);
                    when "1000" => reg_freq_ch_e(  7 downto 0 ) <= dbo( 7 downto 0 ); ff_rst_ch_e <= reg_mode_sel(5);
                    when "1001" => reg_freq_ch_e( 11 downto 8 ) <= dbo( 3 downto 0 ); ff_rst_ch_e <= reg_mode_sel(5);
                    when "1010" => reg_vol_ch_a( 3 downto 0 )   <= dbo( 3 downto 0 );
                    when "1011" => reg_vol_ch_b( 3 downto 0 )   <= dbo( 3 downto 0 );
                    when "1100" => reg_vol_ch_c( 3 downto 0 )   <= dbo( 3 downto 0 );
                    when "1101" => reg_vol_ch_d( 3 downto 0 )   <= dbo( 3 downto 0 );
                    when "1110" => reg_vol_ch_e( 3 downto 0 )   <= dbo( 3 downto 0 );
                    when others => reg_ch_sel(   4 downto 0 )   <= dbo( 4 downto 0 );
                end case;
            elsif (clkena = '1') then
                ff_rst_ch_a <= '0';
                ff_rst_ch_b <= '0';
                ff_rst_ch_c <= '0';
                ff_rst_ch_d <= '0';
                ff_rst_ch_e <= '0';
            end if;

            -- mapped i/o port access on b8c0-b8dfh (98e0-98ffh) ... register write             -- xxCxh, xxDxh が該当
            if( req = '1' and wrt = '1' and adr(7 downto 5) = "110" )then
                reg_mode_sel <= dbo;
            end if;

            -- mapped i/o port access on b8e0-b8ffh (98c0-98dfh) ... register write             -- xxExh, xxFxh が該当
            if( req = '1' and wrt = '1' and adr(7 downto 5) = "111" )then
                case adr(1 downto 0) is
                    when "00"   => reg_interpo_en   <= dbo( 4 downto 0 );
                    when "01"   => reg_th1          <= dbo( 7 downto 0 );
                    when "10"   => reg_th2          <= dbo( 7 downto 0 );
                    when "11"   => reg_th3          <= dbo( 7 downto 0 );
                end case;
            end if;

            ff_req_dl <= req;
        end if;
    end process;

    -- mapped i/o port access on b800-bfffh (9800-9fffh) ... wave memory access
    w_wave_ce   <= '1'  when( req = '1' and ff_req_dl = '0' )else '0';
    w_wave_we   <= wrt  when( req = '1' and ff_req_dl = '0' )else '0';
    ack     <= ff_req_dl;

    ----------------------------------------------------------------
    -- tone generator
    ----------------------------------------------------------------
    process(clk21m, reset)
    begin
        if (reset = '1') then
            ff_cnt_ch_a <= (others => '0');
            ff_cnt_ch_b <= (others => '0');
            ff_cnt_ch_c <= (others => '0');
            ff_cnt_ch_d <= (others => '0');
            ff_cnt_ch_e <= (others => '0');

            ff_ptr_ch_a <= (others => '0');
            ff_ptr_ch_b <= (others => '0');
            ff_ptr_ch_c <= (others => '0');
            ff_ptr_ch_d <= (others => '0');
            ff_ptr_ch_e <= (others => '0');
        elsif (clk21m'event and clk21m = '1') then
            if (clkena = '1') then

                if (reg_freq_ch_a(11 downto 3) = "000000000" or ff_rst_ch_a = '1') then
                    ff_ptr_ch_a <= "00000";
                    ff_cnt_ch_a <= reg_freq_ch_a;
                elsif (ff_cnt_ch_a = x"000") then
                    ff_ptr_ch_a <= ff_ptr_ch_a + 1;
                    ff_cnt_ch_a <= reg_freq_ch_a;
                else
                    ff_cnt_ch_a <= ff_cnt_ch_a - 1;
                end if;

                if (reg_freq_ch_b(11 downto 3) = "000000000" or ff_rst_ch_b = '1') then
                    ff_ptr_ch_b <= "00000";
                    ff_cnt_ch_b <= reg_freq_ch_b;
                elsif (ff_cnt_ch_b = x"000") then
                    ff_ptr_ch_b <= ff_ptr_ch_b + 1;
                    ff_cnt_ch_b <= reg_freq_ch_b;
                else
                    ff_cnt_ch_b <= ff_cnt_ch_b - 1;
                end if;

                if (reg_freq_ch_c(11 downto 3) = "000000000" or ff_rst_ch_c = '1') then
                    ff_ptr_ch_c <= "00000";
                    ff_cnt_ch_c <= reg_freq_ch_c;
                elsif (ff_cnt_ch_c = x"000") then
                    ff_ptr_ch_c <= ff_ptr_ch_c + 1;
                    ff_cnt_ch_c <= reg_freq_ch_c;
                else
                    ff_cnt_ch_c <= ff_cnt_ch_c - 1;
                end if;

                if (reg_freq_ch_d(11 downto 3) = "000000000" or ff_rst_ch_d = '1') then
                    ff_ptr_ch_d <= "00000";
                    ff_cnt_ch_d <= reg_freq_ch_d;
                elsif (ff_cnt_ch_d = x"000") then
                    ff_ptr_ch_d <= ff_ptr_ch_d + 1;
                    ff_cnt_ch_d <= reg_freq_ch_d;
                else
                    ff_cnt_ch_d <= ff_cnt_ch_d - 1;
                end if;

                if (reg_freq_ch_e(11 downto 3) = "000000000" or ff_rst_ch_e = '1') then
                    ff_ptr_ch_e <= "00000";
                    ff_cnt_ch_e <= reg_freq_ch_e;
                elsif (ff_cnt_ch_e = x"000") then
                    ff_ptr_ch_e <= ff_ptr_ch_e + 1;
                    ff_cnt_ch_e <= reg_freq_ch_e;
                else
                    ff_cnt_ch_e <= ff_cnt_ch_e - 1;
                end if;

            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- interpolation
    ----------------------------------------------------------------
    w_upd_ch_a  <= '1' when( reg_freq_ch_a(11 downto 3) = "000000000" or ff_rst_ch_a = '1' or ff_cnt_ch_a = x"000" ) else '0';
    w_upd_ch_b  <= '1' when( reg_freq_ch_b(11 downto 3) = "000000000" or ff_rst_ch_b = '1' or ff_cnt_ch_b = x"000" ) else '0';
    w_upd_ch_c  <= '1' when( reg_freq_ch_c(11 downto 3) = "000000000" or ff_rst_ch_c = '1' or ff_cnt_ch_c = x"000" ) else '0';
    w_upd_ch_d  <= '1' when( reg_freq_ch_d(11 downto 3) = "000000000" or ff_rst_ch_d = '1' or ff_cnt_ch_d = x"000" ) else '0';
    w_upd_ch_e  <= '1' when( reg_freq_ch_e(11 downto 3) = "000000000" or ff_rst_ch_e = '1' or ff_cnt_ch_e = x"000" ) else '0';

    u_interpo_ch_a: scc_interpo
    port map(
        reset       => reset                ,
        clk         => clk21m               ,
        clkena      => clkena               ,
        clear       => w_upd_ch_a           ,
        left        => ff_wav_ch_al         ,
        right       => ff_wav_ch_ar         ,
        wave        => w_wav_ch_a           ,
        reg_en      => reg_interpo_en(0)    ,
        reg_th1     => reg_th1              ,
        reg_th2     => reg_th2              ,
        reg_th3     => reg_th3              ,
        reg_cnt     => reg_freq_ch_a
    );

    u_interpo_ch_b: scc_interpo
    port map(
        reset       => reset                ,
        clk         => clk21m               ,
        clkena      => clkena               ,
        clear       => w_upd_ch_b           ,
        left        => ff_wav_ch_bl         ,
        right       => ff_wav_ch_br         ,
        wave        => w_wav_ch_b           ,
        reg_en      => reg_interpo_en(1)    ,
        reg_th1     => reg_th1              ,
        reg_th2     => reg_th2              ,
        reg_th3     => reg_th3              ,
        reg_cnt     => reg_freq_ch_b
    );

    u_interpo_ch_c: scc_interpo
    port map(
        reset       => reset                ,
        clk         => clk21m               ,
        clkena      => clkena               ,
        clear       => w_upd_ch_c           ,
        left        => ff_wav_ch_cl         ,
        right       => ff_wav_ch_cr         ,
        wave        => w_wav_ch_c           ,
        reg_en      => reg_interpo_en(2)    ,
        reg_th1     => reg_th1              ,
        reg_th2     => reg_th2              ,
        reg_th3     => reg_th3              ,
        reg_cnt     => reg_freq_ch_c
    );

    u_interpo_ch_d: scc_interpo
    port map(
        reset       => reset                ,
        clk         => clk21m               ,
        clkena      => clkena               ,
        clear       => w_upd_ch_d           ,
        left        => ff_wav_ch_dl         ,
        right       => ff_wav_ch_dr         ,
        wave        => w_wav_ch_d           ,
        reg_en      => reg_interpo_en(3)    ,
        reg_th1     => reg_th1              ,
        reg_th2     => reg_th2              ,
        reg_th3     => reg_th3              ,
        reg_cnt     => reg_freq_ch_d
    );

    u_interpo_ch_e: scc_interpo
    port map(
        reset       => reset                ,
        clk         => clk21m               ,
        clkena      => clkena               ,
        clear       => w_upd_ch_e           ,
        left        => ff_wav_ch_el         ,
        right       => ff_wav_ch_er         ,
        wave        => w_wav_ch_e           ,
        reg_en      => reg_interpo_en(4)    ,
        reg_th1     => reg_th1              ,
        reg_th2     => reg_th2              ,
        reg_th3     => reg_th3              ,
        reg_cnt     => reg_freq_ch_e
    );

    ----------------------------------------------------------------
    -- wave memory control
    ----------------------------------------------------------------
    w_wave_adr   <= adr                 when( w_wave_ce = '1'   )else
                ("000" & ff_ptr_ch_a)   when( ff_sample_state   = "000" )else
                ("001" & ff_ptr_ch_b)   when( ff_sample_state   = "001" )else
                ("010" & ff_ptr_ch_c)   when( ff_sample_state   = "010" )else
                ("011" & ff_ptr_ch_d)   when( ff_sample_state   = "011" )else
                ("100" & ff_ptr_ch_e);

    wavemem : scc_ram
    port map(
        adr     => w_wave_adr   ,
        clk     => clk21m       ,
        we      => w_wave_we    ,
        dbi     => dbo          ,
        dbo1    => ram_dbi1     ,
        dbo2    => ram_dbi2
    );

    --  wave memory read
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            dbi <= (others => '1');
        elsif( clk21m'event and clk21m = '1' )then
            -- mapped i/o port access on b800-bfffh (9800-9fffh) ... wave memory read data
            if( ff_wave_ce = '1' )then
                dbi <= ram_dbi1;
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_wave_ce <= '0';
        elsif( clk21m'event and clk21m = '1' )then
            ff_wave_ce <= w_wave_ce;
        end if;
    end process;

    ----------------------------------------------------------------
    -- state control
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_sample_state <= "000";
        elsif( clk21m'event and clk21m = '1' )then
            if( w_wave_ce = '0' )then
                if( ff_sample_state = "101" )then
                    ff_sample_state <= "000";
                else
                    ff_sample_state <= ff_sample_state + 1;
                end if;
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_mix_state <= "000";
        elsif( clk21m'event and clk21m = '1' )then
            if( ff_mix_state = "101" )then
                ff_mix_state <= "000";
            else
                ff_mix_state <= ff_mix_state + 1;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- delay signal (sample state, stage3)
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_wav_ch_al <= (others => '0');
            ff_wav_ch_ar <= (others => '0');
            ff_wav_ch_bl <= (others => '0');
            ff_wav_ch_br <= (others => '0');
            ff_wav_ch_cl <= (others => '0');
            ff_wav_ch_cr <= (others => '0');
            ff_wav_ch_dl <= (others => '0');
            ff_wav_ch_dr <= (others => '0');
            ff_wav_ch_el <= (others => '0');
            ff_wav_ch_er <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( w_wave_ce = '0' )then
                case ff_sample_state is
                    when "001" =>
                        ff_wav_ch_al <= ram_dbi1;
                        ff_wav_ch_ar <= ram_dbi2;
                    when "010" =>
                        ff_wav_ch_bl <= ram_dbi1;
                        ff_wav_ch_br <= ram_dbi2;
                    when "011" =>
                        ff_wav_ch_cl <= ram_dbi1;
                        ff_wav_ch_cr <= ram_dbi2;
                    when "100" =>
                        ff_wav_ch_dl <= ram_dbi1;
                        ff_wav_ch_dr <= ram_dbi2;
                    when "101" =>
                        ff_wav_ch_el <= ram_dbi1;
                        ff_wav_ch_er <= ram_dbi2;
                    when others =>
                        --  hold
                end case;
            else
                --  hold
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- mixer control (mix state, stage0～4)
    ----------------------------------------------------------------
    with ff_mix_state select w_ch_dec <=
        "00001" when "000",
        "00010" when "001",
        "00100" when "010",
        "01000" when "011",
        "10000" when "100",
        "XXXXX" when others;

    w_ch_bit    <=  (w_ch_dec(0) and reg_ch_sel(0)) or
                    (w_ch_dec(1) and reg_ch_sel(1)) or
                    (w_ch_dec(2) and reg_ch_sel(2)) or
                    (w_ch_dec(3) and reg_ch_sel(3)) or
                    (w_ch_dec(4) and reg_ch_sel(4));

    w_ch_mask   <=  (others => w_ch_bit);

    with ff_mix_state select w_ch_vol <=
        reg_vol_ch_a        when "000",
        reg_vol_ch_b        when "001",
        reg_vol_ch_c        when "010",
        reg_vol_ch_d        when "011",
        reg_vol_ch_e        when "100",
        (others => 'X')     when others;

    with ff_mix_state select w_wave_dat <=
        w_wav_ch_a          when "000",
        w_wav_ch_b          when "001",
        w_wav_ch_c          when "010",
        w_wav_ch_d          when "011",
        w_wav_ch_e          when "100",
        (others => 'X')     when others;

    w_wave  <=  (w_ch_mask and w_wave_dat);     -- 8bit 二の補数

    u_mul: scc_wave_mul
    port map (
        a   => w_wave   ,   -- 8bit 二の補数
        b   => w_ch_vol ,   -- 4bit バイナリ（符号無し）
        c   => w_mul        -- 12bit 二の補数
    );

    ----------------------------------------------------------------
    --  mixer (mix state)
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_mix  <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( ff_mix_state = "101" )then
                --  stage5
                ff_mix  <=  (others => '0');
            else
                --  stage0～4
                ff_mix  <=  (w_mul(11) & w_mul(11) & w_mul(11) & w_mul) + ff_mix;   -- 15bit 二の補数
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    --  wave out (mix state, stage5)
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_wave <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( ff_mix_state = "101" )then
                ff_wave <= ff_mix;  -- 15bit 二の補数
            else
                --  hold
            end if;
        end if;
    end process;

    wave <= ff_wave;
end rtl;
