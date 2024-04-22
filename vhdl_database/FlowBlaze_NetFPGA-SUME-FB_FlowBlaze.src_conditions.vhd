----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2018 17:26:34
-- Design Name: 
-- Module Name: conditions - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conditions is
 Port (
    CR1: in std_logic_vector(31 downto 0);
    CR2: in std_logic_vector(31 downto 0);
    CR3: in std_logic_vector(31 downto 0);
    CR4: in std_logic_vector(31 downto 0);
    GR0: in std_logic_vector(31 downto 0);
    GR1: in std_logic_vector(31 downto 0);
    GR2: in std_logic_vector(31 downto 0);
    GR3: in std_logic_vector(31 downto 0);
    R1: in std_logic_vector(31 downto 0); 
    R2: in std_logic_vector(31 downto 0);
    R3: in std_logic_vector(31 downto 0);
    O1: in std_logic_vector(31 downto 0);
    O2: in std_logic_vector(31 downto 0);
    O3: in std_logic_vector(31 downto 0);
    timer: in std_logic_vector(31 downto 0);

    conditions: out std_logic_vector(15 downto 0) 
  );
end conditions;

architecture Behavioral of conditions is

begin
   process(CR1,CR2,CR3,CR4,GR0,GR1,GR2,GR3,R1,R2,R3,O1,O2,O3)
  variable op1,op2, op3, op4, op5, op6, op7, op8:std_logic_vector(31 downto 0):=(others=>'0');
 begin
conditions<=(others=>'0');

   
 if ( CR1(15 downto 8)=x"0A") then
       op1:=GR0;   
 elsif ( CR1(15 downto 8)=x"0B") then         
       op1:=GR1; 
 elsif ( CR1(15 downto 8)=x"0C") then         
       op1:=GR2; 
 elsif ( CR1(15 downto 8)=x"0D") then         
       op1:=GR3; 
 elsif ( CR1(15 downto 8)=x"0E") then         
        op1:=R1;
 elsif ( CR1(15 downto 8)=x"0F") then         
        op1:=R2; 
elsif ( CR1(15 downto 8)=x"1A") then         
        op1:=R3; 

elsif ( CR1(15 downto 8)=x"1C") then         
        op1:=O1;
elsif ( CR1(15 downto 8)=x"1D") then         
        op1:=O2; 
elsif ( CR1(15 downto 8)=x"1E") then         
         op1:=O3; 
elsif ( CR1(15 downto 8)=x"1F") then         
         op1:=timer;                           
else 
         op1:=(OTHERS=>'0');
end if;            
         
 if ( CR1(7 downto 0)=x"0A") then
    op2:=GR0;   
elsif ( CR1(7 downto 0)=x"0B") then         
    op2:=GR1; 
elsif ( CR1(7 downto 0)=x"0C") then         
    op2:=GR2; 
elsif ( CR1(7 downto 0)=x"0D") then         
    op2:=GR3; 
elsif ( CR1(7 downto 0)=x"0E") then         
     op2:=R1;
elsif ( CR1(7 downto 0)=x"0F") then         
     op2:=R2; 
elsif ( CR1(7 downto 0)=x"1A") then         
     op2:=R3; 

elsif ( CR1(7 downto 0)=x"1C") then         
     op2:=O1;
elsif ( CR1(7 downto 0)=x"1D") then         
     op2:=O2; 
elsif ( CR1(7 downto 0)=x"1E") then         
      op2:=O3;
elsif ( CR1(7 downto 0)=x"1F") then         
       op2:=timer;  

else 
      op2:=(OTHERS=>'0');
end if;

if ( CR1(23 downto 16)=x"0A" and op1>op2) then             
     conditions(0)<='1';
 
elsif ( CR1(23 downto 16)=x"0B" and op1>=op2) then             
     conditions(0)<='1';
          
elsif ( CR1(23 downto 16)=x"0C" and op2>op1) then           --not(op1>op2)  
     conditions(0)<='1';
 
elsif ( CR1(23 downto 16)=x"0D" and not(op1>=op2)) then             
     conditions(0)<='1';
                
elsif ( CR1(23 downto 16)=x"0E" and op1=op2) then             
     conditions(0)<='1';

elsif ( CR1(23 downto 16)=x"0F" and op1/=op2) then             
     conditions(0)<='1';
 else
