--------------------------------------------------------------------------------
-- Copyright (c) 2015 David Banks
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : bootstrap.vhd
-- /___/   /\     Timestamp : 28/07/2015
-- \   \  /  \
--  \___\/\___\
--
--Design Name: bootstrap
--Device: Spartan6 LX9

-- DB: tweaked for new A_stb and WE_long RAM control signals

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity bootstrap is
    port (
        clock           : in    std_logic;

        -- initiate bootstrap
        powerup_reset_n : in    std_logic;

        -- high when FLASH is being copied to SRAM, can be used by user as active high reset
        bootstrap_busy  : out   std_logic;

        -- start address of user data in FLASH
        user_address    : in std_logic_vector(23 downto 0);

        -- length user data in flash
        user_length    : std_logic_vector(23 downto 0) := x"040000";

        -- map of where in the SRAM to write each successive ROM chunk
        user_rom_map    : in std_logic_vector(63 downto 0) := x"FEDCBA9876543210";

        -- interface from design
        RAM_A_stb       : in   std_logic;
        RAM_nOE         : in   std_logic;
        RAM_nWE         : in   std_logic;
        RAM_nWE_long    : in   std_logic;
        RAM_nCS         : in   std_logic;
        RAM_A           : in   std_logic_vector (18 downto 0);
        RAM_Din         : in   std_logic_vector (7 downto 0);
        RAM_Dout        : out  std_logic_vector (7 downto 0);

        -- interface to external SRAM
        SRAM_A_stb      : out   std_logic;
        SRAM_nOE        : out   std_logic;
        SRAM_nWE        : out   std_logic;
        SRAM_nWE_long   : out   std_logic;
        SRAM_nCS        : out   std_logic;
        SRAM_A          : out   std_logic_vector (18 downto 0);
        SRAM_D_in       : in    std_logic_vector (7 downto 0);
        SRAM_D_out      : out   std_logic_vector (7 downto 0);

        -- interface to external FLASH
        FLASH_CS       : out   std_logic; -- Active low FLASH chip select
        FLASH_SI       : out   std_logic; -- Serial output to FLASH chip SI pin
        FLASH_CK       : out   std_logic; -- FLASH clock
        FLASH_SO       : in    std_logic  -- Serial input from FLASH chip SO pin
     );
end;

architecture behavioral of bootstrap is

-- the inverted clock
signal clock_n          : std_logic;

-- an internal clock enable, avoiding gated clocks
signal clock_en         : std_logic := '0';

-- internal signals for SRAM interface
signal SRAM_Din         : std_logic_vector (7 downto 0);
signal SRAM_nDOE        : std_logic_vector (7 downto 0);
signal SRAM_nWE_int     : std_logic;

--
-- bootstrap signals
--
signal flash_init       : std_logic;     -- when low places FLASH driver in init state
signal flash_Done       : std_logic;     -- FLASH init finished when high
signal flash_data       : std_logic_vector(7 downto 0);

-- bootstrap control of SRAM, these signals connect to SRAM when boostrap_busy = '1'
signal bs_A_stb         : std_logic;
signal bs_A             : std_logic_vector(18 downto 0);
signal bs_A_mapped      : std_logic_vector(3 downto 0);
signal bs_Din           : std_logic_vector(7 downto 0);
signal bs_nCS           : std_logic;
signal bs_nWE           : std_logic;
signal bs_nWE_long      : std_logic;
signal bs_nOE           : std_logic;

signal bs_busy          : std_logic;

-- for bootstrap state machine
type    BS_STATE_TYPE is (
            INIT, START_READ_FLASH, READ_FLASH, FLASH0, FLASH1, FLASH2, FLASH3, FLASH4, FLASH5, FLASH6, FLASH7,
            WAIT0, WAIT1, WAIT2, WAIT3, WAIT4, WAIT5, WAIT6, WAIT7, WAIT8, WAIT9, WAIT10, WAIT11,
            ZERO0, ZERO1, ZERO2, ZERO3, ZERO4, ZERO5, ZERO6, ZERO7
        );

signal bs_state : BS_STATE_TYPE := INIT;

begin

    bootstrap_busy      <= bs_busy;

