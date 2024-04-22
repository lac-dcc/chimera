library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CoPro6502 is
    generic (
       UseT65Core    : boolean := false;
       UseJensCore   : boolean := true;
       UseAlanDCore  : boolean := false
       );
    port (
        -- GOP Signals
        fastclk   : in    std_logic;
        tp        : out   std_logic_vector(8 downto 2);
        test      : out   std_logic_vector(6 downto 1);
        sw        : in    std_logic_vector(2 downto 1);
        fcs       : out   std_logic;

        -- Tube signals (use 16 out of 22 DIL pins)
        h_phi2    : in    std_logic;  -- 1,2,12,21,23 are global clocks
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
        ram_data     : inout std_logic_vector (7 downto 0)
    );
end CoPro6502;

architecture BEHAVIORAL of CoPro6502 is

    component tube
        port(
            h_addr     : in    std_logic_vector(2 downto 0);
            h_cs_b     : in    std_logic;
            h_data     : inout std_logic_vector(7 downto 0);
            h_phi2     : in    std_logic;
            h_rdnw     : in    std_logic;
            h_rst_b    : in    std_logic;
            h_irq_b    : inout std_logic;
         -- drq        : out   std_logic;
         -- dackb      : in    std_logic;
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
    signal clken_counter : std_logic_vector (1 downto 0);
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal RSTn_sync     : std_logic;

-------------------------------------------------
-- parasite signals
-------------------------------------------------

    signal p_cs_b_en     : std_logic;
    signal p_cs_b        : std_logic;
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

    signal debug_clk  : std_logic;
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
    signal sample_reg : std_logic_vector(11 downto 0);

begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_dcm_49_16 : entity work.dcm_49_16 port map (
        CLKIN_IN  => fastclk,
        CLK0_OUT  => clk_16M00,
        CLK0_OUT1 => open,
        CLK2X_OUT => open
    );

    inst_tuberom : entity work.tuberom_65c102 port map (
        CLK             => clk_16M00,
        ADDR            => cpu_addr(10 downto 0),
        DATA            => rom_data_out
    );

    GenT65Core: if UseT65Core generate
        inst_T65 : entity work.T65 port map (
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
        -- For debugging only
        debug_clk <= cpu_clken;
    end generate;

    GenJensCore: if UseJensCore generate
        Inst_r65c02_tc: entity work.r65c02_tc PORT MAP(
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
        -- For debugging only
        debug_clk <= phi0;
    end generate;

    GenAlanDCore: if UseAlanDCore generate
        inst_r65c02: entity work.r65c02 port map(
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
        -- For debugging only
        debug_clk <= cpu_clken;
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
        p_cs_b          => p_cs_b_en,
        p_data_in       => cpu_dout,
        p_data_out      => p_data_out,
        p_rdnw          => cpu_R_W_n,
        p_phi2          => clk_16M00,
        p_rst_b         => RSTn,
        p_nmi_b         => cpu_NMI_n,
        p_irq_b         => cpu_IRQ_n
    );

    p_cs_b_en <= not((not p_cs_b) and cpu_clken);

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
    ram_addr <= "000" & cpu_addr(15 downto 0);
    ram_data <= cpu_dout when cpu_R_W_n = '0' else "ZZZZZZZZ";


    sample_gen : process(debug_clk)
    begin
        if rising_edge(debug_clk) then
            if cpu_R_W_n = '0' then
                sample_reg(7 downto 0) <= cpu_dout;
            else
                sample_reg(7 downto 0) <= cpu_din;
            end if;
            sample_reg(8) <= cpu_R_W_n;
            sample_reg(9) <= sync;
            sample_reg(10) <= RSTn_sync; -- cpu_NMI_n_sync;
            sample_reg(11) <= cpu_IRQ_n_sync;
        end if;
    end process;

    fcs <= '1';

    test(6) <= debug_clk;
    test(5) <= sample_reg(11);
    test(4) <= sample_reg(10);
    test(3) <= sample_reg(9);
    test(2) <= sample_reg(8);
    test(1) <= sample_reg(7);
    tp(8)   <= sample_reg(6);
    tp(7)   <= sample_reg(5);
    tp(6)   <= sample_reg(4);
    tp(5)   <= sample_reg(3);
    tp(4)   <= sample_reg(2);
    tp(3)   <= sample_reg(1);
    tp(2)   <= sample_reg(0);

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
        RSTn_sync <= RSTn;
    end process;

end BEHAVIORAL;
