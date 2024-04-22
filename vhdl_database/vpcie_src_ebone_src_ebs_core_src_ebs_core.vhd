--------------------------------------------------------------------------
--
-- E-bone - core interconnect package
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     1.0  08/12/09    herve  1st release
--     1.1  19/10/10    herve  Added eb_aef signal
--                             Nlog2() revisited
--                             Types revisited
--     1.2  12/04/12    herve  Minor edit
--     1.3  04/10/12    herve  Bug Inconsistent BRQ fixed
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- Package required for any E-bone system
-- Defines a few type
-- Declare the core interconnect component 'ebs_core'
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

package ebs_pkg is

subtype std4    is std_logic_vector(3 downto 0);
subtype std8    is std_logic_vector(7 downto 0);
subtype std16   is std_logic_vector(15 downto 0);
subtype std32   is std_logic_vector(31 downto 0);
subtype std64   is std_logic_vector(63 downto 0);
type    std4_a  is array(natural RANGE <>) of std4;
type    std8_a  is array(natural RANGE <>) of std8;
type    std16_a is array(natural RANGE <>) of std16;
type    std32_a is array(natural RANGE <>) of std32;
type    std64_a is array(natural RANGE <>) of std64;

component ebs_core 
generic (
   EBS_TMO_DK   : natural := 4  
);

port (
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

-- Master #0 dedicated 
   eb_m0_brq_i  : in  std_logic;  -- bus request
   eb_m0_bg_o   : out std_logic;  -- bus grant
   eb_m0_as_i   : in  std_logic;  -- adrs strobe
   eb_m0_eof_i  : in  std_logic;  -- end of frame
   eb_m0_aef_i  : in  std_logic;  -- almost end of frame
   eb_m0_dat_i  : in  std32;      -- data write
   eb_s0_dk_i   : in  std_logic;  -- FT data acknowledge
   eb_s0_err_i  : in  std_logic;  -- FT error

-- Master #1 dedicated 
   eb_m1_brq_i  : in  std_logic;  -- bus request
   eb_m1_bg_o   : out std_logic;  -- bus grant
   eb_m1_as_i   : in  std_logic;  -- adrs strobe
   eb_m1_eof_i  : in  std_logic;  -- end of frame
   eb_m1_aef_i  : in  std_logic;  -- almost end of frame
   eb_m1_dat_i  : in  std32;      -- data write

-- Fast Transmitter
   eb_ft_brq_i  : in  std_logic;   -- bus request
   eb_ft_as_i   : in  std_logic;   -- adrs strobe
   eb_ft_eof_i  : in  std_logic;   -- end of frame
   eb_ft_aef_i  : in  std_logic;   -- almost end of frame

-- Master shared bus
   eb_m_dk_o    : out std_logic;   -- data acknowledge
   eb_m_err_o   : out std_logic;   -- bus error
   eb_m_dat_o   : out std32;       -- data read

-- From Slave dedicated 
   eb_dk_i      : in  std_logic_vector; -- data acknowledge
   eb_err_i     : in  std_logic_vector; -- bus error
   eb_dat_i     : in  std32_a;     -- data read

-- To Slave shared bus
   eb_bft_o     : inout std_logic; -- busy fast transmitter
   eb_bmx_o     : inout std_logic; -- busy others
   eb_as_o      : out std_logic;   -- adrs strobe
   eb_eof_o     : out std_logic;   -- end of frame
   eb_aef_o     : out std_logic;   -- almost end of frame
   eb_dat_o     : out std32        -- data write

);
end component;

function Nlog2(x : natural) return integer;

end package ebs_pkg;

package body ebs_pkg is

-- log2(x) function for value > 2
---------------------------------
function Nlog2(x : natural) return integer is 
   variable j  : integer := 0; 
begin 
   for i in 1 to 31 loop
      if(2**i >= x) then
         j := i;
         exit;
      end if;
   end loop;
   return j;
end Nlog2; 

end package body ebs_pkg; 

--------------------------------------------------------------------------
--
-- E-bone - core interconnect
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     1.0  14/10/09    herve  Creation
--     1.3  04/10/12    herve  Bug inconsistent BRQ fixed
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- Generic constants:
-- EBS_TMO_DK =  DS to DK time out (2**EBS_TMO_DK clocks)
--
-- Arbiter features: 
-- Asynchronous
-- Self monitors inconsistent BRQ/BG
-- Time out on slave not responding
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebs_core is
generic (
   EBS_TMO_DK   : natural := 4 
);

