--------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : MOS6502CpuMonALS.vhd
-- /___/   /\     Timestamp : 20/09/2019
-- \   \  /  \
--  \___\/\___\
--
--Design Name: MOS6502CpuMonALS
--Device: XC6SLX9
--
--
-- This is a small wrapper around MOS6502CpuMon that add the following signals:
--   OEAH_n
--   OEAL_n
--   OED_n
--   DIRD
--   BE
--   ML_n
--   VP_n
-- (these are not fully implemented yet)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MOS6502CpuMonALS is
   generic (
       UseT65Core        : boolean := true;
       UseAlanDCore      : boolean := false;
       num_comparators   : integer := 8;
       avr_prog_mem_size : integer := 8 * 1024
       );
    port (
        clock            : in    std_logic;

        -- 6502 Signals
        PhiIn            : in    std_logic;
        Phi1Out          : out   std_logic;
        Phi2Out          : out   std_logic;
        IRQ_n            : in    std_logic;
        NMI_n            : in    std_logic;
        Sync             : out   std_logic;
        Addr             : out   std_logic_vector(15 downto 0);
        R_W_n            : out   std_logic_vector(1 downto 0);
        Data             : inout std_logic_vector(7 downto 0);
        SO_n             : in    std_logic;
        Res_n            : in    std_logic;
        Rdy              : in    std_logic;

        -- 65C02 Signals
        BE               : in    std_logic;
        ML_n             : out   std_logic;
        VP_n             : out   std_logic;

        -- Level Shifter Controls
        OERW_n           : out   std_logic;
        OEAH_n           : out   std_logic;
        OEAL_n           : out   std_logic;
        OED_n            : out   std_logic;
        DIRD             : out   std_logic;

        -- External trigger inputs
        trig             : in    std_logic_vector(1 downto 0);

        -- ID/mode inputs
        mode             : in    std_logic;
        id               : in    std_logic_vector(3 downto 0);

        -- Serial Console
        avr_RxD          : in    std_logic;
        avr_TxD          : out   std_logic;

        -- Switches
        sw1              : in   std_logic;
        sw2              : in   std_logic;

        -- LEDs
        led1             : out  std_logic;
        led2             : out  std_logic;
        led3             : out  std_logic;

        -- OHO_DY1 LED display
        tmosi            : out  std_logic;
        tdin             : out  std_logic;
        tcclk            : out  std_logic;

        -- Test connector signals
        test             : inout std_logic_vector(3 downto 0)
    );
end MOS6502CpuMonALS;

architecture behavioral of MOS6502CpuMonALS is

    signal R_W_n_int    : std_logic;

    signal sw_reset_cpu : std_logic;
    signal sw_reset_avr : std_logic;
    signal led_bkpt     : std_logic;
    signal led_trig0    : std_logic;
    signal led_trig1    : std_logic;

    signal PhiIn1       : std_logic;
    signal PhiIn2       : std_logic;
    signal PhiIn3       : std_logic;
    signal PhiIn4       : std_logic;

begin

    sw_reset_cpu <= not sw1;
    sw_reset_avr <= not sw2;
    led1         <= led_bkpt;
    led2         <= led_trig0;
    led3         <= led_trig1;

    wrapper : entity work.MOS6502CpuMon
        generic map (
            UseT65Core        => UseT65Core,
            UseAlanDCore      => UseAlanDCore,
            ClkMult           => 12,
            ClkDiv            => 25,
            ClkPer            => 20.000,
            num_comparators   => num_comparators,
            avr_prog_mem_size => avr_prog_mem_size
            )
        port map (
            clock             => clock,

            -- 6502 Signals
            Phi0              => PhiIn,
            Phi1              => Phi1Out,
            Phi2              => Phi2Out,
            IRQ_n             => IRQ_n,
            NMI_n             => NMI_n,
            Sync              => Sync,
            Addr              => Addr,
            R_W_n             => R_W_n_int,
            Data              => Data,
            SO_n              => SO_n,
            Res_n             => Res_n,
            Rdy               => Rdy,

            -- External trigger inputs
            trig              => trig,

            -- Jumpers
            fakeTube_n        => '1',

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
            tcclk            => tcclk,

            -- Test signals
            test             => test
            );

    -- 6502 Outputs
    R_W_n <= R_W_n_int & R_W_n_int;

    -- 65C02 Outputs
    ML_n   <= '1';
    VP_n   <= '1';

    process(clock)
    begin
        if rising_edge(clock) then
            PhiIn1 <= PhiIn;
            PhiIn2 <= PhiIn1;
            PhiIn3 <= PhiIn2;
            PhiIn4 <= PhiIn3;
        end if;

    end process;

    -- Level Shifter Controls
    OERW_n <= '0'; -- not (BE);
    OEAH_n <= '0'; -- not (BE);
    OEAL_n <= '0'; -- not (BE);
    OED_n  <= not (BE and PhiIn and PhiIn4); -- TODO: might need to use a slightly delayed version of Phi2 here
    DIRD   <= R_W_n_int;

end behavioral;
