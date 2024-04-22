--------------------------------------------------
--
-- Asynchronous FIFO 
--
--------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.2  17/01/11   herve   Preliminary
--     1.0  07/11/11   herve   Improved reset
--
-- http://www.esrf.fr
-----------------------------------------------------------------------
--
-- Binary to Gray parallel converter
--
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2gray is
generic(
   GWIDTH  : natural -- counter width
);
port (
   clk  : in  std_logic; 
   ubin : in  unsigned(GWIDTH-1 downto 0);
   gray : out std_logic_vector(GWIDTH-1 downto 0)
);
end entity bin2gray;

architecture rtl of bin2gray is

signal bin  : std_logic_vector(GWIDTH-1 downto 0);
signal grai : std_logic_vector(GWIDTH-1 downto 0);

begin

bin <= std_logic_vector(ubin); -- type cast

grai(GWIDTH-1) <= bin(GWIDTH-1); -- MSbit unchanged
xn: 
for i in GWIDTH-2 downto 0 generate
   grai(i) <= bin(i+1) XOR bin(i);
end generate;

process(clk)
begin
   if rising_edge(clk) then
      gray <= grai;
   end if;
end process;

end rtl;

-----------------------------------------------------------------------
--
-- Gray to binary parallel converter
--
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray2bin is
generic(
   GWIDTH  : natural -- counter width
);
port ( 
   clk  : in  std_logic; 
   gray : in  std_logic_vector(GWIDTH-1 downto 0);
   ubin : out unsigned(GWIDTH-1 downto 0)
);
end entity gray2bin;

architecture rtl of gray2bin is

signal bin  : std_logic_vector(GWIDTH-1 downto 0);
signal xoro : std_logic_vector(GWIDTH-2 downto 0); -- XOR outputs

begin

assert GWIDTH > 3 
       report "GWIDTH must be greater than 3!" severity failure;

xoro(GWIDTH-2) <= gray(GWIDTH-1) XOR gray(GWIDTH-2);

xn: 
for i in GWIDTH-3 downto 0 generate
   xoro(i) <= xoro(i+1) XOR gray(i);
end generate;

bin(GWIDTH-1) <= gray(GWIDTH-1); -- MSbit unchanged
bin(GWIDTH-2 downto 0) <= xoro;

process(clk)
begin
   if rising_edge(clk) then
      ubin <= unsigned(bin); -- type cast
   end if;
end process;

end rtl;

--------------------------------------------------
--
-- Asynchronous FIFO main
--
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.Nlog2;

entity fifo_a is
generic(
   DWIDTH : natural;  -- data width
   ADEPTH : natural;  -- FIFO depth
   RAMTYP : string := "auto"  -- "auto", "block", "distributed"
);
port (
   arst     : in std_logic;  -- asyn reset
   wr_clk   : in std_logic;  -- write clock
   wr_en    : in std_logic;  -- write enable
   wr_dat   : in std_logic_vector(DWIDTH-1 downto 0);
   wr_cnt   : out std_logic_vector(Nlog2(ADEPTH)-1 downto 0);
   wr_afull : out std_logic; -- almost full flag
   wr_full  : out std_logic; -- full flag

   rd_clk   : in std_logic;  -- read clock
   rd_en    : in std_logic;  -- read enable
   rd_dat   : out std_logic_vector(DWIDTH-1 downto 0);
   rd_cnt   : out std_logic_vector(Nlog2(ADEPTH)-1 downto 0);
   rd_aempty: out std_logic; -- almost empty flag
   rd_empty : out std_logic  -- empty flag
);
end fifo_a;

architecture rtl of fifo_a is
--------------------------------
component bin2gray is
generic(
   GWIDTH  : natural -- counter width
);
port ( 
   clk  : in  std_logic; 
   ubin : in  unsigned(GWIDTH-1 downto 0);
   gray : out std_logic_vector(GWIDTH-1 downto 0)
);
end component;

component gray2bin is
generic(
   GWIDTH  : natural -- counter width
);
port ( 
   clk  : in  std_logic; 
   gray : in  std_logic_vector(GWIDTH-1 downto 0);
   ubin : out unsigned(GWIDTH-1 downto 0)
);
end component;

-- Pointers are one more bit wide than dumb memory addressing
-- for full/empty discrimination
constant AWIDTH : natural := Nlog2(ADEPTH); 
constant AZERO  : std_logic_vector(AWIDTH downto 0) := (others => '0');
signal   AMINUS : std_logic_vector(AWIDTH downto 0); -- minus one in gray

type ram_typ is array (ADEPTH-1 downto 0) of std_logic_vector (DWIDTH-1 downto 0);
signal dpram : ram_typ; -- dual port RAM

attribute ram_style: string; -- XST dependent
attribute ram_style of dpram: signal is RAMTYP;

signal wr_dat1   : std_logic_vector(DWIDTH-1 downto 0);

