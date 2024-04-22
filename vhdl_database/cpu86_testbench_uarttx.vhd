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
-- Design unit  : Simple UART (transmitter)                                     --
-------------------------------------------------------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY uarttx IS
   PORT( 
      clk    : IN     std_logic;
      enable : IN     std_logic;                      -- 1 x bit_rate Transmit clock enable
      resetn : IN     std_logic;
      dbus   : IN     std_logic_vector (7 DOWNTO 0);  -- input to txshift register
      tdre   : OUT    std_logic;
      wrn    : IN     std_logic;
      tx     : OUT    std_logic
   );

-- Declarations

END uarttx ;

architecture rtl of uarttx is

    signal txshift_s    : std_logic_vector(9 downto 0);     -- Transmit Shift Register 
    signal txreg_s      : std_logic_vector(7 downto 0);     -- Transmit Holding Register

    signal bitcount_s   : std_logic_vector(3 downto 0);     -- 9 to 0 bit counter
    signal tsrl_s       : std_logic;                        -- latch Data (txclk strobe)
    signal tdre_s       : std_logic;                        -- Transmit Data Register Empty
    signal shift_s      : std_logic;                        -- Shift transmit register signal

    TYPE STATE_TYPE IS (Sstart,Slatch,Swait,Sshift);

    -- Declare current and next state signals
    SIGNAL current_state : STATE_TYPE ;
    SIGNAL next_state : STATE_TYPE ;


    -- architecture declarations
    type state_type2 is (s0,s1,s2);

    -- declare current and next state signals
    signal current_state2: state_type2 ;
    signal next_state2   : state_type2 ;

begin 
         
-------------------------------------------------------------------------------
-- Transmit Hold Register
-------------------------------------------------------------------------------
    process (clk,resetn)  
        begin
          if (resetn='0') then                     
             txreg_s <= (others => '1');                                              
          elsif (rising_edge(clk)) then             
            if wrn='0' then 
                txreg_s <= dbus;                            
            end if;         
          end if;   
    end process;  

-------------------------------------------------------------------------------
-- Shift out every enable pulse.
-------------------------------------------------------------------------------
    process (resetn,clk)                     
        begin        
         if resetn='0' then
           txshift_s    <= (others => '1');                 -- init to all '1' (including start bit)                      
         elsif (rising_edge(clk)) then
            if tsrl_s='1' then 
                txshift_s   <= '1'&txreg_s&'0';         -- latch data
            elsif shift_s='1' then
                txshift_s   <= '1' & txshift_s(9 downto 1);-- shift right
            end if;
         end if;
    end process; 

    tx <= txshift_s(0);                            -- transmit pin
   
-------------------------------------------------------------------------------
-- FSM1, control shift & tsrl_s signals
-------------------------------------------------------------------------------
    process(clk,resetn)
       begin
          if (resetn = '0') then
             current_state <= sstart;
             bitcount_s <= "0000";
          elsif (clk'event and clk = '1') then
             current_state <= next_state;
             case current_state is
                 when slatch =>
                    bitcount_s<="0000";
                 when sshift =>
                    bitcount_s<=bitcount_s+'1';
                 when others =>
                    null;
             end case;
          end if;
    end process;

   process (bitcount_s,current_state,tdre_s,enable)
   begin
      shift_s <= '0';
      tsrl_s <= '0';
      case current_state is
          when sstart =>
             if (tdre_s='0' and enable='1') then
                next_state <= slatch;
             else
                next_state <= sstart;
             end if;
          when slatch =>
             tsrl_s<='1';
             next_state <= swait;
          when swait =>
             if (enable='1') then
                next_state <= sshift;
             elsif (bitcount_s="1001") then
                next_state <= sstart;
             else
                next_state <= swait;
             end if;
          when sshift =>
             shift_s<='1';
             next_state <= swait;
          when others =>
             next_state <= sstart;
      end case;
   end process;


-------------------------------------------------------------------------------
-- FSM2, wait rising_edge(wrn) then assert tdre_s=0 until trsl=1
-------------------------------------------------------------------------------
    process(clk,resetn)
       begin
          if (resetn = '0') then
             current_state2 <= s0;
          elsif (rising_edge(clk)) then
             current_state2 <= next_state2;
          end if;
    end process; 

    process (current_state2,tsrl_s,wrn)
        begin
            case current_state2 is
                when s0 =>
                    tdre_s <='1';
                    if (wrn='0') then next_state2 <= s1;
                                 else next_state2 <= s0; 
                    end if;
                when s1 =>
                    tdre_s <='1';
                    if (wrn='1') then next_state2 <= s2;
                                 else next_state2 <= s1; 
                    end if;
                when s2 =>
                    tdre_s <='0';
                    if (tsrl_s='1') then next_state2 <= s0;
                                    else next_state2 <= s2; 
                    end if;
                when others =>
                    tdre_s <= '1';
                    next_state2 <= s0;
            end case;
   end process;

   tdre <= tdre_s;

end rtl;
