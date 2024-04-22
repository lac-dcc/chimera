library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoProPDP11 is
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
end LX9CoProPDP11;

architecture BEHAVIORAL of LX9CoProPDP11 is

-------------------------------------------------
-- clock and reset signals
-------------------------------------------------

    signal clk_cpu       : std_logic;
    signal clk_ram       : std_logic;
    signal clk_tube      : std_logic;
    signal RSTn          : std_logic;
    signal RST_sync      : std_logic;
    signal clken_counter : std_logic_vector (3 downto 0);
    signal reset_counter : std_logic_vector (8 downto 0);

-------------------------------------------------
-- parasite signals
-------------------------------------------------

    signal p_cs_b        : std_logic;
    signal p_data_out    : std_logic_vector (7 downto 0);

-------------------------------------------------
-- ram/rom signals
-------------------------------------------------

    signal ram_cs_b        : std_logic;
    signal ram_wr_lo       : std_logic;
    signal ram_wr_hi       : std_logic;
    signal rom_cs_b        : std_logic;
    signal rom_data_out    : std_logic_vector (15 downto 0);
    signal ram_data_in     : std_logic_vector (15 downto 0);
    signal ram_data_out    : std_logic_vector (15 downto 0);
-------------------------------------------------
-- cpu signals
-------------------------------------------------

    signal cpu_rd          : std_logic;
    signal cpu_wr          : std_logic;
    signal cpu_dw8         : std_logic;
    signal cpu_addr        : std_logic_vector (15 downto 0);
    signal cpu_addr2       : std_logic_vector (15 downto 0);
    signal cpu_din         : std_logic_vector (15 downto 0);
    signal cpu_dout        : std_logic_vector (15 downto 0);
    signal cpu_IRQ_n       : std_logic;
    signal cpu_NMI_n       : std_logic;
    signal cpu_IRQ_n1      : std_logic;
    signal cpu_NMI_n1      : std_logic;
    signal cpu_IRQ_n2      : std_logic;
    signal cpu_NMI_n2      : std_logic;
    signal cpu_IRQ_req     : std_logic;
    signal cpu_NMI_req     : std_logic;
    signal cpu_IRQ_ack     : std_logic;
    signal cpu_NMI_ack     : std_logic;
    signal cpu_PSW         : std_logic_vector (15 downto 0);
    signal cpu_cp          : std_logic;
    signal ifetch          : std_logic;
    signal bg6             : std_logic;

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

    inst_tuberom : entity work.tuberom_pdp11 port map (
        CLK             => clk_ram,
        ADDR            => cpu_addr(10 downto 1),
        DATA            => rom_data_out
    );

    inst_pdp11 : entity work.pdp2011_cpu port map (
      clk             => clk_cpu,         -- input clock
      reset           => RST_sync,        -- reset cpu, also causes init signal to devices on the bus to be asserted
      addr_v          => cpu_addr,        -- the virtual address that the cpu drives out to the bus for the current read or write
      datain          => cpu_din,         -- when doing a read, the data input to the cpu
      dataout         => cpu_dout,        -- when doing a write, the data output from the cpu
      wr              => cpu_wr,          -- if '1', the cpu is doing a write to the bus and drives addr_v and dataout
      rd              => cpu_rd,          -- if '1', the cpu is doing a read from the bus, drives addr_v and reads datain
      dw8             => cpu_dw8,         -- if '1', the read or write initiated by the cpu is 8 bits wide
      cp              => cpu_cp,          -- if '1', the read or write should use the previous cpu mode
      ifetch          => ifetch,          -- if '1', this read is for an instruction fetch
      id              => open,            -- if '1', the read or write should use data space
      init            => open,            -- if '1', the devices on the bus should reset
      iwait           => open,            -- if '1', the cpu is waiting for an interrupt
      br7             => cpu_NMI_req,     -- interrupt request, 7
      bg7             => cpu_NMI_ack,     -- interrupt grant, 7
      int_vector7     => "0" & x"80",     -- interrupt vector, 7
      br6             => cpu_IRQ_req,     -- interrupt request, 6
      bg6             => cpu_IRQ_ack,     -- interrupt grant, 6
      int_vector6     => "0" & x"84",     -- interrupt vector, 6
      br5             => '0',             -- interrupt request, 5
      bg5             => open,            -- interrupt grant, 5
      int_vector5     => (others => '0'), -- interrupt vector, 5
      br4             => '0',             -- interrupt request, 4
      bg4             => open,            -- interrupt grant, 4
      int_vector4     => (others => '0'), -- interrupt vector, 4
      mmutrap         => '0',             -- if '1', the mmu requests a trap to be serviced after the current instruction completes
      ack_mmutrap     => open,            -- if '1', the mmu trap request is being acknowledged
      mmuabort        => '0',             -- if '1', the mmu requests that the current instruction is aborted because of a mmu fault
      ack_mmuabort    => open,            -- if '1', the mmu abort request is being acknowledged
      npr             => '0',             -- non-processor request
      npg             => open,            -- non-processor grant
      nxmabort        => '0',             -- nxm abort - a memory access cycle by the cpu refers to an address that does not exist
      oddabort        => '0',             -- odd abort - a memory access cycle by the cpu is for a full word, but uses an odd address
      illhalt         => open,            -- a halt instruction was not executed because it was illegal in the current mode; for use in the cer cpu error register
      ysv             => open,            -- a yellow stack trap is in progress - for use in the cer cpu error register
      rsv             => open,            -- a red stack trap is in progress - for use in the cer cpu error register
      cpu_stack_limit => x"0100",         -- the cpu stack limit control register value
      cpu_kmillhalt   => '0',             -- the control register setting for kernel mode illegal halt
      sr0_ic          => open,            -- sr0/mmr0 instruction complete flag
      sr1             => open,            -- sr1/mmr1, address of the current instruction
      sr2             => open,            -- sr2, register autoincrement/autodecrement information for instruction restart
      dstfreference   => open,            -- if '1', the destination reference is the final reference for this addressing mode
      sr3csmenable    => '0',             -- if '1', the enable csm instruction flag in sr3/mmr3 is set
      psw_in          => x"0000",         -- psw input from the control register address @ 177776
      psw_in_we_even  => '0',             -- psw input from the control register address @ 177776, write enable for the even address part
      psw_in_we_odd   => '0',             -- psw input from the control register address @ 177776, write enable for the odd address part
      psw_out         => cpu_PSW,         -- psw output, current psw that the cpu uses
      pir_in          => x"0000",         -- pirq value input from the control register
      modelcode       => 40,              -- cpu model code
      init_r7         => x"f800",         -- start address after reset = o'173000' = m9312 hi rom
      init_psw        => x"00a0"          -- initial psw sets interrupt priority 5, allowing BR6 and BR7
    );

    inst_tube: entity work.tube port map (
        h_addr          => h_addr,
        h_cs_b          => h_cs_b,
        h_data          => h_data,
        h_phi2          => h_phi2,
        h_rdnw          => h_rdnw,
        h_rst_b         => h_rst_b,
        h_irq_b         => h_irq_b,
        p_addr          => cpu_addr(3 downto 1),
        p_cs_b          => p_cs_b,
        p_data_in       => cpu_dout(7 downto 0),
        p_data_out      => p_data_out,
        p_rdnw          => not cpu_wr,
        p_phi2          => clk_tube,
        p_rst_b         => RSTn,
        p_nmi_b         => cpu_NMI_n,
        p_irq_b         => cpu_IRQ_n
    );

    Inst_RAM_lo: entity work.RAM_32K PORT MAP(
        clk     => clk_ram,
        we_uP   => ram_wr_lo,
        ce      => '1',
        addr_uP => cpu_addr2(15 downto 1),
        D_uP    => ram_data_in(7 downto 0),
        Q_uP    => ram_data_out(7 downto 0)
    );

    Inst_RAM_hi: entity work.RAM_32K PORT MAP(
        clk     => clk_ram,
        we_uP   => ram_wr_hi,
        ce      => '1',
        addr_uP => cpu_addr2(15 downto 1),
        D_uP    => ram_data_in(15 downto 8),
        Q_uP    => ram_data_out(15 downto 8)
    );

    -- provide a seperare page 0 for Kernel mode ("00") vs user mode ("11")
    cpu_addr2 <= cpu_addr when cpu_addr >= x"0100" else
                 cpu_addr when cpu_PSW(15 downto 14) = "00" and cpu_cp = '0' else
                 cpu_addr when cpu_PSW(13 downto 12) = "00" and cpu_cp = '1' else
                 "11111" & cpu_addr(10 downto 0);

    p_cs_b   <= '0' when (cpu_rd = '1' or cpu_wr = '1') and cpu_addr(15 downto 4) = x"FFF" else '1';
    rom_cs_b <= '0' when (cpu_rd = '1' or cpu_wr = '1') and p_cs_b = '1' and cpu_addr(15 downto 11) = "11111" else '1';
    ram_cs_b <= '0' when (cpu_rd = '1' or cpu_wr = '1') and p_cs_b = '1' and rom_cs_b = '1' else '1';

    -- TODO implement fault for non-aligned word access
    ram_wr_lo <= '1' when ram_cs_b = '0' and cpu_wr = '1' and (cpu_dw8 = '0' or cpu_addr(0) = '0') else '0';
    ram_wr_hi <= '1' when ram_cs_b = '0' and cpu_wr = '1' and (cpu_dw8 = '0' or cpu_addr(0) = '1') else '0';

    cpu_din <=
        x"ff" & p_data_out                when p_cs_b = '0' else
        rom_data_out                      when rom_cs_b = '0' and cpu_dw8 = '0' else
        x"ff" & rom_data_out(7 downto 0)  when rom_cs_b = '0' and cpu_dw8 = '1' and cpu_addr(0) = '0' else
        x"ff" & rom_data_out(15 downto 8) when rom_cs_b = '0' and cpu_dw8 = '1' and cpu_addr(0) = '1' else
        ram_data_out                      when ram_cs_b = '0' and cpu_dw8 = '0' else
        x"ff" & ram_data_out(7 downto 0)  when ram_cs_b = '0' and cpu_dw8 = '1' and cpu_addr(0) = '0' else
        x"ff" & ram_data_out(15 downto 8) when ram_cs_b = '0' and cpu_dw8 = '1' and cpu_addr(0) = '1' else
        x"f1f1";

    ram_data_in <= x"ff" & cpu_dout(7 downto 0) when cpu_dw8 = '1' and cpu_addr(0) = '0' else
                   cpu_dout(7 downto 0) & x"ff" when cpu_dw8 = '1' and cpu_addr(0) = '1' else
                   cpu_dout;

