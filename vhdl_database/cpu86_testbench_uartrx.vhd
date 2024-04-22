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
-------------------------------------------------------------------------------
-- Design unit  : Simple UART (receiver)                                     --
-------------------------------------------------------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY uartrx IS
   PORT( 
      clk    : IN     std_logic;
      enable : IN     std_logic;                      -- 16 x bit_rate receive clock enable
      resetn : IN     std_logic;
      dbus   : OUT    std_logic_vector (7 DOWNTO 0);
      rdn    : IN     std_logic;
      rdrf   : OUT    std_logic;
      ferror : OUT    std_logic;
      rx     : IN     std_logic
   );

END uartrx ;

architecture rtl of uartrx is

    type   states is (s0,s1,s2,s3);
    signal state,nextstate : states;

    signal rxreg_s      : std_logic_vector(7 downto 0); -- Receive Holding Register 
    signal rxshift_s    : std_logic_vector(8 downto 0); -- Receive Shift Register (9 bits!) 

    signal sample_s     : std_logic;                    -- Sample rx input
    
    signal rsrl_s       : std_logic;                    -- Receive Shift Register Latch (rxpulse_s)

    signal synccnt_s    : std_logic_vector(3 downto 0); -- 0..15
    signal bitcount_s   : std_logic_vector(3 downto 0); -- 0..9
  
    type state_type is (st0,st1,st2,st3);               -- RDRF flag FSM
    signal current_state,next_state : state_type ;

begin

-------------------------------------------------------------------------------
-- Receive Data Register
-------------------------------------------------------------------------------
process (clk,resetn)  
    begin
        if (resetn='0') then                     
            rxreg_s <= (others => '1');                     
        elsif (rising_edge(clk)) then
            if (enable='1' and rsrl_s='1') then            
                rxreg_s <= rxshift_s(8 downto 1);       -- connect to outside world     
            end if;
        end if;   
end process;
dbus <= rxreg_s;                                        -- Connect to outside world


---------------------------------------------------------------------------- 
-- FSM1, sample input data 
---------------------------------------------------------------------------- 
process (clk,resetn)       
    begin
       if (resetn = '0') then                           -- Reset State
           state <= s0;              
       elsif rising_edge(clk) then          
          if enable='1' then 
             state <= nextstate;                        -- Set Current state
          end if;
       end if;   
end process;  
   
process(state,rx,sample_s,bitcount_s)
    begin  
        case state is
          when s0 => 
               if  rx='1' then nextstate <= s1; 
                          else nextstate <= s0;         -- Wait
               end if; 
          when s1 => 
               if  rx='0' then nextstate <= s2;         -- falling edge 
                          else nextstate <= s1;         -- or s0??? Wait
               end if;             
          when s2 =>                                    -- Falling edge detected, valid start bit? RXCLK=0,1
               if  (rx='0' and sample_s='1') then nextstate <= s3; -- so good so far 
               elsif (rx='1') then nextstate <= s1;     -- oops 1 detected, must be noise
                              else nextstate <= s2;     -- wait for sample pulse
               end if;     
          when s3 =>                                    -- Start bit detected                         
               if (sample_s='1' and bitcount_s="1000")  -- Changed !!! from 1001 
                           then nextstate <= s0;   
                           else nextstate <= s3;        -- wait 
               end if;         
          when others => nextstate <= s0;              
        end case;                   
end process;    

-------------------------------------------------------------------------------
-- Sample clock  
-------------------------------------------------------------------------------
process(clk,resetn)
    begin
        if (resetn='0') then
            synccnt_s  <= "1000";                       -- sample clock
        elsif (rising_edge(clk)) then
            if enable='1' then 
                if  (state=s0 or state=s1) then 
                    synccnt_s <= "1000";      
                else 
                    synccnt_s <= synccnt_s+'1';
                end if;
            end if;
        end if;
end process;

sample_s <= '1' when synccnt_s="0000" else '0';

-------------------------------------------------------------------------------
-- Bit counter  
-------------------------------------------------------------------------------
process(clk,resetn)
    begin
        if (resetn='0') then
           bitcount_s <= (others => '0');         
        elsif rising_edge(clk) then   
            if enable='1' then 
                if  (state=s0 or state=s1) then 
                    bitcount_s <= (others => '1');
                elsif (sample_s='1') then 
                    bitcount_s <= bitcount_s + '1';   
                end if;
            end if;
        end if;       
 end process;

---------------------------------------------------------------------------- 
-- Receive Shift Register  
---------------------------------------------------------------------------- 
process(clk,resetn)
    begin
        if (resetn='0') then
            rxshift_s <= (others => '1');
        elsif rising_edge(clk) then
            if enable='1' then 
                  if (sample_s='1') then 
                      rxshift_s <= rx & rxshift_s(8 downto 1);
                  end if;  
            end if;     
        end if;
 end process;

---------------------------------------------------------------------------- 
-- RSRL strobe 
---------------------------------------------------------------------------- 
rsrl_s  <= '1' when (sample_s='1' and bitcount_s="1000" and rx='1') else '0';

---------------------------------------------------------------------------- 
-- Framing Error, low stop bit detected 
---------------------------------------------------------------------------- 
ferror <= '1' when (sample_s='1' and bitcount_s="1000" and rx='0') else '0';
 
---------------------------------------------------------------------------- 
-- FSM2, if rsrl='1' then assert rdrf until rd strobe 
---------------------------------------------------------------------------- 
process(clk,resetn)
    begin
        if (resetn = '0') then
            current_state <= st0;
        elsif (clk'event and clk = '1') then
            current_state <= next_state;
        end if;
end process;

process (current_state,rdn,rsrl_s,enable)
    begin
        case current_state is
            when st0 =>
                rdrf <= '0';
                if (enable='1' and rsrl_s='1') then next_state <= st1;
                                else next_state <= st0; 
                end if;
            when st1 =>
                rdrf<='1';
                if (rdn='0') then next_state <= st2;
                             else next_state <= st1; 
                end if;
            when st2 =>
                rdrf <= '1';
                if (rdn='1') then next_state <= st0;
                             else next_state <= st2; 
                end if;
            when others =>
                rdrf <= '0';
                next_state <= st0;
        end case;
end process;

end rtl;
