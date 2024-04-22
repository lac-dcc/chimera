--------------------------------------------------------------------------
--
-- E-bone Fast Transmitter to (2nd) E-bone master
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  18/10/10    herve  Preliminary release
--     0.2  09/02/11    herve  fifo bug corrected
--     1.0  11/04/11    herve  Updated to E-bone rev. 1.2
--     1.1  19/07/11    herve  FIFO(MIF) retry bug fixed
--     1.2  26/06/12    herve  Added status ports and FSM optimized
--     1.3  24/07/12    herve  Added 128 and 256 bits support
--                             Changed GCSR FT data width reporting
--     1.4  04/10/12    herve  FT master bus request bug fixed
--                             Exact count on small burst (BRAM only)
--     1.5  14/11/12    herve  Exact count on small burst (all cases)
--     1.6  21/12/12    herve  Added messages, E-bone V1.3
--                             Added reset MIF command
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- E-bone Master Fast Transmitter (1st E-bone)
-- Master #0 on (2nd) E-bone 
--
-- Both E-bone interconnects share the same clock
-- Fast Transmitter and 2nd E-bone same data width, 64 bit fixed.
-- Broad-cast at end of transfer (empty message)
--
-- E-bone slave supported are of 3 types:
-- BRAM
-- FIFO
-- MIF interface (for external memory with MIG interfacing)
--
-- Memory block mover:
-- DMAC manage to move the total size requested (count#1)
-- in a number of (smaller) FT payload blocks (count#2).
--
-- FIFO readout 
-- DMAC waits for enough data in FIFO.
-- Then it moves this FIFO block size (count#3)
-- in a number of (smaller) FT payload blocks (count#2).
-- Repeat reading the FIFO 
-- until the the total size requested is exhausted (count#1).
--
-- MIF readout
-- DMAC place a request by writing @FIFO offset
-- Then managed like FIFO
--
-- MIF request format is as follows
-- offset data
-- 0      MIF address
-- 1      MIF count
-- 2      reserved
-- 3      MIF command
--        0000 = Close message channel
--        1111 = Reset
--
-- It is recommended to set EBS_TMO_DK(PCIe/FT) > EBS_TMO_DK(2nd E-bone)
--------------------------------------------------------------------------
-- MIF address is limited to 28 bits
--------------------------------------------------------------------------
-- The destination upper address (32 MSbits) is fixed.
-- Only the lower (32 LSbits) is a true counter
-- So the 0x0..0f..f address boundary cannot be crossed over
--------------------------------------------------------------------------
-- E-bone slave for control
-- Register map

-- Descriptors
--------------
-- Ofst  Usage
--    0  desc. 0; E-bone source
 
--       Plain memory
--        27-0  E-bone offset
--       29-28  E-bone segment
--       31-30  "00"

--       FIFO (or MIF) memory
--        15-0  E-bone offset
--       28-16  FIFO readout count (max 4096)
--       31-28  Managed by MIF
--              1XXX=conservative (mif_rdy when all data in fifo)
--              0XXX=mif_rdy at N/16 fifo full
--              0000=mif_rdy at fifo not empty

--    1  desc. 0; MIF address
--    2  desc. 0; reserved

--    3  desc. 0; Dest. address LSW
--    4  desc. 0; Dest. address MSW

--    5  desc. 0; Control
--        23-0  count (words)
--       25-24  reserved
--          26  i/f type 0=ebs_bram, 1=MIF
--          27  memory type 0=plain mem., 1=FIFO
--          28  command flush
--          29  command abort
--          30  descriptor linked
--          31  descriptor valid (self clear when done)


--    6  desc. 1; E-bone source 
--    7  desc. 1; MIF address 
--    8  desc. 1; reserved
--    9  desc. 1; Dest. address LSW
--   10  desc. 1; Dest. address MSW
--   11  desc. 1; Control

-- Config. & status
-------------------
-- Ofst  Usage
--   12  PCIe payload size (** bytes **)

--   13   23-0   reserved R/W
--        25-24  "00"
--           26  fifo ready
--           27  fifo empty
--        31-28  FT size

--   14  Desc. 0; Status, read only
--       23-00  count actually moved
--       28-24  "0...0"
--       29     underrun (overlapping readout) error status
--       30     error status
--       31     running status

--   15  Desc. 1; Status, read only
--
-- Notes: 
-- If MIF bit is set, the FIFO bit must be set as well
-- E-bone 28 bits addressing = 256 M (64b) words =   2 GBytes
--        24 bits addressing =  16 M (64b) words = 256 MBytes
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebm_ebft is
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
   eb2_dk_i     : in std_logic;   -- data acknowledge
   eb2_err_i    : in std_logic;   -- bus error
   eb2_dat_i    : in std_logic_vector(EBFT_DWIDTH-1 downto 0); -- master data in
   eb2_bmx_i    : in std_logic;   -- busy some master (but FT)
   eb2_bft_i    : in std_logic;   -- busy FT

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
end ebm_ebft;

--------------------------------------
architecture rtl of ebm_ebft is
--------------------------------------
constant EBS_RW_SIZE : natural := EBS_AD_SIZE-2; -- nb. of R/W registers
subtype dma_regs_typ is std32_a(EBS_RW_SIZE-1 downto 0);
--
-- Control and Status registers
--
component ebftm_regs is
generic (
   EBS_AD_RNGE  : natural := 12;  -- short adressing range
   EBS_AD_BASE  : natural := 1;   -- usual IO segment
   EBS_AD_SIZE  : natural := 16;  -- size in segment
   EBS_AD_OFST  : natural := 0;   -- offset in segment
   EBS_RW_SIZE  : natural := 14   -- nb. of R/W registers
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

-- DMAC registers and control
   dma_regs_o   : out std32_a;    -- register outputs
   dma0_stat_i  : in  std32;      -- DMA #0 status 
   dma1_stat_i  : in  std32;      -- DMA #1 status
   dma_stat_i   : in  std8        -- DMA status
);
end component;

--
-- Fast Transmitter
--
component ebftm_ft
generic (
   EBFT_DWIDTH  : natural := 64   -- FT data width 
);
port (
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

-- E-bone Fast Transmitter
   eb_bmx_i     : in  std_logic;  -- busy some master (but FT)
   eb_bft_i     : in  std_logic;  -- FT master bus grant
   eb_ft_brq_o  : out std_logic;  -- FT master bus request
   eb_ft_as_o   : out std_logic;  -- FT adrs strobe
   eb_ft_eof_o  : out std_logic;  -- FT end of frame
   eb_ft_aef_o  : out std_logic;  -- FT almost end of frame
   eb_ft_dxt_o  : out std_logic_vector(EBFT_DWIDTH-1 downto 0);
   eb_dk_i      : in  std_logic;  -- master data acknowledge
   eb_err_i     : in  std_logic;  -- master bus error

-- DMAC registers and status
   dma_regs_i   : in  std32_a;    -- register outputs
   dma0_stat_o  : out std32;      -- DMA #0 status 
   dma1_stat_o  : out std32;      -- DMA #1 status 
   dma_stat_o   : out std8;       -- DMA status
   dma_eot_o    : out std_logic;  -- end of transfer
   dma_err_o    : out std_logic;  -- transfer aborted on error

-- External control ports
   fif_ready_i  : in std_logic;   -- FIFO ready 
   fif_empty_i  : in std_logic;   -- FIFO empty
   cmd_go_i     : in std_logic;   -- go command
   cmd_flush_i  : in std_logic;   -- flush command
   cmd_abort_i  : in std_logic;   -- abort command
   cmd_reset_i  : in std_logic;   -- MIF reset command

-- Burst management i/f
   mif_adrs_o   : out std32;      -- MIF starting address
   mif_count_o  : out std16;      -- MIF word count
   mx_adrs_o    : out std32;      -- burst starting address
   mx_brq_o     : out std_logic;  -- burst read request command
   mx_bwr_o     : out std_logic;  -- burst write command
   mx_clr_o     : out std_logic;  -- clear message command
   mx_rst_o     : out std_logic;  -- MIF reset command
   mx_read_o    : out std_logic;  -- burst read command
   mx_aend_o    : out std_logic;  -- burst almost end command
   mx_end_o     : out std_logic;  -- burst end command
   mx_abrt_o    : out std_logic;  -- burst abort command
   mx_bg_i      : in  std_logic;  -- burst request granted
   mx_ardy_i    : in  std_logic;  -- burst data almost ready
   mx_rdy_i     : in  std_logic;  -- burst data ready
   mx_err_i     : in  std_logic;  -- burst error
   mx_dout_i    : in  std_logic_vector(EBFT_DWIDTH-1 downto 0)
);
end component;

--
-- 2nd E-bone master
--
component ebftm_mx
generic (
   EBX_MSG_MID  : natural := 0;   -- message master identifier
   EBS_DWIDTH   : natural := 64   -- E-bone data width 
);
port (
-- 2nd E-bone master interface
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

   eb2_mx_brq_o : out std_logic;  -- bus request
   eb2_mx_bg_i  : in std_logic;   -- bus grant
   eb2_mx_as_o  : out std_logic;  -- adrs strobe
   eb2_mx_eof_o : out std_logic;  -- end of frame
   eb2_mx_aef_o : out std_logic;  -- almost end of frame
   eb2_mx_dat_o : out std_logic_vector(EBS_DWIDTH-1 downto 0); 
   ebx2_msg_set_o : out std8;     -- message management

-- 2nd E-bone master shared bus
   eb2_dk_i     : in std_logic;   -- data acknowledge
   eb2_err_i    : in std_logic;   -- bus error
   eb2_dat_i    : in std_logic_vector(EBS_DWIDTH-1 downto 0);
   eb2_bmx_i    : in std_logic;   -- busy some master (but FT)
   eb2_bft_i    : in std_logic;   -- busy FT

-- Burst management i/f
   mif_adrs_i   : in  std32;      -- MIF starting address
   mif_count_i  : in  std16;      -- MIF word count
   mx_adrs_i    : in  std32;      -- burst starting address
   mx_brq_i     : in  std_logic;  -- burst request command
   mx_bwr_i     : in  std_logic;  -- burst write command
   mx_clr_i     : in  std_logic;  -- clear message command
   mx_rst_i     : in  std_logic;  -- MIF reset command
   mx_read_i    : in  std_logic;  -- burst read command
   mx_aend_i    : in  std_logic;  -- burst almost end command
   mx_end_i     : in  std_logic;  -- burst end command
   mx_abrt_i    : in  std_logic;  -- burst abort command
   mx_bg_o      : out std_logic;  -- burst request acknowledge
   mx_ardy_o    : out std_logic;  -- burst data almost ready
   mx_rdy_o     : out std_logic;  -- burst data ready
   mx_err_o     : out std_logic;  -- burst error
   mx_dout_o    : out std_logic_vector(EBS_DWIDTH-1 downto 0)
);
end component;

signal fif_ready  : std_logic;  -- FIFO ready (partially full)
signal fif_empty  : std_logic;  -- FIFO empty

signal dma_regs   : dma_regs_typ;
signal dma0_stat  : std32;   -- DMA desc. #0 status 
signal dma1_stat  : std32;   -- DMA desc. #1 status 
signal dma_stat   : std8;    -- DMA status 
signal mx_adrs    : std32;      -- burst starting address
signal mx_brq     : std_logic;  -- burst request command
signal mx_bwr     : std_logic;  -- burst write command
signal mx_clr     : std_logic;  -- clear message command
signal mx_rst     : std_logic;  -- MIF reset command
signal mx_read    : std_logic;  -- burst read command
signal mx_aend    : std_logic;  -- burst almost end command
signal mx_end     : std_logic;  -- burst end command
signal mx_abrt    : std_logic;  -- burst abort command
signal mx_bg      : std_logic;  -- burst request acknowledge
signal mx_ardy    : std_logic;  -- burst data almost ready
signal mx_rdy     : std_logic;  -- burst data ready
signal mx_err     : std_logic;  -- burst error
signal mx_dout    : std_logic_vector(EBFT_DWIDTH-1 downto 0);
signal mif_adrs   : std32;      -- MIF starting address
signal mif_count  : std16;      -- MIF word count

------------------------------------------------------------------------
begin
------------------------------------------------------------------------
assert EBS_AD_SIZE = 16 
       report "EBS_AD_SIZE invalid (must be 16)!" severity failure;
assert EBS_AD_OFST mod EBS_AD_SIZE = 0 
       report "EBS_AD_OFST invalid boundary!" severity failure;
assert (EBFT_DWIDTH mod 32 = 0) OR (EBFT_DWIDTH/32 mod 2 = 0)
       report "EBFT_DWIDTH invalid!" severity failure;

-- Map message to internal signals
----------------------------------
fif_ready <= ebx2_msg_dat_i(0);
fif_empty <= ebx2_msg_dat_i(1);

-- E-bone registers slave i/f
-----------------------------
regs: ebftm_regs 
generic map(
   EBS_AD_RNGE  => EBS_AD_RNGE,  -- short adressing range
   EBS_AD_BASE  => EBS_AD_BASE,  -- usual IO segment
   EBS_AD_SIZE  => EBS_AD_SIZE,  -- size in segment
   EBS_AD_OFST  => EBS_AD_OFST   -- offset in segment
)
port map(
-- E-bone slave interface
   eb_clk_i     => eb_clk_i,     -- system clock
   eb_rst_i     => eb_rst_i,     -- synchronous system reset

   eb_bmx_i     => eb_bmx_i,     -- busy some master (but FT)
   eb_as_i      => eb_as_i,      -- adrs strobe
   eb_eof_i     => eb_eof_i,     -- end of frame
   eb_dat_i     => eb_dat_i,     -- data write
   eb_dk_o      => eb_dk_o,      -- data acknowledge
   eb_err_o     => eb_err_o,     -- bus error
   eb_dat_o     => eb_dat_o,     -- data read

-- DMAC registers and control
   dma_regs_o   => dma_regs,     -- register outputs
   dma0_stat_i  => dma0_stat,    -- DMA #0 status 
   dma1_stat_i  => dma1_stat,    -- DMA #1 status
   dma_stat_i   => dma_stat      -- DMA status
);

-- E-bone master Fast Transmitter
-----------------------------------
ft: ebftm_ft 
generic map(
   EBFT_DWIDTH  => EBFT_DWIDTH  -- FT data width 
)
port map(
   eb_clk_i     => eb_clk_i,     -- system clock
   eb_rst_i     => eb_rst_i,     -- synchronous system reset

-- E-bone Fast Transmitter
   eb_bmx_i     => eb_bmx_i,     -- busy some master (but FT)
   eb_bft_i     => eb_bft_i,     -- FT master bus grant
   eb_ft_brq_o  => eb_ft_brq_o,  -- FT master bus request
   eb_ft_as_o   => eb_ft_as_o,   -- FT data strobe
   eb_ft_eof_o  => eb_ft_eof_o,  -- FT end of frame
   eb_ft_aef_o  => eb_ft_aef_o,  -- FT almost end of frame
   eb_ft_dxt_o  => eb_ft_dxt_o,  -- FT data write
   eb_dk_i      => eb_dk_i,      -- master data acknowledge
   eb_err_i     => eb_err_i,     -- master bus error

-- DMAC registers and control
   dma_regs_i   => dma_regs,     -- register outputs
   dma0_stat_o  => dma0_stat,    -- DMA #0 status 
   dma1_stat_o  => dma1_stat,    -- DMA #1 status 
   dma_stat_o   => dma_stat,     -- DMA status
   dma_eot_o    => dma_eot_o,    -- end of transfer
   dma_err_o    => dma_err_o,    -- transfer aborted on error

-- External control ports
   fif_ready_i  => fif_ready,    -- FIFO ready 
   fif_empty_i  => fif_empty,    -- FIFO empty
   cmd_go_i     => cmd_go_i,     -- go command
   cmd_flush_i  => cmd_flush_i,  -- flush command
   cmd_abort_i  => cmd_abort_i,  -- abort command
   cmd_reset_i  => cmd_reset_i,  -- MIF reset command

-- Burst management i/f
   mif_adrs_o   => mif_adrs,     -- MIF starting address
   mif_count_o  => mif_count,    -- MIF word count
   mx_adrs_o    => mx_adrs,      -- burst starting address
   mx_brq_o     => mx_brq,       -- burst request command
   mx_bwr_o     => mx_bwr,       -- burst write command
   mx_clr_o     => mx_clr,       -- clear message command
   mx_rst_o     => mx_rst,       -- MIF reset command
   mx_read_o    => mx_read,      -- burst read command
   mx_end_o     => mx_end,       -- burst end command
   mx_aend_o    => mx_aend,      -- burst almost end command
   mx_abrt_o    => mx_abrt,      -- burst abort command
   mx_bg_i      => mx_bg,        -- burst request granted
   mx_ardy_i    => mx_ardy,      -- burst almost ready
   mx_rdy_i     => mx_rdy,       -- burst ready
   mx_err_i     => mx_err,       -- burst error
   mx_dout_i    => mx_dout       -- burst data
);

-- 2nd E-bone master
--------------------
mx: ebftm_mx
generic map (
   EBX_MSG_MID => EBX_MSG_MID,   -- message master identifier
   EBS_DWIDTH  => EBFT_DWIDTH    -- E-bone data width 
)
port map(
-- 2nd E-bone master interface
   eb_clk_i     => eb_clk_i,     -- system clock
   eb_rst_i     => eb_rst_i,     -- synchronous system reset

   eb2_mx_brq_o => eb2_mx_brq_o, -- bus request
   eb2_mx_bg_i  => eb2_mx_bg_i,  -- bus grant
   eb2_mx_as_o  => eb2_mx_as_o,  -- adrs strobe
   eb2_mx_eof_o => eb2_mx_eof_o, -- end of frame
   eb2_mx_aef_o => eb2_mx_aef_o, -- almost end of frame
   eb2_mx_dat_o => eb2_mx_dat_o, -- master data write
   ebx2_msg_set_o => ebx2_msg_set_o, -- message management

-- 2nd E-bone master shared bus
   eb2_dk_i     => eb2_dk_i,     -- data acknowledge
   eb2_err_i    => eb2_err_i,    -- bus error
   eb2_dat_i    => eb2_dat_i,    -- master data in
   eb2_bmx_i    => eb2_bmx_i,    -- busy some master (but FT)
   eb2_bft_i    => eb2_bft_i,    -- busy FT

-- Burst management i/f
   mif_adrs_i   => mif_adrs,     -- MIF starting address
   mif_count_i  => mif_count,    -- MIF word count
   mx_adrs_i    => mx_adrs,      -- burst starting address
   mx_brq_i     => mx_brq,       -- burst request command
   mx_bwr_i     => mx_bwr,       -- burst write command
   mx_clr_i     => mx_clr,       -- clear message command
   mx_rst_i     => mx_rst,       -- MIF reset command
   mx_read_i    => mx_read,      -- burst read command
   mx_aend_i    => mx_aend,      -- burst almost end command
   mx_end_i     => mx_end,       -- burst end command
   mx_abrt_i    => mx_abrt,      -- burst abort command
   mx_bg_o      => mx_bg,        -- burst request acknowledge
   mx_ardy_o    => mx_ardy,      -- burst almost ready
   mx_rdy_o     => mx_rdy,       -- burst ready
   mx_err_o     => mx_err,       -- burst error
   mx_dout_o    => mx_dout       -- burst data
);

-- External status ports
   d0_stat_o    <= dma0_stat;    -- Descriptor #0 status register
   d1_stat_o    <= dma1_stat;    -- Descriptor #1 status register
   dma_stat_o   <= dma_stat;     -- Global status register
   dma_psize_o  <= dma_regs(12)(15 downto 0);
   dma_count_o  <= "0000" & mif_count(11 downto 0);

end rtl;
