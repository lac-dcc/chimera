--------------------------------------------------------------------------------
-- Copyright (c) 2015 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : BusMonCore.vhd
-- /___/   /\     Timestamp : 30/05/2015
-- \   \  /  \
--  \___\/\___\
--
--Design Name: AtomBusMon
--Device: XC3S250E

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.OhoPack.all ;


entity BusMonCore is
    generic (
        num_comparators   : integer := 8;
        reg_width         : integer := 46;
        fifo_width        : integer := 72;
        avr_data_mem_size : integer := 1024 * 2; -- 2K is the mimimum
        avr_prog_mem_size : integer := 1024 * 8  -- Default is 8K, 6809 amd Z80 need 9K
    );
    port (
        clock_avr        : in    std_logic;

        busmon_clk       : in    std_logic;
        busmon_clken     : in    std_logic;
        cpu_clk          : in    std_logic;
        cpu_clken        : in    std_logic;

        -- CPU Signals
        Addr             : in    std_logic_vector(15 downto 0);
        Data             : in    std_logic_vector(7 downto 0);
        Rd_n             : in    std_logic;
        Wr_n             : in    std_logic;
        RdIO_n           : in    std_logic;
        WrIO_n           : in    std_logic;
        Sync             : in    std_logic;
        Rdy              : out   std_logic;
        nRSTin           : in    std_logic;
        nRSTout          : out   std_logic;

        CountCycle       : in    std_logic;

        -- CPU Registers
        -- unused in pure bus monitor mode
        Regs             : in    std_logic_vector(255 downto 0);

        -- CPI Specific data
        PdcData          : in    std_logic_vector(7 downto 0) := x"00";

        -- CPU Memory Read/Write
        -- unused in pure bus monitor mode
        RdMemOut         : out std_logic;
        WrMemOut         : out std_logic;
        RdIOOut          : out std_logic;
        WrIOOut          : out std_logic;
        ExecOut          : out std_logic;
        AddrOut          : out std_logic_vector(15 downto 0);
        DataOut          : out std_logic_vector(7 downto 0);
        DataIn           : in std_logic_vector(7 downto 0);
        Done             : in std_logic;

        -- External Interrupt Control
        int_ctrl         : out std_logic_vector(7 downto 0) := x"00";

        -- Single Step interface
        SS_Single        : out std_logic;
        SS_Step          : out std_logic;

        -- External trigger inputs
        trig             : in    std_logic_vector(1 downto 0);

        -- AVR Serial Port
        avr_RxD          : in    std_logic;
        avr_TxD          : out   std_logic;

        -- Switches
        sw_reset_cpu    : in    std_logic;
        sw_reset_avr    : in    std_logic;

        -- LEDs
        led_bkpt        : out   std_logic;
        led_trig0       : out   std_logic;
        led_trig1       : out   std_logic;

        -- OHO_DY1 connected to test connector
        tmosi            : out   std_logic;
        tdin             : out   std_logic;
        tcclk            : out   std_logic
    );
end BusMonCore;

