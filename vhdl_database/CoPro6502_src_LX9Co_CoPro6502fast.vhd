library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LX9CoPro6502fast is
    generic (
       UseAlanDCore  : boolean := false;
       UseArletCore  : boolean := true
       );
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
        ram_data     : inout std_logic_vector (15 downto 0)
    );
end LX9CoPro6502fast;

architecture BEHAVIORAL of LX9CoPro6502fast is

-------------------------------------------------
-- clock and reset signals
-------------------------------------------------

    signal clk_cpu       : std_logic;
    signal cpu_clken     : std_logic;
    signal bootmode      : std_logic;
    signal RSTn          : std_logic;
    signal RSTn_sync     : std_logic;
    signal clken_counter : std_logic_vector (4 downto 0);
    signal reset_counter : std_logic_vector (8 downto 0);
    
-------------------------------------------------
-- parasite signals
-------------------------------------------------
    
    signal p_cs_b        : std_logic;
    signal bank_cs_b     : std_logic;
    signal p_data_out    : std_logic_vector (7 downto 0);

-------------------------------------------------
-- ram/rom signals
-------------------------------------------------

    signal ram_cs_b         : std_logic;
    signal rom_cs_b         : std_logic;
    signal rom_data_out     : std_logic_vector (7 downto 0);
    signal int_ram_data_out : std_logic_vector (7 downto 0);
    signal ext_ram_data_out : std_logic_vector (7 downto 0);

-------------------------------------------------
-- bank registers and physical address bus
-------------------------------------------------

    signal ext_ram            : std_logic;
    signal ext_ram_next       : std_logic;
    signal ext_ram_we         : std_logic;
    signal ext_ram_we_next    : std_logic;

    signal int_ram            : std_logic;
    signal int_ram_next       : std_logic;
    signal int_ram_we_next    : std_logic;

    signal physical_addr      : std_logic_vector (20 downto 0);
    signal physical_addr_next : std_logic_vector (20 downto 0);
    
    -- bit 7 = 0 for internal RAM, 1 for external RAM
    type bank_reg_type is array (0 to 7) of std_logic_vector (7 downto 0);
    signal bank_reg : bank_reg_type;