--------------------------------------------------------
-- external Ram unused
--------------------------------------------------------
    ram_ub_b  <= '1';
    ram_lb_b  <= '1';
    ram_cs    <= '1';
    ram_oe    <= '1';
    ram_wr    <= '1';
    ram_addr  <= (others => '1');
    ram_data  <= (others => '1');

--------------------------------------------------------
-- test signals
--------------------------------------------------------

    -- default to hi-impedence, to avoid conflicts with
    -- a Raspberry Pi connected to the test connector
    test <= (others => 'Z');

--------------------------------------------------------
-- clock enable generator
--------------------------------------------------------
    clk_cpu       <= fastclk;
    clk_tube      <= fastclk;
    clk_ram       <= not fastclk;

--------------------------------------------------------
-- power up reset
--------------------------------------------------------
    reset_gen : process(clk_cpu)
    begin
        if rising_edge(clk_cpu) then
            if (reset_counter(8) = '0') then
                reset_counter <= reset_counter + 1;
            end if;
            RST_sync <= not (RSTn AND reset_counter(8));
        end if;
    end process;

--------------------------------------------------------
-- interrupt synchronization
--------------------------------------------------------
    sync_gen : process(clk_cpu, RST_sync)
    begin
        if RST_sync = '1' then
            cpu_NMI_req <= '0';
            cpu_IRQ_req <= '0';
            cpu_NMI_n1 <= '1';
            cpu_NMI_n2 <= '1';
            cpu_IRQ_n1 <= '1';
            cpu_IRQ_n2 <= '1';
        elsif rising_edge(clk_cpu) then
            cpu_NMI_n1 <= cpu_NMI_n;
            cpu_NMI_n2 <= cpu_NMI_n1;
            cpu_IRQ_n1 <= cpu_IRQ_n;
            cpu_IRQ_n2 <= cpu_IRQ_n1;
            if (CPU_NMI_ack = '1') then
                cpu_NMI_req <= '0';
            elsif (CPU_NMI_n1 = '0' and CPU_NMI_n2 = '1') then
                cpu_NMI_req <= '1';
            end if;
            if (CPU_IRQ_ack = '1') then
                cpu_IRQ_req <= '0';
            elsif (CPU_IRQ_n1 = '0' and CPU_IRQ_n2 = '1') then
                cpu_IRQ_req <= '1';
            end if;
        end if;
    end process;


end BEHAVIORAL;


