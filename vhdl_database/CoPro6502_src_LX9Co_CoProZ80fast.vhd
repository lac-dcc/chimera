library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoProZ80fast is
    generic (
       UseT80Core    : boolean := false;
       UseNextCore   : boolean := true
       );
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
end LX9CoProZ80fast;

architecture BEHAVIORAL of LX9CoProZ80fast is
 
-------------------------------------------------
-- clock and reset signals
-------------------------------------------------

    signal cpu_clk       : std_logic;
    signal cpu_clken     : std_logic;
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal RSTn_sync     : std_logic;
    signal clken_counter : std_logic_vector (3 downto 0);

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
    signal ram_data_out    : std_logic_vector (7 downto 0);

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
    signal cpu_m1     : std_logic;
    signal cpu_mreq   : std_logic;
    signal cpu_iorq   : std_logic;
    signal cpu_wr     : std_logic;
    
    signal digit1_cs_b : std_logic;
    signal digit2_cs_b : std_logic;
    signal digit3_cs_b : std_logic;
    signal digit1      : std_logic_vector (7 downto 0);
    signal digit2      : std_logic_vector (7 downto 0);
    signal digit3      : std_logic_vector (7 downto 0);

    signal sw_out      : std_logic_vector (3 downto 0);
    
begin

---------------------------------------------------------------------
-- instantiated components
---------------------------------------------------------------------

    inst_ICAP_config : entity work.ICAP_config port map (
        fastclk => fastclk,
        sw_in   => sw,
        sw_out  => sw_out,
        h_addr  => h_addr,
        h_cs_b  => h_cs_b,
        h_data  => h_data,
        h_phi2  => h_phi2,
        h_rdnw  => h_rdnw,
        h_rst_b => h_rst_b 
    );

    inst_dcm_32_56 : entity work.dcm_32_56 port map (
        CLKIN_IN  => fastclk,
        CLK0_OUT  => cpu_clk,
        CLK0_OUT1 => open,
        CLK2X_OUT => open
    );

    inst_tuberom : entity work.tuberom_z80_banner port map (
        CLK        => cpu_clk,
        ADDR       => cpu_addr(11 downto 0),
        DATA       => rom_data_out
    );

    GenT80Core: if UseT80Core generate
        inst_Z80 : entity work.T80se port map (
            RESET_n    => RSTn_sync,
            CLK_n      => cpu_clk,
            CLKEN      => cpu_clken,
            WAIT_n     => '1',
            INT_n      => cpu_IRQ_n_sync,
            NMI_n      => cpu_NMI_n_sync,
            BUSRQ_n    => '1',
            M1_n       => cpu_m1_n,
            MREQ_n     => cpu_mreq_n,
            IORQ_n     => cpu_iorq_n,
            RD_n       => cpu_rd_n,
            WR_n       => cpu_wr_n,
            RFSH_n     => open,
            HALT_n     => open,
            BUSAK_n    => open,
            A          => cpu_addr,
            DI         => cpu_din,
            DO         => cpu_dout
        );
    end generate;
    
    GenNextCore: if UseNextCore generate
        Inst_Z80: entity work.NextZ80 PORT MAP(
            RESET => not RSTn_sync,
            CLK   => cpu_clk,
            WT    => not cpu_clken,
            INT   => not cpu_IRQ_n_sync,
            NMI   => not cpu_NMI_n_sync,
            M1    => cpu_m1,
            MREQ  => cpu_mreq,
            IORQ  => cpu_iorq,
            WR    => cpu_wr,            
            HALT  => open,
            ADDR  => cpu_addr,
            DI    => cpu_din,
            DO    => cpu_dout
        );
        cpu_m1_n   <= not cpu_m1;
        cpu_mreq_n <= not cpu_mreq;
        cpu_iorq_n <= not cpu_iorq;
        cpu_rd_n   <= cpu_wr;
        cpu_wr_n   <= not cpu_wr;
    end generate;

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
        p_phi2     => cpu_clk,
        p_rdnw     => cpu_wr_n,
        p_rst_b    => RSTn,
        p_nmi_b    => cpu_NMI_n,
        p_irq_b    => cpu_IRQ_n
    );

    tube_cs_b <= not ((not p_cs_b) and cpu_clken);
    
    Inst_RAM_64K: entity work.RAM_64K PORT MAP(
        clk     => cpu_clk,
        we_uP   => ram_wr_int,
        ce      => '1',
        addr_uP => cpu_addr,
        D_uP    => cpu_dout,
        Q_uP    => ram_data_out
    );
    

    p_cs_b <= '0' when cpu_mreq_n = '1' and cpu_iorq_n = '0' and cpu_addr(7 downto 3) = "00000" else '1';
    
    rom_cs_b <= '0' when cpu_mreq_n = '0' and cpu_rd_n = '0' and bootmode = '1' else '1';

    digit1_cs_b <= '0' when rom_cs_b = '0' and cpu_addr(11 downto 0) = x"2A2" else '1';
    digit2_cs_b <= '0' when rom_cs_b = '0' and cpu_addr(11 downto 0) = x"2A3" else '1';
    digit3_cs_b <= '0' when rom_cs_b = '0' and cpu_addr(11 downto 0) = x"2A4" else '1';

    -- Original: Acorn TUBE Z80 64k 1.21
    -- Updated:  Acorn TUBE Z80 112 Mhz   

    digit1 <= x"31" when sw_out(1 downto 0) = "11" else
              x"06"; 

    digit2 <= x"31" when sw_out(1 downto 0) = "11" else
              x"35" when sw_out(1 downto 0) = "10" else
              x"33" when sw_out(1 downto 0) = "01" else
              x"31";
              
    digit3 <= x"32" when sw_out(1 downto 0) = "11" else
              x"36" when sw_out(1 downto 0) = "10" else
              x"32" when sw_out(1 downto 0) = "01" else
              x"36";
    
    ram_cs_b <= '0' when cpu_mreq_n = '0' and rom_cs_b = '1' else '1';
    
    ram_wr_int <= ((not ram_cs_b) and (not cpu_wr_n) and cpu_clken);

    cpu_din <=
        p_data_out   when p_cs_b      = '0' else
        digit1       when digit1_cs_b = '0' else 
        digit2       when digit2_cs_b = '0' else 
        digit3       when digit3_cs_b = '0' else 
        rom_data_out when rom_cs_b    = '0' else
        ram_data_out when ram_cs_b    = '0' else
        x"fe";

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

