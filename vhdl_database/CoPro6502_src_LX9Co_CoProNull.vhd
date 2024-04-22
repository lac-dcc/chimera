library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoProNull is
    port (
        -- GOP Signals
        fastclk   : in    std_logic;
        test      : inout std_logic_vector(8 downto 1);
        sw        : in    std_logic_vector(3 downto 0);
        
        -- Tube signals
        h_phi2    : in    std_logic;
        h_addr    : in    std_logic_vector(2 downto 0);
        h_data    : inout std_logic_vector(7 downto 0);
        h_rdnw    : in    std_logic;
        h_cs_b    : in    std_logic;
        h_rst_b   : in    std_logic;
        h_irq_b   : inout std_logic;

        -- Ram Signals
        ram_ub_b     : out   std_logic;
        ram_lb_b     : out   std_logic;
        ram_cs       : out   std_logic;
        ram_oe       : out   std_logic;
        ram_wr       : out   std_logic;
        ram_addr     : out   std_logic_vector (18 downto 0);
        ram_data     : inout std_logic_vector (7 downto 0)
    );
end LX9CoProNull;

architecture BEHAVIORAL of LX9CoProNull is

begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_ICAP_config : entity work.ICAP_config port map (
        fastclk => fastclk,
        test    => open,
        sw_in   => sw,
        sw_out  => open,
        h_addr  => h_addr,
        h_cs_b  => h_cs_b,
        h_data  => h_data,
        h_phi2  => h_phi2,
        h_rdnw  => h_rdnw,
        h_rst_b => h_rst_b        
    );
    
    h_data <= x"fe" when h_cs_b = '0' and h_rdnw = '1' and h_phi2 = '1' else (others => 'Z');
    h_irq_b <= 'Z';
    
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
    -- default to hi-impedence, to avoid conflicts with
    -- a Raspberry Pi connected to the test connector
    test <= (others => 'Z');

end BEHAVIORAL;


