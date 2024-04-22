library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity retimer is
    generic (
        WIDTH     : integer
    );
    port (

        -- input video interface
        --
        -- This will be running at 24MHz with 32us lines (h_total of 768)
        --
        clk_in    : in  std_logic;
        clken_in  : in  std_logic;
        hs_in     : in  std_logic;
        vs_in     : in  std_logic;
        r_in      : in  std_logic_vector(WIDTH - 1 downto 0);
        g_in      : in  std_logic_vector(WIDTH - 1 downto 0);
        b_in      : in  std_logic_vector(WIDTH - 1 downto 0);

        -- output video interface
        --
        -- This will be running at 27MHz with 32us lines (h_total of 864)
        --
        clk_out   : in  std_logic;
        clken_out : in  std_logic;
        hs_out    : out std_logic;
        vs_out    : out std_logic;
        r_out     : out std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
        g_out     : out std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
        b_out     : out std_logic_vector(WIDTH - 1 downto 0) := (others => '0')

    );
end entity;

architecture rtl of retimer is


    -- Using the trailing (0->1) edge of hsync as a timing reference
    --
    -- According to the BBC Advanced User Guide, the timings for Mode 7 are
    --
    --     Mode 7     Mode 6
    -- R0: 0x3F       0x3F      (H Total - 1     )
    -- R1: 0x28       0x28      (H Displayed     )
    -- R2: 0x33       0x31      (H Sync Position )
    -- R3: 0x24       0x24      (H Sync Width    )
    --
    -- (I've verified these values are correct for both the OS1.20 and OS3.20)
    --
    -- This in theory gives:
    --           Mode 7   Mode 6
    --    line   40.0us   40.0us
    --    fp     11.0us    9.0us
    --    sync    4.0us    4.0us
    --    bp      9.0us   11.0us
    --
    -- However, when measuring a real Beeb, the back porch was longer
    --   Mode 6: 12.046us
    --   Mode 7: 13.200us
    --
    -- For this Mode 7 retimer, I've picked 11us, which results in a
    -- perfectly centred imaged. Because we are using the SAA5050 in
    -- VGA mode, this value halves to 5.5us.
    --
    -- Input Beeb timings (Mode 7 VGA mode)
    --                 24MHz
    -- bp      5.5us   132
    -- line   20.0us   480
    -- fp      4.5us   108
    -- sync    2.0us    48
    --                 ---
    --                 768

    constant BACK_PORCH           : integer := 132;
    constant DISPLAYED            : integer := 480;

    -- The visible part of the line is written into memory at 132->612
    --
    -- To allow some margin for error, we add 2.0us (48) to each side of this,
    -- which gives 84-660. Any pixels read outside of these are deemed black.

    constant OVERSCAN             : integer := 48;
    constant ACTIVE_DISPLAY_START : integer := BACK_PORCH - OVERSCAN;
    constant ACTIVE_DISPLAY_END   : integer := BACK_PORCH + DISPLAYED + OVERSCAN;

    -- Output HDMI timings at 720x576p the timings are:
    --                 27MHz
    -- fp               68
    -- line            720 (120+480+120)
    -- bp               12
    -- sync             64
    --                 ---
    --                 864
    --
    -- To correctly centre the 480 sampled pixels in 720 pixel wide display,
    -- an offset of 120 + 68 - 132 = 56 clocks is required.
    --
    -- So we pre-load the addr_out counter with 1024-56 = 968

    constant OUTPUT_OFFSET        : integer := 1024 - 56;

    type ram_type is array (2047 downto 0) of std_logic_vector (WIDTH * 3 - 1 downto 0);

    signal line_buffer : ram_type := (others => (others => '0'));
    signal addr_in     : std_logic_vector(9 downto 0) := (others => '0');
    signal addr_out    : std_logic_vector(9 downto 0);
    signal hs_in1      : std_logic := '0';
    signal bank        : std_logic := '0';
    signal hs_out1     : std_logic := '0';
    signal hs_out2     : std_logic := '0';
    signal vs_out1     : std_logic := '0';
    signal vs_out2     : std_logic := '0';
    signal rgb_out     : std_logic_vector (WIDTH * 3 - 1 downto 0) := (others => '0');

begin

    -- Input process
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if clken_in = '1' then
                hs_in1 <= hs_in;
                if hs_in1 = '0' and hs_in = '1' then
                    -- trailing edge of hsync
                    addr_in <= (others => '0');
                    bank <= not bank;
                else
                    addr_in <= addr_in + 1;
                end if;

                -- Write to RAM
                line_buffer(conv_integer(bank & addr_in)) <= r_in & g_in & b_in;

            end if;
        end if;
    end process;

    -- Output process
    process(clk_out)
    begin
        if rising_edge(clk_out) then
            if clken_out = '1' then
                hs_out1 <= hs_in;
                hs_out2 <= hs_out1;
                vs_out1 <= vs_in;
                vs_out2 <= vs_out1;
                if hs_out2 = '0' and hs_out1 = '1' then
                    -- trailing edge of hsync, offset as calculated above
                    addr_out <= std_logic_vector(to_unsigned(OUTPUT_OFFSET, 10));
                else
                    addr_out <= addr_out + 1;
                end if;

                rgb_out <= line_buffer(conv_integer((not bank) & addr_out));

                if addr_out >= ACTIVE_DISPLAY_START and addr_out < ACTIVE_DISPLAY_END then
                    r_out <= rgb_out(WIDTH * 3 - 1 downto WIDTH * 2);
                    g_out <= rgb_out(WIDTH * 2 - 1 downto WIDTH * 1);
                    b_out <= rgb_out(WIDTH * 1 - 1 downto WIDTH * 0);
                else
                    r_out <= (others => '0');
                    g_out <= (others => '0');
                    b_out <= (others => '0');
                end if;

            end if;
        end if;
    end process;


    -- pass vsync through synchronised version of vs and hs
    vs_out <= vs_out2;
    hs_out <= hs_out2;


end architecture;
