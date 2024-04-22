--
-- PSRAM/HyperRAM controller for Tang Nano 9K / Gowin GW1NR-LV9QN88PC6/15.
-- Feng Zhou, 2022.8
--
-- This is a word or byte based, non-bursting controller for accessing the on-chip HyperRAM.
-- - 1:1 clock design. Memory and main logic work under the same clock.
-- - Low latency. Under default settings, write latency is 7 cycles (1x) or 10 cycles (2x).
--   Read latency is 12 cycles (1x) or 15 cycles(2x). In my test, 2x latency happens about
--   0.05% of time.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity PsramController is
    generic (
        FREQ          : in integer := 96000000;               -- Actual clk frequency, to time 150us initialization delay
        LATENCY       : in integer := 4;                      -- tACC (Initial Latency) in W955D8MBYA datasheet:
                                                              -- 3 (max 83Mhz), 4 (max 104Mhz), 5 (max 133Mhz) or 6 (max 166Mhz)
        CS_DELAY      : in boolean := false                   -- when true an extra cycle is inserted after CS is asserted before clocking starts
    );
    port (
        clk           : in    std_logic;
        clk_p         : in    std_logic;                      -- phase-shifted clock for driving O_psram_ck
        resetn        : in    std_logic;
        read          : in    std_logic;                      -- Set to 1 to read from RAM
        write         : in    std_logic;                      -- Set to 1 to write to RAM
        addr          : in    std_logic_vector(21 downto 0);  -- Byte address to read / write
        din           : in    std_logic_vector(15 downto 0);  -- Data word to write
        byte_write    : in    std_logic;                      -- When writing, only write one byte instead of the whole word.
                                                              -- addr[0]==1 means we write the upper half of din. lower half otherwise.
        dout          : out   std_logic_vector(15 downto 0);
        busy          : out   std_logic;                      -- Last read data. Read is always word-based.
                                                              -- 1 while an operation is in progress

        -- HyperRAM physical interface. Gowin interface is for 2 dies.
        -- We currently only use the first die (4MB).
        O_psram_ck    : out   std_logic_vector(1 downto 0);
        O_psram_ck_n  : out   std_logic_vector(1 downto 0);
        IO_psram_rwds : inout std_logic_vector(1 downto 0);
        IO_psram_dq   : inout std_logic_vector(15 downto 0);
        O_psram_cs_n  : out   std_logic_vector(1 downto 0)
        );
end PsramController;


architecture behavioral of PsramController is

    function MAX(A:natural; B:natural) return natural is
    begin
        if A>B then
            return A;
        else
            return B;
        end if;
    end function;


    component IDDR
--        generic (
--            Q0_INIT : bit := '0';
--            Q1_INIT : bit := '0'
--        );
        port (
            Q0  : out std_logic;
            Q1  : out std_logic;
            D   : in  std_logic;
            CLK : in  std_logic
        );
    end component;

    component ODDR
--        generic (
--            constant INIT : bit := '0';
--                TXCLK_POL : std_logic := '0'
--        );
        port (
            Q0  : out std_logic;
            Q1  : out std_logic;
            D0  : in  std_logic;
            D1  : in  std_logic;
            TX  : in  std_logic;
            CLK : in  std_logic
        );
    end component;

    function f_log2 (x : positive) return natural is
        variable i : natural;
    begin
        i := 0;
        while (2**i < x) and i < 31 loop
            i := i + 1;
        end loop;
        return i;
    end function;

    -- 150us initialization delay
    constant INIT_TIME  : integer :=  FREQ / 1000 * 160 / 1000;

    signal CR_LATENCY : std_logic_vector(3 downto 0);

    type state_type is (INIT_ST, CONFIG_ST, IDLE_ST, CS_DELAY_ST, READ_ST, WRITE_ST, WRITE_STOP_ST);

    signal state              : state_type;

    signal cfg_now            : std_logic;
    signal dq_oen             : std_logic;
    signal ram_cs_n           : std_logic;
    signal ck_e               : std_logic;
    signal ck_e_p             : std_logic;
    signal wait_for_rd_data   : std_logic;
    signal ub                 : std_logic; -- 1 for upper byte

    signal w_din              : std_logic_vector(15 downto 0);
    signal cycles_sr          : std_logic_vector(MAX(2+LATENCY*2,9) downto 0); -- shift register counting cycles
    signal dq_sr              : std_logic_vector(63 downto 0); -- shifts left 8-bit every cycle

    signal rst_cnt            : std_logic_vector(f_log2(INIT_TIME + 1) - 1 downto 0);
    signal rst_done           : std_logic;
    signal rst_done_p1        : std_logic;
    signal cfg_busy           : std_logic;

