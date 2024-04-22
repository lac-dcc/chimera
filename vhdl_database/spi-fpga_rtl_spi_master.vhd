--------------------------------------------------------------------------------
-- PROJECT: SPI MASTER AND SLAVE FOR FPGA
--------------------------------------------------------------------------------
-- AUTHORS: Jakub Cabal <jakubcabal@gmail.com>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/spi-fpga
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- THE SPI MASTER MODULE SUPPORT ONLY SPI MODE 0 (CPOL=0, CPHA=0)!!!

entity SPI_MASTER is
    Generic (
        CLK_FREQ    : natural := 50e6; -- set system clock frequency in Hz
        SCLK_FREQ   : natural := 5e6;  -- set SPI clock frequency in Hz (condition: SCLK_FREQ <= CLK_FREQ/10)
        WORD_SIZE   : natural := 8;    -- size of transfer word in bits, must be power of two
        SLAVE_COUNT : natural := 1     -- count of SPI slaves
    );
    Port (
        CLK      : in  std_logic; -- system clock
        RST      : in  std_logic; -- high active synchronous reset
        -- SPI MASTER INTERFACE
        SCLK     : out std_logic; -- SPI clock
        CS_N     : out std_logic_vector(SLAVE_COUNT-1 downto 0); -- SPI chip select, active in low
        MOSI     : out std_logic; -- SPI serial data from master to slave
        MISO     : in  std_logic; -- SPI serial data from slave to master
        -- INPUT USER INTERFACE
        DIN      : in  std_logic_vector(WORD_SIZE-1 downto 0); -- data for transmission to SPI slave
        DIN_ADDR : in  std_logic_vector(natural(ceil(log2(real(SLAVE_COUNT))))-1 downto 0); -- SPI slave address
        DIN_LAST : in  std_logic; -- when DIN_LAST = 1, last data word, after transmit will be asserted CS_N
        DIN_VLD  : in  std_logic; -- when DIN_VLD = 1, data for transmission are valid
        DIN_RDY  : out std_logic; -- when DIN_RDY = 1, SPI master is ready to accept valid data for transmission
        -- OUTPUT USER INTERFACE
        DOUT     : out std_logic_vector(WORD_SIZE-1 downto 0); -- received data from SPI slave
        DOUT_VLD : out std_logic  -- when DOUT_VLD = 1, received data are valid
    );
end entity;

architecture RTL of SPI_MASTER is

    constant DIVIDER_VALUE : natural := (CLK_FREQ/SCLK_FREQ)/2;
    constant WIDTH_CLK_CNT : natural := natural(ceil(log2(real(DIVIDER_VALUE))));
    constant WIDTH_ADDR    : natural := natural(ceil(log2(real(SLAVE_COUNT))));
    constant BIT_CNT_WIDTH : natural := natural(ceil(log2(real(WORD_SIZE))));

    type state_t is (idle, first_edge, second_edge, transmit_end, transmit_gap);

    signal addr_reg        : unsigned(WIDTH_ADDR-1 downto 0);
    signal sys_clk_cnt     : unsigned(WIDTH_CLK_CNT-1 downto 0);
    signal sys_clk_cnt_max : std_logic;
    signal spi_clk         : std_logic;
    signal spi_clk_rst     : std_logic;
    signal din_last_reg_n  : std_logic;
    signal first_edge_en   : std_logic;
    signal second_edge_en  : std_logic;
    signal chip_select_n   : std_logic;
    signal load_data       : std_logic;
    signal miso_reg        : std_logic;
    signal shreg           : std_logic_vector(WORD_SIZE-1 downto 0);
    signal bit_cnt         : unsigned(BIT_CNT_WIDTH-1 downto 0);
    signal bit_cnt_max     : std_logic;
    signal rx_data_vld     : std_logic;
    signal master_ready    : std_logic;
    signal present_state   : state_t;
    signal next_state      : state_t;

