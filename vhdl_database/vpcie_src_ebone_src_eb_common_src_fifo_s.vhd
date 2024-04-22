--------------------------------------------------
--
-- Synchronous FIFO 
--
--------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  07/01/11   herve   Preliminary
--     1.0  07/11/11   herve   Improved reset
--
-- http://www.esrf.fr
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.Nlog2;

entity fifo_s is
generic(
   DWIDTH : natural;  -- data width
   ADEPTH : natural;  -- FIFO depth
   RAMTYP : string := "auto"  -- "auto", "block", "distributed"
);
port (
   arst     : in std_logic;  -- asyn reset
   clk      : in std_logic;  -- clock
   wr_en    : in std_logic;  -- write enable
   wr_dat   : in std_logic_vector(DWIDTH-1 downto 0);
   wr_cnt   : out std_logic_vector(Nlog2(ADEPTH) downto 0);
   wr_afull : out std_logic; -- almost full flag
   wr_full  : out std_logic; -- full flag

   rd_en    : in std_logic;  -- read enable
   rd_dat   : out std_logic_vector(DWIDTH-1 downto 0);
   rd_aempty: out std_logic; -- almost empty flag
   rd_empty : out std_logic  -- empty flag
);
end fifo_s;

architecture rtl of fifo_s is
--------------------------------

type ram_typ is array (ADEPTH-1 downto 0) of std_logic_vector (DWIDTH-1 downto 0);
signal dpram    : ram_typ; -- dual port RAM

attribute ram_style: string; -- XST dependent
attribute ram_style of dpram: signal is RAMTYP;

-- Pointers are one more bit wide than dumb memory addressing
-- for full/empty discrimination
constant AWIDTH : natural := Nlog2(ADEPTH); 

signal rd_ptr   : unsigned(AWIDTH downto 0); -- read pointer
signal wr_ptr   : unsigned(AWIDTH downto 0); -- write pointer

-- Binary ptrs for processing
signal rd_ptr_s : unsigned(AWIDTH downto 0); -- read ptr (resampled)
signal wr_ptr_s : unsigned(AWIDTH downto 0); -- write ptr (resampled)

-- Controls
signal rd_en_s  : std_logic; -- read  valid (from synchronized write status)
signal wr_en_s  : std_logic; -- write valid (from synchronized read status)

signal rd_aempti: std_logic; -- almost empty
signal wr_afulli: std_logic; -- almost full

signal rd_empti : std_logic; -- internal
signal wr_fulli : std_logic; -- internal

signal rst1, rst2, rst : std_logic := '1'; -- synchronous reset

-----
begin
-----
assert ADEPTH = 2**AWIDTH 
       report "ADEPTH must be power of 2!" severity failure;

----------------
-- dual port RAM
----------------
process (clk)
begin
   if rising_edge(clk) then
      if wr_en_s = '1' then
         dpram(to_integer(wr_ptr(AWIDTH-1 downto 0))) <= wr_dat;
      end if;
   end if;
end process;

process (clk)
begin
   if rising_edge(clk) then
      rd_dat <= dpram(to_integer(rd_ptr(AWIDTH-1 downto 0)));
   end if;
end process;

------------------------------
-- Synchronous reset generator
------------------------------
process(clk, arst)
begin
   if arst = '1' then
      rst1 <= '1';
   elsif rising_edge(clk) then
      rst1 <= arst;
   end if;
end process;

process(clk)
begin
   if rising_edge(clk) then
      rst2 <= rst1;
      rst  <= rst2 AND rst1; -- glitch filter
   end if;
end process;

----------------
-- Write section
----------------
process(clk, rst)
begin
   if rst = '1' then
      wr_ptr <= (others => '0');
   elsif rising_edge(clk) then
      if wr_en_s = '1' then
          wr_ptr <= wr_ptr + 1;
      end if;
   end if;
end process;

-- Almost full flag

wr_afulli <= '1' when wr_ptr(AWIDTH-1 downto 0) = (rd_ptr(AWIDTH-1 downto 0))
                  AND rd_ptr(AWIDTH) /= wr_ptr(AWIDTH)
              else '0';

wr_afull <= wr_afulli;

-- Full flag

process(clk)
begin
   if rising_edge(clk) then
      if rst = '1' OR rd_en = '1' then         -- clear
         wr_fulli  <= '0';
      elsif (wr_afulli = '1' AND wr_en = '1' ) -- set
            OR wr_fulli  = '1' then            -- memorized
         wr_fulli  <= '1';
      end if;
   end if;
end process;

wr_full <= wr_fulli;

-- request validity
wr_en_s <= wr_en AND NOT (wr_fulli OR rst);

----------------
-- Read section
----------------
-- Read pointer starts one location behind the write pointer
-- Thus the same memory location is never simultaneously accessed in R/W.

process(clk, rst)
begin
   if rst = '1' then
       rd_ptr <= (others => '1'); -- minus one
   elsif rising_edge(clk) then
      if rd_en_s = '1' then
          rd_ptr <= rd_ptr + 1;
      end if;
   end if;
end process;

-- Almost empty flag

rd_aempti <= '1' when rd_ptr = wr_ptr - 2
              else '0';

rd_aempty <= rd_aempti;

-- Empty flag

process(clk)
begin
   if rising_edge(clk) then
      if wr_en = '1' then                      -- clear
         rd_empti  <= '0';
      elsif (rd_aempti = '1' AND rd_en = '1' ) -- set
            OR rst = '1' 
            OR rd_empti  = '1' then            -- memorized
         rd_empti  <= '1';
      end if;
   end if;
end process;

rd_empty <= rd_empti;

-- request validity
rd_en_s <= rd_en AND NOT rd_empti;

-----------------
-- FIFO occupancy
-----------------
-- Write pointer is decremented to account for the initial read-write offset
process(clk)
begin
   if rising_edge(clk) then
      wr_ptr_s <= wr_ptr - 1; -- P&R help
      rd_ptr_s <= rd_ptr;     -- P&R help
   end if;
end process;

wr_cnt <= std_logic_vector(wr_ptr_s - rd_ptr_s);

end rtl;