--------------------------------------------------------
-- SRAM Multiplexor
--------------------------------------------------------

    SRAM_D_out          <= bs_Din when bs_busy = '1' else RAM_Din;

    SRAM_A_stb          <= bs_A_stb when bs_busy = '1' else RAM_A_stb;
    SRAM_A(18 downto 0) <= (bs_A(18) & bs_A_mapped & bs_A(13 downto 0))  when bs_busy = '1' else RAM_A;

    SRAM_nCS            <= bs_nCS when bs_busy = '1' else RAM_nCS;

    SRAM_nOE            <= bs_nOE when bs_busy = '1' else RAM_nOE;

--------------------------------------------------------
-- Non-Gated SRAM RAM WE and Dout tristate controls
--------------------------------------------------------

    SRAM_nWE_int        <= bs_nWE when bs_busy = '1' else RAM_nWE;
    SRAM_nWE            <= SRAM_nWE_int;
    SRAM_nWE_long       <= bs_nWE_long when bs_busy = '1' else RAM_nWE_long;

    RAM_Dout            <= SRAM_D_in;

--------------------------------------------------------
-- Generate a gated RAM WE and Dout tristate controls
--------------------------------------------------------

--    clock_n <= not clock;
--
--    -- The point of all this is to avoid conflicts with the SRAM
--    -- where the data bus changes direction
--
--    -- On the falling edge of clock_32, SRAM_nWE goes low if SRAM_nWE_int is low
--    -- On the rising edhe of clock_32,  SRAM_nWE goes high again
--
--    SRAM_nWE_int <= bs_nWE when bs_busy = '1' else RAM_nWE;
--
--    rx_clk_ddr : ODDR2
--    port map (
--        Q  => SRAM_nWE,
--        C0 => clock_n,
--        C1 => clock,
--        CE => '1',
--        D0 => SRAM_nWE_int,
--        D1 => '1',
--        R  => '0',
--        S  => '0'
--    );
--
--    gen_sram_data_io: for i in 0 to 7 generate
--        -- replicate the ODDR2 for each data bit, because of limited routing
--        oddr2x : ODDR2
--        port map (
--            Q  => SRAM_nDOE(i),
--            C0 => clock_n,
--            C1 => clock,
--            CE => '1',
--            D0 => SRAM_nWE_int,
--            D1 => '1',
--            R  => '0',
--            S  => '0'
--        );
--        -- the active low tristate connects directly to the IOBUFT in the same IOB
--        iobufx : IOBUF
--        generic map (
--            DRIVE => 8
--        )
--        port map (
--            O  => RAM_Dout(i),
--            I  => SRAM_Din(i),
--            IO => SRAM_D(i),
--            T  => SRAM_nDOE(i)
--        );
--   end generate;

--------------------------------------------------------
-- Bootstrap SRAM from SPI FLASH
--------------------------------------------------------

    -- flash clock enable toggles on alternate cycles
    process(clock)
    begin
        if rising_edge(clock) then
            clock_en <= not clock_en;
        end if;
    end process;

    -- bootstrap state machine
    state_bootstrap : process(clock, powerup_reset_n)
        begin
            if powerup_reset_n = '0' then                         -- external reset pin
                bs_state <= INIT;                                 -- move state machine to INIT state
            elsif rising_edge(clock) then
                bs_A_stb <= '0';
                if clock_en = '1' then
                    case bs_state is
                        when INIT =>
                            bs_busy <= '1';                       -- indicate bootstrap in progress (holds user in reset)
                            flash_init <= '0';                    -- signal FLASH to begin init
                            bs_A   <= (others => '1');            -- SRAM address all ones (becomes zero on first increment)
                            bs_nCS <= '0';                        -- SRAM always selected during bootstrap
                            bs_nOE <= '1';                        -- SRAM output disabled during bootstrap
                            bs_nWE <= '1';                        -- SRAM write enable inactive default state
                            bs_Din <= x"00";                      -- place byte on SRAM data bus
                            bs_state <= ZERO0;
                            -- Zero the 256K of RAM that is being used for ROMs, so that when chanimg
                            -- from master mode (full) to beeb mode (minimal), the beeb doesn't see old master ROMs
                        when ZERO0 =>
                            bs_A <= bs_A + 1;
                            bs_state <= ZERO1;
                        when ZERO1 =>
                            bs_A_mapped <= bs_A(17 downto 14);
                            bs_A_stb <= '1';
                            bs_nWE_long <= '0';
                            bs_state <= ZERO2;
                        when ZERO2 =>
                            bs_state <= ZERO3;
                        when ZERO3 =>
                            bs_nWE <= '0';
                            bs_state <= ZERO4;
                        when ZERO4 =>
                            bs_state <= ZERO5;
                        when ZERO5 =>
                            bs_state <= ZERO6;
                        when ZERO6 =>
                            bs_nWE <= '1';
                            bs_nWE_long <= '1';
                            bs_state <= ZERO7;
                        when ZERO7 =>
                            if bs_A(18) = '0' then
                                bs_state <= ZERO0;
                            else
                                flash_init <= '0';                    -- signal FLASH to begin init
                                bs_A   <= (others => '1');            -- SRAM address all ones (becomes zero on first increment)
                                bs_state <= START_READ_FLASH;
                            end if;
                        when START_READ_FLASH =>
                            flash_init <= '1';                    -- allow FLASH to exit init state
                            if flash_Done = '0' then              -- wait for FLASH init to begin
                                bs_state <= READ_FLASH;
                            end if;
                        when READ_FLASH =>
                            if flash_Done = '1' then              -- wait for FLASH init to complete
                                bs_state <= WAIT0;
                            end if;
                        when WAIT0 =>                             -- wait for the first FLASH byte to be available
                            bs_state <= WAIT1;
                        when WAIT1 =>
                            bs_state <= WAIT2;
                        when WAIT2 =>
                            bs_state <= WAIT3;
                        when WAIT3 =>
                            bs_state <= WAIT4;
                        when WAIT4 =>
                            bs_state <= WAIT5;
                        when WAIT5 =>
                            bs_state <= WAIT6;
                        when WAIT6 =>
                            bs_state <= WAIT7;
                        when WAIT7 =>
                            bs_state <= WAIT8;
                        when WAIT8 =>
