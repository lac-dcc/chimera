--------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : Z80CpuMon.vhd
-- /___/   /\     Timestamp : 14/10/2018
-- \   \  /  \
--  \___\/\___\
--
--Design Name: Z80CpuMon
--Device: multiple

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Z80CpuMon is
    generic (
       ClkMult           : integer;
       ClkDiv            : integer;
       ClkPer            : real;
       num_comparators   : integer;
       avr_prog_mem_size : integer
       );
    port (
        clock           : in    std_logic;

        -- Z80 Signals
        RESET_n         : in    std_logic;
        CLK_n           : in    std_logic;
        WAIT_n          : in    std_logic;
        INT_n           : in    std_logic;
        NMI_n           : in    std_logic;
        BUSRQ_n         : in    std_logic;
        M1_n            : out   std_logic;
        MREQ_n          : out   std_logic;
        IORQ_n          : out   std_logic;
        RD_n            : out   std_logic;
        WR_n            : out   std_logic;
        RFSH_n          : out   std_logic;
        HALT_n          : out   std_logic;
        BUSAK_n         : out   std_logic;
        Addr            : out   std_logic_vector(15 downto 0);
        Data            : inout std_logic_vector(7 downto 0);

        -- Buffer Control Signals
        DIRD            : out   std_logic;
        tristate_n      : out   std_logic;
        tristate_ad_n   : out   std_logic;

        -- Mode jumper, tie low to generate NOPs when paused
        mode            : in    std_logic;

        -- External trigger inputs
        trig            : in    std_logic_vector(1 downto 0);

        -- Serial Console
        avr_RxD         : in    std_logic;
        avr_TxD         : out   std_logic;

        -- Switches
        sw_reset_cpu    : in    std_logic;
        sw_reset_avr    : in    std_logic;

        -- LEDs
        led_bkpt        : out   std_logic;
        led_trig0       : out   std_logic;
        led_trig1       : out   std_logic;

        -- OHO_DY1 connected to test connector
        tmosi           : out   std_logic;
        tdin            : out   std_logic;
        tcclk           : out   std_logic;

        -- Debugging signals
        test1           : out   std_logic;
        test2           : out   std_logic;
        test3           : out   std_logic;
        test4           : out   std_logic

    );
end Z80CpuMon;

architecture behavioral of Z80CpuMon is