port (
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

-- Master #0 dedicated 
   eb_m0_brq_i  : in  std_logic;  -- bus request
   eb_m0_bg_o   : out std_logic;  -- bus grant
   eb_m0_as_i   : in  std_logic;  -- adrs strobe
   eb_m0_eof_i  : in  std_logic;  -- end of frame
   eb_m0_aef_i  : in  std_logic;  -- almost end of frame
   eb_m0_dat_i  : in  std32;      -- data write
   eb_s0_dk_i   : in  std_logic;  -- FT data acknowledge
   eb_s0_err_i  : in  std_logic;  -- FT error

-- Master #1 dedicated 
   eb_m1_brq_i  : in  std_logic;  -- bus request
   eb_m1_bg_o   : out std_logic;  -- bus grant
   eb_m1_as_i   : in  std_logic;  -- adrs strobe
   eb_m1_eof_i  : in  std_logic;  -- end of frame
   eb_m1_aef_i  : in  std_logic;  -- almost end of frame
   eb_m1_dat_i  : in  std32;      -- data write

-- Fast Transmitter
   eb_ft_brq_i  : in  std_logic;   -- bus request
   eb_ft_as_i   : in  std_logic;   -- adrs strobe
   eb_ft_eof_i  : in  std_logic;   -- end of frame
   eb_ft_aef_i  : in  std_logic;   -- almost end of frame

-- Master shared bus
   eb_m_dk_o    : out std_logic;   -- data acknowledge
   eb_m_err_o   : out std_logic;   -- bus error
   eb_m_dat_o   : out std32;       -- data read

-- From Slave dedicated 
   eb_dk_i      : in  std_logic_vector; -- data acknowledge
   eb_err_i     : in  std_logic_vector; -- bus error
   eb_dat_i     : in  std32_a;     -- data read

-- To Slave shared bus
   eb_bft_o     : inout std_logic; -- busy fast transmitter
   eb_bmx_o     : inout std_logic; -- busy others
   eb_as_o      : out std_logic;   -- adrs strobe
   eb_eof_o     : out std_logic;   -- end of frame
   eb_aef_o     : out std_logic;   -- almost end of frame
   eb_dat_o     : out std32        -- data write

);
end ebs_core;

-------------------------------
architecture rtl of ebs_core is
-------------------------------

type bustate_typ is (iddle, ft, m1, m0);         -- asynchronous
signal bustate     : bustate_typ;
type bustats_typ is (iddle_s, ft_s, m1_s, m0_s); -- synchronous
signal bustats     : bustats_typ;
signal eb_busy     : std_logic; 
signal eb_busy2    : std_logic; 
signal eb_m_dk_int : std_logic; -- DK internal
signal core_err    : std_logic; 
signal brq_err     : std_logic; 
signal cnt_dk      : unsigned(EBS_TMO_DK downto 0);

------------------------------------------------------------------------
begin
------------------------------------------------------------------------
assert EBS_TMO_DK > 1
       report "EBS_TMO_DK must be greater than 1!" severity failure;

-- Bus arbiter
--------------
process(eb_m0_brq_i, eb_m1_brq_i, eb_ft_brq_i)
begin
   if eb_m0_brq_i = '1' then
      bustate <= m0;
   elsif eb_m1_brq_i = '1' then
      bustate <= m1;
   elsif eb_ft_brq_i = '1' then
      bustate <= ft;
   else
      bustate <= iddle;
   end if;
end process; 

process(bustate)
begin
       case bustate is
         when iddle => eb_bft_o   <= '0';
                       eb_bmx_o   <= '0';
                       eb_m1_bg_o <= '0'; 
                       eb_m0_bg_o <= '0'; 

         when ft    => eb_bft_o   <= '1';
                       eb_bmx_o   <= '0';
                       eb_m1_bg_o <= '0'; 
                       eb_m0_bg_o <= '0'; 

         when m1    => eb_bft_o   <= '0';
                       eb_bmx_o   <= '1';
                       eb_m1_bg_o <= '1'; 
                       eb_m0_bg_o <= '0'; 

         when m0    => eb_bft_o   <= '0';
                       eb_bmx_o   <= '1';
                       eb_m1_bg_o <= '0'; 
                       eb_m0_bg_o <= '1'; 
       end case;
