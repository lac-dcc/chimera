-------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : MC6808CpuMon.vhd
-- /___/   /\     Timestamp : 24/10/2019
-- \   \  /  \
--  \___\/\___\
--
--Design Name: MC6808CpuMon
--Device: multiple

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MC6809CpuMon is
    generic (
       ClkMult           : integer;
       ClkDiv            : integer;
       ClkPer            : real;
       num_comparators   : integer;
       avr_prog_mem_size : integer
       );
    port (
        -- Fast clock
        clock           : in    std_logic;

        -- Quadrature clocks
        E               : in    std_logic;
        Q               : in    std_logic;

        --6809 Signals
        DMA_n_BREQ_n    : in   std_logic;

        -- 6809E Sig
        TSC             : in    std_logic;
        LIC             : out   std_logic;
        AVMA            : out   std_logic;
        BUSY            : out   std_logic;

        -- Signals common to both 6809 and 6809E
        RES_n           : in    std_logic;
        NMI_n           : in    std_logic;
        IRQ_n           : in    std_logic;
        FIRQ_n          : in    std_logic;
        HALT_n          : in    std_logic;
        BS              : out   std_logic;
        BA              : out   std_logic;
        R_W_n           : out   std_logic;

        Addr            : out   std_logic_vector(15 downto 0);
        Data            : inout std_logic_vector(7 downto 0);

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
        test2           : out   std_logic

    );
end MC6809CpuMon;

architecture behavioral of MC6809CpuMon is

    signal clock_avr      : std_logic;

    signal cpu_clk        : std_logic;
    signal cpu_reset_n    : std_logic;
    signal busmon_clk     : std_logic;
    signal R_W_n_int      : std_logic;
    signal NMI_sync       : std_logic;
    signal IRQ_sync       : std_logic;
    signal FIRQ_sync      : std_logic;
    signal HALT_sync      : std_logic;
    signal Addr_int       : std_logic_vector(15 downto 0);
    signal Din            : std_logic_vector(7 downto 0);
    signal Dout           : std_logic_vector(7 downto 0);
    signal Dbusmon        : std_logic_vector(7 downto 0);
    signal Sync_int       : std_logic;
    signal hold           : std_logic;

    signal memory_rd      : std_logic;
    signal memory_wr      : std_logic;
    signal memory_rd1     : std_logic;
    signal memory_wr1     : std_logic;
    signal memory_addr    : std_logic_vector(15 downto 0);
    signal memory_addr1   : std_logic_vector(15 downto 0);
    signal memory_dout    : std_logic_vector(7 downto 0);
    signal memory_din     : std_logic_vector(7 downto 0);
    signal memory_done    : std_logic;

    signal Regs           : std_logic_vector(111 downto 0);
    signal Regs1          : std_logic_vector(255 downto 0);
    signal last_PC        : std_logic_vector(15 downto 0);

    signal ifetch         : std_logic;
    signal ifetch1        : std_logic;
    signal SS_Single      : std_logic;
    signal SS_Step        : std_logic;
    signal CountCycle     : std_logic;
    signal int_ctrl       : std_logic_vector(7 downto 0);

    signal LIC_int        : std_logic;

    signal E_a            : std_logic; -- E delayed by 0..20ns
    signal E_b            : std_logic; -- E delayed by 20..40ns
    signal E_c            : std_logic; -- E delayed by 40..60ns
    signal E_d            : std_logic; -- E delayed by 60..80ns
    signal E_e            : std_logic; -- E delayed by 80..100ns
    signal E_f            : std_logic; -- E delayed by 100..120ns
    signal E_g            : std_logic; -- E delayed by 120..140ns
    signal E_h            : std_logic; -- E delayed by 120..140ns
    signal E_i            : std_logic; -- E delayed by 120..140ns
    signal data_wr        : std_logic;
    signal nRSTout        : std_logic;

    signal FIRQ_n_masked  : std_logic;
    signal IRQ_n_masked   : std_logic;
    signal NMI_n_masked   : std_logic;
    signal RES_n_masked   : std_logic;

