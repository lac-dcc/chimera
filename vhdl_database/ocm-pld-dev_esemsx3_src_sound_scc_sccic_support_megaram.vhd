--
-- megaram.vhd
--   Mega-ROM emulation, ASC8K/16K/SCC+(8Mbits)
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

--
--  modified by t.hara
--

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity megaram is
    port(
        clk21m  : in    std_logic;
        reset   : in    std_logic;
        clkena  : in    std_logic;
        req     : in    std_logic;
        ack     : out   std_logic;
        wrt     : in    std_logic;
        adr     : in    std_logic_vector(15 downto 0);
        dbi     : out   std_logic_vector( 7 downto 0);
        dbo     : in    std_logic_vector( 7 downto 0);

        ramreq  : out   std_logic;
        ramwrt  : out   std_logic;
        ramadr  : out   std_logic_vector(19 downto 0);
        ramdbi  : in    std_logic_vector( 7 downto 0);
        ramdbo  : out   std_logic_vector( 7 downto 0);

        mapsel  : in    std_logic_vector( 1 downto 0);  -- "-0":SCC+, "01":ASC8K, "11":ASC16K

        wavl    : out   std_logic_vector(14 downto 0);
        wavr    : out   std_logic_vector(14 downto 0)
    );
end megaram;

architecture rtl of megaram is

    component scc_wave
        port(
            clk21m  : in    std_logic;
            reset   : in    std_logic;
            clkena  : in    std_logic;
            req     : in    std_logic;
            ack     : out   std_logic;
            wrt     : in    std_logic;
            adr     : in    std_logic_vector( 7 downto 0);
            dbi     : out   std_logic_vector( 7 downto 0);
            dbo     : in    std_logic_vector( 7 downto 0);
            wave    : out   std_logic_vector(14 downto 0)
        );
    end component;

    signal SccSel       : std_logic_vector( 1 downto 0);
    signal Dec1FFE      : std_logic;
    signal DecSccA      : std_logic;
    signal DecSccB      : std_logic;

    signal WavCpy       : std_logic;
    signal WavReq       : std_logic;
    signal WavAck       : std_logic;
    signal WavAdr       : std_logic_vector( 7 downto 0);
    signal WavDbi       : std_logic_vector( 7 downto 0);

    signal SccBank0     : std_logic_vector( 7 downto 0);
    signal SccBank1     : std_logic_vector( 7 downto 0);
    signal SccBank2     : std_logic_vector( 7 downto 0);
    signal SccBank3     : std_logic_vector( 7 downto 0);
    signal SccModeA     : std_logic_vector( 7 downto 0);
    signal SccModeB     : std_logic_vector( 7 downto 0);

    signal SccAmp       : std_logic_vector(14 downto 0);

