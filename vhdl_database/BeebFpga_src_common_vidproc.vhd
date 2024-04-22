-- BBC Micro for Altera DE1
--
-- Copyright (c) 2018 David Banks
--
-- Includes VideoNuLA
--
-- VideoNuLA is an extension to the Beeb's Video Processor designed in 2017
-- by Rob Coleman (RobC) and published on the StarDot forums. It's a small
-- board that replaces the Beeb's Video ULA with an Altera Max II CPLD. As
-- well as being compatible with the original Acorn Video ULA, it adds:
--     an extended 4096 colour palette, in all modes (inc. mode 7)
--     16 solid colours in mode 2 (from the palette of 4096)
--     4 additional 2-colour attribute based screen modes
--     1 additional 4-colour attribute based screen mode
--     4 additional 8-colour attribute based screen modes
--     smooth horizontal scrolling, with left column blanking
--     extensive system level software support and documentation
--
-- All credit for the original concept and implementation belongs to Rob.
--
-- BeebFpga contains my own re-implementation of VideoNuLA, using the
-- information published by Rob in his excellent user guide, which can
-- be found here:
--     http://stardot.org.uk/forums/viewtopic.php?p=176865#p176865
--
-- It aims to be compatible with Rob's design at the register interface layer,
-- but likely differs in some of the implementation detail.
--
-- For more information on VideoNuLA see Rob's RISC OS London talk:
--    https://www.youtube.com/watch?v=4DaVrNS3034
-- and Rob's thread on StarDot describing the design work:
--    http://stardot.org.uk/forums/viewtopic.php?f=3&t=12150
--
-- Also based on previous work by Mike Stirling
--
-- Copyright (c) 2011 Mike Stirling
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
--
-- * Redistributions in synthesized form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
--
-- * Neither the name of the author nor the names of other contributors may
--   be used to endorse or promote products derived from this software without
--   specific prior written agreement from the author.
--
-- * License is granted for non-commercial use only.  A fee may not be charged
--   for redistributions as source code or in synthesized/hardware form without
--   specific prior written agreement from the author.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- BBC Micro "VIDPROC" Video ULA
--
-- Synchronous implementation for FPGA
--
-- (C) 2018 David Banks
-- (C) 2011 Mike Stirling
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vidproc is
    port (
        -- CLOCK is the 48MHz master clock
        CLOCK       :   in  std_logic;

        -- CPUCLKEN qualifies CPU cycles, wrt. CLOCK
        CPUCLKEN    :   in  std_logic;

        -- CLKEN qualifies display cycles, wrt. CLOCK
        CLKEN       :   in  std_logic;

        -- PIXCLK is a 48MHz clock to be used for pixel timing
        -- 48MHz is the lowest common multiple of 12MHz and 16MHz
        PIXCLK      :   in  std_logic;

        -- nRESET is a power-on reset
        nRESET      :   in  std_logic;

        -- Clock enable output to CRTC
        CLKEN_CRTC  :   out std_logic;

        -- Clock enable counter, so memory timing can be slaved to the video processor
        CLKEN_COUNT :   out unsigned(3 downto 0);

        -- Indicates teletext
        TTXT        :   out std_logic;

        -- Indicates a 12MHz pixel clock (ttxt or Nula Attr mode)
        MHZ12       :   out std_logic;

        -- Indicates special VGA Mode 7 (720x576p)
        VGA         :   in  std_logic;

        -- Bus interface
        ENABLE      :   in  std_logic;
        A           :   in  std_logic_vector(1 downto 0);

        -- CPU data bus (for register writes)
        DI_CPU      :   in  std_logic_vector(7 downto 0);

        -- Display RAM data bus (for display data fetch)
        DI_RAM      :   in  std_logic_vector(7 downto 0);

        -- Control interface
        nINVERT     :   in  std_logic;
        DISEN       :   in  std_logic;
        CURSOR      :   in  std_logic;

        -- Video in (teletext mode)
        R_IN        :   in  std_logic;
        G_IN        :   in  std_logic;
        B_IN        :   in  std_logic;

        -- Video out
        R           :   out std_logic_vector(3 downto 0);
        G           :   out std_logic_vector(3 downto 0);
        B           :   out std_logic_vector(3 downto 0)
        );
end entity;