-------------------------------------------------
-- cpu signals
-------------------------------------------------

    signal debug_clk  : std_logic;
    signal cpu_R_W_n  : std_logic;
    signal cpu_addr   : std_logic_vector (15 downto 0);
    signal cpu_addr_us: unsigned (15 downto 0);
    signal cpu_din    : std_logic_vector (7 downto 0);
    signal cpu_dout   : std_logic_vector (7 downto 0);
    signal cpu_dout_us: unsigned (7 downto 0);
    signal cpu_IRQ_n  : std_logic;
    signal cpu_NMI_n  : std_logic;
    signal cpu_IRQ_n_sync  : std_logic;
    signal cpu_NMI_n_sync  : std_logic;
    signal sync       : std_logic;

    -- Lookahead (unregistered) signals
    signal p_cs_b_next      : std_logic;
    signal bank_cs_b_next   : std_logic;
    signal ram_cs_b_next    : std_logic;
    signal rom_cs_b_next    : std_logic;    
    signal cpu_dout_next    : std_logic_vector (7 downto 0);
    signal cpu_dout_next_us : unsigned (7 downto 0);
    signal cpu_addr_next    : std_logic_vector (15 downto 0);
    signal cpu_addr_next_us : unsigned (15 downto 0);
    signal cpu_we_next      : std_logic;
    signal cpu_R_W_n_next   : std_logic;
    
    signal digit1_cs_b : std_logic;
    signal digit2_cs_b : std_logic;
    signal digit1      : std_logic_vector (7 downto 0);
    signal digit2      : std_logic_vector (7 downto 0);

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
    
    inst_dcm_cpu_clk : entity work.dcm_32_64 port map (
        CLKIN_IN  => fastclk,
        CLK0_OUT  => clk_cpu,
        CLK0_OUT1 => open,
        CLK2X_OUT => open
    );

    inst_tuberom : entity work.tuberom_65c102_banner port map (
        CLK             => clk_cpu,
        ADDR            => cpu_addr(10 downto 0),
        DATA            => rom_data_out
    );
    
    GenAlanDCore: if UseAlanDCore generate
        inst_r65c02: entity work.r65c02 port map(
            reset     => RSTn_sync,
            clk       => clk_cpu,
            enable    => cpu_clken,
            nmi_n     => cpu_NMI_n_sync,
            irq_n     => cpu_IRQ_n_sync,
            di        => unsigned(cpu_din),
            do_next   => cpu_dout_next_us,
            do        => cpu_dout_us,
            addr_next => cpu_addr_next_us,
            addr      => cpu_addr_us,
            nwe_next  => cpu_R_W_n_next,
            nwe       => cpu_R_W_n,
            sync      => sync,
            sync_irq  => open
            );

        cpu_dout      <= std_logic_vector(cpu_dout_us);
        cpu_addr      <= std_logic_vector(cpu_addr_us);
        cpu_dout_next <= std_logic_vector(cpu_dout_next_us);
        cpu_addr_next <= std_logic_vector(cpu_addr_next_us);
    end generate;

    GenArletCore: if UseArletCore generate        
        inst_arlet_6502: entity work.cpu_65c02 port map(
            clk   => clk_cpu,
            reset => not RSTn_sync,
            AB    => cpu_addr_next,
            DI    => cpu_din,
            DO    => cpu_dout_next,
            WE    => cpu_we_next,
            IRQ   => not cpu_IRQ_n_sync,
            NMI   => not cpu_NMI_n_sync,
            RDY   => cpu_clken
            );

        cpu_R_W_n_next <= not cpu_we_next;        

        process(clk_cpu)
        begin
            if rising_edge(clk_cpu) then
                if cpu_clken = '1' then
                    cpu_addr              <= cpu_addr_next;
                    cpu_dout              <= cpu_dout_next;
                    cpu_R_W_n             <= cpu_R_W_n_next;
                end if;
            end if;
        end process;            
    end generate;
    
    inst_tube: entity work.tube port map (
        h_addr          => h_addr,
        h_cs_b          => h_cs_b,
        h_data          => h_data,
        h_phi2          => h_phi2,
        h_rdnw          => h_rdnw,
        h_rst_b         => h_rst_b,
        h_irq_b         => h_irq_b,
        p_addr          => cpu_addr(2 downto 0),
        p_cs_b          => not((not p_cs_b) and cpu_clken),
        p_data_in       => cpu_dout,
        p_data_out      => p_data_out,
        p_rdnw          => cpu_R_W_n,
        p_phi2          => clk_cpu,
        p_rst_b         => RSTn,
        p_nmi_b         => cpu_NMI_n,
        p_irq_b         => cpu_IRQ_n
    );

    Inst_RAM_64K: entity work.RAM_64K PORT MAP(
        clk     => clk_cpu,
        we_uP   => int_ram_we_next,
        ce      => cpu_clken,
        addr_uP => physical_addr_next(15 downto 0),
        D_uP    => cpu_dout_next,
        Q_uP    => int_ram_data_out
    );

    p_cs_b <= '0' when cpu_addr(15 downto 3) = 2#1111_1110_1111_1# else '1';
   
    bank_cs_b <= '0' when cpu_addr(15 downto 3) = 2#1111_1110_1110_0# else '1';

    rom_cs_b <= '0' when cpu_addr(15 downto 11) = "11111" and cpu_R_W_n = '1' and bootmode = '1' else '1';

    digit1_cs_b <= '0' when rom_cs_b = '0' and cpu_addr(11 downto 0) = x"86F" else '1';
    digit2_cs_b <= '0' when rom_cs_b = '0' and cpu_addr(11 downto 0) = x"870" else '1';

    -- Original: Acorn TUBE 65C102 Co-Processor
    -- Updated:  Acorn TUBE 64MHz 65C102 Co-Pro
    
    digit1 <= x"36" when sw_out(1 downto 0) = "11" else
              x"31" when sw_out(1 downto 0) = "10" else
              x"30"; 

    digit2 <= x"33" when sw_out(1 downto 0) = "00" else
              x"36" when sw_out(1 downto 0) = "10" else
              x"34";
    
    ram_cs_b <= '0' when bank_cs_b = '1' and p_cs_b = '1' and rom_cs_b = '1' else '1';

    -- Look ahead versions of the chip selects
    p_cs_b_next <= '0' when cpu_addr_next(15 downto 3) = 2#1111_1110_1111_1# else '1';
    bank_cs_b_next <= '0' when cpu_addr_next(15 downto 3) = 2#1111_1110_1110_0# else '1';
    rom_cs_b_next <= '0' when cpu_addr_next(15 downto 11) = "11111" and cpu_R_W_n_next = '1' and bootmode = '1' else '1';
    ram_cs_b_next <= '0' when p_cs_b_next = '1' and bank_cs_b_next = '1' and rom_cs_b_next = '1' else '1';

    cpu_din <=
        p_data_out        when p_cs_b      = '0' else
        digit1            when digit1_cs_b = '0' else 
        digit2            when digit2_cs_b = '0' else 
        rom_data_out      when rom_cs_b    = '0' else
        int_ram_data_out  when int_ram     = '1' else
        ext_ram_data_out  when ext_ram     = '1' else
        x"f1";

    
