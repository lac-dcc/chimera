--------------------------------------------------------------------------
--
-- E-bone - BRAM memory interface package
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     1.0  13/12/09    herve  1st release
--     1.1  27/08/10    herve  Updated to E-bone 1.1
--                             Added FIFO support
--     1.2  12/04/11    herve  Updated to E-bone 1.2
--                             Removed mem_fifo_i port
--     1.3  12/01/12    herve  Check size 2**N
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- Declare the component 'ebs_bram'
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.ebs_pkg.all;

package ebs_bram_pkg is

component ebs_bram 
generic (
   EBS_AD_RNGE  : natural := 16;  -- adressing range
   EBS_AD_BASE  : natural := 2;   -- usual memory segment
   EBS_AD_SIZE  : natural := 512; -- size in segment
   EBS_AD_OFST  : natural := 0;   -- offset in segment
   EBS_DWIDTH   : natural := 32   -- memory (E-bone) data width 
);
port (

-- E-bone interface
   eb_clk_i    : in  std_logic;  -- system clock
   eb_rst_i    : in  std_logic;  -- synchronous system reset

   eb_bmx_i    : in  std_logic;  -- busy others
   eb_as_i     : in  std_logic;  -- adrs strobe
   eb_eof_i    : in  std_logic;  -- end of frame
   eb_aef_i    : in  std_logic;  -- almost end of frame
   eb_dat_i    : in  std_logic_vector(EBS_DWIDTH-1 downto 0); -- data write
   eb_dk_o     : out std_logic;  -- data acknowledge
   eb_err_o    : out std_logic;  -- bus error
   eb_dat_o    : out std_logic_vector(EBS_DWIDTH-1 downto 0); -- data read

-- BRAM memory interface
   mem_addr_o  : out std32;                                   -- mem. address
   mem_din_o   : out std_logic_vector(EBS_DWIDTH-1 downto 0); -- mem. data in
   mem_dout_i  : in  std_logic_vector(EBS_DWIDTH-1 downto 0); -- mem. data out
   mem_wr_o    : out std_logic;  -- mem. write enable
   mem_rd_o    : out std_logic;  -- mem. (FIFO) read enable
   mem_empty_i : in std_logic;   -- mem. (FIFO) empty status
   mem_full_i  : in std_logic    -- mem. (FIFO) full status
);
end component;
end package ebs_bram_pkg;
