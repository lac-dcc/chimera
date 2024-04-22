----------------------------------------------------------------------------------
-- TDC Encoder
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 17.4.2019
-- Modified: 29.4.2019 -> y_out width mismatch fixed
-- 29.5.2019 -> TDC valid pipeline
-- 4.6.2019 -> VHDL compatible
--
-- 1's counter encoder -> converts thermometer code to binary.
-- Uses lookup tables and a pipelined adder tree.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity encoder is
   generic (
      NTaps : integer := 132  -- No. of taps; multiple of 12!
   );
   Port ( 
      clk : in std_logic; -- TDL clock
      thermo: in std_logic_vector(NTaps-1 downto 0); -- thermometer code input
      ones: out std_logic_vector( bitSize(NTaps)-1 downto 0 ); -- number of 1's
      
      validIn: in std_logic;
      validOut: out std_logic
   );
end encoder;

architecture RTL of encoder is

   constant OUT_WIDTH : integer := bitSize(NTaps); -- bitSize is defined in MyPkg
   constant NLUTs : integer := NTaps/6;   -- No. of LUT6 primitive trios
   
   signal LUTout : std_logic_vector(NLUTs*3 - 1 downto 0);  -- LUTs output vector
   --signal LUTout : SlvArray (NLUTs - 1 downto 0)(2 downto 0);  
   signal sum : std_logic_vector(ones'range);
   
   constant Y_OUT_LEN : positive := log2(NLUTs) + 3;  -- output width of the adder tree
   signal adder_out : std_logic_vector(Y_OUT_LEN - 1 downto 0);
   
   signal valid: std_logic;
   
begin
   -- LUT6 array
   LUTs:
   for i in 0 to NLUTs-1 generate   -- 3x LUT6 each time
      LUT6_inst0 : LUT6 -- bit 0
      generic map (
         INIT => x"6996966996696996" -- LUT contents
      )
      port map (
         O => LUTout(3*i + 0), -- LUT output
         --O => LUTout(i)(0),
         I0 => thermo(6*i+0), -- LUT inputs
         I1 => thermo(6*i+1),
         I2 => thermo(6*i+2),
         I3 => thermo(6*i+3),
         I4 => thermo(6*i+4),
         I5 => thermo(6*i+5)
      );      
      LUT6_inst1 : LUT6 -- bit 1
      generic map (
         INIT => x"8117177E177E7EE8" -- LUT contents
      )
      port map (
         O => LUTout(3*i + 1), -- LUT output
         --O => LUTout(i)(1),
         I0 => thermo(6*i+0), -- LUT inputs
         I1 => thermo(6*i+1),
         I2 => thermo(6*i+2),
         I3 => thermo(6*i+3),
         I4 => thermo(6*i+4),
         I5 => thermo(6*i+5)
      );
      LUT6_inst2 : LUT6 -- bit 2
      generic map (
         INIT => x"FEE8E880E8808000" -- LUT contents
      )
      port map (
         O => LUTout(3*i + 2), -- LUT output
         --O => LUTout(i)(2),
         I0 => thermo(6*i+0), -- LUT inputs
         I1 => thermo(6*i+1),
         I2 => thermo(6*i+2),
         I3 => thermo(6*i+3),
         I4 => thermo(6*i+4),
         I5 => thermo(6*i+5)
      );               
   end generate;
   
   -- Adder tree; generated recursively
   Adder_tree:
   entity work.adderTreeLegacy(recursive)
   generic map (
      INPUTS => NLUTs,  -- No. of input vectors
      BITS => 3,  -- 3 bits per vector
      LEVEL => log2(NLUTs),   -- log2(INPUTS) ; ceiled log (MyPkg)
      Y_OUT_LEN => log2(NLUTs) + 3  -- LEVEL + BITS ; sum bitwidth
   )
   port map (
      clk => clk,
      x_in => LUTout,
      y_out => adder_out,
      
      validIn => validIn,
      validOut => valid
   );
   
   -- sometimes it happens that the adder output is too wide
   sum <= std_logic_vector ( resize(unsigned(adder_out), OUT_WIDTH) );
   
   --Addition (no pipeline; combinatorial only):
   --process (LUTout)
      --variable operand : unsigned(2 downto 0);  -- 3 bit input operand
      --variable result : unsigned(sum'range); -- result of the addition
   --begin
      --result := (others => '0');
      --for i in 0 to NLUTs-1 loop
         --operand := unsigned( LUTout(2 + 3*i downto 0 + 3*i) );
         --result := result + resize(operand, sum'left+1);
      --end loop;
      --sum <= std_logic_vector(result); -- output the final result to sum
   --end process;
   
   Output_register:
   process (clk)
   begin
      if rising_edge(clk) then
         ones <= sum;
         validOut <= valid;   
      end if;
   end process;

end RTL;