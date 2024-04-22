library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CoProZ80 is
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
end CoProZ80;

architecture BEHAVIORAL of CoProZ80 is
 
    component dcm_49_24
        port (
            CLKIN_IN  : in  std_logic;
            CLK0_OUT  : out std_logic;
            CLK0_OUT1 : out std_logic;
            CLK2X_OUT : out std_logic
        ); 
    end component;

    component tuberom_z80
        port (
            CLK  : in  std_logic;
            ADDR : in  std_logic_vector(11 downto 0);
            DATA : out std_logic_vector(7 downto 0));
    end component;

    component T80se
        port (
            RESET_n : in  std_logic;
            CLK_n   : in  std_logic;
            CLKEN   : in  std_logic;
            WAIT_n  : in  std_logic;
            INT_n   : in  std_logic;
            NMI_n   : in  std_logic;
            BUSRQ_n : in  std_logic;
            M1_n    : out std_logic;
            MREQ_n  : out std_logic;
            IORQ_n  : out std_logic;
            RD_n    : out std_logic;
            WR_n    : out std_logic;
            RFSH_n  : out std_logic;
            HALT_n  : out std_logic;
            BUSAK_n : out std_logic;
            A       : out std_logic_vector(15 downto 0);
            DI      : in  std_logic_vector(7 downto 0);
            DO      : out std_logic_vector(7 downto 0)
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

    signal clk_6M00      : std_logic;
    signal clk_24M00     : std_logic;
    signal phi0          : std_logic;
    signal phi1          : std_logic;
    signal phi2          : std_logic;
    signal phi3          : std_logic;
    signal cpu_clken     : std_logic;
    signal clken_counter : std_logic_vector (3 downto 0);
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;

-------------------------------------------------
-- parasite signals
-------------------------------------------------
    
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
    
    signal cpu_rd_n   : std_logic;
    signal cpu_wr_n   : std_logic;
    signal cpu_iorq_n : std_logic;
    signal cpu_mreq_n : std_logic;
    signal cpu_m1_n   : std_logic;
    signal cpu_addr   : std_logic_vector (15 downto 0);
    signal cpu_din    : std_logic_vector (7 downto 0);
    signal cpu_dout   : std_logic_vector (7 downto 0);
    signal cpu_IRQ_n  : std_logic;
    signal cpu_NMI_n  : std_logic;
    signal cpu_IRQ_n_sync  : std_logic;
    signal cpu_NMI_n_sync  : std_logic;

begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_dcm_49_24 : dcm_49_24 port map (
        CLKIN_IN  => fastclk,
        CLK0_OUT  => clk_24M00,
        CLK0_OUT1 => open,
        CLK2X_OUT => open);
        
    clk_6M00 <= phi2;

    inst_tuberom : tuberom_z80 port map (
        CLK             => clk_24M00,
        ADDR            => cpu_addr(11 downto 0),
        DATA            => rom_data_out
    );

    inst_Z80 : T80se port map (
        RESET_n => RSTn,
        CLK_n   => clk_24M00,
        CLKEN   => cpu_clken,
        WAIT_n  => '1',
        INT_n   => cpu_IRQ_n_sync,
        NMI_n   => cpu_NMI_n_sync,
        BUSRQ_n => '1',
        M1_n    => cpu_m1_n,
        MREQ_n  => cpu_mreq_n,
        IORQ_n  => cpu_iorq_n,
        RD_n    => cpu_rd_n,
        WR_n    => cpu_wr_n,
        RFSH_n  => open,
        HALT_n  => open,
        BUSAK_n => open,
        A       => cpu_addr,
        DI      => cpu_din,
        DO      => cpu_dout
    );

    inst_tube: tube port map (
        h_addr          => h_addr,
        h_cs_b          => h_cs_b,
        h_data          => h_data,
        h_phi2          => h_phi2,
        h_rdnw          => h_rdnw,
        h_rst_b         => h_rst_b,
        h_irq_b         => h_irq_b,
        p_addr          => cpu_addr(2 downto 0),
        p_cs_b          => p_cs_b,
        p_data_in       => cpu_dout,
        p_data_out      => p_data_out,
        p_phi2          => clk_6M00,
        p_rdnw          => cpu_wr_n,
        p_rst_b         => RSTn,
        p_nmi_b         => cpu_NMI_n,
        p_irq_b         => cpu_IRQ_n
    );


    p_cs_b <= '0' when cpu_mreq_n = '1' and cpu_iorq_n = '0' and cpu_addr(7 downto 3) = "00000" else '1';

    rom_cs_b <= '0' when cpu_mreq_n = '0' and cpu_rd_n = '0' and bootmode = '1' else '1';

    ram_cs_b <= '0' when cpu_mreq_n = '0' and rom_cs_b = '1' else '1';

    cpu_din <=
        x"fe"        when cpu_m1_n = '0' and cpu_iorq_n = '0' else
        p_data_out   when p_cs_b = '0' else
        rom_data_out when rom_cs_b = '0' else
        ram_data     when ram_cs_b = '0' else
        x"fe";
    
    ram_cs <= ram_cs_b;
    ram_oe_int <= not ((not ram_cs_b) and (not cpu_rd_n));
    ram_oe <= ram_oe_int;
    ram_wr_int <= not ((not ram_cs_b) and (not cpu_wr_n));
    ram_wr <= ram_wr_int;
    ram_addr <= "000" & cpu_addr;
    ram_data <= cpu_dout when cpu_wr_n = '0' else "ZZZZZZZZ";

    fcs <= '1';
    
--    tp(8) <= RSTn;
--    tp(7) <= ram_wr_int;
--    tp(6) <= ram_oe_int;
--    tp(5) <= p_cs_b;
--    tp(4) <= CPU_IRQ_n;
--    tp(3) <= CPU_NMI_n;
--    tp(2) <= bootmode;

    testpr : process(sw, cpu_addr, h_addr, h_cs_b, p_data_out, cpu_rd_n, p_cs_b, cpu_m1_n)
    begin
        if (sw(1) = '1' and sw(2) = '1') then
--            test(6) <= cpu_rd_n;   -- 12
--            test(5) <= cpu_wr_n;   -- 11
--            test(4) <= cpu_m1_n;   -- 10
--            test(3) <= cpu_mreq_n; --  9
--            test(2) <= cpu_iorq_n; --  8
--            test(1) <= p_cs_b;     --  7
--            tp(8) <= rom_cs_b;     --  6
--            tp(7) <= ram_cs_b;     --  5
--            tp(6) <= ram_oe_int;   --  4
--            tp(5) <= ram_wr_int;   --  3
--            tp(4) <= CPU_IRQ_n;    --  2
--            tp(3) <= CPU_NMI_n;    --  1
--            tp(2) <= bootmode;     --  0

            test(6) <= CPU_NMI_n;
            test(5) <= cpu_wr_n;
            if h_addr(2 downto 0) = "101" and h_cs_b = '0' then
                test(4) <= '1';
            else
                test(4) <= '0';
            end if;
            if cpu_addr(2 downto 0) = "101" and p_cs_b = '0' then
                test(3) <= '1';
            else
                test(3) <= '0';
            end if;
            test(2) <= clk_6M00;
            test(1) <= cpu_dout(7);
            tp(8) <= cpu_dout(6);
            tp(7) <= cpu_dout(5);
            tp(6) <= cpu_dout(4);
            tp(5) <= cpu_dout(3);
            tp(4) <= cpu_dout(2);
            tp(3) <= cpu_dout(1);
            tp(2) <= cpu_dout(0);
        else
    
            test(6) <= cpu_m1_n;
            test(5) <= cpu_addr(11);
            test(4) <= cpu_addr(10);
            test(3) <= cpu_addr(9);
            test(2) <= cpu_addr(8);
            test(1) <= cpu_addr(7);

            tp(8) <= cpu_addr(6);
            tp(7) <= cpu_addr(5);
            tp(6) <= cpu_addr(4);
            tp(5) <= cpu_addr(3);
            tp(4) <= cpu_addr(2);
            tp(3) <= cpu_addr(1);
            tp(2) <= cpu_addr(0);
        end if;
    end process;
    
--------------------------------------------------------
-- boot mode generator
--------------------------------------------------------
    boot_gen : process(clk_24M00, RSTn)
    begin
        if RSTn = '0' then
            bootmode <= '1';
        elsif rising_edge(clk_24M00) then
            if (cpu_mreq_n = '0' and cpu_m1_n = '0') then
                if (cpu_addr = x"0066") then
                    bootmode <= '1';
                elsif cpu_addr(15) = '1' then
                    bootmode <= '0';
                end if;
            end if;
        end if;
    end process;

    sync_gen : process(clk_24M00, RSTn)
    begin
        if RSTn = '0' then
            cpu_NMI_n_sync <= '1';
            cpu_IRQ_n_sync <= '1';
        elsif rising_edge(clk_24M00) then
            if (cpu_clken = '1') then
                cpu_NMI_n_sync <= cpu_NMI_n;
                cpu_IRQ_n_sync <= cpu_IRQ_n;            
            end if;
        end if;
    end process;
--------------------------------------------------------
-- clock enable generator

-- 6MHz
-- cpu_clken active on cycle 0, 4, 8, 12
-- address/data changes on cycle 1, 5, 9, 13
-- phi0 active on cycle 1..2 -- rising edge sees unstable data  - completes lang transfer than hangs
-- phi1 active on cycle 2..3 -- both edges see stable data      - works (saw insert CPM)
-- phi2 active on cycle 3..4 -- falling edge sees unstable data - fails - AAAAAAAAAAAAA
-- phi3 active on cycle 4..5 -- edges see different data        - completes lang transfer than hangs

-- alternative
-- phi0 active on cycle 1 -- works (saw insert CPM)
-- phi1 active on cycle 2 -- completes lang transfer than hangs
-- phi2 active on cycle 3 -- works (saw insert CPM)
-- phi3 active on cycle 4 -- fails - AIAIIAIAIIAIAIIAIA

--------------------------------------------------------
    clk_gen : process(clk_24M00, RSTn)
    begin
        if RSTn = '0' then
            clken_counter <= (others => '0');
            cpu_clken <= '0';
            phi0      <= '0';
            phi1      <= '0';
            phi2      <= '0';
            phi3      <= '0';
        elsif rising_edge(clk_24M00) then
            clken_counter <= clken_counter + 1;
            cpu_clken     <= clken_counter(0) and clken_counter(1);
            --phi0          <= not clken_counter(1);
            phi0          <= cpu_clken;
            phi1          <= phi0;
            phi2          <= phi1;
            phi3          <= phi2;
        end if;
    end process;
    
end BEHAVIORAL;


