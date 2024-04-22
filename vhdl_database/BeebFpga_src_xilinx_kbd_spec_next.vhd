-- BBC Master / BBC B for the Spectrum Next
--
-- Copright (c) 2020 David Banks
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity kbd_spec_next is
    port (
        -- Clock
        clock             : in  std_logic;
        reset_n           : in  std_logic;

        -- Specnext Keboard matrix
        keyb_col_i        : in  std_logic_vector(6 downto 0);
        keyb_row_o        : out std_logic_vector(7 downto 0);  -- 0 for row active
                                                               -- Z for row inactive
        -- Specnext Buttons
        btn_divmmc_n_i    : in  std_logic;
        btn_multiface_n_i : in  std_logic;

        -- Debounced configuration outputs
        -- (pulse high for 1 clock cycle when depressed)
        green_config      : out std_logic_vector(9 downto 0);  -- Green  / divmmc    / Drive
        yellow_config     : out std_logic_vector(9 downto 0);  -- Yellow / multiface / NMI

        -- Beeb Keyboard
        keyb_1mhz         : in  std_logic;
        keyb_en_n         : in  std_logic;
        keyb_pa           : in  std_logic_vector(6 downto 0);
        keyb_rst_n        : out std_logic := '1';
        keyb_ca2          : out std_logic;
        keyb_pa7          : out std_logic
        );
end entity;

architecture rtl of kbd_spec_next is

    type beeb_key_matrix_t is array (0 to 15) of std_logic_vector(7 downto 0);
    type spec_key_matrix_t is array (0 to  7) of std_logic_vector(6 downto 0);

    signal spec_matrix : spec_key_matrix_t := ((others => (others => '0')));
    signal keys        : beeb_key_matrix_t := ((others => (others => '0')));

    signal keyb_100KHz : std_logic;            -- a 100KHz clock enable
    signal div10       : unsigned(3 downto 0); -- /10 counter for kbd_100KHz
    signal beeb_col    : unsigned(3 downto 0); -- The Beeb column being being scanned
    signal spec_row    : unsigned(2 downto 0); -- The Spec row being scabbed
    signal extend      : std_logic;            -- The Extend modifier is active
    signal symshift    : std_logic;            -- The Symbol Shift modifier is active
    signal idle        : std_logic;            -- No keys are pressed (cancels modifiers)

    -- Button press detection
    signal btn_divmmc_n_last      : std_logic;
    signal btn_multiface_n_last   : std_logic;
    signal debounce_ctr           : std_logic_vector(19 downto 0);
    signal spec_number_keys       : std_logic_vector(9 downto 0);
    signal spec_number_keys_last  : std_logic_vector(9 downto 0);
    signal spec_number_keys_last2 : std_logic_vector(9 downto 0);

