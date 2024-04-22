----------------------------------------------------------------------------------
-- Richie Harris
-- rkharris12@gmail.com
-- 5/23/2021
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sha256_digester is
    port (
        CLK       : in  std_logic;
        ARST_N    : in  std_logic;
        K         : in  std_logic_vector(31 downto 0);
        STATE_IN  : in  std_logic_vector(255 downto 0);
        DATA_IN   : in  std_logic_vector(511 downto 0);
        STATE_OUT : out std_logic_vector(255 downto 0);
        DATA_OUT  : out std_logic_vector(511 downto 0)
        );
end sha256_digester;

architecture rtl of sha256_digester is

    constant C_WORD_SIZE     : integer := 32;

    signal t1                : unsigned(31 downto 0);
    signal t2                : unsigned(31 downto 0);
    signal new_word          : unsigned(31 downto 0);
    signal e0                : std_logic_vector(31 downto 0);
    signal e1                : std_logic_vector(31 downto 0);
    signal ch                : std_logic_vector(31 downto 0);
    signal maj               : std_logic_vector(31 downto 0);
    signal s0                : std_logic_vector(31 downto 0);
    signal s1                : std_logic_vector(31 downto 0);

begin

    -- bit shuffling
    e0 <= (STATE_IN(1 downto 0) & STATE_IN(C_WORD_SIZE - 1 downto 2))
            xor (STATE_IN(12 downto 0) & STATE_IN(C_WORD_SIZE - 1 downto 13))
            xor (STATE_IN(21 downto 0) & STATE_IN(C_WORD_SIZE - 1 downto 22));
    e1 <= (STATE_IN(4*C_WORD_SIZE + 5 downto 4*C_WORD_SIZE) & STATE_IN(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE + 6))
            xor (STATE_IN(4*C_WORD_SIZE + 10 downto 4*C_WORD_SIZE) & STATE_IN(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE + 11))
            xor (STATE_IN(4*C_WORD_SIZE + 24 downto 4*C_WORD_SIZE) & STATE_IN(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE + 25));
    ch <= STATE_IN(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE)
            xor (STATE_IN(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE) 
                and (STATE_IN(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE)
                    xor STATE_IN(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE)));
    maj <= (STATE_IN(C_WORD_SIZE - 1 downto 0) and STATE_IN(2*C_WORD_SIZE - 1 downto C_WORD_SIZE))
            or (STATE_IN(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE)
                and (STATE_IN(C_WORD_SIZE - 1 downto 0) or STATE_IN(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)));
    s0(C_WORD_SIZE - 1 downto 29) <= DATA_IN(C_WORD_SIZE + 6 downto C_WORD_SIZE + 4) xor DATA_IN(C_WORD_SIZE + 17 downto C_WORD_SIZE + 15);
    s0(28 downto 0)               <= (DATA_IN(C_WORD_SIZE + 3 downto C_WORD_SIZE) & DATA_IN(2*C_WORD_SIZE - 1 downto C_WORD_SIZE + 7))
                                        xor (DATA_IN(C_WORD_SIZE + 14 downto C_WORD_SIZE) & DATA_IN(2*C_WORD_SIZE - 1 downto C_WORD_SIZE + 18))
                                        xor DATA_IN(2*C_WORD_SIZE - 1 downto C_WORD_SIZE + 3);
    s1(C_WORD_SIZE - 1 downto 22) <= DATA_IN(14*C_WORD_SIZE + 16 downto 14*C_WORD_SIZE + 7) xor DATA_IN(14*C_WORD_SIZE + 18 downto 14*C_WORD_SIZE + 9);
    s1(21 downto 0)               <= (DATA_IN(14*C_WORD_SIZE + 6 downto 14*C_WORD_SIZE) & DATA_IN(15*C_WORD_SIZE - 1 downto 14*C_WORD_SIZE + 17))
                                        xor (DATA_IN(14*C_WORD_SIZE + 8 downto 14*C_WORD_SIZE) & DATA_IN(15*C_WORD_SIZE - 1 downto 14*C_WORD_SIZE + 19))
                                        xor DATA_IN(15*C_WORD_SIZE - 1 downto 14*C_WORD_SIZE + 10);

    -- t1, t2, and new word in message schedule
    t1       <= unsigned(STATE_IN(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE)) + unsigned(e1) + unsigned(ch) + unsigned(DATA_IN(C_WORD_SIZE - 1 downto 0)) + unsigned(K);
    t2       <= unsigned(e0) + unsigned(maj);
    new_word <= unsigned(s1) + unsigned(DATA_IN(10*C_WORD_SIZE - 1 downto 9*C_WORD_SIZE)) + unsigned(s0) + unsigned(DATA_IN(C_WORD_SIZE - 1 downto 0));

    -- compute output and shift in new word from message schedule
    process(CLK, ARST_N) begin
        if (ARST_N = '0') then
            DATA_OUT  <= (others => '0');
            STATE_OUT <= (others => '0');
        elsif rising_edge(CLK) then
            DATA_OUT <= std_logic_vector(new_word) & DATA_IN(511 downto C_WORD_SIZE);

            STATE_OUT(C_WORD_SIZE - 1 downto 0)               <= std_logic_vector(t1 + t2);
            STATE_OUT(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)   <= STATE_IN(C_WORD_SIZE - 1 downto 0);
            STATE_OUT(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE) <= STATE_IN(2*C_WORD_SIZE - 1 downto C_WORD_SIZE);
            STATE_OUT(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE) <= STATE_IN(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE);
            STATE_OUT(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE_IN(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE)) + t1);
            STATE_OUT(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE) <= STATE_IN(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE);
            STATE_OUT(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE) <= STATE_IN(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE);
            STATE_OUT(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE) <= STATE_IN(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE);
        end if;
    end process;

end rtl;
