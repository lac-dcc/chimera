-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY divider IS
   GENERIC( 
      WIDTH_DIVID : integer := 32;      -- Width Dividend
      WIDTH_DIVIS : integer := 16;      -- Width Divisor
      WIDTH_SHORT : Integer := 8        -- Check Overflow against short Byte/Word
   );
   PORT( 
      clk       : IN     std_logic;                                  -- System Clock
      reset     : IN     std_logic;                                  -- Active high
      dividend  : IN     std_logic_vector (WIDTH_DIVID-1 DOWNTO 0);
      divisor   : IN     std_logic_vector (WIDTH_DIVIS-1 DOWNTO 0);
      quotient  : OUT    std_logic_vector (WIDTH_DIVIS-1 DOWNTO 0);
      remainder : OUT    std_logic_vector (WIDTH_DIVIS-1 DOWNTO 0);
      twocomp   : IN     std_logic;
      w         : IN     std_logic;                                  -- UNUSED!
      overflow  : OUT    std_logic;
      start     : IN     std_logic;
      done      : OUT    std_logic
   );
END divider ;

ARCHITECTURE rtl_ser OF divider IS

signal dividend_s     : std_logic_vector(WIDTH_DIVID downto 0);       
signal divisor_s      : std_logic_vector(WIDTH_DIVIS downto 0);       

signal divis_rect_s   : std_logic_vector(WIDTH_DIVIS-1 downto 0);     
               
signal signquot_s     : std_logic;
signal signremain_s   : std_logic;                         

signal accumulator_s  : std_logic_vector(WIDTH_DIVID downto 0); 
signal aluout_s       : std_logic_vector(WIDTH_DIVIS downto 0);       
signal newaccu_s      : std_logic_vector(WIDTH_DIVID downto 0);       

signal quot_s         : std_logic_vector (WIDTH_DIVIS-1 downto 0);
signal remain_s       : std_logic_vector (WIDTH_DIVIS-1 downto 0);

constant null_s       : std_logic_vector(31 downto 0) := X"00000000";   

signal count_s        : std_logic_vector (3 downto 0);                  -- Number of iterations

signal overflow_s     : std_logic; --_vector (WIDTH_DIVIS downto 0);
signal sremainder_s   : std_logic_vector (WIDTH_DIVIS-1 downto 0);
signal squotient_s    : std_logic_vector (WIDTH_DIVIS-1 downto 0);

signal signfailure_s  : std_logic;                                      

signal zeroq_s        : std_logic;                                      
signal zeror_s        : std_logic;                                      
signal zerod_s        : std_logic;                                      
signal pos_s          : std_logic;
signal neg_s          : std_logic;

type   states is (s0,s1,s2);                                            
signal state,nextstate: states;

function rectifyd (r  : in  std_logic_vector (WIDTH_DIVID downto 0);    -- Rectifier for dividend + 1 bit
                  twoc: in  std_logic)                                  -- Signed/Unsigned
  return std_logic_vector is 
  variable rec_v      : std_logic_vector (WIDTH_DIVID downto 0);                
begin
    if ((r(WIDTH_DIVID) and twoc)='1') then 
        rec_v := not(r); 
    else 
        rec_v := r;
    end if;
    return (rec_v + (r(WIDTH_DIVID) and twoc));        
end; 

function rectifys (r  : in  std_logic_vector (WIDTH_DIVIS-1 downto 0);  -- Rectifier for divisor
                  twoc: in  std_logic)                                  -- Signed/Unsigned
  return std_logic_vector is 
  variable rec_v      : std_logic_vector (WIDTH_DIVIS-1 downto 0);                
begin
    if ((r(WIDTH_DIVIS-1) and twoc)='1') then 
        rec_v := not(r); 
    else 
        rec_v := r;
    end if;
    return (rec_v + (r(WIDTH_DIVIS-1) and twoc));        
end; 


begin   

--  Sign Quotient
    signquot_s    <= (dividend(WIDTH_DIVID-1) xor divisor(WIDTH_DIVIS-1)) and twocomp;
        
--  Sign Remainder
    signremain_s  <= dividend(WIDTH_DIVID-1) and twocomp;

    dividend_s    <= '0'&dividend when twocomp='0' else rectifyd(dividend(WIDTH_DIVID-1)&dividend, twocomp);                       

    divisor_s <= ('1'&divisor) when (divisor(WIDTH_DIVIS-1) and twocomp)='1' else not('0'&divisor) + '1';

