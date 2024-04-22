library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;
use work.if_pkg.all;

entity instruction_fetch is
    port (clk   : in  std_logic;
          rst_n : in  std_logic;
          d     : in  if_in;
          q     : out if_out);
end entity instruction_fetch;

architecture Behavioral of instruction_fetch is
    -------------------------------------------------
    -- Types
    -------------------------------------------------

    type registers is record
        pc  : unsigned(word'range);
        npc : unsigned(word'range);
    end record registers;

    -------------------------------------------------
    -- Signals
    -------------------------------------------------

    signal r, rin : registers;
    signal zero   : std_logic := '1';

    -------------------------------------------------
    -- Constants
    -------------------------------------------------

    constant c_four : unsigned(2 downto 0) := to_unsigned(4, 3);

begin  -- architecture Behavioral

    -------------------------------------------------
    -- assign outputs
    -------------------------------------------------
    q.fetch_addr <= std_logic_vector(rin.pc);
    q.pc         <= std_logic_vector(r.pc);

    -------------------------------------------------
    -- PC mux
    -------------------------------------------------
    pc_next_proc : process (d, r, zero) is
        variable v : registers;
    begin  -- process pc_next_proc
        -- defaults
        v := r;

        if (zero = '1') then
            v.pc := (others => '0');
        elsif (d.irq = '1') then
            v.pc := IRQ_VECTOR_ADDRESS;
        elsif (d.load_pc = '1') then
            v.pc := unsigned(d.next_pc);
        elsif (d.stall = '1') then
            v.pc := r.pc;
        else
            v.pc := r.pc + c_four;
        end if;

        rin <= v;
    end process pc_next_proc;

    -------------------------------------------------
    -- create the Program Counter register
    -------------------------------------------------
    pc_reg_proc : process (clk, rst_n) is
    begin  -- process pc_reg
        if (rst_n = '0') then
            r.pc <= (others => '0');
            zero <= '1';
        elsif (rising_edge(clk)) then
            r    <= rin;
            zero <= '0';
        end if;
    end process pc_reg_proc;
    
end architecture Behavioral;
