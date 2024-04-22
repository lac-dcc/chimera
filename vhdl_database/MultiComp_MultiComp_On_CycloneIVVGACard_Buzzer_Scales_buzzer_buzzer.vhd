-- 向蜂鸣器发送一定频率的方波可以使蜂鸣器发出相应的音调，该实验通过设计一个状态机和分频
-- 器使蜂鸣器发出"多来咪发梭拉西多"的音调。
-- 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY buzzer IS
   PORT (
      clk  : IN std_logic;   
      rst  : IN std_logic;   
      out_bit  : OUT std_logic);   
END buzzer;

ARCHITECTURE arch OF buzzer IS


   SIGNAL clk_div1   :  std_logic_vector(3 DOWNTO 0);   --基频分频计数器，基频为4M
   SIGNAL clk_div2   :  std_logic_vector(12 DOWNTO 0);  --音阶分频计数器，由基频分频产生各个音阶 
   SIGNAL cnt        :  std_logic_vector(21 DOWNTO 0);  --各音阶发声时间长短计数器 
   SIGNAL state      :  std_logic_vector(2 DOWNTO 0);   
   --各个音调的分频系数
   CONSTANT  duo   :  std_logic_vector(12 DOWNTO 0) :="0111011101110";     
   CONSTANT  lai  :  std_logic_vector(12 DOWNTO 0) := "0110101001101";    
   CONSTANT  mi   :  std_logic_vector(12 DOWNTO 0) := "0101111011010";    
   CONSTANT  fa    :  std_logic_vector(12 DOWNTO 0) := "0101100110001";    
   CONSTANT  suo   :  std_logic_vector(12 DOWNTO 0) := "0100111110111";    
   CONSTANT  la    :  std_logic_vector(12 DOWNTO 0) := "0100011100001";    
   CONSTANT  xi    :  std_logic_vector(12 DOWNTO 0) := "0011111101000";    
   CONSTANT  duo1   :  std_logic_vector(12 DOWNTO 0) := "0011101110111";   
   SIGNAL out_bit_tmp :std_logic; 

BEGIN