----------------------------------------------------------------------------------
-- Pipelined adder tree - Legacy VHDL compatible
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 23.4.2019
-- Modified: 29.4.2019 -> odd number of inputs possible
-- 29.5.2019 -> TDC valid pipeline
-- 4.6.2019 -> VHDL compatible
--
-- Takes the array of LUT6 3-vectors as input and produces the sum of ones using
-- a pipelined adder tree. The structure was generated with recursion.
-- Stackoverflow example as template.
-- Same as "adderTree", but without using VHDL 2008 unconstrained arrays.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adderTreeLegacy is -- a level of the tree -> will be generated recursively
   generic (
      INPUTS:  positive;   -- 4 ; No. of inputs
      BITS:    positive;   -- 3; Bitwidth per input
      LEVEL:   positive;   -- log2(INPUTS) ; ceiled log (MyPkg)
      Y_OUT_LEN: positive  -- LEVEL + BITS ; sum bitwidth
   );
   port (
      clk:    in  std_logic;
      x_in:   in  std_logic_vector (INPUTS*BITS - 1 downto 0);  -- inputs joined in one vector
      y_out:  out std_logic_vector (Y_OUT_LEN - 1 downto 0); -- sum
      
      validIn: in std_logic;
      validOut: out std_logic
    );
end adderTreeLegacy;

architecture recursive of adderTreeLegacy is
   constant ODD_NUM_IN: natural := isodd(INPUTS);  -- do we have odd number of inputs? 0 or 1
   constant NXT_INPS:  natural := INPUTS/2 + ODD_NUM_IN;   -- No. of inputs for the next stage
   constant NPAIRS:  natural  := INPUTS/2; -- No. of input pairs
   
   signal x: std_logic_vector(x_in'range);
   signal nxt_x: std_logic_vector(NXT_INPS*(BITS+1) - 1 downto 0);
   
   signal valid: std_logic;

begin
   INPUT_REGISTER:   -- Register stage
   process (clk)
   begin
      if rising_edge(clk) then
         x <= x_in;  -- x is the input to the adders
         valid <= validIn;
      end if;
   end process;

   ADDERS: 
   process (x)
      variable op1, op2 : unsigned(BITS-1 downto 0);  -- operands for an adder
      variable result : unsigned(BITS downto 0);   -- output of an individual adder
      variable offsetIn, offsetOut : natural := 0;
   begin
      for i in 0 to NPAIRS - 1 loop
         offsetIn := i*2*BITS;  -- operand offset within input vector = pair No. * pair(2) * bitwidth
         op1 := unsigned( x(BITS-1 + offsetIn downto offsetIn) );  -- 1st operand
         op2 := unsigned( x(BITS-1 + BITS+offsetIn downto BITS+offsetIn) ); -- 2nd operand
         
         result := resize(op1, BITS+1) + resize(op2, BITS+1);  -- adder output
         
         offsetOut := i*(BITS+1);   -- result offset within ouput vector
         nxt_x(BITS + offsetOut downto offsetOut) <= std_logic_vector(result);
      end loop;
      if ODD_NUM_IN = 1 then  -- one operand remains
         op1 := unsigned( x(x'left downto x'left - (BITS-1)) );   -- highest in the vector
         result := resize(op1, BITS+1);   -- increase bitwidth
         nxt_x(nxt_x'left downto nxt_x'left - BITS) <= std_logic_vector(result);
      end if;
   end process;
   
   RECURSE:
   if LEVEL > 1 generate 
      NEXT_LEVEL:
      entity work.adderTreeLegacy
      generic map (
         INPUTS => NXT_INPS,
         BITS => BITS + 1,
         LEVEL => LEVEL - 1,
         Y_OUT_LEN => Y_OUT_LEN  -- this stays constant
      )
      port map (
         clk => clk,
         x_in => nxt_x,
         y_out => y_out,
         
         validIn => valid,
         validOut => validOut
      );
   end generate;
   
   END_CONDITION: 
   if LEVEL = 1 generate
      FINAL_OUTPUT:
      y_out <= nxt_x;
      validOut <= valid;
   end generate;
   
end architecture;