signal rd_ptr    : unsigned(AWIDTH-1 downto 0); -- memory read pointer, binary
signal wr_ptr    : unsigned(AWIDTH-1 downto 0); -- memory write pointer, binary

signal rd_gptr_a     : std_logic_vector(AWIDTH downto 0); -- gray read pointer asyn.
signal wr_gptr_a     : std_logic_vector(AWIDTH downto 0); -- gray write pointer asyn.
signal wr_rd_gptr_s1 : std_logic_vector(AWIDTH downto 0); -- gray read pointer syn. 1st sample
signal wr_rd_gptr_s2 : std_logic_vector(AWIDTH downto 0); -- gray read pointer syn. 2nd sample
signal rd_wr_gptr_s1 : std_logic_vector(AWIDTH downto 0); -- gray write pointer syn. 1st sample
signal rd_wr_gptr_s2 : std_logic_vector(AWIDTH downto 0); -- gray write pointer syn. 2nd sample

signal rd_bptr_a     : unsigned(AWIDTH downto 0); -- binary read pointer
signal wr_bptr_a     : unsigned(AWIDTH downto 0); -- binary write pointer
signal rd_bptr_a1    : unsigned(AWIDTH-1 downto 0); -- binary read pointer
signal wr_bptr_a1    : unsigned(AWIDTH-1 downto 0); -- binary write pointer

signal wr_rd_bptr_s  : unsigned(AWIDTH downto 0); -- bin. rd pointer (synchronized write)
signal rd_wr_bptr_s  : unsigned(AWIDTH downto 0); -- bin. wr pointer (synchronized read)
signal wr_rd_bptr_s1 : unsigned(AWIDTH-1 downto 0); -- bin. rd pointer (synchronized write)
signal wr_rd_bptr_m1 : unsigned(AWIDTH downto 0); -- bin. rd pointer minus 1 (synchronized write)
signal rd_wr_bptr_s1 : unsigned(AWIDTH-1 downto 0); -- bin. wr pointer (synchronized read)
signal rd_wr_bptr_m1 : unsigned(AWIDTH downto 0); -- bin. wr pointer minus 1 (synchronized read)
signal rd_wr_bptr_m2 : unsigned(AWIDTH downto 0); -- bin. wr pointer minus 2 (synchronized read)

-- Controls
signal rd_en_s  : std_logic; -- read  valid (from synchronized write status)
signal wr_en_s  : std_logic; -- write valid (from synchronized read status)
signal wr_en_s1 : std_logic; -- write valid, resampled

signal rd_empti : std_logic; -- internal
signal wr_fulli : std_logic; -- internal

signal wrst1, wrst2, wrst : std_logic := '1'; -- write synchronous reset
signal rrst1, rrst2, rrst : std_logic := '1'; -- read synchronous reset

-----
begin
-----
assert ADEPTH = 2**AWIDTH 
       report "ADEPTH must be power of 2!" severity failure;

-- Input pipeline P&R help
process (wr_clk)
begin
   if rising_edge(wr_clk) then
      wr_dat1  <= wr_dat;
      wr_ptr   <= wr_bptr_a(AWIDTH-1 downto 0); -- strip off MSbit
      wr_en_s1 <= wr_en_s;
   end if;
end process;

----------------
-- dual port RAM
----------------
process (wr_clk)
begin
   if rising_edge(wr_clk) then
      if wr_en_s1 = '1' then
         dpram(to_integer(wr_ptr)) <= wr_dat1;
      end if;
   end if;
end process;

process (rd_clk)
begin
   if rising_edge(rd_clk) then
      rd_dat <= dpram(to_integer(rd_ptr));
   end if;
end process;

-------------------------------
-- Synchronous reset generators
-------------------------------
process(wr_clk, arst)
begin
   if arst = '1' then
      wrst1 <= '1';
   elsif rising_edge(wr_clk) then
      wrst1 <= arst;
   end if;
end process;

process(wr_clk)
begin
  if rising_edge(wr_clk) then
      wrst2 <= wrst1;
      wrst  <= wrst2 AND wrst1; -- glitch filter
   end if;
end process;

process(rd_clk, arst)
begin
   if arst = '1' then
      rrst1 <= '1';
   elsif rising_edge(rd_clk) then
      rrst1 <= arst;
   end if;
end process;

process(rd_clk)
begin
  if rising_edge(rd_clk) then
      rrst2 <= rrst1;
      rrst  <= rrst2 AND rrst1; -- glitch filter
   end if;
end process;

----------------
-- Write section
----------------
process(wr_clk, wrst)
begin
   if wrst = '1' then
      wr_bptr_a <= (others => '0');
   elsif rising_edge(wr_clk) then
      if wr_en_s = '1' then
         wr_bptr_a <= wr_bptr_a + 1;
      end if;
   end if;
end process;

--wr_ptr <= wr_bptr_a(AWIDTH-1 downto 0); -- strip off MSbit

