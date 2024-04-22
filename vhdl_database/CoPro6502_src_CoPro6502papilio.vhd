library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CoPro6502papilio is
    generic (
       UseT65Core    : boolean := false;
       UseJensCore   : boolean := false;
       UseAlanDCore  : boolean := true
       );
    port (
        -- GOP Signals
        fastclk   : in    std_logic;
        
        -- Tube signals
        h_phi2    : in    std_logic;
        h_addr    : in    std_logic_vector(2 downto 0);
        h_data    : inout std_logic_vector(7 downto 0);
        h_rdnw    : in    std_logic;
        h_cs_b    : in    std_logic;
        h_rst_b   : in    std_logic;
        h_irq_b   : inout std_logic;

        -- Ram Signals
        ram_cs       : out   std_logic;
        ram_oe       : out   std_logic;
        ram_wr       : out   std_logic;
        ram_addr     : out   std_logic_vector (18 downto 0);
        ram_data     : inout std_logic_vector (7 downto 0);

        led_ram      : out   std_logic;
        led_halt     : out   std_logic
        
    );
end CoPro6502papilio;

architecture BEHAVIORAL of CoPro6502papilio is
 
    component dcm_32_16
        port (
            CLKIN_IN  : in  std_logic;
            CLK0_OUT  : out std_logic;
            CLK0_OUT1 : out std_logic;
            CLK2X_OUT : out std_logic
        ); 
    end component;

    component tuberom_65c102
        port (
            CLK  : in  std_logic;
            ADDR : in  std_logic_vector(10 downto 0);
            DATA : out std_logic_vector(7 downto 0));
    end component;

    component T65
        port(
            Mode    : in  std_logic_vector(1 downto 0);
            Res_n   : in  std_logic;
            Enable  : in  std_logic;
            Clk     : in  std_logic;
            Rdy     : in  std_logic;
            Abort_n : in  std_logic;
            IRQ_n   : in  std_logic;
            NMI_n   : in  std_logic;
            SO_n    : in  std_logic;
            DI      : in  std_logic_vector(7 downto 0);          
            R_W_n   : out std_logic;
            Sync    : out std_logic;
            EF      : out std_logic;
            MF      : out std_logic;
            XF      : out std_logic;
            ML_n    : out std_logic;
            VP_n    : out std_logic;
            VDA     : out std_logic;
            VPA     : out std_logic;
            A       : out std_logic_vector(23 downto 0);
            DO      : out std_logic_vector(7 downto 0)
        );
    end component;

    component r65c02_tc
    port(
        clk_clk_i   : in std_logic;
        d_i         : in std_logic_vector(7 downto 0);
        irq_n_i     : in std_logic;
        nmi_n_i     : in std_logic;
        rdy_i       : in std_logic;
        rst_rst_n_i : in std_logic;
        so_n_i      : in std_logic;          
        a_o         : out std_logic_vector(15 downto 0);
        d_o         : out std_logic_vector(7 downto 0);
        rd_o        : out std_logic;
        sync_o      : out std_logic;
        wr_n_o      : out std_logic;
        wr_o        : out std_logic
        );
    end component;
    
    component r65c02
    port(
        reset       : in std_logic;
        clk         : in std_logic;
        enable      : in std_logic;
        nmi_n       : in std_logic;
        irq_n       : in std_logic;
        di          : in unsigned(7 downto 0);          
        do          : out unsigned(7 downto 0);
        addr        : out unsigned(15 downto 0);
        nwe         : out std_logic;
        sync        : out std_logic;
        sync_irq    : out std_logic
        );
    end component;

    component tube
        port(
            h_addr     : in    std_logic_vector(2 downto 0);
            h_cs_b     : in    std_logic;
            h_data     : inout std_logic_vector(7 downto 0);
            h_phi2     : in    std_logic;
            h_rdnw     : in    std_logic;
            h_rst_b    : in    std_logic;
            h_irq_b    : inout std_logic;
            p_addr     : in    std_logic_vector(2 downto 0);
            p_cs_b     : in    std_logic;
            p_data_in  : in    std_logic_vector(7 downto 0);
            p_data_out : out   std_logic_vector(7 downto 0);
            p_rdnw     : in    std_logic;
            p_phi2     : in    std_logic;
            p_rst_b    : out   std_logic;
            p_nmi_b    : inout std_logic;
            p_irq_b    : inout std_logic
          );
    end component;

