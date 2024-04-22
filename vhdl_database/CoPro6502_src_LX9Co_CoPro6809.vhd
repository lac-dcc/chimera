library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoPro6809 is
    port (
        -- GOP Signals
        fastclk   : in    std_logic;
        test      : inout std_logic_vector(8 downto 1);
        sw        : in    std_logic_vector(3 downto 0);
        
        -- Tube signals (use 16 out of 22 DIL pins)
        h_phi2    : in    std_logic;  -- 1,2,12,21,23 are global clocks
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
end LX9CoPro6809;

architecture BEHAVIORAL of LX9CoPro6809 is
 
-------------------------------------------------
-- clock and reset signals
-------------------------------------------------

    signal cpu_clk       : std_logic;
    signal cpu_clken     : std_logic;
    signal clken_counter : std_logic_vector (1 downto 0);
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal RSTn_sync     : std_logic;
    signal bs            : std_logic;
    signal ba            : std_logic;
    signal vma           : std_logic;
    signal ifetch        : std_logic;
    signal opfetch       : std_logic;

-------------------------------------------------
-- parasite signals
-------------------------------------------------
    
    signal p_cs_b        : std_logic;
    signal tube_cs_b     : std_logic;
    signal p_data_out    : std_logic_vector (7 downto 0);

-------------------------------------------------
-- ram/rom signals
-------------------------------------------------

    signal ram_cs_b        : std_logic;
    signal ram_oe_int      : std_logic;
    signal ram_wr_int      : std_logic;
    signal rom_cs_b        : std_logic;
    signal rom_data_out    : std_logic_vector (7 downto 0);
-------------------------------------------------
-- cpu signals
-------------------------------------------------

    signal cpu_R_W_n    : std_logic;
    signal cpu_addr_int : std_logic_vector (15 downto 0);
    signal cpu_addr     : std_logic_vector (15 downto 0);
    signal cpu_din      : std_logic_vector (7 downto 0);
    signal cpu_dout     : std_logic_vector (7 downto 0);
    signal cpu_IRQ_n    : std_logic;
    signal cpu_NMI_n    : std_logic;
    signal cpu_IRQ_sync : std_logic;
    signal cpu_NMI_sync : std_logic;

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

    inst_dcm_32_16 : entity work.dcm_32_16 port map (
        CLKIN_IN   => fastclk,
        CLK0_OUT   => cpu_clk,
        CLK0_OUT1  => open,
        CLK2X_OUT  => open);

    inst_tuberom : entity work.tuberom_6809 port map (
        CLK        => cpu_clk,
        ADDR       => cpu_addr(10 downto 0),
        DATA       => rom_data_out
    );

    Inst_cpu09: entity work.cpu09 PORT MAP(
        clk        => cpu_clk,       -- E clock input (rising edge)
        rst        => not RSTn_sync,      -- reset input (active high)
        vma        => vma,           -- valid memory address (active high)
        lic_out    => open,          -- last instruction cycle (active high)
        ifetch     => ifetch,        -- instruction fetch cycle (active high)
        opfetch    => opfetch,       -- opcode fetch (active high)
        ba         => ba,            -- bus available (high on sync wait or DMA grant)
        bs         => bs,            -- bus status (high on interrupt or reset vector fetch or DMA grant)
        addr       => cpu_addr_int,  -- address bus output
        rw         => cpu_R_W_n,     -- read not write output
        data_out   => cpu_dout,      -- data bus output
        data_in    => cpu_din,       -- data bus input
        irq        => cpu_NMI_sync,  -- interrupt request input (active high)
        firq       => cpu_IRQ_sync,  -- fast interrupt request input (active high)
        nmi        => '0',           -- non maskable interrupt request input (active high)
        halt       => '0',           -- halt input (active high) grants DMA
        hold       => not cpu_clken  -- hold input (active high) extend bus cycle, basically an inverted clock enable
    );
    
    -- Remap the hardware vectors from 0xFFFx to 0xFEFx
    cpu_addr <= cpu_addr_int when bs = '0' 
                else cpu_addr_int(15 downto 9) & '0' & cpu_addr_int(7 downto 0); 

    inst_tube: entity work.tube port map (
        h_addr     => h_addr,
        h_cs_b     => h_cs_b,
        h_data     => h_data,
        h_phi2     => h_phi2,
        h_rdnw     => h_rdnw,
        h_rst_b    => h_rst_b,
        h_irq_b    => h_irq_b,
        p_addr     => cpu_addr(2 downto 0),
        p_cs_b     => tube_cs_b,
        p_data_in  => cpu_dout,
        p_data_out => p_data_out,
        p_rdnw     => cpu_R_W_n,
        p_phi2     => cpu_clk,
        p_rst_b    => RSTn,
        p_nmi_b    => cpu_NMI_n,
        p_irq_b    => cpu_IRQ_n
    );

    tube_cs_b <= not ((not p_cs_b) and cpu_clken);
    
    p_cs_b <= '0' when vma = '1' and cpu_addr(15 downto 4) = "111111101110" else '1';

    rom_cs_b <= '0' when vma = '1' and cpu_addr(15 downto 11) = "11111" and cpu_R_W_n = '1' and bootmode = '1' else '1';

    ram_cs_b <= '0' when vma = '1' and p_cs_b = '1' and rom_cs_b = '1' else '1';

    cpu_din <=
        p_data_out   when p_cs_b   = '0' else
        rom_data_out when rom_cs_b = '0' else
        ram_data     when ram_cs_b = '0' else
        x"f1";

    ram_ub_b <= '0';
    ram_lb_b <= '0';
    ram_cs <= ram_cs_b;
    ram_oe_int <= not ((not ram_cs_b) and cpu_R_W_n);
    ram_oe <= ram_oe_int;
    ram_wr_int <= not ((not ram_cs_b) and (not cpu_R_W_n) and cpu_clken);
    ram_wr <= ram_wr_int;
    ram_addr <= "000" & cpu_addr(15 downto 0);
    ram_data <= cpu_dout when cpu_R_W_n = '0' else "ZZZZZZZZ";

--------------------------------------------------------
-- test signals
--------------------------------------------------------

    -- default to hi-impedence, to avoid conflicts with
    -- a Raspberry Pi connected to the test connector
    test <= (others => 'Z');
     
--------------------------------------------------------
-- boot mode generator
--------------------------------------------------------

    boot_gen : process(cpu_clk, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            bootmode <= '1';
        elsif rising_edge(cpu_clk) then
            if p_cs_b = '0' then
                bootmode <= '0';
            end if;
        end if;
    end process;

--------------------------------------------------------
-- synchronize interrupts etc into 6809 core
--------------------------------------------------------

    sync_gen : process(cpu_clk, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            cpu_NMI_sync <= '0';
            cpu_IRQ_sync <= '0';
        elsif rising_edge(cpu_clk) then
            cpu_NMI_sync <= not cpu_NMI_n;
            cpu_IRQ_sync <= not cpu_IRQ_n;            
        end if;
    end process;
    
--------------------------------------------------------
-- clock enable generator
--------------------------------------------------------

    -- TODO If the clock speed is increased from 4MHz to 8MHz
    -- e.g. with cpu_clken <= not cpu_clken
    -- then *SAVE skips every other byte
   
    clk_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            clken_counter <= clken_counter + 1;
            cpu_clken     <= clken_counter(0) and clken_counter(1);
            RSTn_sync     <= RSTn;
        end if;
    end process;
    
end BEHAVIORAL;


