--------------------------------------------------------------------------
--
-- E-bone - utilities package
--
--------------------------------------------------------------------------
-- fifo_s
-- fifo_sft
-- fifo_srl16
-- fifo_a
-- fifo_aft
-- gray_counter
-- gray2bin
-- bin2gray
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.2  17/01/11    herve  Preliminary release
--     1.0  22/03/12    herve  add fifo_sft
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.all;

package eb_common_pkg is

-- Asynchronous FIFO 
--------------------
component fifo_a is
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
end component;


-- Asynchronous FIFO fall through
---------------------------------
component fifo_aft is
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
   rd_cnt   : out std_logic_vector(Nlog2(ADEPTH) downto 0);
   rd_aempty: out std_logic; -- almost empty flag
   rd_empty : out std_logic  -- empty flag
);
end component;

-- Synchronous FIFO 
--------------------
component fifo_s is
generic(
   DWIDTH : natural;   -- data width
   ADEPTH : natural;   -- FIFO depth
   RAMTYP : string  := "auto" -- "auto", "block", "distributed"
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
end component;

-- Synchronous FIFO fall through
--------------------------------
component fifo_sft is
generic(
   DWIDTH : natural;   -- data width
   ADEPTH : natural;   -- FIFO depth
   RAMTYP : string  := "auto" -- "auto", "block", "distributed"
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
end component;

-- Synchronous FIFO, XILINX SRL16/32 based 
--------------------------------------------------
component fifo_srl is
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
end component;

-- Gray counter
---------------
component gray_counter is
generic(
   GWIDTH  : natural -- counter width
);
port ( 
   srst : in std_logic; -- synchronous reset
   clk	: in std_logic; -- clock
   en   : in std_logic; -- enable
   qrst	: in  std_logic_vector(GWIDTH-1 downto 0); -- reset loading value
   cnt	: out std_logic_vector(GWIDTH-1 downto 0)  -- gray count
);
end component;

end package eb_common_pkg;