-------------------------------------------------
-- clock and reset signals
-------------------------------------------------

    signal clk_16M00     : std_logic;
    signal phi0          : std_logic;
    signal phi1          : std_logic;
    signal phi2          : std_logic;
    signal phi3          : std_logic;
    signal cpu_clken     : std_logic;
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal RSTn_sync     : std_logic;
    signal clken_counter : std_logic_vector (1 downto 0);
    signal reset_counter : std_logic_vector (8 downto 0);
    signal led_counter   : std_logic_vector (23 downto 0);

-------------------------------------------------
-- parasite signals
-------------------------------------------------
    
    signal p_cs_b        : std_logic;
    signal gated_p_cs_b  : std_logic;
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

    signal cpu_R_W_n  : std_logic;
    signal cpu_addr   : std_logic_vector (23 downto 0);
    signal cpu_addr_us: unsigned (23 downto 0);
    signal cpu_din    : std_logic_vector (7 downto 0);
    signal cpu_dout   : std_logic_vector (7 downto 0);
    signal cpu_dout_us: unsigned (7 downto 0);
    signal cpu_IRQ_n  : std_logic;
    signal cpu_NMI_n  : std_logic;
    signal cpu_IRQ_n_sync  : std_logic;
    signal cpu_NMI_n_sync  : std_logic;
    signal sync       : std_logic;

begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_dcm_32_16 : dcm_32_16 port map (
        CLKIN_IN  => fastclk,
        CLK0_OUT  => clk_16M00,
        CLK0_OUT1 => open,
        CLK2X_OUT => open
    );

    inst_tuberom : tuberom_65c102 port map (
        CLK             => clk_16M00,
        ADDR            => cpu_addr(10 downto 0),
        DATA            => rom_data_out
    );

    GenT65Core: if UseT65Core generate
        inst_T65 : T65 port map (
            Mode            => "01",
            Abort_n         => '1',
            SO_n            => '1',
            Res_n           => RSTn_sync,
            Enable          => cpu_clken,
            Clk             => clk_16M00,
            Rdy             => '1',
            IRQ_n           => cpu_IRQ_n_sync,
            NMI_n           => cpu_NMI_n_sync,
            R_W_n           => cpu_R_W_n,
            Sync            => sync,
            A(23 downto 0)  => cpu_addr,
            DI(7 downto 0)  => cpu_din,
            DO(7 downto 0)  => cpu_dout
        );
    end generate;
    
    GenJensCore: if UseJensCore generate
        Inst_r65c02_tc: r65c02_tc PORT MAP(
            clk_clk_i   => phi0,
            d_i         => cpu_din,
            irq_n_i     => cpu_IRQ_n_sync,
            nmi_n_i     => cpu_NMI_n_sync,
            rdy_i       => '1',
            rst_rst_n_i => RSTn_sync,
            so_n_i      => '1',
            a_o         => cpu_addr(15 downto 0),
            d_o         => cpu_dout,
            rd_o        => open,
            sync_o      => sync,
            wr_n_o      => cpu_R_W_n,
            wr_o        => open
        );
    end generate;

    GenAlanDCore: if UseAlanDCore generate
        inst_r65c02: r65c02 port map(
            reset    => RSTn_sync,
            clk      => clk_16M00,
            enable   => cpu_clken,
            nmi_n    => cpu_NMI_n_sync,
            irq_n    => cpu_IRQ_n_sync,
            di       => unsigned(cpu_din),
            do       => cpu_dout_us,
            addr     => cpu_addr_us(15 downto 0),
            nwe      => cpu_R_W_n,
            sync     => sync,
            sync_irq => open
        );
        cpu_dout <= std_logic_vector(cpu_dout_us);
        cpu_addr <= std_logic_vector(cpu_addr_us);
    end generate;

    inst_tube: tube port map (
        h_addr          => h_addr,
        h_cs_b          => h_cs_b,
        h_data          => h_data,
        h_phi2          => h_phi2,
        h_rdnw          => h_rdnw,
        h_rst_b         => h_rst_b,
        h_irq_b         => h_irq_b,
        p_addr          => cpu_addr(2 downto 0),
        p_cs_b          => gated_p_cs_b,
        p_data_in       => cpu_dout,
        p_data_out      => p_data_out,
        p_rdnw          => cpu_R_W_n,
        p_phi2          => clk_16M00,
        p_rst_b         => RSTn,
        p_nmi_b         => cpu_NMI_n,
        p_irq_b         => cpu_IRQ_n
    );

    gated_p_cs_b <= not((not p_cs_b) and cpu_clken);

    p_cs_b <= '0' when cpu_addr(15 downto 3) = "1111111011111" else '1';

    rom_cs_b <= '0' when cpu_addr(15 downto 11) = "11111" and cpu_R_W_n = '1' and bootmode = '1' else '1';

    ram_cs_b <= '0' when p_cs_b = '1' and rom_cs_b = '1' else '1';

    cpu_din <=
        p_data_out   when p_cs_b = '0' else
        rom_data_out when rom_cs_b = '0' else
        ram_data     when ram_cs_b = '0' else
        x"f1";
    
    ram_cs <= ram_cs_b;
    ram_oe_int <= not ((not ram_cs_b) and cpu_R_W_n);
    ram_oe <= ram_oe_int;
    ram_wr_int <= not ((not ram_cs_b) and (not cpu_R_W_n) and phi1);
    ram_wr <= ram_wr_int;
    
    -- for an AS6C1008 A17 connects to CE2 which needs to be high
    ram_addr <= "111" & cpu_addr(15 downto 0);
    ram_data <= cpu_dout when cpu_R_W_n = '0' else "ZZZZZZZZ";
        