type state_type is (idle, nop_t1, nop_t2, nop_t3, nop_t4, rd_t1, rd_wa, rd_t2, rd_t3, wr_t1, wr_wa, wr_t2, wr_t3, busack);

    signal state          : state_type;

    signal clock_avr      : std_logic;

    signal cpu_reset_n    : std_logic;
    signal cpu_clk        : std_logic;
    signal cpu_clken      : std_logic;
    signal busmon_clk     : std_logic;

    signal Addr_int       : std_logic_vector(15 downto 0);
    signal Addr1          : std_logic_vector(15 downto 0);
    signal Addr2          : std_logic_vector(15 downto 0);
    signal RD_n_int       : std_logic;
    signal WR_n_int       : std_logic;
    signal MREQ_n_int     : std_logic;
    signal IORQ_n_int     : std_logic;
    signal RFSH_n_int     : std_logic;
    signal M1_n_int       : std_logic;
    signal BUSAK_n_int    : std_logic;
    signal WAIT_n_latched : std_logic;
    signal TState         : std_logic_vector(2 downto 0);
    signal SS_Single      : std_logic;
    signal SS_Step        : std_logic;
    signal SS_Step_held   : std_logic;
    signal CountCycle     : std_logic;
    signal int_ctrl       : std_logic_vector(7 downto 0);
    signal skipNextOpcode : std_logic;

    signal Regs           : std_logic_vector(255 downto 0);
    signal PdcData        : std_logic_vector(7 downto 0);
    signal io_not_mem     : std_logic;
    signal io_rd          : std_logic;
    signal io_wr          : std_logic;
    signal memory_rd      : std_logic;
    signal memory_wr      : std_logic;
    signal memory_addr    : std_logic_vector(15 downto 0);
    signal memory_dout    : std_logic_vector(7 downto 0);
    signal memory_din     : std_logic_vector(7 downto 0);
    signal memory_done    : std_logic;

    signal io_rd1         : std_logic;
    signal io_wr1         : std_logic;
    signal memory_rd1     : std_logic;
    signal memory_wr1     : std_logic;
    signal mon_m1_n       : std_logic;
    signal mon_xx_n       : std_logic; -- shorten MREQ and RD in M1 NOP cycle
    signal mon_yy         : std_logic; -- delay IORQ/RD/WR in IO cycle
    signal mon_mreq_n     : std_logic;
    signal mon_iorq_n     : std_logic;
    signal mon_rfsh_n     : std_logic;
    signal mon_rd_n       : std_logic;
    signal mon_wr_n       : std_logic;
    signal mon_busak_n1   : std_logic;
    signal mon_busak_n2   : std_logic;
    signal mon_busak_n    : std_logic;

    signal BUSRQ_n_sync   : std_logic;
    signal INT_n_sync     : std_logic;
    signal NMI_n_sync     : std_logic;
    signal RESET_n_sync   : std_logic;

    signal Read_n         : std_logic;
    signal Read_n0        : std_logic;
    signal Write_n        : std_logic;
    signal Write_n0       : std_logic;
    signal ReadIO_n       : std_logic;
    signal ReadIO_n0      : std_logic;
    signal WriteIO_n      : std_logic;
    signal WriteIO_n0     : std_logic;
    signal Sync           : std_logic;
    signal Sync0          : std_logic;
    signal Sync1          : std_logic;

    signal Din            : std_logic_vector(7 downto 0);
    signal Dout           : std_logic_vector(7 downto 0);
    signal Den            : std_logic;
    signal ex_data        : std_logic_vector(7 downto 0);
    signal rd_data        : std_logic_vector(7 downto 0);
    signal wr_data        : std_logic_vector(7 downto 0);
    signal mon_data       : std_logic_vector(7 downto 0);

    signal avr_TxD_int    : std_logic;

    signal rfsh_addr      : std_logic_vector(15 downto 0);