--                          bs_state <= WAIT9;
--                      when WAIT9 =>
--                          bs_state <= WAIT10;
--                      when WAIT10 =>
--                          bs_state <= WAIT11;
--                      when WAIT11 =>
                            bs_state <= FLASH0;
                        -- every 8 clock cycles (32M/8 = 2Mhz) we have a new byte from FLASH
                        -- use this ample time to write it to SRAM, we just have to toggle nWE
                        when FLASH0 =>
                            bs_A <= bs_A + 1;                     -- increment SRAM address
                            bs_state <= FLASH1;                   -- idle
                        when FLASH1 =>
                            bs_A_mapped <= user_rom_map(to_integer(unsigned(bs_A(17 downto 14))) * 4 + 3 downto to_integer(unsigned(bs_A(17 downto 14))) * 4);
                            bs_A_stb <= '1';
                            bs_nWE_long <= '0';
                            bs_Din( 7 downto 0) <= flash_data;    -- place byte on SRAM data bus
                            bs_state <= FLASH2;                   -- idle
                        when FLASH2 =>
                            bs_state <= FLASH3;
                        when FLASH3 =>
                            bs_nWE <= '0';                        -- SRAM write enable
                            bs_state <= FLASH4;                   -- idle
                        when FLASH4 =>
                            bs_state <= FLASH5;                   -- idle
                        when FLASH5 =>
                            bs_state <= FLASH6;                   -- idle
                        when FLASH6 =>
                            bs_nWE <= '1';                        -- SRAM write disable
                            bs_nWE_long <= '1';
                            bs_state <= FLASH7;
                        when FLASH7 =>
                            if "000" & bs_A = user_length then    -- when we've reached end address
                                bs_busy <= '0';                   -- indicate bootsrap is done
                                flash_init <= '0';                -- place FLASH in init state
                                bs_state <= FLASH7;               -- remain in this state until reset
                            else
                                bs_state <= FLASH0;               -- else loop back
                            end if;
                        when others =>                            -- catch all, never reached
                            bs_state <= INIT;
                    end case;
                end if;
            end if;
        end process;

    -- FLASH chip SPI driver
    u_flash : entity work.spi_flash
    generic map (
        IncludeInitState => true
    )
    port map (
        flash_clk   => clock,
        flash_clken => clock_en,
        flash_init  => flash_init,
        flash_addr  => user_address,
        flash_data  => flash_data,
        flash_Done  => flash_Done,
        U_FLASH_CK  => FLASH_CK,
        U_FLASH_CS  => FLASH_CS,
        U_FLASH_SI  => FLASH_SI,
        U_FLASH_SO  => FLASH_SO
    );

end behavioral;