wr_gray: bin2gray generic map (GWIDTH => AWIDTH+1)
                  port map (wr_clk, wr_bptr_a, wr_gptr_a);

-- sync read pointer
-- Read pointer starts one location behind the write pointer
-- Thus the same memory location is never simultaneously accessed in R/W.
AMINUS(AWIDTH)            <=  '1'; -- minus one in gray
AMINUS(AWIDTH-1 downto 0) <=  (others => '0'); 

process(wr_clk)
begin
   if rising_edge(wr_clk) then
      if wrst ='1' then
         wr_rd_gptr_s1 <= AMINUS;
         wr_rd_gptr_s2 <= AMINUS;
      else
         wr_rd_gptr_s1 <= rd_gptr_a;
         wr_rd_gptr_s2 <= wr_rd_gptr_s1; -- double sampling when crossing clock domains
      end if;
   end if;
end process;

wr_s_bin: gray2bin generic map (GWIDTH => AWIDTH+1)
                   port map (wr_clk, wr_rd_gptr_s2, wr_rd_bptr_s);

-- Almost full flag

wr_rd_bptr_m1 <= wr_rd_bptr_s - 1;

wr_afull <= '1' when wr_bptr_a(AWIDTH-1 downto 0) = wr_rd_bptr_m1(AWIDTH-1 downto 0)
                 AND wr_bptr_a(AWIDTH) /= wr_rd_bptr_s(AWIDTH)               
            else '0';

-- Full flag

wr_fulli  <= '1' when wr_bptr_a(AWIDTH-1 downto 0) = wr_rd_bptr_s(AWIDTH-1 downto 0)
                      AND wr_bptr_a(AWIDTH) /= wr_rd_bptr_s(AWIDTH) 
              else '0';

wr_full <= wr_fulli;

-- request validity
wr_en_s <= '1' when (wrst = '0' AND wr_fulli = '0' AND wr_en = '1') else '0';

-- FIFO occupancy

process(wr_clk)
begin
   if rising_edge(wr_clk) then
      wr_rd_bptr_s1 <= wr_rd_bptr_s(AWIDTH-1 downto 0); -- P&R help
      wr_bptr_a1    <= wr_bptr_a(AWIDTH-1 downto 0); -- P&R help
   end if;
end process;
wr_cnt <= std_logic_vector((  wr_bptr_a1(AWIDTH-1 downto 0) 
                            - wr_rd_bptr_s1(AWIDTH-1 downto 0)) - 1);


----------------
-- Read section
----------------
process(rd_clk, rrst)
begin
   if rrst = '1' then
      rd_bptr_a <= (others => '1');
   elsif rising_edge(rd_clk) then
      if rd_en_s = '1' then
         rd_bptr_a <= rd_bptr_a + 1;
      end if;
   end if;
end process;
 
rd_ptr <= rd_bptr_a(AWIDTH-1 downto 0); -- strip off MSbit

rd_gray: bin2gray generic map (GWIDTH => AWIDTH+1)
                  port map (rd_clk, rd_bptr_a, rd_gptr_a);

-- sync write pointer
process(rd_clk)
begin
   if rising_edge(rd_clk) then
      if rrst = '1' then
         rd_wr_gptr_s1 <= (others => '0');
         rd_wr_gptr_s2 <= (others => '0');
      else
         rd_wr_gptr_s1 <= wr_gptr_a;
         rd_wr_gptr_s2 <= rd_wr_gptr_s1; -- double sampling when crossing clock domains
      end if;
   end if;
end process;

rd_s_bin: gray2bin generic map (GWIDTH => AWIDTH+1)
                   port map (rd_clk, rd_wr_gptr_s2, rd_wr_bptr_s);

-- Almost empty flag
-- Write pointer is decremented by 2 to account for the initial read-write offset

rd_wr_bptr_m2 <= rd_wr_bptr_s - 2 ;

rd_aempty  <= '1' when  rd_bptr_a = rd_wr_bptr_m2
              else '0';


-- Empty flag; must compare binaries
-- Write pointer is decremented to account for the initial read-write offset

rd_wr_bptr_m1 <= rd_wr_bptr_s - 1 ;

rd_empti  <= '1' when  rd_bptr_a = rd_wr_bptr_m1
              else '0';

rd_empty  <= rd_empti;

-- request validity
rd_en_s <= '1' when (rrst = '0' AND rd_empti = '0' AND rd_en = '1') else '0';

-- FIFO occupancy

process(rd_clk)
begin
   if rising_edge(rd_clk) then
      rd_wr_bptr_s1 <= rd_wr_bptr_s(AWIDTH-1 downto 0); -- P&R help
      rd_bptr_a1    <= rd_bptr_a(AWIDTH-1 downto 0); -- P&R help
   end if;
end process;
rd_cnt <= std_logic_vector((  rd_wr_bptr_s1(AWIDTH-1 downto 0) 
                            - rd_bptr_a1(AWIDTH-1 downto 0)) - 1);

end rtl;