begin

    -- TODO: The following Beeb Key is not currently mapped
    -- keys(0)(5) <= not keyb_col_i(5); -- SHIFT LOCK

    -- Generate a 100KHz clock enable signal to scan the keyboard
    process(clock)
    begin
        if rising_edge(clock) then
            if keyb_1mhz = '1' then
                if div10 = 9 then
                    div10 <= (others => '0');
                    keyb_100KHz <= '1';
                else
                    div10 <= div10 + 1;
                    keyb_100KHz <= '0';
                end if;
            else
                keyb_100KHz <= '0';
            end if;
        end if;
    end process;


    -- Spectrum keyboard matrix scanning into spec_matrix array
    process(clock)
    begin
        if rising_edge(clock) then
            -- scan rows at 100KHz
            if keyb_100KHz = '1' then
                -- save state (inverted, so below logic is simpler)
                spec_matrix(to_integer(spec_row)) <= keyb_col_i xor "1111111";
                -- next row
                spec_row <= spec_row + 1;
            end if;
        end if;
    end process;

    -- Drive the active Spectrim keyboard row, leaving other Hi Z
    process(spec_row)
    begin
        keyb_row_o <= (others => 'Z');
        keyb_row_o(to_integer(spec_row)) <= '0';
    end process;

    -- Idle detection (no keys pressed)
    process(spec_matrix)
    begin
        if (spec_matrix(0) or spec_matrix(1) or spec_matrix(2) or spec_matrix(3) or
            spec_matrix(4) or spec_matrix(5) or spec_matrix(6) or spec_matrix(7)) = 0 then
            -- no key is pressed
            idle <= '1';
        else
            -- a key is pressed somewhere
            idle <= '0';
        end if;
    end process;

    -- Spectrum Columns 6 to 5 are special to the Spec Next
    --
    --         bit 6     bit 5
    -- row 0   UP        EXTEND
    -- row 1   GRAPH     CAPS LOCK
    -- row 2   INV VIDEO TRUE VIDEO
    -- row 3   EDIT      BREAK
    -- row 4   "         ;
    -- row 5   .         ,
    -- row 6   RIGHT     DELETE
    -- row 7   DOWN      LEFT
    --
    -- Spectrum Columns 4 to 0 are standard, see
    -- Page 210 of "The ZX Spectrum ULA" by Chris Smith
    --
    --         bit 4     bit 3     bit 2     bit 1     bit 0
    -- row 0   V         C         X         Z         CapsShift
    -- row 1   G         F         D         S         A
    -- row 2   T         R         E         W         Q
    -- row 3   5         4         3         2         1
    -- row 4   6         7         8         9         0
    -- row 5   Y         U         I         O         P
    -- row 6   H         J         K         L         Enter
    -- row 7   B         N         M         SymShift  Space


    -- Map Spectrum Keys to Beeb Keys
    process(clock)
    begin
        if rising_edge(clock) then

            -- Update beeb matrix once per scan, for consistency
            if keyb_100KHz = '1' and spec_row = 0 then

                -- Handle internal modifiers first
                if spec_matrix(0)(5) = '1' then
                    extend <= '1';
                elsif idle = '1' then
                    extend <= '0';
                end if;

                if spec_matrix(7)(1) = '1' then
                    symshift <= '1';
                elsif idle = '1' then
                    symshift <= '0';
                end if;

                -- Default to unpressed
                keys(0) <= (others => '0');
                keys(1) <= (others => '0');
                keys(2) <= (others => '0');
                keys(3) <= (others => '0');
                keys(4) <= (others => '0');
                keys(5) <= (others => '0');
                keys(6) <= (others => '0');
                keys(7) <= (others => '0');
                keys(8) <= (others => '0');
                keys(9) <= (others => '0');

                if btn_divmmc_n_i = '0' or btn_multiface_n_i = '0' then

                    -- ignore and key presses during configuration

                elsif extend = '1' then

                    -- Extend modifier is used to access function keys
                    -- Only keys 0-9 have any effect in this mode

                    -- 1 2 3 4 5 Break Edit
                    keys(1)(7) <= spec_matrix(3)(0); -- F1
                    keys(2)(7) <= spec_matrix(3)(1); -- F2
                    keys(3)(7) <= spec_matrix(3)(2); -- F3
                    keys(4)(1) <= spec_matrix(3)(3); -- F4
                    keys(4)(7) <= spec_matrix(3)(4); -- F5

                    -- 0 9 8 7 6 ; "
                    keys(0)(2) <= spec_matrix(4)(0); -- F0
                    keys(7)(7) <= spec_matrix(4)(1); -- F9
                    keys(6)(7) <= spec_matrix(4)(2); -- F8
                    keys(6)(1) <= spec_matrix(4)(3); -- F7
                    keys(5)(7) <= spec_matrix(4)(4); -- F6

                elsif symshift = '1' then

                    -- Symshift maps the Spectrum character to the same
                    -- character on the Beeb, no matter where it is in the
                    -- matrix.

                    keys(0)(3) <= spec_matrix(3)(0);   -- SymShift 1 -> ! (shifted)

                    keys(1)(1) <= spec_matrix(3)(2);   -- SymShift 3 -> # (shifted)

                    keys(1)(3) <= spec_matrix(5)(0);   -- SymShift P -> " (shifted)

                    keys(2)(1) <= spec_matrix(3)(3);   -- SymShift 4 -> $ (shifted)

                    keys(3)(1) <= spec_matrix(3)(4);   -- SymShift 5 -> % (shifted)

                    keys(4)(2) <= spec_matrix(4)(3);   -- SymShift 7 -> ' (shifted)

                    keys(4)(3) <= spec_matrix(4)(4);   -- SymShift 6 -> & (shifted)

                    keys(5)(1) <= spec_matrix(4)(2);   -- SymShift 8 -> ( (shifted)

                    keys(6)(2) <= spec_matrix(4)(1);   -- SymShift 9 -> )
                                                       -- (shifted)

                    keys(6)(6) <= spec_matrix(7)(3) or -- SymShift N -> ,
                                  spec_matrix(2)(3) or -- SymShift R -> < (shifted)
                                  spec_matrix(5)(5);   -- SymShift , -> < (shifted)

                    keys(7)(1) <= spec_matrix(6)(3) or -- SymShift J -> -
                                  spec_matrix(6)(1);   -- SymShift L -> = (shifted)

                    keys(7)(4) <= spec_matrix(3)(1);   -- SymShift 2 -> @

                    keys(7)(5) <= spec_matrix(5)(1) or -- SymShift O -> ;
                                  spec_matrix(6)(2) or -- SymShift K -> + (shifted)
                                  spec_matrix(4)(5);   -- SymShift ; -> + (shifted)

                    keys(7)(6) <= spec_matrix(7)(2) or -- SymShift M -> .
                                  spec_matrix(2)(4) or -- SymShift T -> > (shifted)
                                  spec_matrix(5)(6);   -- SymShift . -> > (shifted)

                    keys(8)(1) <= spec_matrix(6)(4) or -- SymShift H -> ^
                                  spec_matrix(1)(0);   -- SymShift A -> ~ (shifted)

                    keys(8)(2) <= spec_matrix(4)(0) or -- SymShift 0 -> _
                                  spec_matrix(0)(2);   -- SymShift X -> £ (shifted)

                    keys(8)(3) <= spec_matrix(5)(4) or -- SymShift Y -> [
                                  spec_matrix(1)(3);   -- SymShift F -> { (shifted)

                    keys(8)(4) <= spec_matrix(0)(1) or -- SymShift Z -> :
                                  spec_matrix(7)(4) or -- SymShift B -> * (shifted)
                                  spec_matrix(4)(6);   -- SymShift : -> * (shifted)

                    keys(8)(5) <= spec_matrix(5)(3) or -- SymShift U -> ]
                                  spec_matrix(1)(4);   -- SymShift G -> } (shifted)

                    keys(8)(6) <= spec_matrix(0)(4) or -- SymShift V -> /
                                  spec_matrix(0)(3);   -- SymShift C -> ? (shifted)

                    keys(8)(7) <= spec_matrix(1)(2) or -- SymShift D -> \
                                  spec_matrix(1)(1);   -- SymShift S -> | (shifted)

                    -- Shift is needed in many of the above cases
                    keys(0)(0) <= spec_matrix(3)(0) or -- SymShift 1 -> ! (shifted)
                                  spec_matrix(3)(2) or -- SymShift 3 -> # (shifted)
                                  spec_matrix(5)(0) or -- SymShift P -> " (shifted)
                                  spec_matrix(3)(3) or -- SymShift 4 -> $ (shifted)
                                  spec_matrix(3)(4) or -- SymShift 5 -> % (shifted)
                                  spec_matrix(4)(3) or -- SymShift 7 -> ' (shifted)
                                  spec_matrix(4)(4) or -- SymShift 6 -> & (shifted)
                                  spec_matrix(4)(2) or -- SymShift 8 -> ( (shifted)
                                  spec_matrix(4)(1) or -- SymShift 9 -> ) (shifted)
                                  spec_matrix(2)(3) or -- SymShift R -> < (shifted)
                                  spec_matrix(5)(5) or -- SymShift , -> < (shifted)
                                  spec_matrix(6)(1) or -- SymShift L -> = (shifted)
                                  spec_matrix(6)(2) or -- SymShift K -> + (shifted)
                                  spec_matrix(4)(5) or -- SymShift ; -> + (shifted)
                                  spec_matrix(2)(4) or -- SymShift T -> > (shifted)
                                  spec_matrix(5)(6) or -- SymShift . -> > (shifted)
                                  spec_matrix(1)(0) or -- SymShift A -> ~ (shifted)
                                  spec_matrix(0)(2) or -- SymShift X -> £ (shifted)
                                  spec_matrix(1)(3) or -- SymShift F -> { (shifted)
                                  spec_matrix(7)(4) or -- SymShift B -> * (shifted)
                                  spec_matrix(4)(6) or -- SymShift : -> * (shifted)
                                  spec_matrix(1)(4) or -- SymShift G -> } (shifted)
                                  spec_matrix(0)(3) or -- SymShift C -> ? (shifted)
                                  spec_matrix(1)(1);   -- SymShift S -> | (shifted)

                else

                    -- Default mapping for each of the Spectrum Keys

                    -- Spec Row 0: Shift Z X C V Extend Up
                    keys(0)(0) <= spec_matrix(0)(0); -- SHIFT
                    keys(1)(6) <= spec_matrix(0)(1); -- Z
                    keys(2)(4) <= spec_matrix(0)(2); -- X
                    keys(2)(5) <= spec_matrix(0)(3); -- C
                    keys(3)(6) <= spec_matrix(0)(4); -- V
                    -- Extend handled elsewhere
                    keys(9)(3) <= spec_matrix(0)(6); -- UP

                    -- Spec Row 1: A S D F G CAPS-LOCK GRAPH
                    keys(1)(4) <= spec_matrix(1)(0); -- A
                    keys(1)(5) <= spec_matrix(1)(1); -- S
                    keys(2)(3) <= spec_matrix(1)(2); -- D
                    keys(3)(4) <= spec_matrix(1)(3); -- F
                    keys(3)(5) <= spec_matrix(1)(4); -- G
                    keys(0)(4) <= spec_matrix(1)(5); -- CAPS LOCK
                    keys(1)(0) <= spec_matrix(1)(6); -- CTRL

                    -- Spec Row 2: Q W E R T TrueVid InvVid
                    keys(0)(1) <= spec_matrix(2)(0); -- Q
                    keys(1)(2) <= spec_matrix(2)(1); -- W
                    keys(2)(2) <= spec_matrix(2)(2); -- E
                    keys(3)(3) <= spec_matrix(2)(3); -- R
                    keys(3)(2) <= spec_matrix(2)(4); -- T
                    keys(0)(6) <= spec_matrix(2)(5); -- TAB
                    keys(9)(6) <= spec_matrix(2)(6); -- COPY

                    -- Spec Row 3: 1 2 3 4 5 Break Edit
                    keys(0)(3) <= spec_matrix(3)(0); -- 1
                    keys(1)(3) <= spec_matrix(3)(1); -- 2
                    keys(1)(1) <= spec_matrix(3)(2); -- 3
                    keys(2)(1) <= spec_matrix(3)(3); -- 4
                    keys(3)(1) <= spec_matrix(3)(4); -- 5
                    keyb_rst_n <= not spec_matrix(3)(5); -- BREAK
                    keys(0)(7) <= spec_matrix(3)(6); -- ESCAPE

                    -- Spec Row 4: 0 9 8 7 6 ; "
                    keys(7)(2) <= spec_matrix(4)(0); -- 0
                    keys(6)(2) <= spec_matrix(4)(1); -- 9
                    keys(5)(1) <= spec_matrix(4)(2); -- 8
                    keys(4)(2) <= spec_matrix(4)(3); -- 7
                    keys(4)(3) <= spec_matrix(4)(4); -- 6
                    keys(7)(5) <= spec_matrix(4)(5); -- ;
                    keys(8)(4) <= spec_matrix(4)(6); -- :

                    -- Spec Row 5: P O I U Y , .
                    keys(7)(3) <= spec_matrix(5)(0); -- P
                    keys(6)(3) <= spec_matrix(5)(1); -- O
                    keys(5)(2) <= spec_matrix(5)(2); -- I
                    keys(5)(3) <= spec_matrix(5)(3); -- U
                    keys(4)(4) <= spec_matrix(5)(4); -- Y
                    keys(6)(6) <= spec_matrix(5)(5); -- ,
                    keys(7)(6) <= spec_matrix(5)(6); -- .

                    -- Spec Row 6: Enter L K J H Delete Right
                    keys(9)(4) <= spec_matrix(6)(0); -- RETURN
                    keys(6)(5) <= spec_matrix(6)(1); -- L
                    keys(6)(4) <= spec_matrix(6)(2); -- K
                    keys(5)(4) <= spec_matrix(6)(3); -- J
                    keys(4)(5) <= spec_matrix(6)(4); -- H
                    keys(9)(5) <= spec_matrix(6)(5); -- BACKSPACE (DELETE)
                    keys(9)(7) <= spec_matrix(6)(6); -- RIGHT

                    -- Spec Row 7: Space SymShift M N B Left Down
                    keys(2)(6) <= spec_matrix(7)(0); -- SPACE
                    -- SymShift handled elsewhere
                    keys(5)(6) <= spec_matrix(7)(2); -- M
                    keys(5)(5) <= spec_matrix(7)(3); -- N
                    keys(4)(6) <= spec_matrix(7)(4); -- B
                    keys(9)(1) <= spec_matrix(7)(5); -- LEFT
                    keys(9)(2) <= spec_matrix(7)(6); -- DOWN

                end if;
            end if;
        end if;
    end process;

    -- Beeb column scanning
    process(clock, reset_n)
    begin
        if reset_n = '0' then
            beeb_col <= (others => '0');
        elsif rising_edge(clock) then
            if keyb_en_n = '0' then
                -- If autoscan disabled then transfer current COLUMN to counter
                -- immediately (don't wait for next 1 MHz cycle)
                beeb_col <= unsigned(keyb_pa(3 downto 0));
            elsif keyb_1mhz = '1' then
                -- Otherwise increment the counter once per 1 MHz tick
                beeb_col <= beeb_col + 1;
            end if;
        end if;
    end process;

    -- Generate interrupt if any key in currently scanned column is pressed
    -- (apart from in row 0).  Output selected key status if autoscan disabled.
    process(keys, beeb_col, keyb_en_n, keyb_pa)
        variable k : std_logic_vector(7 downto 0);
    begin
        -- Shortcut to current key column
        k := keys(to_integer(beeb_col));

        -- Interrupt if any key pressed in rows 1 to 7.
        keyb_ca2 <= k(7) or k(6) or k(5) or k(4) or k(3) or k(2) or k(1);

        -- Determine which key is pressed
        -- Inhibit output during auto-scan
        if keyb_en_n = '0' then
            keyb_pa7 <= k(to_integer(unsigned(keyb_pa(6 downto 4))));
        else
            keyb_pa7 <= '0';
        end if;
    end process;


    -- Config
    spec_number_keys <=
        spec_matrix(4)(1) & -- 9
        spec_matrix(4)(2) & -- 8
        spec_matrix(4)(3) & -- 7
        spec_matrix(4)(4) & -- 6
        spec_matrix(3)(4) & -- 5
        spec_matrix(3)(3) & -- 4
        spec_matrix(3)(2) & -- 3
        spec_matrix(3)(1) & -- 2
        spec_matrix(3)(0) & -- 1
        spec_matrix(4)(0) ; -- 0

    key_gen : process(clock)
    begin
        -- Debounce counter is currently 20 bits, which is 21.8ms
        if rising_edge(clock) then
            debounce_ctr <= debounce_ctr + 1;
            if debounce_ctr = 0 then
                -- Sample the keys/buttons once per debounce period
                spec_number_keys_last <= spec_number_keys;
                btn_divmmc_n_last     <= btn_divmmc_n_i;
                btn_multiface_n_last  <= btn_multiface_n_i;
            end if;
            -- Edge detection on the number press
            spec_number_keys_last2 <= spec_number_keys_last;
            -- Assert green config for one cycle when green + (0-9) pressed
            if btn_divmmc_n_last <= '0' then
                green_config <= spec_number_keys_last and not(spec_number_keys_last2);
            else
                green_config <= (others => '0');
            end if;
            -- Assert yellow config for one cycle when yellow + (0-9) pressed
            if btn_multiface_n_last <= '0' then
                yellow_config <= spec_number_keys_last and not(spec_number_keys_last2);
            else
                yellow_config <= (others => '0');
            end if;
        end if;
    end process;

end architecture;