architecture behavioral of BusMonCore is


    signal cpu_reset_n     : std_logic;
    signal nrst_avr        : std_logic;
    signal nrst1           : std_logic;
    signal nrst2           : std_logic;
    signal nrst3           : std_logic;

    -- debounce time is 2^17 / 16MHz = 8.192ms
    signal nrst_counter    : unsigned(17 downto 0);

    signal dy_counter      : std_logic_vector(31 downto 0);
    signal dy_data         : y2d_type ;

    signal mux             : std_logic_vector(7 downto 0);
    signal muxsel          : std_logic_vector(5 downto 0);
    signal cmd_edge        : std_logic;
    signal cmd_edge1       : std_logic;
    signal cmd_edge2       : std_logic;
    signal cmd_ack         : std_logic;
    signal cmd_ack1        : std_logic;
    signal cmd_ack2        : std_logic;
    signal cmd             : std_logic_vector(5 downto 0);

    signal addr_sync       : std_logic_vector(15 downto 0);
    signal addr_inst       : std_logic_vector(15 downto 0);
    signal Addr1           : std_logic_vector(15 downto 0);
    signal Data1           : std_logic_vector(7 downto 0);

    signal ext_clk         : std_logic;
    signal timer0Count     : std_logic_vector(23 downto 0);
    signal timer1Count     : std_logic_vector(23 downto 0);
    signal cycleCount      : std_logic_vector(23 downto 0);
    signal instrCount      : std_logic_vector(23 downto 0);

    signal single          : std_logic;
    signal reset           : std_logic;
    signal step            : std_logic;

    signal bw_status       : std_logic_vector(3 downto 0);
    signal bw_status1      : std_logic_vector(3 downto 0);

    signal auto_inc        : std_logic;

    signal brkpt_reg       : std_logic_vector(num_comparators * reg_width - 1 downto 0);
    signal brkpt_enable    : std_logic;
    signal brkpt_active    : std_logic;
    signal brkpt_active1   : std_logic;
    signal watch_active    : std_logic;

    signal fifo_din        : std_logic_vector(fifo_width - 1 downto 0);
    signal fifo_dout       : std_logic_vector(fifo_width - 1 downto 0);
    signal fifo_empty      : std_logic;
    signal fifo_full       : std_logic;
    signal fifo_not_empty1 : std_logic;
    signal fifo_not_empty2 : std_logic;
    signal fifo_rd         : std_logic;
    signal fifo_rd_en      : std_logic;
    signal fifo_wr         : std_logic;
    signal fifo_wr_en      : std_logic;
    signal fifo_rst        : std_logic;

    signal memory_rd       : std_logic;
    signal memory_wr       : std_logic;
    signal io_rd           : std_logic;
    signal io_wr           : std_logic;
    signal exec            : std_logic;
    signal addr_dout_reg   : std_logic_vector(23 downto 0);
    signal din_reg         : std_logic_vector(7 downto 0);

    signal Rdy_int         : std_logic;

    signal unused_d6       : std_logic;
    signal unused_d7       : std_logic;

    signal last_done       : std_logic;
    signal cmd_done        : std_logic;

    signal reset_counter   : std_logic_vector(9 downto 0);

    signal dropped_counter : std_logic_vector(3 downto 0);

    signal timer_mode      : std_logic_vector(1 downto 0);

