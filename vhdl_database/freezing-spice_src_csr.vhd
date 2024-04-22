library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;
use work.id_pkg.all;
use work.csr_pkg.all;

entity csr is
    port (clk    : in  std_logic;
          csr_in : in  csr_in_t;
          value  : out word);
end entity csr;

architecture behavioral of csr is
    signal cycler    : unsigned(word'range) := (others => '0');
    signal cyclerh   : unsigned(word'range) := (others => '0');
    signal timer     : unsigned(word'range) := (others => '0');
    signal timerh    : unsigned(word'range) := (others => '0');
    signal instretr  : unsigned(word'range) := (others => '0');
    signal instretrh : unsigned(word'range) := (others => '0');

    constant c_word_max : unsigned(word'range) := (others => '1');
begin  -- architecture behavioral

    -- purpose: Create the CSRs
    -- type   : sequential
    -- inputs : clk
    -- outputs: value
    registers_proc : process (clk) is
    begin  -- process registers_proc
        if rising_edge(clk) then
            -- CYCLE and CYCLEH
            if valid = '1' then
                cycler <= cycler + 1;
                if cycler = c_word_max then
                    cyclerh <= cyclerh + 1;
                end if;
            end if;

            -- TIME and TIMEH
            if tick = '1' then
                timer <= timer + 1;
                if timer = c_word_max then
                    timerh <= timerh + 1;
                end if;
            end if;

            -- INSTRET and INSTRETH
            if instret = '1' then
                instretr <= instretr + 1;
                if instretr = c_word_max then
                    instretrh <= instretrh + 1;
                end if;
            end if;

            -- address decode
            case addr is
                when CSR_CYCLE    => value <= std_logic_vector(cycler);
                when CSR_CYCLEH   => value <= std_logic_vector(cyclerh);
                when CSR_TIME     => value <= std_logic_vector(timer);
                when CSR_TIMEH    => value <= std_logic_vector(timerh);
                when CSR_INSTRET  => value <= std_logic_vector(instretr);
                when CSR_INSTRETH => value <= std_logic_vector(instretrh);
                when others       => value <= (others => '0');
            end case;

        end if;
    end process registers_proc;


end architecture behavioral;
