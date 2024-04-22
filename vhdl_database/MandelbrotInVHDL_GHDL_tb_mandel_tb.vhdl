--  A testbench has no ports.
library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.fixed_pkg.all;

use work.custom_fixed_point_types.all;
use work.test_data.all;

entity mandel_tb is
end mandel_tb;

architecture behav of mandel_tb is
  --  Declaration of the component that will be instantiated.
  component MandelBrot
    port (
      CLK               : in std_logic;
      RST               : in std_logic;

      -- These are the input coordinates on the complex plane
      -- for which the computation will take place.
      input_x, input_y  : in std_logic_vector(31 downto 0);
      -- And this is the screen offset where the returned
      -- color result will be written into:
      input_offset      : in unsigned(31 downto 0);
      -- When this is pulsed once (0->1->0) the engine "wakes up" and
      -- starts trying to store the inputs (x,y,ofs) in the pipeline
      new_input_arrived : in std_logic;
      -- as soon as it manages to do this, it pulses this:
      new_input_ack     : out std_logic;
      -- ...and starts processing.

      --  When it concludes computing, it stores the result here...
      output_number     : out unsigned(7 downto 0);
      output_offset     : out unsigned(31 downto 0);
      -- ...so the outer circuit can take this result and plot it.
      -- To wake it up, we pulse this, to signal completion.
      new_output_made   : out std_logic
      -- No ACK is needed, because we expect someone to be
      -- constantly waiting for this new_output signal, and 
      -- immediately store the output in some single-cycle buffer.
    );
  end component;
  -- for mandel_0: MandelBrot use entity work.MandelBrot;

  -- 50 MHz clock
  constant half_period : time  := 10 ns;
  constant cycle_period : time  := 20 ns;

  signal clk : std_logic := '1'; -- make sure you initialise!
  signal rst : std_logic := '1'; -- make sure you initialise!
  signal input_x, input_y : std_logic_vector(31 downto 0) := (others => '0');
  signal input_offset : unsigned(31 downto 0) := (others => '0');
  signal new_input_arrived : std_logic := '0';
  signal new_input_ack : std_logic;
  signal output_number : unsigned(7 downto 0);
  signal output_offset : unsigned(31 downto 0);
  signal new_output_made : std_logic := '0';
  
  file results_file : text;

begin
  clk <= not clk after half_period;

  --  Component instantiation.
  mandel_0: MandelBrot port map (
    clk => clk,
    rst => rst,
    input_x => input_x,
    input_y => input_y,
    input_offset => input_offset,
    new_input_arrived => new_input_arrived,
    new_input_ack => new_input_ack,
    output_number => output_number,
    output_offset => output_offset,
    new_output_made => new_output_made
  );

  --  This process feeds inputs into MandelBrot
  process
    variable l : line;
    variable timeout : integer := 0;
  begin
    -- Reset for a few cycles
    rst <= '1';
    wait for 2*cycle_period;
    rst <= '0';
    wait for 5*cycle_period;

    --  Check each one of our sample tests..
    for i in patterns'range loop
      --  Set the inputs.
      input_x <= patterns(i).ix;
      input_y <= patterns(i).iy;
      input_offset <= to_unsigned(i, input_offset);
      wait for cycle_period;
      write(l, string'("[TB] New input X for offset "));
      write(l, to_hex(input_offset));
      write(l, string'(" is "));
      write(l, to_hex(input_x));
      writeline(OUTPUT, l);
      new_input_arrived <= '1';
      timeout := 0;
      loop
        timeout := timeout + 1;
        assert timeout < 10000
          report "timed-out waiting for input handshake" severity failure;
        exit when new_input_ack = '1';
        wait for cycle_period;
      end loop;
      new_input_arrived <= '0';
    end loop;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;

  --  This process checks the outputs generated from MandelBrot
  process
    variable l : line;
    variable idx : integer;
    variable expected_value : integer;
    variable received_value : integer;
    variable timeout : integer := 0;
    variable total_received : integer := 0;
  begin
    loop
      loop
        timeout := timeout + 1;
        wait for cycle_period;
        assert timeout < 50000
          report "timed-out waiting for output" severity failure;
        exit when new_output_made = '1';
      end loop;
      received_value := to_integer(output_number);

      write(l, string'("[TB] Output received for offset:"));
      write(l, to_hex(output_offset));
      write(l, string'(" was:"));
      write(l, received_value);
      writeline(OUTPUT, l);

      idx := to_integer(output_offset);
      expected_value := patterns(idx).o;
      write(l, string'("[TB] For index "));
      write(l, idx);
      write(l, string'(" I was expecting:"));
      write(l, expected_value);
      writeline(OUTPUT, l);

      total_received := total_received + 1;
      write(l, string'("[TB] Received test result of "));
      write(l, received_value);
      write(l, string'(", passing test "));
      write(l, total_received);
      write(l, string'(" / "));
      write(l, patterns'length);
      writeline(OUTPUT, l);

      file_open(results_file, "received_results.txt", APPEND_MODE);
      write(l, string'("[TB] Received test result of "));
      write(l, received_value);
      write(l, string'(", passing test "));
      write(l, total_received);
      write(l, string'(" / "));
      write(l, patterns'length);
      writeline(results_file, l);
      file_close(results_file);

      --  Check the outputs.
      assert received_value = expected_value
        report "bad mandelbrot result value" severity failure;

      if total_received = patterns'length then
        assert false report "Successful end of test" severity note;
        exit;
      end if;
    end loop;

    -- assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;


end behav;