begin

    --------------------------------------------------------
    -- Clocking
    --------------------------------------------------------

    inst_dcm0 : entity work.DCM0
      generic map (
        ClkMult      => ClkMult,
        ClkDiv       => ClkDiv,
        ClkPer       => ClkPer
      )
      port map(
        CLKIN_IN     => clock,
        CLKFX_OUT    => clock_avr
      );

    cpu_clk <= CLK_n;
    busmon_clk <= CLK_n;

    --------------------------------------------------------
    -- BusMonCore
    --------------------------------------------------------

    mon : entity work.BusMonCore
      generic map (
        num_comparators => num_comparators,
        avr_prog_mem_size => avr_prog_mem_size
      )
      port map (
        clock_avr    => clock_avr,
        busmon_clk   => busmon_clk,
        busmon_clken => '1',
        cpu_clk      => cpu_clk,
        cpu_clken    => '1',
        Addr         => Addr_int,
        Data         => mon_data,
        Rd_n         => Read_n,
        Wr_n         => Write_n,
        RdIO_n       => ReadIO_n,
        WrIO_n       => WriteIO_n,
        Sync         => Sync,
        Rdy          => open,
        nRSTin       => RESET_n_sync,
        nRSTout      => cpu_reset_n,
        CountCycle   => CountCycle,
        trig         => trig,
        avr_RxD      => avr_RxD,
        avr_TxD      => avr_TxD_int,
        sw_reset_cpu => sw_reset_cpu,
        sw_reset_avr => sw_reset_avr,
        led_bkpt     => led_bkpt,
        led_trig0    => led_trig0,
        led_trig1    => led_trig1,
        tmosi        => tmosi,
        tdin         => tdin,
        tcclk        => tcclk,
        Regs         => Regs,
        PdcData      => PdcData,
        RdMemOut     => memory_rd,
        WrMemOut     => memory_wr,
        RdIOOut      => io_rd,
        WrIOOut      => io_wr,
        AddrOut      => memory_addr,
        DataOut      => memory_dout,
        DataIn       => memory_din,
        Done         => memory_done,
        int_ctrl     => int_ctrl,
        SS_Single    => SS_Single,
        SS_Step      => SS_Step
    );

    --------------------------------------------------------
    -- T80
    --------------------------------------------------------

    inst_t80: entity work.T80a port map (
        TS      => TState,
        Regs    => Regs,
        PdcData => PdcData,
        RESET_n => cpu_reset_n,
        CLK_n   => cpu_clk,
        CEN     => cpu_clken,
        WAIT_n  => WAIT_n,
        INT_n   => INT_n_sync,
        NMI_n   => NMI_n_sync,
        BUSRQ_n => BUSRQ_n,
        M1_n    => M1_n_int,
        MREQ_n  => MREQ_n_int,
        IORQ_n  => IORQ_n_int,
        RD_n    => RD_n_int,
        WR_n    => WR_n_int,
        RFSH_n  => RFSH_n_int,
        HALT_n  => HALT_n,
        BUSAK_n => BUSAK_n_int,
        A       => Addr_int,
        Din     => Din,
        Dout    => Dout,
        DEn     => Den
        );

    --------------------------------------------------------
    -- Synchronise external interrupts
    --------------------------------------------------------

    int_gen : process(CLK_n)
    begin
        if rising_edge(CLK_n) then

            if int_ctrl(1) = '1' then
                BUSRQ_n_sync <= int_ctrl(0);
            else
                BUSRQ_n_sync <= BUSRQ_n or (int_ctrl(0) and SS_single);
            end if;

            if int_ctrl(3) = '1' then
                INT_n_sync <= int_ctrl(2);
            else
                INT_n_sync <= INT_n or (int_ctrl(2) and SS_single);
            end if;

            if int_ctrl(5) = '1' then
                NMI_n_sync <= int_ctrl(4);
            else
                NMI_n_sync <= NMI_n or (int_ctrl(4) and SS_single);
            end if;

            if int_ctrl(7) = '1' then
                RESET_n_sync <= int_ctrl(6);
            else
                RESET_n_sync <= RESET_n or (int_ctrl(6) and SS_single);
            end if;

        end if;
    end process;

    --------------------------------------------------------
    -- Z80 specific single step / breakpoint logic
    --------------------------------------------------------

    CountCycle <= '1' when state = idle else '0';

    -- The breakpoint logic stops the Z80 in M1/T3 using cpu_clken
    cpu_clken  <= '0'    when state = idle and SS_Single = '1' and Sync1 = '1'            else
                  '0'    when state /= idle                                               else
                  '1';

    -- Logic to ignore the second M1 in multi-byte opcodes
    skip_opcode_latch : process(CLK_n)
    begin
        if rising_edge(CLK_n) then
            if (M1_n_int = '0' and WAIT_n_latched = '1' and TState = "010") then
                if (skipNextOpcode = '0' and (Data = x"CB" or Data = x"DD" or Data = x"ED" or Data = x"FD")) then
                    skipNextOpcode <= '1';
                else
                    skipNextOpcode <= '0';
                end if;
            end if;
        end if;
    end process;

    -- For instruction breakpoints, we make the monitoring decision as early as possibe
    -- to allow time to stop the current instruction, which is possible because we don't
    -- really care about the data (it's re-read from memory by the disassembler).
    Sync0    <= '1' when WAIT_n = '1' and M1_n_int = '0' and TState = "010" and skipNextOpcode = '0' else '0';

    -- For reads/write breakpoints we make the monitoring decision in the middle of T3
    Read_n0    <= not ((not RD_n_int) and (not MREQ_n_int) and (M1_n_int)) when TState = "011" else '1';
    Write_n0   <= not ((    RD_n_int) and (not MREQ_n_int) and (M1_n_int)) when TState = "011" else '1';
    ReadIO_n0  <= not ((not RD_n_int) and (not IORQ_n_int) and (M1_n_int)) when TState = "011" else '1';
    WriteIO_n0 <= not ((    RD_n_int) and (not IORQ_n_int) and (M1_n_int)) when TState = "011" else '1';

    -- Hold the monitoring decision so it is valid on the rising edge of the clock
    -- For instruction fetches the monitor sees these at the end of T2
    -- For reads and writes, the data is sampled in the middle of T3 so delay until end of T3
    watch_gen : process(CLK_n)
    begin
        if falling_edge(CLK_n) then
            Sync        <= Sync0;
            Read_n      <= Read_n0;
            Write_n     <= Write_n0;
            ReadIO_n    <= ReadIO_n0;
            WriteIO_n   <= WriteIO_n0;
            -- Latch wait seen by T80 on the falling edge, for use on the next rising edge
            WAIT_n_latched <= WAIT_n;
        end if;
    end process;

    -- Register the exec data on the rising edge of the clock at the end of T2
    ex_data_latch : process(CLK_n)
    begin
        if rising_edge(CLK_n) then
            if Sync = '1' then
                ex_data <= Data;
            end if;
        end if;
    end process;

    -- Register the read data on the falling edge of clock in the middle of T3
    rd_data_latch : process(CLK_n)
    begin
        if falling_edge(CLK_n) then
            if Read_n0 = '0' or ReadIO_n0 = '0' then
                rd_data <= Data;
            end if;
            memory_din <= Data;
        end if;
    end process;

    -- Register the read data on the falling edge of clock in the middle of T3
    wr_data_latch : process(CLK_n)
    begin
        if falling_edge(CLK_n) then
            if Write_n0 = '0' or WriteIO_n0 = '0' then
                wr_data <= Data;
            end if;
        end if;
    end process;

    -- Mux the data seen by the bus monitor appropriately
    mon_data <= rd_data when Read_n = '0'  or ReadIO_n = '0'  else
                wr_data when Write_n = '0' or WriteIO_n = '0' else
                ex_data;

    -- Mark the memory access as done when t3 is reached
    memory_done <= '1' when state = rd_t3 or state = wr_t3 else '0';

    -- Multiplex the bus control signals
    -- The _int versions come from the T80
    -- The mon_ versions come from the state machine below

    MREQ_n  <= MREQ_n_int  when state = idle else mon_mreq_n and mon_xx_n;
    IORQ_n  <= IORQ_n_int  when state = idle else (mon_iorq_n or mon_yy);
    WR_n    <= WR_n_int    when state = idle else (mon_wr_n or mon_yy);
    RD_n    <= RD_n_int    when state = idle else (mon_rd_n or mon_yy) and mon_xx_n;
    RFSH_n  <= RFSH_n_int  when state = idle else mon_rfsh_n;
    M1_n    <= M1_n_int    when state = idle else mon_m1_n;

    Addr1   <= x"0000"     when state = nop_t1 or state = nop_t2 else
               rfsh_addr   when state = nop_t3 or state = nop_t4 else
               memory_addr when state /= idle                    else
               Addr_int;

    tristate_n <= BUSAK_n_int when state = idle else mon_busak_n1;

    BUSAK_n    <= BUSAK_n_int when state = idle else mon_busak_n;

    -- Force the address and databus to tristate when reset is asserted
    tristate_ad_n <= '0'         when RESET_n_sync = '0' else
                     BUSAK_n_int when state = idle  else
                     mon_busak_n1;

-- The Acorn Z80 Second Processor needs ~10ns of address hold time following M1
-- and MREQ being released at the start of T3. Otherwise, the ROM switching
-- during NMI doesn't work reliably due to glitches. See:
-- https://stardot.org.uk/forums/viewtopic.php?p=212096#p212096
--
-- Reordering the above Addr expression so Addr_int is last instead of
-- first seems to fix the issue, but is clearly very dependent on how the Xilinx
-- tools route the design.
--
-- If the problem recurs, we should switch to something like:
--
    addr_delay : process(clock)
    begin
        if rising_edge(clock) then
            Addr2 <= Addr1;
            Addr <= Addr2;
        end if;
    end process;

    Data   <= memory_dout when (state = wr_t1 and io_not_mem = '1') or state = wr_wa or state = wr_t2 or state = wr_t3 else
              Dout        when state = idle and Den = '1' else
              (others => 'Z');

    DIRD   <= '0' when (state = wr_t1 and io_not_mem = '1') or state = wr_wa or state = wr_t2 or state = wr_t3 else
              '0' when state = idle and Den = '1' else
              '1';

    Din <= Data;

    men_access_machine_rising : process(CLK_n, cpu_reset_n)
    begin
        if (cpu_reset_n = '0') then
            state <= idle;
            memory_rd1 <= '0';
            memory_wr1 <= '0';
            io_rd1 <= '0';
            io_wr1 <= '0';
            SS_Step_held <= '0';
            mon_rfsh_n <= '1';
            mon_m1_n <= '1';
            mon_xx_n <= '1';
            mon_yy <= '0';
            mon_busak_n1 <= '1';

        elsif rising_edge(CLK_n) then

            -- Extend the 1-cycle long request strobes from BusMonCore
            -- until we are ready to generate a bus cycle
            if memory_rd = '1' then
                memory_rd1 <= '1';
            elsif state = rd_t1 then
                memory_rd1 <= '0';
            end if;
            if memory_wr = '1' then
                memory_wr1 <= '1';
            elsif state = wr_t1 then
                memory_wr1 <= '0';
            end if;
            if io_rd = '1' then
                io_rd1 <= '1';
            elsif state = rd_t1 then
                io_rd1 <= '0';
            end if;
            if io_wr = '1' then
                io_wr1 <= '1';
            elsif state = wr_t1 then
                io_wr1 <= '0';
            end if;
            if SS_Step = '1' then
                SS_Step_held <= '1';
            elsif state = idle then
                SS_Step_held <= '0';
            end if;

            Sync1 <= Sync;

            -- Main state machine, generating refresh, read and write cycles
            -- (the timing should exactly match those of the Z80)
            case state is
                -- Idle is when T80 is running
                when idle =>
                    if SS_Single = '1' and Sync1 = '1' then
                        -- Load the initial refresh address from I/R in the T80
                        rfsh_addr <= Regs(199 downto 192) & Regs(207 downto 200);
                        -- Start genering NOP cycles
                        mon_rfsh_n <= '0';
                        state <= nop_t3;
                    end if;

                -- NOP cycle
                when nop_t1 =>
                    state <= nop_t2;
                    -- Increment the refresh address (7 bits, just like the Z80)
                    rfsh_addr(6 downto 0) <= rfsh_addr(6 downto 0) + 1;
                    mon_xx_n <= mode;
                when nop_t2 =>
                    if WAIT_n_latched = '1' then
                        mon_m1_n <= '1';
                        mon_xx_n <= '1';
                        if SS_Step_held = '1' or SS_Single = '0' then
                            state <= idle;
                        else
                            mon_rfsh_n <= '0';
                            state <= nop_t3;
                        end if;
                    end if;
                when nop_t3 =>
                    state <= nop_t4;
                when nop_t4 =>
                    mon_rfsh_n <= '1';
                    -- Sample BUSRQ_n at the *start* of the final T-state
                    -- (hence using BUSRQ_n_sync)
                    if BUSRQ_n_sync = '0' then
                        state <= busack;
                        mon_busak_n1 <= '0';
                    elsif memory_wr1 = '1' or io_wr1 = '1' then
                        state <= wr_t1;
                        io_not_mem <= io_wr1;
                        mon_yy <= io_wr1;
                    elsif memory_rd1 = '1' or io_rd1 = '1' then
                        state <= rd_t1;
                        io_not_mem <= io_rd1;
                        mon_yy <= io_rd1;
                    else
                        state <= nop_t1;
                        mon_m1_n <= mode;
                    end if;

                -- Read cycle
                when rd_t1 =>
                    mon_yy <= '0';
                    if io_not_mem = '1' then
                        state <= rd_wa;
                    else
                        state <= rd_t2;
                    end if;
                when rd_wa =>
                    state <= rd_t2;
                when rd_t2 =>
                    if WAIT_n_latched = '1' then
                        state <= rd_t3;
                    end if;
                when rd_t3 =>
                    -- Sample BUSRQ_n at the *start* of the final T-state
                    -- (hence using BUSRQ_n_sync)
                    if BUSRQ_n_sync = '0' then
                        state <= busack;
                        mon_busak_n1 <= '0';
                    else
                        state <= nop_t1;
                        mon_m1_n <= mode;
                    end if;

                -- Write cycle
                when wr_t1 =>
                    mon_yy <= '0';
                    if io_not_mem = '1' then
                        state <= wr_wa;
                    else
                        state <= wr_t2;
                    end if;
                when wr_wa =>
                    state <= wr_t2;
                when wr_t2 =>
                    if WAIT_n_latched = '1' then
                        state <= wr_t3;
                    end if;
                when wr_t3 =>
                    -- Sample BUSRQ_n at the *start* of the final T-state
                    -- (hence using BUSRQ_n_sync)
                    if BUSRQ_n_sync = '0' then
                        state <= busack;
                        mon_busak_n1 <= '0';
                    else
                        state <= nop_t1;
                        mon_m1_n <= mode;
                    end if;

                -- Bus Request/Ack cycle
                when busack =>
                    -- Release BUSAK_n on the next rising edge after BUSRQ_n seen
                    -- (hence using BUSRQ_n)
                    if BUSRQ_n_sync = '1' then
                        state <= nop_t1;
                        mon_m1_n <= mode;
                        mon_busak_n1 <= '1';
                    end if;
            end case;
        end if;
    end process;

    men_access_machine_falling : process(CLK_n)
    begin
        if falling_edge(CLK_n) then
            -- For memory access cycles, mreq/iorq/rd/wr all change in the middle of
            -- the t state, so retime these on the falling edge of clock
            if state = rd_t1 or state = rd_wa or state = rd_t2 or state = wr_t1 or state = wr_wa or state = wr_t2 then
                if io_not_mem = '0' then
                    -- Memory cycle
                    mon_mreq_n <= '0';
                    mon_iorq_n <= '1';
                else
                    -- IO cycle
                    mon_mreq_n <= '1';
                    mon_iorq_n <= '0';
                end if;
            elsif (state = nop_t1 and mode = '0') or state = nop_t3 then
                -- M1 cycle
                mon_mreq_n <= '0';
                mon_iorq_n <= '1';
            else
                -- Idle cycle
                mon_mreq_n <= '1';
                mon_iorq_n <= '1';
            end if;
            -- Read strobe
            if (state = nop_t1 and mode = '0') or state = rd_t1 or state = rd_wa or state = rd_t2 then
                mon_rd_n <= '0';
            else
                mon_rd_n <= '1';
            end if;
            -- Write strobe
            if (state = wr_t1 and io_not_mem = '1') or state = wr_wa or state = wr_t2 then
                mon_wr_n <= '0';
            else
                mon_wr_n <= '1';
            end if;
            -- Half-cycle delayed version of BUSRQ_n_sync
            mon_busak_n2 <= BUSRQ_n_sync;
        end if;
    end process;

    mon_busak_n <= mon_busak_n1 or mon_busak_n2;

    avr_TxD <= avr_Txd_int;

    test1 <= Sync1;
    test2 <= TState(0);
    test3 <= TState(1);
    test4 <= TState(2);

end behavioral;
