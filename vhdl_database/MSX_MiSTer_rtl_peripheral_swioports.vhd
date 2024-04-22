--
-- swioports.vhd
--   Switched I/O ports ($40-$4F)
--   Revision 9
--
-- Copyright (c) 2011-2019 KdL
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
    use work.vdp_package.all;

entity switched_io_ports is
    port(
        clk21m          : in    std_logic;
        reset           : in    std_logic;
        req             : in    std_logic;
        ack             : out   std_logic;
        wrt             : in    std_logic;
        adr             : in    std_logic_vector( 15 downto 0 );
        dbi             : out   std_logic_vector(  7 downto 0 );
        dbo             : in    std_logic_vector(  7 downto 0 );
        -- 'REGS' group
        io40_n          : inout std_logic_vector(  7 downto 0 );            -- ID Manufacturers/Devices :   $08 (008), $D4 (212=1chipMSX), $FF (255=null)
        io41_id212_n    : inout std_logic_vector(  7 downto 0 );            -- $41 ID212 states         :   Smart Commands
        io42_id212      : inout std_logic_vector(  7 downto 0 );            -- $42 ID212 states         :   Virtual DIP-SW states
        io43_id212      : inout std_logic_vector(  7 downto 0 );            -- $43 ID212 states         :   Lock Mask for port $42 functions, cmt and reset key
        io44_id212      : inout std_logic_vector(  7 downto 0 );            -- $44 ID212 states         :   Lights Mask have the green leds control when Lights Mode is enabled
        OpllVol         : inout std_logic_vector(  2 downto 0 );            -- OPLL Volume
        SccVol          : inout std_logic_vector(  2 downto 0 );            -- SCC-I Volume
        PsgVol          : inout std_logic_vector(  2 downto 0 );            -- PSG Volume
        MstrVol         : inout std_logic_vector(  2 downto 0 );            -- Master Volume
        CustomSpeed     : inout std_logic_vector(  3 downto 0 );            -- Counter limiter of CPU wait control
        tMegaSD         : inout std_logic;                                  -- Turbo on MegaSD access   :   3.58MHz to 5.37MHz autoselection
        tPanaRedir      : inout std_logic;                                  -- tPana Redirection switch
        VdpSpeedMode    : inout std_logic;                                  -- VDP Speed Mode           :   0=Normal, 1=Fast
        V9938_n         : inout std_logic;                                  -- V9938 Status             :   0=V9938, 1=V9958
        Mapper_req      : inout std_logic;                                  -- Mapper req               :   Warm or Cold Reset are necessary to complete the request
        Mapper_ack      : out   std_logic;                                  -- Current Mapper state
        MegaSD_req      : inout std_logic;                                  -- MegaSD req               :   Warm or Cold Reset are necessary to complete the request
        MegaSD_ack      : out   std_logic;                                  -- Current MegaSD state
        io41_id008_n    : inout std_logic;                                  -- $41 ID008 BIT-0 state    :   0=5.37MHz, 1=3.58MHz (write_n only)
        swioKmap        : inout std_logic;                                  -- Keyboard layout selector
        CmtScro         : inout std_logic;                                  -- CMT state
        swioCmt         : inout std_logic;                                  -- CMT enabler
        LightsMode      : inout std_logic;                                  -- Custom green led states
        Red_sta         : inout std_logic;                                  -- Custom red led state
        LastRst_sta     : inout std_logic;                                  -- Last reset state         :   0=Cold Reset, 1=Warm Reset (MSX2+) / 1=Cold Reset, 0=Warm Reset (MSXtR)
        RstReq_sta      : inout std_logic;                                  -- Reset request state      :   0=No, 1=Yes
        Blink_ena       : inout std_logic;                                  -- MegaSD blink led enabler
        pseudoStereo    : inout std_logic;                                  -- RCA-LEFT(red) = External Audio Card / RCA-RIGHT(white) = Internal Sounds
        extclk3m        : inout std_logic;                                  -- External Clock 3.58MHz   :   0=No, 1=Yes
        ntsc_pal_type   : inout std_logic;                                  -- NTSC/PAL Type            :   0=Forced, 1=Auto
        forced_v_mode   : inout std_logic;                                  -- Forced Video Mode        :   0=60Hz, 1=50Hz
        right_inverse   : inout std_logic;                                  -- Right Inverse Audio      :   0=Off (Normal Wave), 1=On (Inverse Wave)
        vram_slot_ids   : inout std_logic_vector(  7 downto 0 );            -- VRAM Slot IDs            :   MSB(4bits)=0-15 for Page 1, LSB(4bits)=0-15 for Page 0
        DefKmap         : inout std_logic;                                  -- Default keyboard layout  :   0=JP, 1=Non-JP (as UK,FR,..)
        -- 'DIP-SW' group
        ff_dip_req      : in    std_logic_vector(  7 downto 0 );            -- DIP-SW states/reqs
        ff_dip_ack      : inout std_logic_vector(  7 downto 0 );            -- DIP-SW acks
        -- 'KEYS' group
        SdPaus          : in    std_logic;
        Scro            : in    std_logic;
        ff_Scro         : in    std_logic;
        Reso            : in    std_logic;
        ff_Reso         : in    std_logic;
        FKeys           : in    std_logic_vector(  7 downto 0 );
        vFKeys          : in    std_logic_vector(  7 downto 0 );
        LevCtrl         : out   std_logic_vector(  2 downto 0 );            -- Volume and high-speed level
        GreenLvEna      : out   std_logic;
        -- 'RESET' group
        swioRESET_n     : inout std_logic;                                  -- Reset Pulse
        warmRESET       : inout std_logic;                                  -- 0=Cold Reset, 1=Warm Reset
        WarmMSXlogo     : inout std_logic;                                  -- Show MSX logo with Warm Reset
        -- 'MACHINES' group
        ZemmixNeo       : inout std_logic;                                  -- Machine type             :   0=1chipMSX, 1=Zemmix Neo
        -- 'IPL-ROM' group
        JIS2_ena        : inout std_logic;                                  -- JIS2 enabler             :   0=JIS1 only (BIOS 384 kB), 1=JIS1+JIS2 (BIOS 512 kB)
        portF4_mode     : inout std_logic;                                  -- Port F4 mode             :   0=F4 Device Inverted (MSX2+), 1=F4 Device Normal (MSXtR)
        ff_ldbios_n     : in    std_logic;                                  -- OCM-BIOS loading status
        -- 'SPECIAL' group
        RatioMode       : inout std_logic_vector(  2 downto 0 );            -- Pixel Ratio 1:1 for LED Display (default is 0) (range 0-7) (60Hz only)
        centerYJK_R25_n : inout std_logic;                                  -- Centering YJK Modes/R25 Mask (0=centered, 1=shifted to the right)
        legacy_sel      : inout std_logic;                                  -- Legacy Output selector   :   0=Assigned to VGA, 1=Assigned to VGA+
        Slot0_req       : inout std_logic;                                  -- Slot0 Primary Mode req   :   Warm Reset is necessary to complete the request
        Slot0Mode       : inout std_logic                                   -- Current Slot0 state      :   0=Primary, 1=Expanded
    );
