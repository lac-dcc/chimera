--
-- rtc.vhd
--   REAL TIME CLOCK (MSX2 CLOCK-IC)
--   Version 1.00
--
-- Copyright (c) 2008 Takayuki Hara
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

entity rtc is
    port(
        clk21m      : in    std_logic;
        reset       : in    std_logic;

        setup       : in    std_logic;
        rt          : in    std_logic_vector( 64 downto 0 );

        clkena      : in    std_logic;          -- 10Hz
        req         : in    std_logic;
        ack         : out   std_logic;
        wrt         : in    std_logic;
        adr         : in    std_logic_vector( 15 downto 0 );
        dbi         : out   std_logic_vector(  7 downto 0 );
        dbo         : in    std_logic_vector(  7 downto 0 )
 );
end rtc;

architecture rtl of rtc is

    -- ff
    signal ff_req       : std_logic;
    signal ff_1sec_cnt  : std_logic_vector(  3 downto 0 );

    -- register ff
    signal reg_ptr      : std_logic_vector(  3 downto 0 );
    signal reg_mode     : std_logic_vector(  3 downto 0 );      --  te, ae(not supported), m1, m0
    signal reg_sec_l    : std_logic_vector(  3 downto 0 );      --  hl = x"00" ... x"59"
    signal reg_sec_h    : std_logic_vector(  6 downto 4 );
    signal reg_min_l    : std_logic_vector(  3 downto 0 );      --  hl = x"00" ... x"59"
    signal reg_min_h    : std_logic_vector(  6 downto 4 );
    signal reg_hou_l    : std_logic_vector(  3 downto 0 );      --  hl = x"00" ... x"23"
    signal reg_hou_h    : std_logic_vector(  5 downto 4 );      --  hl = x"00" ... x"23"
    signal reg_wee      : std_logic_vector(  2 downto 0 );      --       x"0"  ... x"6"
    signal reg_day_l    : std_logic_vector(  3 downto 0 );      --  hl = x"00" ... x"31"
    signal reg_day_h    : std_logic_vector(  5 downto 4 );      --
    signal reg_mon_l    : std_logic_vector(  3 downto 0 );      --  hl = x"01" ... x"12"
    signal reg_mon_h    : std_logic;
    signal reg_yea_l    : std_logic_vector(  3 downto 0 );      --  hl = x"00" ... x"99"
    signal reg_yea_h    : std_logic_vector(  7 downto 4 );
    signal reg_1224     : std_logic;                            --  '0' = 12hour mode, '1' = 24hour mode
    signal reg_leap     : std_logic_vector(  1 downto 0 );      --  "00" leap year, "01" ... "11" other year

    -- wire
    signal w_adr_dec    : std_logic_vector( 15 downto 0 );
    signal w_bank_dec   : std_logic_vector(  2 downto 0 );
    signal w_wrt        : std_logic;
    signal w_mem_we     : std_logic;
    signal w_mem_addr   : std_logic_vector(  7 downto 0 );
    signal w_mem_q      : std_logic_vector(  7 downto 0 );
    signal w_1sec       : std_logic;
    signal w_10sec      : std_logic;
    signal w_60sec      : std_logic;
    signal w_10min      : std_logic;
    signal w_60min      : std_logic;
    signal w_10hour     : std_logic;
    signal w_1224hour   : std_logic;
    signal w_10day      : std_logic;
    signal w_next_mon   : std_logic;
    signal w_10mon      : std_logic;
    signal w_1year      : std_logic;
    signal w_10year     : std_logic;
    signal w_100year    : std_logic;
    signal w_enable     : std_logic;
