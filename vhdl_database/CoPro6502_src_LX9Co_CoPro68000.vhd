library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoPro68000 is
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
        ram_data     : inout std_logic_vector (15 downto 0)
    );
end LX9CoPro68000;

architecture BEHAVIORAL of LX9CoPro68000 is
 
-------------------------------------------------
-- clock and reset signals
-------------------------------------------------

    signal cpu_clk       : std_logic;
    signal cpu_clken     : std_logic;
    signal clken_counter : std_logic_vector (1 downto 0);
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal RSTn_sync     : std_logic;

-------------------------------------------------
-- parasite signals
-------------------------------------------------
    
    signal p_cs_b        : std_logic;
    signal p_cs_b_old    : std_logic;
    signal tube_cs_b     : std_logic;
    signal p_data_in     : std_logic_vector (7 downto 0);
    signal p_data_out    : std_logic_vector (7 downto 0);
    signal p_data_out_r  : std_logic_vector (7 downto 0);

-------------------------------------------------
-- ram/rom signals
-------------------------------------------------

    signal ram_cs_b        : std_logic;
    signal ram_oe_int      : std_logic;
    signal ram_wr_int      : std_logic;
    signal rom_cs_b        : std_logic;
    signal rom_data_out    : std_logic_vector (15 downto 0);
-------------------------------------------------
-- cpu signals
-------------------------------------------------

    signal cpu_addr       : std_logic_vector (31 downto 0);
    signal cpu_din        : std_logic_vector (15 downto 0);
    signal cpu_dout       : std_logic_vector (15 downto 0);
    signal cpu_IRQ_n      : std_logic;
    signal cpu_NMI_n      : std_logic;
    signal cpu_IRQ_n_sync : std_logic;
    signal cpu_NMI_n_sync : std_logic;
    signal cpu_as         : std_logic;
    signal cpu_uds        : std_logic;
    signal cpu_lds        : std_logic;
    signal cpu_R_W_n      : std_logic;
    signal cpu_data_drive : std_logic;


begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_icap_config : entity work.icap_config port map (
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

    inst_tuberom : entity work.tuberom_68000 port map (
        CLK        => cpu_clk,
        ADDR       => cpu_addr(14 downto 1),
        DATA       => rom_data_out
    );

    Inst_tg68: entity work.TG68 port map (
        clk        => cpu_clk,
        reset      => RSTn_sync,
        clkena_in  => cpu_clken,
        data_in    => cpu_din,
        IPL        => CPU_NMI_n_sync & CPU_IRQ_n_sync & CPU_NMI_n_sync,
        dtack      => '0',
        addr       => cpu_addr,
        data_out   => cpu_dout,
        as         => cpu_as,
        uds        => cpu_uds,
        lds        => cpu_lds,
        rw         => cpu_R_W_n,
        drive_data => cpu_data_drive
    );

    inst_tube: entity work.tube port map (
        h_addr     => h_addr,
        h_cs_b     => h_cs_b,
        h_data     => h_data,
        h_phi2     => h_phi2,
        h_rdnw     => h_rdnw,
        h_rst_b    => h_rst_b,
        h_irq_b    => h_irq_b,
        p_addr     => cpu_addr(2 downto 1) & cpu_uds,
        p_cs_b     => tube_cs_b,
        p_data_in  => p_data_in,
        p_data_out => p_data_out,
        p_rdnw     => cpu_R_W_n,
        p_phi2     => cpu_clk,
        p_rst_b    => RSTn,
        p_nmi_b    => cpu_NMI_n,
        p_irq_b    => cpu_IRQ_n
    );
    
    p_data_in <= cpu_dout(15 downto 8) when cpu_uds = '0' else
                 cpu_dout(7 downto 0) when cpu_lds = '0' else
                 x"ff";

    tube_cs_b <= not ((not p_cs_b) and cpu_clken and (not cpu_uds or not cpu_lds));

    -- Tube address is $FFFExxxx, and A0..A2 go into the Tube ULA
    -- Incomplete decoding as per Eelco's schenatic
    p_cs_b   <= '0' when (cpu_as = '0' and cpu_addr(21 downto 16) = "111110")
                    else '1';

    -- ROM addess is $FFFFxxxx
    -- In boot mode, ROM also mapped to $0000xxxx
    rom_cs_b <= '0' when (cpu_as = '0' and cpu_addr(21 downto 16) = "111111") or
                         (cpu_as = '0' and cpu_addr(21 downto 16) = "000000" and bootmode = '1')
                    else '1';

    -- RAM otherwise
    ram_cs_b <= '0' when cpu_as = '0' and p_cs_b = '1' and rom_cs_b = '1'
                    else '1';

    -- This is a bit of a cludge, but the 68000 asserts UDS/LDS for multiple cycles
    -- which causes problems reading R3 data (address 101) because of an anomaly/bug
    -- in the Tube implementation of R3. To get around this, we latch the data beging read
    
    tube_data_latch : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if (cpu_clken = '1') then
                p_cs_b_old <= p_cs_b;
                if (p_cs_b_old = '1' and p_cs_b = '0') then
                    p_data_out_r <= p_data_out;
                end if;
            end if;
        end if;
    end process;

    cpu_din <=
        p_data_out_r & p_data_out_r when p_cs_b   = '0' else
        rom_data_out                when rom_cs_b = '0' else
        ram_data                    when ram_cs_b = '0' else
        x"f1f1";

    ram_ub_b <= cpu_uds;
    ram_lb_b <= cpu_lds;
    ram_cs <= ram_cs_b;
    ram_oe_int <= not ((not ram_cs_b) and cpu_R_W_n);
    ram_oe <= ram_oe_int;
    ram_wr_int <= not ((not ram_cs_b) and (not cpu_R_W_n) and cpu_clken);
    ram_wr <= ram_wr_int;
    ram_addr <= cpu_addr(19 downto 1);
    ram_data <= cpu_dout when cpu_data_drive = '1' else "ZZZZZZZZZZZZZZZZ";

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
            if cpu_as = '0' and cpu_addr(21 downto 19) = "111" then
                bootmode <= '0';
            end if;
        end if;
    end process;

--------------------------------------------------------
-- synchronize interrupts etc into 68000 core
--------------------------------------------------------

    sync_gen : process(cpu_clk, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            cpu_NMI_n_sync <= '1';
            cpu_IRQ_n_sync <= '1';
        elsif rising_edge(cpu_clk) then
            cpu_NMI_n_sync <= cpu_NMI_n;
            cpu_IRQ_n_sync <= cpu_IRQ_n;            
        end if;
    end process;
    
--------------------------------------------------------
-- clock enable generator
--------------------------------------------------------
   
    clk_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            clken_counter <= clken_counter + 1;
            cpu_clken     <= clken_counter(0);
            RSTn_sync     <= RSTn;
        end if;
    end process;
    
end BEHAVIORAL;


