--------------------------------------------------------------------------
--
-- E-bone - Register stack slave package
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     1.0  12/10/09    herve  1st release
--     1.1  20/10/10    herve  Updated to E-bone 1.1
--                             Fixed bug overflow error 
--     1.2  11/04/11    herve  Removed ACKs outputs, added offset
--                             All read only regs now supported
--                             Updated to E-bone 1.2
--     1.3  12/01/12    herve  Check size 2**N
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- Declare the component 'ebs_regs'
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.ebs_pkg.all;

package ebs_regs_pkg is

component ebs_regs 
generic (
   EBS_AD_RNGE  : natural := 12;  -- short adressing range
   EBS_AD_BASE  : natural := 1;   -- usual IO segment
   EBS_AD_SIZE  : natural := 16;  -- size in segment
   EBS_AD_OFST  : natural := 0;   -- offset in segment
   EBS_MIRQ     : std16   := (0=> '1', others => '0'); -- Message IRQ
   REG_RO_SIZE  : natural := 1;   -- read only reg. number
   REG_WO_BITS  : natural := 1    -- reg. 0 self clear bit number
);
port (

-- E-bone interface
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

   eb_bmx_i     : in  std_logic;  -- busy others
   eb_as_i      : in  std_logic;  -- adrs strobe
   eb_eof_i     : in  std_logic;  -- end of frame
   eb_dat_i     : in  std32;      -- data write
   eb_dk_o      : out std_logic;  -- data acknowledge
   eb_err_o     : out std_logic;  -- bus error
   eb_dat_o     : out std32;      -- data read

-- Register interface
   regs_o       : out std32_a;    -- R/W registers external outputs
   regs_i       : in  std32_a;    -- read only register external inputs
   regs_irq_i   : in  std_logic;  -- interrupt request
   regs_iak_o   : out std_logic;  -- interrupt handshake
   regs_ofsrd_o : out std_logic;  -- read burst offset enable
   regs_ofswr_o : out std_logic;  -- write burst offset enable
   regs_ofs_o   : out std_logic_vector(Nlog2(EBS_AD_SIZE)-1 downto 0); -- offset
   reg0_sclr_i  : in  std_logic   -- register zero self clear request

);
end component;
end package ebs_regs_pkg;
