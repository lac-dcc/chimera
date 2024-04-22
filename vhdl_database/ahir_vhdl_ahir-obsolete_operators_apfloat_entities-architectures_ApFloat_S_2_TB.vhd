library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;
use ahir.Components.all;

entity ApFloat_S_2_TB is
  generic
    (g_num_req    : integer := 2;
     g_input_char_width : integer := 8;
     g_input_mat_width  : integer := 23;
     g_output_char_width: integer := 8;
     g_output_mat_width : integer := 23;
     verbose_mode : boolean := false;
     operator_id  : string  := "ApFloatAdd";
     tb_id        : string  := "anonymous"
     );   
  port
    (all_tests_succeeded : out boolean;
     all_tests_evaluated : out boolean);
end ApFloat_S_2_TB;

architecture Behave of ApFloat_S_2_TB is

  constant input_char_width : integer := g_input_char_width;
  constant input_mat_width  : integer := g_input_mat_width;
  constant output_char_width : integer := g_output_char_width;
  constant output_mat_width  : integer := g_output_mat_width;
  constant input_data_width : integer := input_char_width+input_mat_width+1;
  constant output_data_width : integer := output_char_width+output_mat_width+1;
  constant num_req    : integer := g_num_req;

  signal reqR, ackR, reqL, ackL : BooleanArray(num_req-1 downto 0);
  signal x, y                   : ApFloatArray(num_req-1 downto 0, input_char_width downto -input_mat_width);
  signal z                      : ApFloatArray(num_req-1 downto 0, output_char_width downto -output_mat_width);

  constant const_operand : ApFloat(input_char_width downto -input_mat_width) := (others => '1');

  type   Data2D is array(natural range <>) of std_logic_vector(input_data_width-1 downto 0);
  signal d2_1, d2_2 : Data2D(num_req-1 downto 0);

  function Build_Data(tmp_addr : in Data2D) return StdLogicArray2D is
    variable tmp : StdLogicArray2D(num_req-1 downto 0, input_data_width-1 downto 0);
  begin
    for I in 0 to num_req-1 loop
      Insert(tmp, I, tmp_addr(I));
    end loop;
    return(tmp);
  end function Build_Data;

  constant def_colouring : NaturalArray(num_req-1 downto 0) := (0 => 0, others => 1);
  signal   clock, reset  : std_logic                        := '0';

  signal done_flag, success_flag : BooleanArray(num_req-1 downto 0);
begin

  clock <= not clock after 5 ns;

  process(done_flag)
  begin
    if(AndReduce(done_flag))then
      all_tests_evaluated <= true;
      if(AndReduce(success_flag)) then
        assert false report "All Tests Have Passed in TB " & tb_id severity note;
        all_tests_succeeded <= true;
      else
        assert false report "Some Tests Have Failed in TB " & tb_id severity error;
        all_tests_succeeded <= false;
      end if;
    else
      all_tests_evaluated <= false;
    end if;
  end process;

  process
  begin
    reset <= '1';
    wait until clock = '1';
    reset <= '0' after 1 ns;
    wait;
  end process;

  x <= To_ApFloatArray(Build_Data(d2_1));
  y <= To_ApFloatArray(Build_Data(d2_2));

  GenBlock_2 : for R in 0 to num_req-1 generate

    process
      variable dv       : natural;
      variable counter  : natural;
      variable err_flag : boolean;
      variable td       : std_logic_vector(output_data_width-1 downto 0);
      variable td_islv  : IStdLogicVector(output_data_width-1 downto 0);
    begin
      reqR(R) <= false;
      reqL(R) <= false;

      counter := 1;

      err_flag := false;

      ----------------------------------------------------------------------
      -- first the request
      ----------------------------------------------------------------------
      dv := R + 2**(input_char_width-1);

      wait until reset = '0';

      while (dv < (2**input_char_width)-2) loop
        
        d2_1(R) <= (To_SLV(To_Unsigned(dv, input_data_width)));
        d2_2(R) <= (To_SLV(To_Unsigned(dv+1, input_data_width)));

        reqL(R) <= true;
        assert not verbose_mode report "Operator Request " & Convert_To_String(R) & "," &
          Convert_To_String(counter) & " started in TB " & tb_id severity note;
        while true loop
          wait until clock = '1';
          reqL(R) <= false;
          if(ackL(R)) then
            assert not verbose_mode report "Operator Request " & Convert_To_String(R) & "," &
              Convert_To_String(counter) & " completed in TB " & tb_id severity note;
            exit;
          end if;
        end loop;

        -- operation complete?
        reqR(R) <= true;
        while true loop
          wait until clock = '1';
          reqR(R) <= false;
          if(ackR(R)) then
            assert not verbose_mode report "Operation Complete " & Convert_To_String(R) & "," &
              Convert_To_String(counter) & " completed in TB " & tb_id severity note;
            
            TwoInputOperation(operator_id,
                                    To_ISLV(To_ApFloat((To_SLV(To_Unsigned(dv, input_data_width))), input_char_width, -input_mat_width)),
                                    To_ISLV(To_ApFloat((To_SLV(To_Unsigned(dv+1, input_data_width))), input_char_width, -input_mat_width)), td_islv);
            td := To_SLV(td_islv);

            if(td /= To_SLV(Extract(z, R))) then
              err_flag := true;
              assert false report "Mismatch observed at " & Convert_To_String(R) & "," &
                Convert_To_String(counter) & " in TB " & tb_id severity note;
            end if;
            exit;
          end if;
          
        end loop;

        dv      := dv + num_req;
        counter := counter + 1;
      end loop;

      assert err_flag report "Two Operator Tests Finished Successfully (" & Convert_To_String(R) & ") in TB "
        & tb_id
        severity note;
      assert (not err_flag) report "Two Operator Tests Failed (" & Convert_To_String(R) & ") in TB "
        & tb_id
        severity error;

      done_flag(R)    <= true;
      success_flag(R) <= not err_flag;

      wait;
    end process;
  end generate GenBlock_2;

  --------------------------------------------------------------------------
  -- component instantiations
  --------------------------------------------------------------------------
  op2 : ApFloat_S_2
    generic map (colouring => def_colouring)
    port map (
      reqR  => reqL,
      ackR  => ackL,
      reqC  => reqR,
      ackC  => ackR,
      x     => x,
      y     => y,
      z     => z,
      clk   => clock,
      reset => reset);
end Behave;

configuration ApFloatAddTB of ApFloat_S_2_TB is

  for Behave
    for op2 : ApFloat_S_2
      use configuration ahir.ApFloatAdd;
    end for;
  end for;

end ApFloatAddTB;
