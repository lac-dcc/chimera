library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;

-- FLASH SPI driver
-- Internal Interface:
--   flash_clk      driver clock
--   flash_clken    driver clock enable (cannot be enabled every cycle)
--   flash_init     active high to init FLASH address and read one byte
--   flash_addr     FLASH address to read byte from
--   flash_data     byte read from FLASH chip
--   flash_done     active high to indicate read of first byte complete
--                          after this, a new byte is available every 8 clock cycles
-- External Interface:
--   U_FLASH_CK     FLASH chip clock pin
--   U_FLASH_CS     FLASH chip select active low
--   U_FLASH_SI     FLASH chip serial input pin
--   U_FLASH_SO     FLASH chip serial output pin

-- A flash cycle consists of sending out the high speed read command 0x0B
-- followed by a 24 bit address, an 8 bit dummy byte then reading a byte
-- from the FLASH.
--
-- You could then maintain chip select active and continue to clock the
-- FLASH and keep reading bytes from it, as it auto increments the address,
-- or end the cycle by deactivating chip select and a whole new read cycle
-- must be started again
--
-- Data is clocked out from the FPGA and FLASH on the flash_clken1 clock edge
-- Data is latched into the FPGA and FLASH on the flash_clken clock edge.

entity spi_flash is
    generic (
        IncludeInitState : boolean := false
    );
    port (
        -- internal interface
        flash_clk   : in  std_logic := '0';
        flash_clken : in  std_logic := '0';
        flash_init  : in  std_logic := '0';
        flash_addr  : in  std_logic_vector (23 downto 0) := (others => '0');
        flash_data  : out std_logic_vector ( 7 downto 0) := (others => '0');
        flash_done  : out std_logic := '1';
        -- external interface
        U_FLASH_CK  : out std_logic;
        U_FLASH_CS  : out std_logic;
        U_FLASH_SI  : out std_logic;
        U_FLASH_SO  : in  std_logic
    );
end spi_flash;

architecture RTL of spi_flash is
    signal flash_clken1 : std_logic;
    signal shift        : std_logic_vector(7 downto 0) := (others => '0');
    signal shift_in     : std_logic_vector(7 downto 0) := (others => '0');
    signal counter      : std_logic_vector(2 downto 0) := (others => '0');
    signal spi_ck_en    : std_logic := '0';
    signal spi_nce      : std_logic := '1';
    type   SPI_STATE_TYPE is
                (START, IDLE, TX_CMD, TX_AH, TX_AM, TX_AL, TX_DUMMY1, RX_DATA, INIT);
    signal spi_state, next_spi_state : SPI_STATE_TYPE;

begin
    U_FLASH_CK <= flash_clken1 and spi_ck_en;               -- FLASH clock
    U_FLASH_CS <= spi_nce;                                  -- active low FLASH chip select/chip enable
    U_FLASH_SI <= shift(7);                                 -- MSB output to spi

    -- advance state machine from state to state
    run_sm : process (flash_clk, flash_init)
    begin
        if rising_edge(flash_clk) then
            flash_clken1 <= flash_clken;
            if (flash_clken = '1') then
                if (flash_init = '0') then
                    spi_state <= IDLE;                      -- Initial state
                else
                    spi_state <= next_spi_state;            -- next state
                end if;
            end if;
        end if;
    end process;

    -- state machine clocks data out to FLASH on alternate clock cycles
    process(flash_clk)
    begin
        if rising_edge(flash_clk) then
            if flash_clken1 = '1' then
                case spi_state is
                    when IDLE =>                                       -- idle state
                        spi_ck_en <= '0';                              -- Stop clock to FLASH
                        spi_nce <= '1';                                -- Deselect FLASH
                        flash_done <= '1';                             -- FLASH comms done
                        if flash_init = '1' then
                            if includeInitState then                   -- The Puya P25Q32HS on the Tang Nano 9K
                                next_spi_state <= INIT;                -- seems more reliable if the command is
                            else                                       -- preceeded by a clock cycle with CS
                                next_spi_state <= START;               -- high. No idea why this is!
                            end if;
                        end if;
                    when INIT =>                                       -- init state
                        spi_ck_en <= '1';                              -- enable FLASH clock while CS still high
                        next_spi_state <= START;                       -- select next state
                    when START =>                                      -- start state
                        shift <= x"0b";                                -- High Speed Read command
                        flash_done <= '0';                             -- FLASH comms not done
                        spi_ck_en <= '1';                              -- enable FLASH clock
                        spi_nce <= '0';                                -- Select FLASH
                        counter <= "000";                              -- reset counter
                        next_spi_state <= TX_CMD;                      -- select next state
                    when TX_CMD =>                                     -- sends 8 bit command
                        counter <= counter + 1;                        -- count to next bit
                        shift <= shift(6 downto 0) & '1';              -- shift other bits left
                        if counter = "111" then
                            shift <= flash_addr(23 downto 16);         -- load high address to shifter
                            next_spi_state <= TX_AH;                   -- select next state
                        end if;
                    when TX_AH =>                                      -- sends high address bits 23-16
                        counter <= counter + 1;                        -- count to next bit
                        shift <= shift(6 downto 0) & '1';              -- shift other bits left
                        if counter = "111" then
                            shift <= flash_addr(15 downto 8);          -- load middle address to shifter
                            next_spi_state <= TX_AM;                   -- select next state
                        end if;
                    when TX_AM =>                                      -- sends middle address bits 15-8
                        counter <= counter + 1;                        -- count to next bit
                        shift <= shift(6 downto 0) & '1';              -- shift other bits left
                        if counter = "111" then
                            shift <= flash_addr(7 downto 0);           -- load low address to shifter
                            next_spi_state <= TX_AL;                   -- select next state
                        end if;
                    when TX_AL =>                                      -- sends low address bits 7-0
                        counter <= counter + 1;                        -- count to next bit
                        shift <= shift(6 downto 0) & '1';              -- shift other bits left
                        if counter = "111" then
                            shift <= x"ff";                            -- load dummy to shifter
                            next_spi_state <= TX_DUMMY1;               -- select next state
                        end if;
                    when TX_DUMMY1 =>                                  -- sends dummy byte
                        counter <= counter + 1;                        -- count to next bit
                        shift <= shift(6 downto 0) & '1';              -- shift other bits left
                        if counter = "111" then
                            shift <= x"ff";                            -- load dummy to shifter
                            flash_done <= '1';                         -- FLASH init done
                            next_spi_state <= RX_DATA;                 -- select next state
                        end if;
                    when RX_DATA =>                                    -- reads byte from FLASH
                        counter <= counter + 1;                        -- count to next bit
                        shift_in <= shift_in(6 downto 0) & U_FLASH_SO; -- shift other bits left
                        if flash_init = '0' then
                            next_spi_state <= IDLE;                    -- on init signal move to INIT state
                        elsif counter = "000" then
                            flash_data <= shift_in;                    -- move byte to data bus
                            next_spi_state <= RX_DATA;                 -- stay in this state indefinitely
                        end if;
                    when others =>                                     -- default
                        next_spi_state <= IDLE;
                end case;
            end if;
        end if;
    end process;

end RTL;
