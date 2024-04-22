--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    PS2_RX
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PS2_RX is
    Port (
        CLK          : in  std_logic; -- Vychozi hodinovy signal
        RST          : in  std_logic; -- Vychozi reset
        PS2C         : in  std_logic; -- Hodinovy signal z PS2 portu
        PS2D         : in  std_logic; -- Seriova vstupni data z PS2 portu
        PS2RX_DATA   : out std_logic_vector(7 downto 0); -- Vystupni data
        PS2RX_VALID  : out std_logic  -- Data jsou pripravena na vycteni
    );
end PS2_RX;

architecture FULL of PS2_RX is

   signal ps2_valid       : std_logic;
   signal parity_valid    : std_logic;
   signal parity_ctrl     : std_logic;
   signal parity_ps2      : std_logic;
   signal ps2_bit_count   : unsigned(3 downto 0);
   signal sig_ps2rx_data  : std_logic_vector(7 downto 0);
   signal sig_ps2rx_data2 : std_logic_vector(7 downto 0);

   type state is (idle, dps, load);
   signal present_st : state;
   signal next_st    : state;

begin

    ----------------------------------------------------------------------------
    -- FALLING EDGE DETECTOR OF PS/2 CLOCK
    ----------------------------------------------------------------------------

    falling_edge_detector_i : entity work.FALLING_EDGE_DETECTOR
    port map(
        CLK    => CLK,
        VSTUP  => PS2C,
        VYSTUP => ps2_valid  -- Pri sestupne hrane jsou validni data
    );

    ----------------------------------------------------------------------------
    -- PS2 RX FSM
    ----------------------------------------------------------------------------

    fsm_reg : process (CLK, RST)
    begin
        if (RST = '1') then
            present_st <= idle;
        elsif (rising_edge(CLK)) then
            present_st <= next_st;
        end if;
    end process;

    -- Rozhodovaci cast stavoveho automatu
    process (present_st, PS2D, ps2_valid, ps2_bit_count)
    begin
        case present_st is

            when idle =>
                if (ps2_valid = '1' AND PS2D = '0') then
                    next_st <= dps;
                else
                    next_st <= idle;
                end if;

            when dps =>
                if (to_integer(ps2_bit_count) = 11) then
                    next_st <= load;
                else
                    next_st <= dps;
                end if;

            when load =>
                next_st <= idle;

        end case;
    end process;

    -- Vystupni cast stavoveho automatu
    process (present_st, parity_valid)
    begin
        case present_st is

            when idle =>
                PS2RX_VALID <= '0';

            when dps =>
                PS2RX_VALID <= '0';

            when load =>
                PS2RX_VALID <= parity_valid;

        end case;
    end process;

    ----------------------------------------------------------------------------
    -- BIT COUNTER
    ----------------------------------------------------------------------------

    bit_cnt_p : process (CLK, RST)
    begin
        if (RST = '1') then
            ps2_bit_count <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (to_integer(ps2_bit_count) = 11) then
                ps2_bit_count <= (others => '0');
            elsif (ps2_valid = '1') then
                ps2_bit_count <= ps2_bit_count + 1;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- PS/2 DATA
    ----------------------------------------------------------------------------

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (ps2_valid = '1') then
                if (to_integer(ps2_bit_count) > 0 AND to_integer(ps2_bit_count) < 9) then
                    sig_ps2rx_data(7 downto 0) <= PS2D & sig_ps2rx_data(7 downto 1);
                end if;
            end if;
        end if;
    end process;

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (ps2_valid = '1') then
                if (to_integer(ps2_bit_count) = 9) then
                    parity_ps2 <= PS2D;
                end if;
            end if;
        end if;
    end process;

    -- Propagace PS2 dat na vystup
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (to_integer(ps2_bit_count) = 10) then
                sig_ps2rx_data2 <= sig_ps2rx_data;
            end if;
        end if;
    end process;

    PS2RX_DATA <= sig_ps2rx_data2;

    ----------------------------------------------------------------------------
    -- DATA PARITY CHECK
    ----------------------------------------------------------------------------

    parity_ctrl <= sig_ps2rx_data2(7) xor sig_ps2rx_data2(6) xor
                   sig_ps2rx_data2(5) xor sig_ps2rx_data2(4) xor
                   sig_ps2rx_data2(3) xor sig_ps2rx_data2(2) xor
                   sig_ps2rx_data2(1) xor sig_ps2rx_data2(0) xor '1';

    -- Kontrola parity
    process (CLK, RST)
    begin
        if (RST = '1') then
            parity_valid <= '0';
        elsif (rising_edge(CLK)) then
            if (parity_ctrl = parity_ps2) then
                parity_valid <= '1';
            else
                parity_valid <= '0';
            end if;
        end if;
    end process;

end FULL;