conditions(0)<='0';
end if;             
 if ( CR2(15 downto 8)=x"0A") then
    op3:=GR0;   
 elsif ( CR2(15 downto 8)=x"0B") then         
    op3:=GR1; 
 elsif ( CR2(15 downto 8)=x"0C") then         
    op3:=GR2; 
 elsif ( CR2(15 downto 8)=x"0D") then         
    op3:=GR3; 
 elsif ( CR2(15 downto 8)=x"0E") then         
    op3:=R1;
 elsif ( CR2(15 downto 8)=x"0F") then           
    op3:=R2; 
elsif ( CR2(15 downto 8)=x"1A") then         
    op3:=R3; 

elsif ( CR2(15 downto 8)=x"1C") then         
    op3:=O1;
elsif ( CR2(15 downto 8)=x"1D") then         
    op3:=O2; 
elsif ( CR2(15 downto 8)=x"1E") then         
    op3:=O3;
elsif ( CR2(15 downto 8)=x"1F") then         
        op3:=timer;  

else 
    op3:=(OTHERS=>'0');
end if;            
         
 if ( CR2(7 downto 0)=x"0A") then
    op4:=GR0;   
elsif ( CR2(7 downto 0)=x"0B") then         
    op4:=GR1; 
elsif ( CR2(7 downto 0)=x"0C") then         
    op4:=GR2; 
elsif ( CR2(7 downto 0)=x"0D") then         
    op4:=GR3; 
elsif ( CR2(7 downto 0)=x"0E") then         
    op4:=R1;
elsif ( CR2(7 downto 0)=x"0F") then         
    op4:=R2; 
elsif ( CR2(7 downto 0)=x"1A") then         
    op4:=R3; 

elsif ( CR2(7 downto 0)=x"1C") then         
    op4:=O1;
elsif ( CR2(7 downto 0)=x"1D") then         
     op4:=O2; 
elsif ( CR2(7 downto 0)=x"1E") then         
     op4:=O3;
elsif ( CR2(7 downto 0)=x"1F") then         
     op4:=timer;   

else 
     op4:=(OTHERS=>'0');
end if;

if ( CR2(23 downto 16)=x"0A" and op3>op4) then             
     conditions(1)<='1';
 
elsif ( CR2(23 downto 16)=x"0B" and op3>=op4) then             
     conditions(1)<='1';
        
elsif ( CR2(23 downto 16)=x"0C" and op4>op3) then             
     conditions(1)<='1';
 
elsif ( CR2(23 downto 16)=x"0D" and not(op3>=op4)) then             
     conditions(1)<='1';
               
elsif ( CR2(23 downto 16)=x"0E" and op3=op4) then             
     conditions(1)<='1';
 
elsif ( CR2(23 downto 16)=x"0F" and op3/=op4) then             
     conditions(1)<='1';
 else
     conditions(1)<='0';
end if;             
 if ( CR3(15 downto 8)=x"0A") then
    op5:=GR0;   
 elsif ( CR3(15 downto 8)=x"0B") then         
    op5:=GR1; 
 elsif ( CR3(15 downto 8)=x"0C") then         
    op5:=GR2; 
 elsif ( CR3(15 downto 8)=x"0D") then         
    op5:=GR3; 
 elsif ( CR3(15 downto 8)=x"0E") then         
    op5:=R1;
 elsif ( CR3(15 downto 8)=x"0F") then         
    op5:=R2; 
elsif ( CR3(15 downto 8)=x"1A") then         
    op5:=R3; 

elsif ( CR3(15 downto 8)=x"1C") then         
    op5:=O1;
elsif ( CR3(15 downto 8)=x"1D") then         
    op5:=O2; 
elsif ( CR3(15 downto 8)=x"1E") then         
    op5:=O3; 
elsif ( CR3(15 downto 8)=x"1F") then         
    op5:=timer;

else 
    op5:=(OTHERS=>'0');
end if;            
         
 if ( CR3(7 downto 0)=x"0A") then
    op6:=GR0;   
elsif ( CR3(7 downto 0)=x"0B") then         
    op6:=GR1; 
elsif ( CR3(7 downto 0)=x"0C") then         
    op6:=GR2; 
elsif ( CR3(7 downto 0)=x"0D") then         
    op6:=GR3; 