--  Subtractor (Adder, WIDTH_DIVIS+1)
    aluout_s      <= accumulator_s(WIDTH_DIVID downto WIDTH_DIVID-WIDTH_DIVIS) + divisor_s;

--  Append Quotient section to aluout_s
    newaccu_s     <= aluout_s & accumulator_s(WIDTH_DIVID-WIDTH_DIVIS-1 downto 0);   

process (clk,reset)                         
    begin
        if (reset='1') then                     
            accumulator_s   <= (others => '0');
        elsif (rising_edge(clk)) then  
            if start='1' then                                           
                accumulator_s <= dividend_s(WIDTH_DIVID-1 downto 0) & '0';   -- Load Dividend in remainder +shl
            elsif pos_s='1' then                                             -- Positive, remain=shl(remain,1)
                accumulator_s <= newaccu_s(WIDTH_DIVID-1 downto 0) & '1';    -- Use sub result   
            elsif neg_s='1' then                                             -- Negative, shl(remainder,0)
                accumulator_s <= accumulator_s(WIDTH_DIVID-1 downto 0) & '0';-- Use original remainder
            end if;                               
        end if;   
end process;    

-- 2 Process Control FSM
process (clk,reset)       
    begin
        if (reset = '1') then     
            state   <= s0; 
            count_s <= (others => '0');             
        elsif (rising_edge(clk)) then    
            state <= nextstate;   
            if (state=s1) then
                count_s <= count_s - '1';
            elsif (state=s0) then
                count_s <=  CONV_STD_LOGIC_VECTOR(WIDTH_DIVIS-1, 4);     -- extra step CAN REDUCE BY 1 since DONE is latched!!
            end if;
        end if;   
end process;  

process(state,start,aluout_s,count_s)
    begin  
        case state is
          when s0 => 
                pos_s <= '0';
                neg_s <= '0';                                           
                if  start='1' then 
                    nextstate <= s1; 
                else 
                    nextstate <= s0;
                end if; 
          when s1 =>
                neg_s <= aluout_s(WIDTH_DIVIS);      
                pos_s <= not(aluout_s(WIDTH_DIVIS)); 
                if (count_s=null_s(3 downto 0)) then nextstate <= s2; -- Done 
                                                else nextstate <= s1; -- Next sub&shift
                end if;
          when s2=>
                pos_s <= '0';
                neg_s <= '0';                                           
                nextstate <= s0;  
          when others => 
                pos_s <= '0';
                neg_s <= '0';                                           
                nextstate <= s0;              
        end case;                   
end process;    

-- Correct remainder (SHR,1)
remain_s        <= accumulator_s(WIDTH_DIVID downto WIDTH_DIVID-WIDTH_DIVIS+1);

-- Overflow if remainder>divisor or divide by 0 or sign error. Change all to positive.
divis_rect_s    <= rectifys(divisor, twocomp);
overflow_s      <= '1' when ((remain_s>=divis_rect_s) or (zerod_s='1')) else '0';

-- bottom part of remainder is quotient
quot_s          <=  accumulator_s(WIDTH_DIVIS-1 downto 0);

-- Remainder Result
sremainder_s    <= ((not(remain_s)) + '1') when signremain_s='1' else remain_s;
remainder       <= sremainder_s;

-- Qotient Result
squotient_s     <= ((not(quot_s)) + '1')  when signquot_s='1'   else quot_s;    
quotient        <= squotient_s;

-- Detect zero vector
zeror_s         <= '1' when (twocomp='1' and sremainder_s=null_s(WIDTH_DIVIS-1 downto 0)) else '0';
zeroq_s         <= '1' when (twocomp='1' and squotient_s=null_s(WIDTH_DIVIS-1 downto 0)) else '0';
zerod_s         <= '1' when (divisor=null_s(WIDTH_DIVIS-1 downto 0)) else '0';

-- Detect Sign failure
signfailure_s   <= '1' when (signquot_s='1'   and squotient_s(WIDTH_DIVIS-1)='0'  and zeroq_s='0') or
                            (signremain_s='1' and sremainder_s(WIDTH_DIVIS-1)='0' and zeror_s='0') else '0';

done     <= '1' when state=s2 else '0';
overflow <= '1' when (overflow_s='1' or signfailure_s='1') else '0';

end architecture rtl_ser;
