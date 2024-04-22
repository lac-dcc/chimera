--
-- megasd.vhd
--   SD/MMC card interface
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

entity megasd is
  port(
    clk21m  : in std_logic;
    reset   : in std_logic;
    clkena  : in std_logic;
    req     : in std_logic;
    ack     : out std_logic;
    wrt     : in std_logic;
    adr     : in std_logic_vector(15 downto 0);
    dbi     : out std_logic_vector(7 downto 0);
    dbo     : in std_logic_vector(7 downto 0);

    ramreq  : out std_logic;
    ramwrt  : out std_logic;
    ramadr  : out std_logic_vector(19 downto 0);
    ramdbi  : in std_logic_vector(7 downto 0);
    ramdbo  : out std_logic_vector(7 downto 0);

    mmcdbi  : out std_logic_vector(7 downto 0);
    mmcena  : out std_logic;
    mmcact  : out std_logic;

    mmc_ck  : out std_logic;
    mmc_cs  : out std_logic;
    mmc_di  : out std_logic;
    mmc_do  : in std_logic;

    epc_ck  : out std_logic;
    epc_cs  : out std_logic;
    epc_oe  : out std_logic;
    epc_di  : out std_logic;
    epc_do  : in std_logic
  );
end megasd;

architecture rtl of megasd is

  signal ErmBank0    : std_logic_vector(7 downto 0);
  signal ErmBank1    : std_logic_vector(7 downto 0);
  signal ErmBank2    : std_logic_vector(7 downto 0);
  signal ErmBank3    : std_logic_vector(7 downto 0);

