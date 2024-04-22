--------------------------------------------------------
-- 
-- Basic cell radix 4 arch 2. divider
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.mypackage.all;

entity nr_r4_half_cell is
    --generic(pos_x: integer:= 0; pos_y: integer := 0; agroup: string:= "cell_r4"); 
    port (
        op_r: in STD_LOGIC_VECTOR (YBITS downto 0);
        op_y: in STD_LOGIC_VECTOR (YBITS downto 0);
        op_3y: in STD_LOGIC_VECTOR (YBITS+1 downto 0);
        x_1: in STD_LOGIC;
        x_0: in STD_LOGIC;
        n_qneg: out STD_LOGIC_VECTOR (1 downto 0);
        new_r: out STD_LOGIC_VECTOR (YBITS downto 0)
        );
end nr_r4_half_cell;

architecture half of nr_r4_half_cell is
  signal op_4r: STD_LOGIC_VECTOR (YBITS+1 downto 0);
  signal a2_pm_b, a4_pm_b, a4_pm_3b: STD_LOGIC_VECTOR (YBITS+1 downto 0);
  signal sr: STD_LOGIC;
begin
  sr <= op_r(YBITS);
  op_4r <= op_r(YBITS-1 downto 0) & x_1 & x_0; 
  
  a2_pm_b  <= (op_r & x_1) + (op_y) when sr = '1' else (sr & op_y) + not (op_r & x_1);
  a4_pm_3b <= (op_4r + op_3y) when sr = '1' else (op_4r) - (op_3y);
  a4_pm_b  <= (op_4r + op_y) when sr = '1' else (op_4r) - (sr & op_y);

  mux_outps: process (a2_pm_b, a4_pm_b, a4_pm_3b)
  begin
  if a2_pm_b(YBITS)= '1' then 
    new_r <= a4_pm_3b(YBITS downto 0);
    n_qneg(0) <= a4_pm_3b(YBITS);
  else 
    new_r <= a4_pm_b(YBITS downto 0);
    n_qneg(0) <= a4_pm_b(YBITS);
  end if;    
  end process;

  mux_nqb: process (sr,a2_pm_b, a4_pm_b, a4_pm_3b)
  begin
    if sr = '1' then --11      
       n_qneg(1) <= a2_pm_b(YBITS);
    else
       n_qneg(1) <= not a2_pm_b(YBITS);
    end if; 

  end process;
  
end half;
