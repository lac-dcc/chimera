library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CoPro6809 is
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
end CoPro6809;

architecture BEHAVIORAL of CoPro6809 is
 
    component dcm_49_16
        port (
            CLKIN_IN  : in  std_logic;
            CLK0_OUT  : out std_logic;
            CLK0_OUT1 : out std_logic;
            CLK2X_OUT : out std_logic
        ); 
    end component;

    component tuberom_6809
        port (
            CLK  : in  std_logic;
            ADDR : in  std_logic_vector(10 downto 0);
            DATA : out std_logic_vector(7 downto 0));
    end component;

    component cpu09
        port (
            clk      : in std_logic;
            rst      : in std_logic;
            data_in  : in std_logic_vector(7 downto 0);
            irq      : in std_logic;
            firq     : in std_logic;
            nmi      : in std_logic;
            halt     : in std_logic;
            hold     : in std_logic;          
            vma      : out std_logic;
            lic_out  : out std_logic;
            ifetch   : out std_logic;
            opfetch  : out std_logic;
            ba       : out std_logic;
            bs       : out std_logic;
            addr     : out std_logic_vector(15 downto 0);
            rw       : out std_logic;
            data_out : out std_logic_vector(7 downto 0)
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

    signal clk_16M00     : std_logic;
    signal phi0          : std_logic;
    signal phi1          : std_logic;
    signal phi2          : std_logic;
    signal phi3          : std_logic;
    signal cpu_clken     : std_logic;
    signal clken_counter : std_logic_vector (3 downto 0);
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal bs            : std_logic;
    signal ba            : std_logic;
    signal vma           : std_logic;
    signal ifetch        : std_logic;
    signal opfetch        : std_logic;

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

    inst_dcm_49_16 : dcm_49_16 port map (
        CLKIN_IN  => fastclk,
        CLK0_OUT  => clk_16M00,
        CLK0_OUT1 => open,
        CLK2X_OUT => open);

    inst_tuberom : tuberom_6809 port map (
        CLK             => clk_16M00,
        ADDR            => cpu_addr(10 downto 0),
        DATA            => rom_data_out
    );

    Inst_cpu09: cpu09 PORT MAP(
        clk      => phi2,          -- E clock input (falling edge)
        rst      => not RSTn,      -- reset input (active high)
        vma      => vma,           -- valid memory address (active high)
        lic_out  => open,          -- last instruction cycle (active high)
        ifetch   => ifetch,        -- instruction fetch cycle (active high)
        opfetch  => opfetch,          -- opcode fetch (active high)
        ba       => ba,            -- bus available (high on sync wait or DMA grant)
        bs       => bs,            -- bus status (high on interrupt or reset vector fetch or DMA grant)
        addr     => cpu_addr_int,  -- address bus output
        rw       => cpu_R_W_n,     -- read not write output
        data_out => cpu_dout,      -- data bus output
        data_in  => cpu_din,       -- data bus input
        irq      => cpu_NMI_sync,  -- interrupt request input (active high)
        firq     => cpu_IRQ_sync,  -- fast interrupt request input (active high)
        nmi      => '0',           -- non maskable interrupt request input (active high)
        halt     => '0',           -- halt input (active high) grants DMA
        hold     => '0'            -- hold input (active high) extend bus cycle
    );
    
    -- Remap the hardware vectors from 0xFFFx to 0xFEFx
    cpu_addr <= cpu_addr_int when bs = '0' 
                else cpu_addr_int(15 downto 9) & '0' & cpu_addr_int(7 downto 0); 

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
        p_rdnw          => cpu_R_W_n,
        p_phi2          => phi2,
        p_rst_b         => RSTn,
        p_nmi_b         => cpu_NMI_n,
        p_irq_b         => cpu_IRQ_n
    );

    p_cs_b <= '0' when vma = '1' and cpu_addr(15 downto 4) = "111111101110" else '1';

    rom_cs_b <= '0' when vma = '1' and cpu_addr(15 downto 11) = "11111" and cpu_R_W_n = '1' and bootmode = '1' else '1';

    ram_cs_b <= '0' when vma = '1' and p_cs_b = '1' and rom_cs_b = '1' else '1';

    cpu_din <=
        p_data_out   when p_cs_b = '0' else
        rom_data_out when rom_cs_b = '0' else
        ram_data     when ram_cs_b = '0' else
        x"f1";

    
    ram_cs <= ram_cs_b;
    ram_oe_int <= not ((not ram_cs_b) and cpu_R_W_n);
    ram_oe <= ram_oe_int;
    ram_wr_int <= not ((not ram_cs_b) and (not cpu_R_W_n) and Phi2);
    ram_wr <= ram_wr_int;
    ram_addr <= "000" & cpu_addr(15 downto 0);
    ram_data <= cpu_dout when cpu_R_W_n = '0' else "ZZZZZZZZ";

    fcs <= '1';

    testpr : process(sw)
    begin
        if (sw(1) = '1' and sw(2) = '1') then
        
            test(6) <= opfetch and Phi0;
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
            
    

--            test(6) <= CPU_NMI_n;
--            test(5) <= cpu_wr_n;
--            if h_addr(2 downto 0) = "101" and h_cs_b = '0' then
--                test(4) <= '1';
--            else
--                test(4) <= '0';
--            end if;
--            if cpu_addr(2 downto 0) = "101" and p_cs_b = '0' then
--                test(3) <= '1';
--            else
--                test(3) <= '0';
--            end if;
--            test(2) <= clk_6M00;
--            test(1) <= cpu_dout(7);
--            tp(8) <= cpu_dout(6);
--            tp(7) <= cpu_dout(5);
--            tp(6) <= cpu_dout(4);
--            tp(5) <= cpu_dout(3);
--            tp(4) <= cpu_dout(2);
--            tp(3) <= cpu_dout(1);
--            tp(2) <= cpu_dout(0);
        else
    
            test(6) <= phi2;        -- 12
            test(5) <= vma;         -- 11
            test(4) <= bs;          -- 10
            test(3) <= ba;          -- 9
            test(2) <= cpu_R_W_n;   -- 8
            test(1) <= rom_cs_b;    -- 7     
            tp(8) <= RSTn;          -- 6
            tp(7) <= ram_wr_int;    -- 5
            tp(6) <= ram_oe_int;    -- 4
            tp(5) <= p_cs_b;        -- 3
            tp(4) <= CPU_IRQ_n;     -- 2
            tp(3) <= CPU_NMI_n;     -- 1
            tp(2) <= bootmode;      -- 0

        end if;
    end process;        

    sync_gen : process(phi2, RSTn)
    begin
        if RSTn = '0' then
            cpu_NMI_sync <= '0';
            cpu_IRQ_sync <= '0';
        elsif rising_edge(phi2) then
            cpu_NMI_sync <= not cpu_NMI_n;
            cpu_IRQ_sync <= not cpu_IRQ_n;            
        end if;
    end process;

--------------------------------------------------------
-- boot mode generator
--------------------------------------------------------
    boot_gen : process(clk_16M00, RSTn)
    begin
        if RSTn = '0' then
            bootmode <= '1';
        elsif rising_edge(clk_16M00) then
            if p_cs_b = '0' then
                bootmode <= '0';
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
-- phi2 active on cycle 3..4
-- phi3 active on cycle 4..5

-- alternative
-- phi0 active on cycle 1
-- phi1 active on cycle 2
-- phi2 active on cycle 3
-- phi3 active on cycle 4

--------------------------------------------------------
    clk_gen : process(clk_16M00)
    begin
        if rising_edge(clk_16M00) then
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


