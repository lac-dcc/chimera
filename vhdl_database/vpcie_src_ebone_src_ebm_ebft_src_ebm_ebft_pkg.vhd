--------------------------------------------------------------------------
--
-- E-bone Fast Transmitter to (2nd) E-bone master package
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  18/10/10    herve  Preliminary release
--     1.0  09/02/11    herve  1st release, fifo bug corrected
--     1.1  19/07/11    herve  FIFO(MIF) retry bug fixed
--     1.2  26/06/12    herve  Added status ports and FSM optimized
--     1.3  24/07/12    herve  Added 128 and 256 bits support
--                             Changed GCSR FT size reporting
--     1.4  04/10/12    herve  FT master bus request bug fixed
--                             Exact count on small burst (BRAM only)
--     1.5  14/11/12    herve  Exact count on small burst (all cases)
--     1.6  21/12/12    herve  Added messages, E-bone V1.3
--                             Added reset MIF command
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- Declare the component 'ebm_ebft'
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.ebs_pkg.all;

package ebm_ebft_pkg is

component ebm_ebft 
generic (
   EBS_AD_RNGE  : natural := 12;  -- short adressing range
   EBS_AD_BASE  : natural := 1;   -- usual IO segment
   EBS_AD_SIZE  : natural := 16;  -- size in segment
   EBS_AD_OFST  : natural := 0;   -- offset in segment
   EBX_MSG_MID  : natural := 1;   -- message master identifier
   EBFT_DWIDTH  : natural := 64   -- FT data width
);
port (
-- E-bone slave interface
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

   eb_bmx_i     : in  std_logic;  -- busy some master (but FT)
   eb_as_i      : in  std_logic;  -- adrs strobe
   eb_eof_i     : in  std_logic;  -- end of frame
   eb_dat_i     : in  std32;      -- data write
   eb_dk_o      : out std_logic;  -- data acknowledge
   eb_err_o     : out std_logic;  -- bus error
   eb_dat_o     : out std32;      -- data read

-- E-bone Fast Transmitter
   eb_ft_brq_o  : out std_logic;  -- FT master bus request
   eb_bft_i     : in  std_logic;  -- FT master bus grant
   eb_ft_as_o   : out std_logic;  -- FT adrs strobe
   eb_ft_eof_o  : out std_logic;  -- FT end of frame
   eb_ft_aef_o  : out std_logic;  -- FT almost end of frame
   eb_ft_dxt_o  : out std_logic_vector(EBFT_DWIDTH-1 downto 0); -- FT data 
   eb_dk_i      : in  std_logic;  -- FT data acknowledge
   eb_err_i     : in  std_logic;  -- FT bus error

-- (2nd) E-bone master interface
   eb2_mx_brq_o : out std_logic;  -- bus request
   eb2_mx_bg_i  : in  std_logic;  -- bus grant
   eb2_mx_as_o  : out std_logic;  -- adrs strobe
   eb2_mx_eof_o : out std_logic;  -- end of frame
   eb2_mx_aef_o : out std_logic;  -- almost end of frame
   eb2_mx_dat_o : out std_logic_vector(EBFT_DWIDTH-1 downto 0); -- master data write

-- (2nd) E-bone master shared bus
   eb2_dk_i     : in  std_logic;  -- data acknowledge
   eb2_err_i    : in  std_logic;  -- bus error
   eb2_dat_i    : in  std_logic_vector(EBFT_DWIDTH-1 downto 0); -- master data in
   eb2_bmx_i    : in  std_logic;  -- busy some master (but FT)
   eb2_bft_i    : in  std_logic;  -- busy FT

-- (2nd) E-bone extension master
   ebx2_msg_set_o : out std8;     -- message management
   ebx2_msg_dat_i : in  std8;     -- message data

-- External control ports
   cmd_go_i     : in  std_logic;  -- go command
   cmd_flush_i  : in  std_logic;  -- flush command
   cmd_abort_i  : in  std_logic;  -- abort command
   cmd_reset_i  : in  std_logic;  -- MIF reset command

-- External status ports
   d0_stat_o    : out std32;      -- Descriptor #0 status register
   d1_stat_o    : out std32;      -- Descriptor #1 status register
   dma_stat_o   : out std8;       -- Global status register
   dma_psize_o  : out std16;      -- DMA payload size in bytes
   dma_count_o  : out std16;      -- FIFO requested word count
   dma_eot_o    : out std_logic;  -- end of transfer
   dma_err_o    : out std_logic   -- transfer aborted on error
);
end component;

end package ebm_ebft_pkg;
