-------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : MOS6502CpuMon.vhd
-- /___/   /\     Timestamp : 03/11/2019
-- \   \  /  \
--  \___\/\___\
--
--Design Name: MOS6502CpuMon
--Device: multiple

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MOS6502CpuMon is
    generic (
       UseT65Core        : boolean;
       UseAlanDCore      : boolean;
       ClkMult           : integer;
       ClkDiv            : integer;
       ClkPer            : real;
       num_comparators   : integer;
       avr_prog_mem_size : integer
       );
    port (
        clock           : in    std_logic;

        -- 6502 Signals
        Phi0            : in    std_logic;
        Phi1            : out   std_logic;
        Phi2            : out   std_logic;
        IRQ_n           : in    std_logic;
        NMI_n           : in    std_logic;
        Sync            : out   std_logic;
        Addr            : out   std_logic_vector(15 downto 0);
        R_W_n           : out   std_logic;
        Data            : inout std_logic_vector(7 downto 0);
        SO_n            : in    std_logic;
        Res_n           : in    std_logic;
        Rdy             : in    std_logic;

        -- External trigger inputs
        trig            : in    std_logic_vector(1 downto 0);

        -- Jumpers
        fakeTube_n      : in    std_logic;

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

        -- Test connector signals
        test            : inout std_logic_vector(3 downto 0)
    );
end MOS6502CpuMon;

architecture behavioral of MOS6502CpuMon is

    signal clock_avr     : std_logic;

    signal Din           : std_logic_vector(7 downto 0);
    signal Dout          : std_logic_vector(7 downto 0);

    signal Rdy_latched   : std_logic;

    signal IRQ_n_sync    : std_logic;
    signal NMI_n_sync    : std_logic;

    signal Addr_int      : std_logic_vector(15 downto 0);
    signal R_W_n_int     : std_logic;

    signal Phi0_a        : std_logic;
    signal Phi0_b        : std_logic;
    signal Phi0_c        : std_logic;
    signal Phi0_d        : std_logic;
    signal cpu_clk       : std_logic;
    signal busmon_clk    : std_logic;

begin

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

    core : entity work.MOS6502CpuMonCore
    generic map (
       UseT65Core        => UseT65Core,
       UseAlanDCore      => UseAlanDCore,
       num_comparators   => num_comparators,
       avr_prog_mem_size => avr_prog_mem_size
    )
    port map (
        clock_avr    => clock_avr,
        busmon_clk   => busmon_clk,
        busmon_clken => '1',
        cpu_clk      => cpu_clk,
        cpu_clken    => '1',
        IRQ_n        => IRQ_n_sync,
        NMI_n        => NMI_n_sync,
        Sync         => Sync,
        Addr         => Addr_int,
        R_W_n        => R_W_n_int,
        Din          => Din,
        Dout         => Dout,
        SO_n         => SO_n,
        Res_n        => Res_n,
        Rdy          => Rdy_latched,
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
        test         => test
    );

    sync_gen : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
          NMI_n_sync <= NMI_n;
          IRQ_n_sync <= IRQ_n;
        end if;
    end process;

    -- 6502: Sample Rdy on the rising edge of Phi0
    rdy_6502: if UseT65Core generate
        process(Phi0)
        begin
            if rising_edge(Phi0) then
                Rdy_latched <= Rdy;
            end if;
        end process;
    end generate;

    -- 65C02: Sample Rdy on the falling edge of Phi0
    rdy_65c02: if UseAlanDCore generate
        process(Phi0)
        begin
            if falling_edge(Phi0) then
                Rdy_latched <= Rdy;
            end if;
        end process;
    end generate;

    -- Sample Data on the falling edge of Phi0_a
    data_latch : process(Phi0_a)
    begin
        if falling_edge(Phi0_a) then
            if (fakeTube_n = '0' and Addr_int = x"FEE0") then
                Din        <= x"FE";
            else
                Din        <= Data;
            end if;
        end if;
    end process;

    Data  <= Dout when Phi0_c = '1' and R_W_n_int = '0' else (others => 'Z');
    R_W_n <= R_W_n_int;
    Addr  <= Addr_int;

    clk_gen : process(clock)
    begin
        if rising_edge(clock) then
          Phi0_a <= Phi0;
          Phi0_b <= Phi0_a;
          Phi0_c <= Phi0_b;
          Phi0_d <= Phi0_c;
        end if;
    end process;

    Phi1       <= not Phi0_b;
    Phi2       <= Phi0_b;
    cpu_clk    <= not Phi0_d;
    busmon_clk <= Phi0_d;

end behavioral;
