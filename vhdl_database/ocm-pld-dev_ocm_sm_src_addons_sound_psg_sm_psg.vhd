--
-- sm_psg.vhd
--   Programmable Sound Generator (AY-3-8910/YM2149)
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

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity psg is
    port(
        clk21m      : in    std_logic;
        reset       : in    std_logic;
        clkena      : in    std_logic;
        req         : in    std_logic;
        ack         : out   std_logic;
        wrt         : in    std_logic;
        adr         : in    std_logic_vector( 15 downto 0 );
        dbi         : out   std_logic_vector(  7 downto 0 );
        dbo         : in    std_logic_vector(  7 downto 0 );

        joya_in     : in    std_logic_vector(  5 downto 0 );
        joya_out    : out   std_logic_vector(  1 downto 0 );
        stra        : out   std_logic;
        joyb_in     : in    std_logic_vector(  5 downto 0 );
        joyb_out    : out   std_logic_vector(  1 downto 0 );
        strb        : out   std_logic;

        kana        : out   std_logic;
        cmtin       : in    std_logic;
        keymode     : in    std_logic;

        wave        : out   std_logic_vector(  7 downto 0 )
 );
end psg;

architecture rtl of psg is

    component psg_wave
        port (
            clk21m      : in    std_logic;
            reset       : in    std_logic;
            clkena      : in    std_logic;
            req         : in    std_logic;
            ack         : out   std_logic;
            wrt         : in    std_logic;
            adr         : in    std_logic_vector( 15 downto 0 );
            dbi         : out   std_logic_vector(  7 downto 0 );
            dbo         : in    std_logic_vector(  7 downto 0 );
            wave        : out   std_logic_vector(  7 downto 0 )
        );
    end component;

    -- psg signals
    signal psgdbi       : std_logic_vector(  7 downto 0 );
    signal psgregptr    : std_logic_vector(  3 downto 0 );

    signal rega         : std_logic_vector(  7 downto 0 );
    signal regb         : std_logic_vector(  7 downto 0 );

begin

    ----------------------------------------------------------------
    -- psg register read
    ----------------------------------------------------------------
    dbi <=  rega    when( psgregptr = "1110" and adr(1 downto 0) = "10" )else
            regb    when( psgregptr = "1111" and adr(1 downto 0) = "10" )else
            psgdbi;

    ----------------------------------------------------------------
    -- psg register write
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            psgregptr   <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if (req = '1' and wrt = '1' and adr(1 downto 0) = "00") then
                -- register pointer
                psgregptr <= dbo(3 downto 0);
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( reset = '1' )then
            rega <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            -- psg register #15 bit6 - joystick select : 0=porta, 1=portb
            if( regb(6) = '0' )then
                rega(5 downto 0) <= joya_in;
            else
                rega(5 downto 0) <= joyb_in;
            end if;

            rega(7) <= cmtin;       -- cassete voice input : always '0' on msx turbor
            rega(6) <= keymode;     -- keyboard mode : 1=jis
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( reset = '1' )then
            regb        <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( req = '1' and wrt = '1' and adr(1 downto 0) = "01" )then
                -- psg registers
                if( psgregptr = "1111" )then
                    regb <= dbo;
                end if;
            end if;
        end if;
    end process;

    process( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            -- strobe output
            strb <= regb(5);
            stra <= regb(4);
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( reset = '1' )then
            kana <= '0';
        elsif( clk21m'event and clk21m = '1' )then
            if( regb(7) = '0' )then
                kana <= '0'; -- kana-led : 0=on, Z=off
            else
                kana <= '1'; -- kana-led : 0=on, Z=off
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( reset = '1' )then
                joya_out <= (others => 'Z');
            else
                -- trigger a/b output joystick porta
                case regb(1 downto 0) is
                    when "00"   => joya_out(1 downto 0) <= "00";
                    when "01"   => joya_out(1 downto 0) <= "0Z";
                    when "10"   => joya_out(1 downto 0) <= "Z0";
                    when others => joya_out(1 downto 0) <= "ZZ";
                end case;
            end if;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( reset = '1' )then
                joyb_out <= (others => 'Z');
            else
                -- trigger a/b output joystick portb
                case regb(3 downto 2) is
                    when "00"   => joyb_out(1 downto 0) <= "00";
                    when "01"   => joyb_out(1 downto 0) <= "0Z";
                    when "10"   => joyb_out(1 downto 0) <= "Z0";
                    when others => joyb_out(1 downto 0) <= "ZZ";
                end case;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- connect components
    ----------------------------------------------------------------
    u_psgch: psg_wave
    port map(
        clk21m      => clk21m   ,
        reset       => reset    ,
        clkena      => clkena   ,
        req         => req      ,
        ack         => ack      ,
        wrt         => wrt      ,
        adr         => adr      ,
        dbi         => psgdbi   ,
        dbo         => dbo      ,
        wave        => wave
    );

end rtl;
