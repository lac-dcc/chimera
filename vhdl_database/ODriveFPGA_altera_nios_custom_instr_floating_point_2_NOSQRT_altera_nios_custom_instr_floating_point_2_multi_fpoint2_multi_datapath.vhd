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

entity fpoint2_multi_datapath is
    port (
        clk      : in std_logic;
        clk_en   : in std_logic;
        reset    : in std_logic;
        reset_req: in std_logic;
        start    : in std_logic;
        dataa    : in std_logic_vector(31 downto 0);
        datab    : in std_logic_vector(31 downto 0);
        result   : out std_logic_vector(31 downto 0);
        op       : in std_logic_vector(2 downto 0)
        );                
end;

architecture fp_data_path of fpoint2_multi_datapath is

-- Component Declarations --                                                    
component FPDiv is port (
        clk      : in  std_logic;
        clk_en   : in  std_logic;
        reset    : in  std_logic;
        start    : in  std_logic;
        dataa    : in  std_logic_vector(31 downto 0);
        datab    : in  std_logic_vector(31 downto 0);
        result   : out std_logic_vector(31 downto 0));
end component;

component FPMult is port (
  x      : in std_logic_vector(31 downto 0);
  y      : in std_logic_vector(31 downto 0);
  r      : out std_logic_vector(31 downto 0);
  clk    : in std_logic;
  areset : in std_logic);
end component;

component FPAddSub is port (
  x      : in std_logic_vector(31 downto 0);
  y      : in std_logic_vector(31 downto 0);
  opSel  : in std_logic_vector(0 downto 0);
  r      : out std_logic_vector(31 downto 0);
  clk    : in std_logic;
  areset : in std_logic);
end component;

component IntToFloat is port (
  x      : in std_logic_vector(31 downto 0);
  r      : out std_logic_vector(31 downto 0);
  clk    : in std_logic;
  areset : in std_logic);  
end component;

component FloatToInt is port (
  x      : in std_logic_vector(31 downto 0);
  r      : out std_logic_vector(31 downto 0);  
  opSel  : in std_logic_vector(0 downto 0));  
end component;

component FPSqrt is port (
  x      : in std_logic_vector(31 downto 0);
  r      : out std_logic_vector(31 downto 0);
  clk    : in std_logic;
  reset_req : in std_logic;
  areset : in std_logic);
end component;
                                                   
-- internal signals --
signal floatis             : std_logic_vector(31 downto 0);
signal fixsi               : std_logic_vector(31 downto 0);
signal fmuls               : std_logic_vector(31 downto 0);
signal fsqrts              : std_logic_vector(31 downto 0);
signal fdiv                : std_logic_vector(31 downto 0);

signal addsub_select      : std_logic_vector(0 downto 0);
signal addsub_result      : std_logic_vector(31 downto 0);

signal float2int_select   : std_logic_vector(0 downto 0);

signal div_start          : std_logic;

begin 
                                       
-- Encode the operations
  process(op, floatis, fixsi, fsqrts, fmuls, addsub_result, fdiv)begin
    case op is      
      when "001" | "000" => result <= fixsi;
      when "010"         => result <= floatis;
      when "011"         => result <= fsqrts;
      when "100"         => result <= fmuls;
      when "111"         => result <= fdiv;
      when others        => result <= addsub_result;
    end case;   
  end process;                                 
 
--  AddSub Operations encoded on input op: 
--	0 -> -
--	1 -> +
  addsub_select <= "1" when op(0) = '1' else "0";

--  AddSub Operations encoded on input op: 
--	0 -> truncate
--	1 -> round-to-nearest
  float2int_select <= "0" when op(0) = '1' else "1";

-- Qualify start signal for divide.
  div_start <= '1' when (start='1' and op="111") else '0';
  
-- Component wire port map --  
div : FPDiv port map (                                       
  clk     => clk,
  clk_en  => clk_en,  
  reset   => reset,  
  start   => div_start,  
  dataa   => dataa,
  datab   => datab,
  result  => fdiv        
);


multiply : FPMult port map (                                       
  x      => dataa,
  y      => datab,  
  r      => fmuls,
  clk    => clk,
  areset => reset        
);  


addsub : FPAddSub port map (                                       
  x      => dataa,
  y      => datab,  
  opSel  => addsub_select,
  r      => addsub_result,
  clk    => clk,                         
  areset => reset        
); 

int2float : IntToFloat port map (                                       
  x      => dataa, 
  r      => floatis,
  clk    => clk,
  areset => reset        
);

Float2Int : FloatToInt port map (                                       
  x      => dataa, 
  r      => fixsi,
  opSel  => float2int_select
);

--sqrt : FPSqrt port map (
--  x      => dataa,
--  r      => fsqrts,
--  clk    => clk,
--  reset_req    => reset_req,
--  areset => reset                       
--);

end architecture fp_data_path;