begin

    inst_oho_dy1 : entity work.Oho_Dy1 port map (
        dy_clock       => clock_avr,
        dy_rst_n       => '1',
        dy_data        => dy_data,
        dy_update      => '1',
        dy_frame       => open,
        dy_frameend    => open,
        dy_frameend_c  => open,
        dy_pwm         => "1010",
        dy_counter     => dy_counter,
        dy_sclk        => tdin,
        dy_ser         => tcclk,
        dy_rclk        => tmosi
    );

    Inst_AVR8: entity work.AVR8
    generic map(
        CDATAMEMSIZE         => avr_data_mem_size,
        CPROGMEMSIZE         => avr_prog_mem_size
    )
    port map(
        clk16M               => clock_avr,
        nrst                 => nrst_avr,

        portain              => PdcData,
        portaout             => open,

        -- Command Port
        portbin(0)           => '0',
        portbin(1)           => '0',
        portbin(2)           => '0',
        portbin(3)           => '0',
        portbin(4)           => '0',
        portbin(5)           => '0',
        portbin(6)           => '0',
        portbin(7)           => '0',
        portbout(0)          => cmd(0),
        portbout(1)          => cmd(1),
        portbout(2)          => cmd(2),
        portbout(3)          => cmd(3),
        portbout(4)          => cmd(4),
        portbout(5)          => cmd(5),
        portbout(6)          => cmd_edge,
        portbout(7)          => open,

        -- Status Port
        portdin(0)           => '0',
        portdin(1)           => '0',
        portdin(2)           => '0',
        portdin(3)           => '0',
        portdin(4)           => '0',
        portdin(5)           => '0',
        portdin(6)           => cmd_ack2,
        portdin(7)           => fifo_not_empty2,

        portdout(0)           => muxsel(0),
        portdout(1)           => muxsel(1),
        portdout(2)           => muxsel(2),
        portdout(3)           => muxsel(3),
        portdout(4)           => muxsel(4),
        portdout(5)           => muxsel(5),
        portdout(6)           => unused_d6,
        portdout(7)           => unused_d7,

        -- Mux Port
        portein              => mux,
        porteout             => open,

        spi_mosio            => open,
        spi_scko             => open,
        spi_misoi            => '0',

        rxd                  => avr_RxD,
        txd                  => avr_TxD
        );

    -- Syncronise signals crossing busmon_clk / clock_avr boundary
    process (clock_avr)
    begin
        if rising_edge(clock_avr) then
            fifo_not_empty1 <= not fifo_empty;
            fifo_not_empty2 <= fifo_not_empty1;
            cmd_ack1        <= cmd_ack;
            cmd_ack2        <= cmd_ack1;
        end if;
    end process;


    WatchEvents_inst : entity work.WatchEvents port map(
        clk    => busmon_clk,
        srst   => fifo_rst,
        din    => fifo_din,
        wr_en  => fifo_wr_en,
        rd_en  => fifo_rd_en,
        dout   => fifo_dout,
        full   => fifo_full,
        empty  => fifo_empty
    );
    fifo_wr_en <= fifo_wr and busmon_clken;
    fifo_rd_en <= fifo_rd and busmon_clken;

    -- The fifo is writen the cycle after the break point
    -- Addr1 is the address bus delayed by 1 cycle
    -- DataWr1 is the data being written delayed by 1 cycle
    -- DataRd is the data being read, that is already one cycle late
    -- bw_state1(1) is 1 for writes, and 0 for reads
    fifo_din <= instrCount & dropped_counter & bw_status1 & Data1 & Addr1 & addr_inst;

    -- Implement a 4-bit saturating counter of the number of dropped events
    process (busmon_clk)
    begin
        if rising_edge(busmon_clk) then
            if busmon_clken = '1' then
                if fifo_rst = '1' then
                    dropped_counter <= x"0";
                elsif fifo_wr_en = '1' then
                    if fifo_full = '1' then
                        if dropped_counter /= x"F" then
                            dropped_counter <= dropped_counter + 1;
                        end if;
                    else
                        dropped_counter <= x"0";
                    end if;
                end if;
            end if;
        end if;
    end process;

    led_trig0 <= trig(0);
    led_trig1 <= trig(1);
    led_bkpt  <= brkpt_active;

    nrst_avr <= not sw_reset_avr;

    -- OHO DY1 Display for Testing
    dy_data(0) <= hex & "0000" & Addr(3 downto 0);
    dy_data(1) <= hex & "0000" & Addr(7 downto 4);
    dy_data(2) <= hex & "0000" & "00" & sw_reset_avr & sw_reset_cpu;

    mux <= addr_inst(7 downto 0)            when muxsel = 0 else
           addr_inst(15 downto 8)           when muxsel = 1 else
           din_reg                          when muxsel = 2 else
           instrCount(23 downto 16)         when muxsel = 3 else
           instrCount(7 downto 0)           when muxsel = 4 else
           instrCount(15 downto 8)          when muxsel = 5 else

           fifo_dout(7 downto 0)            when muxsel = 6 else
           fifo_dout(15 downto 8)           when muxsel = 7 else
           fifo_dout(23 downto 16)          when muxsel = 8 else
           fifo_dout(31 downto 24)          when muxsel = 9 else
           fifo_dout(39 downto 32)          when muxsel = 10 else
           fifo_dout(47 downto 40)          when muxsel = 11 else
           fifo_dout(55 downto 48)          when muxsel = 12 else
           fifo_dout(63 downto 56)          when muxsel = 13 else
           fifo_dout(71 downto 64)          when muxsel = 14 else

           Regs(8 * to_integer(unsigned(muxsel(4 downto 0))) + 7 downto 8 * to_integer(unsigned(muxsel(4 downto 0))));

    -- Combinatorial set of comparators to decode breakpoint/watch addresses
    brkpt_active_process: process (brkpt_reg, brkpt_enable, Addr, Sync, Rd_n, Wr_n, RdIO_n, WrIO_n, trig)
        variable i            : integer;
        variable reg_addr     : std_logic_vector(15 downto 0);
        variable reg_mask     : std_logic_vector(15 downto 0);
        variable reg_mode_bmr : std_logic;
        variable reg_mode_bmw : std_logic;
        variable reg_mode_bir : std_logic;
        variable reg_mode_biw : std_logic;
        variable reg_mode_bx  : std_logic;
        variable reg_mode_wmr : std_logic;
        variable reg_mode_wmw : std_logic;
        variable reg_mode_wir : std_logic;
        variable reg_mode_wiw : std_logic;
        variable reg_mode_wx  : std_logic;
        variable reg_mode_all : std_logic_vector(9 downto 0);
        variable bactive      : std_logic;
        variable wactive      : std_logic;
        variable status       : std_logic_vector(3 downto 0);
        variable trigval      : std_logic;
    begin
        bactive := '0';
        wactive := '0';
        status  := (others => '0');
        if (brkpt_enable = '1') then
            for i in 0 to num_comparators - 1 loop
                reg_addr     := brkpt_reg(i * reg_width + 15 downto i * reg_width);
                reg_mask     := brkpt_reg(i * reg_width + 31 downto i * reg_width + 16);
                reg_mode_bmr := brkpt_reg(i * reg_width + 32);
                reg_mode_wmr := brkpt_reg(i * reg_width + 33);
                reg_mode_bmw := brkpt_reg(i * reg_width + 34);
                reg_mode_wmw := brkpt_reg(i * reg_width + 35);
                reg_mode_bir := brkpt_reg(i * reg_width + 36);
                reg_mode_wir := brkpt_reg(i * reg_width + 37);
                reg_mode_biw := brkpt_reg(i * reg_width + 38);
                reg_mode_wiw := brkpt_reg(i * reg_width + 39);
                reg_mode_bx  := brkpt_reg(i * reg_width + 40);
                reg_mode_wx  := brkpt_reg(i * reg_width + 41);
                reg_mode_all := brkpt_reg(i * reg_width + 41 downto i * reg_width + 32);
                trigval      := brkpt_reg(i * reg_width + 42 + to_integer(unsigned(trig)));
                if (trigval = '1' and ((Addr and reg_mask) = reg_addr or (reg_mode_all = "0000000000"))) then
                    if (Sync = '1') then
                        if (reg_mode_bx = '1') then
                            bactive := '1';
                            status  := "1000";
                        elsif (reg_mode_wx = '1') then
                            wactive := '1';
                            status  := "1001";
                        end if;
                    elsif (Rd_n = '0') then
                        if (reg_mode_bmr = '1') then
                            bactive := '1';
                            status  := "0000";
                        elsif (reg_mode_wmr = '1') then
                            wactive := '1';
                            status  := "0001";
                        end if;
                    elsif (Wr_n = '0') then
                        if (reg_mode_bmw = '1') then
                            bactive := '1';
                            status  := "0010";
                        elsif (reg_mode_wmw = '1') then
                            wactive := '1';
                            status  := "0011";
                        end if;
                    elsif (RdIO_n = '0') then
                        if (reg_mode_bir = '1') then
                            bactive := '1';
                            status  := "0100";
                        elsif (reg_mode_wir = '1') then
                            wactive := '1';
                            status  := "0101";
                        end if;
                    elsif (WrIO_n = '0') then
                        if (reg_mode_biw = '1') then
                            bactive := '1';
                            status  := "0110";
                        elsif (reg_mode_wiw = '1') then
                            wactive := '1';
                            status  := "0111";
                        end if;
                    end if;
                end if;
            end loop;
        end if;
        watch_active <= wactive;
        brkpt_active <= bactive;
        bw_status    <= status;
    end process;

    -- CPU Control Commands
    -- 00000x Enable/Disable single stepping
    -- 00001x Enable/Disable breakpoints / watches
    -- 00010x Load breakpoint / watch register
    -- 00011x Reset CPU
    -- 001000 Singe Step CPU
    -- 001001 Read FIFO
    -- 001010 Reset FIFO
    -- 001011 Unused
    -- 00110x Load address/data register
    -- 00111x Unused
    -- 010000 Read Memory
    -- 010001 Read Memory and Auto Inc Address
    -- 010010 Write Memory
    -- 010011 Write Memory and Auto Inc Address
    -- 010100 Read IO
    -- 010101 Read IO and Auto Inc Address
    -- 010110 Write IO
    -- 010111 Write IO and Auto Inc Address
    -- 011000 Execute 6502 instruction
    -- 0111xx Unused
    -- 011x1x Unused
    -- 011xx1 Unused
    -- 10xxxx Int Ctrl
    -- 1100xx Timer Mode
    --     00 - count cpu cycles where clken = 1 and CountCycle = 1
    --     01 - count cpu cycles where clken = 1 (ignoring CountCycle)
    --     10 - free running timer, using busmon_clk as the source
    --     11 - free running timer, using trig0 as the source

    -- Use trig0 to drive a free running counter for absolute timings
    ext_clk <= trig(0);
    timer1Process: process (ext_clk)
    begin
        if rising_edge(ext_clk) then
            timer1Count <= timer1Count + 1;
        end if;
    end process;

    cpuProcess: process (busmon_clk)
    begin
        if rising_edge(busmon_clk) then
            timer0Count <= timer0Count + 1;
            if busmon_clken = '1' then
                -- Cycle counter
                if (cpu_reset_n = '0') then
                    cycleCount <= (others => '0');
                elsif (CountCycle = '1' or timer_mode(0) = '1') then
                    cycleCount <= cycleCount + 1;
                end if;
                -- Command processing
                cmd_edge1 <= cmd_edge;
                cmd_edge2 <= cmd_edge1;
                fifo_rd   <= '0';
                fifo_wr   <= '0';
                fifo_rst  <= '0';
                memory_rd <= '0';
                memory_wr <= '0';
                io_rd     <= '0';
                io_wr     <= '0';
                exec      <= '0';
                SS_Step   <= '0';
                if (cmd_edge2 /= cmd_edge1) then
                    if (cmd(5 downto 1) = "00000") then
                        single <= cmd(0);
                    end if;

                    if (cmd(5 downto 1) = "00001") then
                        brkpt_enable <= cmd(0);
                    end if;

                    if (cmd(5 downto 1) = "00010") then
                        brkpt_reg <= cmd(0) & brkpt_reg(brkpt_reg'length - 1 downto 1);
                    end if;

                    if (cmd(5 downto 1) = "00110") then
                        addr_dout_reg <= cmd(0) & addr_dout_reg(addr_dout_reg'length - 1 downto 1);
                    end if;

                    if (cmd(5 downto 1) = "00011") then
                        reset <= cmd(0);
                    end if;

                    if (cmd(5 downto 0) = "01001") then
                        fifo_rd <= '1';
                    end if;

                    if (cmd(5 downto 0) = "01010") then
                        fifo_rst <= '1';
                    end if;

                    if (cmd(5 downto 1) = "01000") then
                        memory_rd <= '1';
                        auto_inc  <= cmd(0);
                    end if;

                    if (cmd(5 downto 1) = "01001") then
                        memory_wr <= '1';
                        auto_inc  <= cmd(0);
                    end if;

                    if (cmd(5 downto 1) = "01010") then
                        io_rd <= '1';
                        auto_inc  <= cmd(0);
                    end if;

                    if (cmd(5 downto 1) = "01011") then
                        io_wr <= '1';
                        auto_inc  <= cmd(0);
                    end if;

                    if (cmd(5 downto 0) = "011000") then
                        exec <= '1';
                    end if;

                    if (cmd(5 downto 4) = "10") then
                        int_ctrl(to_integer(unsigned(cmd(3 downto 2))) * 2 + 1 downto to_integer(unsigned(cmd(3 downto 2))) * 2) <= cmd(1 downto 0);
                    end if;

                    if (cmd(5 downto 2) = "1100") then
                        timer_mode <= cmd(1 downto 0);
                    end if;

                    -- Acknowlege certain commands immediately
                    if cmd(5 downto 4) /= "01" then
                        cmd_ack <= not cmd_ack;
                    end if;

                end if;

                if cmd_done = '1' then
                    -- Acknowlege memory access commands when thet complete
                    cmd_ack <= not cmd_ack;
                    -- Auto increment the memory address reg the cycle after a rd/wr
                    if auto_inc = '1' then
                        addr_dout_reg(23 downto 8) <= addr_dout_reg(23 downto 8) + 1;
                    end if;
                end if;

                -- Single Stepping
                if (brkpt_active = '1') then
                    single <= '1';
                end if;

                if ((single = '0') or (cmd_edge2 /= cmd_edge1 and cmd = "001000")) then
                    Rdy_int <= (not brkpt_active);
                    SS_Step <= (not brkpt_active);
                else
                    Rdy_int <= (not Sync);
                end if;

                -- Latch instruction address for the whole cycle
                if (Sync = '1') then
                    addr_inst <= Addr;
                    if timer_mode = "10" then
                        instrCount <= timer0Count;
                    elsif timer_mode = "11" then
                        instrCount <= timer1Count;
                    else
                        instrCount <= cycleCount;
                    end if;
                end if;

                -- Breakpoints and Watches written to the FIFO
                brkpt_active1 <= brkpt_active;
                bw_status1    <= bw_status;
                if watch_active = '1' or (brkpt_active = '1' and brkpt_active1 = '0') then
                    fifo_wr <= '1';
                    Addr1 <= Addr;
                end if;
            end if;
        end if;
    end process;

    dataProcess: process (cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if cpu_clken = '1' then
                -- Latch the data bus for use in watches
                Data1 <= Data;
                -- Latch memory read in response to a read command
                if (Done = '1') then
                    din_reg <= DataIn;
                end if;
                -- Delay the increnting of the address by one cycle
                last_done <= Done;
                if Done = '1' and last_done = '0' then
                    cmd_done <= '1';
                else
                    cmd_done <= '0';
                end if;
            end if;
        end if;
    end process;

    Rdy <= Rdy_int;
    RdMemOut <= memory_rd;
    WrMemOut <= memory_wr;
    RdIOOut <= io_rd;
    WrIOOut <= io_wr;
    AddrOut <= addr_dout_reg(23 downto 8);
    DataOut <= addr_dout_reg(7 downto 0);
    SS_Single <= single;
    ExecOut <= exec;

    -- Reset Logic
    -- Generate a short (~1ms @ 1MHz) power up reset pulse
    --
    -- This is in case FPGA configuration takes longer than
    -- the length of the host system reset pulse.
    --
    -- Some 6502 cores (particularly the AlanD core) needs
    -- reset to be asserted to start.



    -- Debounce nRSTin using clock_avr as this is always 16MHz
    --    nrst1 is the possibly glitchy input
    --    nrst2 is the filtered output
    process(clock_avr)
    begin
        if rising_edge(clock_avr) then
            -- Syncronise nRSTin
            nrst1 <= nRSTin and (not sw_reset_cpu);
            -- De-glitch NRST
            if nrst1 = '0' then
                nrst_counter <= to_unsigned(0, nrst_counter'length);
                nrst2 <= '0';
            elsif nrst_counter(nrst_counter'high) = '0' then
                nrst_counter <= nrst_counter + 1;
            else
                nrst2 <= '1';
            end if;
        end if;
    end process;


    process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if cpu_clken = '1' then
                if reset_counter(reset_counter'high) = '0' then
                    reset_counter <= reset_counter + 1;
                end if;
                nrst3 <= nrst2 and reset_counter(reset_counter'high) and (not reset);
                cpu_reset_n <= nrst3;
            end if;
        end if;
    end process;

    nRSTout <= cpu_reset_n;

end behavioral;