--------------------------------------------------------
-- bank registers
--------------------------------------------------------

    process (clk_cpu, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            bank_reg(0) <= x"00";
            bank_reg(1) <= x"01";
            bank_reg(2) <= x"02";
            bank_reg(3) <= x"03";
            bank_reg(4) <= x"04";
            bank_reg(5) <= x"05";
            bank_reg(6) <= x"06";
            bank_reg(7) <= x"07";            
        elsif rising_edge(clk_cpu) then
            if cpu_clken = '1' then
                int_ram <= int_ram_next;
                ext_ram <= ext_ram_next;
                if bank_cs_b = '0' and cpu_R_W_n = '0' and bootmode = '0' then
                    bank_reg(conv_integer(cpu_addr(2 downto 0))) <= cpu_dout;
                end if;
            end if;
        end if;
    end process;

    physical_addr_next <= bank_reg(conv_integer(cpu_addr_next(15 downto 13))) & cpu_addr_next(12 downto 0);
    
    int_ram_next    <= '1' when ram_cs_b_next = '0' and physical_addr_next(20) = '0' else
                       '0';

    ext_ram_next    <= '1' when ram_cs_b_next = '0' and physical_addr_next(20) = '1' else
                       '0';

    int_ram_we_next <= '1' when int_ram_next = '1' and cpu_R_W_n_next = '0' else
                       '0';

    ext_ram_we_next <= '1' when ext_ram_next = '1' and cpu_R_W_n_next = '0' else
                       '0';
    
--------------------------------------------------------
-- external Ram
--
-- note: dispite the naming, all control signals are active low
--------------------------------------------------------
    process (clk_cpu)
    begin
        if rising_edge(clk_cpu) then
            if cpu_clken = '1' then
                ext_ram_we <= ext_ram_we_next;
                physical_addr <= physical_addr_next;
            end if;
        end if;
    end process;

    -- With 4 wait states, an external RAM cycle lasts ~80ns
    -- To provide some address setup/hold margin we generate
    -- a gated write signal off the falling edge of the clock
    -- which gives half a cycle of setup/hold margin
    process (clk_cpu)
    begin
        if falling_edge(clk_cpu) then
            if ext_ram_we = '1' and clken_counter > 0 then
                ram_wr <= '0';
            else
                ram_wr <= '1';
            end if;
        end if;
    end process;

    ram_ub_b  <= not physical_addr(19);
    ram_lb_b  <= physical_addr(19);
    ram_cs    <= not ext_ram;
    ram_oe    <= ext_ram_we;
    ram_addr  <= physical_addr(18 downto 0);
    ram_data  <= (cpu_dout & cpu_dout) when ext_ram_we = '1' else (others => 'Z');

    ext_ram_data_out <= ram_data(15 downto 8) when physical_addr(19) = '1' else ram_data(7 downto 0);
            
--------------------------------------------------------
-- test signals
--------------------------------------------------------
    -- default to hi-impedence, to avoid conflicts with
    -- a Raspberry Pi connected to the test connector
    test <= (others => 'Z');
    
--------------------------------------------------------
-- boot mode generator
--------------------------------------------------------
    boot_gen : process(clk_cpu, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            bootmode <= '1';
        elsif rising_edge(clk_cpu) then
            if p_cs_b = '0' then
                bootmode <= '0';
            end if;
        end if;
    end process;

--------------------------------------------------------
-- power up reset
--------------------------------------------------------
    reset_gen : process(clk_cpu)
    begin
        if rising_edge(clk_cpu) then
            if (reset_counter(8) = '0') then
                reset_counter <= reset_counter + 1;
            end if;
            RSTn_sync <= RSTn AND reset_counter(8);
        end if;
    end process;

--------------------------------------------------------
-- interrupt synchronization
--------------------------------------------------------
    sync_gen : process(clk_cpu, RSTn_sync)
    begin
        if RSTn_sync = '0' then
            cpu_NMI_n_sync <= '1';
            cpu_IRQ_n_sync <= '1';
        elsif rising_edge(clk_cpu) then
            if (cpu_clken = '1') then
                cpu_NMI_n_sync <= cpu_NMI_n;
                cpu_IRQ_n_sync <= cpu_IRQ_n;
            end if;
        end if;
    end process;

--------------------------------------------------------
-- clock enable generator
--------------------------------------------------------
    clk_gen : process(clk_cpu)
    begin
        if rising_edge(clk_cpu) then
            if clken_counter = 0 then
                case sw_out(1 downto 0) is
                    when "11" =>
                        -- 64MHz
                        if rom_cs_b_next = '0' then
                            -- Add one wait state for ROM accesses
                            clken_counter <= "0" & x"1";
                        elsif ext_ram_next = '1' then
                            -- Add four wait states for external RAM accesses                        
                            clken_counter <= "0" & x"4";
                        else
                            -- Full speed ahead!
                            clken_counter <= "0" & x"0";                        
                        end if;                  
                    when "10" =>
                        -- 16MHz
                        if ext_ram_next = '1' then
                            -- Add four wait states for external RAM accesses                        
                            clken_counter <= "0" & x"4";
                        else
                            -- Quarter speed ahead!
                            clken_counter <= "0" & x"3";
                        end if; 
                    when "01" =>
                        -- 4MHz
                        -- Running so slowly there is need to special case external RAM accesses
                        clken_counter <= "0" & x"F";
                    when "00" =>
                        -- 2.91MHz
                        -- Running so slowly there is need to special case external RAM accesses
                        clken_counter <= "1" & x"5";
                    when others =>
                        -- there are no others
                end case;                
            else
                clken_counter <= clken_counter - 1;
            end if;
        end if;
    end process;

    cpu_clken <= '1' when clken_counter = 0 else '0';
    
end BEHAVIORAL;


