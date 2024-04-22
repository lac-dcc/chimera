library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.secd_defs.all;

entity clock_gen is
  port(
    reset     : in std_logic;
    clk       : in std_logic;
    alu_ins   : in std_logic;
    ram_busy  : in std_logic;
    phi_read  : out std_logic;
    phi_alu   : out std_logic;
    phi_write : out std_logic;
    phi_next  : out std_logic;
    stop      : in std_logic;
    stopped   : out std_logic
    );
end;

architecture my_clock_gen of clock_gen is

  type state_type is (s_idle, s_read, s_alu, s_write, s_wait, s_next);

  signal state : state_type := s_idle;

begin
  clock_gen : process(clk, reset, state, ram_busy, alu_ins)
  begin
    if reset = '1' then

      phi_read  <= '0';
      phi_alu   <= '0';
      phi_write <= '0';
      phi_next  <= '0';
      state <= s_idle;

    elsif rising_edge(clk) then

      if stop = '1' then

        stopped <= '1';

      else 

        stopped <= '0';

        phi_read  <= '0';
        phi_alu   <= '0';
        phi_write <= '0';
        phi_next  <= '0';

        case state is

          when s_idle =>
            state <= s_read;

          when s_read =>
            phi_read <= '1';
            if ram_busy = '0' then
              if alu_ins = '0' then
                state <= s_write;
              else
                state <= s_alu;
              end if;
            end if;

          when s_alu =>
            phi_alu <= '1';
            state <= s_write;

          when s_write =>
            phi_write <= '1';
            state <= s_next;

          when s_next =>
            phi_next <= '1';
            if ram_busy = '1' then
              state <= s_wait;
            else
              state <= s_read;
            end if;

          when s_wait =>
            if ram_busy = '0' then
              state <= s_read;
            else
              state <= s_wait;
            end if;
        end case;
      end if;
    end if;
  end process;
end;
