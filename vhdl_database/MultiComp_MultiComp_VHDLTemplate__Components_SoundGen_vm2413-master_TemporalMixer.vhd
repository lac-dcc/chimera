-- 
-- TemporalMixer.vhd 
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.VM2413.ALL;

entity TemporalMixer is
  port (
    clk    : in std_logic;
    reset  : in std_logic;
    clkena : in std_logic;
    
    slot   : in SLOT_TYPE;
    stage  : in STAGE_TYPE;

    rhythm : in std_logic;
    
    maddr : out SLOT_TYPE;
    mdata : in SIGNED_LI_TYPE;
    
    mo : out std_logic_vector(9 downto 0);
    ro : out std_logic_vector(9 downto 0)
  );	    
end TemporalMixer;

architecture RTL of TemporalMixer is 

  signal mmute, rmute : std_logic;
  
begin

  process (clk, reset) 
  begin
   
    if reset = '1' then
    
      mo <= (others =>'0');
      ro <= (others =>'0');
      maddr <= 0;
      mmute <= '1';
      rmute <= '1';
    
    elsif clk'event and clk = '1' then if clkena='1' then
    
      if stage = 0 then
      
        mo <= "1000000000";
        ro <= "1000000000";
        
        if rhythm = '0' then 
    
          case slot is 
            when 0 =>  maddr <= 1; mmute <='0'; -- CH0
            when 1 =>  maddr <= 3; mmute <='0'; -- CH1
            when 2 =>  maddr <= 5; mmute <='0'; -- CH2
            when 3 =>  mmute <= '1';
            when 4 =>  mmute <= '1';
            when 5 =>  mmute <= '1'; 
            when 6 =>  maddr <= 7; mmute<='0'; -- CH3
            when 7 =>  maddr <= 9; mmute<='0'; -- CH4
            when 8 =>  maddr <= 11; mmute<='0'; -- CH5
            when 9 =>  mmute <= '1'; 
            when 10 => mmute <= '1';
            when 11 => mmute <= '1';
            when 12 => maddr <= 13; mmute<='0'; -- CH6
            when 13 => maddr <= 15; mmute<='0'; -- CH7 
            when 14 => maddr <= 17; mmute<='0'; -- CH8
            when 15 => mmute <= '1';
            when 16 => mmute <= '1';
            when 17 => mmute <= '1';
          end case;
          rmute <= '1';
          
        else
        
          case slot is 
            when  0 => maddr <= 1; mmute <='0';             rmute <='1'; -- CH0
            when  1 => maddr <= 3; mmute <='0';             rmute <='1'; -- CH1
            when  2 => maddr <= 5; mmute <='0';             rmute <='1'; -- CH2
            when  3 =>             mmute <='1'; maddr <= 15; rmute <='0'; -- SD
            when  4 =>             mmute <='1'; maddr <= 17; rmute <='0'; -- CYM
            when  5 =>             mmute <='1';             rmute <='1'; 
            when  6 => maddr <= 7; mmute <='0';             rmute <='1'; -- CH3
            when  7 => maddr <= 9; mmute <='0';             rmute <='1'; -- CH4
            when  8 => maddr <= 11;mmute <='0';             rmute <='1'; -- CH5
            when  9 =>             mmute <='1'; maddr <= 14; rmute <='0'; -- HH
            when 10 =>             mmute <='1'; maddr <= 16; rmute <='0'; -- TOM
            when 11 =>             mmute <='1'; maddr <= 13; rmute <='0'; -- BD
            when 12 =>             mmute <='1'; maddr <= 15; rmute <='0'; -- SD
            when 13 =>             mmute <='1'; maddr <= 17; rmute <='0'; -- CYM
            when 14 =>             mmute <='1'; maddr <= 14; rmute <='0'; -- HH
            when 15 =>             mmute <='1'; maddr <= 16; rmute <='0'; -- TOM
            when 16 =>             mmute <='1'; maddr <= 13; rmute <='0'; -- BD
            when 17 =>             mmute <='1';              rmute <='1';
          end case;
          
        end if;
        
      else
          
        if mmute = '0' then    
          if mdata.sign = '0' then
            mo <= "1000000000" + mdata.value;
          else
            mo <= "1000000000" - mdata.value;
          end if;
        else
          mo <= "1000000000";
        end if;
        
        if rmute = '0' then
          if mdata.sign = '0' then
            ro <= "1000000000" + mdata.value;
          else
            ro <= "1000000000" - mdata.value;
          end if;
        else
          ro <= "1000000000";
        end if;

      end if;        
      
    end if; end if;
  
  end process;

end RTL;