--*********************************************
-- Listing A.1
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity declaration
entity bin_counter is
   -- optional generic declaration
   generic(N: integer := 8);
   -- port declaration
   port(
      clk, reset: in std_logic;             -- clock & reset
      load, en, syn_clr: in std_logic;      -- input control
      d: in std_logic_vector(N-1 downto 0); -- input data
      max_tick: out std_logic;              -- output status
      q: out std_logic_vector(N-1 downto 0) -- output data
   );
end bin_counter;

-- architecture body
architecture demo_arch of bin_counter is
   -- constant declaration
   constant MAX: integer := (2**N-1);
   -- internal signal declaration
   signal r_reg: unsigned(N-1 downto 0);
   signal r_next: unsigned(N-1 downto 0);
begin
   --===========================================
   -- component instantiation
   --===========================================
   -- no instantiation in this code

   --===========================================
   -- memory elements
   --===========================================
   -- register
   process(clk,reset)
   begin
      if (reset='1') then
         r_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         r_reg <= r_next;
      end if;
   end process;

   --===========================================
   -- combinational circuits
   --===========================================
   -- next-state logic
   r_next <= (others=>'0') when syn_clr='1' else
             unsigned(d)   when load='1' else
             r_reg + 1     when en ='1'  else
             r_reg;
   -- output logic
   q <= std_logic_vector(r_reg);
   max_tick <= '1' when r_reg=MAX else '0';
end demo_arch;