architecture rtl of vidproc is
-- Write-only registers
    signal r0_cursor0       :   std_logic;
    signal r0_cursor1       :   std_logic;
    signal r0_cursor2       :   std_logic;
    signal r0_crtc_2mhz     :   std_logic;
    signal r0_pixel_rate    :   std_logic_vector(1 downto 0);
    signal r0_teletext      :   std_logic;
    signal r0_flash         :   std_logic;

    type palette_t is array(0 to 15) of std_logic_vector(3 downto 0);
    signal palette          :   palette_t;

-- Pixel shift register
    signal di               :   std_logic_vector(7 downto 0);
    signal shiftreg         :   std_logic_vector(7 downto 0);

-- Pipelined display enables
    signal disen0           :   std_logic;
    signal disen1           :   std_logic;
    signal disen2           :   std_logic; -- needed to pipeline in speccy mode
    signal disenout         :   std_logic;

-- Internal clock enable generation
    signal modeIs12MHz      :   std_logic;
    signal clken_pixel      :   std_logic;
    signal clken_shift      :   std_logic;
    signal clken_load       :   std_logic;
    signal clken_fetch      :   std_logic;
    signal clken_counter    :   unsigned(3 downto 0) := (others => '0');
    signal clken_zero       :   std_logic;
    signal pixen_prescale   :   unsigned(1 downto 0);
    signal pixen_counter    :   unsigned(3 downto 0);

-- Cursor generation - can span up to 32 pixels
-- Segments 0 and 1 are 8 pixels wide
-- Segment 2 is 16 pixels wide
    signal cursor0          :   std_logic;
    signal cursor_invert    :   std_logic;
    signal cursor_active    :   std_logic;
    signal cursor_counter   :   unsigned(1 downto 0);

    signal ttxt_R           :   std_logic;
    signal ttxt_G           :   std_logic;
    signal ttxt_B           :   std_logic;

-- Pass physical colour to VideoNuLA
    signal phys_col                   : std_logic_vector(3 downto 0);

-- Delay line for physical colour to support horirontal scroll offset
    signal phys_col_delay_reg         : std_logic_vector(27 downto 0);
    signal phys_col_delay_mux         : std_logic_vector(31 downto 0);
    signal phys_col_delay_out         : std_logic_vector(3 downto 0);
    signal phys_col_final             : std_logic_vector(3 downto 0);

-- Attribue bits
    signal mode1                      : std_logic;
    signal attr_bits                  : std_logic_vector(2 downto 0);
    signal first_byte                 : std_logic;
    signal speccy_attr                : std_logic_vector(7 downto 0);
    signal speccy_fg                  : std_logic_vector(3 downto 0);
    signal speccy_bg                  : std_logic_vector(3 downto 0);

-- Additional VideoNuLA registers
    signal nula_palette_mode          : std_logic;
    signal nula_hor_scroll_offset     : std_logic_vector(2 downto 0);
    signal nula_left_banking_size     : std_logic_vector(3 downto 0);
    signal nula_disable_a1            : std_logic;
    signal nula_normal_attr_mode      : std_logic;
    signal nula_text_attr_mode        : std_logic;
    signal nula_speccy_attr_mode      : std_logic;
    signal nula_flashing_flags        : std_logic_vector(7 downto 0);
    signal nula_write_index           : std_logic;
    signal nula_data_last             : std_logic_vector(7 downto 0);
    signal nula_RGB                   : std_logic_vector(11 downto 0);
    signal nula_reg6                  : std_logic_vector(1 downto 0);
    signal nula_reg7                  : std_logic_vector(0 downto 0);

-- Additional VideoNuLA palette
    type nula_palette_t is array(0 to 15) of std_logic_vector(11 downto 0);
    signal nula_palette               : nula_palette_t;

-- Additional VideoNuLA signals
    signal nula_nreset                 : std_logic := '0';

