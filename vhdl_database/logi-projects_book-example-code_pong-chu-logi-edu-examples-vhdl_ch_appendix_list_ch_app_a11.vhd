--*********************************************
-- Listing A.11
--*********************************************
-- code for the FSM in Figure A.1
library ieee;
use ieee.std_logic_1164.all;
entity fsm_eg is
   port(
      clk, reset: in std_logic;
      a, b: in std_logic;
      y0, y1: out std_logic
   );
end fsm_eg;

architecture two_seg_arch of fsm_eg is
   type eg_state_type is (s0, s1, s2);
   signal state_reg, state_next: eg_state_type;
begin
   -- state register
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= s0;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state/output logic
   process(state_reg,a,b)
   begin
      state_next <= state_reg;  -- default back to same state
      y0 <= '0';   -- default 0
      y1 <= '0';   -- default 0
      case state_reg is
         when s0 =>
            y1 <= '1';
            if a='1' then
               if b='1' then
                  state_next <= s2;
                  y0 <= '1';
               else
                  state_next <= s1;
               end if;
            -- no else branch, use default
            end if;
         when s1 =>
            y1 <= '1';
            if (a='1') then
               state_next <= s0;
            -- no else branch, use default
            end if;
         when s2 =>
            state_next <= s0;
      end case;
   end process;
end two_seg_arch;