-- DDR input output signals
    signal dq_out_ris         : std_logic_vector(7 downto 0);
    signal dq_out_fal         : std_logic_vector(7 downto 0);
    signal dq_in_ris          : std_logic_vector(7 downto 0);
    signal dq_in_fal          : std_logic_vector(7 downto 0);
    signal rwds_out_ris       : std_logic;
    signal rwds_out_fal       : std_logic;
    signal rwds_oen           : std_logic;
    signal rwds_in_ris        : std_logic;
    signal rwds_in_fal        : std_logic;
    signal additional_latency : std_logic;
    signal cs_n_tbuf          : std_logic;
    signal ck_tbuf            : std_logic;
    signal ck_tbuf_n          : std_logic;
    signal rwds_oen_tbuf      : std_logic;
    signal rwds_tbuf          : std_logic;

    signal dq_out_tbuf        : std_logic_vector(7 downto 0);
    signal dq_oen_tbuf        : std_logic_vector(7 downto 0);

    signal i_write_cycle_active : std_logic;

    signal r_cmd_save         : std_logic;

begin

    assert LATENCY >= 3 and LATENCY <= 6 report "LATENCY must be >= 3 and <= 5";

    dq_out_ris <= dq_sr(63 downto 56);
    dq_out_fal <= dq_sr(55 downto 48);

    -- this will be fixed at compile time, as LATENCY is a generic
    CR_LATENCY <= "1110" when LATENCY = 3 else
                  "1111" when LATENCY = 4 else
                  "0000" when LATENCY = 5 else
                  "0001" when LATENCY = 6 else
                  "1110";

    busy <= '0' when state = IDLE_ST else '1';

    -- LATENCY 3 requires special case, x2 indication from rwds is same cycle as write
    g_wL3_1:if LATENCY = 3 generate
        i_write_cycle_active <= '1' when cycles_sr(2+LATENCY) = '1' and IO_psram_rwds(0) = '0' else
                                '1' when cycles_sr(2+LATENCY*2) = '1' else
                                '0';
    end generate;
    g_wL3_2:if LATENCY /=3 generate
        i_write_cycle_active <= '1' when cycles_sr(2+LATENCY) = '1' and additional_latency = '0' else
                                '1' when cycles_sr(2+LATENCY*2) = '1' else
                                '0';
    end generate;

    -- Main FSM for HyperRAM read/write
    process (clk)
    variable v_start_trans  : boolean;
    variable v_my_cmd       : std_logic;
    begin
        if rising_edge(clk) then
            cycles_sr <= cycles_sr(cycles_sr'high-1 downto cycles_sr'low) & '0';
            dq_sr <= dq_sr(47 downto 0) & x"0000";          -- shift 16-bits each cycle
            ck_e_p <= ck_e;

            v_start_trans := false;

            case state is
            when INIT_ST =>
                if cfg_now = '1' then
                    cycles_sr <= (0 => '1', others => '0');
                    ram_cs_n <= '0';
                    state <= CONFIG_ST;
                end if;
            when CONFIG_ST =>
                if cycles_sr(0) = '1' then
                    dq_sr <= x"6000010000008f" & CR_LATENCY & x"7";      -- last byte, 'e' (3 cycle latency max 83Mhz), '7' (variable 1x/2x latency)
                    dq_oen <= '0';
                    ck_e <= '1';      -- this needs to be earlier 1 cycle to allow for phase shifted clk_p
                end if;
                if cycles_sr(4) = '1' then
                    state <= IDLE_ST;
                    ck_e <= '0';
                    cycles_sr <= (0 => '1', others => '0');
                    dq_oen <= '1';
                    ram_cs_n <= '1';
                end if;
            when IDLE_ST =>
                rwds_oen <= '1';
                ck_e <= '0';
                ram_cs_n <= '1';
                if read = '1' or write = '1' then
                    ram_cs_n <= '0';
                    r_cmd_save <= write;
                    if CS_DELAY then
                        state <= CS_DELAY_ST;
                    else
                        v_start_trans := true;
                    end if;
                end if;
            when CS_DELAY_ST =>
                v_start_trans := true;
            when READ_ST =>
                if cycles_sr(3) = '1' then
                    -- command sent, now wait for result
                    dq_oen <= '1';
                end if;
                if cycles_sr(9) = '1' then
                    wait_for_rd_data <= '1';
                end if;
                if wait_for_rd_data = '1' and (rwds_in_ris /= rwds_in_fal) then     -- sample rwds falling edge to get a word / \_
                    dout <= dq_in_ris & dq_in_fal;
                    ram_cs_n <= '1';
                    ck_e <= '0';
                    state <= IDLE_ST;
                end if;
            when WRITE_ST =>
                if LATENCY /= 3 then
                    if cycles_sr(5) = '1' then
                        additional_latency <= IO_psram_rwds(0);  -- sample RWDS to see if we need additional latency, DB: don't pass through IDDR as then it is too late!
                        -- Write timing is trickier - we sample RWDS at cycle 5 to determine whether we need to wait another tACC.
                        -- If it is low, data starts at 2+LATENCY. If high, then data starts at 2+LATENCY*2.
                    end if;
                end if;
                if cycles_sr(2+LATENCY-1) = '1' then
                    --DB: apply correct rwds preamble
                    rwds_oen <= '0';
                    rwds_out_ris <= '0';
                    rwds_out_fal <= '0';
                end if;
                if i_write_cycle_active = '1' then
                    rwds_oen <= '0';
                    if byte_write = '1' then       -- RWDS is data mask (1 means not writing)
                        rwds_out_ris <= not addr(0);
                        rwds_out_fal <= addr(0);
                    else
                        rwds_out_ris <= '0';
                        rwds_out_fal <= '0';
                    end if;
                    dq_sr(63 downto 48) <= w_din;
                    state <= WRITE_STOP_ST;
                end if;
            when others =>
                rwds_oen <= '1';
                ram_cs_n <= '1';
                ck_e <= '0';
                state <= IDLE_ST;
            end case;

            if resetn = '0'then
                state <= INIT_ST;
                ram_cs_n <= '1';
                ck_e <= '0';
                additional_latency <= '0';
                dout <= (others => '0');
            end if;

            if v_start_trans then
                if state = IDLE_ST then
                    v_my_cmd := write;
                else
                    v_my_cmd := r_cmd_save;
                end if;
                -- start read/write operation
                dq_sr <= (not v_my_cmd) & "0100000000000" & addr(21 downto 4) & "0000000000000" & addr(3 downto 1) & "0000010011010100";
                --       14-bit                          18-bit               13-bit           3-bit            total 48-bit CA
                ck_e <= '1';
                dq_oen <= '0';
                wait_for_rd_data <= '0';
                w_din <= din;
                cycles_sr <= (1 => '1', others =>'0');    -- start from cycle 1
                if v_my_cmd = '1' then
                    state <= WRITE_ST;
                else
                    state <= READ_ST;
                end if;
            end if;

        end if;
    end process;

    --
    -- Generate cfg_now pulse after 150us delay
    --

    process (clk)
    begin
        if rising_edge(clk) then
            rst_done_p1 <= rst_done;
            cfg_now     <= rst_done and not rst_done_p1;-- Rising Edge Detect

            if rst_cnt /= INIT_TIME then      -- count to 160 us
                rst_cnt  <= rst_cnt + 1;
                rst_done <= '0';
                cfg_busy <= '1';
            else
                rst_done <= '1';
                cfg_busy <= '0';
            end if;

            if resetn = '0' then
                rst_cnt  <= (others => '0');
                rst_done <= '0';
                cfg_busy <= '1';
            end if;
        end if;
    end process;

    -- Tristate DDR output

    oddr_cs_n : ODDR port map (
        CLK => clk,
        D0 => ram_cs_n,
        D1 => ram_cs_n,
        Q0 => cs_n_tbuf,
        TX => '0'
        );
    O_psram_cs_n(0) <= cs_n_tbuf;

    oddr_rwds : ODDR port map (
        CLK => clk,
        D0 => rwds_out_ris,
        D1 => rwds_out_fal,
        TX => rwds_oen,
        Q0 => rwds_tbuf,
        Q1 => rwds_oen_tbuf
        );
    IO_psram_rwds(0) <= 'Z' when rwds_oen_tbuf = '1' else rwds_tbuf;


    gen1: for i1 in 0 to 7 generate
        oddr_dq_i : ODDR port map (
            CLK => clk,
            D0  => dq_out_ris(i1),
            D1  => dq_out_fal(i1),
            TX  => dq_oen,
            Q0  => dq_out_tbuf(i1),
            Q1  => dq_oen_tbuf(i1)
            );
        IO_psram_dq(i1) <= 'Z' when dq_oen_tbuf(i1) = '1' else dq_out_tbuf(i1);
    end generate;

    -- Note: ck uses phase-shifted clock clk_p
    oddr_ck : ODDR port map (
        CLK => clk_p,
        D0  => ck_e_p,
        D1  => '0',
        Q0  => ck_tbuf,
        TX => '0'
        );

    O_psram_ck(0) <= ck_tbuf;

    -- DMB: Add the inverted clock output
    oddr_ck_n : ODDR port map (
        CLK => clk_p,
        D0  => not ck_e_p,
        D1  => '1',
        Q0  => ck_tbuf_n,
        TX => '0'
        );

    O_psram_ck_n(0) <= ck_tbuf_n;

    -- Tristate DDR input
    iddr_rwds : IDDR port map (
        CLK => clk,
        D   => IO_psram_rwds(0),
        Q0  => rwds_in_ris,
        Q1  => rwds_in_fal
        );

    gen2: for i2 in 0 to 7 generate
        iddr_dq_i : IDDR port map (
            CLK => clk,
            D => IO_psram_dq(i2),
            Q0 => dq_in_ris(i2),
            Q1 => dq_in_fal(i2)
            );
    end generate;

    -- Assign outputs to avoid warnings controlling the second PSRAM to avoid warnings
    O_psram_cs_n(1)  <= '1';
    O_psram_ck(1)    <= '1';
    O_psram_ck_n(1)  <= '0';
    IO_psram_rwds(1) <= 'Z';
    IO_psram_dq(15 downto 8) <= (others => 'Z');

end behavioral;
