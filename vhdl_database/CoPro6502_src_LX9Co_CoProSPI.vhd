library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoProSPI is
    port (
        -- GOP Signals
        fastclk      : in    std_logic;
        sw           : in    std_logic_vector(3 downto 0);
        
        -- Tube signals
        h_phi2       : in    std_logic;
        h_addr       : in    std_logic_vector(2 downto 0);
        h_data       : inout std_logic_vector(7 downto 0);
        h_rdnw       : in    std_logic;
        h_cs_b       : in    std_logic;
        h_rst_b      : in    std_logic;
        h_irq_b      : inout std_logic;

        -- Ram Signals
        ram_ub_b     : out   std_logic;
        ram_lb_b     : out   std_logic;
        ram_cs       : out   std_logic;
        ram_oe       : out   std_logic;
        ram_wr       : out   std_logic;
        ram_addr     : out   std_logic_vector (18 downto 0);
        ram_data     : inout std_logic_vector (7 downto 0);
        
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
        p_test       : out std_logic
        
    );
end LX9CoProSPI;

architecture BEHAVIORAL of LX9CoProSPI is

    signal h_data_in : std_logic_vector(7 downto 0);
    signal h_data_out : std_logic_vector(7 downto 0);
    signal spi_attached : std_logic := '0';
    signal h_rst_b1 : std_logic;
    signal h_rst_b2 : std_logic;
    signal h_rst_b3 : std_logic;
    signal h_phi2_b : std_logic;
    
begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_ICAP_config : entity work.ICAP_config port map (
        fastclk => fastclk,
        sw_in   => sw,
        sw_out  => open,
        h_addr  => h_addr,
        h_cs_b  => h_cs_b,
        h_data  => h_data,
        h_phi2  => h_phi2,
        h_rdnw  => h_rdnw,
        h_rst_b => h_rst_b 
    );
    
    h_phi2_b <= not h_phi2;

    inst_CoProSPI : entity work.CoProSPI port map (
        h_clk        => h_phi2_b,
        h_cs_b       => h_cs_b,
        h_rdnw       => h_rdnw,
        h_addr       => h_addr,
        h_data_in    => h_data_in,
        h_data_out   => h_data_out,
        h_rst_b      => h_rst_b,
        h_irq_b      => h_irq_b,

        -- Parasite Clock (32 MHz)
        p_clk        => fastclk,

        -- SPI Slave
        p_spi_ssel   => p_spi_ssel,
        p_spi_sck    => p_spi_sck,
        p_spi_mosi   => p_spi_mosi,
        p_spi_miso   => p_spi_miso,

        -- Interrupts/Control
        p_irq_b      => p_irq_b,
        p_nmi_b      => p_nmi_b,
        p_rst_b      => p_rst_b,

        -- Test signals for debugging
        test         => open
    );

    h_data_in <= h_data;
    h_data    <= h_data_out when spi_attached = '1' and h_cs_b = '0' and h_rdnw = '1' and h_phi2 = '1' else
                 x"FE"      when spi_attached = '0' and h_cs_b = '0' and h_rdnw = '1' and h_phi2 = '1' else
                 (others => 'Z');

--------------------------------------------------------
-- SPI / Null mode selection
--------------------------------------------------------

    process(fastclk)
    begin
        if rising_edge(fastclk) then
            h_rst_b1 <= h_rst_b;
            h_rst_b2 <= h_rst_b1;
            h_rst_b3 <= h_rst_b2;
            if h_rst_b3 = '0' and h_rst_b2 = '1' then
                spi_attached <= p_spi_ssel;
            end if;
        end if;
    end process;
    
--------------------------------------------------------
-- external Ram unused
--------------------------------------------------------
    ram_ub_b <= '1';
    ram_lb_b <= '1';
    ram_cs <= '1';
    ram_oe <= '1';
    ram_wr <= '1';
    ram_addr  <= (others => '1');
    ram_data  <= (others => '1');

--------------------------------------------------------
-- test signals
--------------------------------------------------------
    p_test <= spi_attached;

end BEHAVIORAL;