elsif ( CR3(7 downto 0)=x"0E") then         
    op6:=R1;
elsif ( CR3(7 downto 0)=x"0F") then         
    op6:=R2; 
elsif ( CR3(7 downto 0)=x"1A") then         
    op6:=R3; 

elsif ( CR3(7 downto 0)=x"1C") then         
    op6:=O1;
elsif ( CR3(7 downto 0)=x"1D") then         
    op6:=O2; 
elsif ( CR3(7 downto 0)=x"1E") then         
    op6:=O3;
elsif ( CR3(7 downto 0)=x"1F") then         
    op6:=timer;  

else 
     op6:=(OTHERS=>'0');
end if;

if ( CR3(23 downto 16)=x"0A" and op5>op6) then             
     conditions(2)<='1';
 
elsif ( CR3(23 downto 16)=x"0B" and op5>=op6) then             
     conditions(2)<='1';
          
elsif ( CR3(23 downto 16)=x"0C" and op6>op5) then             
     conditions(2)<='1';
 
elsif ( CR3(23 downto 16)=x"0D" and not(op5>=op6)) then             
     conditions(2)<='1';
              
elsif ( CR3(23 downto 16)=x"0E" and op5=op6) then             
     conditions(2)<='1';

elsif ( CR3(23 downto 16)=x"0F" and op5/=op6) then             
     conditions(2)<='1';
 else
     conditions(2)<='0';
end if;             
if ( CR4(15 downto 8)=x"0A") then
    op7:=GR0;   
elsif ( CR4(15 downto 8)=x"0B") then         
    op7:=GR1; 
elsif ( CR4(15 downto 8)=x"0C") then         
    op7:=GR2; 
elsif ( CR4(15 downto 8)=x"0D") then         
    op7:=GR3; 
elsif ( CR4(15 downto 8)=x"0E") then         
    op7:=R1;
elsif ( CR4(15 downto 8)=x"0F") then         
    op7:=R2; 
elsif ( CR4(15 downto 8)=x"1A") then         
    op7:=R3; 

elsif ( CR4(15 downto 8)=x"1C") then         
    op7:=O1;
elsif ( CR4(15 downto 8)=x"1D") then         
    op7:=O2; 
elsif ( CR4(15 downto 8)=x"1E") then         
    op7:=O3; 
elsif ( CR4(15 downto 8)=x"1F") then         
     op7:=timer; 

else 
    op7:=(OTHERS=>'0');
end if;            
         
 if ( CR4(7 downto 0)=x"0A") then
    op8:=GR0;   
elsif ( CR4(7 downto 0)=x"0B") then         
    op8:=GR1; 
elsif ( CR4(7 downto 0)=x"0C") then         
    op8:=GR2; 
elsif ( CR4(7 downto 0)=x"0D") then         
    op8:=GR3; 
elsif ( CR4(7 downto 0)=x"0E") then         
    op8:=R1;
elsif ( CR4(7 downto 0)=x"0F") then         
    op8:=R2; 
elsif ( CR4(7 downto 0)=x"1A") then         
    op8:=R3; 

elsif ( CR4(7 downto 0)=x"1C") then         
    op8:=O1;
elsif ( CR4(7 downto 0)=x"1D") then         
    op8:=O2; 
elsif ( CR4(7 downto 0)=x"1E") then         
    op8:=O3;
elsif ( CR4(7 downto 0)=x"1F") then         
    op8:=timer; 

else 
    op8:=(OTHERS=>'0');
end if;

if ( CR4(23 downto 16)=x"0A" and op7>op8) then             
     conditions(3)<='1';
 
elsif ( CR4(23 downto 16)=x"0B" and op7>=op8) then             
     conditions(3)<='1';
          
elsif ( CR4(23 downto 16)=x"0C" and op8>op7) then             
     conditions(3)<='1';
 
elsif ( CR4(23 downto 16)=x"0D" and not(op7>=op8)) then             
     conditions(3)<='1';
               
elsif ( CR4(23 downto 16)=x"0E" and op7=op8) then             
     conditions(3)<='1';
 
elsif ( CR4(23 downto 16)=x"0F" and op7/=op8) then             
     conditions(3)<='1';
 else
     conditions(3)<='0';
end if;             
end process;

end Behavioral;