begin

    LIC     <= LIC_int;
    -- The following outputs are not implemented
    -- BUSY          (6809E mode)
    BUSY    <= '0';

    -- The following inputs are not implemented
    -- DMA_n_BREQ_n  (6809 mode)

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
        Data         => Dbusmon,
        Rd_n         => not R_W_n_int,
        Wr_n         => R_W_n_int,
        RdIO_n       => '1',
        WrIO_n       => '1',
        Sync         => Sync_int,
        Rdy          => open,
        nRSTin       => RES_n_masked,
        nRSTout      => cpu_reset_n,
        CountCycle   => CountCycle,
        trig         => trig,
        avr_RxD      => avr_RxD,
        avr_TxD      => avr_TxD,
        sw_reset_cpu => sw_reset_cpu,
        sw_reset_avr => sw_reset_avr,
        led_bkpt     => led_bkpt,
        led_trig0    => led_trig0,
        led_trig1    => led_trig1,
        tmosi        => tmosi,
        tdin         => tdin,
        tcclk        => tcclk,
        Regs         => Regs1,
        RdMemOut     => memory_rd,
        WrMemOut     => memory_wr,
        RdIOOut      => open,
        WrIOOut      => open,
        AddrOut      => memory_addr,
        DataOut      => memory_dout,
        DataIn       => memory_din,
        Done         => memory_done,
        int_ctrl     => int_ctrl,
        SS_Step      => SS_Step,
        SS_Single    => SS_Single
    );

    -- The two int control bits work as follows
    -- 00 -> IRQ_n                (enabled)
    -- 01 -> IRQ_n or SS_Single   (enabled when free-running)
    -- 10 -> 0                    (forced)
    -- 11 -> 1                    (disabled)

    FIRQ_n_masked <= int_ctrl(0) when int_ctrl(1) = '1' else
                     FIRQ_n or (int_ctrl(0) and SS_single);

    IRQ_n_masked  <= int_ctrl(2) when int_ctrl(3) = '1' else
                     IRQ_n or (int_ctrl(2) and SS_single);

    NMI_n_masked  <= int_ctrl(4) when int_ctrl(5) = '1' else
                     NMI_n or (int_ctrl(4) and SS_single);

    RES_n_masked  <= int_ctrl(6) when int_ctrl(7) = '1' else
                     RES_n or (int_ctrl(6) and SS_single);

    -- The CPU is slightly pipelined and the register update of the last
    -- instruction overlaps with the opcode fetch of the next instruction.
    --
    -- If the single stepping stopped on the opcode fetch cycle, then the registers
    -- valued would not accurately reflect the previous instruction.
    --
    -- To work around this, when single stepping, we stop on the cycle after
    -- the opcode fetch, which means the program counter has advanced.
    --
    -- To hide this from the user single stepping, all we need to do is to
    -- also pipeline the value of the program counter by one stage to compensate.

    last_pc_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if (hold = '0') then
                last_PC <= Regs(95 downto 80);
            end if;
        end if;
    end process;

    Regs1( 79 downto   0) <= Regs( 79 downto   0);
    Regs1( 95 downto  80) <= last_PC;
    Regs1(111 downto  96) <= Regs(111 downto  96);
    Regs1(255 downto 112) <= (others => '0');

    inst_cpu09: entity work.cpu09 port map (
        clk      => cpu_clk,
        rst      => not cpu_reset_n,
        vma      => AVMA,
        lic_out  => LIC_int,
        ifetch   => ifetch,
        opfetch  => open,
        ba       => BA,
        bs       => BS,
        addr     => Addr_int,
        rw       => R_W_n_int,
        data_out => Dout,
        data_in  => Din,
        irq      => IRQ_sync,
        firq     => FIRQ_sync,
        nmi      => NMI_sync,
        halt     => HALT_sync,
        hold     => hold,
        Regs     => Regs
        );


    -- Synchronize all external inputs, to avoid subtle bugs like missed interrupts
    irq_gen : process(cpu_clk)
    begin
        if falling_edge(cpu_clk) then
            NMI_sync   <= not NMI_n_masked;
            IRQ_sync   <= not IRQ_n_masked;
            FIRQ_sync  <= not FIRQ_n_masked;
            HALT_sync  <= not HALT_n;
        end if;
    end process;

    -- This block generates a sync signal that has the same characteristic as
    -- a 6502 sync, i.e. asserted during the fetching the first byte of each instruction.
    -- The below logic copes ifetch being active for all bytes of the instruction.
    sync_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if (hold = '0') then
                ifetch1 <= ifetch and not LIC_int;
            end if;
        end if;
    end process;
    Sync_int <= ifetch and not ifetch1;

    -- This block generates a hold signal that acts as the inverse of a clock enable
    -- for the 6809. See comments above for why this is a cycle later than the way
    -- we would do if for the 6502.
    hold_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if (Sync_int = '1') then
                -- stop after the opcode has been fetched
                hold <= SS_Single;
            elsif (SS_Step = '1') then
                -- start again when the single step command is issues
                hold <= '0';
            end if;
        end if;
    end process;

    -- Only count cycles when the 6809 is actually running
    CountCycle <= not hold;

    -- this block delays memory_rd, memory_wr, memory_addr until the start of the next cpu clk cycle
    -- necessary because the cpu mon block is clocked of the opposite edge of the clock
    -- this allows a full cpu clk cycle for cpu mon reads and writes
    mem_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            memory_rd1   <= memory_rd;
            memory_wr1   <= memory_wr;
            memory_addr1 <= memory_addr;
        end if;
    end process;

    R_W_n <= 'Z' when TSC = '1' else
             '1' when memory_rd1 = '1' else
             '0' when memory_wr1 = '1' else
             R_W_n_int;

    Addr <=  (others => 'Z') when TSC = '1' else
             memory_addr1 when (memory_rd1 = '1' or memory_wr1 = '1') else
             Addr_int;

    data_latch : process(E)
    begin
        if falling_edge(E) then
            Din        <= Data;
            memory_din <= Data;
       end if;
    end process;

    Data       <= memory_dout when TSC = '0' and data_wr = '1' and memory_wr1 = '1' else
                         Dout when TSC = '0' and data_wr = '1' and R_W_n_int = '0' and memory_rd1 = '0' else
                  (others => 'Z');

    -- Version of data seen by the Bus Mon need to use Din rather than the
    -- external bus value as by the rising edge of cpu_clk we will have stopped driving
    -- the external bus. On the ALS version we get away way this, but on the GODIL
    -- version, due to the pullups, we don't. So all write watch breakpoints see
    -- the data bus as 0xFF.
    Dbusmon   <= Din when R_W_n_int = '1' else Dout;

    memory_done <= memory_rd1 or memory_wr1;

    -- Delayed/Deglitched version of the E clock
    e_gen : process(clock)
    begin
        if rising_edge(clock) then
            E_a <= E;
            E_b <= E_a;
            if E_b /= E_i then
                E_c <= E_b;
            end if;
            E_d <= E_c;
            E_e <= E_d;
            E_f <= E_e;
            E_g <= E_f;
            E_h <= E_g;
            E_i <= E_h;
        end if;
    end process;

    -- Main clock timing control
    -- E_c is delayed by 40-60ns
    -- On a real 6809 the output delay (to ADDR, RNW, BA, BS) is 65ns (measured)
    cpu_clk    <= not E_c;
    busmon_clk <= E_c;

    -- Data bus write timing control
    --
    -- When data_wr is 0 the bus is high impedence
    --
    -- This avoids bus conflicts when the direction of the data bus
    -- changes from read to write (or visa versa).
    --
    -- Note: on the dragon this is not critical; setting to '1' seemed to work
    data_wr    <= Q or E;

    -- Spare pins used for testing
    test1   <= E_a;
    test2   <= E_c;


end behavioral;
