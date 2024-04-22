-- (C) 2001-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

entity fpoint2_combi is
    port (
        dataa  : in std_logic_vector(31 downto 0);
        datab  : in std_logic_vector(31 downto 0);
        n     : in std_logic_vector(3 downto 0);
        result : out std_logic_vector(31 downto 0)
        );
end;


architecture fpcombi of fpoint2_combi is

--component instantiation--

component FPAbs is port (
        dataa  : in std_logic_vector(31 downto 0); -- src1 input operand
        result : out std_logic_vector(31 downto 0) -- result for the operation
        );
end component;

component FPNeg is port (
        dataa  : in std_logic_vector(31 downto 0); -- src1 input operand
        result : out std_logic_vector(31 downto 0) -- result for the operation
        );
end component;

component FPCompareFused is port (
  x      : in std_logic_vector(31 downto 0);
  y      : in std_logic_vector(31 downto 0);
  opSel  : in std_logic_vector(2 downto 0);
  r      : out std_logic_vector(0 downto 0));  
end component;   

component FPMinMaxFused is port (
  x : in std_logic_vector(31 downto 0);
  y : in std_logic_vector(31 downto 0);
  opSel : in std_logic_vector(0 downto 0);
  r : out std_logic_vector(31 downto 0));
end component;

--signals
signal fneg                : std_logic_vector(31 downto 0);
signal fabs                : std_logic_vector(31 downto 0);

signal compare_select     : std_logic_vector(2 downto 0);
signal compare_result     : std_logic_vector(0 downto 0);
signal minmax_select      : std_logic_vector(0 downto 0);
signal minmax_result      : std_logic_vector(31 downto 0);

begin

-- Encode the operations
  Operation_encode : process(n, fneg, fabs, minmax_result, compare_result)begin
    case n is 
      when x"0"   => result <= fabs;
      when x"1"   => result <= fneg;
      when x"8" | x"9"  => result <= minmax_result;
      when others => result <= (31 downto 1=> '0') & compare_result; -- Tie it to compare result, default to always compare
    end case;   
  end process;     

-- Compared fused Operations: LT(fcmplts), LE(fcmples), EQ(fcmpeqs), GE(fcmpges), GT(fcmpgts)
-- Operations encoded on input o:                                                                        
-- 	000 -> LT(fcmplts)(231) -7(op value) 
-- 	001 -> LE(fcmples)(230) -6(op value)
-- 	010 -> EQ(fcmpeqs)(227) -3(op value) 
-- 	011 -> GE(fcmpges)(228) -4(op value)           
-- 	100 -> GT(fcmpgts)(229) -5(op value)
-- 	101 -> NEQ(fcmpnes)(226) -2(op value)
  compare_sel : process(n)begin
    case n is                     
      when x"2"   => compare_select <= "101";   -- NEQ
      when x"3"   => compare_select <= "010";   -- EQ
      when x"4"   => compare_select <= "011";   -- GE
      when x"5"   => compare_select <= "100";   -- GT
      when x"6"   => compare_select <= "001";   -- LE
      when others => compare_select <= "000";   -- select LT by default
    end case;   
  end process;    
  
  -- FPmin max
  -- 1 -> FPMax
  -- 0 -> FPMin

  minmax_select <= "1" when n = x"8" else "0";

-- Component wire port map --  

FPMinMax : FPMinMaxFused port map (
  x      => dataa,
  y      => datab,
  opSel  => minmax_select,
  r      => minmax_result
); 

compare : FPCompareFused port map (                                       
  x      => dataa,
  y      => datab,  
  opSel  => compare_select,
  r      => compare_result     
);

neg_map : FPNeg port map (
  dataa  => dataa,
  result => fneg
);

abs_map : FPAbs port map (
  dataa  => dataa,
  result => fabs
);

end architecture fpcombi;
