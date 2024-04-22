--------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : MC6808CpuMonGODIL.vhd
-- /___/   /\     Timestamp : 24/10/2019
-- \   \  /  \
--  \___\/\___\
--
--Design Name: MC6808CpuMonGODIL
--Device: XC3S250E/XC3S500E

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MC6809CpuMonGODIL is
    generic (
       num_comparators   : integer := 8;        -- default value correct for GODIL
       avr_prog_mem_size : integer := 1024 * 9  -- default value correct for GODIL
       );
    port (
        clock49         : in    std_logic;

        -- A locally generated test clock
        -- 1.8457 MHz in E     Mode (6809E) so it can drive E     (PIN34)
        -- 7.3728 MHz in Normal Mode (6809) so it can drive EXTAL (PIN38)
        clock_test      : out   std_logic;

        -- 6809/6809E mode selection
        -- Jumper is between pins B1 and D1
        -- Jumper off is 6809 mode, where a 4x clock should be fed into EXTAL (PIN38)
        -- Jumper on is 6909E mode, where a 1x clock should be fed into E (PIN34)
        EMode_n         : in   std_logic;

        --6809 Signals
        PIN33           : inout std_logic;
        PIN34           : inout std_logic;
        PIN35           : inout std_logic;
        PIN36           : inout std_logic;
        PIN38           : inout std_logic;
        PIN39           : in    std_logic;

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

        -- GODIL Switches
        sw1             : in    std_logic;
        sw2             : in    std_logic;

        -- GODIL LEDs
        led3            : out   std_logic;
        led6            : out   std_logic;
        led8            : out   std_logic;

        -- OHO_DY1 connected to test connector
        tmosi           : out   std_logic;
        tdin            : out   std_logic;
        tcclk           : out   std_logic;

        -- Debugging signals
        test1           : out   std_logic;
        test2           : out   std_logic

    );
end MC6809CpuMonGODIL;

architecture behavioral of MC6809CpuMonGODIL is

    signal clk_count      : std_logic_vector(1 downto 0);
    signal quadrature     : std_logic_vector(1 downto 0);

    signal clock7_3728    : std_logic;

    signal sw_reset_avr   : std_logic;
    signal sw_reset_cpu   : std_logic;
    signal led_bkpt       : std_logic;
    signal led_trig0      : std_logic;
    signal led_trig1      : std_logic;

    signal E              : std_logic;
    signal Q              : std_logic;
    signal DMA_n_BREQ_n   : std_logic;
    signal MRDY           : std_logic;
    signal TSC            : std_logic;
    signal LIC            : std_logic;
    signal AVMA           : std_logic;
    signal BUSY           : std_logic;

    signal XTAL           : std_logic;
    signal EXTAL          : std_logic;

begin

    -- Generics allows polarity of switches/LEDs to be tweaked from the project file
    sw_reset_cpu <= sw1;
    sw_reset_avr <= not sw2;
    led3         <= not led_trig0;
    led6         <= not led_trig1;
    led8         <= not led_bkpt;

    wrapper : entity work.MC6809CpuMon
      generic map (
          ClkMult           => 10,
          ClkDiv            => 31,
          ClkPer            => 20.345,
          num_comparators   => num_comparators,
          avr_prog_mem_size => avr_prog_mem_size
      )
      port map (

        -- Fast clock
        clock           => clock49,

        -- Quadrature clocks
        E               => E,
        Q               => Q,

        --6809 Signals
        DMA_n_BREQ_n    => DMA_n_BREQ_n,

        -- 6809E Sig
        TSC             => TSC,
        LIC             => LIC,
        AVMA            => AVMA,
        BUSY            => BUSY,

        -- Signals common to both 6809 and 6809E
        RES_n           => RES_n,
        NMI_n           => NMI_n,
        IRQ_n           => IRQ_n,
        FIRQ_n          => FIRQ_n,
        HALT_n          => HALT_n,
        BS              => BS,
        BA              => BA,
        R_W_n           => R_W_n,

        Addr            => Addr,
        Data            => Data,

        -- External trigger inputs
        trig            => trig,

        -- Serial Console
        avr_RxD         => avr_RxD,
        avr_TxD         => avr_TxD,

        -- Switches
        sw_reset_cpu    => sw_reset_cpu,
        sw_reset_avr    => sw_reset_avr,

        -- LEDs
        led_bkpt        => led_bkpt,
        led_trig0       => led_trig0,
        led_trig1       => led_trig1,

        -- OHO_DY1 connected to test connector
        tmosi           => tmosi,
        tdin            => tdin,
        tcclk           => tcclk,

        -- Debugging signals
        test1           => test1,
        test2           => test2
    );

    -- Pins whose functions are dependent on "E" mode
    PIN33        <= BUSY  when EMode_n = '0' else 'Z';
    DMA_n_BREQ_n <= '1'   when EMode_n = '0' else PIN33;

    PIN34        <= 'Z'   when EMode_n = '0' else E;
    E            <= PIN34 when EMode_n = '0' else quadrature(1);

    PIN35        <= 'Z'   when EMode_n = '0' else Q;
    Q            <= PIN35 when EMode_n = '0' else quadrature(0);

    PIN36        <= AVMA  when EMode_n = '0' else 'Z';
    MRDY         <= '1'   when EMode_n = '0' else PIN36;

    PIN38        <= LIC   when EMode_n = '0' else 'Z';
    EXTAL        <= '0'   when EMode_n = '0' else PIN38;

    TSC          <= PIN39 when EMode_n = '0' else '0';
    XTAL         <= '0'   when EMode_n = '0' else PIN39;

    -- A locally generated test clock
    -- 1.8457 MHz in E     Mode (6809E) so it can drive E     (PIN34)
    -- 7.3728 MHz in Normal Mode (6809) so it can drive EXTAL (PIN38)
    clock_test   <= clk_count(1) when EMode_n = '0' else clock7_3728;

    -- Quadrature clock generator, unused in 6809E mode
    quadrature_gen : process(EXTAL)
    begin
        if rising_edge(EXTAL) then
            if (MRDY = '1') then
                if (quadrature = "00") then
                    quadrature <= "01";
                elsif (quadrature = "01") then
                    quadrature <= "11";
                elsif (quadrature = "11") then
                    quadrature <= "10";
                else
                    quadrature <= "00";
                end if;
            end if;
        end if;
    end process;

    -- Seperate piece of circuitry that emits a 7.3728MHz clock
    inst_dcm1 : entity work.DCM1 port map(
        CLKIN_IN          => clock49,
        CLK0_OUT          => clock7_3728,
        CLK0_OUT1         => open,
        CLK2X_OUT         => open
    );

    clk_gen : process(clock7_3728)
    begin
        if rising_edge(clock7_3728) then
            clk_count <= clk_count + 1;
        end if;
    end process;

end behavioral;