--------------------------------------------------------
-- boot mode generator
--------------------------------------------------------
    boot_gen : process(clk_16M00, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            bootmode <= '1';
        elsif rising_edge(clk_16M00) then
            if p_cs_b = '0' then
                bootmode <= '0';
            end if;
        end if;
    end process;

--------------------------------------------------------
-- power up reset
--------------------------------------------------------
    reset_gen : process(clk_16M00)
    begin
        if rising_edge(clk_16M00) then
            if (reset_counter(8) = '0') then
                reset_counter <= reset_counter + 1;
            end if;
            RSTn_sync <= RSTn AND reset_counter(8);
        end if;
    end process;

--------------------------------------------------------
-- interrupt synchronization
--------------------------------------------------------
    sync_gen : process(clk_16M00, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            cpu_NMI_n_sync <= '1';
            cpu_IRQ_n_sync <= '1';
        elsif rising_edge(clk_16M00) then
            if (cpu_clken = '1') then
                cpu_NMI_n_sync <= cpu_NMI_n;
                cpu_IRQ_n_sync <= cpu_IRQ_n;            
            end if;
        end if;
    end process;

--------------------------------------------------------
-- clock enable generator

-- 4MHz
-- cpu_clken active on cycle 0, 4, 8, 12
-- address/data changes on cycle 1, 5, 9, 13
-- phi0 active on cycle 1..2
-- phi1 active on cycle 2..3
-- phi2 active on cycle 3..0
-- phi3 active on cycle 0..1
--------------------------------------------------------
    clk_gen : process(clk_16M00, RSTn)
    begin
        if rising_edge(clk_16M00) then
            clken_counter <= clken_counter + 1;
            cpu_clken     <= clken_counter(0) and clken_counter(1);
            phi0          <= not clken_counter(1);
            phi1          <= phi0;
            phi2          <= phi1;
            phi3          <= phi2;
        end if;
    end process;

--------------------------------------------------------
-- led generator
--------------------------------------------------------

    led_gen : process(clk_16M00, RSTn)
    begin
        if rising_edge(clk_16M00) then
            led_counter <= led_counter + 1;
            led_ram     <= led_counter(23);
            led_halt    <= not led_counter(23);
        end if;
    end process;

end BEHAVIORAL;