begin

  ----------------------------------------------------------------
  -- ESE-RAM bank register access
  ----------------------------------------------------------------
  process(clk21m, reset)

  begin

    if (rising_edge(clk21m)) then
        if (reset = '1') then

          ErmBank0   <= X"00";
          ErmBank1   <= X"00";
          ErmBank2   <= X"00";
          ErmBank3   <= X"00";

        else

          -- Mapped I/O port access on 6000-7FFFh ... Bank register write
          if (req = '1' and wrt = '1' and adr(15 downto 13) = "011") then
            case adr(12 downto 11) is
              when "00"   => ErmBank0 <= dbo;
              when "01"   => ErmBank1 <= dbo;
              when "10"   => ErmBank2 <= dbo;
              when others => ErmBank3 <= dbo;
            end case;
          end if;

          ack <= req;

        end if;
    end if;

  end process;

  RamReq <= req when wrt = '0'                                      else
            req when ErmBank0(7) = '1' and adr(14 downto 13) = "10" else
            req when ErmBank2(7) = '1' and adr(14 downto 13) = "00" else
            req when ErmBank3(7) = '1' and adr(14 downto 13) = "01" else '0';
  RamWrt <= wrt;

  RamAdr <= ErmBank0(6 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "10" else
            ErmBank1(6 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "11" else
            ErmBank2(6 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "00" else
            ErmBank3(6 downto 0) & adr(12 downto 0);

  RamDbo <= dbo;
  dbi    <= RamDbi;

  ----------------------------------------------------------------
  -- SD/MMC card access
  ----------------------------------------------------------------
  process(clk21m, reset)

    variable MmcEnx : std_logic;
    variable EpcEna : std_logic;
    variable MmcMod : std_logic_vector(1 downto 0);
    variable MmcSeq : std_logic_vector(4 downto 0);
    variable MmcTmp : std_logic_vector(7 downto 0);
    variable MmcDbo : std_logic_vector(7 downto 0);

  begin

    if (rising_edge(clk21m)) then

      if (reset = '1') then

        MmcEnx := '0';
        EpcEna := '0';
        MmcMod := (others => '0');
        MmcSeq := (others => '0');
        MmcTmp := (others => '1');
        MmcDbo := (others => '1');
        mmcdbi <= (others => '1');

        mmc_ck <= '0';
        mmc_cs <= '1';
        mmc_di <= '0';
        epc_ck <= '1';
        epc_cs <= '1';
        epc_di <= 'Z';

      else

        if (ErmBank0(7 downto 6) = "01") then
          MmcEnx := '1';
        else
          MmcEnx := '0';
        end if;

        if (ErmBank0(7 downto 4) = "0110") then
          EpcEna := '1';
        else
          EpcEna := '0';
        end if;

        if (MmcSeq(0) = '0') then
          case MmcSeq(4 downto 1) is
            when "1001" => mmc_di <= MmcDbo(6); epc_di <= MmcDbo(6);
            when "1000" => mmc_di <= MmcDbo(5); epc_di <= MmcDbo(5);
            when "0111" => mmc_di <= MmcDbo(4); epc_di <= MmcDbo(4);
            when "0110" => mmc_di <= MmcDbo(3); epc_di <= MmcDbo(3);
            when "0101" => mmc_di <= MmcDbo(2); epc_di <= MmcDbo(2);
            when "0100" => mmc_di <= MmcDbo(1); epc_di <= MmcDbo(1);
            when "0011" => mmc_di <= MmcDbo(0); epc_di <= MmcDbo(0);
            when "0010" => mmc_di <= '0';       epc_di <= '1';
            when others => null;
          end case;
        end if;

        if (MmcSeq(0) = '1' and EpcEna = '0') then
          case MmcSeq(4 downto 1) is
            when "1001" => MmcTmp(7) := mmc_do;
            when "1000" => MmcTmp(6) := mmc_do;
            when "0111" => MmcTmp(5) := mmc_do;
            when "0110" => MmcTmp(4) := mmc_do;
            when "0101" => MmcTmp(3) := mmc_do;
            when "0100" => MmcTmp(2) := mmc_do;
            when "0011" => MmcTmp(1) := mmc_do;
            when "0010" => MmcTmp(0) := mmc_do;
            when "0001" => mmcdbi <= MmcTmp;
            when others => null;
          end case;
        elsif (MmcSeq(0) = '1' and EpcEna = '1') then
          case MmcSeq(4 downto 1) is
            when "1001" => MmcTmp(7) := epc_do;
            when "1000" => MmcTmp(6) := epc_do;
            when "0111" => MmcTmp(5) := epc_do;
            when "0110" => MmcTmp(4) := epc_do;
            when "0101" => MmcTmp(3) := epc_do;
            when "0100" => MmcTmp(2) := epc_do;
            when "0011" => MmcTmp(1) := epc_do;
            when "0010" => MmcTmp(0) := epc_do;
            when "0001" => mmcdbi <= MmcTmp;
            when others => null;
          end case;
        end if;

        if (MmcSeq(4 downto 1) < "1011" and MmcSeq(4 downto 1) > "0001") then
          if (EpcEna = '0') then
            mmc_ck <= MmcSeq(0);
            epc_ck <= '1';
          else
            mmc_ck <= '0';
            epc_ck <= MmcSeq(0);
          end if;
        else
          mmc_ck <= '0';
          epc_ck <= '1';
        end if;

        -- Memory mapped I/O port access on 4000-57FFh ... SD/MMC data register
        if (req = '1' and adr(15 downto 13) = "010" and adr(12 downto 11) /= "11" and
            MmcEnx = '1' and MmcSeq = "00000" and MmcMod(0) = '0') then
          if (wrt = '1') then
            MmcDbo := dbo;
          else
            MmcDbo := (others => '1');
          end if;
          if (EpcEna = '0') then
            mmc_cs <= adr(12);
            epc_cs <= '1';
          else
            mmc_cs <= '1';
            epc_cs <= adr(12);
          end if;
          MmcSeq := "10011";
          mmc_di <= MmcDbo(7);
          	  epc_di <= MmcDbo(7);
        elsif (MmcSeq /= "00000") then
          MmcSeq := MmcSeq - 1;
        end if;

        -- Memory mapped I/O port access on 5800-5FFFh ... SD/MMC data register
        if (req = '1' and adr(15 downto 13) = "010" and adr(12 downto 11)  = "11" and MmcEnx = '1' and wrt = '1') then
          MmcMod := dbo(1 downto 0);
        end if;

        if (MmcSeq = "00000") then
          mmcact <= '0';
        else
          mmcact <= '1';
        end if;

      end if;
    end if;

  end process;

  mmcena <= '1' when ErmBank0(7 downto 6) = "01" else '0';
  epc_oe <= '1' when reset = '1' else '0';  -- epc_oe = 0:enable, 1:disable

end rtl;
