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

    component ram
        port (
            adr : in    std_logic_vector( 7 downto 0 );
            clk : in    std_logic;
            we  : in    std_logic;
            dbo : in    std_logic_vector( 7 downto 0 );
            dbi : out   std_logic_vector( 7 downto 0 )
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
    signal w_wave_we        : std_logic;
    signal w_wave_adr       : std_logic_vector(  7 downto 0 );
    signal w_ch_dec         : std_logic_vector(  4 downto 0 );
    signal w_ch_bit         : std_logic;
    signal w_ch_mask        : std_logic_vector(  7 downto 0 );
    signal w_ch_vol         : std_logic_vector(  3 downto 0 );
    signal w_wave           : std_logic_vector(  7 downto 0 );
    signal w_mul            : std_logic_vector( 11 downto 0 );
    signal ram_dbi          : std_logic_vector(  7 downto 0 );
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

    -- internal registers
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
    signal ff_ch_num        : std_logic_vector(  2 downto 0 );
    signal ff_ch_num_dl     : std_logic_vector(  2 downto 0 );
    signal ff_mix           : std_logic_vector( 14 downto 0 );
    signal ff_wave_ce       : std_logic;
    signal ff_wave_ce_dl    : std_logic;
    signal ff_req_dl        : std_logic;
    signal ff_wave_dat      : std_logic_vector(  7 downto 0 );
    signal ff_wave          : std_logic_vector( 14 downto 0 );
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

        elsif (clk21m'event and clk21m = '1') then
            -- mapped i/o port access on b8a0-b8afh (9880-988fh) ... register write
            if( req = '1' and ff_req_dl = '0' and adr(7 downto 5) = "101" and wrt = '1' )then
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

            -- mapped i/o port access on b8c0-b8dfh (98e0-98ffh) ... register write
            if( req = '1' and wrt = '1' and adr(7 downto 5) = "110" )then
                reg_mode_sel <= dbo;
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
        variable ff_cnt_ch_a : std_logic_vector( 11 downto 0 );
        variable ff_cnt_ch_b : std_logic_vector( 11 downto 0 );
        variable ff_cnt_ch_c : std_logic_vector( 11 downto 0 );
        variable ff_cnt_ch_d : std_logic_vector( 11 downto 0 );
        variable ff_cnt_ch_e : std_logic_vector( 11 downto 0 );
    begin
        if (reset = '1') then
            ff_cnt_ch_a := (others => '0');
            ff_cnt_ch_b := (others => '0');
            ff_cnt_ch_c := (others => '0');
            ff_cnt_ch_d := (others => '0');
            ff_cnt_ch_e := (others => '0');

            ff_ptr_ch_a <= (others => '0');
            ff_ptr_ch_b <= (others => '0');
            ff_ptr_ch_c <= (others => '0');
            ff_ptr_ch_d <= (others => '0');
            ff_ptr_ch_e <= (others => '0');
        elsif (clk21m'event and clk21m = '1') then
            if (clkena = '1') then

                if (reg_freq_ch_a(11 downto 3) = "000000000" or ff_rst_ch_a = '1') then
                    ff_ptr_ch_a <= "00000";
                    ff_cnt_ch_a := reg_freq_ch_a;
                elsif (ff_cnt_ch_a = x"000") then
                    ff_ptr_ch_a <= ff_ptr_ch_a + 1;
                    ff_cnt_ch_a := reg_freq_ch_a;
                else
                    ff_cnt_ch_a := ff_cnt_ch_a - 1;
                end if;

                if (reg_freq_ch_b(11 downto 3) = "000000000" or ff_rst_ch_b = '1') then
                    ff_ptr_ch_b <= "00000";
                    ff_cnt_ch_b := reg_freq_ch_b;
                elsif (ff_cnt_ch_b = x"000") then
                    ff_ptr_ch_b <= ff_ptr_ch_b + 1;
                    ff_cnt_ch_b := reg_freq_ch_b;
                else
                    ff_cnt_ch_b := ff_cnt_ch_b - 1;
                end if;

                if (reg_freq_ch_c(11 downto 3) = "000000000" or ff_rst_ch_c = '1') then
                    ff_ptr_ch_c <= "00000";
                    ff_cnt_ch_c := reg_freq_ch_c;
                elsif (ff_cnt_ch_c = x"000") then
                    ff_ptr_ch_c <= ff_ptr_ch_c + 1;
                    ff_cnt_ch_c := reg_freq_ch_c;
                else
                    ff_cnt_ch_c := ff_cnt_ch_c - 1;
                end if;

                if (reg_freq_ch_d(11 downto 3) = "000000000" or ff_rst_ch_d = '1') then
                    ff_ptr_ch_d <= "00000";
                    ff_cnt_ch_d := reg_freq_ch_d;
                elsif (ff_cnt_ch_d = x"000") then
                    ff_ptr_ch_d <= ff_ptr_ch_d + 1;
                    ff_cnt_ch_d := reg_freq_ch_d;
                else
                    ff_cnt_ch_d := ff_cnt_ch_d - 1;
                end if;

                if (reg_freq_ch_e(11 downto 3) = "000000000" or ff_rst_ch_e = '1') then
                    ff_ptr_ch_e <= "00000";
                    ff_cnt_ch_e := reg_freq_ch_e;
                elsif (ff_cnt_ch_e = x"000") then
                    ff_ptr_ch_e <= ff_ptr_ch_e + 1;
                    ff_cnt_ch_e := reg_freq_ch_e;
                else
                    ff_cnt_ch_e := ff_cnt_ch_e - 1;
                end if;

            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- wave memory control
    ----------------------------------------------------------------
    w_wave_adr   <= adr                 when( w_wave_ce = '1'   )else
                ("000" & ff_ptr_ch_a)   when( ff_ch_num = "000" )else
                ("001" & ff_ptr_ch_b)   when( ff_ch_num = "001" )else
                ("010" & ff_ptr_ch_c)   when( ff_ch_num = "010" )else
                ("011" & ff_ptr_ch_d)   when( ff_ch_num = "011" )else
                ("100" & ff_ptr_ch_e);

    wavemem : ram
    port map(
        adr => w_wave_adr   ,
        clk => clk21m       ,
        we  => w_wave_we    ,
        dbo => dbo          ,
        dbi => ram_dbi
    );

    --  wave memory read
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            dbi <= (others => '1');
        elsif( clk21m'event and clk21m = '1' )then
            -- mapped i/o port access on b800-bfffh (9800-9fffh) ... wave memory read data
            if( ff_wave_ce = '1' )then
                dbi <= ram_dbi;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- delay signal
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_wave_ce      <= '0';
            ff_wave_ce_dl   <= '0';
            ff_wave_dat     <= (others => '0');
            ff_ch_num_dl    <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            ff_wave_ce      <= w_wave_ce;
            ff_wave_ce_dl   <= ff_wave_ce;
            ff_wave_dat     <= ram_dbi;
            ff_ch_num_dl    <= ff_ch_num;
        end if;
    end process;

    ----------------------------------------------------------------
    -- mixer control
    ----------------------------------------------------------------
    with ff_ch_num_dl select w_ch_dec <=
        "00001" when "001",
        "00010" when "010",
        "00100" when "011",
        "01000" when "100",
        "10000" when "101",
        "00000" when others;

    w_ch_bit    <=  (w_ch_dec(0) and reg_ch_sel(0)) or
                    (w_ch_dec(1) and reg_ch_sel(1)) or
                    (w_ch_dec(2) and reg_ch_sel(2)) or
                    (w_ch_dec(3) and reg_ch_sel(3)) or
                    (w_ch_dec(4) and reg_ch_sel(4));

    w_ch_mask   <=  (others => w_ch_bit);

    with ff_ch_num_dl select w_ch_vol <=
        reg_vol_ch_a        when "001",
        reg_vol_ch_b        when "010",
        reg_vol_ch_c        when "011",
        reg_vol_ch_d        when "100",
        reg_vol_ch_e        when "101",
        (others => '0') when others;

    w_wave  <=  (w_ch_mask and ff_wave_dat);        -- 8bit 二の補数

    u_mul: scc_wave_mul
    port map (
        a   => w_wave   ,   -- 8bit 二の補数
        b   => w_ch_vol ,   -- 4bit バイナリ（符号無し）
        c   => w_mul        -- 12bit 二の補数
    );

    -- -------------------------------------------------------------
    --  ff_ch_num   X 0   X 1   X 2   X 3   X 4   X 5   X 0
    --  ff_ch_num_dl      X 0   X 1   X 2   X 3   X 4   X 5   X 0
    --  w_wave_adr  X chA X chB X chC X chD X chE
    --  ram_dbi           X chA X chB X chC X chD X chE
    --  ff_wave_dat             X chA X chB X chC X chD X chE
    --  ff_mix                        X a   X ab  X a-c X a-d X a-e X 0
    --  wave                                                        X a-e
    -- -------------------------------------------------------------
    --  w_wave_ce   X 0   X 1   X 0
    --  ff_wave_ce  X 0         X 1   X 0
    --  ff_wave_ce_dl     X 0         X 1   X 0
    --
    --  ff_ch_num   X 0   X 1         X 2   X 3   X 4   X 5   X 0
    --  ff_ch_num_dl      X 0   X 1         X 2   X 3   X 4   X 5   X 0
    --  w_wave_adr  X chA X chB       X chC X chD X chE
    --  ram_dbi           X chA X chB       X chC X chD X chE
    --  ff_wave_dat             X chA X chB       X chC X chD X chE
    --  ff_mix                        X a         X ab  X a-c X a-d X a-e X 0
    --  wave                                                              X a-e
    -- -------------------------------------------------------------
    --  w_wave_ce   X 0                           X 1   X 0
    --  ff_wave_ce  X 0                                 X 1   X 0
    --  ff_wave_ce_dl     X 0                                 X 1   X 0   X
    --                                                               ~~~~~
    --  ff_ch_num   X 0   X 1   X 2   X 3   X 4   X 5   X 0         X 1
    --  ff_ch_num_dl      X 0   X 1   X 2   X 3   X 4   X 5   X 0         X 1   X 2   X
    --                                                         ~~~~~~~~~~~
    --  w_wave_adr  X chA X chB X chC X chD X chE       X chA       X chB X chC X
    --  ram_dbi           X chA X chB X chC X chD X chE       X chA       X chB X chC X
    --  ff_wave_dat             X chA X chB X chC X chD X chE       X chA       X chB X chC X
    --  ff_mix                        X a   X ab  X a-c X a-d X a-e       X 0   X a   X ab  X
    --  wave                                                              X a-e
    --                                                                     ~~~~~
    --  wave は、ff_wave_ce_dl = 0 and ff_ch_num_dl = 0 のとき ff_mix を取り込む
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_ch_num <= "000";
        elsif( clk21m'event and clk21m = '1' )then
            if( ff_wave_ce = '0' )then
                if( ff_ch_num = "101" )then
                    ff_ch_num <= "000";
                else
                    ff_ch_num <= ff_ch_num + 1;
                end if;
            end if;
        end if;
    end process;

    --  mixer
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_mix  <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( ff_wave_ce_dl = '0' )then
                if( ff_ch_num_dl = "000" )then
                    ff_mix  <=  (others => '0');
                else
                    ff_mix  <=  (w_mul(11) & w_mul(11) & w_mul(11) & w_mul) + ff_mix;   -- 15bit 二の補数
                end if;
            end if;
        end if;
    end process;

    --  wave out
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_wave <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( ff_wave_ce_dl = '0' )then
                if( ff_ch_num_dl = "000" )then
                    ff_wave <= ff_mix;  -- 15bit 二の補数
                else
                    --  hold
                end if;
            end if;
        end if;
    end process;

    wave <= ff_wave;
end rtl;
