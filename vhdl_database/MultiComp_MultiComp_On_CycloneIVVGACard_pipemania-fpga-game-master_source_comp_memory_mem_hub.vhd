--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    MEM_HUB
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEM_HUB is
    Port (
        CLK    : in  std_logic; -- Clock
        RST    : in  std_logic; -- Reset
        -- Port A
        EN_A   : in  std_logic; -- Povoleni prace s portem A
        WE_A   : in  std_logic; -- Povoleni zapisu
        ADDR_A : in  std_logic_vector(7 downto 0);  -- Adresa
        DIN_A  : in  std_logic_vector(31 downto 0); -- Vstupni data
        DOUT_A : out std_logic_vector(31 downto 0); -- Vystupni data
        ACK_A  : out std_logic; -- Potvrzeni prace s portem A
        -- Port B
        EN_B   : in  std_logic; -- Povoleni prace s portem B
        WE_B   : in  std_logic; -- Povoleni zapisu
        ADDR_B : in  std_logic_vector(7 downto 0);  -- Adresa
        DIN_B  : in  std_logic_vector(31 downto 0); -- Vstupni data
        DOUT_B : out std_logic_vector(31 downto 0); -- Vystupni data
        ACK_B  : out std_logic; -- Potvrzeni prace s portem B
        -- Output port
        WE     : out std_logic; -- Povoleni zapisu
        ADDR   : out std_logic_vector(7 downto 0);  -- Adresa
        DIN    : out std_logic_vector(31 downto 0); -- Vstupni data
        DOUT   : in  std_logic_vector(31 downto 0)  -- Vystupni data
    );
end MEM_HUB;

architecture FULL of MEM_HUB is

    signal sig_ack_a  : std_logic;
    signal sig_ack_b  : std_logic;
    signal last_ack_a : std_logic;
    signal last_ack_b : std_logic;

begin

    ctrl_mux_p : process (WE_A, WE_B, EN_A, EN_B, ADDR_A, ADDR_B, DIN_A, DIN_B)
    begin
        if (EN_A = '1') then
            WE        <= WE_A;
            ADDR      <= ADDR_A;
            DIN       <= DIN_A;
            sig_ack_a <= '1';
            sig_ack_b <= '0';
        elsif (EN_B = '1') then
            WE        <= WE_B;
            ADDR      <= ADDR_B;
            DIN       <= DIN_B;
            sig_ack_a <= '0';
            sig_ack_b <= '1';
        else
            WE        <= '0';
            ADDR      <= (others => '0');
            DIN       <= (others => '0');
            sig_ack_a <= '0';
            sig_ack_b <= '0';
        end if;
    end process;

    ACK_A <= sig_ack_a;
    ACK_B <= sig_ack_b;

    DOUT_A <= DOUT;
    DOUT_B <= DOUT;

    ack_reg : process (CLK, RST)
    begin
        if (RST = '1') then
            last_ack_a <= '0';
            last_ack_b <= '0';
        elsif (rising_edge(CLK)) then
            last_ack_a <= sig_ack_a;
            last_ack_b <= sig_ack_b;
        end if;
    end process;

end FULL;