end process; 

-- Bus interconnect
-- Master to Slaves
-------------------

process(bustate, 
        eb_m0_as_i , eb_m1_as_i , eb_ft_as_i,
        eb_m0_eof_i, eb_m1_eof_i, eb_ft_eof_i,
        eb_m0_aef_i, eb_m1_aef_i, eb_ft_aef_i,
        eb_m0_dat_i, eb_m1_dat_i)
begin
       case bustate is
         when ft    => 
                       eb_as_o   <= eb_ft_as_i;
                       eb_eof_o  <= eb_ft_eof_i;
                       eb_aef_o  <= eb_ft_aef_i;
                       eb_dat_o  <= (others => '0'); -- eb_ft_dat_i drives eb_m_dat_o
         when m1    => 
                       eb_as_o   <= eb_m1_as_i;
                       eb_eof_o  <= eb_m1_eof_i;
                       eb_aef_o  <= eb_m1_aef_i;
                       eb_dat_o  <= eb_m1_dat_i;
         when m0    => 
                       eb_as_o   <= eb_m0_as_i;
                       eb_eof_o  <= eb_m0_eof_i;
                       eb_aef_o  <= eb_m0_aef_i;
                       eb_dat_o  <= eb_m0_dat_i;

         when iddle => 
                       eb_as_o   <= '0';
                       eb_eof_o  <= '0';
                       eb_aef_o  <= '0';
                       eb_dat_o  <= (others => '0');
       end case;

end process; 

-- Bus interconnect
-- Slaves to Masters
-------------------------------------------------------

process(eb_dk_i, eb_err_i, eb_dat_i,      -- slaves
        eb_s0_dk_i, eb_s0_err_i,          -- fast transmitter
        core_err)                         -- bus monitor

variable tmp_dk : std_logic := '0';
variable tmp_err: std_logic := '0';
variable tmp_dat: std32 := (others => '0');

begin
   tmp_dk  := '0';
   tmp_err := '0';
   tmp_dat := (others => '0');
   for slave in eb_dk_i'RANGE loop
      tmp_dk  := tmp_dk  OR eb_dk_i(slave);
      tmp_err := tmp_err OR eb_err_i(slave);
      tmp_dat := tmp_dat OR eb_dat_i(slave);
   end loop;
   eb_m_dk_int <= tmp_dk  OR eb_s0_dk_i;
   eb_m_err_o  <= tmp_err OR eb_s0_err_i OR core_err;
   eb_m_dat_o  <= tmp_dat ; 
end process; 
eb_m_dk_o <= eb_m_dk_int; -- internal to port

-- BG asserted to DK asserted watch dog timer
-- Note on broadcall :
-- EBS_TMO_DK must be >= 2 to prevent false ERR
-- since slaves may not generate DK
--------------------------------------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      eb_busy  <= eb_bft_o OR eb_bmx_o;
      eb_busy2 <= eb_busy; -- delay for preventing broadcall error
      if eb_m_dk_int = '1' OR eb_busy = '0' then
         cnt_dk <= (others => '0');
      elsif eb_busy2 = '1' then
         cnt_dk <= cnt_dk + 1;
      end if;
      core_err <=    std_logic(cnt_dk(EBS_TMO_DK)) 
                  OR brq_err; 
   end if;
end process; 

-- Inconsistent BRQ detector
----------------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then

       brq_err <= '0';

       case bustate is
         when iddle => bustats <= iddle_s;

         when ft    => bustats <= ft_s;
               
         when m1    => bustats <= m1_s;
               
         when m0    => bustats <= m0_s;             
       end case;

       case bustats is
         when iddle_s => brq_err <= '0';

         when ft_s    => 
              if eb_m0_brq_i = '1' OR eb_m1_brq_i = '1' then
                 brq_err <= '1';
              end if;
               
         when m1_s    => 
              if eb_m0_brq_i = '1' OR eb_ft_brq_i = '1' then
                 brq_err <= '1';
              end if;
               
         when m0_s    =>               
              if eb_m1_brq_i = '1' OR eb_ft_brq_i = '1' then
                 brq_err <= '1';
              end if;
       end case;
   end if;
end process; 

end rtl;
