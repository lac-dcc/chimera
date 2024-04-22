--
-- emsx_top.vhd
--   ESE MSX-SYSTEM3 / MSX clone on a Cyclone FPGA (ALTERA)
--   Revision 1.00
--
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--      this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--      product or activity without specific prior written permission.
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
--------------------------------------------------------------------------------------
-- OCM-PLD Pack v3.4.1 by KdL (2017.09.22) / MSX2+ Stable Release / MSXtR Experimental
-- Special thanks to t.hara, caro, mygodess & all MRC users (http://www.msx.org)
--------------------------------------------------------------------------------------
--

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use work.vdp_package.all;

entity emsx_top is
    port(
        -- Clock, Reset ports
        clk21m          : in    std_logic;                          -- VDP Clock   .. 21.47727MHz
        memclk          : in    std_logic;                          -- SDRAM clock .. 85.90908MHz
        pReset          : in    std_logic;
        pColdReset      : in    std_logic;

        -- SD-RAM ports
        pMemCke         : out   std_logic;                          -- SD-RAM Clock enable
        pMemCs_n        : out   std_logic;                          -- SD-RAM Chip select
        pMemRas_n       : out   std_logic;                          -- SD-RAM Row/RAS
        pMemCas_n       : out   std_logic;                          -- SD-RAM /CAS
        pMemWe_n        : out   std_logic;                          -- SD-RAM /WE
        pMemUdq         : out   std_logic;                          -- SD-RAM UDQM
        pMemLdq         : out   std_logic;                          -- SD-RAM LDQM
        pMemBa1         : out   std_logic;                          -- SD-RAM Bank select address 1
        pMemBa0         : out   std_logic;                          -- SD-RAM Bank select address 0
        pMemAdr         : out   std_logic_vector( 12 downto 0 );    -- SD-RAM Address
        pMemDatIn       : in    std_logic_vector( 15 downto 0 );    -- SD-RAM Data
        pMemDatOut      : out   std_logic_vector(  7 downto 0 );    -- SD-RAM Data
        pMemDatEn       : out   std_logic;

        -- PS/2 keyboard ports
        ps2_key         : in    std_logic_vector( 10 downto 0);
        pCaps           : out   std_logic;

        rtc_setup       : in    std_logic;
        rtc_time        : in    std_logic_vector( 64 downto 0);

        -- Joystick ports (Port_A, Port_B)
        pJoyA           : in    std_logic_vector(  5 downto 0);
        pStrA           : out   std_logic;
        pJoyB           : in    std_logic_vector(  5 downto 0);
        pStrB           : out   std_logic;

        -- SD/MMC slot ports
        mmc_sck         : out   std_logic;
        mmc_cs          : out   std_logic;
        mmc_mosi        : out   std_logic;
        mmc_miso        : in    std_logic;
 
        -- DIP switch, Lamp ports
        pDip            : in    std_logic_vector(  7 downto 0);     -- 0=On,    1=Off (default on shipment)
        pLed            : out   std_logic_vector(  7 downto 0);     -- 0=Off,   1=On  (green)
        pLedPwr         : out   std_logic;                          -- 0=Off,   1=On  (red)
        pR800           : in    std_logic;

        -- Video, Audio/CMT ports
        pDac_VR         : out   std_logic_vector(  5 downto 0);     -- RGB_Red
        pDac_VG         : out   std_logic_vector(  5 downto 0);     -- RGB_Grn
        pDac_VB         : out   std_logic_vector(  5 downto 0);     -- RGB_Blu

        pVideoDE        : out   std_logic;
        pVideoHS        : out   std_logic;
        pVideoVS        : out   std_logic;
        pScandoubler    : in    std_logic;

        cmtin           : in    std_logic;   						-- EAR 
		
        pAudioPSG       : out   std_logic_vector(  9 downto 0);
        pAudioOPLL      : out   std_logic_vector( 13 downto 0);
        pAudioPCM       : out   std_logic_vector( 15 downto 0);
        pAudioTRPCM     : out   std_logic_vector(  7 downto 0)
    );
end emsx_top;

architecture RTL of emsx_top is

    -- Switched I/O ports
    signal  swio_req        : std_logic;
    signal  swio_dbi        : std_logic_vector(  7 downto 0 );
    signal  io40_n          : std_logic_vector(  7 downto 0 );
    signal  io41_id212_n    : std_logic_vector(  7 downto 0 );              -- here to reduce LEs
    signal  io42_id212      : std_logic_vector(  7 downto 0 );
    signal  io43_id212      : std_logic_vector(  7 downto 0 );
    alias   RstKeyLock      : std_logic is io43_id212(5);
    signal  io44_id212      : std_logic_vector(  7 downto 0 );
    alias   GreenLeds       : std_logic_vector(  7 downto 0 ) is io44_id212;
    signal  CustomSpeed     : std_logic_vector(  3 downto 0 );
    signal  tMegaSD         : std_logic;
    signal  tPanaRedir      : std_logic;                                    -- here to reduce LEs
    signal  VdpSpeedMode         : std_logic;
    signal  V9938_n         : std_logic;
    signal  Mapper_req      : std_logic;                                    -- here to reduce LEs
    signal  Mapper_ack      : std_logic;
    signal  MegaSD_req      : std_logic;                                    -- here to reduce LEs
    signal  MegaSD_ack      : std_logic;
    signal  io41_id008_n    : std_logic;
    signal  swioKmap        : std_logic;
    signal  CmtScro         : std_logic;
    signal  swioCmt         : std_logic;
    signal  LightsMode      : std_logic;
    signal  Red_sta         : std_logic;
    signal  LastRst_sta     : std_logic;                                    -- here to reduce LEs
    signal  RstReq_sta      : std_logic;                                    -- here to reduce LEs
    signal  Blink_ena       : std_logic;
    signal  pseudoStereo    : std_logic;
    signal  extclk3m        : std_logic;
    signal  right_inverse   : std_logic;
    signal  vram_slot_ids   : std_logic_vector(  7 downto 0 );
    signal  vram_page       : std_logic_vector(  7 downto 0 );
    signal  DefKmap         : std_logic;                                    -- here to reduce LEs
    signal  ff_dip_req      : std_logic_vector(  7 downto 0 );
    signal  ff_dip_ack      : std_logic_vector(  7 downto 0 );              -- here to reduce LEs
    signal  LevCtrl         : std_logic_vector(  2 downto 0 );
    signal  GreenLvEna      : std_logic;
    signal  swioRESET_n     : std_logic;
    signal  warmRESET       : std_logic;
    signal  WarmMSXlogo     : std_logic;                                    -- here to reduce LEs
    signal  ZemmixNeo       : std_logic;
    signal  JIS2_ena        : std_logic;
    signal  portF4_mode     : std_logic;
    signal  RatioMode       : std_logic_vector(  2 downto 0 );
    signal  centerYJK_R25_n : std_logic;
    signal  legacy_sel      : std_logic;
    signal  Slot0_req       : std_logic;                                    -- here to reduce LEs
    signal  Slot0Mode       : std_logic;

    -- System timer (S1990)
    signal  systim_req      : std_logic;
    signal  systim_dbi      : std_logic_vector(  7 downto 0 );

    -- Operation mode
    signal  w_key_mode      : std_logic;                                    -- Kana key board layout: 1=JIS layout
    signal  Kmap            : std_logic;                                    -- '0': Japanese-106    '1': Non-Japanese (English-101, French, ..)
    signal  DisplayMode     : std_logic_vector(  1 downto 0 );
    signal  Slot1Mode       : std_logic;
    signal  Slot2Mode       : std_logic_vector(  1 downto 0 );
    alias   FullRAM         : std_logic is Mapper_ack;                      -- '0': 2048 kB RAM     '1': 4096 kB RAM
    alias   MmcMode         : std_logic is MegaSD_ack;                      -- '0': disable SD/MMC  '1': enable SD/MMC

    -- Clock, Reset control signals
    signal  cpucen          : std_logic;
    signal  cpucen_n        : std_logic;
    signal  clkdiv          : std_logic_vector(  1 downto 0 );
    signal  ff_clksel       : std_logic;
    signal  ff_clksel5m_n   : std_logic;
    signal  hybridclk_n     : std_logic;
    signal  hstartcount     : std_logic_vector(  2 downto 0 );
    signal  htoutcount      : std_logic_vector(  2 downto 0 );
    signal  reset           : std_logic;
    signal  RstEna          : std_logic := '0';
    signal  FirstBoot_n     : std_logic := '0';
    signal  RstSeq          : std_logic_vector(  4 downto 0 ) := (others => '0');
    signal  FreeCounter     : std_logic_vector( 15 downto 0 ) := (others => '0');
    signal  HoldRst_ena     : std_logic := '0';
    signal  HardRst_cnt     : std_logic_vector(  3 downto 0 ) := (others => '0');
    signal  LogoRstCnt      : std_logic_vector(  4 downto 0 ) := (others => '0');
    signal  logo_timeout    : std_logic_vector(  1 downto 0 );

    -- Turbo CPU clock enablers
    signal  cpucen_5m          : std_logic;
    signal  cpucen_5m_n        : std_logic;
    signal  cpucen_10m          : std_logic;
    signal  cpucen_10m_n        : std_logic;

    -- CPU clock enablers to use
    signal  trueCen          : std_logic;
    signal  trueCen_n        : std_logic;

    -- MSX cartridge slot control signals
    signal  BusDir          : std_logic;
    signal  iSltRfsh_n      : std_logic;
    signal  iSltMerq_n      : std_logic;
    signal  iSltIorq_n      : std_logic;
    signal  xSltRd_n        : std_logic;
    signal  xSltWr_n        : std_logic;
    signal  iSltAdr         : std_logic_vector( 15 downto 0 );
    signal  iSltDat         : std_logic_vector(  7 downto 0 );
    signal  dlydbi          : std_logic_vector(  7 downto 0 );
    signal  CpuM1_n         : std_logic;
    signal  CpuRfsh_n       : std_logic;
    signal  cpu_di          : std_logic_vector(  7 downto 0 );
    signal  cpu_do          : std_logic_vector(  7 downto 0 );

    -- Internal bus signals (common)
    signal  req             : std_logic;
    signal  ack             : std_logic;
    signal  iack            : std_logic;
    signal  mem             : std_logic;
    signal  wrt             : std_logic;
    signal  adr             : std_logic_vector( 15 downto 0 );
    signal  dbi             : std_logic_vector(  7 downto 0 );
    signal  dbo             : std_logic_vector(  7 downto 0 );

    -- Primary, Expansion slot signals
    signal  ExpDbi          : std_logic_vector(  7 downto 0 );
    signal  ExpSlot0        : std_logic_vector(  7 downto 0 );
    signal  ExpSlot3        : std_logic_vector(  7 downto 0 );
    signal  PriSltNum       : std_logic_vector(  1 downto 0 );
    signal  ExpSltNum0      : std_logic_vector(  1 downto 0 );
    signal  ExpSltNum3      : std_logic_vector(  1 downto 0 );

    -- Slot decode signals
    signal  iSltBot         : std_logic;
    signal  iSltMap         : std_logic;
    signal  jSltMem         : std_logic;
    signal  iSltScc1        : std_logic;
    signal  jSltScc1        : std_logic;
    signal  iSltScc2        : std_logic;
    signal  jSltScc2        : std_logic;
    signal  iSltErm         : std_logic;

    -- BIOS-ROM decode signals
    signal  RomReq          : std_logic;
    signal  rom_main        : std_logic;
    signal  rom_opll        : std_logic;
    signal  rom_extd        : std_logic;
    signal  rom_kanj        : std_logic;

    signal  rom_xbas        : std_logic;
    signal  rom_free        : std_logic;

    -- IPL-ROM signals
    signal  RomDbi          : std_logic_vector(  7 downto 0 );
    signal  ff_ldbios_n     : std_logic;

    -- ESE-RAM signals
    signal  ErmReq          : std_logic;
    signal  ErmRam          : std_logic;
    signal  ErmWrt          : std_logic;
    signal  ErmAdr          : std_logic_vector( 19 downto 0 );

    -- SD/MMC signals
    signal  MmcEna          : std_logic;
    signal  MmcAct          : std_logic;
    signal  MmcDbi          : std_logic_vector(  7 downto 0 );
    signal  MmcEnaLed       : std_logic;

    -- Mapper RAM signals
    signal  MapReq          : std_logic;
    signal  MapDbi          : std_logic_vector(  7 downto 0 );
    signal  MapRam          : std_logic;
    signal  MapWrt          : std_logic;
    signal  MapAdr          : std_logic_vector( 21 downto 0 );

    -- PPI(8255) signals
    signal  PpiReq          : std_logic;
    signal  PpiDbi          : std_logic_vector(  7 downto 0 );
    signal  PpiPortA        : std_logic_vector(  7 downto 0 );
    signal  PpiPortB        : std_logic_vector(  7 downto 0 );
    signal  PpiPortC        : std_logic_vector(  7 downto 0 );

    signal  w_page_dec      : std_logic_vector(  3 downto 0 );
    signal  w_prislt_dec    : std_logic_vector(  3 downto 0 );
    signal  w_expslt0_dec   : std_logic_vector(  3 downto 0 );
    signal  w_expslt3_dec   : std_logic_vector(  3 downto 0 );

    -- PS/2 signals
    signal  Paus            : std_logic;
    signal  Scro            : std_logic;
    signal  Reso            : std_logic;
    signal  Reso_v          : std_logic;
    signal  Fkeys           : std_logic_vector(  7 downto 0 );

    -- 1 bit sound port signal
    alias   KeyClick        : std_logic is PpiPortC(7);

    -- RTC signals
    signal  RtcReq          : std_logic;
    signal  RtcAck          : std_logic;
    signal  RtcDbi          : std_logic_vector(  7 downto 0 );

    -- Kanji signals
    signal  KanReq          : std_logic;
    signal  KanDbi          : std_logic_vector(  7 downto 0 );
    signal  KanRom          : std_logic;
    signal  KanAdr          : std_logic_vector( 17 downto 0 );

    -- VDP signals
    signal  VdpReq          : std_logic;
    signal  VdpDbi          : std_logic_vector(  7 downto 0 );
    signal  VideoSC         : std_logic;
    signal  VideoDLClk      : std_logic;
    signal  VideoDHClk      : std_logic;
    signal  WeVdp_n         : std_logic;
    signal  VdpAdr          : std_logic_vector( 16 downto 0 );
    signal  VrmDbo          : std_logic_vector(  7 downto 0 );
    signal  VrmDbi          : std_logic_vector( 15 downto 0 );
    signal  MemDbi          : std_logic_vector( 15 downto 0 );
    signal  pVdpInt_n       : std_logic;
    signal  ntsc_pal_type   : std_logic;
    signal  forced_v_mode   : std_logic;
    signal  legacy_vga      : std_logic;

    -- Video signals
    signal  VideoR          : std_logic_vector( 5 downto 0 );               -- RGB_Red
    signal  VideoG          : std_logic_vector( 5 downto 0 );               -- RGB_Green
    signal  VideoB          : std_logic_vector( 5 downto 0 );               -- RGB_Blue
    signal  VideoHS_n       : std_logic;                                    -- Holizontal Sync
    signal  VideoVS_n       : std_logic;                                    -- Vertical Sync

    -- PSG signals
    signal  PsgReq          : std_logic;
    signal  PsgDbi          : std_logic_vector(  7 downto 0 );
    signal  PsgAmp          : std_logic_vector(  9 downto 0 );

    -- SCC signals
    signal  Scc1Req         : std_logic;
    signal  Scc1Ack         : std_logic;
    signal  Scc1Dbi         : std_logic_vector(  7 downto 0 );
    signal  Scc1Ram         : std_logic;
    signal  Scc1Wrt         : std_logic;
    signal  Scc1Adr         : std_logic_vector( 20 downto 0 );
    signal  Scc1AmpL        : std_logic_vector( 14 downto 0 );

    signal  Scc2Req         : std_logic;
    signal  Scc2Ack         : std_logic;
    signal  Scc2Dbi         : std_logic_vector(  7 downto 0 );
    signal  Scc2Ram         : std_logic;
    signal  Scc2Wrt         : std_logic;
    signal  Scc2Adr         : std_logic_vector( 20 downto 0 );
    signal  Scc2AmpL        : std_logic_vector( 14 downto 0 );

    signal  Scc1Type        : std_logic_vector(  1 downto 0 );

    -- Opll signals
    signal  OpllReq         : std_logic;
    signal  OpllAck         : std_logic;
    signal  OpllEnaWait     : std_logic;

    -- turboR PCM device
    signal  tr_pcm_req      : std_logic;
    signal  tr_pcm_dbi      : std_logic_vector(  7 downto 0 );

    -- External memory signals
    signal  RamReq          : std_logic;
    signal  RamAck          : std_logic;
    signal  RamDbi          : std_logic_vector(  7 downto 0 );
    signal  ClrAdr          : std_logic_vector( 17 downto 0 );
    signal  CpuAdr          : std_logic_vector( 22 downto 0 );

    -- SD-RAM control signals
    signal  SdrSta          : std_logic_vector(  2 downto 0 );
    signal  SdrCmd          : std_logic_vector(  2 downto 0 );
    signal  SdrBa0          : std_logic;
    signal  SdrBa1          : std_logic;
    signal  SdrAdr          : std_logic_vector( 12 downto 0 );
    signal  SdPaus          : std_logic := '0';

    constant SdrCmd_pr      : std_logic_vector(  2 downto 0 ) := "010";    -- precharge all
    constant SdrCmd_re      : std_logic_vector(  2 downto 0 ) := "001";    -- refresh
    constant SdrCmd_ms      : std_logic_vector(  2 downto 0 ) := "000";    -- mode regiser set
    constant SdrCmd_xx      : std_logic_vector(  2 downto 0 ) := "111";    -- no operation
    constant SdrCmd_ac      : std_logic_vector(  2 downto 0 ) := "011";    -- activate
    constant SdrCmd_rd      : std_logic_vector(  2 downto 0 ) := "101";    -- read
    constant SdrCmd_wr      : std_logic_vector(  2 downto 0 ) := "100";    -- write

    -- Clock divider
    signal  clkdiv3         : std_logic_vector(  1 downto 0 );
    signal  PausFlash       : std_logic;
    signal  ff_mem_seq      : std_logic_vector(  1 downto 0 );

    -- Operation mode
    signal  ff_clk21m_cnt   : std_logic_vector( 20 downto 0 );              -- free run counter
    signal  flash_cnt       : std_logic_vector(  3 downto 0 );              -- flash counter
    signal  GreenLv         : std_logic_vector(  6 downto 0 );              -- green level
    signal  GreenLv_cnt     : std_logic_vector(  3 downto 0 );              -- green level counter
    signal  ff_rst_seq      : std_logic_vector(  1 downto 0 );
    signal  FadedRed        : std_logic;
    signal  FadedGreen      : std_logic;

    -- RTC lfsr counter
    signal  rtcbase_cnt     : std_logic_vector( 21 downto 0 );
    signal  rtcbase_d0      : std_logic;
    signal  w_10hz          : std_logic := '1';

    -- Sound output, Toggle keys
    signal  vFKeys          : std_logic_vector(  7 downto 0 );

    -- DRAM arbiter
    signal  w_wrt_req       : std_logic;

    -- SD-RAM controller
    signal  ff_sdr_seq      : std_logic_vector(  2 downto 0 );

    -- Port F4 device
    signal portF4_req       : std_logic;
    signal portF4_bit7      : std_logic;                                    -- 1=hard reset, 0=soft reset

        -- MSX cartridge slot ports
    signal  pSltRst_n       : std_logic;                          -- pCpuRst_n returns here
    signal  pSltIorq_n      : std_logic;
    signal  pSltRd_n        : std_logic;
    signal  pSltWr_n        : std_logic;
    signal  pSltAdr         : std_logic_vector( 15 downto 0 );

    signal  pSltRfsh_n      : std_logic;
    signal  pSltWait_n      : std_logic;
    signal  pSltInt_n       : std_logic;
    signal  pSltMerq_n      : std_logic;

    component tr_pcm                                                            -- 2019/11/29 t.hara added
        port(
            clk21m          : in    std_logic;
            reset           : in    std_logic;
            req             : in    std_logic;
            ack             : out   std_logic;
            wrt             : in    std_logic;
            adr             : in    std_logic;
            dbi             : out   std_logic_vector(  7 downto 0 );
            dbo             : in    std_logic_vector(  7 downto 0 );
            wave_in         : in    std_logic_vector(  7 downto 0 );
            wave_out        : out   std_logic_vector(  7 downto 0 )
        );
    end component;

begin

    ----------------------------------------------------------------
    -- Clock generator (21.48MHz > 3.58MHz)
    -- pCpuClk should be independent from reset
    ----------------------------------------------------------------

    -- CPUCLK Enabler : 3.58MHz = 21.48MHz / 6
    process( reset, clk21m )
	    variable div : std_logic := '0';
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                cpucen    <= '0';
                cpucen_n  <= '0';
                div       := '0';
            else
                cpucen   <=     div and clkdiv3(1);
                cpucen_n <= not div and clkdiv3(1);
                if (clkdiv3(1) = '1') then
                   div := not div;
                end if;
            end if;
        end if;
    end process;

    -- Turbo CPUCLK Enabler : 5.39MHz = 21.48MHz / 4
    process( reset, clk21m )
	    variable div : std_logic_vector(1 downto 0);
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                cpucen_5m    <= '0';
                cpucen_5m_n  <= '0';
                div := "01";
	         else
                cpucen_5m   <=     div(1) and div(0);
                cpucen_5m_n <= not div(1) and div(0);
                div := div + 1;
            end if;
        end if;
    end process;

    -- Turbo CPUCLK Enabler : 10.79MHz = 21.48MHz / 2
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                cpucen_10m    <= '1';
                cpucen_10m_n  <= '0';
	         else
                cpucen_10m   <= not cpucen_10m;
                cpucen_10m_n <= not cpucen_10m_n;
			   end if;
        end if;
    end process;

    -- Prescaler : 21.48MHz / 6
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                clkdiv3 <= "10";
            else
                if( clkdiv3 = "00" )then
                    clkdiv3 <= "10";
                else
                    clkdiv3 <=  clkdiv3 - 1;
                end if;
            end if;
        end if;
    end process;

    -- hybrid clock start counter
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                hstartcount <=  (others => '0');
            else
                if( ff_clk21m_cnt( 16 downto 0 ) = "00000000000000000" )then
                    if( mmcena = '0' )then
                        hstartcount <=  "111";                                              -- begin after 48ms
                    elsif( hstartcount /= "000" )then
                        hstartcount <=  hstartcount - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- hybrid clock timeout counter
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                htoutcount  <=  (others => '0');
            else
                if( hstartcount = "000" or htoutcount /= "000" )then
                    if( mmcena = '1' )then
                        htoutcount  <=  "111";                                              -- timeout after 96ms
                    elsif( ff_clk21m_cnt( 17 downto 0 ) = "000000000000000000" )then
                        htoutcount  <=  htoutcount - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- hybrid clock enabler
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                hybridclk_n <=  '1';
            else
                if( htoutcount = "000" )then
                    hybridclk_n <= '1';
                else
                    hybridclk_n <= not tMegaSD;
                end if;
            end if;
        end if;
    end process;

    -- logo speed limiter
    process( clk21m )
    begin
        if rising_edge( clk21m )then
          if( ff_ldbios_n = '0' )then
            if( LastRst_sta = portF4_mode )then
                LogoRstCnt <= "11111";                                                  -- 3100ms
            end if;
          else
            if( w_10hz = '1' and SdPaus = '0' and LogoRstCnt /= "00000" )then
                LogoRstCnt <= LogoRstCnt - 1;
            end if;
			 end if;
        end if;
    end process;

    logo_timeout <= "00" when ( LogoRstCnt = "11111" )else                              -- 3100ms
                    "01" when ( LogoRstCnt = "10010" )else                              -- 1800ms
                    "10" when ( LogoRstCnt = "00000" );                                 --    0ms

    -- virtual DIP-SW assignment (1/2)
    process( memclk )
    begin
        if( memclk'event and memclk = '0' )then
            if( FirstBoot_n /= '1' or RstEna = '1' )then
                if( trueCen = '0' and pSltWait_n = '0' )then
                    if( ff_ldbios_n = '0' or logo_timeout = "00" )then                  -- ultra-fast bootstrap technology
                        ff_clksel5m_n   <=  '1';
                        ff_clksel       <=  '1';
                    elsif( logo_timeout = "10" )then
                        if( io42_id212(0) = '0' )then
                            ff_clksel5m_n   <=  io41_id008_n    and hybridclk_n;
                            ff_clksel       <=  io42_id212(0)   and hybridclk_n;
                        else
                            ff_clksel5m_n   <=  io41_id008_n;
                            ff_clksel       <=  io42_id212(0);
                        end if;
                    else
                        ff_clksel5m_n   <=  '1';
                        ff_clksel       <=  '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- virtual DIP-SW assignment (2/2)
    process( clk21m )
    begin
        if( rising_edge(clk21m) ) then
            if(SdPaus = '0' and ( FirstBoot_n /= '1' or RstEna = '1' ))then
                if( w_10hz = '1' )then
                    CmtScro           <=  swioCmt;
                    DisplayMode(1)    <=  io42_id212(1);
                    DisplayMode(0)    <=  io42_id212(2);
                    Slot1Mode         <=  io42_id212(3);
                    Slot2Mode(1)      <=  io42_id212(4);
                    Slot2Mode(0)      <=  io42_id212(5);
                end if;
            end if;
        end if;
    end process;
	 
    -- keyboard layout assignment
	 Kmap <=  swioKmap when rising_edge(clk21m);

    -- cpu clock assignment
    trueCen     <=  cpucen_10m      when( ff_clksel = '1' and reset /= '1' )else                            -- 10.74 MHz
                    cpucen_5m       when( ff_clksel5m_n = '0' and reset /= '1' )else                        --  5.37 MHz
                    cpucen;                                                                                 --  3.58 MHz
    trueCen_n   <=  cpucen_10m_n    when( ff_clksel = '1' and reset /= '1' )else                            -- 10.74 MHz
                    cpucen_5m_n     when( ff_clksel5m_n = '0' and reset /= '1' )else                        --  5.37 MHz
                    cpucen_n;                                                                                 --  3.58 MHz

    ----------------------------------------------------------------
    -- Reset control
    -- "RstSeq" should be cleared when power-on reset
    ----------------------------------------------------------------

    pSltRst_n <= not pReset;

    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            ff_mem_seq <= ff_mem_seq(0) & (not ff_mem_seq(1));
        end if;
    end process;

    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            if( ff_mem_seq = "00" )then
                FreeCounter <= FreeCounter + 1;
            end if;
        end if;
    end process;

    -- hard reset timer
    process( pSltRst_n, clk21m, HardRst_cnt )
    begin
        if( RstKeyLock = '0' )then
            if( pSltRst_n /= '0' )then
                HoldRst_ena <= '0';
                if( HardRst_cnt /= "0011" or HardRst_cnt /= "0010" )then
                    HardRst_cnt <= "0000";
                end if;
            elsif( clk21m'event and clk21m = '1' )then
                if( HoldRst_ena = '0' )then
                    if pColdReset = '1' then
                        HardRst_cnt <= "0011";
                    else
                        HardRst_cnt <= "1110";                  -- 1500ms hold reset
                    end if;
                    HoldRst_ena <= '1';
                elsif( w_10hz = '1' and HardRst_cnt /= "0001" )then
                    HardRst_cnt <= HardRst_cnt - 1;
                end if;
            end if;
        end if;
    end process;

    process( memclk )
    begin
        if rising_edge(memclk) then
          if( HardRst_cnt = "0011" )then                  -- 200ms from "0001"
            if( w_10hz = '1' and RstSeq /= "00000" )then
                RstSeq <= (others => '0');
            end if;
          else
            if( ff_mem_seq = "00" and FreeCounter = X"FFFF" and RstSeq /= "11111" )then
                RstSeq <= RstSeq + 1;                   -- 3ms (= 65536 / 21.48MHz)
            end if;
			 end if;
        end if;
    end process;

    process( clk21m )
    begin
        if rising_edge(clk21m) then
          reset <= '0';
          if ( pSltRst_n = '0' and RstKeyLock = '0' and HardRst_cnt /= "0001" ) then
            reset <= '1';
          elsif ( swioRESET_n = '0' or HardRst_cnt = "0011" or HardRst_cnt = "0010" or RstSeq /= "11111" ) then
            reset <= '1';
          end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- Operation mode
    ----------------------------------------------------------------

    -- free run counter
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ff_clk21m_cnt <= (others => '0');
	    else
                ff_clk21m_cnt <= ff_clk21m_cnt + 1;
            end if;
        end if;
    end process;

    -- RTC lfsr counter => range 0 to 2147726 => 100ms
    -- http://outputlogic.com/?page_id=275
    rtcbase_d0  <=  (rtcbase_cnt(21) xnor rtcbase_cnt(20));

    w_10hz      <=  '1' when( rtcbase_cnt = "0010001111000001111010" )else
                    '0';

    process ( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( w_10hz = '1' )then
                    rtcbase_cnt <= (others => '0');
                else
                    rtcbase_cnt <= (rtcbase_cnt( 20 downto 0 ) & rtcbase_d0);
                end if;
            end if;
    end process;

    -- flash counter
    process( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( SdPaus = '0' )then
                if( ff_clksel5m_n = '1' )then
                    flash_cnt <= "0000";
                else
                    flash_cnt <= "0100";
                end if;
            elsif( w_10hz = '1' )then
                if( flash_cnt = "0000" )then
                    flash_cnt <= "1011";                -- 1200ms
                else
                    flash_cnt <= flash_cnt - 1;
                end if;
            end if;
        end if;
    end process;

    -- green level counter
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                GreenLv_cnt <= "0000";
	    else
                if( GreenLvEna = '1' )then
                    GreenLv_cnt <= "1111";
                elsif( w_10hz = '1' and GreenLv_cnt /= "0000" )then
                    GreenLv_cnt <= GreenLv_cnt - 1;         -- 1600ms
                end if;
            end if;
        end if;
    end process;

    -- green level assignment
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                GreenLv <= (others => '0');
	    else
                case LevCtrl is
                when "111"  =>  GreenLv <=  "1111111";
                when "110"  =>  GreenLv <=  "0111111";
                when "101"  =>  GreenLv <=  "0011111";
                when "100"  =>  GreenLv <=  "0001111";
                when "011"  =>  GreenLv <=  "0000111";
                when "010"  =>  GreenLv <=  "0000011";
                when "001"  =>  GreenLv <=  "0000001";
                when others =>  GreenLv <=  "0000000";
                end case;
            end if;
        end if;
    end process;

    -- reset enable wait counter
    --
    --  ff_rst_seq(0)   X___X~~~X~~~X___X___X ...
    --  ff_rst_seq(1)   X___X___X~~~X~~~X___X ...
    --
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ff_rst_seq <= "00";
	    else
                if( w_10hz = '1' )then
                    ff_rst_seq <= ff_rst_seq(0) & (not ff_rst_seq(1));
                else
                    --  hold
                end if;
            end if;
        end if;
    end process;

    -- power LED
    process( reset, clk21m, ZemmixNeo )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                pLedPwr <= clk21m or ZemmixNeo;                 -- lights test holding the hard reset
	    else
                if( SdPaus = '1' )then
                    if( PausFlash = '1' and ZemmixNeo = '0' )then
                        pLedPwr <= FadedRed;                    -- Pause        is Flash + Faded Red
                    else
                        pLedPwr <= '0';
                    end if;
                -- Lights On/Off toggle
                elsif( Red_sta = '1' and Paus = '0' and GreenLv_cnt = "0000" )then
--              elsif( ff_clksel5m_n = '0' )then                -- test for tMegaSD
                    if( ZemmixNeo = '1' )then
                        pLedPwr <= '1';                         -- On
                    else
                        pLedPwr <= FadedRed;                    -- 5.37MHz On   is Faded Red only
                    end if;
                else
--                  pLedPwr <= logo_timeout(0);                 -- test of logo speed limiter
                    pLedPwr <= '0';                             -- Off / Blink
                end if;
            end if;
        end if;
    end process;

    -- reset enabler
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                RstEna <= '0';
	    else
                if( ff_rst_seq = "11" and warmRESET /= '1' )then
                    RstEna      <= '1';                         -- RstEna change to 1 after 200ms from power on
                    FirstBoot_n <= '1';
                else
                    --  hold
                end if;
            end if;
        end if;
    end process;

    -- DIP SW latch
	 ff_dip_req <= not pDip when rising_edge(clk21m);

    -- LEDs luminance
    process( clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( ZemmixNeo = '0' )then
                FadedGreen  <=  ff_clk21m_cnt(12);
                FadedRed    <=  ff_clk21m_cnt(0);
            else
                FadedGreen  <=  '1';
                FadedRed    <=  '1';
            end if;
        end if;
    end process;

    -- Kana keyboard layout: 1=JIS layout
    w_key_mode  <=  '1';

    -- Pause Flash (800ms On + 400ms Off = 1200ms per cycle)
    PausFlash   <=  '0' when( flash_cnt( 3 downto 2 ) = "00" )else
                    '1';
    -- Blink assignment
    MmcEnaLed   <=  ((ff_clk21m_cnt(20) or (not ff_clk21m_cnt(19))) and FadedGreen)
                            when( Blink_ena = '1' and MmcEna = '1' )else
                    (MmcMode        and FadedGreen)
                            when( Blink_ena = '0' and LightsMode = '0' )else
                    (GreenLeds(7)   and FadedGreen)
                            when( LightsMode = '1' )else
                    '0';

    -- LEDs assignment
    pLed        <=  "000" &                                 -- Pause Flash for Zemmix Neo
                    (PausFlash          and  FadedGreen) &
                    "0000"                                  when( SdPaus = '1' and ZemmixNeo = '1' )else

                                                            -- Lights On/Off toggle (active when 'SdPaus' is not used)
                    "00000000"                              when( Paus = '1' )else

                    GreenLeds(0)                         &  -- LightsMode + Blink for Zemmix Neo
                    GreenLeds(1)                         &
                    GreenLeds(2)                         &
                    GreenLeds(3)                         &
                    GreenLeds(4)                         &
                    GreenLeds(5)                         &
                    GreenLeds(6)                         &
                    MmcEnaLed                               when( LightsMode = '1' and ZemmixNeo = '1' )else

                    MmcEnaLed                            &  -- Blink + LightsMode for 1chipMSX
                    (GreenLeds(6)       and  FadedGreen) &
                    (GreenLeds(5)       and  FadedGreen) &
                    (GreenLeds(4)       and  FadedGreen) &
                    (GreenLeds(3)       and  FadedGreen) &
                    (GreenLeds(2)       and  FadedGreen) &
                    (GreenLeds(1)       and  FadedGreen) &
                    (GreenLeds(0)       and  FadedGreen)    when( LightsMode = '1' )else

                    GreenLv(0)                           &  -- Volume + High-Speed Level + Blink for Zemmix Neo
                    GreenLv(1)                           &
                    GreenLv(2)                           &
                    GreenLv(3)                           &
                    GreenLv(4)                           &
                    GreenLv(5)                           &
                    GreenLv(6)                           &
                    MmcEnaLed                               when( GreenLv_cnt /= "0000" and ZemmixNeo = '1' )else

                    MmcEnaLed                            &  -- Blink + Volume + High-Speed Level for 1chipMSX
                    (GreenLv(6)     and  FreeCounter(1)) &
                    (GreenLv(5)     and  FreeCounter(1)) &
                    (GreenLv(4)     and  FreeCounter(1)) &
                    (GreenLv(3)     and  FreeCounter(1)) &
                    (GreenLv(2)     and  FreeCounter(1)) &
                    (GreenLv(1)     and  FreeCounter(1)) &
                    (GreenLv(0)     and  FreeCounter(1))    when( GreenLv_cnt /= "0000" )else

                                                            -- lights test holding the hard reset
                    (others =>          FreeCounter(0))     when( pSltRst_n = '0' and RstKeyLock = '0' )else

                    io42_id212(0)                        &  -- Virtual DIP-SW (Auto) + Blink for Zemmix Neo
                    DisplayMode(1)                       &
                    DisplayMode(0)                       &
                    Slot1Mode                            &
                    Slot2Mode(1)                         &
                    Slot2Mode(0)                         &
                    FullRAM                              &
                    MmcEnaLed                               when( ZemmixNeo = '1' )else

                    MmcEnaLed                            &  -- Blink + Virtual DIP-SW (Auto) for 1chipMSX
                    (FullRAM            and  FadedGreen) &
                    (Slot2Mode(0)       and  FadedGreen) &
                    (Slot2Mode(1)       and  FadedGreen) &
                    (Slot1Mode          and  FadedGreen) &
                    (DisplayMode(0)     and  FadedGreen) &
                    (DisplayMode(1)     and  FadedGreen) &
                    (io42_id212(0)      and  FadedGreen);

    ----------------------------------------------------------------
    -- MSX cartridge slot control
    ----------------------------------------------------------------
    pSltRfsh_n  <=  CpuRfsh_n;

    pSltInt_n   <=  pVdpInt_n;

    cpu_di      <=  dbi when( pSltIorq_n = '0' and BusDir    = '1'  )else
                    dbi when( pSltMerq_n = '0' and PriSltNum = "00" )else
                    dbi when( pSltMerq_n = '0' and PriSltNum = "11" )else
                    dbi when( pSltMerq_n = '0' and PriSltNum = "01" and Scc1Type /= "00" )else
                    dbi when( pSltMerq_n = '0' and PriSltNum = "10" and Slot2Mode  /= "00" )else
                    (others => '1');

    ----------------------------------------------------------------
    -- Z80 CPU wait control
    ----------------------------------------------------------------
    process( clk21m, trueCen, reset )

        variable iCpuM1_n   : std_logic;                                -- slack 1.759ns
        variable jSltMerq_n : std_logic;
        variable jSltIorq_n : std_logic;
        variable count      : std_logic_vector(3 downto 0);             -- slack 0.822ns

    begin

        if( rising_edge(clk21m) and trueCen = '1' )then

            if( reset = '1' )then
                iCpuM1_n    := '1';
                jSltIorq_n  := '1';
                jSltMerq_n  := '1';
                count       := "0000";
                pSltWait_n  <= '1';

	    else

                if( pSltMerq_n = '0' and jSltMerq_n = '1' )then
                    if( ff_clksel = '1' )then
                        count := CustomSpeed;                               -- 8 MHz until 4 MHz
                    elsif( ff_clksel5m_n = '0' and (iSltScc1 = '1' or iSltScc2 = '1') )then
                        count := "0001";
                    end if;
                elsif( pSltIorq_n = '0' and jSltIorq_n = '1' )then          -- wait for external bus
                    if( ff_clksel = '1' )then
                        count := "0011";
                    elsif( ff_clksel5m_n = '0' )then
                        count := "0110";
                    end if;
                elsif( count /= "0000" )then                                -- countdown timer
                    count := count - 1;
                end if;

                if( CpuM1_n = '0' and iCpuM1_n = '1' )then
                    pSltWait_n <= '0';
                elsif( count /= "0000" )then
                    pSltWait_n <= '0';
                elsif( (ff_clksel = '1' or ff_clksel5m_n = '0') and OpllReq = '1' and OpllAck = '0' )then
                    pSltWait_n <= '0';
                elsif( ErmReq = '1' and adr(15 downto 13) = "010" and MmcAct = '1' )then
                    pSltWait_n <= '0';
--              elsif (SdPaus = '1') then                                   -- dismissed dangerous function
--                  pSltWait_n <= '0';
                else
                    pSltWait_n <= '1';
                end if;

                iCpuM1_n    := CpuM1_n;
                jSltIorq_n  := pSltIorq_n;
                jSltMerq_n  := pSltMerq_n;

            end if;
        end if;

    end process;

    ----------------------------------------------------------------
    -- On chip internal bus control
    ----------------------------------------------------------------
    process( clk21m, reset )

        variable ExpDec : std_logic;

    begin

        if( rising_edge(clk21m) )then

            if( reset = '1' )then

                iSltRfsh_n      <= '1';
                iSltMerq_n      <= '1';
                iSltIorq_n      <= '1';
                xSltRd_n        <= '1';
                xSltWr_n        <= '1';
                iSltAdr         <= (others => '1');
                iSltDat         <= (others => '1');

                iack            <= '0';

                dlydbi          <= (others => '1');
                ExpDec          := '0';

            else

                -- MSX slot signals
                iSltRfsh_n      <= pSltRfsh_n;
                iSltMerq_n      <= pSltMerq_n;
                iSltIorq_n      <= pSltIorq_n;
                xSltRd_n        <= pSltRd_n;
                xSltWr_n        <= pSltWr_n;
                iSltAdr         <= pSltAdr;
                iSltDat         <= cpu_do;

                if (iSltMerq_n  = '1' and iSltIorq_n = '1') then
                    iack <= '0';
                elsif( ack = '1' )then
                    iack <= '1';
                end if;

                -- input assignments for internal devices
                if( mem = '1' and ExpDec = '1' )then
                    dlydbi <= ExpDbi;
                elsif( mem = '1' and iSltBot = '1' )then                                            -- IPL-ROM
                    dlydbi <= RomDbi;
                elsif( mem = '1' and iSltErm = '1' and MmcEna = '1' )then                           -- MegaSD
                    dlydbi <= MmcDbi;
                elsif( mem = '0' and adr(  7 downto 2 ) = "100110" )then                            -- VDP (V9938/V9958)
                    dlydbi <= VdpDbi;
                elsif( mem = '0' and adr(  7 downto 2 ) = "101000" )then                            -- PSG (AY-3-8910)
                    dlydbi <= PsgDbi;
                elsif( mem = '0' and adr(  7 downto 2 ) = "101010" )then                            -- PPI (8255)
                    dlydbi <= PpiDbi;
                elsif( mem = '0' and adr(  7 downto 2 ) = "110110" and JIS2_ena = '1' )then         -- Kanji-data (JIS1+JIS2)
                    dlydbi <= KanDbi;
                elsif( mem = '0' and adr(  7 downto 1 ) = "1101100" )then                           -- Kanji-data (JIS1 only)
                    dlydbi <= KanDbi;
                elsif( mem = '0' and adr(  7 downto 2 ) = "111111" and FullRAM = '0' )then          -- Memory-mapper 2048 kB
                    dlydbi <= '1' & MapDbi(  6 downto 0 );
                elsif( mem = '0' and adr(  7 downto 2 ) = "111111" )then                            -- Memory-mapper 4096 kB
                    dlydbi <= MapDbi;
                elsif( mem = '0' and adr(  7 downto 1 ) = "1011010" )then                           -- RTC (RP-5C01)
                    dlydbi <= RtcDbi;
                elsif( mem = '0' and adr(  7 downto 1 ) = "1110011" )then                           -- System timer (S1990)
                    dlydbi <= systim_dbi;
                elsif( mem = '0' and adr(  7 downto 1 ) = "1010010" )then                           -- turboR PCM device
                    dlydbi <= tr_pcm_dbi;
                elsif( mem = '0' and adr(  7 downto 4 ) = "0100" and io40_n /= "11111111" )then     -- Switched I/O ports
                    dlydbi <= swio_dbi;
                elsif( mem = '0' and adr(  7 downto 0 ) = "10100111" and portF4_mode = '1' )then    -- Pause R800 (read only)
                    dlydbi <= (others => '0');
                elsif( mem = '0' and adr(  7 downto 0 ) = "11110100" and portF4_mode = '1' )then    -- Port F4 normal (Z80 mode)
                    dlydbi <= portF4_bit7 & "0000000";
                elsif( mem = '0' and adr(  7 downto 0 ) = "11110100" )then                          -- Port F4 inverted
                    dlydbi <= portF4_bit7 & "1111111";
                else
                    dlydbi <= (others => '1');
                end if;

                if( adr = X"FFFF" )then
                    ExpDec := '1';
                else
                    ExpDec := '0';
                end if;

            end if;
        end if;

    end process;

    ----------------------------------------------------------------
    process( clk21m, reset )

    begin

        if( rising_edge(clk21m) )then

            if( reset = '1' )then

                jSltScc1    <= '0';
                jSltScc2    <= '0';
                jSltMem     <= '0';

                wrt <= '0';

            else

                if( mem = '1' and iSltScc1 = '1' )then
                    jSltScc1 <= '1';
                else
                    jSltScc1 <= '0';
                end if;

                if( mem = '1' and iSltScc2 = '1' )then
                    jSltScc2 <= '1';
                else
                    jSltScc2 <= '0';
                end if;

                if( mem = '1' and iSltErm = '1' )then
                    if( MmcEna = '1' and adr(15 downto 13) = "010" )then
                        jSltMem <= '0';
                    elsif( MmcMode = '1' or ff_ldbios_n = '0' )then         -- enable SD/MMC drive
                        jSltMem <= '1';
                    else                                                    -- disable SD/MMC drive
                        jSltMem <= '0';
                    end if;
                elsif( mem = '1' and (iSltMap = '1' or rom_main = '1' or rom_opll = '1' or rom_extd = '1' or rom_xbas = '1' or rom_free = '1')) then
                        jSltMem <= '1';
                else
                        jSltMem <= '0';
                end if;

                if( req = '0' )then
                    wrt <= not pSltWr_n;                                    -- 1=write, 0=read
                end if;

            end if;
        end if;

    end process;

    -- access request, CPU > Components
    req     <=  '1'         when( ((iSltMerq_n = '0') or (iSltIorq_n = '0')) and
                                  ((xSltRd_n = '0') or (xSltWr_n = '0')) and iack = '0' )else '0';

    mem     <=  iSltIorq_n;                                             -- 1=memory area, 0=i/o area
    dbo     <=  iSltDat;                                                -- CPU data (CPU > device)
    adr     <=  iSltAdr;                                                -- CPU address (CPU > device)

    -- access acknowledge, Components > CPU
    ack     <=  RamAck      when( RamReq = '1' )else                    -- ErmAck, MapAck, KanAck
                Scc1Ack     when( mem = '1' and iSltScc1 = '1' )else    -- Scc1Ack
                Scc2Ack     when( mem = '1' and iSltScc2 = '1' )else    -- Scc2Ack
                OpllAck     when( OpllReq = '1' )else                   -- OpllAck
                req;                                                    -- PsgAck, PpiAck, MapAck, VdpAck, RtcAck, ...

    dbi     <=  Scc1Dbi     when( jSltScc1 = '1' )else
                Scc2Dbi     when( jSltScc2 = '1' )else
                RamDbi      when( jSltMem  = '1' )else
                dlydbi;

    ----------------------------------------------------------------
    -- port F4
    ----------------------------------------------------------------
    process( clk21m, pColdReset )
    begin
        if( rising_edge(clk21m) )then
            if(pColdReset = '1') then
                portF4_bit7 <= '0';
	    else
                if( portF4_req = '1' and wrt = '1' )then
                    portF4_bit7 <= dbo(7);
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- PPI(8255) / primary-slot, keyboard, 1 bit sound port
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( reset = '1' )then
                PpiPortA    <= "11111111";          -- primary slot : page 0 => boot-rom, page 1/2 => ese-mmc, page 3 => mapper
                PpiPortC    <= (others => '0');
                ff_ldbios_n <= '0';                 -- OCM-BIOS is ready to be loaded
	    else
                -- I/O port access on A8-ABh ... PPI(8255) access
                if( PpiReq = '1' )then
                    if( wrt = '1' and adr(1 downto 0) = "00" )then
                        PpiPortA    <= dbo;
                        ff_ldbios_n <= '1';         -- OCM-BIOS is done!
                    elsif( wrt = '1' and adr(1 downto 0) = "10" )then
                        PpiPortC  <= dbo;
                    elsif( wrt = '1' and adr(1 downto 0) = "11" and dbo(7) = '0' )then
                        case dbo(3 downto 1) is
                            when "000"  => PpiPortC(0) <= dbo(0); -- key_matrix Y(0)
                            when "001"  => PpiPortC(1) <= dbo(0); -- key_matrix Y(1)
                            when "010"  => PpiPortC(2) <= dbo(0); -- key_matrix Y(2)
                            when "011"  => PpiPortC(3) <= dbo(0); -- key_matrix Y(3)
                            when "100"  => PpiPortC(4) <= dbo(0); -- cassete motor on (0=On,1=Off)
                            when "101"  => PpiPortC(5) <= dbo(0); -- cassete audio out
                            when "110"  => PpiPortC(6) <= dbo(0); -- CAPS lamp (0=On,1=Off)
                            when others => PpiPortC(7) <= dbo(0); -- 1 bit sound port
                        end case;
                    end if;
                end if;
            end if;
        end if;
    end process;

    pCaps   <=  not PpiPortC(6);

    -- I/O port access on A8-ABh ... PPI(8255) register read
    PpiDbi  <=  PpiPortA when adr(1 downto 0) = "00" else
                PpiPortB when adr(1 downto 0) = "01" else
                PpiPortC when adr(1 downto 0) = "10" else
                (others => '1');

    ----------------------------------------------------------------
    -- Expansion slot
    ----------------------------------------------------------------

    -- slot #0
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ExpSlot0 <= (others => '0');
	    else
                -- Memory mapped I/O port access on FFFFh ... expansion slot register (master mode)
                if( req = '1' and iSltMerq_n = '0' and wrt = '1' and adr = X"FFFF" )then
                    if( PpiPortA(7 downto 6) = "00" )then
                        if( Slot0Mode = '1' )then
                            ExpSlot0 <= dbo;
                        else
                            ExpSlot0 <= (others => '0');
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- slot #3
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ExpSlot3 <= "00101011";             -- primary slot : page 0 => ipl-rom, page 1/2 => megasd, page 3 => mapper
            else
                -- Memory mapped I/O port access on FFFFh ... expansion slot register (master mode)
                if( req = '1' and iSltMerq_n = '0' and wrt = '1' and adr = X"FFFF" )then
                    if( PpiPortA(7 downto 6) = "11" )then
                        ExpSlot3 <= dbo;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- primary slot number (master mode)
    with adr(15 downto 14) select PriSltNum <=
        PpiPortA(1 downto 0) when "00",
        PpiPortA(3 downto 2) when "01",
        PpiPortA(5 downto 4) when "10",
        PpiPortA(7 downto 6) when others;

    -- expansion slot number : slot 0 (master mode)
    with adr(15 downto 14) select ExpSltNum0 <=
        ExpSlot0(1 downto 0) when "00",
        ExpSlot0(3 downto 2) when "01",
        ExpSlot0(5 downto 4) when "10",
        ExpSlot0(7 downto 6) when others;

    -- expansion slot number : slot 3 (master mode)
    with adr(15 downto 14) select ExpSltNum3 <=
        ExpSlot3(1 downto 0) when "00",
        ExpSlot3(3 downto 2) when "01",
        ExpSlot3(5 downto 4) when "10",
        ExpSlot3(7 downto 6) when others;

    -- expansion slot register read
    with PpiPortA(7 downto 6) select ExpDbi <=
        not ExpSlot0         when "00",
        not ExpSlot3         when "11",
        (others => '1')      when others;

    ----------------------------------------------------------------
    --  Slot/Page Decode
    ----------------------------------------------------------------
    with( adr(15 downto 14) ) select w_page_dec <=
        "0001"      when "00",
        "0010"      when "01",
        "0100"      when "10",
        "1000"      when "11",
        "XXXX"      when others;

    with( PriSltNum ) select w_prislt_dec <=
        "0001"      when "00",
        "0010"      when "01",
        "0100"      when "10",
        "1000"      when "11",
        "XXXX"      when others;

    with( ExpSltNum0 ) select w_expslt0_dec <=
        "0001"      when "00",
        "0010"      when "01",
        "0100"      when "10",
        "1000"      when "11",
        "XXXX"      when others;

    with( ExpSltNum3 ) select w_expslt3_dec <=
        "0001"      when "00",
        "0010"      when "01",
        "0100"      when "10",
        "1000"      when "11",
        "XXXX"      when others;

    ----------------------------------------------------------------
    --  Address Decode for CPU
    ----------------------------------------------------------------
    -- Slot0-X
    rom_main    <=  mem when( (w_prislt_dec(0) and (w_expslt0_dec(0) or (not Slot0Mode)) and (w_page_dec(0) or w_page_dec(1))) = '1'  )else     -- 0-0 (0000-7FFFh)    32 kB  MSX2P   .ROM / MSXTR   .ROM
                    '0';
    rom_opll    <=  mem when( (w_prislt_dec(0) and w_expslt0_dec(2) and Slot0Mode and  w_page_dec(1)) = '1'                           )else     -- 0-2 (4000-7FFFh)    16 kB  MSX2PMUS.ROM / MSXTRMUS.ROM
                    '0';
    rom_free    <=  mem when( (w_prislt_dec(0) and w_expslt0_dec(3) and Slot0Mode and  w_page_dec(1)) = '1'                           )else     -- 0-3 (4000-7FFFh)    16 kB  FREE16KB.ROM / MSXTROPT.ROM
                    '0';
    -- Slot1
    iSltScc1    <=  mem when( (w_prislt_dec(1) and (w_page_dec(1) or w_page_dec(2))) = '1' and Scc1Type /= "00"                       )else
                    '0';
    -- Slot2
    iSltScc2    <=  mem when( (w_prislt_dec(2) and (w_page_dec(1) or w_page_dec(2))) = '1' and Slot2Mode /= "00"                      )else
                    '0';
    -- Slot3-X
    iSltMap     <=  mem when( (w_prislt_dec(3) and w_expslt3_dec(0)) = '1' and adr /= X"FFFF"                                         )else     -- 3-0 (0000-FFFFh)  4096 kB  Internal Mapper
                    '0';
    rom_extd    <=  mem when( (w_prislt_dec(3) and w_expslt3_dec(1) and (w_page_dec(0) or w_page_dec(1) or w_page_dec(2))) = '1'      )else     -- 3-1 (0000-BFFFh)    48 kB  (MSX2PEXT.ROM or MSXTREXT.ROM) + MSXKANJI.ROM
                    '0';
    iSltErm     <=  mem when( (w_prislt_dec(3) and w_expslt3_dec(2) and (w_page_dec(1) or w_page_dec(2))) = '1'                       )else     -- 3-2 (4000-BFFFh)   128 kB  (MEGASDHC.ROM + FILL64KB.ROM) or NEXTOR16.ROM
                    '0';
    rom_xbas    <=  mem when( (w_prislt_dec(3) and w_expslt3_dec(3) and  w_page_dec(1) and ff_ldbios_n) = '1'                         )else     -- 3-3 (4000-7FFFh)    16 kB  XBASIC2 .ROM / XBASIC21.ROM
                    '0';
    iSltBot     <=  mem when( (w_prislt_dec(3) and w_expslt3_dec(3) and (w_page_dec(0) or w_page_dec(3)) and (not ff_ldbios_n)) = '1' )else     -- 3-3 (0000-FFFFh)     1 kB  IPL-ROM (pre-boot state)
                    '0';
    -- I/O
    rom_kanj    <=  not mem     when( adr(7 downto 2) = "110110" )else
                    '0';

    -- RamX / RamY access request
    RamReq  <=  Scc1Ram or Scc2Ram or ErmRam or MapRam or RomReq or KanRom;

    -- access request to component
    VdpReq  <=  req when( mem = '0' and adr(7 downto 2) = "100110"  )else '0';      -- I/O:98-9Bh   / VDP (V9938/V9958)
    PsgReq  <=  req when( mem = '0' and adr(7 downto 2) = "101000"  )else '0';      -- I/O:A0-A3h   / PSG (AY-3-8910)
    PpiReq  <=  req when( mem = '0' and adr(7 downto 2) = "101010"  )else '0';      -- I/O:A8-ABh   / PPI (8255)
    OpllReq <=  req when( mem = '0' and adr(7 downto 1) = "0111110" and Slot0Mode = '1' )else '0';  -- I/O:7C-7Dh   / OPLL (YM2413)
    KanReq  <=  req when( mem = '0' and adr(7 downto 2) = "110110"  )else '0';      -- I/O:D8-DBh   / Kanji-data
    RomReq  <=  req when( (rom_main or rom_opll or rom_extd or rom_xbas or rom_free) = '1')else '0';
    MapReq  <=  req when( mem = '0' and adr(7 downto 2) = "111111"  )else           -- I/O:FC-FFh   / Memory-mapper
                req when(               iSltMap = '1'               )else '0';      -- MEM:         / Memory-mapper
    Scc1Req <=  req when(               iSltScc1 = '1'              )else '0';      -- MEM:         / ESE-SCC1
    Scc2Req <=  req when(               iSltScc2 = '1'              )else '0';      -- MEM:         / ESE-SCC2
    ErmReq  <=  req when(               iSltErm = '1'               )else '0';      -- MEM:         / ESE-RAM, MegaSD
    RtcReq  <=  req when( mem = '0' and adr(7 downto 1) = "1011010" )else '0';      -- I/O:B4-B5h   / RTC (RP-5C01)
    systim_req  <=  req when( mem = '0' and adr(7 downto 1) = "1110011" )else '0';  -- I/O:E6-E7h   / System timer (S1990)
    swio_req    <=  req when( mem = '0' and adr(7 downto 4) = "0100" )else '0';     -- I/O:40-4Fh   / Switched I/O ports
    portF4_req  <=  req when( mem = '0' and adr(7 downto 0) = "11110100" )else '0'; -- I/O:F4h      / Port F4 device
    tr_pcm_req  <=  req when( mem = '0' and adr(7 downto 1) = "1010010" )else '0';                  -- I/O:A4h-A5h  / turboR PCM device
    --  pcm_req <=  req when( mem = '0' and adr(7 downto 1) = "1110100" )else '0';  -- I/O:E8-E9h   / Test PCM

    BusDir  <=  '1' when( pSltAdr(7 downto 2) = "100110"                         )else  -- I/O:98-9Bh / VDP (V9938/V9958)
                '1' when( pSltAdr(7 downto 2) = "101000"                         )else  -- I/O:A0-A3h / PSG (AY-3-8910)
                '1' when( pSltAdr(7 downto 2) = "101010"                         )else  -- I/O:A8-ABh / PPI (8255)
                '1' when( pSltAdr(7 downto 2) = "110110" and JIS2_ena = '1'      )else  -- I/O:D8-DBh / Kanji-data (JIS1+JIS2)
                '1' when( pSltAdr(7 downto 1) = "1101100"                        )else  -- I/O:D8-D9h / Kanji-data (JIS1 only)
                '1' when( pSltAdr(7 downto 2) = "111111"                         )else  -- I/O:FC-FFh / Memory-mapper
                '1' when( pSltAdr(7 downto 1) = "1011010"                        )else  -- I/O:B4-B5h / RTC (RP-5C01)
                '1' when( pSltAdr(7 downto 1) = "1110011"                        )else  -- I/O:E6-E7h / System timer (S1990)
                '1' when( pSltAdr(7 downto 4) = "0100" and io40_n /= "11111111"  )else  -- I/O:40-4Fh / Switched I/O ports
                '1' when( pSltAdr(7 downto 0) = "10100111" and portF4_mode = '1' )else  -- I/O:A7h    / Pause R800 (read only)
                '1' when( pSltAdr(7 downto 0) = "11110100"                       )else  -- I/O:F4h    / Port F4 device
                '1' when( pSltAdr(7 downto 1) = "1010010"                        )else  -- I/O:A4-A5h / turboR PCM device
--              '1' when( pSltAdr(7 downto 1) = "1110100"                        )else  -- I/O:E8-E9h / Test PCM
                '0';

    ----------------------------------------------------------------
    -- Video output
    ----------------------------------------------------------------
--  V9938_n <= '0';         -- '0' is V9938 MSX2 VDP
    V9938_n <= '1';         -- '1' is V9958 MSX2+/tR VDP

    process (clk21m)
    begin
        if( rising_edge(clk21m) )then
            pDac_VR   <= VideoR;
            pDac_VG   <= VideoG;
            pDac_VB   <= VideoB;
            Reso_v    <= pScandoubler;       -- 15kHz/31kHz
            legacy_vga <= '1';
            pVideoHS  <= not VideoHS_n;
            pVideoVS  <= not VideoVS_n;
        end if;
    end process;

    ----------------------------------------------------------------
    -- Sound output
    ----------------------------------------------------------------

    -- | b7  | b6   | b5   | b4   | b3  | b2  | b1  | b0  |
    -- | SHI | --   | PgUp | PgDn | F9  | F10 | F11 | F12 |
    process( reset, clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( reset = '1' )then
                vFkeys  <= (others => '0');         -- Sync to oFkeys
	    else
              if( FirstBoot_n /= '1' or RstEna = '1' )then
                vFkeys  <=  Fkeys;
              end if;
            end if;
        end if;
    end process;

	 pAudioPSG  <= ("0" & PsgAmp(9 downto 1)) + (KeyClick & "00000");
	 pAudioPCM  <= ((Scc1AmpL(14) & Scc1AmpL) + (Scc2AmpL(14) & Scc2AmpL));
	 

    ----------------------------------------------------------------
    -- External memory access
    ----------------------------------------------------------------
    -- Slot map / SD-RAM memory map
    --
    -- Slot 0-0 : MainROM               620000-627FFF (  32 kB)
    -- Slot 3-3 : XBASIC                628000-62BFFF (  16 kB)
    -- Slot 0-2 : FM-BIOS               62C000-62FFFF (  16 kB)
    -- Slot 0-3 : rom_free(OPT)         63C000-63FFFF (  16 kB)
    -- Slot 1   : (EXTERNAL-SLOT)
    --            / ESE-SCC1            500000-5FFFFF (1024 kB) <= shared w/ the 2nd half of ESE-SCC2
    -- Slot 2   : (EXTERNAL-SLOT)
    --            / ESE-SCC2            400000-5FFFFF (2048 kB)
    -- Slot 3-0 : Mapper                000000-3FFFFF (4096 kB)
    -- Slot 3-1 : ExtROM + KanjiROM     630000-63BFFF (  48 kB)
    -- Slot 3-2 : MegaSDHC / NEXTOR     600000-61FFFF ( 128 kB)
    --            EseRAM                600000-67FFFF (BIOS: 512 kB)
    -- Slot 3-3 : IPL-ROM               (blockRAM: 1 kB, see IPLROM.VHD) <= shared w/ XBASIC
    -- VRAM     : VRAM                  700000-7FFFFF (1024 kB)
    -- I/O      : Kanji-data            640000-67FFFF ( 256 kB)

    CpuAdr(22 downto 20) <= "0" & MapAdr(21 downto 20)  when( iSltMap  = '1' and FullRAM = '1' )else    -- 0xxxxx => 4096 kB RAM
                            "00" & MapAdr(20)           when( iSltMap  = '1' )else                      -- 0xxxxx => 2048 kB RAM
                            "10" & Scc2Adr(20)          when( iSltScc2 = '1' )else                      -- 4xxxxx => 2048 kB ESE-SCC2
                            "101"                       when( iSltScc1 = '1' )else                      -- 5xxxxx => 1024 kB ESE-SCC1
                            "110";                                                                      -- 6xxxxx => 1024 kB ESE-RAM
--                          "111";                                                                      -- 7xxxxx => 1024 kB Video RAM

    CpuAdr(19 downto 0)  <= MapAdr (19 downto  0)           when( iSltMap  = '1' )else      -- 000000-3FFFFF (4096 kB)  Slot3-0
                            Scc2Adr(19 downto  0)           when( iSltScc2 = '1' )else      -- 400000-5FFFFF (2048 kB)  Slot2
                            Scc1Adr(19 downto  0)           when( iSltScc1 = '1' )else      -- 500000-5FFFFF (1024 kB)  Slot1
                            "0"      & ErmAdr(18 downto  0) when( iSltErm  = '1' )else      -- 600000-67FFFF ( 512 kB)  Slot3-2
                            "00100"  & adr(14 downto  0)    when( rom_main = '1' )else      -- 620000-627FFF (  32 kB)  Slot0-0
                            "001010" & adr(13 downto  0)    when( rom_xbas = '1' )else      -- 628000-62BFFF (  16 kB)  Slot3-3
                            "001011" & adr(13 downto  0)    when( rom_opll = '1' )else      -- 62C000-62FFFF (  16 kB)  Slot0-2
                            "0011"   & adr(15 downto  0)    when( rom_extd = '1' )else      -- 630000-63BFFF (  48 kB)  Slot3-1
                            "001111" & adr(13 downto  0)    when( rom_free = '1' )else      -- 63C000-63FFFF (  16 kB)  Slot0-3
                            "01"     & KanAdr(17 downto  0) when( rom_kanj = '1' )else      -- 640000-67FFFF ( 256 kB)  Kanji-data (JIS1+JIS2)
                            null;

    ----------------------------------------------------------------
    -- SD-RAM access
    ----------------------------------------------------------------
    --   SdrSta = "000" => idle
    --   SdrSta = "001" => precharge all
    --   SdrSta = "010" => refresh
    --   SdrSta = "011" => mode register set
    --   SdrSta = "100" => read cpu
    --   SdrSta = "101" => write cpu
    --   SdrSta = "110" => read vdp
    --   SdrSta = "111" => write vdp
    ----------------------------------------------------------------
    w_wrt_req   <=  (RamReq and (
                        (Scc1Wrt and iSltScc1 ) or
                        (Scc2Wrt and iSltScc2 ) or
                        (ErmWrt  and iSltErm  ) or
                        (MapWrt  and iSltMap  )));

    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            if( ff_sdr_seq = "111" )then
                if( RstSeq(4 downto 2) = "000" )then
                    SdrSta <= "000";                                                -- idle
                elsif( RstSeq(4 downto 2) = "001" )then
                    case RstSeq(1 downto 0) is
                        when "00"       => SdrSta <= "000";                         -- idle
                        when "01"       => SdrSta <= "001";                         -- precharge all
                        when "10"       => SdrSta <= "010";                         -- refresh (more than 8 cycles)
                        when others     => SdrSta <= "011";                         -- mode register set
                    end case;
                elsif( RstSeq(4 downto 3) /= "11" )then
                    SdrSta <= "101";                                                -- Write (Initialize memory content)
                elsif( iSltRfsh_n = '0' and VideoDLClk = '1' )then
                    SdrSta <= "010";                                                -- refresh
                elsif( SdPaus = '1' and VideoDLClk = '1' )then
                    SdrSta <= "010";                                                -- refresh
                else
                    --  Normal memory access mode
                    SdrSta(2) <= '1';                                               -- read/write cpu/vdp
                end if;
            elsif( ff_sdr_seq = "001" and SdrSta(2) = '1' and RstSeq(4 downto 3) = "11" )then
                SdrSta(1) <= VideoDLClk;                                            -- 0:cpu, 1:vdp
                if( VideoDLClk = '0' )then
                    SdrSta(0) <= w_wrt_req;         -- for cpu
                else
                    SdrSta(0) <= not WeVdp_n;       -- for vdp
                end if;
            end if;
        end if;
    end process;

    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            case ff_sdr_seq is
                when "000" =>
                    if( SdrSta(2) = '1' )then               -- CPU/VDP read/write
                        SdrCmd <= SdrCmd_ac;
                    elsif( SdrSta(1 downto 0) = "00" )then  -- idle
                        SdrCmd <= SdrCmd_xx;
                    elsif( SdrSta(1 downto 0) = "01" )then  -- precharge all
                        SdrCmd <= SdrCmd_pr;
                    elsif( SdrSta(1 downto 0) = "10" )then  -- refresh
                        SdrCmd <= SdrCmd_re;
                    else                                    -- mode register set
                        SdrCmd <= SdrCmd_ms;
                    end if;
                when "001" =>
                    SdrCmd <= SdrCmd_xx;
                when "010" =>
                    if( SdrSta(2) = '1' )then
                        if( SdrSta(0) = '0' )then
                            SdrCmd <= SdrCmd_rd;            -- "100"(cpu read) / "110"(vdp read)
                        else
                            SdrCmd <= SdrCmd_wr;            -- "101"(cpu write) / "111"(vdp write)
                        end if;
                    end if;
                when "011" =>
                    SdrCmd <= SdrCmd_xx;
                when others =>
                    null;
            end case;
        end if;
    end process;

    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            case ff_sdr_seq is
                when "000" =>
                    if( SdrSta(2) = '0' )then
                        --  single  CL=2 WT=0(seq) BL=1
                        SdrAdr <= "00010" & "0" & "010" & "0" & "000";
                    else
                        if( RstSeq(4 downto 3) /= "11" )then
                            SdrAdr <= ClrAdr(12 downto 0);      -- clear memory (VRAM, MainRAM)
                        elsif( VideoDLClk = '0' )then
                            SdrAdr <= CpuAdr(13 downto 1);      -- cpu read/write
                        else
                            SdrAdr <= VdpAdr(12 downto 0);      -- vdp read/write
                        end if;
                    end if;
                when "010" =>
                    SdrAdr(10 downto 9) <= "10";                                      -- A10=1 => enable auto precharge
                    if( SdrSta(2) = '1' )then
                        if( SdrSta(0) = '0' )then
                            SdrAdr(12) <= '0';
                            SdrAdr(11) <= '0';
                        else
                            if( RstSeq(4 downto 3) /= "11" )then
                                SdrAdr(12) <= '0';
                                SdrAdr(11) <= '0';
                            elsif( VideoDLClk = '0' )then
                                SdrAdr(12) <= not CpuAdr(0);
                                SdrAdr(11) <= CpuAdr(0);
                            else
                                SdrAdr(12) <= not VdpAdr(16);
                                SdrAdr(11) <= VdpAdr(16);
                            end if;
                        end if;
                    end if;
                    if( RstSeq(4 downto 2) = "010" )then
                        SdrAdr(8 downto 0) <= "111" & "000" & ClrAdr(15 downto 13);     -- clear VRAM (128 kB)        => start adr 700000h
                    elsif( RstSeq(4 downto 2) = "011" )then
                        SdrAdr(8 downto 0) <= "110" & "000" & ClrAdr(15 downto 13);     -- clear ERAM (128 kB)        => start adr 600000h
                    elsif( RstSeq(4 downto 2) = "100" )then
                        SdrAdr(8 downto 0) <= "000" & "000" & ClrAdr(15 downto 13);     -- clear MainRAM (128 kB)     => start adr 000000h
                    elsif( RstSeq(4 downto 1) = "1010" )then
                        SdrAdr(8 downto 0) <= "100" & "000" & ClrAdr(15 downto 13);     -- clear ESE-SCC2             => start adr 400000h
                    elsif( RstSeq(4 downto 1) = "1011" )then
                        SdrAdr(8 downto 0) <= "101" & "000" & ClrAdr(15 downto 13);     -- clear ESE-SCC1             => start adr 500000h
                    elsif( VideoDLClk = '0' )then
                        SdrAdr(8 downto 0) <= CpuAdr(22 downto 14);
                    elsif( VdpAdr(15) = '0' )then
                        SdrAdr(8 downto 0) <= "11" & "1" & vram_page(3 downto 0) & VdpAdr(14 downto 13);
                    else
                        SdrAdr(8 downto 0) <= "11" & "1" & vram_page(7 downto 4) & VdpAdr(14 downto 13);
                    end if;
                when others =>
                    null;
            end case;
        end if;
    end process;

    process( ff_sdr_seq, SdrSta, RstSeq, VideoDLClk, dbo, VrmDbo )
    begin
        pMemDatEn <= '0';
        pMemDatOut <= (others => '0');
        if( ff_sdr_seq = "010" and SdrSta(2) = '1' and SdrSta(0) = '1' )then
             if( RstSeq(4 downto 3) /= "11" )then
                 pMemDatEn <= '1';
             elsif( VideoDLClk = '0' )then
                 pMemDatEn <= '1';
                 pMemDatOut <= dbo;      -- "101"(cpu write)
             else
                 pMemDatEn <= '1';
                 pMemDatOut <= VrmDbo;   -- "111"(vdp write)
             end if;
        end if;
    end process;

    -- Clear address for DRAM initialization
    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            if( ff_sdr_seq = "010" )then
                if( RstSeq(4 downto 3) /= "11" )then
                    ClrAdr <= (others => '0');
                else
                    ClrAdr <= ClrAdr + 1;
                end if;
            end if;
        end if;
    end process;

    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            if( ff_sdr_seq = "101" )then
                MemDbi <= pMemDatIn( 15 downto 0 );
            end if;
        end if;
    end process;

    -- Data read latch for CPU
    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            if( ff_sdr_seq = "110" )then
                if( SdrSta = "100" )then        -- read cpu
                    if( CpuAdr(0) = '0' )then
                        RamDbi  <= MemDbi(  7 downto 0 );
                    else
                        RamDbi  <= MemDbi( 15 downto 8 );
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Data read latch for VDP
    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            if( ff_sdr_seq = "110" )then
                if( SdrSta = "110" )then        -- read vdp
                    VrmDbi  <= MemDbi( 15 downto 0 );
                end if;
            end if;
        end if;
    end process;

--  --  'PAUSE' assignment (dismissed dangerous function)
--  process( memclk )
--  begin
--      if( memclk'event and memclk = '1' )then
--          if( mmcena = '0' )then
--              if( ff_sdr_seq = "101" )then
--                  if( SdrSta(2) = '1' )then
--                      if( SdrSta(0) = '0' and pVdpInt_n /= '0' )then
--                          SdPaus <= Paus;
--                      end if;
--                  else
--                      SdPaus <= Paus;
--                  end if;
--              end if;
--          end if;
--      end if;
--  end process;

    SdPaus <= '0';

    -- SDRAM controller state
    process( memclk )
    begin
        if( memclk'event and memclk = '1' )then
            case ff_sdr_seq is
                when "000" =>
                    if( VideoDHClk = '1' or RstSeq(4 downto 3) /= "11" )then
                        ff_sdr_seq <= "001";
                    end if;
                when "111" =>
                    if( VideoDHClk = '0' or RstSeq(4 downto 3) /= "11" )then
                        ff_sdr_seq <= "000";
                    end if;
                when others =>
                    ff_sdr_seq <= ff_sdr_seq + 1;
            end case;
        end if;
    end process;

    process( reset, clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( reset = '1' )then
                RamAck <= '0';
	         else
                if( RamReq = '0' )then
                    RamAck <= '0';
                elsif( VideoDLClk = '0' and VideoDHClk = '1' )then
                    RamAck <= '1';
                end if;
	    			
	    			if( VideoDLClk = '0' ) then
	    				vram_page <= vram_slot_ids;
	    			end if;
            end if;
        end if;
    end process;

    pMemCke     <= '1';
    pMemCs_n    <= '0';
    pMemRas_n   <= SdrCmd(2);
    pMemCas_n   <= SdrCmd(1);
    pMemWe_n    <= SdrCmd(0);

    pMemUdq     <= SdrAdr(12);
    pMemLdq     <= SdrAdr(11);
    pMemBa1     <= '0';
    pMemBa0     <= '0';

    pMemAdr     <= SdrAdr;

    ----------------------------------------------------------------
    -- Connect components
    ----------------------------------------------------------------
    U01 : work.T80pa
	  port map(
			RESET_n     => ((pSltRst_n or RstKeyLock) and swioRESET_n),
			R800_mode   => pR800,
			CLK         => clk21m,
			CEN_p       => trueCen,
			CEN_n       => trueCen_n,
			WAIT_n      => pSltWait_n,
			INT_n       => pSltInt_n,
			NMI_n       => '1',
			BUSRQ_n     => '1',
			M1_n        => CpuM1_n,
			MREQ_n      => pSltMerq_n,
			IORQ_n      => pSltIorq_n,
			RD_n        => pSltRd_n,
			WR_n        => pSltWr_n,
			RFSH_n      => CpuRfsh_n,
			HALT_n      => open,
			BUSAK_n     => open,
			A           => pSltAdr,
			DI          => cpu_di,
			DO          => cpu_do
	  );

    U02 : work.iplrom
	  port map (
			clk => clk21m, 
			adr => adr, 
			dbi => RomDbi
	  );

    U03 : work.megasd
	  port map (
			clk21m => clk21m, 
			reset  => reset, 
			clkena => cpucen, 
			req    => ErmReq, 
			ack    => open, 
			wrt    => wrt, 
			adr    => adr, 
			dbi    => open, 
			dbo    => dbo,
			ramreq => ErmRam, 
			ramwrt => ErmWrt, 
			ramadr => ErmAdr, 
			ramdbi => RamDbi, 
			ramdbo => open,
			mmcdbi => MmcDbi, 
			mmcena => MmcEna, 
			mmcact => MmcAct, 
			mmc_ck => mmc_sck, 
			mmc_cs => mmc_cs, 
			mmc_di => mmc_mosi, 
			mmc_do => mmc_miso,
			epc_ck => open, 
			epc_cs => open, 
			epc_oe => open, 
			epc_di => open, 
			epc_do => '0'
	  );

    U05 : work.mapper
	  port map (
			clk21m => clk21m, 
			reset  => reset, 
			clkena => cpucen, 
			req    => MapReq, 
			ack    => open, 
			mem    => mem, 
			wrt    => wrt, 
			adr    => adr, 
			dbi    => MapDbi, 
			dbo    => dbo,
			ramreq => MapRam, 
			ramwrt => MapWrt, 
			ramadr => MapAdr, 
			ramdbi => RamDbi, 
			ramdbo => open
	  );

    U06 : work.eseps2
	  port map (
			clk21m   => clk21m, 
			reset    => reset, 
			clkena   => cpucen, 
			Kmap     => Kmap, 
			Paus     => Paus, 
			Scro     => Scro, 
			Reso     => Reso, 
			Fkeys    => Fkeys,
			ps2_key  => ps2_key, 
			PpiPortC => PpiPortC, 
			pKeyX    => PpiPortB
	  );

    U07 : work.rtc
	  port map (
			clk21m => clk21m, 
			reset  => reset, 
			setup  => rtc_setup, 
			rt     => rtc_time, 
			clkena => w_10Hz, 
			req    => RtcReq, 
			ack    => open, 
			wrt    => wrt, 
			adr    => adr, 
			dbi    => RtcDbi, 
			dbo    => dbo
	  );

    U08 : work.kanji
	  port map (
			clk21m => clk21m, 
			reset  => reset, 
			clkena => cpucen, 
			req    => KanReq, 
			ack    => open, 
			wrt    => wrt, 
			adr    => adr, 
			dbi    => KanDbi, 
			dbo    => dbo,
			ramreq => KanRom, 
			ramadr => KanAdr, 
			ramdbi => RamDbi, 
			ramdbo => open
	  );

    -- V9958 MSX2+/tR VDP
    U20 : work.vdp
	  port map (
			CLK21M          => clk21m, 
			RESET           => reset, 
			REQ             => VdpReq, 
			ACK             => open, 
			WRT             => wrt, 
			ADR             => adr, 
			DBI             => VdpDbi, 
			DBO             => dbo, 
			INT_N           => pVdpInt_n,
			PRAMOE_N        => open, 
			PRAMWE_N        => WeVdp_n, 
			PRAMADR         => VdpAdr, 
			PRAMDBI         => VrmDbi, 
			PRAMDBO         => VrmDbo, 
			VDPSPEEDMODE    => VdpSpeedMode, 
			RATIOMODE       => RatioMode, 
			CENTERYJK_R25_N => centerYJK_R25_n,
			PVIDEOR         => VideoR, 
			PVIDEOG         => VideoG, 
			PVIDEOB         => VideoB, 
			PVIDEODE        => pVideoDE, 
			PVIDEOHS_N      => VideoHS_n, 
			PVIDEOVS_N      => VideoVS_n, 
			PVIDEOCS_N      => open,
			PVIDEODHCLK     => VideoDHClk, 
			PVIDEODLCLK     => VideoDLClk, 
			DISPRESO        => Reso_v, 
			NTSC_PAL_TYPE   => ntsc_pal_type, 
			FORCED_V_MODE   => forced_v_mode, 
			LEGACY_VGA      => legacy_vga
	  );

    U30 : work.psg
	  port map (
			clk21m  => clk21m, 
			reset   => reset, 
			clkena  => cpucen, 
			req     => PsgReq, 
			ack     => open, 
			wrt     => wrt, 
			adr     => adr, 
			dbi     => PsgDbi, 
			dbo     => dbo,
			joya    => pJoyA, 
			stra    => pStrA, 
			joyb    => pJoyB, 
			strb    => pStrB, 
			kana    => open, 
			cmtin   => cmtin,
			keymode => w_key_mode, 
			wave    => PsgAmp
	  );

    U31_1 : work.megaram
	  port map (
			clk21m => clk21m, 
			reset  => reset, 
			clkena => cpucen, 
			req    => Scc1Req, 
			ack    => Scc1Ack, 
			wrt    => wrt, 
			adr    => adr, 
			dbi    => Scc1Dbi, 
			dbo    => dbo,
			ramreq => Scc1Ram, 
			ramwrt => Scc1Wrt, 
			ramadr => Scc1Adr, 
			ramdbi => RamDbi, 
			ramdbo => open, 
			mapsel => Scc1Type, 
			wavl   => Scc1AmpL, 
			wavr   => open
	  );

    Scc1Type <= "00"    when( Slot1Mode = '0' )else
                "10";

    U31_2 : work.megaram
	  port map (
			clk21m => clk21m,
			reset  => reset,
			clkena => cpucen,
			req    => Scc2Req,
			ack    => Scc2Ack,
			wrt    => wrt,
			adr    => adr,
			dbi    => Scc2Dbi,
			dbo    => dbo,
			ramreq => Scc2Ram,
			ramwrt => Scc2Wrt,
			ramadr => Scc2Adr,
			ramdbi => RamDbi,
			ramdbo => open,
			mapsel => Slot2Mode,
			wavl   => Scc2AmpL,
			wavr   => open
	  );

    U32 : work.eseopll
	  port map (
		  clk21m  => clk21m,
		  reset   => reset,
		  clkena  => cpucen,
		  enawait => OpllEnaWait,
		  req     => OpllReq,
		  ack     => OpllAck,
		  wrt     => wrt,
		  adr     => adr,
		  dbo     => dbo,
		  wav     => pAudioOPLL
	  );

    OpllEnaWait     <=  '1' when( ff_clksel = '1' or ff_clksel5m_n = '0' )else
                        '0';

    U34: work.system_timer
    port map (
        clk21m  => clk21m,
        reset   => reset,
        req     => systim_req,
        ack     => open,
        adr     => adr,
        dbi     => systim_dbi,
        dbo     => dbo
    );

    U40 : tr_pcm
    port map (
        clk21m   => clk21m,
        reset    => reset,
        req      => tr_pcm_req,
        ack      => open,
        wrt      => wrt,
        adr      => adr(0),
        dbi      => tr_pcm_dbi,
        dbo      => dbo,
        wave_in  => (others => '0'),
        wave_out => pAudioTRPCM
    );
	 
    U35: work.switched_io_ports
    port map (
        clk21m          => clk21m,
        reset           => reset,
        req             => swio_req,
        ack             => open,
        wrt             => wrt,
        adr             => adr,
        dbi             => swio_dbi,
        dbo             => dbo,

        io40_n          => io40_n,
        io41_id212_n    => io41_id212_n, -- here to reduce LEs
        io42_id212      => io42_id212,
        io43_id212      => io43_id212,
        io44_id212      => io44_id212,
        OpllVol         => open,
        SccVol          => open,
        PsgVol          => open,
        MstrVol         => open,
        CustomSpeed     => CustomSpeed,
        tMegaSD         => tMegaSD,
        tPanaRedir      => tPanaRedir,   -- here to reduce LEs
        VdpSpeedMode    => VdpSpeedMode,
        V9938_n         => V9938_n,
        Mapper_req      => Mapper_req,   -- here to reduce LEs
        Mapper_ack      => Mapper_ack,
        MegaSD_req      => MegaSD_req,   -- here to reduce LEs
        MegaSD_ack      => MegaSD_ack,
        io41_id008_n    => io41_id008_n,
        swioKmap        => swioKmap,
        CmtScro         => CmtScro,
        swioCmt         => swioCmt,
        LightsMode      => LightsMode,
        Red_sta         => Red_sta,
        LastRst_sta     => LastRst_sta,  -- here to reduce LEs
        RstReq_sta      => RstReq_sta,   -- here to reduce LEs
        Blink_ena       => Blink_ena,
        pseudoStereo    => pseudoStereo,
        extclk3m        => extclk3m,
        ntsc_pal_type   => ntsc_pal_type,
        forced_v_mode   => forced_v_mode,
        right_inverse   => right_inverse,
        vram_slot_ids   => vram_slot_ids,
        DefKmap         => DefKmap,      -- here to reduce LEs

        ff_dip_req      => ff_dip_req,
        ff_dip_ack      => ff_dip_ack,   -- here to reduce LEs

        SdPaus          => SdPaus,
        Scro            => '0',
        ff_Scro         => '0',
        Reso            => '0',
        ff_Reso         => '0',
        FKeys           => FKeys,
        vFKeys          => vFKeys,
        LevCtrl         => LevCtrl,
        GreenLvEna      => GreenLvEna,

        swioRESET_n     => swioRESET_n,
        warmRESET       => warmRESET,
        WarmMSXlogo     => WarmMSXlogo,   -- here to reduce LEs

        ZemmixNeo       => ZemmixNeo,

        JIS2_ena        => JIS2_ena,
        portF4_mode     => portF4_mode,
        ff_ldbios_n     => ff_ldbios_n,

        RatioMode       => RatioMode,
        centerYJK_R25_n => centerYJK_R25_n,
        legacy_sel      => legacy_sel,
        Slot0_req       => Slot0_req,     -- here to reduce LEs
        Slot0Mode       => Slot0Mode
    );

end RTL;