begin

    -- Original VideoULA Registers
    -- Synchronous register access, enabled on every clock
    process(CLOCK,nRESET)
    begin
        if nRESET = '0' then
            r0_cursor0 <= '0';
            r0_cursor1 <= '0';
            r0_cursor2 <= '0';
            r0_crtc_2mhz <= '0';
            r0_pixel_rate <= "00";
            r0_teletext <= '0';
            r0_flash <= '0';

            for colour in 0 to 15 loop
                palette(colour) <= (others => '0');
            end loop;
        elsif rising_edge(CLOCK) then
            if CPUCLKEN = '1' then
                if ENABLE = '1' and (A(1) = '0' or nula_disable_a1 = '1') then
                    if A(0) = '0' then
                        -- Access control register
                        r0_cursor0 <= DI_CPU(7);
                        r0_cursor1 <= DI_CPU(6);
                        r0_cursor2 <= DI_CPU(5);
                        r0_crtc_2mhz <= DI_CPU(4);
                        r0_pixel_rate <= DI_CPU(3 downto 2);
                        r0_teletext <= DI_CPU(1);
                        r0_flash <= DI_CPU(0);
                    else
                        -- Access palette register
                        palette(to_integer(unsigned(DI_CPU(7 downto 4)))) <= DI_CPU(3 downto 0);
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Additional VideoNuLA registers
    -- Synchronous register access, enabled on every clock
    process(CLOCK, nRESET)
    begin

        if nRESET = '0' then

            nula_nreset <= '0';

        elsif rising_edge(CLOCK) then

            if CPUCLKEN = '1' then

                -- If the nula_nreset register is '0', sSynchronously reset
                -- everything, then set nula_nreset to '1' to acknowledge.
                -- This allow the reset logic to be in one place, but
                -- triggered by three things: power up, nRESET and &FE22=&4x

                if nula_nreset = '0' then
                    nula_palette_mode          <= '0';
                    nula_hor_scroll_offset     <= (others => '0');
                    nula_left_banking_size     <= (others => '0');
                    nula_disable_a1            <= '0';
                    nula_reg6                  <= (others => '0');
                    nula_reg7                  <= (others => '0');
                    nula_flashing_flags        <= (others => '1');
                    nula_write_index           <= '0';
                    nula_palette( 0)           <= x"000";
                    nula_palette( 1)           <= x"F00";
                    nula_palette( 2)           <= x"0F0";
                    nula_palette( 3)           <= x"FF0";
                    nula_palette( 4)           <= x"00F";
                    nula_palette( 5)           <= x"F0F";
                    nula_palette( 6)           <= x"0FF";
                    nula_palette( 7)           <= x"FFF";
                    nula_palette( 8)           <= x"000";
                    nula_palette( 9)           <= x"F00";
                    nula_palette(10)           <= x"0F0";
                    nula_palette(11)           <= x"FF0";
                    nula_palette(12)           <= x"00F";
                    nula_palette(13)           <= x"F0F";
                    nula_palette(14)           <= x"0FF";
                    nula_palette(15)           <= x"FFF";
                    nula_nreset                <= '1';
                end if;

                if ENABLE = '1' and A(1) = '1' and nula_disable_a1 = '0' then
                    if A(0) = '0' then
                        -- &FE22 - Auxiliary Control Register
                        case DI_CPU(7 downto 4) is
                            when x"1" =>
                                nula_palette_mode          <= DI_CPU(0);
                            when x"2" =>
                                nula_hor_scroll_offset     <= DI_CPU(2 downto 0);
                            when x"3" =>
                                nula_left_banking_size     <= DI_CPU(3 downto 0);
                            when x"4" =>
                                nula_nreset                <= '0';
                            when x"5" =>
                                nula_disable_a1            <= '1';
                            when x"6" =>
                                nula_reg6                  <= DI_CPU(1 downto 0);
                            when x"7" =>
                                nula_reg7                  <= DI_CPU(0 downto 0);
                            when x"8" =>
                                -- bits 7..4 control colours 8..11 respectively
                                nula_flashing_flags(7 downto 4) <= DI_CPU(3 downto 0);
                            when x"9" =>
                                -- bits 3..0 control colours 12..15 respectively
                                nula_flashing_flags(3 downto 0) <= DI_CPU(3 downto 0);
                            when others =>
                        end case;
                    else
                        -- &FE23 - Auxiliary Palette Register
                        if nula_write_index = '0' then
                            nula_data_last <= DI_CPU;
                        else
                            nula_palette(to_integer(unsigned(nula_data_last(7 downto 4)))) <= nula_data_last(3 downto 0) & DI_CPU;
                            -- if writing to colours 8..15, clear the flash
                            -- flags to supress flashing
                            if nula_data_last(7) = '1' then
                                nula_flashing_flags(to_integer(unsigned(nula_data_last(6 downto 4) xor "111"))) <= '0';
                            end if;
                        end if;
                        nula_write_index <= not nula_write_index;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Decode which attribute mode is active
    nula_normal_attr_mode <= '1' when nula_reg6(1 downto 0) = "01" and nula_reg7(0) = '0' else '0';
    nula_text_attr_mode   <= '1' when nula_reg6(1 downto 0) = "01" and nula_reg7(0) = '1' else '0';
    nula_speccy_attr_mode <= '1' when nula_reg6(1)          = '1'                         else '0';

    -- The CRTC is clocked out of phase with the CPU, and the result loaded into the
    -- the shift register on the next CRTC clock edge
    clken_fetch <= CLKEN and
                  (not clken_counter(0)) and (not clken_counter(1)) and (not clken_counter(2)) and
                  ((not clken_counter(3)) or r0_crtc_2mhz or (r0_teletext and VGA));

    CLKEN_CRTC  <= clken_fetch;
    CLKEN_COUNT <= clken_counter;

    process(CLOCK)
    begin
        if rising_edge(CLOCK) then
            if CLKEN = '1' then
                -- Increment internal cycle counter during each video clock
                clken_counter <= clken_counter + 1;
                if clken_fetch = '1' then
                    -- Sample all inputs, so there are stable for a whole character
                    di <= DI_RAM;
                    disen0 <= DISEN;
                    cursor0 <= CURSOR;
                end if;
            end if;
        end if;
    end process;

    -- =========================================================
    -- PIXCLK (48MHz) is the main clock below this point
    -- =========================================================

    -- Depending on the mode, the base pixel clock is either 12MHz or 16MHz
    modeIs12MHz <= '1' when r0_teletext = '1' or nula_normal_attr_mode = '1' or nula_text_attr_mode = '1' else '0';

    process(PIXCLK,nRESET)
    begin
        if nRESET = '0' then

            pixen_prescale <= (others => '0');
            pixen_counter  <= (others => '0');

        elsif rising_edge(PIXCLK) then

            clken_pixel <= '0';
            clken_shift <= '0';
            clken_load  <= '0';

            -- For 12MHz pixen_prescale counts: 0, 1, 2, 3
            -- For 16MHz pixen_prescale counts: 0, 1,    3
            if r0_teletext = '1' and VGA = '1' and pixen_prescale = 0 then
                -- Special case VGA mode, count at twice the rate
                pixen_prescale <= pixen_prescale + 3;
            elsif modeIs12MHz = '0' and pixen_prescale = 1 then
                pixen_prescale <= pixen_prescale + 2;
            else
                pixen_prescale <= pixen_prescale + 1;
            end if;

            if pixen_prescale = 3 then

                clken_pixel <= '1';

                -- For 12MHz pixen_counter counts 0..5, 8..13
                -- For 16MHz pixen_counter counts 0..15
                if modeIs12Mhz = '1' and pixen_counter(2 downto 0) = 5 then
                    pixen_counter <= pixen_counter + 3;
                else
                    pixen_counter <= pixen_counter + 1;
                end if;

                -- clken_load is either 1MHz or 2MHz
                if pixen_counter(2 downto 0) = 0 and (pixen_counter(3) = '0' or r0_crtc_2mhz = '1') then
                    clken_load <= '1';
                end if;

                -- clken_shift depends on the pixel rate
                if r0_pixel_rate = "00" then
                    -- 2MHz/1MHz
                    clken_shift <= not (pixen_counter(0) or pixen_counter(1) or pixen_counter(2));
                elsif r0_pixel_rate = "01" then
                    -- 4MHz/3MHz
                    clken_shift <= not (pixen_counter(0) or pixen_counter(1));
                elsif r0_pixel_rate = "10" or nula_speccy_attr_mode = '1' then
                    -- 8MHz/6MHz
                    clken_shift <= not pixen_counter(0);
                else
                    clken_shift <= '1';
                end if;
            end if;

            -- Syncronize pixen_prescale and pixen_counter to clken_counter
            -- (otherwise there is a random shift of the cursor alignment on hard reset)
            if clken_counter = 0 then
                if clken_zero <= '0' then
                    pixen_counter  <= (others => '0');
                    pixen_prescale <= (others => '0');
                end if;
                clken_zero <= '1';
            else
                clken_zero <= '0';
            end if;

        end if;
    end process;

    mode1 <= '1' when r0_crtc_2mhz = '1' and r0_pixel_rate = "10" else '0';

    -- Shift register control
    process(PIXCLK,nRESET)
        variable fg : std_logic_vector(3 downto 0);
        variable bg : std_logic_vector(3 downto 0);
    begin
        if nRESET = '0' then
            shiftreg <= (others => '0');
            -- there must be a better way of syncing this, but this seems to work
            first_byte <= '0';
        elsif rising_edge(PIXCLK) then
            if clken_load = '1' then
                -- Fetch next byte from RAM into shift register.  This always occurs in
                -- cycle 0, and also in cycle 8 if the CRTC is clocked at double rate.
                if nula_normal_attr_mode = '1' then
                    shiftreg <= di;
                    if mode1 = '1' then
                        -- mode 1
                        attr_bits <= di(4) & di(0) & '0';
                    else
                        -- mode 0, 3, 4, 6
                        attr_bits <= di(1) & di(0) & '0';
                    end if;
                elsif nula_text_attr_mode = '1' then
                    shiftreg <= di and x"f8";
                    attr_bits <= di(2 downto 0);
                elsif nula_speccy_attr_mode = '1' then
                    if first_byte = '1' then
                        -- first byte contains attribute
                        speccy_attr <= di;
                        -- also need a shift as well at this point
                        shiftreg <= shiftreg(6 downto 0) & "1";
                    else
                        -- second byte contains pixels
                        shiftreg <= di;
                        -- attribute is <flash> <bright> <paper: G R B> <ink G R B>
                        -- beeb colour is <B G R>
                        fg := speccy_attr(6) & speccy_attr(0) & speccy_attr(2) & speccy_attr(1);
                        bg := speccy_attr(6) & speccy_attr(3) & speccy_attr(5) & speccy_attr(4);
                        -- Bit 0 of R6 is a recent enhancement that selects between Spectrum and Thomson Attribute modes
                        if nula_reg6(0) = '0' then
                            -- Spectrum mode (mode 2) specific behaviour
                            if speccy_attr = x"80" then
                                -- attribute 0x80 is used to indicate border
                                -- which is then mapped to logical colour 0
                                fg := x"0";
                                bg := x"0";
                            else
                                -- remap light black (0) to dark black (8) so
                                -- logical colour zero can only be border
                                if fg = x"0" then
                                    fg := x"8";
                                end if;
                                if bg = x"0" then
                                    bg := x"8";
                                end if;
                            end if;
                        else
                            -- Thomson mode (mode 3) specific behaviour
                            bg(3) := speccy_attr(7);
                        end if;
                        -- now handle flashing
                        if speccy_attr(7) = '1' and r0_flash = '1' then
                            speccy_fg <= bg;
                            speccy_bg <= fg;
                        else
                            speccy_fg <= fg;
                            speccy_bg <= bg;
                        end if;
                    end if;
                    if disen1 = '0' and disen2 = '1' then
                        first_byte <= '1';
                    else
                        first_byte <= not first_byte;
                    end if;
                else
                    shiftreg <= di;
                end if;
            elsif clken_shift = '1' then
                -- Clock shift register and input '1' at LSB
                shiftreg <= shiftreg(6 downto 0) & "1";
            end if;
        end if;
    end process;

    -- Cursor generation
    cursor_invert <= cursor_active and
                     ((r0_cursor0 and not (cursor_counter(0) or cursor_counter(1))) or
                      (r0_cursor1 and cursor_counter(0) and not cursor_counter(1)) or
                      (r0_cursor2 and cursor_counter(1)));

    process(PIXCLK,nRESET)
    begin
        if nRESET = '0' then
            cursor_active <= '0';
            cursor_counter <= (others => '0');
        elsif rising_edge(PIXCLK) then
            if clken_load = '1' then
                -- Display enable signal delayed by one character
                disen1 <= disen0;
                disen2 <= disen1;
                if cursor0 = '1' or cursor_active = '1' then
                    -- Latch cursor
                    cursor_active <= '1';

                    -- Reset on counter wrap
                    if cursor_counter = "11" then
                        cursor_active <= '0';
                    end if;

                    -- Increment counter
                    if cursor_active = '0' then
                        -- Reset
                        cursor_counter <= (others => '0');
                    else
                        -- Increment
                        cursor_counter <= cursor_counter + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Pixel generation
    -- The new shift register contents are loaded during
    -- cycle 0 (and 8) but will not be read here until the next cycle.
    -- By running this process on every single video tick instead of at
    -- the pixel rate we ensure that the resulting delay is minimal and
    -- constant (running this at the pixel rate would cause
    -- the display to move slightly depending on which mode was selected).
    process(PIXCLK,nRESET)
        variable palette_a : std_logic_vector(3 downto 0);
        variable dot_val : std_logic_vector(3 downto 0);
        variable red_val : std_logic;
        variable green_val : std_logic;
        variable blue_val : std_logic;
        variable do_flash : std_logic;
    begin
        if nRESET = '0' then
            phys_col <= (others =>'0');
        elsif rising_edge(PIXCLK) then
            if clken_pixel = '1' then
                -- Look up dot value in the palette.  Bits are as follows:
                -- bit 3 - FLASH
                -- bit 2 - Not BLUE
                -- bit 1 - Not GREEN
                -- bit 0 - Not RED
                if nula_normal_attr_mode = '1' or nula_text_attr_mode = '1' then
                    if mode1 = '1' then
                        palette_a := attr_bits(2 downto 1) & shiftreg(7) & shiftreg(3);
                    else
                        palette_a := attr_bits(2 downto 0)               & shiftreg(7);
                    end if;
                elsif nula_speccy_attr_mode = '1' then
                    if shiftreg(7) = '1' then
                        palette_a := speccy_fg;
                    else
                        palette_a := speccy_bg;
                    end if;
                else
                    palette_a := shiftreg(7) & shiftreg(5) & shiftreg(3) & shiftreg(1);
                end if;

                dot_val := palette(to_integer(unsigned(palette_a)));

                -- Apply flash inversion if required
                do_flash := r0_flash;
                if nula_flashing_flags(to_integer(unsigned(dot_val(2 downto 0)))) = '0' then
                    do_flash := '0';
                end if;
                red_val := (dot_val(3) and do_flash) xor not dot_val(0);
                green_val := (dot_val(3) and do_flash) xor not dot_val(1);
                blue_val := (dot_val(3) and do_flash) xor not dot_val(2);

                -- Output physical colour, to be used by VideoNuLA
                if nula_palette_mode = '1' or nula_speccy_attr_mode = '1' then
                    phys_col <= palette_a;
                else
                    phys_col <= dot_val(3) & blue_val & green_val & red_val;
                end if;
            end if;
        end if;
    end process;

    -- Infer a large mux to select the appropriate hor scroll delay tap
    phys_col_delay_mux <= phys_col_delay_reg & phys_col;
    phys_col_delay_out <= phys_col_delay_mux(to_integer(unsigned(nula_hor_scroll_offset)) * 4 + 3 downto to_integer(unsigned(nula_hor_scroll_offset)) * 4);

    phys_col_final <= phys_col_delay_out            when r0_teletext = '0' else
                      '0' & B_IN   & G_IN   & R_IN  when VGA         = '0' else
                      '0' & ttxt_B & ttxt_G & ttxt_R;

    process (PIXCLK)
        variable invert : std_logic_vector(3 downto 0);
    begin
        if rising_edge(PIXCLK) then

            if clken_pixel = '1' then

                -- One more pixel delay was needed in for VideoNuLA in VGA mode; this was the easist place to do it.
                ttxt_R <= R_IN;
                ttxt_G <= G_IN;
                ttxt_B <= B_IN;

                -- Shift pixels in from right (so bits 3..0 are the most recent)
                phys_col_delay_reg <= phys_col_delay_reg(23 downto 0) & phys_col;
                if nula_speccy_attr_mode = '1' then
                    disenout <= disen2;
                else
                    disenout <= disen1;
                end if;
                if (r0_teletext = '1' and phys_col_final = "0000") or (r0_teletext = '0' and disenout = '0') then
                    nula_RGB <= invert & invert & invert;
                else
                    nula_RGB <= nula_palette(to_integer(unsigned(phys_col_final xor invert)));
                end if;
                invert := (others => cursor_invert);
            end if;
        end if;
    end process;

    R <= nula_RGB(11 downto 8);
    G <= nula_RGB(7 downto 4);
    B <= nula_RGB(3 downto 0);

    -- Indicate mode 7 teletext is selected
    TTXT <= r0_teletext;

    -- Indicate a 12MHz pixel clock (ttxt or Nula Attr mode)
    MHZ12 <= modeIs12MHz;

end architecture;
