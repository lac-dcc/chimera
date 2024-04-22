-----------------------------------------------------------------------
--
-- Copyright 2012 ShareBrained Technology, Inc.
--
-- This file is part of robotron-fpga.
--
-- robotron-fpga is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- robotron-fpga is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- You should have received a copy of the GNU General
-- Public License along with robotron-fpga. If not, see
-- <http://www.gnu.org/licenses/>.
--
-- Jan 2020:
-- Converted from bidirectional data buses to separated buses for SOC usage
-- Changed to orignal 15kHz display timing
-- Replaced PIAs from System09 (the original didn't work in Joust)
-- Added blitter SC2 selection (for Splat)
-----------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

--library unisim;
--    use unisim.vcomponents.all;

entity robotron_cpu is
    port(
        clock            : in    std_logic;
        blitter_sc2      : in    std_logic;
        sinistar         : in    std_logic;
        speedball        : in    std_logic;
        pause            : in    std_logic;
        -- MC6809 signals
        A                : in    std_logic_vector(15 downto 0);
        Dout             : in    std_logic_vector(7 downto 0);
        Din              : out   std_logic_vector(7 downto 0);
        RESET_N          : out   std_logic;
        NMI_N            : out   std_logic;
        FIRQ_N           : out   std_logic;
        IRQ_N            : out   std_logic;
        LIC              : in    std_logic;
        AVMA             : in    std_logic;
        R_W_N            : in    std_logic;
        TSC              : out   std_logic;
        HALT_N           : out   std_logic;
        BA               : in    std_logic;
        BS               : in    std_logic;
        BUSY             : in    std_logic;
        E                : out   std_logic;
        Q                : out   std_logic;

        -- USB
        --EppAstb          : in    std_logic;
        --EppDstb          : in    std_logic;
        --UsbFlag          : in    std_logic;
        --EppWait          : in    std_logic;
        --EppDB            : in    std_logic_vector(7 downto 0);
        --UsbClk           : in    std_logic;
        --UsbOE            : in    std_logic;
        --UsbWR            : in    std_logic;
        --UsbPktEnd        : in    std_logic;
        --UsbDir           : in    std_logic;
        --UsbMode          : in    std_logic;
        --UsbAdr           : in    std_logic_vector(1 downto 0);

        -- Cellular RAM / StrataFlash
        MemOE            : out   std_logic;
        MemWR            : out   std_logic;

        RamAdv           : out   std_logic;
        RamCS            : out   std_logic;
        RamClk           : out   std_logic;
        RamCRE           : out   std_logic;
        RamLB            : out   std_logic;
        RamUB            : out   std_logic;
        RamWait          : in    std_logic;

        FlashRp          : out   std_logic;
        FlashCS          : out   std_logic;
        FlashStSts       : in    std_logic;

        MemAdr           : out   std_logic_vector(23 downto 1);
        MemDin           : out   std_logic_vector(15 downto 0);
        MemDout          : in    std_logic_vector(15 downto 0);

        -- 7-segment display
        SEG              : out   std_logic_vector(6 downto 0);
        DP               : out   std_logic;
        AN               : out   std_logic_vector(3 downto 0);

        -- LEDs
        LED              : out   std_logic_vector(7 downto 0);

        -- Switches
        SW               : in    std_logic_vector(7 downto 0);

        -- Buttons
        BTN              : in    std_logic_vector(3 downto 0);

        -- VGA connector
        vgaRed           : out   std_logic_vector(2 downto 0);
        vgaGreen         : out   std_logic_vector(2 downto 0);
        vgaBlue          : out   std_logic_vector(1 downto 0);
        Hsync            : out   std_logic;
        Vsync            : out   std_logic;

        -- PS/2 connector
        --PS2C             : in    std_logic;
        --PS2D             : in    std_logic;

        -- 12-pin connectors
        JA               : in    std_logic_vector(7 downto 0);
        JB               : in    std_logic_vector(7 downto 0);
        SIN_FIRE         : in    std_logic;
        SIN_BOMB         : in    std_logic;
        -- Analog Input
        AN0              : in    std_logic_vector(7 downto 0);
        AN1              : in    std_logic_vector(7 downto 0);
        AN2              : in    std_logic_vector(7 downto 0);
        AN3              : in    std_logic_vector(7 downto 0);
        -- To sound board
        HAND             : in    std_logic := '1';
        PB               : out   std_logic_vector(5 downto 0)
    );
end robotron_cpu;

architecture Behavioral of robotron_cpu is

    signal reset_request            : std_logic;
    signal reset_counter            : unsigned(7 downto 0);
    signal reset                    : std_logic;

    signal clock_12_phase           : unsigned(11 downto 0) := (0 => '1', others => '0');
    
    signal clock_q_set              : boolean;
    signal clock_q_clear            : boolean;
    signal clock_q                  : std_logic := '0';
    
    signal clock_e_set              : boolean;
    signal clock_e_clear            : boolean;
    signal clock_e                  : std_logic := '0';
    
    -------------------------------------------------------------------
    
    signal video_count              : unsigned(14 downto 0) := (others => '0');
    signal video_count_next         : unsigned(14 downto 0);
    signal video_address_or_mask    : unsigned(13 downto 0);
    signal video_address            : unsigned(13 downto 0) := (others => '0');
    
    signal count_240                : std_logic;
    signal irq_4ms                  : std_logic;
    
    signal horizontal_sync          : std_logic;
    signal vertical_sync            : std_logic;
    
    signal video_hblank             : boolean := true;
    signal video_vblank             : boolean := true;
    
    -------------------------------------------------------------------
    
    signal led_bcd_in               : std_logic_vector(15 downto 0);
    signal led_bcd_in_digit         : std_logic_vector(3 downto 0);
    
    signal led_counter              : unsigned(15 downto 0) := (others => '0');
    signal led_digit_index          : unsigned(1 downto 0);
    
    signal led_segment              : std_logic_vector(6 downto 0);
    signal led_dp                   : std_logic;
    signal led_anode                : std_logic_vector(3 downto 0);

    -------------------------------------------------------------------

    signal address                  : std_logic_vector(15 downto 0);
    
    signal write                    : boolean;
    signal read                     : boolean;
    
    -------------------------------------------------------------------

    signal mpu_address              : std_logic_vector(15 downto 0);
    signal mpu_data_in              : std_logic_vector(7 downto 0);
    signal mpu_data_out             : std_logic_vector(7 downto 0);
    
    signal mpu_bus_status           : std_logic;
    signal mpu_bus_available        : std_logic;
    
    signal mpu_read                 : boolean;
    signal mpu_write                : boolean;
    
    signal mpu_reset                : std_logic := '1';
    signal mpu_halt                 : std_logic := '0';
    signal mpu_halted               : boolean := false;
    signal mpu_irq                  : std_logic := '0';
    signal mpu_firq                 : std_logic := '0';
    signal mpu_nmi                  : std_logic := '0';

    -------------------------------------------------------------------

    signal memory_address           : std_logic_vector(15 downto 0);
    signal memory_data_in           : std_logic_vector(7 downto 0);
    signal memory_data_out          : std_logic_vector(7 downto 0);
    
    signal memory_output_enable     : boolean := false;
    signal memory_write             : boolean := false;
    signal flash_enable             : boolean := false;
    
    signal ram_enable               : boolean := false;
    signal ram_lower_enable         : boolean := false;
    signal ram_upper_enable         : boolean := false;
    
    -------------------------------------------------------------------
    
    signal e_rom                    : std_logic := '0';
    signal screen_control           : std_logic := '0';
    
    signal rom_access               : boolean;
    signal ram_access               : boolean;
    signal hiram_access             : boolean; -- Sinistar hiram
    signal color_table_access       : boolean;
    signal widget_pia_access        : boolean;
    signal extra_pia_access         : boolean;
    signal rom_pia_access           : boolean;
    signal blt_register_access      : boolean;
    signal video_counter_access     : boolean;
    signal watchdog_access          : boolean;
    signal control_access           : boolean;
    signal cmos_access              : boolean;
    signal trkball_access           : boolean;

    signal video_counter_value      : std_logic_vector(7 downto 0);
    
    -------------------------------------------------------------------
    
    signal SLAM                 : std_logic := '1';
    signal R_COIN               : std_logic := '1';
    signal C_COIN               : std_logic := '1';
    signal L_COIN               : std_logic := '1';
    signal H_S_RESET            : std_logic := '1';
    signal ADVANCE              : std_logic := '1';
    signal AUTO_UP              : std_logic := '0';
    
    signal rom_pia_cs           : std_logic := '0';
    signal rom_pia_write        : std_logic := '0';
    signal rom_pia_data_in      : std_logic_vector(7 downto 0);
    signal rom_pia_data_out     : std_logic_vector(7 downto 0);
    signal rom_pia_ca2_out      : std_logic;
    signal rom_pia_ca2_dir      : std_logic;
    signal rom_pia_irq_a        : std_logic;
    signal rom_pia_pa_in        : std_logic_vector(7 downto 0);
    signal rom_pia_pa_out       : std_logic_vector(7 downto 0);
    signal rom_pia_pa_dir       : std_logic_vector(7 downto 0);

    signal rom_pia_cb2_out      : std_logic;
    signal rom_pia_cb2_dir      : std_logic;
    signal rom_pia_irq_b        : std_logic;
    signal rom_pia_pb_in        : std_logic_vector(7 downto 0);
    signal rom_pia_pb_out       : std_logic_vector(7 downto 0);
    signal rom_pia_pb_dir       : std_logic_vector(7 downto 0);
    
    signal rom_led_digit        : std_logic_vector(3 downto 0);
    
    -------------------------------------------------------------------

    signal MOVE_UP_1            : std_logic := '1';
    signal MOVE_DOWN_1          : std_logic := '1';
    signal MOVE_LEFT_1          : std_logic := '1';
    signal MOVE_RIGHT_1         : std_logic := '1';
    signal PLAYER_1_START       : std_logic := '1';
    signal PLAYER_2_START       : std_logic := '1';
    signal FIRE_UP_1            : std_logic := '1';
    signal FIRE_DOWN_1          : std_logic := '1';
    signal FIRE_RIGHT_1         : std_logic := '1';
    signal FIRE_LEFT_1          : std_logic := '1';
    signal MOVE_UP_2            : std_logic := '1';
    signal MOVE_DOWN_2          : std_logic := '1';
    signal MOVE_LEFT_2          : std_logic := '1';
    signal MOVE_RIGHT_2         : std_logic := '1';
    signal FIRE_RIGHT_2         : std_logic := '1';
    signal FIRE_UP_2            : std_logic := '1';
    signal FIRE_DOWN_2          : std_logic := '1';
    signal FIRE_LEFT_2          : std_logic := '1';
    
    signal board_interface_w1   : std_logic := '1';  -- Upright application: '1' = jumper present
    
    signal widget_pia_cs        : std_logic;
    signal widget_pia_write     : std_logic := '0';
    signal widget_pia_data_in   : std_logic_vector(7 downto 0);
    signal widget_pia_data_out  : std_logic_vector(7 downto 0);
    signal widget_pia_ca2_out   : std_logic;
    signal widget_pia_ca2_dir   : std_logic;
    signal widget_pia_irq_a     : std_logic;
    signal widget_pia_pa_in     : std_logic_vector(7 downto 0);
    signal widget_pia_pa_out    : std_logic_vector(7 downto 0);
    signal widget_pia_pa_dir    : std_logic_vector(7 downto 0);
    signal widget_pia_input_select  : std_logic;
    signal widget_pia_cb2_out   : std_logic;
    signal widget_pia_cb2_dir   : std_logic;
    signal widget_pia_irq_b     : std_logic;
    signal widget_pia_pb_in     : std_logic_vector(7 downto 0);
    signal widget_pia_pb_out    : std_logic_vector(7 downto 0);
    signal widget_pia_pb_dir    : std_logic_vector(7 downto 0);
    
    signal widget_ic3_a         : std_logic_vector(4 downto 1);
    signal widget_ic3_b         : std_logic_vector(4 downto 1);
    signal widget_ic3_y         : std_logic_vector(4 downto 1);

    signal widget_ic4_a         : std_logic_vector(4 downto 1);
    signal widget_ic4_b         : std_logic_vector(4 downto 1);
    signal widget_ic4_y         : std_logic_vector(4 downto 1);

    -------------------------------------------------------------------

    signal extra_pia_cs           : std_logic := '0';
    signal extra_pia_write        : std_logic := '0';
    signal extra_pia_data_in      : std_logic_vector(7 downto 0);
    signal extra_pia_data_out     : std_logic_vector(7 downto 0);
    signal extra_pia_ca2_out      : std_logic;
    signal extra_pia_ca2_dir      : std_logic;
    signal extra_pia_irq_a        : std_logic;
    signal extra_pia_pa_in        : std_logic_vector(7 downto 0);
    signal extra_pia_pa_out       : std_logic_vector(7 downto 0);
    signal extra_pia_pa_dir       : std_logic_vector(7 downto 0);

    signal extra_pia_cb2_out      : std_logic;
    signal extra_pia_cb2_dir      : std_logic;
    signal extra_pia_irq_b        : std_logic;
    signal extra_pia_pb_in        : std_logic_vector(7 downto 0);
    signal extra_pia_pb_out       : std_logic_vector(7 downto 0);
    signal extra_pia_pb_dir       : std_logic_vector(7 downto 0);
    
    -------------------------------------------------------------------

    signal blt_rs               : std_logic_vector(2 downto 0) := (others => '0');
    signal blt_reg_cs           : std_logic := '0';
    signal blt_reg_data_in      : std_logic_vector(7 downto 0) := (others => '0');
    
    signal blt_halt             : boolean := false;
    signal blt_halt_ack         : boolean := false;
    signal blt_read             : boolean := false;
    signal blt_write            : boolean := false;
    signal blt_blt_ack          : std_logic := '0';
    signal blt_address_out      : std_logic_vector(15 downto 0);
    signal blt_data_in          : std_logic_vector(7 downto 0);
    signal blt_data_out         : std_logic_vector(7 downto 0);
    signal blt_en_lower         : boolean := false;
    signal blt_en_upper         : boolean := false;
    signal blt_win_en           : std_logic := '0';

    -------------------------------------------------------------------

    function to_std_logic(L: boolean) return std_logic is
    begin
        if L then
            return '1';
        else
            return '0';
        end if;
    end function;
    
    subtype pixel_color_t is std_logic_vector(7 downto 0);
    type color_table_t is array(0 to 15) of pixel_color_t;
    signal color_table : color_table_t;
    
    signal pixel_nibbles : std_logic_vector(7 downto 0);
    signal pixel_byte_l : std_logic_vector(7 downto 0);
    signal pixel_byte_h : std_logic_vector(7 downto 0);
    
    -------------------------------------------------------------------

    signal decoder_4_in : std_logic_vector(8 downto 0);
    signal pseudo_address : std_logic_vector(15 downto 8);
    
    signal decoder_6_in : std_logic_vector(8 downto 0);
    signal video_prom_address : std_logic_vector(13 downto 6);
    
    -------------------------------------------------------------------
    
    signal debug_blt_source_address : std_logic_vector(15 downto 0) := (others => '0');
    signal debug_last_mpu_address   : std_logic_vector(15 downto 0) := (others => '0');
    
begin

    -- clock    0   1   2   3   4   5   6   7   8   9   10  11
    -- Q        0   0   0   1   1   1   1   1   1   0   0   0
    -- E        0   0   0   0   0   0   1   1   1   1   1   1
    -- Memory   0   0   1   1   2   2   3   3   4   4   5   5
        
    -- Micro 128Mb (8M x 16) CellularRAM MT45W8MW16BGX-701 WT (marking "PW503")
    -- MT: Micron Technology
    -- 45: PSRAM/CellularRAM memory
    -- W: 1.70-1.95V
    -- 8M: 8 Meg address space
    -- W: 1.7 - 3.6V
    -- 16: 16-bit bus
    -- B: asynchronous/page/burst read/write operation mode
    -- GX: 54-ball "green" VFBGA
    -- -70: 70ns access/cycle time
    -- 1: 104MHz frequency
    --  : standard standby power option
    -- WT: -30C to +85C operating temperature
    -------------------------------------------------------------------
    -- Asynchronous mode:
    --  tRC (read cycle): 70 ns
    --      from CE#/OE#/ADDRESS/LB#/UB# asserted to DATA valid and CE#/OE#/ADDRESS/LB#/UB# de-asserted.
    --  tWC (write cycle): 70 ns
    --      from CE#/ADDRESS/LB#/UB# asserted to DATA valid and CE#/WE#/LB#/UB# de-asserted.
    --  tCEM: 4 us maximum
    --      from WE# asserted to DATA valid and CE#/WE#/LB#/UB# de-asserted.
    
    -- Intel JS28F128J3D75
    -------------------------------------------------------------------
    -- Read:
    --      75 ns read/write cycle time
    --      75 ns address to output delay
    --      75 ns CE# to output delay
    
    reset_request <= BTN(0);
    
    mpu_reset <= reset;
    mpu_halt <= to_std_logic(blt_halt);
    mpu_irq <= rom_pia_irq_a or rom_pia_irq_b;
    mpu_firq <= '0';
    mpu_nmi <= '0';
    
    address <= blt_address_out when mpu_halted else
               mpu_address;
    write <= blt_write  when mpu_halted and (blt_win_en = '0' or blt_address_out<x"7400" or blt_address_out>=x"C000") else
             mpu_write;
    read <= blt_read when mpu_halted else
            mpu_read;
             
    rom_access <= (address <  X"9000" and read and e_rom = '1') or
                  (address >= X"D000" and read and sinistar='0') or
                  (address >= X"E000" and read and sinistar='1');
    ram_access <= (address <  X"9000" and write) or
                  (address <  X"9000" and read and e_rom = '0') or
                  (address >= X"9000" and address < X"C000") or
                  hiram_access;
    hiram_access <=
		(address >= X"D000" and address < X"E000") and sinistar='1';

    -- Color table: write: C000-C3FF
    color_table_access <= std_match(address, "110000----------");

    -- Widget PIA: read/write: C8X4 - C8X7
    widget_pia_access <= std_match(address, "11001000----01--");

    -- Speedball PIA: read/write: C8X8 - C8XB
    extra_pia_access <= std_match(address, "11001000----10--");

    -- ROM PIA: read/write: C8XC - C8XF
    rom_pia_access <= std_match(address, "11001000----11--");

    -- Control address: write: C9XX
    control_access <= std_match(address, "11001001--------");

    -- Special chips: read/write? CAXX
    blt_register_access <= std_match(address, "11001010--------");

    -- Video counter: read: CBXX (even addresses)
    video_counter_access <= std_match(address, "11001011-------0");

    -- Watchdog register: write: CBFE or CBFF
    watchdog_access <= std_match(address, "110010111111111-");

    -- CMOS "nonvolatile" RAM: read/write: CC00 - CFFF
    cmos_access <= std_match(address, "110011----------");

    -- Speedball Trackballs: read C800-C803
    trkball_access <= std_match(address, "11001000----00--");

    SLAM <= not SW(6);
    H_S_RESET <= not SW(2);
    ADVANCE <= not SW(1);
    AUTO_UP <= not SW(0);

    PLAYER_1_START <= not BTN(3);
    PLAYER_2_START <= not BTN(2);
    L_COIN <= not BTN(1);

    MOVE_UP_1 <= JA(0);
    MOVE_DOWN_1 <= JA(1);
    MOVE_LEFT_1 <= JA(2);
    MOVE_RIGHT_1 <= JA(3);
    FIRE_UP_1 <= JA(4);
    FIRE_DOWN_1 <= JA(5);
    FIRE_LEFT_1 <= JA(6);
    FIRE_RIGHT_1 <= JA(7);

    MOVE_UP_2 <= JB(0);
    MOVE_DOWN_2 <= JB(1);
    MOVE_LEFT_2 <= JB(2);
    MOVE_RIGHT_2 <= JB(3);
    FIRE_UP_2 <= JB(4);
    FIRE_DOWN_2 <= JB(5);
    FIRE_LEFT_2 <= JB(6);
    FIRE_RIGHT_2 <= JB(7);

    video_counter_value <= std_logic_vector(video_address(13 downto 8)) & "00";

    decoder_4_in <= screen_control & address(15 downto 8);
    decoder_6_in <= screen_control & std_logic_vector(video_address(13 downto 6));

    process(clock)
    begin
        if rising_edge(clock) then
            ram_enable <= false;
            ram_lower_enable <= false;
            ram_upper_enable <= false;

            flash_enable <= false;

            memory_output_enable <= false;
            memory_write <= false;
            memory_data_out <= (others => '0');

            blt_reg_cs <= '0';
            blt_blt_ack <= '0';

            rom_pia_cs <= '0';
            rom_pia_write <= '0';

            widget_pia_cs <= '0';
            widget_pia_write <= '0';
				
            extra_pia_cs <= '0';
            extra_pia_write <= '0';				

            if clock_12_phase( 0) = '1' then
                memory_address <= "00" & video_prom_address &
                                  std_logic_vector(video_address(5 downto 0));
            end if;

            if clock_12_phase( 4) = '1' then
                memory_address <= "01" & video_prom_address &
                                  std_logic_vector(video_address(5 downto 0));
            end if;

            if clock_12_phase( 8) = '1' then
                memory_address <= "10" & video_prom_address &
                                   std_logic_vector(video_address(5 downto 0));
            end if;

            if clock_12_phase(5) = '1' then
                if std_match(video_address(5 downto 0), "11-1--") then
                    video_hblank <= true;
                elsif std_match(video_address(5 downto 0), "0---1-") then
                    video_hblank <= false;
                end if;
                if std_match(video_address(13 downto 6), "11111---") then
                    video_vblank <= true;
                elsif std_match(video_address(13 downto 6), "00000000") then
                    video_vblank <= false;
                end if;

            end if;

            if clock_12_phase( 0) = '1' or
               clock_12_phase( 4) = '1' or
               clock_12_phase( 8) = '1' then
                memory_output_enable <= true;
                ram_enable <= true;
                ram_lower_enable <= true;
                ram_upper_enable <= true;

                if video_hblank or video_vblank then
                    vgaRed <= (others => '0');
                    vgaGreen <= (others => '0');
                    vgaBlue <= (others => '0');
                else
                    vgaRed <= pixel_byte_h(2 downto 0);
                    vgaGreen <= pixel_byte_h(5 downto 3);
                    vgaBlue <= pixel_byte_h(7 downto 6);
                end if;
            end if;

            if clock_12_phase( 1) = '1' or
               clock_12_phase( 5) = '1' or
               clock_12_phase( 9) = '1' then
                pixel_nibbles <= memory_data_in;
            end if;
            if clock_12_phase( 2) = '1' or
               clock_12_phase( 6) = '1' or
               clock_12_phase(10) = '1' then

                pixel_byte_l <= color_table(to_integer(unsigned(pixel_nibbles(3 downto 0))));
                pixel_byte_h <= color_table(to_integer(unsigned(pixel_nibbles(7 downto 4))));

                if video_hblank or video_vblank then
                    vgaRed <= (others => '0');
                    vgaGreen <= (others => '0');
                    vgaBlue <= (others => '0');
                else
                    vgaRed <= pixel_byte_l(2 downto 0);
                    vgaGreen <= pixel_byte_l(5 downto 3);
                    vgaBlue <= pixel_byte_l(7 downto 6);
                end if;
            end if;

            -- BLT-only cycles
            -- NOTE: the next cycle must be a read if coming from RAM, since the
            -- RAM WE# needs to deassert for a time in order for another write to
            -- take place.
            if clock_12_phase(11) = '1' or clock_12_phase(1) = '1' then
                if mpu_halted then
                    if ram_access and not hiram_access then
                        if pseudo_address(15 downto 14) = "11" then
                            memory_address <= address;
                        else
                            memory_address <= pseudo_address(15 downto 14) &
                                              address(7 downto 0) &
                                              pseudo_address(13 downto 8);
                        end if;
                    else
                        memory_address <= address;
                    end if;

                    if ram_access and write then
                        memory_data_out <= blt_data_out;
                        memory_write <= true;
                    else
                        memory_output_enable <= true;
                    end if;

                    if ram_access then
                        ram_enable <= true;
                        ram_lower_enable <= blt_en_lower;
                        ram_upper_enable <= blt_en_upper;
                    end if;

                    if rom_access then
                        flash_enable <= true;
                    end if;

                    blt_blt_ack <= '1';
                end if;
            end if;

            -- MPU-only cycle
            -- NOTE: the next cycle must be a read if coming from RAM, since the
            -- RAM WE# needs to deassert for a time in order for another write to
            -- take place.
            if clock_12_phase(7) = '1' then
                if not mpu_halted then
                    if ram_access and not hiram_access then
                        if pseudo_address(15 downto 14) = "11" then
                            memory_address <= address;
                        else
                            memory_address <= pseudo_address(15 downto 14) &
                                              address(7 downto 0) &
                                              pseudo_address(13 downto 8);
                        end if;
                    else
                        memory_address <= address;
                    end if;

                    if (ram_access or cmos_access or color_table_access) and write then
                        memory_data_out <= mpu_data_in;
                        memory_write <= true;
                    else
                        memory_output_enable <= true;
                    end if;

                    if ram_access or cmos_access or color_table_access then
                        ram_enable <= true;
                        ram_lower_enable <= true;
                        ram_upper_enable <= true;
                    end if;

                    if rom_access then
                        flash_enable <= true;
                    end if;

                    if blt_register_access and write then
                        blt_rs <= address(2 downto 0);
                        blt_reg_cs <= '1';
                        blt_reg_data_in <= mpu_data_in;

                        -- NOTE: To display BLT source address:
                        if address(2 downto 0) = "010" then
                            debug_blt_source_address(15 downto 8) <= mpu_data_in;
                        end if;

                        if address(2 downto 0) = "011" then
                            debug_blt_source_address(7 downto 0) <= mpu_data_in;
                        end if;
                    end if;

                    if rom_pia_access then
                        rom_pia_data_in <= mpu_data_in;
                        rom_pia_write <= to_std_logic(write);
                        rom_pia_cs <= '1';
                    end if;

                    if widget_pia_access then
                        widget_pia_data_in <= mpu_data_in;
                        widget_pia_write <= to_std_logic(write);
                        widget_pia_cs <= '1';
                    end if;
						  
                    if speedball = '1' then
                      if extra_pia_access then
                        extra_pia_data_in <= mpu_data_in;
                        extra_pia_write <= to_std_logic(write);
                        extra_pia_cs <= '1';
                      end if;
                    end if;

                    if control_access and write then
                        blt_win_en     <= mpu_data_in(2) and sinistar;
                        screen_control <= mpu_data_in(1);
                        e_rom <= mpu_data_in(0);
                    end if;

                    if color_table_access and write then
                        color_table(to_integer(unsigned(address(3 downto 0)))) <= mpu_data_in;
                    end if;
                end if;
            end if;
            
            if clock_12_phase(8) = '1' then
                if not mpu_halted then
                    if read then
                        if ram_access or rom_access or cmos_access then
                            mpu_data_out <= memory_data_in;
                        end if;
                    
                        if widget_pia_access then
                            mpu_data_out <= widget_pia_data_out;
                        end if;

                        if speedball = '1' then
                            if extra_pia_access then
                                mpu_data_out <= extra_pia_data_out;
                            end if;

                            if trkball_access then
                                case address(1 downto 0) is
                                    when "00" => mpu_data_out <= AN0;
                                    when "01" => mpu_data_out <= AN1;
                                    when "10" => mpu_data_out <= AN2;
                                    when "11" => mpu_data_out <= AN3;
                                    when others => null;
                                end case;
                            end if;

                        end if;
                        if rom_pia_access then
                            mpu_data_out <= rom_pia_data_out;
                        end if;
                    
                        if video_counter_access then
                            mpu_data_out <= video_counter_value;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    LED <= mpu_irq &
           mpu_halt &
           to_std_logic(mpu_halted) &
           to_std_logic(ram_access) &
           to_std_logic(rom_access) &
           to_std_logic(rom_pia_access) &
           to_std_logic(widget_pia_access) &
--			  to_std_logic(extra_pia_access) &
           to_std_logic(blt_register_access);

    led_bcd_in <= debug_blt_source_address;

    -------------------------------------------------------------------

    horizontal_decoder: entity work.decoder_4
        port map(
            clk  => not clock,
            addr => decoder_4_in,
            data => pseudo_address
        );

    -------------------------------------------------------------------

    vertical_decoder: entity work.decoder_6
        port map(
            clk  => not clock,
            addr => decoder_6_in,
            data => video_prom_address
        );

    -------------------------------------------------------------------

    blt_halt_ack <= mpu_halted;
    blt_data_in <= memory_data_in;

    blt: entity work.sc1
        port map(
            clk => clock,
            sc2 => blitter_sc2,
            E_en => to_std_logic(clock_e_clear),

            reg_cs => blt_reg_cs,
            reg_data_in => blt_reg_data_in,
            rs => blt_rs,

            halt => blt_halt,
            halt_ack => blt_halt_ack,

            blt_ack => blt_blt_ack,
            blt_address_out => blt_address_out,

            blt_rd => blt_read,
            blt_wr => blt_write,

            blt_data_in => blt_data_in,
            blt_data_out => blt_data_out,

            en_upper => blt_en_upper,
            en_lower => blt_en_lower
        );

    -------------------------------------------------------------------
--IN2
    rom_pia_pa_in <= not HAND &
                     not SLAM &
                     not C_COIN &
                     not L_COIN &
                     not H_S_RESET &
                     not R_COIN &
                     not ADVANCE &
                     not AUTO_UP;
    PB(5 downto 0) <= rom_pia_pb_out(5 downto 0);

    rom_led_digit(0) <= rom_pia_pb_out(6);
    rom_led_digit(1) <= rom_pia_pb_out(7);
    rom_led_digit(2) <= rom_pia_cb2_out;
    rom_led_digit(3) <= rom_pia_ca2_out;
    rom_pia_pb_in <= (others => '1');

    rom_pia: entity work.pia6821
        port map(
            rst => reset,
            clk => clock,
        
            addr => address(1 downto 0),
            cs => rom_pia_cs,
            rw => not rom_pia_write,

            data_in => mpu_data_in,
            data_out => rom_pia_data_out,

            ca1 => count_240,
            ca2_i => '1',
            ca2_o => rom_pia_ca2_out,
            ca2_oe => rom_pia_ca2_dir,
            irqa => rom_pia_irq_a,
            pa_i => rom_pia_pa_in,
            pa_o => rom_pia_pa_out,
            pa_oe => rom_pia_pa_dir,

            cb1 => irq_4ms,
            cb2_i => '1',
            cb2_o => rom_pia_cb2_out,
            cb2_oe => rom_pia_cb2_dir,
            irqb => rom_pia_irq_b,
            pb_i => rom_pia_pb_in,
            pb_o => rom_pia_pb_out,
            pb_oe => rom_pia_pb_dir
        );
    -------------------------------------------------------------------

    widget_pia_input_select <= widget_pia_cb2_out;

    widget_ic3_a <= not (MOVE_RIGHT_2 & MOVE_LEFT_2 & MOVE_DOWN_2 & MOVE_UP_2);
    widget_ic3_b <= not (MOVE_RIGHT_1 & MOVE_LEFT_1 & MOVE_DOWN_1 & MOVE_UP_1);
    
    widget_ic3_y <= widget_ic3_b when widget_pia_input_select = '1' else widget_ic3_a;
    
    widget_ic4_a <= not (FIRE_RIGHT_2 & FIRE_LEFT_2 & FIRE_DOWN_2 & FIRE_UP_2);
    widget_ic4_b <= not (FIRE_RIGHT_1 & FIRE_LEFT_1 & FIRE_DOWN_1 & FIRE_UP_1);

    widget_ic4_y <= widget_ic4_b when widget_pia_input_select = '1' else widget_ic4_a;

    widget_pia_pa_in <= widget_ic4_y(4) &--fire right
                        widget_ic4_y(3) &--fire left
                        widget_ic4_y(2) &--fire down
                        widget_ic4_y(1) &--fire up
                        widget_ic3_y(4) &--right
                        widget_ic3_y(3) &--left
                        widget_ic3_y(2) &--down
                        widget_ic3_y(1) when sinistar = '1' else --up
                        "00000000" when speedball = '1' else
                        widget_ic4_y(2) &--fire down
                        widget_ic4_y(1) &--fire up
                        not PLAYER_2_START &
                        not PLAYER_1_START &
                        widget_ic3_y(4) &--right
                        widget_ic3_y(3) &--left
                        widget_ic3_y(2) &--down
                        widget_ic3_y(1); --up 

    widget_pia_pb_in <= not board_interface_w1 &
                        "0" &
                        not PLAYER_2_START &
                        not PLAYER_1_START &
                        "00" &
                        not SIN_BOMB &
                        not SIN_FIRE when sinistar = '1' else
                        "00000000" when speedball = '1' else
                        not board_interface_w1 &
                        "00000" &
                        widget_ic4_y(4) &
                        widget_ic4_y(3);

    widget_pia: work.pia6821
        port map(
		    rst => reset,
            clk => clock,
        
            addr => address(1 downto 0),
            cs => widget_pia_cs,
            rw => not widget_pia_write,
			
            data_in => mpu_data_in,
            data_out => widget_pia_data_out,
        
            ca1 => '0',
            ca2_i => '0',
            ca2_o => widget_pia_ca2_out,
            ca2_oe => widget_pia_ca2_dir,
            irqa => widget_pia_irq_a,
            pa_i => widget_pia_pa_in,
            pa_o => widget_pia_pa_out,
            pa_oe => widget_pia_pa_dir,
        
            cb1 => '0',
            cb2_i => '1',
            cb2_o => widget_pia_cb2_out,
            cb2_oe => widget_pia_cb2_dir,
            irqb => widget_pia_irq_b,
            pb_i => widget_pia_pb_in,
            pb_o => widget_pia_pb_out,
            pb_oe => widget_pia_pb_dir
        );

    -------------------------------------------------------------------

    extra_pia_pa_in <= 	'0' & --unknown
                        FIRE_UP_2 &
                        '0' & --unknown
                        FIRE_UP_1 &
                        MOVE_DOWN_2 &
                        MOVE_UP_2 &
                        MOVE_DOWN_1 &
                        MOVE_UP_1;

    extra_pia_pb_in <=  not PLAYER_2_START &
                        not PLAYER_1_START &
                        "00" &
                        MOVE_RIGHT_2 & 
                        MOVE_LEFT_2 &
                        MOVE_RIGHT_1 &
                        MOVE_LEFT_1;	 

    extra_pia: work.pia6821
        port map(
		    rst => reset,
            clk => clock,        
            addr => address(1 downto 0),
            cs => extra_pia_cs,
            rw => not extra_pia_write,
			
            data_in => mpu_data_in,
            data_out => extra_pia_data_out,
        
            ca1 => '0',
            ca2_i => '0',
            ca2_o => extra_pia_ca2_out,
            ca2_oe => extra_pia_ca2_dir,
            irqa => extra_pia_irq_a,
            pa_i => extra_pia_pa_in,
            pa_o => extra_pia_pa_out,
            pa_oe => extra_pia_pa_dir,
        
            cb1 => '0',
            cb2_i => '1',
            cb2_o => extra_pia_cb2_out,
            cb2_oe => extra_pia_cb2_dir,
            irqb => extra_pia_irq_b,
            pb_i => extra_pia_pb_in,
            pb_o => extra_pia_pb_out,
            pb_oe => extra_pia_pb_dir
        );

    -------------------------------------------------------------------	 

    E <= clock_e;
    Q <= clock_q;

    Din <= mpu_data_out;

    TSC <= '0';

    process(clock, clock_q_set)
    begin
        if rising_edge(clock) and clock_q_set then
            -- RESET, HALT, interrupts are captured by microprocessor
            -- on Q falling edge. Present once per processor clock,
            -- on Q rising edge -- just because.
            RESET_N <= not mpu_reset;
            HALT_N <= not (mpu_halt or pause);
            IRQ_N <= not mpu_irq;
            FIRQ_N <= not mpu_firq;
            NMI_N <= not mpu_nmi;
        end if;
    end process;
--
    process(clock, clock_q_set)
    begin
        if rising_edge(clock) and clock_q_set then
            mpu_address <= A;
            mpu_bus_status <= BS;
            mpu_bus_available <= BA;
            mpu_halted <= BS = '1' and BA = '1';
            mpu_write <= R_W_N = '0' and BA = '0';
            mpu_read <= R_W_N = '1' and BA = '0';

            if BA = '0' then
                debug_last_mpu_address <= A;
            end if;
        end if;
    end process;

    process(clock, clock_e_set)
    begin
        if rising_edge(clock) and clock_e_set then
            mpu_data_in <= Dout;
        end if;
    end process;

    -------------------------------------------------------------------

    MemOE <= '0' when memory_output_enable else '1';
    MemWR <= '0' when memory_write else '1';

    RamAdv <= '0';
    RamCS <= '0' when ram_enable else '1';
    RamClk <= '0';
    RamCRE <= '0';
    RamLB <= '0' when ram_lower_enable else '1';
    RamUB <= '0' when ram_upper_enable else '1';

    FlashRp <= '1';
    FlashCS <= '0' when flash_enable else '1';

    MemAdr <= "0000000" & memory_address;

    MemDin <= memory_data_out(7 downto 4) &
             memory_data_out(7 downto 4) &
             memory_data_out(3 downto 0) &
             memory_data_out(3 downto 0);
    memory_data_in <= MemDout(11 downto 8) & MemDout(3 downto 0);

    -------------------------------------------------------------------
    -- Video output

    Hsync <= not horizontal_sync;
    Vsync <= not vertical_sync;

    -------------------------------------------------------------------

    DP <= led_dp;
    SEG <= led_segment;
    AN <= led_anode;

    -------------------------------------------------------------------
    -- 1MHz, 12-phase counter.

    process(clock)
    begin
        if rising_edge(clock) then
            clock_12_phase <= clock_12_phase rol 1;
        end if;
    end process;

    -------------------------------------------------------------------
    -- Q clock

    clock_q_set <= clock_12_phase(2) = '1';
    clock_q_clear <= clock_12_phase(8) = '1';

    process(clock)
    begin
        if rising_edge(clock) then
            if clock_q_set then
                clock_q <= '1';
            elsif clock_q_clear then
                clock_q <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------------
    -- E clock

    clock_e_set <= clock_12_phase(5) = '1';
    clock_e_clear <= clock_12_phase(11) = '1';

    process(clock)
    begin
        if rising_edge(clock) then
            if clock_e_set then
                clock_e <= '1';
            elsif clock_e_clear then
                clock_e <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------------
    -- Reset generator

    process(clock)
    begin
        if rising_edge(clock) then
            if reset_request = '1' then
                reset_counter <= (others => '0');
                reset <= '1';
            else
                if reset_counter < 100 then
                    reset_counter <= reset_counter + 1;
                else
                    reset <= '0';
                end if;
            end if;
        end if;
    end process;

    -------------------------------------------------------------------
    -- Video counter

    video_count_next <= video_count + 1 when (video_count /= 16639)
                                        else (others => '0');
    video_address_or_mask <= "11111100000000" when video_count_next(14) = '1' else (others => '0');
--    irq_4ms <= video_count(11);
    irq_4ms <= video_address(11);

    process(clock, clock_e_clear)
    begin
        -- Advance video count at end of video memory phase.
        if rising_edge(clock) and clock_e_clear then
            --watchdog_increment <= '0';
            video_count <= video_count_next;
            video_address <= video_count_next(13 downto 0) or video_address_or_mask;
            --video_address <= video_address + 1;
            --if video_count(14 downto 0) = "011111111111111" then
            --    watchdog_increment <= '1';
            --end if;
        end if;
    end process;

    -------------------------------------------------------------------
    -- Video generator

    count_240 <= '1' when video_address(13 downto 10) = "1111" else '0';

    horizontal_sync <= '1' when video_address(5 downto 2) = "1110" else '0';
    vertical_sync <= '1' when video_address(13 downto 9) = "11111" else '0';

    -------------------------------------------------------------------
    -- LED numeric display

    process(clock)
    begin
        if rising_edge(clock) then
            led_counter <= led_counter + 1;
        end if;
    end process;

    led_digit_index <= led_counter(15 downto 14);

    with led_digit_index select
        led_anode <= "1110" when "00",
                     "1101" when "01",
                     "1011" when "10",
                     "0111" when "11",
                     "1111" when others;

    with led_digit_index select
        led_bcd_in_digit <= led_bcd_in( 3 downto  0) when "00",
                            led_bcd_in( 7 downto  4) when "01",
                            led_bcd_in(11 downto  8) when "10",
                            led_bcd_in(15 downto 12) when "11",
                            "XXXX" when others;

--    bcd_demux: led_decoder
--        port map(
--            input => led_bcd_in_digit,
--            output => led_segment
--        );

    led_dp <= '1';

end Behavioral;
