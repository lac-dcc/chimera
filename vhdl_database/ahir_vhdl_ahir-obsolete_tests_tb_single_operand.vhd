library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;


entity tb_single_operand is

  generic(g_file_name   : string  := "gen_apint_not_5.txt";
          g_input1_high : integer := 4;
          g_input1_low  : integer := 0;
          g_operator_id : string  := "ApIntNot";
          g_output_high : integer := 4;
          g_output_low  : integer := 0);

  port(all_tests_done   : out boolean;
       all_tests_passed : out boolean);

end tb_single_operand;


architecture arch of tb_single_operand is
  
  constant PERIOD      : time   := 20 ns;
  constant operator_id : string := g_operator_id;
  
begin
  read_proc : process

    -- This process loops through a file and reads one line
    -- at a time, parsing the line to get the values and
    -- expected result.
    --
    -- The file format is input1 input2 expected_output 
    
    file in_file : text open read_mode is g_file_name;

    variable line_in              : line;     -- Line buffers
    variable good                 : boolean;  -- Status of the read operations
    variable var_all_tests_passed : boolean := true;  -- Status of the read operations

    variable input1 : IStdLogicVector(g_input1_high downto g_input1_low);
    variable X      : std_logic_vector(input1'length-1 downto 0);
    variable output : IStdLogicVector(g_output_high downto g_output_low);
    variable Z      : std_logic_vector(output'length-1 downto 0);
    
  begin

    all_tests_done <= false;

    loop
      
      if endfile(in_file) then          -- Check EOF
        assert false
          report "End of file encountered; exiting."
          severity note;
        exit;
      end if;

      readline(in_file, line_in);       -- Read a line from the file
      next when line_in'length = 0;     -- Skip empty lines

      read(line_in, x, good);
      assert good
        report "Text I/O read error"
        severity error;
      
      read(line_in, z, good);
      assert good
        report "Text I/O read error"
        severity error;

      input1 := To_ISLV(x);

      SingleInputOperation(operator_id, input1, output);


      wait for PERIOD;                  -- Give the circuit time to stabilize

      if (to_slv(output) /= z) then
        var_all_tests_passed := false;
        assert false
          report "error in operator-id :" & operator_id
          severity error;
      end if;
      
    end loop;

    all_tests_done   <= true;
    all_tests_passed <= var_all_tests_passed;

    wait;
    
  end process;
  
end architecture arch;
