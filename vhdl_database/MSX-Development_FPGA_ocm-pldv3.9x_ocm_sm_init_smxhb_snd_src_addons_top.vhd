--
-- top.vhd
-- SM-X (regular) / SM-X Mini TOP by Victor Trucco - Modified by KdL
-- SMX-HB w/ Franky Sound - Modified by Ducasp
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

    component ps2mouse
    port(
        clk                 : in    std_logic;                          -- bus clock
        reset               : in    std_logic;                          -- reset

        ps2mdat             : inout std_logic;                          -- mouse PS/2 data
        ps2mclk             : inout std_logic;                          -- mouse PS/2 clk

        zcount              : out   std_logic_vector(  7 downto 0 );    -- mouse Z counter
        ycount              : out   std_logic_vector(  7 downto 0 );    -- mouse Y counter
        xcount              : out   std_logic_vector(  7 downto 0 );    -- mouse X counter
        mleft               : out   std_logic;                          -- left mouse button output
        mthird              : out   std_logic;                          -- third (middle) mouse button output
        mright              : out   std_logic;                          -- right mouse button output
        mouse_data_out      : out   std_logic                           -- mouse has data to present
    );
    end component;

    -- clocks
    signal clk_sdram        : std_logic;
    signal clk21m           : std_logic;

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

    -- MIDI
    signal midi_o_s         : std_logic := 'Z';
    signal midi_active_s    : std_logic := 'Z';
    signal joy2_up_s        : std_logic := 'Z';

    -- vga scanlines
    signal vga_status       : std_logic;
    signal vga_scanlines    : std_logic_vector(  1 downto 0 ) := "00";
    signal btn_scan_s       : std_logic := '1';
    signal odd_line_s       : std_logic := '0';
    signal vga_r_out_s      : std_logic_vector(  4 downto 0 );
    signal vga_g_out_s      : std_logic_vector(  4 downto 0 );
    signal vga_b_out_s      : std_logic_vector(  4 downto 0 );

    -- mouse
    signal clock_div_q      : unsigned(  5 downto 0 ) := (others => '0');
    signal mouse_x_s        : std_logic_vector(  7 downto 0 );
    signal mouse_y_s        : std_logic_vector(  7 downto 0 );
    signal mouse_bts_s      : std_logic_vector(  2 downto 0 );
    signal mouse_wheel_s    : std_logic_vector(  7 downto 0 );
    signal mouse_dat_s      : std_logic_vector(  3 downto 0 );
    signal strA_s           : std_logic;
    signal joymouse_s       : std_logic_vector(  5 downto 0 );
    signal mouse_data_out   : std_logic;
    signal mouse_idle       : std_logic := '1';
    signal mouse_present    : std_logic := '0';
    signal joya_en          : std_logic := '1';
    signal mouse_present_old: std_logic := '0';
    signal clock_div_5      : std_logic := '0';
    signal mouse_state      : std_logic_vector(  1 downto 0 ) := (others =>'0');
    signal mouse_x_latch    : std_logic_vector(  7 downto 0 ) := (others =>'0');
    signal mouse_y_latch    : std_logic_vector(  7 downto 0 ) := (others =>'0');
    signal mouse_timeout    : std_logic_vector( 17 downto 0 ) := (others =>'0');
    signal mouse_data_old   : std_logic := '0';
    signal mouse_stra_old   : std_logic := '0';

    signal oldstrA_s        : std_logic;
    signal oldjoy1_p6_io    : std_logic;
    signal oldmousedata     : std_logic := '0';

    -- Joysticks
    signal joy1_s           : std_logic_vector(  5 downto 0 );
    signal joy2_s           : std_logic_vector(  5 downto 0 );

    -- Debounced Joysticks
    signal joy1_d_s         : std_logic_vector(  5 downto 0 );
    signal joy2_d_s         : std_logic_vector(  5 downto 0 );

    -- misc
    signal blink_s          : std_logic;
    signal joy_deb          : std_logic;

    begin

    ocm: work.emsx_top
    generic map
    (
        use_8gb_sdram_g         => true,
        use_wifi_g              => true,
        use_midi_g              => true,
        use_dualpsg_g           => true,
        use_opl3_g              => false,
        use_franky_vdp_g        => false,
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
        pJoyA_in                => joymouse_s,
        pJoyA_out(1)            => joy1_p7_io,
        pJoyA_out(0)            => joy1_p6_io,

        pJoyB_in                => joy2_s,
        pJoyB_out               => open,

        pStrA                   => strA_s,                      -- joy1_p8_io,
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

        -- Reserved ports
        pSltClk                 => '0',
        pIopRsv14               => '0',
        pIopRsv15               => '0',
        pIopRsv16               => '0',
        pIopRsv17               => '0',
        pIopRsv18               => '0',
        pIopRsv19               => '0',
        pIopRsv20               => '0',
        pIopRsv21               => '0',

        -- SM-X, Multicore 2 and SX-2 ports
        clk21m_out              => clk21m,
        esp_rx_o                => esp_rx_o,
        esp_tx_i                => esp_tx_i,
        blank_o                 => blank_s,
        ear_i                   => ear_i,
        mic_o                   => mic_o,
        midi_o                  => midi_o_s,
        midi_active_o           => midi_active_s,
        vga_status              => vga_status,
        vga_scanlines           => vga_scanlines,
        btn_scan                => btn_scan_s,
        caps_led_o              => caps_led_o,
        joy_deb                 => joy_deb,
        DisBiDir                => dip_i(9),
        model_expert_n          => is_expert_n,
        EnAltMap                => dip_i(9)
    );

    slot_CLOCK_o    <= clk_cpu_s;

    joy1_p8_io      <= strA_s;

    joy2_up_s       <= joy2_up_io;
    joy2_up_io      <= midi_o_s when( midi_active_s = '1' )else
                       'Z';

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

    joy1_s          <= joy1_d_s; -- when( joy_deb = '1' )else
                       --( joy1_p7_io & joy1_p6_io & joy1_right_io & joy1_left_io & joy1_down_io & joy1_up_io );

    joy2_s          <= joy2_d_s; -- when( joy_deb = '1' )else
                       --( joy2_p7_io & joy2_p6_io & joy2_right_io & joy2_left_io & joy2_down_io & joy2_up_io );

    vga_r_o         <= vga_r_out_s;
    vga_g_o         <= vga_g_out_s;
    vga_b_o         <= vga_b_out_s;
    vga_hsync_n_o   <= vga_hsync_n_s;
    vga_vsync_n_o   <= vga_vsync_n_s;

    -- LED assignment
    led_o       <= not blink_s;

    ---------------------------------
    -- mouse
    ---------------------------------

    process( clk21m )
        variable port_a_disc_time  : std_logic_vector( 20 downto 0 ) := "000000000000000000000";
    begin
        if rising_edge( clk21m )then
            clock_div_q <= clock_div_q + 1;
            if ( mouse_present_old /= mouse_present ) then
                port_a_disc_time := "011000011010100000000"; -- about 1s disconnected
                joya_en <= '0';
            end if;

            if ( clock_div_q(5) /= clock_div_5 ) then
                if ( port_a_disc_time /= 0 ) then
                    port_a_disc_time := port_a_disc_time - 1;
                else
                    joya_en <= '1';
                end if;
            end if;

            mouse_present_old   <= mouse_present;
            clock_div_5         <= clock_div_q(5);
        end if;
    end process;

    mousectrl: ps2mouse
    port map(
        clk             => clock_div_q(5),                      -- need a slower clock to avoid loosing data
        reset           => reset_s,                             -- reset

        ps2mdat         => ps2_mouse_data_io,                   -- mouse PS/2 data
        ps2mclk         => ps2_mouse_clk_io,                    -- mouse PS/2 clk

        xcount          => mouse_x_s,                           -- mouse X counter
        ycount          => mouse_y_s,                           -- mouse Y counter
        zcount          => mouse_wheel_s,                       -- mouse Z counter
        mleft           => mouse_bts_s(0),                      -- left mouse button output
        mright          => mouse_bts_s(1),                      -- right mouse button output
        mthird          => mouse_bts_s(2),                      -- third(middle) mouse button output
        mouse_data_out  => mouse_data_out                       -- mouse has data top present
    );

    joymouse_s  <= mouse_bts_s(  1 downto 0 ) & mouse_dat_s                                                 when( mouse_present = '1' and joya_en = '1' )else
                   joy1_s                                                                                   when( joya_en = '1' )else
                   "111111";

    process( clk21m, reset_s )
    begin
        if ( reset_s = '1' )then
            mouse_state <= "00";
            mouse_present <= '0';
            mouse_timeout <= "001100001101010000";
            mouse_dat_s <= "0000";
        elsif rising_edge( clk21m )then
            mouse_data_old <= mouse_data_out;
            mouse_stra_old <= strA_s;

            if ( mouse_data_out = '1' )then
                mouse_present <= '1';
            elsif ( joy1_p7_io = '0' or joy1_p6_io = '0' )then
                mouse_present <= '0';
            end if;

            if ( mouse_data_old = '0' and mouse_data_out = '1' )then
                mouse_x_latch <= mouse_x_s;
                mouse_y_latch <= mouse_y_s;
            end if;

            if ( mouse_present = '1' ) then
                if ( mouse_timeout /= "000000000000000000" )then
                    if ( mouse_timeout = "000000000000000001") then mouse_state <= "00"; end if;
                    mouse_timeout <= mouse_timeout - 1;
                end if;

                if ( mouse_stra_old /= strA_s ) then
                    mouse_timeout <= "001100001101010000";
                    mouse_state <= mouse_state + 1;

                    case mouse_state is
                        when "00" =>
                            mouse_dat_s <= mouse_x_latch(  7 downto 4 );
                        when "01" =>
                            mouse_dat_s <= mouse_x_latch(  3 downto 0 );
                        when "10" =>
                            mouse_dat_s <= mouse_y_latch(  7 downto 4 );
                        when "11" =>
                            mouse_dat_s <= mouse_y_latch(  3 downto 0 );
                            mouse_x_latch <= "00000000";
                            mouse_y_latch <= "00000000";
                    end case;
                end if;
            end if;

        end if;

    end process;

    ---------------------------------
    -- paddle emulation over mouse
    -- disabled for frankysnd build
    -- won't fit it and second psg
    -- frankysnd build is about more
    -- sound chips, so, sorry paddle
    ---------------------------------

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
        variable r_v : unsigned(  4 downto 0 );
        variable g_v : unsigned(  4 downto 0 );
        variable b_v : unsigned(  4 downto 0 );
    begin
        if rising_edge( clk21m )then
            -- 100%
            vga_r_out_s <= vga_r_s(  5 downto 1 );
            vga_g_out_s <= vga_g_s(  5 downto 1 );
            vga_b_out_s <= vga_b_s(  5 downto 1 );

            if odd_line_s = '0' and vga_status = '1' then

                if vga_scanlines = "11" then
                    -- 75%
                    vga_r_out_s <=  "00" & vga_r_s(  5 downto 3 );
                    vga_g_out_s <=  "00" & vga_g_s(  5 downto 3 );
                    vga_b_out_s <=  "00" & vga_b_s(  5 downto 3 );

                elsif vga_scanlines = "10" then
                    -- 50%
                    vga_r_out_s <=  '0' & vga_r_s(  5 downto 2 );
                    vga_g_out_s <=  '0' & vga_g_s(  5 downto 2 );
                    vga_b_out_s <=  '0' & vga_b_s(  5 downto 2 );

                elsif vga_scanlines = "01" then
                    -- 25%
                    r_v := unsigned('0' & vga_r_s(  5 downto 2 )) + unsigned("00" & vga_r_s(  5 downto 3 ));
                    g_v := unsigned('0' & vga_g_s(  5 downto 2 )) + unsigned("00" & vga_g_s(  5 downto 3 ));
                    b_v := unsigned('0' & vga_b_s(  5 downto 2 )) + unsigned("00" & vga_b_s(  5 downto 3 ));

                    vga_r_out_s <= std_logic_vector(r_v);
                    vga_g_out_s <= std_logic_vector(g_v);
                    vga_b_out_s <= std_logic_vector(b_v);

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
