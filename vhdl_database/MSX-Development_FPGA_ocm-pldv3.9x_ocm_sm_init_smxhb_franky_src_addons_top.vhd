--
-- top.vhd
-- SM-X (regular) / SM-X Mini TOP by Victor Trucco - Modified by KdL
-- SMX-HB w/ Franky - Modified by Ducasp
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity top is
    port(
        -- Clocks
        clock_50_i          : in    std_logic;

        -- Buttons
        btn_n_i             : in    std_logic_vector(  2 downto 1 );
        dip_i               : in    std_logic_vector( 12 downto 1 );

        -- SDRAM (H57V256)
        sdram_ad_o          : out   std_logic_vector( 12 downto 0 );
        sdram_da_io         : inout std_logic_vector( 15 downto 0 );

        sdram_ba_o          : out   std_logic_vector(  1 downto 0 );
        sdram_dqm_o         : out   std_logic_vector(  1 downto 0 );

        sdram_ras_o         : out   std_logic;
        sdram_cas_o         : out   std_logic;
        sdram_cke_o         : out   std_logic;
        sdram_clk_o         : out   std_logic;
        sdram_cs_o          : out   std_logic;
        sdram_we_o          : out   std_logic;

        -- PS/2
        ps2_clk_io          : inout std_logic := 'Z';
        ps2_data_io         : inout std_logic := 'Z';
        ps2_mouse_clk_io    : inout std_logic := 'Z';
        ps2_mouse_data_io   : inout std_logic := 'Z';

        -- SD Card
        sd_cs_n_o           : inout std_logic := '1';
        sd_sclk_o           : out   std_logic := '0';
        sd_mosi_o           : out   std_logic := '0';
        sd_miso_i           : inout std_logic;
        sd_sw_i             : in    std_logic;

        -- Joystick A (D-SUB at left)
        joy1_up_io          : inout std_logic;
        joy1_down_io        : inout std_logic;
        joy1_left_io        : inout std_logic;
        joy1_right_io       : inout std_logic;
        joy1_p6_io          : inout std_logic;
        joy1_p7_io          : inout std_logic;
        joy1_p8_io          : inout std_logic;

        -- Joystick B (D-SUB at right)
        joy2_up_io          : inout std_logic;
        joy2_down_io        : inout std_logic;
        joy2_left_io        : inout std_logic;
        joy2_right_io       : inout std_logic;
        joy2_p6_io          : inout std_logic;
        joy2_p7_io          : inout std_logic;
        joy2_p8_io          : inout std_logic;

        -- Audio
        dac_l_o             : out   std_logic := 'Z';
        dac_r_o             : out   std_logic := 'Z';
        ear_i               : in    std_logic;
        mic_o               : out   std_logic := '0';

        -- VGA
        vga_r_o             : out   std_logic_vector(  4 downto 0 ) := (others => '0');
        vga_g_o             : out   std_logic_vector(  4 downto 0 ) := (others => '0');
        vga_b_o             : out   std_logic_vector(  4 downto 0 ) := (others => '0');
        vga_hsync_n_o       : out   std_logic := '1';
        vga_vsync_n_o       : out   std_logic := '1';

        -- External Slots
        slot_A_o            : inout std_logic_vector( 15 downto 0 ) := (others => 'Z');
        slot_D_io           : inout std_logic_vector(  7 downto 0 ) := (others => 'Z');
        slot_CS1_o          : inout std_logic := 'Z';
        slot_CS2_o          : inout std_logic := 'Z';
        slot_CS12_o         : inout std_logic := 'Z';
        slot_CLOCK_o        : inout std_logic := 'Z';
        slot_M1_o           : inout std_logic := 'Z';
        slot_MERQ_o         : inout std_logic := 'Z';
        slot_IOREQ_o        : inout std_logic := 'Z';
        slot_RD_o           : inout std_logic := 'Z';
        slot_WR_o           : inout std_logic := 'Z';
        slot_RESET_io       : inout std_logic := 'Z';
        slot_SLOT1_o        : inout std_logic := 'Z';
        slot_SLOT2_o        : inout std_logic := 'Z';
        slot_SLOT3_o        : inout std_logic := 'Z';
        slot_BUSDIR_i       : inout std_logic := 'Z';
        slot_RFSH_i         : inout std_logic := 'Z';
        slot_INT_i          : inout std_logic := 'Z';
        slot_WAIT_i         : inout std_logic := 'Z';

        slot_DATA_OE_o      : out   std_logic := 'Z';
        slot_DATA_DIR_o     : out   std_logic := 'Z';

        -- ESP
        esp_rx_o            : out   std_logic := 'Z';
        esp_tx_i            : in    std_logic := 'Z';

        -- LED
        led_o               : out   std_logic := '0';
        caps_led_o          : out   std_logic := '0';

        -- Model
        is_expert_n         : in    std_logic
    );
