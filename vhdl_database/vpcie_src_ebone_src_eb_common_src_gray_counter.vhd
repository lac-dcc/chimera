----------------------------------------------------------------
--
-- Gray counter
-- 
----------------------------------------------------------------
-- Version who date     comment
-- 0.1     ch  13/10/97 preliminary
-- 1.0     ch  07/01/11 1st release, made generic
----------------------------------------------------------------
-- Gray cell
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity gcell is
port (
   srst    : in  std_logic;
   clk     : in  std_logic; -- system clock
   en      : in  std_logic; -- enable
   par     : in  std_logic; -- parity
   qrst    : in  std_logic; -- resetting value
   q_i     : in  std_logic; -- q(n-1)
   z_i     : in  std_logic; -- q(n-2) donto q(0) all zero
   z_o     : out std_logic; -- q(n-1) donto q(0) all zero
   q_o     : out std_logic  -- q(n)
);
end ;

architecture rtl of gcell is

signal data  : std_logic ; -- T flip-flop input
signal qtff  : std_logic ; -- T flip-flop output

begin

data <= q_i AND z_i AND par; -- counting up (down: don't invert parity)

process(clk)
begin
   if rising_edge(clk) then
      if srst='1' then
         qtff <= qrst;
      elsif en = '1' then
         qtff <= qtff xor data; -- T like flip-flop
      end if;
   end if;
end process;

z_o  <= z_i AND NOT q_i; -- LSbits all zero flag
q_o  <= qtff;

end rtl; -- gcell

----------------------------------------------------------------
-- Gray counter
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity gray_counter is
generic(
   GWIDTH  : natural -- counter width
);

port ( 
   srst	: in  std_logic; -- synchronous reset
   clk	: in  std_logic; -- clock
   en 	: in  std_logic; -- enable
   qrst	: in  std_logic_vector(GWIDTH-1 downto 0); -- reset loading value
   cnt	: out std_logic_vector(GWIDTH-1 downto 0)  -- gray count
);
end entity gray_counter;

architecture rtl of gray_counter is

-- Gray cell
component gcell is
port (
   srst    : in  std_logic; -- synchronous reset
   clk     : in  std_logic; -- clock
   en      : in  std_logic; -- enable
   par     : in  std_logic; -- parity
   qrst    : in  std_logic; -- resetting value
   q_i     : in  std_logic; -- q(n-1)
   z_i     : in  std_logic; -- q(n-2) donto q(0) all zero
   z_o     : out std_logic; -- q(n-1) donto q(0) all zero
   q_o     : out std_logic  -- q(n)
);
end component;

signal par  : std_logic; -- global parity for counter
signal parn : std_logic; -- global parity for counter, inverted
signal z    : std_logic_vector(GWIDTH-2 downto 0); -- Zero status
signal q    : std_logic_vector(GWIDTH-1 downto 0); -- Toggle ff output
signal clr_or_set  : std_logic ; -- parity reset state
 
begin

assert GWIDTH > 3 
       report "GWIDTH must be greater than 3!" severity failure;

-- Generate counter reset state parity
--------------------------------------
process(qrst)
variable tmp: std_logic;
begin
   tmp := '0';
   for i in 0 to GWIDTH-1 loop
      tmp := tmp XOR qrst(i);
   end loop;
   clr_or_set <= tmp;
end process;

process(clk)
begin
   if rising_edge(clk) then
      if srst = '1' then
         par <= clr_or_set;  
      elsif en = '1' then
         par <= NOT par; 
      end if;
   end if;
end process;
parn <= NOT par;

-- gray counter logic
-- Reset value may be zero or 100...000
-- gray 100...000 is binary 111...111
---------------------------------------

g0: gcell port map(srst, clk, en, parn, qrst(0),  '1', '1', z(0), q(0));
g1: gcell port map(srst, clk, en,  par, qrst(1), q(0), '1', z(1), q(1));

gn: 
for i in 2 to GWIDTH-2 generate
   gc: gcell port map(srst, clk, en, par, qrst(i), q(i-1), z(i-1), z(i), q(i));
end generate gn;

gl: gcell port map(srst, clk, en, par,  qrst(GWIDTH-1), '1', z(GWIDTH-2), OPEN, q(GWIDTH-1));

cnt <= q;

end architecture rtl;
