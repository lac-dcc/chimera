--------------------------------------------------
--
-- Synchronous FIFO, XILINX SRL16 based 
--
--------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  17/01/11   herve   Preliminary
--     1.0  07/11/11   herve   Improved reset
--
-- http://www.esrf.fr
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.Nlog2;

entity fifo_srl is
generic(
   DWIDTH : natural;       -- data width
   ADEPTH : natural := 16  -- FIFO depth
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
end fifo_srl;

architecture rtl of fifo_srl is
---------------------------------

type srl_typ is array (ADEPTH-1 downto 0) of std_logic_vector(DWIDTH-1 downto 0);
signal srlf  : srl_typ; -- SRL16 primitives
signal srl0  : std_logic_vector(DWIDTH-1 downto 0);

constant AWIDTH : natural := Nlog2(ADEPTH)-1; 
constant C_AEMPTY : unsigned(AWIDTH downto 0):= (others => '0');
signal C_AFULL    : unsigned(AWIDTH downto 0);
signal rd_ptr     : unsigned(AWIDTH downto 0); -- read/write index pointer

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
assert ADEPTH = 2**(AWIDTH+1)
       report "ADEPTH must be power of 2!" severity failure;

C_AFULL(AWIDTH downto 1) <= (others => '1');
C_AFULL(0)               <=  '0';

-----------------------
-- SRL16/32 (hopefully)
-----------------------
process (clk)
begin
   if rising_edge(clk) then

      if wr_en_s = '1' then
         srlf(0) <= wr_dat;
         for i in 0 to ADEPTH-2 loop
            srlf(i+1) <= srlf(i);
         end loop;
      end if;

   end if;
end process;
srl0 <= srlf(to_integer(rd_ptr));

-- Output register
process (clk)
begin
   if rising_edge(clk) then
      rd_dat <= srl0;
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

---------------------------
-- Read/write index counter
---------------------------
-- Simultaneous read and write, then  pointer does not change
process(clk)
begin
   if rising_edge(clk) then
      if rst ='1' then
          rd_ptr <= (others => '1');
      elsif wr_en_s = '1' AND rd_en_s = '0' then -- write
          rd_ptr <= rd_ptr + 1;
      elsif rd_en_s = '1' AND wr_en_s = '0' then -- read
          rd_ptr <= rd_ptr - 1;
      end if;
   end if;
end process;

--------------
-- Write flags
--------------

-- Almost full flag

wr_afulli <= '1' when rd_ptr = C_AFULL
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
-- Read flags
----------------

-- Almost empty flag

rd_aempti <= '1' when rd_ptr = C_AEMPTY
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
process(clk)
begin
   if rising_edge(clk) then
      wr_cnt <= wr_fulli & std_logic_vector(rd_ptr + 1);
   end if;
end process;

end rtl;
