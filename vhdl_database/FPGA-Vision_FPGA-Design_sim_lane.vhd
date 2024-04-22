-- sim_lane.vhd
--
-- testbench for lane detection
-- reading and writing images in text-file format
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Marco Winzker, Hochschule Bonn-Rhein-Sieg, 03.01.2018

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity sim_lane is
end sim_lane;

architecture sim of sim_lane is

-- define constants for simulation
  constant stimuli_filename  : string  := "street_0_stimuli.txt";
  constant expected_filename : string  := "street_0_expected.txt";
  constant response_filename : string  := "street_0_response.txt";
  constant x_size            : integer := 1280;  -- horizontal size of image
  constant y_size            : integer := 720;   -- vertical size of image
  constant x_blank           : integer := 100;   -- horizontal blanking
  constant trail             : integer := 1000;  -- clock cycles after active image

-- signals of testbench
  signal clk       : std_logic := '0';
  signal reset_n   : std_logic;
  signal enable_in : std_logic_vector(2 downto 0);
  signal vs_in     : std_logic;
  signal hs_in     : std_logic;
  signal de_in     : std_logic;
  signal r_in      : std_logic_vector(7 downto 0);
  signal g_in      : std_logic_vector(7 downto 0);
  signal b_in      : std_logic_vector(7 downto 0);
  signal vs_out    : std_logic;
  signal hs_out    : std_logic;
  signal de_out    : std_logic;
  signal r_out     : std_logic_vector(7 downto 0);
  signal g_out     : std_logic_vector(7 downto 0);
  signal b_out     : std_logic_vector(7 downto 0);
  signal clk_o     : std_logic;
  signal led       : std_logic_vector(2 downto 0);
  signal x, y      : integer;
  signal end_tb    : integer   := 0;
  signal mismatch  : integer   := 0;

begin

-- clock generation
  clk <= not clk after 5 ns;

-- instantiation of design-under-verification
  duv : entity work.lane
    port map (clk       => clk,
              reset_n   => reset_n,
              enable_in => enable_in,
              vs_in     => vs_in,
              hs_in     => hs_in,
              de_in     => de_in,
              r_in      => r_in,
              g_in      => g_in,
              b_in      => b_in,
              vs_out    => vs_out,
              hs_out    => hs_out,
              de_out    => de_out,
              r_out     => r_out,
              g_out     => g_out,
              b_out     => b_out,
              clk_o     => clk_o,
              led       => led);

-- main process for stimuli
  stimuli_process : process

-- variables for stimuli file
    file stimuli_file       : text;
    variable l              : line;
    variable stimuli_status : file_open_status;
    variable r, g, b        : std_logic_vector(7 downto 0);

  begin

-- init
    reset_n   <= '0', '1' after 50 ns;  -- reset for 10 clock cycles
    enable_in <= "111";
    vs_in     <= '0';
    hs_in     <= '0';
    de_in     <= '0';
    r_in      <= "00000000";
    g_in      <= "00000000";
    b_in      <= "00000000";

-- wait for reset
    wait for 100 ns;

    file_open(stimuli_status, stimuli_file, stimuli_filename, read_mode);
    readline(stimuli_file, l);          -- read first line with comments

-- loop for one frame
    for y in 0 to y_size-1 loop
      if (y = 0) then
        vs_in <= '1';
      else
        vs_in <= '0';
      end if;

      hs_in <= '1';
      for x in 0 to x_blank-1 loop
        wait until falling_edge(clk);
      end loop;  -- x, blanking

      hs_in <= '0';
      de_in <= '1';
      for x in 0 to x_size-1 loop
        readline(stimuli_file, l);      -- read one line
        hread(l, r);
        hread(l, g);
        hread(l, b);
        r_in <= r;
        g_in <= g;
        b_in <= b;

        wait until falling_edge(clk);
      end loop;  -- x, active line
      de_in <= '0';
      r_in  <= "00000000";
      g_in  <= "00000000";
      b_in  <= "00000000";

    end loop;  -- y

-- simulation for trailing clock cycles
    for i in 0 to trail-1 loop
      wait until falling_edge(clk);
    end loop;

    end_tb <= 1;                        -- signal to close response_file
    file_close(stimuli_file);
    wait for 20 ns;

-- stop simulation
    if (mismatch = 0) then
      assert false
        report "Simulation completed, EVERYTHING OK"
        severity failure;
    else
      assert false
        report "Simulation completed, " & integer'image(mismatch) & " MISMATCHES XXXX XXXX XXXX XXXX XXXX XXXX"
        severity failure;
    end if;

  end process;

-- second process to handle DUT output
  response_process : process
    variable x_pos, y_pos     : integer := 0;
-- variables for writing simulated response
    file response_file        : text;
    variable l                : line;
    variable response_status  : file_open_status;
    variable r, g, b          : std_logic_vector(7 downto 0);
-- variables for expected response file
    file expected_file        : text;
    variable l_ex             : line;
    variable expected_status  : file_open_status;
    variable r_ex, g_ex, b_ex : std_logic_vector(7 downto 0);

  begin

-- open file for output
    file_open(response_status, response_file, response_filename, write_mode);
    write (l, string'("# Output from edupow-testbench"));
    writeline(response_file, l);        -- write first line with comments
-- open file for expected data
    file_open(expected_status, expected_file, expected_filename, read_mode);
    readline(expected_file, l_ex);      -- read first line with comments

    wait until (hs_out = '1');

    while (end_tb /= 1) loop
      wait until falling_edge(clk);
      if (de_out = '1') then

        -- get response and write to response file
        if (x_pos >= 2 and y_pos >= 2) then
          -- valid data
          r := r_out;
          g := g_out;
          b := b_out;
        else
          -- left or top border, set to white
          r := "11111111";
          g := "11111111";
          b := "11111111";
        end if;
        hwrite(l, r);
        write (l, string'(" "));
        hwrite(l, g);
        write (l, string'(" "));
        hwrite(l, b);
        writeline(response_file, l);

        -- read expected response and compare to simulation response
        readline(expected_file, l_ex);  -- read one line
        hread(l_ex, r_ex);
        hread(l_ex, g_ex);
        hread(l_ex, b_ex);
        if (x_pos >= 2 and y_pos >= 2) then
          -- check only if valid data
          if (r /= r_ex) or (g /= g_ex) or (b /= b_ex) then
            mismatch <= mismatch + 1;
            assert false
              report "MISMATCH in simulation at position x=" & integer'image(x_pos) & " y=" & integer'image(y_pos)
              severity note;
          end if;
        end if;

        x_pos := x_pos + 1;
        if x_pos = x_size then
          y_pos := y_pos + 1;
          x_pos := 0;
        end if;

      end if;
    end loop;

    file_close(response_file);
    file_close(expected_file);
    wait until (end_tb = 2);

  end process;

end sim;