begin

    ----------------------------------------------------------------
    -- SCC access decoder
    ----------------------------------------------------------------
    process( reset, clk21m )
        variable flag : std_logic;
    begin
        if( reset = '1' )then
            flag    := '0';
            WavCpy  <= '0';
        elsif( clk21m'event and clk21m = '1' )then
            -- SCC wave memory copy (ch.D > ch.E)
            if( WavReq = '1' and WavAck = '1' )then
                if( wrt = '1' and adr(7 downto 5) = "011" and DecSccA = '1' and flag = '0' )then
                    flag := '1';
                else
                    flag := '0';
                end if;
                WavCpy <= '0';
            elsif( flag = '1' and WavAck = '0' )then
                WavCpy <= '1';
            end if;
        end if;
    end process;

    -- SCC acknowledge
    ack     <=  req     when( SccSel = "00" )else
                WavAck;

    -- RAM request
    RamReq  <=  req     when( SccSel = "01" )else
                '0';
    RamWrt  <=  wrt;

    --ram address (MSB is fixed to '0' in 6000-7FFFh)
    RamAdr(19)          <=  SccModeA(6) when( adr(14 downto 13) /= "11" and mapsel(0) = '0' )else
                            '0'         when(                               mapsel(0) = '0' )else
                            SccBank0(6) when( adr(14 downto 13) = "10"  )else
                            SccBank1(6) when( adr(14 downto 13) = "11"  )else
                            SccBank2(6) when( adr(14 downto 13) = "00"  )else
                            SccBank3(6);
    RamAdr(18 downto 0) <=  SccBank0(5 downto 0) & adr(12 downto 0) when( adr(14 downto 13) = "10" )else
                            SccBank1(5 downto 0) & adr(12 downto 0) when( adr(14 downto 13) = "11" )else
                            SccBank2(5 downto 0) & adr(12 downto 0) when( adr(14 downto 13) = "00" )else
                            SccBank3(5 downto 0) & adr(12 downto 0);

    -- Mapped I/O port access on 9800-98FFh / B800-B8FFh ... Wave memory
    WavReq  <= (req or WavCpy) when SccSel(1) = '1' else '0';

    -- exchange B8A0-B8BF <> 9880-989F (wave_ch.E) / B8C0-B8DF <> 98E0-98FF (mode register)
    WavAdr  <=  "100" & adr(4 downto 0)     when( WavCpy = '1' )else
                (adr(7 downto 0) xor X"20") when( (adr(13) = '0' and adr(7)  = '1') )else
                adr(7 downto 0);

    -- SCC data bus control
    RamDbo  <=  dbo;
    dbi     <=  RamDbi  when( SccSel = "01" )else
                WavDbi  when( SccSel = "10" )else
                (others => '1');

    -- SCC address decoder
    SccSel  <=
            "10" when   -- memory access (scc_wave)
                        (adr(8) = '0' and SccModeB(4) = '0' and mapsel(0) = '0' and
                        (DecSccA = '1' or DecSccB = '1')) else
            "01" when   -- memory access (MEGA-ROM)
                        -- 4000-7FFFh(R/-, ASC8K/16K)
                        (adr(15 downto 14) = "01"  and mapsel(0) = '1'  and                     wrt = '0') or
                        -- 8000-BFFFh(R/-, ASC8K/16K)
                        (adr(15 downto 14) = "10"  and mapsel(0) = '1'  and                     wrt = '0') or
                        -- 4000-5FFFh(R/W, ASC8K/16K)
                        (adr(15 downto 13) = "010" and mapsel(0) = '1'  and SccBank0(7) = '1'            ) or
                        -- 8000-9FFFh(R/W, ASC8K/16K)
                        (adr(15 downto 13) = "100" and mapsel(0) = '1'  and SccBank2(7) = '1'            ) or
                        -- A000-BFFFh(R/W, ASC8K/16K)
                        (adr(15 downto 13) = "101" and mapsel(0) = '1'  and SccBank3(7) = '1'            ) or
                        -- 4000-5FFFh(R/-, SCC)
                        (adr(15 downto 13) = "010" and SccModeA(6) = '0' and                   wrt = '0') or
                        -- 6000-7FFFh(R/-, SCC)
                        (adr(15 downto 13) = "011" and                                         wrt = '0') or
                        -- 8000-9FFFh(R/-, SCC)
                        (adr(15 downto 13) = "100" and                       DecSccA = '0' and wrt = '0') or
                        -- A000-BFFFh(R/-, SCC)
                        (adr(15 downto 13) = "101" and SccModeA(6) = '0' and DecSccB = '0' and wrt = '0') or
                        -- 4000-5FFFh(R/W) ESCC-RAM
                        (adr(15 downto 13) = "010" and SccModeA(4) = '1') or
                        -- 6000-7FFDh(R/W) ESCC-RAM
                        (adr(15 downto 13) = "011" and SccModeA(4) = '1' and Dec1FFE /= '1') or
                        -- 4000-7FFFh(R/W) SNATCHER
                        (adr(15 downto 14) = "01"  and SccModeB(4) = '1') or
                        -- 8000-9FFFh(R/W) SNATCHER
                        (adr(15 downto 13) = "100" and SccModeB(4) = '1') or
                        -- A000-BFFDh(R/W) SNATCHER
                        (adr(15 downto 13) = "101" and SccModeB(4) = '1' and Dec1FFE /= '1')                 else
            "00";       -- MEGA-ROM bank register access

    -- Mapped I/O port access on 7FFE-7FFFh / BFFE-BFFFh ... Write protect / SPC mode register
    Dec1FFE <= '1' when( adr(12 downto 1) = "111111111111" )else '0';
    -- Mapped I/O port access on 9800-9FFFh ... Wave memory
    DecSccA <= '1' when( adr(15 downto 11) = "10011" and SccModeB(5) = '0' and SccBank2(5 downto 0) = "111111" )else '0';
    -- Mapped I/O port access on B800-BFFFh ... Wave memory
    DecSccB <= '1' when( adr(15 downto 11) = "10111" and SccModeB(5) = '1' and SccBank3(7) = '1' )else '0';

    ----------------------------------------------------------------
    -- SCC bank register
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            SccBank0    <= X"00";
            SccBank1    <= X"01";
            SccBank2    <= X"02";
            SccBank3    <= X"03";
            SccModeA    <= (others => '0');
            SccModeB    <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( mapsel(0) = '0' )then

                -- Mapped I/O port access on 5000-57FFh ... Bank register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 11) = "01010" and
                        SccModeA(6) = '0' and SccModeA(4) = '0' and SccModeB(4) = '0') then
                    SccBank0 <= dbo;
                end if;
                -- Mapped I/O port access on 7000-77FFh ... Bank register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 11) = "01110" and
                        SccModeA(6) = '0' and SccModeA(4) = '0' and SccModeB(4) = '0') then
                    SccBank1 <= dbo;
                end if;
                -- Mapped I/O port access on 9000-97FFh ... Bank register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 11) = "10010" and
                        SccModeB(4) = '0') then
                    SccBank2 <= dbo;
                end if;
                -- Mapped I/O port access on B000-B7FFh ... Bank register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 11) = "10110" and
                        SccModeA(6) = '0' and SccModeA(4) = '0' and SccModeB(4) = '0') then
                    SccBank3 <= dbo;
                end if;
                -- Mapped I/O port access on 7FFE-7FFFh ... Register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 13) = "011" and
                        Dec1FFE = '1' and SccModeB(5 downto 4) = "00") then
                    SccModeA <= dbo;
                end if;
                -- Mapped I/O port access on BFFE-BFFFh ... Register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 13) = "101" and
                        Dec1FFE = '1' and SccModeA(6) = '0' and SccModeA(4) = '0') then
                    SccModeB <= dbo;
                end if;

            else

                -- Mapped I/O port access on 6000-6FFFh ... Bank register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 12) = "0110") then
                    -- ASC8K / 6000-67FFh
                    if (mapsel(1) = '0' and adr(11) = '0') then
                        SccBank0 <= dbo;
                    -- ASC8K / 6800-6FFFh
                    elsif (mapsel(1) = '0' and adr(11) = '1') then
                        SccBank1 <= dbo;
                    -- ASC16K / 6000-67FFh
                    elsif (adr(11) = '0') then
                        SccBank0 <= dbo(7) & dbo(5 downto 0) & '0';
                        SccBank1 <= dbo(7) & dbo(5 downto 0) & '1';
                    end if;
                end if;

                -- Mapped I/O port access on 7000-7FFFh ... Bank register write
                if (req = '1' and SccSel = "00" and wrt = '1' and adr(15 downto 12) = "0111") then
                    -- ASC8K / 7000-77FFh
                    if (mapsel(1) = '0' and adr(11) = '0') then
                        SccBank2 <= dbo;
                    -- ASC8K / 7800-7FFFh
                    elsif (mapsel(1) = '0' and adr(11) = '1') then
                        SccBank3 <= dbo;
                    -- ASC16K / 7000-77FFh
                    elsif (adr(11) = '0') then
                        SccBank2 <= dbo(7) & dbo(5 downto 0) & '0';
                        SccBank3 <= dbo(7) & dbo(5 downto 0) & '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- Connect components
    ----------------------------------------------------------------
    SccCh : scc_wave
    port map(
        clk21m  => clk21m       ,
        reset   => reset        ,
        clkena  => clkena       ,
        req     => WavReq       ,
        ack     => WavAck       ,
        wrt     => wrt          ,
        adr     => WavAdr       ,
        dbi     => WavDbi       ,
        dbo     => dbo          ,
        wave    => SccAmp
    );

    ----------------------------------------------------------------
    -- Wave output (L / R)
    ----------------------------------------------------------------
    wavl <= SccAmp;
    wavr <= SccAmp;

end rtl;