end switched_io_ports;

architecture RTL of switched_io_ports is

    signal  swio_ack    : std_logic;

    -- 'OCM-PLD' version number (x \ 10).(y mod 10).(z[0~3])                -- OCM-PLD version 0.0(.0) ~ 25.5(.3)
    constant ocm_pld_xy : std_logic_vector(  7 downto 0 ) := "00100110";    -- 38
    constant ocm_pld_z  : std_logic_vector(  1 downto 0 ) :=       "00";    -- 0

    -- 'Switched I/O Ports' revision number (0-31)                          -- Switched I/O ports Revision 0 ~ 31
    constant swioRevNr  : std_logic_vector(  4 downto 0 ) :=    "01001";    -- 9

begin
    -- out assignment: 'ports $40-$4F'
                -- $40 => read_n/write ($41 ID008 BIT-0 is not here, it's a write_n only signal)
    dbi <=  io40_n                              when( (adr(3 downto 0) = "0000") )else
                -- $43 ID008 for compatibility => read only
            "00000000"                          when( (adr(3 downto 0) = "0011") and (io40_n = "11110111") )else
                -- $41 ID212 smart commands => read_n/write
            io41_id212_n                        when( (adr(3 downto 0) = "0001") and (io40_n = "00101011") )else
                -- $42 ID212 states of virtual dip-sw => read/write_n
            io42_id212                          when( (adr(3 downto 0) = "0010") and (io40_n = "00101011") )else
                -- $43 ID212 lock mask => read/write_n
                -- [MSB] megasd/mapper/resetkey/slot2/slot1/cmt/display/turbo [LSB]
            io43_id212                          when( (adr(3 downto 0) = "0011") and (io40_n = "00101011") )else
                -- $44 ID212 green leds mask of lights mode => read/write_n
            io44_id212                          when( (adr(3 downto 0) = "0100") and (io40_n = "00101011") )else
                -- $45 ID212 [MSB] master status & volume / psg status & volume [LSB] => read/write_n
            (MstrVol(2) and MstrVol(1) and MstrVol(0)) & not MstrVol & (not (PsgVol(2) or PsgVol(1) or PsgVol(0))) & PsgVol when( (adr(3 downto 0) = "0101") and (io40_n = "00101011") )else
                -- $46 ID212 [MSB] any scc-i status & volume / opll status & volume [LSB] => read/write_n
            (not (SccVol(2) or SccVol(1) or SccVol(0))) & SccVol & (not (OpllVol(2) or OpllVol(1) or OpllVol(0))) & OpllVol when( (adr(3 downto 0) = "0110") and (io40_n = "00101011") )else
                -- $47 ID212 [MSB] megasd_req/mapper_req/vdpspeedmode/tpana_redir/turbo_megasd/custom_speed_lev(1-7) [LSB] => read only
            MegaSD_req & Mapper_req & VdpSpeedMode & tPanaRedir & tMegaSD & ("001" - CustomSpeed(2 downto 0))
                                                when( (adr(3 downto 0) = "0111") and (io40_n = "00101011") )else
                -- $48 ID212 states as below => read only
            Blink_ena & RstReq_sta & LastRst_sta & Red_sta & LightsMode & CmtScro & swioKmap & not io41_id008_n
                                                when( (adr(3 downto 0) = "1000") and (io40_n = "00101011") )else
                -- $49 ID212 states as below => read only
                -- Machine Type IDs are "XX0000XX" for 1chipMSX, "XX0001XX" for Zemmix Neo, all the others are free IDs
            forced_v_mode & ( ntsc_pal_type and ( not io42_id212(1) or io42_id212(2) ) ) & "000" & ZemmixNeo & extclk3m & pseudoStereo
                                                when( (adr(3 downto 0) = "1001") and (io40_n = "00101011") )else
                -- $4A ID212 states as below => read only
            "0000000" & right_inverse           when( (adr(3 downto 0) = "1010") and (io40_n = "00101011") )else
                -- $4B ID212 => free
                -- $4C ID212 states of physical dip-sw => read only
            ff_dip_req                          when( (adr(3 downto 0) = "1100") and (io40_n = "00101011") )else
                -- $4D ID212 VRAM Slot IDs => read / write_n
            vram_slot_ids                       when( (adr(3 downto 0) = "1101") and (io40_n = "00101011") )else
                -- $4E ID212 [MSB] ocm_pld_vers_xy(v0.0~v25.5) [LSB] => read only
            ocm_pld_xy                          when( (adr(3 downto 0) = "1110") and (io40_n = "00101011") )else
                -- $4F ID212 [MSB] def_keyb_layout/ocm_pld_vers_z(v0~v3)/swioports_rev_nr(0-15) [LSB] => read only
            DefKmap & ocm_pld_z & swioRevNr     when( (adr(3 downto 0) = "1111") and (io40_n = "00101011") )else
                -- Not found
            "11111111";

    ack <=  swio_ack;

    process( clk21m )
    begin
        if rising_edge(clk21m)then
          if( reset = '1' )then

			   LevCtrl         <=  "000";
            swioRESET_n     <=  '1';                    -- End of Reset pulse
            io40_n          <=  "11111111";             -- Default Port $40 after any reboot
            vram_slot_ids   <=  "00010000";             -- Default VRAM Slot IDs after any reboot
--          =============================================================================================================
            DefKmap         <=  '1';                    -- Default Keyboard     0=Japanese Layout   1=Non-Japanese Layout
            ZemmixNeo       <=  '1';                    -- Machine Type         0=1chipMSX          1=Zemmix Neo
--          =============================================================================================================
                RatioMode       <=  "000";                  -- Restore Pixel Ratio 1:1 for LED Display after any reboot
            if( warmRESET /= '1' )then
                -- Cold Reset
                    OFFSET_Y        :=  "0010011";          -- Default Vertical Offset
--              io41_id212_n    <=  "00000000";         -- Smart Commands will be zero at 1st boot
                io42_id212      <=  ff_dip_req;         -- Virtual DIP-SW are DIP-SW
                ff_dip_ack      <=  ff_dip_req;         -- Sync to its req
                io43_id212      <=  "00X00000";         -- Lock Mask is Full Unlocked
                io44_id212      <=  "00000000";         -- Lights Mask is Full Off
                OpllVol         <=  "111";              -- Default OPLL Volume (old preset "110")
                SccVol          <=  "111";              -- Default SCC-I Volume (old preset "110")
                PsgVol          <=  "111";              -- Default PSG Volume (old preset "011")
                MstrVol         <=  "000";              -- Default Master Volume
                CustomSpeed     <=  "0010";             -- Custom Turbo (old 10.74MHz)
                tMegaSD         <=  '1';                -- Turbo MegaSD
                tPanaRedir      <=  '0';                -- tPana Redirection is Off
                VdpSpeedMode    <=  '0';                -- VDP Speed Mode is Normal
                Mapper_req      <=  ff_dip_req(6);      -- Set Mapper state to DIP-SW7 state
                Mapper_ack      <=  ff_dip_req(6);      -- Prevent system crash using DIP-SW7
                MegaSD_req      <=  ff_dip_req(7);      -- Set MegaSD state to DIP-SW8 state
                MegaSD_ack      <=  ff_dip_req(7);      -- Prevent system crash using DIP-SW8
                io41_id008_n    <=  '1';                -- CPU Clock is 3.58MHz
                swioKmap        <=  DefKmap;            -- Keyboard Layout to Default
                swioCmt         <=  '0';                -- CMT is Off
                LightsMode      <=  '0';                -- Lights Mode is Auto
                Red_sta         <=  not io41_id008_n;   -- Red Led is Turbo 5.37MHz
                LastRst_sta     <=  portF4_mode;        -- Cold state
                Blink_ena       <=  '1';                -- MegaSD Blink is On
                pseudoStereo    <=  '0';                -- Pseudo-Stereo is Off
                extclk3m        <=  '0';                -- External Clock is equal to CPU Clock
                ntsc_pal_type   <=  '1';                -- NTSC/PAL Type is Auto
                forced_v_mode   <=  '0';                -- Manual NTSC/PAL is NTSC
                right_inverse   <=  '0';                -- Right Inverse Audio is Off
                centerYJK_R25_n <=  '1';                -- Centering YJK Modes/R25 Mask is Off
                legacy_sel      <=  '1';                -- Legacy Output is assigned to VGA+
                Slot0_req       <=  '1';                -- Set Slot0 Expanded Mode
                Slot0Mode       <=  '1';                -- Prevent system crash using Reset Key
            else
                -- Warm Reset
                io42_id212(6)   <=  Mapper_req;         -- Set Mapper state to last required
                Mapper_ack      <=  Mapper_req;         -- Confirm the last Mapper state
                io42_id212(7)   <=  MegaSD_req;         -- Set MegaSD state to last required
                MegaSD_ack      <=  MegaSD_req;         -- Confirm the last MegaSD state
                LastRst_sta     <=  not WarmMSXlogo;    -- Warm state
                Slot0Mode       <=  Slot0_req;          -- Set Slot-0 state to last required
            end if;

          else
            if( warmRESET /= '0' )then
                WarmMSXlogo <=  portF4_mode;            -- MSX logo will be Off after a Warm Reset
                warmRESET   <=  '0';                    -- End of Warm Reset cycle
            else
                -- in assignment: 'Green Level Enabler'
                GreenLvEna  <=  '0';
                -- in assignment: 'Reset Request State' (internal signal)
                if( (Mapper_req /= io42_id212(6)) or (MegaSD_req /= io42_id212(7)) or (Slot0_req /= Slot0Mode) )then
                    RstReq_sta  <=  '1';                                    -- Yes
                else
                    RstReq_sta  <=  '0';                                    -- No
                end if;
                -- in assignment: 'Red State'
                if( LightsMode = '0')then
                    Red_sta     <=  not io41_id008_n;
                end if;
                -- in assignment: 'DIP-SW'
                if( ff_dip_req(0) /= ff_dip_ack(0) )then                    -- DIP-SW1      is  TURBO state
                    if( io43_id212(0) = '0' )then                           -- BIT[0]=0     of  Lock Mask
                        if( extclk3m = '0' )then
                            io41_id008_n    <=  '1';                        -- 5.37MHz      is  Off
                            io42_id212(0)   <=  ff_dip_req(0);              -- 3.58MHz      or  Custom Turbo
                        else
                            io41_id008_n    <=  not ff_dip_req(0);          -- 3.58MHz      or  5.37MHz
                            io42_id212(0)   <=  '0';
                        end if;
                        ff_dip_ack(0)   <=  ff_dip_req(0);
                    end if;
                end if;
                if( ff_dip_req(1) /= ff_dip_ack(1) )then                    -- DIP-SW2      is  DISPLAY(A) state
                    if( io43_id212(1) = '0' )then                           -- BIT[1]=0     of  Lock Mask
                        io42_id212(1)   <=  ff_dip_req(1);
                        ff_dip_ack(1)   <=  ff_dip_req(1);
                    end if;
                end if;
                if( ff_dip_req(2) /= ff_dip_ack(2) )then                    -- DIP-SW3      is  DISPLAY(B) state
                    if( io43_id212(1) = '0' )then                           -- BIT[1]=0     of  Lock Mask
                        io42_id212(2)   <=  ff_dip_req(2);
                        ff_dip_ack(2)   <=  ff_dip_req(2);
                    end if;
                end if;
                if( ff_dip_req(3) /= ff_dip_ack(3) )then                    -- DIP-SW4      is  SLOT1 state
                    if( io43_id212(3) = '0' )then                           -- BIT[3]=0     of  Lock Mask
                        io42_id212(3)   <=  ff_dip_req(3);
                        ff_dip_ack(3)   <=  ff_dip_req(3);
                    end if;
                end if;
                if( ff_dip_req(4) /= ff_dip_ack(4) )then                    -- DIP-SW5      is  SLOT2(A) state
                    if( io43_id212(4) = '0' )then                           -- BIT[4]=0     of  Lock Mask
                        io42_id212(4)   <=  ff_dip_req(4);
                        ff_dip_ack(4)   <=  ff_dip_req(4);
                    end if;
                end if;
                if( ff_dip_req(5) /= ff_dip_ack(5) )then                    -- DIP-SW6      is  SLOT2(B) state
                    if( io43_id212(4) = '0' )then                           -- BIT[4]=0     of  Lock Mask
                        io42_id212(5)   <=  ff_dip_req(5);
                        ff_dip_ack(5)   <=  ff_dip_req(5);
                    end if;
                end if;
                if( ff_dip_req(6) /= ff_dip_ack(6) )then                    -- DIP-SW7      is  MAPPER state
                    if( io43_id212(6) = '0' )then                           -- BIT[6]=0     of  Lock Mask
                        Mapper_req      <=  ff_dip_req(6);
                        ff_dip_ack(6)   <=  ff_dip_req(6);
                    end if;
                end if;
                if( ff_dip_req(7) /= ff_dip_ack(7) )then                    -- DIP-SW8      is  MEGASD state
                    if( io43_id212(7) = '0' )then                           -- BIT[7]=0     of  Lock Mask
                        MegaSD_req      <=  ff_dip_req(7);
                        ff_dip_ack(7)   <=  ff_dip_req(7);
                    end if;
                end if;
                -- in assignment: 'Toggle Keys' (keyboard)
                if( SdPaus = '0' )then
                    if( Fkeys(7) = '0' )then                                -- SHIFT key    is  Off
                        if( io43_id212(0) = '0' )then                       -- BIT[0]=0     of  Lock Mask
                            if( Fkeys(1) /= vFKeys(1) )then                 -- F11          is  TURBO selector
                                if( io41_id008_n = '1' and io42_id212(0) = '0' )then
                                    io41_id008_n    <=  '0';                -- 3.58MHz      >>  5.37MHz
                                elsif( io41_id008_n = '0' and io42_id212(0) = '0' )then
                                    if( extclk3m = '0' )then                -- Off          is  Triple Step
                                        io41_id008_n    <=  '1';
                                        io42_id212(0)   <=  '1';            -- 5.37MHz      >>  Custom Turbo
                                    else                                    -- On           is  Double Step
                                        io41_id008_n    <=  '1';            -- 5.37MHz      >>  3.58MHz
                                    end if;
                                else
                                    io42_id212(0)   <=  '0';                -- Custom Turbo >>  3.58MHz
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
                -- in assignment: 'Port $40 [ID Manufacturers/Devices]' (read_n/write)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0000") )then
                    case dbo is
                        when "00001000" =>  io40_n  <=  "11110111";         -- ID 008 => $08
                        when "11010100" =>  io40_n  <=  "00101011";         -- ID 212 => $D4 => 1chipMSX
                        when others     =>  io40_n  <=  "11111111";         -- invalid ID
                    end case;
                end if;
                -- in assignment: 'Port $41 ID008 BIT[0] [Turbo 5.37MHz]' (write_n only)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0001")  and (io40_n = "11110111") )then
                    if( tPanaRedir = '0' )then
                        io41_id008_n    <=  dbo(0);                         -- 3.58MHz  >>      << 5.37MHz
                        io42_id212(0)   <=  '0';                            -- 5.37MHz  have priority over 3.58MHz
                    else
                        io41_id008_n    <=  '1';                            -- Custom Turbo
                        io42_id212(0)   <=  not dbo(0);
                    end if;
                end if;
                -- in assignment: 'Port $41 ID212 [Smart Commands]' (write only)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0001")  and (io40_n = "00101011") )then
                    io41_id212_n    <=  not dbo;
                    case dbo is
                        -- SMART CODES  #000
--                      when "00000000" =>                                  -- Null Command (Reserved)
--                          null;
                        -- SMART CODES  #001, #002
                        when "00000001" =>                                  -- True 5.37MHz     via ID008 (Default)
                            tPanaRedir      <=  '0';
                        when "00000010" =>                                  -- Custom Speed     via ID008
                            tPanaRedir      <=  '1';
                        -- SMART CODES  #003, #004, #005, #006, #007, #008, #009, #010
                        when "00000011" =>                                  -- Standard         3.58MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '0';
                        when "00000100" =>                                  -- Custom Speed 1   4.10MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "1000";
                        when "00000101" =>                                  -- Custom Speed 2   4.48MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "0111";
                        when "00000110" =>                                  -- Custom Speed 3   4.90MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "0110";
                        when "00000111" =>                                  -- Custom Speed 4   5.39MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "0101";
                        when "00001000" =>                                  -- Custom Speed 5   6.10MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "0100";
                        when "00001001" =>                                  -- Custom Speed 6   6.96MHz
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "0011";
                        when "00001010" =>                                  -- Custom Speed 7   8.06MHz (Default)
                            io41_id008_n    <=  '1';
                            io42_id212(0)   <=  '1';
                            CustomSpeed     <=  "0010";
                        -- SMART CODES  #011, #012
                        when "00001011" =>                                  -- Turbo MegaSD     Off
                            tMegaSD         <=  '0';
                        when "00001100" =>                                  -- Turbo MegaSD     On  (Default)
                            tMegaSD         <=  '1';
                        -- SMART CODES  #013, #014, #015, #016, #017, #018, #19, #20
                        when "00001101" =>                                  -- Ext. Slot1       + Ext. Slot2
                            io42_id212(5 downto 3)  <=  "000";
                        when "00001110" =>                                  -- Int. SCC-I Slot1 + Ext. Slot2
                            io42_id212(5 downto 3)  <=  "001";
                        when "00001111" =>                                  -- Ext. Slot1       + Int. SCC-I Slot2
                            io42_id212(5 downto 3)  <=  "010";
                        when "00010000" =>                                  -- Int. SCC-I Slot1 + Int. SCC-I Slot2
                            io42_id212(5 downto 3)  <=  "011";
                        when "00010001" =>                                  -- Ext. Slot1       + Int. ASCII8K Slot2
                            io42_id212(5 downto 3)  <=  "100";
                        when "00010010" =>                                  -- Int. SCC-I Slot1 + Int. ASCII8K Slot2
                            io42_id212(5 downto 3)  <=  "101";
                        when "00010011" =>                                  -- Ext. Slot1       + Int. ASCII16K Slot2
                            io42_id212(5 downto 3)  <=  "110";
                        when "00010100" =>                                  -- Int. SCC-I Slot1 + Int. ASCII16K Slot2
                            io42_id212(5 downto 3)  <=  "111";
                        -- SMART CODES  #021, #022
                        when "00010101" =>                                  -- Japanese Keyboard Layout
                            swioKmap        <=  '0';
                        when "00010110" =>                                  -- Non-Japanese Keyboard Layout
                            swioKmap        <=  '1';
                        -- SMART CODES  #023, #024, #025, #026
                        when "00010111" =>                                  -- Display Mode 15KHz Composite or S-Video
                            io42_id212(2 downto 1)  <=  "00";
                        when "00011000" =>                                  -- Display Mode 15KHz RGB + Audio (Mono)
                            io42_id212(2 downto 1)  <=  "10";
                        when "00011001" =>                                  -- Display Mode 31Khz VGA for LED TV or LED Display (50Hz+60Hz)
                            io42_id212(2 downto 1)  <=  "01";
                        when "00011010" =>                                  -- Display Mode 31Khz VGA+ for CRT Monitor (legacy output) (50Hz+60Hz)
                            io42_id212(2 downto 1)  <=  "11";
                        -- SMART CODES  #027, #028
                        when "00011011" =>                                  -- VDP Speed Mode is Normal (default)
                            VdpSpeedMode    <=  '0';
                        when "00011100" =>                                  -- VDP Speed Mode is Fast (V9958 only)
                            VdpSpeedMode    <=  '1' and V9938_n;
                        -- SMART CODES  #029, #030
                        when "00011101" =>                                  -- MegaSD Off       (warm reset is required)
                            MegaSD_req      <=  '0';
                        when "00011110" =>                                  -- MegaSD On        (warm reset is required)
                            MegaSD_req      <=  '1';
                        -- SMART CODES  #031, #032, #033, #034, #035
                        when "00011111" =>                                  -- MegaSD Blink Off + DIP-SW8 State On
                            Blink_ena       <=  '0';
                        when "00100000" =>                                  -- MegaSD Blink On  + DIP-SW8 State Off (Default)
                            Blink_ena       <=  '1';                        -- This mode have priority when Lights Mode is On
                        when "00100001" =>                                  -- Lights Mode      is  Auto (Default)
                            LightsMode      <=  '0';                        -- Red Led          is  Turbo 5.37MHz
                        when "00100010" =>                                  -- Lights Mode      is  On + Red Off
                            LightsMode      <=  '1';
                            Red_sta         <=  '0';
                        when "00100011" =>                                  -- Lights Mode      is  On + Red On
                            LightsMode      <=  '1';
                            Red_sta         <=  '1';
                        -- SMART CODES  #036, #037, #038
                        when "00100100" =>                                  -- Mute
                            OpllVol         <=  "000";
                            SccVol          <=  "000";
                            PsgVol          <=  "000";
                            MstrVol         <=  "000";
                        when "00100101" =>                                  -- Original Volume
                            OpllVol         <=  "110";
                            SccVol          <=  "110";
                            PsgVol          <=  "011";
                            MstrVol         <=  "000";
                        when "00100110" =>                                  -- Default Volume
                            OpllVol         <=  "111";
                            SccVol          <=  "111";
                            PsgVol          <=  "111";
                            MstrVol         <=  "000";
                        -- SMART CODES  #039, #040
                        when "00100111" =>
                            if( portF4_mode = '0' )then
                                swioCmt         <=  '0';                    -- CMT Off          (Default)
                            else
                                io41_id212_n    <=  "11111111";             -- MSX turbo-R does not have CMT
                            end if;
                        when "00101000" =>
                            if( portF4_mode = '0' )then
                                swioCmt         <=  '1';                    -- CMT On
                            else
                                io41_id212_n    <=  "11111111";             -- MSX turbo-R does not have CMT
                            end if;
                        -- SMART CODES  #041, #042
                        when "00101001" =>                                  -- Turbo Locked
                            io43_id212(0)   <=  '1';
                        when "00101010" =>                                  -- Turbo Unlocked
                            io43_id212(0)   <=  '0';
                        -- SMART CODES  #043, #044
                        when "00101011" =>                                  -- Display Locked
                            io43_id212(1)   <=  '1';
                        when "00101100" =>                                  -- Display Unlocked
                            io43_id212(1)   <=  '0';
                        -- SMART CODES  #045, #046
                        when "00101101" =>                                  -- Audio Mixer & CMT Locked
                            io43_id212(2)   <=  '1';
                        when "00101110" =>                                  -- Audio Mixer & CMT Unlocked
                            io43_id212(2)   <=  '0';
                        -- SMART CODES  #047, #048
                        when "00101111" =>                                  -- Slot1 Locked
                            io43_id212(3)   <=  '1';
                        when "00110000" =>                                  -- Slot1 Unlocked
                            io43_id212(3)   <=  '0';
                        -- SMART CODES  #049, #050
                        when "00110001" =>                                  -- Slot2 Locked
                            io43_id212(4)   <=  '1';
                        when "00110010" =>                                  -- Slot2 Unlocked
                            io43_id212(4)   <=  '0';
                        -- SMART CODES  #051, #052
                        when "00110011" =>                                  -- Slot1 + Slot2 Locked
                            io43_id212(4 downto 3)  <=  "11";
                        when "00110100" =>                                  -- Slot1 + Slot2 Unlocked
                            io43_id212(4 downto 3)  <=  "00";
                        -- SMART CODES  #053, #054
                        when "00110101" =>                                  -- Reset Key Locked
                            io43_id212(5)   <=  '1';
                        when "00110110" =>                                  -- Reset Key Unlocked
                            io43_id212(5)   <=  '0';
                        -- SMART CODES  #055, #056
                        when "00110111" =>                                  -- Mapper Locked
                            io43_id212(6)   <=  '1';
                        when "00111000" =>                                  -- Mapper Unlocked
                            io43_id212(6)   <=  '0';
                        -- SMART CODES  #057, #058
                        when "00111001" =>                                  -- MegaSD Locked
                            io43_id212(7)   <=  '1';
                        when "00111010" =>                                  -- MegaSD Unlocked
                            io43_id212(7)   <=  '0';
                        -- SMART CODES  #059, #060
                        when "00111011" =>                                  -- Full Locked
                            io43_id212      <=  "11111111";
                        when "00111100" =>                                  -- Full Unlocked
                            io43_id212      <=  "00000000";
                        -- SMART CODES  #061, #062
                        when "00111101" =>                                  -- Pseudo Stereo Off (Default)
                            pseudoStereo    <=  '0';
                        when "00111110" =>                                  -- Pseudo Stereo On
                            pseudoStereo    <=  '1';
                        -- SMART CODES  #063, #064
                        when "00111111" =>                                  -- External Clock is CPU Clock (Default)
                            extclk3m        <=  '0';
                        when "01000000" =>                                  -- External Clock 3.58MHz (compliant mode like a real MSX2+)
                            extclk3m        <=  '1';
                            if( io42_id212(0) = '1' )then
                                io41_id008_n    <=  '0';
                                io42_id212(0)   <=  '0';
                            end if;
                        -- SMART CODE   #065
                        when "01000001" =>                                  -- Turbo Pana 5.37MHz (alternative mode)
                            io41_id008_n    <=  '0';
                            io42_id212(0)   <=  '0';
                        -- SMART CODES  #066, #067
                        when "01000010" =>                                  -- Right Inverse Audio Off (default)
                            right_inverse   <=  '0';
                        when "01000011" =>                                  -- Right Inverse Audio On
                            right_inverse   <=  '1';
                        -- SMART CODES  #068, #069, #070
                            when "01000100" =>                                  -- Internal Audio Preset #4 "Emphasis PSG Sound"
                                OpllVol         <=  "011";
                                SccVol          <=  "011";
                                PsgVol          <=  "101";
                                MstrVol         <=  "000";
                            when "01000101" =>                                  -- Internal Audio Preset #5 "Emphasis SCC-I Sound"
                                OpllVol         <=  "011";
                                SccVol          <=  "101";
                                PsgVol          <=  "011";
                                MstrVol         <=  "000";
                            when "01000110" =>                                  -- Internal Audio Preset #6 "Emphasis OPLL Sound"
                                OpllVol         <=  "101";
                                SccVol          <=  "011";
                                PsgVol          <=  "011";
                                MstrVol         <=  "000";
                            -- SMART CODES  #071, #072, #073, #074, #075, #076, #077, #078, #079
                            when "01000111" =>                                  -- Vertical Offset 16 (useful for Ark-A-Noah)
                                OFFSET_Y := "0010000";
                            when "01001000" =>                                  -- Vertical Offset 17
                                OFFSET_Y := "0010001";
                            when "01001001" =>                                  -- Vertical Offset 18
                                OFFSET_Y := "0010010";
                            when "01001010" =>                                  -- Vertical Offset 19 (default)
                                OFFSET_Y := "0010011";
                            when "01001011" =>                                  -- Vertical Offset 20
                                OFFSET_Y := "0010100";
                            when "01001100" =>                                  -- Vertical Offset 21
                                OFFSET_Y := "0010101";
                            when "01001101" =>                                  -- Vertical Offset 22
                                OFFSET_Y := "0010110";
                            when "01001110" =>                                  -- Vertical Offset 23
                                OFFSET_Y := "0010111";
                            when "01001111" =>                                  -- Vertical Offset 24 (useful for Space Manbow)
                                OFFSET_Y := "0011000";
                            -- SMART CODES  #080, #..., #126                    -- Free Group
                            -- SMART CODE   #127
                            when "01111111" =>                                  -- Pixel Ratio 1:1 for LED Display
                                RatioMode       <=  RatioMode - 1;
                        -- SMART CODE   #128
                        when "10000000" =>                                  -- Null Command (useful for programming)
                            null;
                            -- SMART CODES   #129, #130
                            when "10000001" =>                                  -- Legacy Output is assigned to VGA
                                legacy_sel <=  '0';
                            when "10000010" =>                                  -- Legacy Output is assigned to VGA+ (default)
                                legacy_sel <=  '1';
                            -- SMART CODES   #131, #132, #133, #134
                            -- SMART CODES  #135, #..., #175                    -- Free Group
                        -- SMART CODES  #176, #177, #178, #179, #180, #181, #182, #183
                        when "10110000" =>                                  -- Master Volume 0 (mute)
                            MstrVol         <=  "111";
                        when "10110001" =>                                  -- Master Volume 1 (min)
                            MstrVol         <=  "110";
                        when "10110010" =>                                  -- Master Volume 2
                            MstrVol         <=  "101";
                        when "10110011" =>                                  -- Master Volume 3
                            MstrVol         <=  "100";
                        when "10110100" =>                                  -- Master Volume 4 (middle)
                            MstrVol         <=  "011";
                        when "10110101" =>                                  -- Master Volume 5
                            MstrVol         <=  "010";
                        when "10110110" =>                                  -- Master Volume 6
                            MstrVol         <=  "001";
                        when "10110111" =>                                  -- Master Volume 7 (max)
                            MstrVol         <=  "000";
                        -- SMART CODES  #194, #185, #186, #187, #188, #189, #190, #191
                        when "10111000" =>                                  -- PSG Volume 0 (mute)
                            PsgVol          <=  "000";
                        when "10111001" =>                                  -- PSG Volume 1 (min)
                            PsgVol          <=  "001";
                        when "10111010" =>                                  -- PSG Volume 2
                            PsgVol          <=  "010";
                        when "10111011" =>                                  -- PSG Volume 3
                            PsgVol          <=  "011";
                        when "10111100" =>                                  -- PSG Volume 4 (middle)
                            PsgVol          <=  "100";
                        when "10111101" =>                                  -- PSG Volume 5
                            PsgVol          <=  "101";
                        when "10111110" =>                                  -- PSG Volume 6
                            PsgVol          <=  "110";
                        when "10111111" =>                                  -- PSG Volume 7 (max)
                            PsgVol          <=  "111";
                        -- SMART CODES  #192, #193, #194, #195, #196, #197, #198, #199
                        when "11000000" =>                                  -- SCC-I Volume 0 (mute)
                            SccVol          <=  "000";
                        when "11000001" =>                                  -- SCC-I Volume 1 (min)
                            SccVol          <=  "001";
                        when "11000010" =>                                  -- SCC-I Volume 2
                            SccVol          <=  "010";
                        when "11000011" =>                                  -- SCC-I Volume 3
                            SccVol          <=  "011";
                        when "11000100" =>                                  -- SCC-I Volume 4 (middle)
                            SccVol          <=  "100";
                        when "11000101" =>                                  -- SCC-I Volume 5
                            SccVol          <=  "101";
                        when "11000110" =>                                  -- SCC-I Volume 6
                            SccVol          <=  "110";
                        when "11000111" =>                                  -- SCC-I Volume 7 (max)
                            SccVol          <=  "111";
                        -- SMART CODES  #200, #201, #202, #203, #204, #205, #206, #207
                        when "11001000" =>                                  -- OPLL Volume 0 (mute)
                            OpllVol         <=  "000";
                        when "11001001" =>                                  -- OPLL Volume 1 (min)
                            OpllVol         <=  "001";
                        when "11001010" =>                                  -- OPLL Volume 2
                            OpllVol         <=  "010";
                        when "11001011" =>                                  -- OPLL Volume 3
                            OpllVol         <=  "011";
                        when "11001100" =>                                  -- OPLL Volume 4 (middle)
                            OpllVol         <=  "100";
                        when "11001101" =>                                  -- OPLL Volume 5
                            OpllVol         <=  "101";
                        when "11001110" =>                                  -- OPLL Volume 6
                            OpllVol         <=  "110";
                        when "11001111" =>                                  -- OPLL Volume 7 (max)
                            OpllVol         <=  "111";
                        -- SMART CODES  #208, #209, #210
                        when "11010000" =>                                  -- Force 60Hz           A:\>SETSMART -D0
                            ntsc_pal_type   <=  '0';
                            forced_v_mode   <=  '0';
                        when "11010001" =>                                  -- NTSC/PAL Auto    is bound by Control Register 9 (default)
                            ntsc_pal_type   <=  '1';
                        when "11010010" =>                                  -- Force 50Hz           A:\>SETSMART -D2
                            ntsc_pal_type   <=  '0';
                            forced_v_mode   <=  '1';
                        -- SMART CODE   #211
                        when "11010011" =>                                  -- Keyboard Layout Restore
                            swioKmap        <=  DefKmap;
                        -- SMART CODE   #212
                        when "11010100" =>
                            null;                                           -- Null Command
                        -- SMART CODES  #213
                        when "11010101" =>                                  -- Turbo Restore
                            io42_id212(0)   <=  ff_dip_req(0);
                            ff_dip_ack(0)   <=  ff_dip_req(0);
                            CustomSpeed     <=  "0010";
                            tMegaSD         <=  '1';
                            tPanaRedir      <=  '0';
                            io41_id008_n    <=  '1';
                            Red_sta         <=  not io41_id008_n;
                            extclk3m        <=  '0';
                            -- SMART CODES   #214, #215
                            when "11010110" =>                                  -- Centering YJK Modes/R25 Mask Off (default)
                                centerYJK_R25_n <=  '1';
                            when "11010111" =>                                  -- Centering YJK Modes/R25 Mask On
                                centerYJK_R25_n <=  '0';
                            -- SMART CODES  #216, #..., #248                    -- Free Group
                            -- SMART CODE   #249
                            when "11111001" =>                                  -- Slot0 Primary Mode (warm reset is required) (internal OPLL disabled)
                            Slot0_req       <=  '0';
                            -- SMART CODE   #250
                        when "11111010" =>                                  -- MSX logo will be On after a Warm Reset
                            WarmMSXlogo     <=  not portF4_mode;
                        -- SMART CODES  #251, #252, #253, #254
                        when "11111011" =>                                  -- Cold Reset (Volume will be reset)
                            swioRESET_n     <=  '0';
                        when "11111100" =>                                  -- Mapper 2048 kB   + Warm Reset (Volume will not reset)
                            Mapper_req      <=  '0';
                            warmRESET       <=  '1';
                            swioRESET_n     <=  '0';
                        when "11111101" =>                                  -- Warm Reset (Volume will not reset)
                            warmRESET       <=  '1';
                            swioRESET_n     <=  '0';
                        when "11111110" =>                                  -- Mapper 4096 kB   + Warm Reset (Volume will not reset)
                            Mapper_req      <=  '1';
                            warmRESET       <=  '1';
                            swioRESET_n     <=  '0';
                        -- SMART CODE   #255
                        when "11111111" =>                                  -- System Restore
                            RatioMode       <=  "000";
                            OFFSET_Y        :=  "0010011";
                            io42_id212(5 downto 0)  <=  ff_dip_req(5 downto 0);
                            ff_dip_ack(5 downto 0)  <=  ff_dip_req(5 downto 0);
                            io43_id212      <=  "00000000";
                            io44_id212      <=  "00000000";
                            OpllVol         <=  "111";
                            SccVol          <=  "111";
                            PsgVol          <=  "111";
                            MstrVol         <=  "000";
                            CustomSpeed     <=  "0010";
                            tMegaSD         <=  '1';
                            tPanaRedir      <=  '0';
                            VdpSpeedMode    <=  '0';
                            Mapper_req      <=  ff_dip_req(6);
                            MegaSD_req      <=  ff_dip_req(7);
                            io41_id008_n    <=  '1';
                            swioKmap        <=  DefKmap;
                            swioCmt         <=  '0';
                            LightsMode      <=  '0';
                            Red_sta         <=  not io41_id008_n;
                            Blink_ena       <=  '1';
                            pseudoStereo    <=  '0';
                            extclk3m        <=  '0';
                            ntsc_pal_type   <=  '1';
                            forced_v_mode   <=  '0';
                            right_inverse   <=  '0';
                            centerYJK_R25_n <=  '1';
                            legacy_sel      <=  '1';
                            Slot0_req       <=  '1';
                        -- NULL CODES
                        when others     =>
                            io41_id212_n    <=  "11111111";                 -- Not found
                    end case;
                end if;
                -- in assignment: 'Port $42 ID212 [Virtual DIP-SW]' (read/write_n, always unlocked)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0010")  and (io40_n = "00101011") )then
                    io41_id008_n                <=  '1';                    -- Custom Turbo have priority over 5.37MHz
                    io42_id212(5 downto 0)      <=  not dbo(5 downto 0);    -- BIT[0-5]
                    Mapper_req                  <=  not dbo(6);             -- BIT[6]
                    MegaSD_req                  <=  not dbo(7);             -- BIT[7]
                end if;
                -- in assignment: 'Port $43 ID212 [Lock Mask]' (read/write_n)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0011")  and (io40_n = "00101011") )then
                    io43_id212          <=  not dbo;
                end if;
                -- in assignment: 'Port $44 ID212 [Green Leds Mask]' (read/write_n)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0100")  and (io40_n = "00101011") )then
                    io44_id212          <=  not dbo;
                end if;
                -- in assignment: 'Port $45 ID212 [Master/PSG Volume]' (read/write_n)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0101")  and (io40_n = "00101011") )then
                    PsgVol              <=  not dbo(2 downto 0);
                    MstrVol             <=  dbo(6 downto 4);
                end if;
                -- in assignment: 'Port $46 ID212 [SCC-I/OPLL Volume]' (read/write_n)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "0110")  and (io40_n = "00101011") )then
                    OpllVol             <=  not dbo(2 downto 0);
                    SccVol              <=  not dbo(6 downto 4);
                end if;
                -- in assignment: 'Port $4D ID212 [VRAM Slot IDs]' (read/write_n)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "1101")  and (io40_n = "00101011") )then
                    vram_slot_ids       <=  not dbo;
                end if;
                -- in assignment: 'Port $4E ID212 [JIS2 enabler] [Reserved to IPL-ROM]' (write_n only)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "1110")  and (io40_n = "00101011") and ff_ldbios_n = '0' )then
                    JIS2_ena            <=  not dbo(7);                     -- BIT[7]
                end if;
                -- in assignment: 'Port $4F ID212 [Port F4 mode] [Reserved to IPL-ROM]' (write_n only)
                if( req = '1' and wrt = '1' and (adr(3 downto 0) = "1111")  and (io40_n = "00101011") and ff_ldbios_n = '0' )then
                    portF4_mode         <=  not dbo(7);                     -- BIT[7]
                    WarmMSXlogo         <=  not dbo(7);                     -- MSX logo will be Off after a Warm Reset
                end if;
            end if;
			 end if;
        end if;
    end process;

    -- detection of main ack signal
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            swio_ack    <= '0';
        elsif( clk21m'event and clk21m = '1') then
			   if(warmRESET /= '1' )then
               swio_ack    <= req;                                             -- Protected during Warm Reset
				end if;
        end if;
    end process;

end RTL;
