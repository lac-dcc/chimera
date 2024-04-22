-- SECD toplevel file

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.secd_defs.all;
use work.datapath;
use work.control_unit;
use work.clock_gen;

entity secd_system is
  port(
    clk              : in std_logic;
    reset            : in std_logic;
    button           : in std_logic;
    ram_read         : out std_logic;
    ram_in           : in std_logic_vector(31 downto 0);
    ram_write        : out std_logic;
    ram_out          : out std_logic_vector(31 downto 0);
    ram_a            : out std_logic_vector(13 downto 0);
    ram_busy         : in std_logic;
    stop_input       : in std_logic;
    stopped          : out std_logic;
    state            : out std_logic_vector(1 downto 0)
    );
end;

architecture my_secd_system of secd_system is

  signal write_sel : std_logic_vector(4 downto 0);
  signal alu_sel   : std_logic_vector(4 downto 0);
  signal read_sel  : std_logic_vector(4 downto 0);

  signal phi_read  : std_logic;
  signal phi_alu   : std_logic;
  signal phi_write : std_logic;
  signal phi_next  : std_logic;

  attribute buffer_type                 : string;
  attribute buffer_type of phi_next     : signal is "BUFG";

  signal alu_ins   : std_logic;

  signal opcode    : std_logic_vector(8 downto 0);
  signal flags     : flagsunit;

  signal stop_instruction         : std_logic;
  signal stop_instruction_latched : std_logic := '0';
  signal stop_clock_gen           : std_logic;

begin
  my_datapath : entity datapath port map (
    clk       => clk,
    phi_read  => phi_read,
    phi_alu   => phi_alu,
    phi_write => phi_write,
    read_sel  => read_sel,
    alu_sel   => alu_sel,
    write_sel => write_sel,
    ram_in    => ram_in,
    ram_out   => ram_out,
    ram_addr  => ram_a,
    ram_read  => ram_read,
    ram_write => ram_write,
    opcode    => opcode,
    flags     => flags,
    state     => state
  );

  my_control_unit : entity control_unit port map (
    clk              => clk,
    reset            => reset,
    phi_next         => phi_next,
    alu_ins          => alu_ins,
    button           => button,
    read_sel         => read_sel,
    write_sel        => write_sel,
    alu_sel          => alu_sel,
    opcode           => opcode,
    flags            => flags,
    stop_instruction => stop_instruction
  );

  my_clock_gen : entity clock_gen port map (
    reset => reset,
    clk       => clk,
    alu_ins   => alu_ins,
    ram_busy  => ram_busy,
    phi_read  => phi_read,
    phi_alu   => phi_alu,
    phi_write => phi_write,
    phi_next  => phi_next,
    stop      => stop_clock_gen,
    stopped   => stopped
    );

  -- Handle the Stop instruction output of the control unit.  When a STOP
  -- instruction is executed, a pulse is generated on the stop_instruction
  -- output of the control unit.  This is captured by a flip flop to stop the
  -- clock generator until the stop input from the control CPU is asserted 
  -- (assuming that the stop input was low during the run)

  register_stop_instruction : process(stop_instruction, stop_input)
  begin
    if stop_input = '1' then
      stop_instruction_latched <= '0';
    elsif rising_edge(stop_instruction) then
      stop_instruction_latched <= '1';
    end if;
  end process;

  stop_clock_gen <= '1' when stop_instruction_latched = '1' or stop_input = '1' else '0';

end;