begin

    ----------------------------------------------------------------
    -- address decoder
    ----------------------------------------------------------------
    with reg_ptr select w_adr_dec <=
        "0000000000000001" when "0000",
        "0000000000000010" when "0001",
        "0000000000000100" when "0010",
        "0000000000001000" when "0011",
        "0000000000010000" when "0100",
        "0000000000100000" when "0101",
        "0000000001000000" when "0110",
        "0000000010000000" when "0111",
        "0000000100000000" when "1000",
        "0000001000000000" when "1001",
        "0000010000000000" when "1010",
        "0000100000000000" when "1011",
        "0001000000000000" when "1100",
        "0010000000000000" when "1101",
        "0100000000000000" when "1110",
        "1000000000000000" when "1111",
        "XXXXXXXXXXXXXXXX" when others;

    with reg_mode( 1 downto 0 ) select w_bank_dec <=
        "001" when "00",
        "010" when "01",
        "100" when "10",
        "100" when "11",
        "XXX" when others;

    w_wrt <= req and wrt;

    ----------------------------------------------------------------
    -- rtc register read
    ----------------------------------------------------------------
    dbi <=  "1111"    & reg_mode            when(                         w_adr_dec(13) = '1' and adr(0) = '1' )else
            "1111"    & reg_sec_l           when( w_bank_dec(0) = '1' and w_adr_dec( 0) = '1' and adr(0) = '1' )else
            "11110"   & reg_sec_h           when( w_bank_dec(0) = '1' and w_adr_dec( 1) = '1' and adr(0) = '1' )else
            "1111"    & reg_min_l           when( w_bank_dec(0) = '1' and w_adr_dec( 2) = '1' and adr(0) = '1' )else
            "11110"   & reg_min_h           when( w_bank_dec(0) = '1' and w_adr_dec( 3) = '1' and adr(0) = '1' )else
            "1111"    & reg_hou_l           when( w_bank_dec(0) = '1' and w_adr_dec( 4) = '1' and adr(0) = '1' )else
            "111100"  & reg_hou_h           when( w_bank_dec(0) = '1' and w_adr_dec( 5) = '1' and adr(0) = '1' )else
            "11110"   & reg_wee             when( w_bank_dec(0) = '1' and w_adr_dec( 6) = '1' and adr(0) = '1' )else
            "1111"    & reg_day_l           when( w_bank_dec(0) = '1' and w_adr_dec( 7) = '1' and adr(0) = '1' )else
            "111100"  & reg_day_h           when( w_bank_dec(0) = '1' and w_adr_dec( 8) = '1' and adr(0) = '1' )else
            "1111"    & reg_mon_l           when( w_bank_dec(0) = '1' and w_adr_dec( 9) = '1' and adr(0) = '1' )else
            "1111000" & reg_mon_h           when( w_bank_dec(0) = '1' and w_adr_dec(10) = '1' and adr(0) = '1' )else
            "1111"    & reg_yea_l           when( w_bank_dec(0) = '1' and w_adr_dec(11) = '1' and adr(0) = '1' )else
            "1111"    & reg_yea_h           when( w_bank_dec(0) = '1' and w_adr_dec(12) = '1' and adr(0) = '1' )else
            "111100"  & reg_leap            when( w_bank_dec(1) = '1' and w_adr_dec(11) = '1' and adr(0) = '1' )else
            "1111"    & w_mem_q(3 downto 0) when( w_bank_dec(2) = '1'                         and adr(0) = '1' )else
            (others => '1');

    ----------------------------------------------------------------
    -- request and ack
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ff_req <= '0';
	    else
                ff_req <= req;
            end if;
        end if;
    end process;

    ack <= ff_req;

    ----------------------------------------------------------------
    -- mode register [te bit]
    ----------------------------------------------------------------
    w_enable <= clkena and reg_mode(3);

    ----------------------------------------------------------------
    -- 1sec timer
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ff_1sec_cnt <= "1001";
	    else
                if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(1) = '1' and w_adr_dec(15) = '1' )then
                    -- reset register [cr bit]
                    if( dbo(1) = '1' )then
                        ff_1sec_cnt <= "1001";
                    end if;
                elsif( w_1sec = '1' )then
                    ff_1sec_cnt <= "1001";
                elsif( w_enable = '1' )then
                    ff_1sec_cnt <= ff_1sec_cnt - 1;
                end if;
            end if;
        end if;
    end process;

    w_1sec  <=  w_enable when( ff_1sec_cnt = "0000" )else
                '0';

    ----------------------------------------------------------------
    -- 10sec timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 0) = '1' )then
                reg_sec_l <= dbo(3 downto 0);
            elsif( w_1sec = '1' )then
                if( w_10sec = '1' )then
                    reg_sec_l <= "0000";
                else
                    reg_sec_l <= reg_sec_l + 1;
                end if;
            end if;
				if setup = '1' then
					reg_sec_l <= rt(3 downto 0);
				end if;
        end if;
    end process;

    w_10sec <=  '1' when( reg_sec_l = "1001" )else
                '0';

    ----------------------------------------------------------------
    -- 60sec timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 1) = '1' )then
                reg_sec_h <= dbo(2 downto 0);
            elsif( (w_1sec and w_10sec) = '1' )then
                if( w_60sec = '1' )then
                    reg_sec_h <= "000";
                else
                    reg_sec_h <= reg_sec_h + 1;
                end if;
            end if;
				if setup = '1' then
					reg_sec_h <= rt(6 downto 4);
				end if;
        end if;
    end process;

    w_60sec <=  '1' when( reg_sec_h = "101" )else
                '0';

    ----------------------------------------------------------------
    -- 10min timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 2) = '1' )then
                reg_min_l <= dbo(3 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec) = '1' )then
                if( w_10min = '1' )then
                    reg_min_l <= "0000";
                else
                    reg_min_l <= reg_min_l + 1;
                end if;
            end if;
				if setup = '1' then
					reg_min_l <= rt(11 downto 8);
				end if;
        end if;
    end process;

    w_10min <=  '1' when( reg_min_l = "1001" )else
                '0';

    ----------------------------------------------------------------
    -- 60min timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 3) = '1' )then
                reg_min_h <= dbo(2 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min) = '1' )then
                if( w_60min = '1' )then
                    reg_min_h <= "000";
                else
                    reg_min_h <= reg_min_h + 1;
                end if;
            end if;
				if setup = '1' then
					reg_min_h <= rt(14 downto 12);
				end if;
        end if;
    end process;

    w_60min <=  '1' when( reg_min_h = "101" )else
                '0';

    ----------------------------------------------------------------
    -- 10hour timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 4) = '1' )then
                reg_hou_l <= dbo(3 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min) = '1' )then
                if( (w_10hour or w_1224hour) = '1' )then
                    reg_hou_l <= "0000";
                else
                    reg_hou_l <= reg_hou_l + 1;
                end if;
            end if;
				if setup = '1' then
					reg_hou_l <= rt(19 downto 16);
				end if;
        end if;
    end process;

    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 5) = '1' )then
                reg_hou_h <= dbo(1 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min) = '1' )then
                if( w_10hour = '1' )then
                    reg_hou_h <= reg_hou_h + 1;
                elsif( w_1224hour = '1' )then
                    reg_hou_h(5) <= not reg_hou_h(5);
                    reg_hou_h(4) <= '0';
                end if;
            end if;
				if setup = '1' then
					reg_hou_h <= rt(21 downto 20);
				end if;
        end if;
    end process;

    w_10hour    <=  '1' when( reg_hou_l = "1001" )else                              --  09 --> 10
                    '0';

    w_1224hour  <=  '1' when(   (reg_1224 = '0' and reg_hou_h(4) =  '1' and reg_hou_l = "0001") or      --  11 --> 00
                                (reg_1224 = '1' and reg_hou_h    = "10" and reg_hou_l = "0011") )else   --  23 --> 00
                    '0';

    ----------------------------------------------------------------
    -- week day timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 6) = '1' )then
                reg_wee <= dbo(2 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour) = '1' )then
                if( reg_wee = "110" )then
                    reg_wee <= (others => '0');
                else
                    reg_wee <= reg_wee + 1;
                end if;
            end if;
				if setup = '1' then
					reg_wee <= rt(50 downto 48);
				end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- 10day timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 7) = '1' )then
                reg_day_l <= dbo(3 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour) = '1' )then
                if( w_10day = '1' )then
                    reg_day_l <= "0000";
                elsif( w_next_mon = '1' )then
                    reg_day_l <= "0001";
                else
                    reg_day_l <= reg_day_l + 1;
                end if;
            end if;
				if setup = '1' then
					reg_day_l <= rt(27 downto 24);
				end if;
        end if;
    end process;

    w_10day     <=  '1' when( reg_day_l = "1001" )else
                    '0';

    ----------------------------------------------------------------
    -- 1month timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 8) = '1' )then
                reg_day_h <= dbo(1 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour) = '1' )then
                if( w_next_mon = '1' )then
                    reg_day_h <= "00";
                elsif( w_10day = '1' )then
                    reg_day_h <= reg_day_h + 1;
                end if;
            end if;
				if setup = '1' then
					reg_day_h <= rt(29 downto 28);
				end if;
        end if;
    end process;

    w_next_mon  <=  '1' when(   (                                           reg_day_h = "11" and reg_day_l = "0001" ) or                        --  xx/31
                                (reg_mon_h = '0' and reg_mon_l = "0010" and reg_day_h = "10" and reg_day_l = "1001" and reg_leap  = "00" ) or   --  02/29 (leap year)
                                (reg_mon_h = '0' and reg_mon_l = "0010" and reg_day_h = "10" and reg_day_l = "1000" and reg_leap /= "00" ) or   --  02/28
                                (reg_mon_h = '0' and reg_mon_l = "0100" and reg_day_h = "11" and reg_day_l = "0000" ) or                        --  04/30
                                (reg_mon_h = '0' and reg_mon_l = "0110" and reg_day_h = "11" and reg_day_l = "0000" ) or                        --  06/30
                                (reg_mon_h = '0' and reg_mon_l = "1001" and reg_day_h = "11" and reg_day_l = "0000" ) or                        --  09/30
                                (reg_mon_h = '1' and reg_mon_l = "0001" and reg_day_h = "11" and reg_day_l = "0000" ) )else                     --  11/30
                    '0';

    ----------------------------------------------------------------
    -- 10month timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec( 9) = '1' )then
                reg_mon_l <= dbo(3 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour and w_next_mon) = '1' )then
                if( w_10mon = '1' )then
                    reg_mon_l <= "0000";
                elsif( w_1year = '1' )then
                    reg_mon_l <= "0001";
                else
                    reg_mon_l <= reg_mon_l + 1;
                end if;
            end if;
				if setup = '1' then
					reg_mon_l <= rt(35 downto 32);
				end if;
        end if;
    end process;

    w_10mon <=  '1' when( reg_mon_l = "1001" )else
                '0';

    ----------------------------------------------------------------
    -- 1year timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec(10) = '1' )then
                reg_mon_h <= dbo(0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour and w_next_mon) = '1' )then
                if( w_10mon = '1' )then
                    reg_mon_h <= '1';
                elsif( w_1year = '1' )then
                    reg_mon_h <= '0';
                end if;
            end if;
				if setup = '1' then
					reg_mon_h <= rt(36);
				end if;
        end if;
    end process;

    w_1year <=  '1' when( reg_mon_h = '1' and reg_mon_l = "0010" )else      --  x"12"
                '0';

    ----------------------------------------------------------------
    -- 10year timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec(11) = '1' )then
                reg_yea_l <= dbo(3 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour and w_next_mon and w_1year) = '1' )then
                if( w_10year = '1' )then
                    reg_yea_l <= "0000";
                else
                    reg_yea_l <= reg_yea_l + 1;
                end if;
            end if;
				if setup = '1' then
					reg_yea_l <= rt(43 downto 40);
				end if;
        end if;
    end process;

    w_10year    <=  '1' when( reg_yea_l = "1001" )else
                    '0';

    ----------------------------------------------------------------
    -- 100year timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(0) = '1' and w_adr_dec(12) = '1' )then
                reg_yea_h <= dbo(3 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour and w_next_mon and w_1year and w_10year) = '1' )then
                if( w_100year = '1' )then
                    reg_yea_h <= "0000";
                else
                    reg_yea_h <= reg_yea_h + 1;
                end if;
            end if;
				if setup = '1' then
					reg_yea_h <= rt(47 downto 44) + "0010";
				end if;
        end if;
    end process;

    w_100year   <=  '1' when( reg_yea_h = "1001" )else
                    '0';

    ----------------------------------------------------------------
    -- leap year timer
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(1) = '1' and w_adr_dec(11) = '1' )then
                reg_leap <= dbo(1 downto 0);
            elsif( (w_1sec and w_10sec and w_60sec and w_10min and w_60min and w_1224hour and w_next_mon and w_1year) = '1' )then
                reg_leap <= reg_leap + 1;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- 12hour mode/24 hour mode
    ----------------------------------------------------------------
    process( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( w_wrt = '1' and adr(0) = '1' and w_bank_dec(1) = '1' and w_adr_dec(10) = '1' )then
                reg_1224 <= dbo(0);
            end if;
				if setup = '1' then
					reg_1224 <= '1';
				end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- rtc register pointer
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                reg_ptr <= (others => '0');
	    else
                if( w_wrt = '1' and adr(0) = '0' )then
                    -- register pointer
                    reg_ptr <= dbo(3 downto 0);
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- rtc test register
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                reg_mode        <= "1000";
	    else
                if( w_wrt = '1' and adr(0) = '1' and w_adr_dec(13) = '1' )then
                    reg_mode <= dbo(3 downto 0);
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- backup memory emulation
    ----------------------------------------------------------------
    w_mem_addr  <= "00" & reg_mode(1 downto 0) & reg_ptr;
    w_mem_we    <=  '1' when( w_wrt = '1' and adr(0) = '1' )else
                '0';

    u_mem: work.ram
    port map (
        adr     => w_mem_addr   ,
        clk     => clk21m       ,
        we      => w_mem_we     ,
        dbo     => dbo          ,
        dbi     => w_mem_q
    );

end rtl;