--------------------------------------------------------
-- boot mode generator
--------------------------------------------------------

    boot_gen : process(cpu_clk, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            bootmode <= '1';
        elsif rising_edge(cpu_clk) then
            if (cpu_mreq_n = '0' and cpu_m1_n = '0') then
                if (cpu_addr = x"0066") then
                    bootmode <= '1';
                elsif cpu_addr(15) = '1' then
                    bootmode <= '0';
                end if;
            end if;
        end if;
    end process;

--------------------------------------------------------
-- synchronize interrupts etc into Z80 core
--------------------------------------------------------

    sync_gen : process(cpu_clk, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            cpu_NMI_n_sync <= '1';
            cpu_IRQ_n_sync <= '1';
        elsif rising_edge(cpu_clk) then
            if (cpu_clken = '1') then
                cpu_NMI_n_sync <= cpu_NMI_n;
                cpu_IRQ_n_sync <= cpu_IRQ_n;            
            end if;
        end if;
    end process;
    
--------------------------------------------------------
-- clock enable generator
-- 00 - 28MHz = 56 / 2
-- 01 - 14MHz = 56 / 4
-- 10 - 08MHz = 56 / 7
-- 11 - 04MHz = 56 / 14
--------------------------------------------------------

    clk_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            case "00" & sw_out(1 downto 0) is
               when x"3"   =>
                   if (clken_counter = 1) then
                       clken_counter <= (others => '0');
                   else
                       clken_counter <= clken_counter + 1;
                   end if;
               when x"2"   =>
                   if (clken_counter = 3) then
                       clken_counter <= (others => '0');
                   else
                       clken_counter <= clken_counter + 1;
                   end if;
               when x"1"   =>
                   if (clken_counter = 6) then
                       clken_counter <= (others => '0');
                   else
                       clken_counter <= clken_counter + 1;
                   end if;
               when others   =>
                   if (clken_counter = 13) then
                       clken_counter <= (others => '0');
                   else
                       clken_counter <= clken_counter + 1;
                   end if;
            end case;
            cpu_clken     <= not clken_counter(3) and not clken_counter(2) and not clken_counter(1) and not clken_counter(0);
            RSTn_sync     <= RSTn;
        end if;
    end process;

end BEHAVIORAL;


