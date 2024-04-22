library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use work.tube_comp_pack.all;

entity CoProSPI is
    port (

        -- Host
        h_clk        : in  std_logic;
        h_cs_b       : in  std_logic;
        h_rdnw       : in  std_logic;
        h_addr       : in  std_logic_vector(2 downto 0);
        h_data_in    : in  std_logic_vector(7 downto 0);
        h_data_out   : out std_logic_vector(7 downto 0);
        h_rst_b      : in  std_logic;
        h_irq_b      : out  std_logic;

        -- Parasite Clock (32 MHz)
        p_clk        : in  std_logic;

        -- SPI Slave
        p_spi_ssel   : in  std_logic;
        p_spi_sck    : in  std_logic;
        p_spi_mosi   : in  std_logic;
        p_spi_miso   : out std_logic;

        -- Interrupts/Control
        p_irq_b      : out std_logic;
        p_nmi_b      : out std_logic;
        p_rst_b      : out std_logic;

        -- Test signals for debugging
        test         : out std_logic_vector(7 downto 0)
    );
end;

architecture BEHAVIORAL of CoProSPI is

    -- SPI state is simply a counter for the 16 clock cycles in
    -- the SPI transaction
    signal spi_state     : integer range 0 to 15;

     -- Indicates the current transaction is valid
     signal valid         : std_logic;

    -- SPI data out shift register (MISO is bit 7 of this)
    signal spi_shifter : std_logic_vector (7 downto 0);

    -- Event passing from the SPI to Tube clock domain
    signal tube_go       : std_logic;
    signal tube_go1      : std_logic;
    signal tube_go2      : std_logic;

    -- Signals driving the tube chip
    signal p_rst_b_int   : std_logic;
    signal p_cs_b        : std_logic;
    signal p_rdnw        : std_logic;
    signal p_addr        : std_logic_vector (2 downto 0);
    signal p_data_in     : std_logic_vector (7 downto 0);
    signal p_data_out    : std_logic_vector (7 downto 0);

    -- Latched data out of the tube chip
    signal p_data_out_r : std_logic_vector (7 downto 0);

    -- Tube state is pretty simple as well
    type TUBE_STATE_TYPE is (
        IDLE,
        READ,
        WRITE
    );

    signal tube_state : TUBE_STATE_TYPE := IDLE;

begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_tube: tube port map (
        -- host
        h_addr          => h_addr,
        h_cs_b          => h_cs_b,
        h_data_in       => h_data_in,
        h_data_out      => h_data_out,
        h_phi2          => not h_clk,
        h_rdnw          => h_rdnw,
        h_rst_b         => h_rst_b,
        h_irq_b         => h_irq_b,
        -- parasite
        p_addr          => p_addr,
        p_cs_b          => p_cs_b,
        p_data_in       => p_data_in,
        p_data_out      => p_data_out,
        p_rdnw          => p_rdnw,
        p_phi2          => p_clk,
        p_rst_b         => p_rst_b_int,
        p_nmi_b         => p_nmi_b,
        p_irq_b         => p_irq_b
    );
    p_rst_b <= p_rst_b_int;

---------------------------------------------------------------------
-- State Machine Running from the SPI clock
---------------------------------------------------------------------

    process(p_spi_sck, p_spi_ssel)
    begin
        if p_spi_ssel = '1' then
            -- this can only be an asynchronous reset
            spi_state <= 0;
        else
            -- This works in Mode 0 only...
            -- MOSI should be sampled on the rising edge
            if rising_edge(p_spi_sck) then
                -- capture the important bits from the transaction
                case spi_state is
                    when 0 =>
                        -- Ignore commands where B7=0
                        valid <= p_spi_mosi;
                    when 1 =>
                        p_rdnw <= p_spi_mosi;
                    when 2 =>
                        p_addr(2) <= p_spi_mosi;
                    when 3 =>
                        p_addr(1) <= p_spi_mosi;
                    when 4 =>
                        p_addr(0) <= p_spi_mosi;
                        -- This is the earliest we can ask for a read request
                        if valid = '1' and p_rdnw = '1' then
                            -- An edge signifies the read request
                            tube_go <= not tube_go;
                        end if;
                    when 8 =>
                        p_data_in(7) <= p_spi_mosi;
                    when 9 =>
                        p_data_in(6) <= p_spi_mosi;
                    when 10 =>
                        p_data_in(5) <= p_spi_mosi;
                    when 11 =>
                        p_data_in(4) <= p_spi_mosi;
                    when 12 =>
                        p_data_in(3) <= p_spi_mosi;
                    when 13 =>
                        p_data_in(2) <= p_spi_mosi;
                    when 14 =>
                        p_data_in(1) <= p_spi_mosi;
                    when 15 =>
                        p_data_in(0) <= p_spi_mosi;
                        -- This is the earliest we can ask for a write request
                        if valid = '1' and p_rdnw = '0' then
                            -- An edge signifies the read request
                            tube_go <= not tube_go;
                        end if;
                    when others =>
                        null;
                end case;
            end if;
            -- This works in Mode 0 only...
            -- MISO should change on the falling edge
            -- For very high speeds (e.g. 32MHz) change this to rising_edge
            if falling_edge(p_spi_sck) then
                case spi_state is
                    when 7 =>
                        -- is it a valid read cycle?
                        if valid = '1' and p_rdnw = '1' then
                            -- load the shift register just in time...
                            spi_shifter <= p_data_out_r;
                        else
                            spi_shifter <= (others => '0');
                        end if;
                    when 8 to 14 =>
                        -- shift the shift register one place to the left
                        spi_shifter <= spi_shifter(6 downto 0) & '0';
                    when others =>
                        spi_shifter <= (others => '0');
                end case;
                -- for convenience, internal state also changes on this edge
                spi_state <= spi_state + 1;
            end if;
        end if;
    end process;

    -- MISO is simply the MS bit of the shift regster
    p_spi_miso <= spi_shifter(7);

---------------------------------------------------------------------
-- State Machine Running from the tube clock
---------------------------------------------------------------------

    process(p_clk)
    begin

        if rising_edge(p_clk) then
            -- Synchronize the tube go signal
            tube_go1 <= tube_go;
            tube_go2 <= tube_go1;

            if p_rst_b_int = '0' then
                tube_state <= IDLE;
                p_cs_b <= '1';
            else
                case tube_state is
                when IDLE =>
                    -- Wait for an edge on tube_go
                    if tube_go1 /= tube_go2 then
                        -- assert CS for on the next clock edge
                        p_cs_b <= '0';
                        if p_rdnw = '0' then
                            tube_state <= WRITE;
                        else
                            tube_state <= READ;
                        end if;
                    else
                        p_cs_b <= '1';
                    end if;

                -- Process write command
                when WRITE =>
                    -- deassert CS on the next clock edge
                    p_cs_b <= '1';
                    -- back to idle
                    tube_state <= IDLE;

                -- Process read command
                when READ =>
                    -- deassert CS on the next clock edge
                    p_cs_b <= '1';
                    -- latch the data read out of the tube chip
                    p_data_out_r <= p_data_out;
                    -- back to idle
                    tube_state <= IDLE;

                -- Should never get here
                when others =>
                    tube_state <= IDLE;
                end case;
            end if;
        end if;
    end process;

    test <= std_logic_vector(to_unsigned(spi_state, 4)) & p_cs_b & p_addr;

end BEHAVIORAL;