end entity;

architecture Behavior of top is

    component scandoublersmx
        generic (
        OUT_COLOR_DEPTH:integer := 5;
        HSCNT_WIDTH  : integer := 12;
        HCNT_WIDTH   : integer := 9;
        COLOR_DEPTH  : integer := 6
        );
        port (
        clk_sys     : in std_logic;
        bypass      : in std_logic;

        ce_divider  : in std_logic_vector(2 downto 0);
        pixel_ena   : out std_logic;

        scanlines   : in std_logic_vector(1 downto 0);

        hb_in       : in std_logic;
        vb_in       : in std_logic;
        hs_in       : in std_logic;
        vs_in       : in std_logic;
        r_in        : in std_logic_vector(COLOR_DEPTH-1 downto 0);
        g_in        : in std_logic_vector(COLOR_DEPTH-1 downto 0);
        b_in        : in std_logic_vector(COLOR_DEPTH-1 downto 0);

        hb_out      : out std_logic;
        vb_out      : out std_logic;
        hs_out      : out std_logic;
        vs_out      : out std_logic;
        r_out       : out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
        g_out       : out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
        b_out       : out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0)
        );
    end component scandoublersmx;

    -- clocks
    signal clk_sdram        : std_logic;
    signal clk21m           : std_logic;
    signal clk_sms          : std_logic;

    -- Franky signals
    signal sms_active       : std_logic;
    signal ce_vdp           : std_logic;
    signal ce_pix           : std_logic;
    signal ce_sp            : std_logic;
    signal color            : std_logic_vector( 11 downto 0 );
    signal sms_x            : std_logic_vector( 8 downto 0 );
    signal sms_y            : std_logic_vector( 8 downto 0 );
    signal sms_mask_column  : std_logic;
    signal sms_smode_M1     : std_logic;
    signal sms_smode_M3     : std_logic;
    signal SMS_VGA_R        : std_logic_vector(  4 downto 0 ) := (others => '0');
    signal SMS_VGA_B        : std_logic_vector(  4 downto 0 ) := (others => '0');
    signal SMS_VGA_G        : std_logic_vector(  4 downto 0 ) := (others => '0');
    signal SMS_VGA_HS       : std_logic := '1';
    signal SMS_VGA_VS       : std_logic := '1';
    signal SMS_VGA_HBlank   : std_logic := '1';
    signal SMS_VGA_VBlank   : std_logic := '1';
    signal sms_HBlank       : std_logic;
    signal sms_VBlank       : std_logic;
    signal sms_HSync        : std_logic;
    signal sms_VSync        : std_logic;
    signal sms_CSync        : std_logic;

    -- reset signal
    signal btn_rst_s        : std_logic;                                            -- Hotbit Case Reset Button
    signal reset_s          : std_logic;                                            -- global reset
    signal power_on_reset_s : std_logic := '0';

    -- DIPs
    signal dip_s            : std_logic_vector(  7 downto 0 ) := "00100001";        -- caution! inverted bits (0 = enabled)

    -- VGA
    signal vga_r_s          : std_logic_vector(  5 downto 0 ) := (others => '0');
    signal vga_g_s          : std_logic_vector(  5 downto 0 ) := (others => '0');
    signal vga_b_s          : std_logic_vector(  5 downto 0 ) := (others => '0');
    signal vga_hsync_n_s    : std_logic := '1';
    signal vga_vsync_n_s    : std_logic := '1';
    signal blank_s          : std_logic;

    -- slot
    signal cpu_ioreq_s      : std_logic;
    signal cpu_mreq_s       : std_logic;
    signal cpu_rd_s         : std_logic;
    signal slot_SLOT1_s     : std_logic;
    signal slot_SLOT2_s     : std_logic;
    signal BusDir_s         : std_logic;
    signal clk_cpu_s        : std_logic;

    -- vga scanlines
    signal vga_status       : std_logic;
    signal vga_scanlines    : std_logic_vector(  1 downto 0 ) := "00";
    signal btn_scan_s       : std_logic := '1';
    signal odd_line_s       : std_logic := '0';
    signal vga_r_out_s      : std_logic_vector(  4 downto 0 );
    signal vga_g_out_s      : std_logic_vector(  4 downto 0 );
    signal vga_b_out_s      : std_logic_vector(  4 downto 0 );
    signal vga_r_out_s_21   : std_logic_vector(  4 downto 0 );
    signal vga_g_out_s_21   : std_logic_vector(  4 downto 0 );
    signal vga_b_out_s_21   : std_logic_vector(  4 downto 0 );

    -- Joysticks
    signal joy1_s           : std_logic_vector(  5 downto 0 );
    signal joy2_s           : std_logic_vector(  5 downto 0 );

    -- Debounced Joysticks
    signal joy1_d_s         : std_logic_vector(  5 downto 0 );
    signal joy2_d_s         : std_logic_vector(  5 downto 0 );

    -- misc
    signal blink_s          : std_logic;

    begin

    ocm: work.emsx_top
    generic map
    (
        use_8gb_sdram_g         => true,
        use_wifi_g              => true,
        use_midi_g              => false,
        use_dualpsg_g           => false,
        use_opl3_g              => false,
        use_franky_vdp_g        => true,
        use_franky_psg_g        => true
    )
    port map(
        -- Clock, Reset ports
        pClk21m                 => clock_50_i,
        pExtClk                 => '0',
        reset                   => reset_s,
        power_on_reset          => power_on_reset_s,

        -- SDRAM ports
        pMemClk                 => clk_sdram,                   -- SDRAM Clock
        pMemCke                 => sdram_cke_o,                 -- SDRAM Clock enable
        pMemCs_n                => sdram_cs_o,                  -- SDRAM Chip select
        pMemRas_n               => sdram_ras_o,                 -- SDRAM Row/RAS
        pMemCas_n               => sdram_cas_o,                 -- SDRAM /CAS
        pMemWe_n                => sdram_we_o,                  -- SDRAM /WE
        pMemUdq                 => sdram_dqm_o(1),              -- SDRAM UDQM
        pMemLdq                 => sdram_dqm_o(0),              -- SDRAM LDQM
        pMemBa1                 => sdram_ba_o(1),               -- SDRAM Bank select address 1
        pMemBa0                 => sdram_ba_o(0),               -- SDRAM Bank select address 0
        pMemAdr                 => sdram_ad_o,                  -- SDRAM Address
        pMemDat                 => sdram_da_io,                 -- SDRAM Data

        -- PS/2 keyboard ports
        pPs2Clk                 => ps2_clk_io,
        pPs2Dat                 => ps2_data_io,

        -- Joystick ports (Port_A, Port_B)
        pJoyA_in                => joy1_s,
        pJoyA_out(1)            => joy1_p7_io,
        pJoyA_out(0)            => joy1_p6_io,

        pJoyB_in                => joy2_s,
        pJoyB_out               => open,

        pStrA                   => joy1_p8_io,
        pStrB                   => joy2_p8_io,

        -- SD/MMC slot ports
        pSd_Ck                  => sd_sclk_o,                   -- pin 5 Clock
        pSd_Cm                  => sd_mosi_o,                   -- pin 2 Datain
        pSd_Dt(3)               => sd_cs_n_o,                   -- pin 1 CS
        pSd_Dt(2)               => open,
        pSd_Dt(1)               => open,
        pSd_Dt(0)               => sd_miso_i,                   -- pin 7 Dataout

        -- DIP switch, Lamp ports
        pDip                    => dip_i(8 downto 1),
        pLed(0)                 => blink_s,

        -- Video, Audio ports
        pDac_VR                 => vga_r_s,
        pDac_VG                 => vga_g_s,
        pDac_VB                 => vga_b_s,

        pDac_SL(5)              => dac_l_o,                     -- the left output may cause slight video interference
        pDac_SR(5)              => dac_r_o,

        pVideoHS_n              => vga_hsync_n_s,
        pVideoVS_n              => vga_vsync_n_s,

        -- MSX cartridge slot ports
        pCpuClk                 => clk_cpu_s,
        pSltRst_n               => btn_rst_s,

        pSltAdr                 => slot_A_o,
        pSltDat                 => slot_D_io,

        pSltMerq_n              => cpu_mreq_s,
        pSltIorq_n              => cpu_ioreq_s,
        pSltRd_n                => cpu_rd_s,
        pSltWr_n                => slot_WR_o,

        pSltRfsh_n              => slot_RFSH_i,
        pSltWait_n              => slot_WAIT_i,
        pSltInt_n               => slot_INT_i,
        pSltM1_n                => slot_M1_o,

        pSltBdir_n              => slot_BUSDIR_i,               -- not used
        pSltSltsl_n             => slot_SLOT1_s,
        pSltSlts2_n             => slot_SLOT2_s,
        pSltCs1_n               => slot_CS1_o,
        pSltCs2_n               => slot_CS2_o,
        pSltCs12_n              => slot_CS12_o,
        BusDir_o                => BusDir_s,

        -- Franky VDP
        clkSYSSMS               => clk_sms,
        clkSMSVDP               => ce_vdp,
        clkPIXSMS               => ce_pix,
        clkSMSSP                => ce_sp,
        colorSMSVDP             => color,
        sms_mask_column         => sms_mask_column,
        sms_x                   => sms_x,
        sms_y                   => sms_y,
        sms_smode_M1            => sms_smode_M1,
        sms_smode_M3            => sms_smode_M3,
        sms_video_active        => sms_active,

        -- SM-X, Multicore 2 and SX-2 ports
        clk21m_out              => clk21m,
        esp_rx_o                => esp_rx_o,
        esp_tx_i                => esp_tx_i,
        blank_o                 => blank_s,
        ear_i                   => ear_i,
        mic_o                   => mic_o,
        vga_status              => vga_status,
        vga_scanlines           => vga_scanlines,
        btn_scan                => btn_scan_s,
        caps_led_o              => caps_led_o,
        DisBiDir                => dip_i(9),
        model_expert_n          => is_expert_n,
        EnAltMap                => dip_i(9)
    );

    slot_CLOCK_o    <= clk_cpu_s;

    slot_IOREQ_o    <= cpu_ioreq_s;
    slot_MERQ_o     <= cpu_mreq_s;
    slot_RD_o       <= cpu_rd_s;
    slot_SLOT1_o    <= slot_SLOT1_s;
    slot_SLOT2_o    <= slot_SLOT2_s;
    slot_SLOT3_o    <= slot_SLOT1_s;

    -- RESET to the SLOT pins
    slot_RESET_io   <= (not reset_s) and power_on_reset_s;

    -- 74LVC4245 : slot_DATA_OE_o must be
    -- '0' to share the internal data bus with external slots
    -- '1' to use only the internal data bus
    slot_DATA_OE_o  <= '0' when( slot_SLOT1_s = '0' )else
                       '0' when( slot_SLOT2_s = '0' )else
                       '0' when( cpu_ioreq_s = '0' and BusDir_s = '0' )else
                       '1';

    slot_DATA_DIR_o <= not cpu_rd_s;                            -- port A=SLOT, B=FPGA     DIR(1)=A to B

    sdram_clk_o     <= clk_sdram;

    joy1_s          <= joy1_d_s;

    joy2_s          <= joy2_d_s;

    -- VIDEO
    vga_r_o         <= vga_r_out_s_21 when ( sms_active = '0' ) else SMS_VGA_R;
    vga_g_o         <= vga_g_out_s_21 when ( sms_active = '0' ) else SMS_VGA_G;
    vga_b_o         <= vga_b_out_s_21 when ( sms_active = '0' ) else SMS_VGA_B;
    -- HSYNC get OCM output always if not SMS (that will be VGA Sync or CSYNC or Nothing depending on DIP setting)
    -- if SMS will get SMS double scan if vga_status otherwise get SMS CSYNC
    vga_hsync_n_o   <= vga_hsync_n_s  when ( sms_active = '0' ) else
                       SMS_VGA_HS when ( vga_status = '1' ) else
                       sms_CSync;
    -- VSYNC get OCM output always if not SMS (will be VGA Sync or Audio depending on DIP setting)
    -- if SMS and Double Scan will get SMS_VGA Vsync
    vga_vsync_n_o   <= vga_vsync_n_s  when ( sms_active = '0' or vga_status = '0' ) else SMS_VGA_VS;

    -- Franky
    video1 : work.video
    port map(
        clk         => clk_sms,
        ce_pix      => ce_pix,
        pal         => '0',
        gg          => '0',
        border      => '1',
        mask_column => sms_mask_column,
        x           => sms_x,
        y           => sms_y,
        smode_M1    => sms_smode_M1,
        smode_M3    => sms_smode_M3,
        HSync       => sms_HSync,
        VSync       => sms_VSync,
        HBlank      => sms_HBlank,
        VBlank      => sms_VBlank
    );

    sms_CSync <= not ( (not sms_HSync) xor (not sms_VSync) );

    vga_video_sms : scandoublersmx
    generic map
    (
        HCNT_WIDTH              => 10,
        COLOR_DEPTH             => 4
    )
    port map(
        clk_sys                => clk_sms,
        bypass                 => not vga_status,
        ce_divider             => "010",
        scanlines              => vga_scanlines,
        hs_in                  => not sms_HSync,
        vs_in                  => not sms_VSync,
        hb_in                  => sms_HBlank,
        vb_in                  => sms_VBlank,
        r_in                   => color( 3 downto 0 ),
        g_in                   => color( 7 downto 4 ),
        b_in                   => color(11 downto 8 ),
        hb_out                 => SMS_VGA_HBlank,
        vb_out                 => SMS_VGA_VBlank,
        hs_out                 => SMS_VGA_HS,
        vs_out                 => SMS_VGA_VS,
        r_out                  => SMS_VGA_R,
        g_out                  => SMS_VGA_G,
        b_out                  => SMS_VGA_B
    );

    process ( clk_sms )
        variable clkd : std_logic_vector( 4 downto 0 ) := "11111";
    begin
        if falling_edge( clk_sms ) then
            ce_sp <= clkd(0);--div2 used for extra sprites
            ce_vdp <= '0';--div5
            ce_pix <= '0';--div10
            clkd := clkd + 1;

            if (clkd = "11101") then    -- 29
                clkd := "11111";
                ce_vdp <= '1';
                ce_pix <= '1';
            elsif (clkd = "11000") then -- 24
                ce_vdp <= '1';
            elsif (clkd = "10011") then -- 19
                ce_vdp <= '1';
                ce_pix <= '1';
            elsif (clkd = "01110") then -- 14
                ce_vdp <= '1';
            elsif (clkd = "01001") then -- 9
                ce_vdp <= '1';
                ce_pix <= '1';
            elsif (clkd = "00100") then -- 4
                ce_vdp <= '1';
            end if;
        end if;
    end process;

    -- LED assignment
    led_o       <= not blink_s;

    ---------------------------------
    -- Hotbit Case Reset
    ---------------------------------

    btnrst: entity work.debounce
    generic map (
        counter_size_g  => 16
    )
    port map (
        clk_i               => clk21m,
        button_i            => btn_n_i(1),
        result_o            => btn_rst_s
    );

    ---------------------------------
    -- scanlines
    ---------------------------------

    btnscl: entity work.debounce
    generic map(
        counter_size_g  => 16
    )
    port map(
        clk_i           => clk21m,
        button_i        => btn_n_i(2),
        result_o        => btn_scan_s
    );

    process( clk21m )
        variable r_v_21 : unsigned(  4 downto 0 );
        variable g_v_21 : unsigned(  4 downto 0 );
        variable b_v_21 : unsigned(  4 downto 0 );
    begin
        if rising_edge( clk21m )then
            -- 100%
            vga_r_out_s_21 <= vga_r_s(  5 downto 1 );
            vga_g_out_s_21 <= vga_g_s(  5 downto 1 );
            vga_b_out_s_21 <= vga_b_s(  5 downto 1 );

            if odd_line_s = '0' and vga_status = '1' then

                if vga_scanlines = "11" then
                    -- 75%
                    vga_r_out_s_21 <=  "00" & vga_r_s(  5 downto 3 );
                    vga_g_out_s_21 <=  "00" & vga_g_s(  5 downto 3 );
                    vga_b_out_s_21 <=  "00" & vga_b_s(  5 downto 3 );

                elsif vga_scanlines = "10" then
                    -- 50%
                    vga_r_out_s_21 <=  '0' & vga_r_s(  5 downto 2 );
                    vga_g_out_s_21 <=  '0' & vga_g_s(  5 downto 2 );
                    vga_b_out_s_21 <=  '0' & vga_b_s(  5 downto 2 );

                elsif vga_scanlines = "01" then
                    -- 25%
                    r_v_21 := unsigned('0' & vga_r_s(  5 downto 2 )) + unsigned("00" & vga_r_s(  5 downto 3 ));
                    g_v_21 := unsigned('0' & vga_g_s(  5 downto 2 )) + unsigned("00" & vga_g_s(  5 downto 3 ));
                    b_v_21 := unsigned('0' & vga_b_s(  5 downto 2 )) + unsigned("00" & vga_b_s(  5 downto 3 ));

                    vga_r_out_s_21 <= std_logic_vector(r_v_21);
                    vga_g_out_s_21 <= std_logic_vector(g_v_21);
                    vga_b_out_s_21 <= std_logic_vector(b_v_21);

                end if;
            end if;
        end if;
    end process;

    process( vga_hsync_n_s, vga_vsync_n_s )
    begin
        if vga_vsync_n_s = '0' then
            odd_line_s <= '0';
        elsif rising_edge( vga_hsync_n_s ) then
            odd_line_s <= not odd_line_s;
        end if;
    end process;

    debounce_joy1 : entity work.debounce_joy
    port map(
            clk_i       => clk_cpu_s,
            joy_i       => joy1_p7_io & joy1_p6_io & joy1_right_io & joy1_left_io & joy1_down_io & joy1_up_io,
            joy_o       => joy1_d_s
    );

    debounce_joy2 : entity work.debounce_joy
    port map(
            clk_i       => clk_cpu_s,
            joy_i       => joy2_p7_io & joy2_p6_io & joy2_right_io & joy2_left_io & joy2_down_io & joy2_up_io,
            joy_o       => joy2_d_s
    );

end architecture;
