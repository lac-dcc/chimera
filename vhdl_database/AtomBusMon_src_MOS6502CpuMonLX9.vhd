--------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : MOS6502CpuMonLX9.vhd
-- /___/   /\     Timestamp : 03/11/2019
-- \   \  /  \
--  \___\/\___\
--
--Design Name: MOS6502CpuMonLX9
--Device: XC6SLX9
--
-- Note: in 65C02 mode, BE, ML_n and VP_n are not implemented

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MOS6502CpuMonLX9 is
   generic (
       UseT65Core        : boolean := true;
       UseAlanDCore      : boolean := false;
       num_comparators   : integer := 8;
       avr_prog_mem_size : integer := 8 * 1024
       );
    port (
        clock            : in    std_logic;

        -- 6502 Signals
        Phi0             : in    std_logic;
        Phi1             : out   std_logic;
        Phi2             : out   std_logic;
        IRQ_n            : in    std_logic;
        NMI_n            : in    std_logic;
        Sync             : out   std_logic;
        Addr             : out   std_logic_vector(15 downto 0);
        R_W_n            : out   std_logic;
        Data             : inout std_logic_vector(7 downto 0);
        SO_n             : in    std_logic;
        Res_n            : in    std_logic;
        Rdy              : in    std_logic;

        -- External trigger inputs
        trig             : in    std_logic_vector(1 downto 0);

        -- Jumpers
        fakeTube_n       : in     std_logic;

        -- Serial Console
        avr_RxD          : in    std_logic;
        avr_TxD          : out   std_logic;

        -- Switches
        sw1              : in   std_logic;
        sw2              : in   std_logic;

        -- LEDs
        led3             : out  std_logic;
        led6             : out  std_logic;
        led8             : out  std_logic;

        -- OHO_DY1 LED display
        tmosi            : out  std_logic;
        tdin             : out  std_logic;
        tcclk            : out  std_logic
    );
end MOS6502CpuMonLX9;

architecture behavioral of MOS6502CpuMonLX9 is

    signal sw_reset_cpu : std_logic;
    signal sw_reset_avr : std_logic;
    signal led_bkpt     : std_logic;
    signal led_trig0    : std_logic;
    signal led_trig1    : std_logic;

begin

    sw_reset_cpu <= sw1;
    sw_reset_avr <= sw2;
    led8         <= led_bkpt;
    led3         <= led_trig0;
    led6         <= led_trig1;

    wrapper : entity work.MOS6502CpuMon
        generic map (
            UseT65Core        => UseT65Core,
            UseAlanDCore      => UseAlanDCore,
            ClkMult           => 8,
            ClkDiv            => 25,
            ClkPer            => 20.000,
            num_comparators   => num_comparators,
            avr_prog_mem_size => avr_prog_mem_size
            )
        port map (
            clock             => clock,

            -- 6502 Signals
            Phi0              => Phi0,
            Phi1              => Phi1,
            Phi2              => Phi2,
            IRQ_n             => IRQ_n,
            NMI_n             => NMI_n,
            Sync              => Sync,
            Addr              => Addr,
            R_W_n             => R_W_n,
            Data              => Data,
            SO_n              => SO_n,
            Res_n             => Res_n,
            Rdy               => Rdy,

            -- External trigger inputs
            trig              => trig,

            -- Jumpers
            fakeTube_n        => fakeTube_n,

            -- Serial Console
            avr_RxD           => avr_RxD,
            avr_TxD           => avr_TxD,

            -- Switches
            sw_reset_cpu      => sw_reset_cpu,
            sw_reset_avr      => sw_reset_avr,

            -- LEDs
            led_bkpt          => led_bkpt,
            led_trig0         => led_trig0,
            led_trig1         => led_trig1,

            -- OHO_DY1 LED display
            tmosi            => tmosi,
            tdin             => tdin,
            tcclk            => tcclk
            );


end behavioral;