begin

    ASSERT (DIVIDER_VALUE >= 5) REPORT "condition: SCLK_FREQ <= CLK_FREQ/10" SEVERITY ERROR;

    load_data <= master_ready and DIN_VLD;
    DIN_RDY   <= master_ready;
    
    -- -------------------------------------------------------------------------
    --  SYSTEM CLOCK COUNTER
    -- -------------------------------------------------------------------------

    sys_clk_cnt_max <= '1' when (to_integer(sys_clk_cnt) = DIVIDER_VALUE-1) else '0';

    sys_clk_cnt_reg_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1' or sys_clk_cnt_max = '1') then
                sys_clk_cnt <= (others => '0');
            else
                sys_clk_cnt <= sys_clk_cnt + 1;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    --  SPI CLOCK GENERATOR AND REGISTER
    -- -------------------------------------------------------------------------

    spi_clk_gen_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1' or spi_clk_rst = '1') then
                spi_clk <= '0';
            elsif (sys_clk_cnt_max = '1') then
                spi_clk <= not spi_clk;
            end if;
        end if;
    end process;

    SCLK <= spi_clk;

    -- -------------------------------------------------------------------------
    --  BIT COUNTER
    -- -------------------------------------------------------------------------

    bit_cnt_max <= '1' when (bit_cnt = WORD_SIZE-1) else '0';

    bit_cnt_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1' or spi_clk_rst = '1') then
                bit_cnt <= (others => '0');
            elsif (second_edge_en = '1') then
                bit_cnt <= bit_cnt + 1;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    --  SPI MASTER ADDRESSING
    -- -------------------------------------------------------------------------

    addr_reg_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                addr_reg <= (others => '0');
            elsif (load_data = '1') then
                addr_reg <= unsigned(DIN_ADDR);
            end if;
        end if;
    end process;

    one_slave_g: if (SLAVE_COUNT = 1) generate
        CS_N(0) <= chip_select_n;
    end generate;

    more_slaves_g: if (SLAVE_COUNT > 1) generate
        cs_n_g : for i in 0 to SLAVE_COUNT-1 generate
            cs_n_p : process (addr_reg, chip_select_n)
            begin
                if (addr_reg = i) then
                    CS_N(i) <= chip_select_n;
                else
                    CS_N(i) <= '1';
                end if;
            end process;
        end generate;
    end generate;

    -- -------------------------------------------------------------------------
    --  DIN LAST RESISTER
    -- -------------------------------------------------------------------------

    din_last_reg_n_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                din_last_reg_n <= '0';
            elsif (load_data = '1') then
                din_last_reg_n <= not DIN_LAST;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    --  MISO SAMPLE REGISTER
    -- -------------------------------------------------------------------------

    miso_reg_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (first_edge_en = '1') then
                miso_reg <= MISO;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    --  DATA SHIFT REGISTER
    -- -------------------------------------------------------------------------

    shreg_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (load_data = '1') then
                shreg <= DIN;
            elsif (second_edge_en = '1') then
                shreg <= shreg(WORD_SIZE-2 downto 0) & miso_reg;
            end if;
        end if;
    end process;

    DOUT <= shreg;
    MOSI <= shreg(WORD_SIZE-1);
    
    -- -------------------------------------------------------------------------
    --  DATA OUT VALID RESISTER
    -- -------------------------------------------------------------------------

    dout_vld_reg_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                DOUT_VLD <= '0';
            else
                DOUT_VLD <= rx_data_vld;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    --  SPI MASTER FSM
    -- -------------------------------------------------------------------------

    -- PRESENT STATE REGISTER
    fsm_present_state_p : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                present_state <= idle;
            else
                present_state <= next_state;
            end if;
        end if;
    end process;

    -- NEXT STATE LOGIC
    fsm_next_state_p : process (present_state, DIN_VLD, sys_clk_cnt_max,
                                bit_cnt_max)
    begin
        case present_state is
            when idle =>
                if (DIN_VLD = '1') then
                    next_state <= first_edge;
                else
                    next_state <= idle;
                end if;
            
            when first_edge =>
                if (sys_clk_cnt_max = '1') then
                    next_state <= second_edge;
                else
                    next_state <= first_edge;
                end if;

            when second_edge =>
                if (sys_clk_cnt_max = '1') then
                    if (bit_cnt_max = '1') then
                        next_state <= transmit_end;
                    else
                        next_state <= first_edge;
                    end if;
                else
                    next_state <= second_edge;
                end if;

            when transmit_end =>
                if (sys_clk_cnt_max = '1') then
                    next_state <= transmit_gap;
                else
                    next_state <= transmit_end;
                end if;

            when transmit_gap =>
                if (sys_clk_cnt_max = '1') then
                    next_state <= idle;
                else
                    next_state <= transmit_gap;
                end if;

            when others =>
                next_state <= idle;
        end case;
    end process;

    -- OUTPUTS LOGIC
    fsm_outputs_p : process (present_state, din_last_reg_n, sys_clk_cnt_max)
    begin
        case present_state is
            when idle =>
                master_ready   <= '1';
                chip_select_n  <= not din_last_reg_n;
                spi_clk_rst    <= '1';
                first_edge_en  <= '0';
                second_edge_en <= '0';
                rx_data_vld    <= '0';

            when first_edge =>
                master_ready   <= '0';
                chip_select_n  <= '0';
                spi_clk_rst    <= '0';
                first_edge_en  <= sys_clk_cnt_max;
                second_edge_en <= '0';
                rx_data_vld    <= '0';

            when second_edge =>
                master_ready   <= '0';
                chip_select_n  <= '0';
                spi_clk_rst    <= '0';
                first_edge_en  <= '0';
                second_edge_en <= sys_clk_cnt_max;
                rx_data_vld    <= '0';

            when transmit_end =>
                master_ready   <= '0';
                chip_select_n  <= '0';
                spi_clk_rst    <= '1';
                first_edge_en  <= '0';
                second_edge_en <= '0';
                rx_data_vld    <= sys_clk_cnt_max;

            when transmit_gap =>
                master_ready   <= '0';
                chip_select_n  <= not din_last_reg_n;
                spi_clk_rst    <= '1';
                first_edge_en  <= '0';
                second_edge_en <= '0';
                rx_data_vld    <= '0';

            when others =>
                master_ready   <= '0';
                chip_select_n  <= not din_last_reg_n;
                spi_clk_rst    <= '1';
                first_edge_en  <= '0';
                second_edge_en <= '0';
                rx_data_vld    <= '0';
        end case;
    end process;

end architecture;
