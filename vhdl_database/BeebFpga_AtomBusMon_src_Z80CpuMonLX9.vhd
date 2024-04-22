--------------------------------------------------------------------------------
-- Copyright (c) 2019 David Banks
--
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/
--  \   \
--  /   /         Filename  : Z80CpuMonLX9.vhd
-- /___/   /\     Timestamp : 14/10/2018
-- \   \  /  \
--  \___\/\___\
--
--Design Name: Z80CpuMonLX9
--Device: XC6SLX9

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Z80CpuMonLX9 is
    generic (
        num_comparators   : integer := 8;        -- default value correct for LX9
        avr_prog_mem_size : integer := 1024 * 16 -- default value correct for LX9
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

        -- Mode jumper, tie low to generate NOPs when paused
        mode            : in    std_logic;

        -- External trigger inputs
        trig            : in    std_logic_vector(1 downto 0);

        -- Serial Console
        avr_RxD         : in    std_logic;
        avr_TxD         : out   std_logic;

        -- LX9 Switches
        sw1             : in    std_logic;
        sw2             : in    std_logic;

        -- LX9 LEDs
        led3            : out   std_logic;
        led6            : out   std_logic;
        led8            : out   std_logic;

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
end Z80CpuMonLX9;

architecture behavioral of Z80CpuMonLX9 is

    signal sw_reset_avr : std_logic;
    signal sw_reset_cpu : std_logic;
    signal led_bkpt     : std_logic;
    signal led_trig0    : std_logic;
    signal led_trig1    : std_logic;

    signal MREQ_n_int   : std_logic;
    signal IORQ_n_int   : std_logic;
    signal RD_n_int     : std_logic;
    signal WR_n_int     : std_logic;
    signal Addr_int     : std_logic_vector(15 downto 0);

    signal tristate_n   : std_logic;
    signal tristate_ad_n: std_logic;

begin

    sw_reset_cpu <= sw1;
    sw_reset_avr <= sw2;
    led3         <= led_trig0;
    led6         <= led_trig1;
    led8         <= led_bkpt;

    -- Tristateable output drivers
    MREQ_n <= 'Z'             when tristate_n = '0' else MREQ_n_int;
    IORQ_n <= 'Z'             when tristate_n = '0' else IORQ_n_int;
    RD_n   <= 'Z'             when tristate_n = '0' else RD_n_int;
    WR_n   <= 'Z'             when tristate_n = '0' else WR_n_int;
    Addr   <= (others => 'Z') when tristate_ad_n = '0' else Addr_int;

    wrapper : entity work.Z80CpuMon
        generic map (
            ClkMult           => 8,
            ClkDiv            => 25,
            ClkPer            => 20.000,
            num_comparators   => num_comparators,
            avr_prog_mem_size => avr_prog_mem_size
            )
        port map(
            clock           =>  clock,

            -- Z80 Signals
            RESET_n         =>  RESET_n,
            CLK_n           =>  CLK_n,
            WAIT_n          =>  WAIT_n,
            INT_n           =>  INT_n,
            NMI_n           =>  NMI_n,
            BUSRQ_n         =>  BUSRQ_n,
            M1_n            =>  M1_n,
            MREQ_n          =>  MREQ_n_int,
            IORQ_n          =>  IORQ_n_int,
            RD_n            =>  RD_n_int,
            WR_n            =>  WR_n_int,
            RFSH_n          =>  RFSH_n,
            HALT_n          =>  HALT_n,
            BUSAK_n         =>  BUSAK_n,
            Addr            =>  Addr_int,
            Data            =>  Data,

            -- Buffer Control Signals
            tristate_n      =>  tristate_n,
            tristate_ad_n   =>  tristate_ad_n,
            DIRD            =>  open,

            -- Mode jumper, tie low to generate NOPs when paused
            mode            =>  mode,

            -- External trigger inputs
            trig            =>  trig,

            -- Serial Console
            avr_RxD         =>  avr_RxD,
            avr_TxD         =>  avr_TxD,

            -- Switches
            sw_reset_cpu    => sw_reset_cpu,
            sw_reset_avr    => sw_reset_avr,

            -- LEDs
            led_bkpt        => led_bkpt,
            led_trig0       => led_trig0,
            led_trig1       => led_trig1,

            -- OHO_DY1 connected to test connector
            tmosi           =>  tmosi,
            tdin            =>  tdin,
            tcclk           =>  tcclk,

            -- Debugging signals
            test1           =>  test1,
            test2           =>  test2,
            test3           =>  test3,
            test4           =>  test4
            );

end behavioral;
