library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.secd_defs.all;
use work.microcode_rom;

entity control_unit is
  port (
    clk              : in  std_logic;
    reset            : in  std_logic;
    phi_next         : in  std_logic;
    button           : in  std_logic;
    opcode           : in  std_logic_vector(8 downto 0);
    flags            : in  flagsunit;
    read_sel         : out std_logic_vector(4 downto 0);
    write_sel        : out std_logic_vector(4 downto 0);
    alu_sel          : out std_logic_vector(4 downto 0);
    alu_ins          : out std_logic;
    stop_instruction : out std_logic
  );
end entity;

architecture my_control_unit of control_unit is

  -- Current and next microinstruction pointer
  signal mpc         : microaddress := (others => '0');
  signal next_mpc    : microaddress := (others => '0');

  -- Current microinstruction
  signal mi_read_sel  : std_logic_vector(4 downto 0);
  signal mi_write_sel : std_logic_vector(4 downto 0);
  signal mi_alu       : std_logic_vector(4 downto 0);
  signal mi_test      : std_logic_vector(3 downto 0);
  signal mi_a         : std_logic_vector(8 downto 0);

  type stack_type is array(7 downto 0) of microaddress;

  signal stack       : stack_type;
  signal sp          : integer range 0 to 7 := 0;
  signal push_stack  : std_logic := '0';
  signal pop_stack   : std_logic := '0';

  begin
    my_microcode_rom : entity microcode_rom port map (
      clk => clk,
      data(4 downto 0) => mi_read_sel,
      data(9 downto 5) => mi_write_sel,
      data(14 downto 10) => mi_alu,
      data(18 downto 15) => mi_test,
      data(27 downto 19) => mi_a,
      en => '1',
      addr => mpc
      );

    process_microcode : process(phi_next, reset, flags,
                                mi_read_sel, mi_write_sel, mi_alu, mi_test, mi_a,
                                opcode, button, stack, next_mpc, sp)
    begin
      if reset = '1' then
        mpc                     <= (others => '0');
        push_stack              <= '0';
        pop_stack               <= '0';
        stop_instruction        <= '0';
      elsif rising_edge(phi_next) then
        push_stack              <= '0';
        pop_stack               <= '0';
        stop_instruction        <= '0';
        if mi_test = jump then
          mpc <= mi_a;
        elsif mi_test = dispatch then
--          report "executing instruction " & integer'image(to_integer(unsigned(opcode))) & " " & secd_ins_name(to_integer(unsigned(opcode)));
          mpc <= opcode;
        elsif mi_test = markp and flags(mark) = '1' then
          mpc <= mi_a;
        elsif mi_test = fieldp and flags(field) = '1' then
          mpc <= mi_a;   
        elsif mi_test = eqp and flags(eq) = '1' then
          mpc <= mi_a;
        elsif mi_test = leqp and flags(leq) = '1' then
          mpc <= mi_a;
        elsif mi_test = zerop and flags(zero) = '1' then
          mpc <= mi_a;
        elsif mi_test = nump and flags(num) = '1' then
          mpc <= mi_a;
        elsif mi_test = atomp and flags(atom) = '1' then
          mpc <= mi_a;
        elsif mi_test = nilp and flags(nil) = '1' then
          mpc <= mi_a;
        elsif mi_test = buttonp and button = '1' then
          mpc <= mi_a;
        elsif mi_test = call then
          mpc <= mi_a;
          stack(sp) <= next_mpc;
          push_stack <= '1';
        elsif mi_test = returnx then
          mpc <= stack(sp - 1);
          pop_stack <= '1';
        elsif mi_test = stop then
          stop_instruction <= '1';
          mpc <= (others => '0');
        else
          mpc <= next_mpc;
        end if;
      end if;
    end process;

    set_next_mpc : process(phi_next)
    begin
      if falling_edge(phi_next) then
        next_mpc <= next_mpc + "000000001";
      end if;
    end process;

    process_stack : process(reset, phi_next, push_stack, pop_stack, stack)
    begin
      if reset = '1' then
        sp <= 0;
      elsif falling_edge(phi_next) then
        if push_stack = '1' then
          sp <= sp + 1;
        elsif pop_stack = '1' then
          sp <= sp - 1;
        end if;
      end if;
    end process;

    read_sel <= mi_read_sel;
    write_sel <= mi_write_sel;
    alu_sel <= mi_alu;

    alu_ins <= '0' when mi_alu = "00000" else '1';

end;
