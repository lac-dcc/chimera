-- BBC Micro for Altera DE1
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
-- (C) 2011 Mike Stirling
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vidproc_orig is
    generic (
        IncludeVideoNuLA : boolean := false
        );
    port (
        -- CLOCK is the 48MHz master clock
        CLOCK       :   in  std_logic;

        -- CPUCLKEN qualifies CPU cycles, wrt. CLOCK
        CPUCLKEN    :   in  std_logic;

        -- CLKEN qualifies display cycles, wrt. CLOCK
        CLKEN       :   in  std_logic;

        -- nRESET is a power-on reset
        nRESET      :   in  std_logic;

        -- Clock enable output to CRTC
        CLKEN_CRTC  :   out std_logic;

        -- Clock enable counter, so memory timing can be slaved to the video processor
        CLKEN_COUNT :   out unsigned(3 downto 0);

        -- Indicates teletext
        TTXT        :   out std_logic;

        -- Indicates special VGA Mode 7 (720x576p)
        VGA         :   in  std_logic;

        -- Bus interface
        ENABLE      :   in  std_logic;
        A0          :   in  std_logic;
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
        R           :   out std_logic_vector(0 downto 0);
        G           :   out std_logic_vector(0 downto 0);
        B           :   out std_logic_vector(0 downto 0)
        );
end entity;

architecture rtl of vidproc_orig is
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
    signal shiftreg         :   std_logic_vector(7 downto 0);
-- Delayed display enable
    signal delayed_disen    :   std_logic;

-- Internal clock enable generation
    signal clken_pixel      :   std_logic;
    signal clken_fetch      :   std_logic;
    signal clken_counter    :   unsigned(3 downto 0) := (others => '0');

-- Cursor generation - can span up to 32 pixels
-- Segments 0 and 1 are 8 pixels wide
-- Segment 2 is 16 pixels wide
    signal cursor_invert    :   std_logic;
    signal cursor_invert1   :   std_logic;
    signal cursor_invert2   :   std_logic;
    signal cursor_active    :   std_logic;
    signal cursor_counter   :   unsigned(1 downto 0);

    signal RR               :   std_logic;
    signal GG               :   std_logic;
    signal BB               :   std_logic;

begin
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
            -- Enable/CS (pin 3) is just a decode of the CPU address so is asserted for 500ns
            -- Using Tom Seddons framework-test, and looking at green on the scope, you can
            -- see the green output changing after ~400ns. This point corresponds approximately
            -- to where the falling edge of the CPU clock would be. More specifically, this seems
            -- to be 20ns after the falling edge.
            if CPUCLKEN = '1' then
                if ENABLE = '1' then
                    if A0 = '0' then
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

    -- Clock enable generation.
    -- Pixel clock can be divided by 1,2,4 or 8 depending on the value
    -- programmed at r0_pixel_rate
    -- 00 = /8, 01 = /4, 10 = /2, 11 = /1
    clken_pixel <=
        CLKEN                                                       when r0_pixel_rate = "11" else
        CLKEN and (not clken_counter(0))                            when r0_pixel_rate = "10" else
        CLKEN and (not clken_counter(0)) and (not clken_counter(1)) when r0_pixel_rate = "01" else
        CLKEN and (not clken_counter(0)) and (not clken_counter(1)) and (not clken_counter(2));

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
            end if;
        end if;
    end process;

    -- Fetch control
    process(CLOCK,nRESET)
    begin
        if nRESET = '0' then
            shiftreg <= (others => '0');
            delayed_disen <= '0';
        elsif rising_edge(CLOCK) then
            if clken_pixel = '1' then
                if clken_fetch = '1' then
                    -- Fetch next byte from RAM into shift register.  This always occurs in
                    -- cycle 0, and also in cycle 8 if the CRTC is clocked at double rate.
                    shiftreg <= DI_RAM;
                    -- Ensure the disen signal is valid for a whole character
                    delayed_disen <= DISEN;
                else
                    -- Clock shift register and input '1' at LSB
                    shiftreg <= shiftreg(6 downto 0) & "1";
                end if;
            end if;
        end if;
    end process;

    -- Cursor generation
    cursor_invert <= cursor_active and
                     ((r0_cursor0 and not (cursor_counter(0) or cursor_counter(1))) or
                      (r0_cursor1 and cursor_counter(0) and not cursor_counter(1)) or
                      (r0_cursor2 and cursor_counter(1)));

    process(CLOCK,nRESET)
    begin
        if nRESET = '0' then
            cursor_active <= '0';
            cursor_counter <= (others => '0');
        elsif rising_edge(CLOCK) then
            if clken_fetch = '1' then
                if CURSOR = '1' or cursor_active = '1' then
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

    -- Palette lookup and pixel generation
    --
    -- This involves:
    -- - looking the 4-bit colour up in the palette
    -- - handing flashing colours by inverting the colour
    -- - handling display enable by forcing to black
    -- - handling the cursor by inversion
    --
    -- Measurements on real hardware indicate the RGB outputs change
    -- about a pixel after the falling edge of the CRTC clock, which
    -- means the left side of the screen moves slightly depending on
    -- the screen mode. Given this, it's likely that this stage of the
    -- design is clocked by the pixel clock.
    process(CLOCK,nRESET)
        variable palette_a : std_logic_vector(3 downto 0);
        variable dot_val : std_logic_vector(3 downto 0);
        variable red_val : std_logic;
        variable green_val : std_logic;
        variable blue_val : std_logic;
    begin
        if nRESET = '0' then
            RR <= '0';
            GG <= '0';
            BB <= '0';
        elsif rising_edge(CLOCK) then
            if clken_pixel = '1' then
                -- Look up dot value in the palette.  Bits are as follows:
                -- bit 3 - FLASH
                -- bit 2 - Not BLUE
                -- bit 1 - Not GREEN
                -- bit 0 - Not RED
                palette_a := shiftreg(7) & shiftreg(5) & shiftreg(3) & shiftreg(1);
                dot_val := palette(to_integer(unsigned(palette_a)));

                -- Apply flash inversion if required
                red_val := (dot_val(3) and r0_flash) xor not dot_val(0);
                green_val := (dot_val(3) and r0_flash) xor not dot_val(1);
                blue_val := (dot_val(3) and r0_flash) xor not dot_val(2);

                -- To output
                RR <= (red_val and delayed_disen) xor cursor_invert;
                GG <= (green_val and delayed_disen) xor cursor_invert;
                BB <= (blue_val and delayed_disen) xor cursor_invert;

                -- Delayed cursor for use in teletext mode
                cursor_invert1 <= cursor_invert;
                cursor_invert2 <= cursor_invert1;
            end if;
        end if;
    end process;

    -- Allow the 12MHz teletext signals to pass through without re-sampling
    R(0) <= RR when r0_teletext = '0' else R_IN xor cursor_invert2;
    G(0) <= GG when r0_teletext = '0' else G_IN xor cursor_invert2;
    B(0) <= BB when r0_teletext = '0' else B_IN xor cursor_invert2;

    -- Indicate mode 7 teletext is selected
    TTXT <= r0_teletext;

end architecture;
