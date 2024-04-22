library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;


entity OperatorBase is
  generic
    (
      operator_id   : string;
      const_operand : IStdLogicVector;
      use_constant  : boolean := false;
      zero_delay    : boolean := false
      );
  port (
    -- req/ack follow level protocol
    reqR, ackL : out std_logic;
    ackR, reqL : in  std_logic;
    -- tagL is passed out to tagR
    tagL       : in  std_logic_vector;
    -- data is array(1,m) or array(2,m)
    dataL      : in  StdLogicArray2D;
    dataR      : out IStdLogicVector;
    -- tagR is received from tagL, concurrent
    -- with dataR
    tagR       : out std_logic_vector;
    clk, reset : in  std_logic);
end OperatorBase;


architecture Vanilla of OperatorBase is
  signal   result    : IStdLogicVector(dataR'high downto dataR'low);
  signal   state_sig : std_logic;
  constant tag0      : std_logic_vector(tagR'length-1 downto 0) := (others => '0');
begin  -- Behave

  TwoOperand : if dataL'length(1) = 2 generate
    -- extract op1 and op2 from dataL
    -- purpose: to instantiate the function
    process(dataL)
      variable ld       : StdLogicArray2D(1 downto 0, dataL'high(2) downto dataL'low(2));
      variable op1, op2 : IStdLogicVector(dataL'high(2) downto dataL'low(2));
      variable result_var : IStdLogicVector(dataR'high downto dataR'low);
    begin
      ld := dataL;
      for I in dataL'high(2) downto dataL'low(2) loop
        op1(I) := ld(0, I);
        op2(I) := ld(1, I);
      end loop;  -- I
      TwoInputOperation(operator_id, op1, op2, result_var);
      result <= result_var;
    end process;
  end generate TwoOperand;


  SingleOperandNoConstant : if dataL'length(1) = 1 and not use_constant generate

    process(dataL)
      variable ld  : StdLogicArray2D(0 downto 0, dataL'high(2) downto dataL'low(2));
      variable op1 : IStdLogicVector(dataL'high(2) downto dataL'low(2));
      variable result_var : IStdLogicVector(dataR'high downto dataR'low);
    begin
      ld := dataL;
      for I in dataL'high(2) downto dataL'low(2) loop
        op1(I) := ld(0, I);
      end loop;  -- I
      SingleInputOperation(operator_id, op1, result_var);
      result <= result_var;
    end process;
    
  end generate SingleOperandNoConstant;


  SingleOperandWithConstant : if dataL'length(1) = 1 and use_constant generate
    
    assert const_operand'length = dataL'length(2) report "mismatched length of constant operand " severity failure;

    process(dataL)
      variable ld  : StdLogicArray2D(0 downto 0, dataL'high(2) downto dataL'low(2));
      variable op1 : IStdLogicVector(dataL'high(2) downto dataL'low(2));
      variable result_var : IStdLogicVector(dataR'high downto dataR'low);
    begin
      ld := dataL;
      for I in dataL'high(2) downto dataL'low(2) loop
        op1(I) := ld(0, I);
      end loop;  -- I
      TwoInputOperation(operator_id, op1, const_operand, result_var);
      result <= result_var;
    end process;
    
  end generate SingleOperandWithConstant;


  -- state machine for single cycle delay case
  SingleCycle : if not zero_delay generate
    
    process(clk, reset, ackR, reqL, state_sig)
      variable next_state, ackL_var, reqR_var, latch_var : std_logic;
    begin
      next_state := state_sig;

      ackL_var  := '0';
      reqR_var  := '0';
      latch_var := '0';

      if(reset = '1') then
        next_state := '0';
      else
        case state_sig is
          when '0' =>
            if(reqL = '1') then
              latch_var  := '1';
              ackL_var   := '1';
              next_state := '1';
            end if;
          when '1' =>
            reqR_var := '1';
            if(ackR = '1' and reqL = '1') then
              latch_var := '1';
              ackL_var  := '1';
            elsif (ackR = '1' and reqL = '0') then
              next_state := '0';
            end if;
          when others => null;
        end case;
      end if;

      ackL <= ackL_var;
      reqR <= reqR_var;

      if(clk'event and clk = '1') then
        state_sig <= next_state;
        if(latch_var = '1') then
          dataR <= result;
          tagR <= tagL;
        end if;
      end if;
      
    end process;
  end generate SingleCycle;

  ZeroDelay : if zero_delay generate
    Bypass : block
      signal data_reg : IStdLogicVector(dataR'high downto dataR'low);
      signal tag_reg  : std_logic_vector(tagR'length-1 downto 0);
      signal bypass   : std_logic;
    begin  -- block Bypass
      process(clk, reset, ackR, reqL, state_sig)
        variable next_state, ackL_var, reqR_var, latch_var : std_logic;
      begin
        next_state := state_sig;

        ackL_var  := '0';
        reqR_var  := '0';
        latch_var := '0';

        if(reset = '1') then
          next_state := '0';
        else
          case state_sig is
            when '0' =>
              if(reqL = '1') then

                ackL_var := '1';
                reqR_var := '1';

                if(ackR = '0') then
                  latch_var  := '1';
                  next_state := '1';
                end if;
              end if;
            when '1' =>
              reqR_var := '1';
              if(reqL = '1' and ackR = '1') then
                ackL_var := '1';
              elsif reqL = '1' and ackR = '0' then
                latch_var := '1';
              elsif reqL = '0' and ackR = '1' then
                next_state := '0';
              end if;
            when others => null;
          end case;
        end if;

        ackL   <= ackL_var;
        reqR   <= reqR_var;
        bypass <= latch_var;

        if(clk'event and clk = '1') then
          state_sig <= next_state;
          if(latch_var = '1') then
            data_reg <= result;
            tag_reg  <= tagL;
          end if;
        end if;
      end process;

      dataR <= result when bypass = '1'                      else data_reg;
      tagR  <= tagL   when  bypass = '1' else tag_reg ;
      
    end block Bypass;
    
  end generate ZeroDelay;
  
end Vanilla;

