--------------------------------------------------------------------------
--
-- DMA controller - Destination Fast Transmitter (FT) master
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  18/10/10    herve  Preliminary release
--     1.0  09/02/11    herve  1st release, fifo bug corrected
--     1.1  19/07/11    herve  FIFO(MIF) retry bug fixed
--     1.2  26/06/12    herve  Added overlapping error bit and optimized
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
-- E-bone Fast Transmitter master i/f
-- Broad-cast at end of transfer (empty message)
-------------------------------------------------------------
-- The destination upper address (32 MSbits) is fixed.
-- Only the lower (32 LSbits) is a true counter
-- So the 0x0..0f..f address boundary cannot be crossed over
-------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebftm_ft is
generic (
   EBFT_DWIDTH  : natural := 64   -- FT data width 
);
port (
-- E-bone Fast Transmitter
   eb_clk_i     : in  std_logic;  -- system clock
   eb_rst_i     : in  std_logic;  -- synchronous system reset

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
   fif_ready_i  : in  std_logic;  -- FIFO ready 
   fif_empty_i  : in  std_logic;  -- FIFO empty
   cmd_go_i     : in  std_logic;  -- go command
   cmd_flush_i  : in  std_logic;  -- flush command
   cmd_abort_i  : in  std_logic;  -- abort command
   cmd_reset_i  : in  std_logic;  -- MIF reset command

-- Burst management i/f
   mif_adrs_o   : out std32;      -- MIF starting address
   mif_count_o  : out std16;      -- MIF word count
   mx_adrs_o    : out std32;      -- burst starting address
   mx_brq_o     : out std_logic;  -- burst request command
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
end ebftm_ft;

--------------------------------------
architecture rtl of ebftm_ft is
--------------------------------------
constant EBFT_DW32  : natural := EBFT_DWIDTH/32;
constant EBFT_DWLOG : natural := Nlog2(EBFT_DWIDTH/16);

type state_typ is (iddle, wait0, wait1, wait2, wait3, wait4, wait9,
                   brq1, brq2, brq3, brq9,
                   adr1, adr2, adr3, dat01, dat1, dat11, dat2,
                   end1, end2, bc1, bc2, bc3, bc4, bc5, bc6,
                   abrt1, abrt2, abrt3, rst1, rst2, rst3);
signal state, nextate : state_typ;

signal fif_rdy   : std_logic; 
signal fif_empty : std_logic; 
signal dat_lsw   : std32;
signal dat_msw   : std32;
signal ftw_stat  : unsigned(3 downto 0);

signal ftd32   : std_logic := '0';   -- E-bone Fast Transmitter 32 bit data 
signal alsw    : std_logic := '0';   -- dest. address low word
signal ebadrs  : std_logic := '0';   -- E-bone addressing phase start
signal ebrq    : std_logic := '0';   -- E-bone request
signal irq     : std_logic := '0';   -- E-bone interrupt request start
signal irqend  : std_logic := '0';   -- E-bone interrupt request end
signal ebft    : std_logic := '0';   -- E-bone FT busy
signal ebbc    : std_logic := '0';   -- E-bone FT broad-cast burst
signal ebdat   : std_logic := '0';   -- E-bone switch to data phase
signal ebeof   : std_logic := '0';   -- E-bone end of frame
signal dmadone : std_logic := '0';   -- DMAC descriptor done flag
signal errdone : std_logic := '0';   -- error abort flag
signal daterr  : std_logic := '0';   -- data phase error flag
signal adrerr  : std_logic := '0';   -- address phase error flag
signal ovlerr  : std_logic := '0';   -- overlapping error flag
signal run0    : std_logic := '0';   -- DMAC desc. #0 running status
signal run1    : std_logic := '0';   -- DMAC desc. #1 running status
signal adrerr0 : std_logic := '0';   -- DMAC desc. #0 adrs. error status
signal adrerr1 : std_logic := '0';   -- DMAC desc. #1 adrs. error status
signal daterr0 : std_logic := '0';   -- DMAC desc. #0 data error status
signal daterr1 : std_logic := '0';   -- DMAC desc. #1 data error status
signal err1    : std_logic := '0';   -- DMAC desc. #1 error status
signal err0    : std_logic := '0';   -- DMAC desc. #0 error status
signal ovlerr0 : std_logic := '0';   -- DMAC desc. #0 overlapping readout error status
signal ovlerr1 : std_logic := '0';   -- DMAC desc. #1 overlapping readout error status
signal init0   : std_logic := '0';   -- DMAC desc. #0 go flag
signal init1   : std_logic := '0';   -- DMAC desc. #1 go flag

signal pausen  : std_logic := '0';      -- pause counter enable
signal pauscnt : unsigned(3 downto 0);  -- pause counter 

signal bcnt    : unsigned(7 downto 0);  -- ebone burst size counter 
signal bcld    : std_logic := '0';      -- ebone burst counter load
signal bcen    : std_logic := '0';      -- ebone burst counter enable
signal bcazero : std_logic := '0';      -- burst counter almost zero flag
signal bczero  : std_logic := '0';      -- burst counter zero flag

signal fcnt    : unsigned(11 downto 0); -- fifo size counter 
signal fcld    : std_logic := '0';      -- fifo counter load
signal fcen    : std_logic := '0';      -- fifo counter enable
signal fczero  : std_logic := '0';      -- fifo counter zero flag
signal fifo    : std_logic := '0';      -- fifo memory type selector
signal mif     : std_logic := '0';      -- MIF i/f type selector
signal mafif   : std_logic_vector(27 downto 0); -- fifo E-bone offset

signal damsw   : std32;                 -- dest. address MSWord
signal dabase  : unsigned(31 downto 0); -- dest. address origin
signal daburst : unsigned(31 downto 0); -- dest. address current burst
signal dacnt   : unsigned(23 downto 0); -- dest. counter
signal dactop  : unsigned(dacnt'RANGE); -- count max.
signal remcnt  : unsigned(23 downto 0); -- remaining count to move
signal remsmall: std_logic;             -- remaining small burst

signal dma0_sts: std_logic_vector(dacnt'RANGE); -- count status
signal dma1_sts: std_logic_vector(dacnt'RANGE); -- count status

signal daclr   : std_logic := '0';      -- dest. counter clear
signal daen    : std_logic := '0';      -- dest. counter enable
signal daendall: std_logic := '0';      -- dest. end flag
signal daendm1 : std_logic := '0';      -- dest. end flag minus 1
signal daendm2 : std_logic := '0';      -- dest. end flag minus 2
signal daendm3 : std_logic := '0';      -- dest. end flag minus 3

signal dbld    : std_logic := '0';      -- dest. address cur. burst load
signal mald    : std_logic := '0';      -- mem. address counter load
signal maen    : std_logic := '0';      -- mem. address counter enable
signal macnt   : unsigned(27 downto 0); -- mem. address counter 
signal maseg   : std_logic_vector(3 downto 0); -- mem. addrs segment 

alias dma0_go   : std_logic is dma_regs_i(5)(31);
alias dma0_link : std_logic is dma_regs_i(5)(30);
alias dma0_abrt : std_logic is dma_regs_i(5)(29);
alias dma0_flush: std_logic is dma_regs_i(5)(28);
alias dma0_fifo : std_logic is dma_regs_i(5)(27);
alias dma0_mif  : std_logic is dma_regs_i(5)(26);
alias dma1_go   : std_logic is dma_regs_i(5+6)(31);
alias dma1_link : std_logic is dma_regs_i(5+6)(30);
alias dma1_abrt : std_logic is dma_regs_i(5+6)(29);
alias dma1_flush: std_logic is dma_regs_i(5+6)(28);
alias dma1_fifo : std_logic is dma_regs_i(5+6)(27);
alias dma1_mif  : std_logic is dma_regs_i(5+6)(26);
alias pausok    : std_logic is pauscnt(pauscnt'HIGH); -- pause counter overflow

------------------------------------------------------------------------
begin
------------------------------------------------------------------------

-- E-bone FT drivers
--------------------
damsw  <=      dma_regs_i(4) when run0 = '1' -- dest. adrs MSW
          else dma_regs_i(4+6);


ft32: if EBFT_DW32=1 generate -- 32 bit width
   ftw_stat    <= "0000";
   ftd32       <= '1';
   dat_lsw     <=      std_logic_vector(daburst) when alsw = '1' 
                  else mx_dout_i;
   eb_ft_dxt_o <=      damsw when ebadrs = '1' 
                  else dat_lsw;
end generate;

ft64: if EBFT_DW32=2 generate -- 64 bit width
   ftw_stat    <= "0001";
   ftd32       <= '0';
   dat_lsw     <=      std_logic_vector(daburst) when ebadrs = '1' 
                  else mx_dout_i(31 downto 0);
   dat_msw     <=      damsw when ebadrs = '1' 
                  else mx_dout_i(63 downto 32);
   eb_ft_dxt_o <= dat_msw & dat_lsw;
end generate;

ftx: if EBFT_DW32>3 generate -- 128 bit (and more) width
   ftw_stat    <= to_unsigned(Nlog2(EBFT_DW32), 4);
   ftd32       <= '0';
   dat_lsw     <=      std_logic_vector(daburst) when ebadrs = '1' 
                  else mx_dout_i(31 downto 0);
   dat_msw     <=      damsw when ebadrs = '1' 
                  else mx_dout_i(63 downto 32);
   eb_ft_dxt_o <= mx_dout_i(EBFT_DWIDTH-1 downto 64) & dat_msw & dat_lsw;
end generate;

eb_ft_brq_o <= ebft;

-- E-bone FT FSM
-------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if eb_rst_i = '1' then
         ebft    <= '0';       
         ebbc    <= '0';       
         ebadrs  <= '0';       
         run0    <= '0';       
         run1    <= '0';       
         adrerr0 <= '0';       
         adrerr1 <= '0';       
         daterr0 <= '0';       
         daterr1 <= '0';       
         err0    <= '0';       
         err1    <= '0';       
         ovlerr0 <= '0';       
         ovlerr1 <= '0';       
         fifo    <= '0';       
         mif     <= '0';       
         state   <= iddle;
      else
         ebft    <= (ebrq OR ebft)      -- elementary burst on 
                    AND NOT ebeof;   
         ebbc    <= (irq OR ebbc)       -- broad-cast phase  
                    AND NOT irqend;     
         ebadrs  <= (bcld OR ebadrs)    -- burst addressing phase     
                    AND NOT ebdat;   
         run0    <= (init0 OR run0)     -- composite burst running  
                    AND NOT dmadone;   
         run1    <= (init1 OR run1)     -- composite burst running  
                    AND NOT dmadone;
         adrerr0 <= ((adrerr AND run0) OR adrerr0)
                    AND NOT daclr;
         adrerr1 <= ((adrerr AND run1) OR adrerr1)
                    AND NOT daclr;
         daterr0 <= ((daterr AND run0) OR daterr0)
                    AND NOT daclr;
         daterr1 <= ((daterr AND run1) OR daterr1)
                    AND NOT daclr;
         err0    <= ((errdone AND run0) OR err0)
                    AND NOT daclr;
         err1    <= ((errdone AND run1) OR err1)
                    AND NOT daclr;
         ovlerr0  <= ((ovlerr AND run0) OR ovlerr0)
                    AND NOT daclr;
         ovlerr1  <= ((ovlerr AND run1) OR ovlerr1)
                    AND NOT daclr;
         fifo    <= (((init0 AND dma0_fifo) OR (init1 AND dma1_fifo)) OR fifo)  
                    AND NOT dmadone;   
         mif     <= (((init0 AND dma0_mif) OR (init1 AND dma1_mif)) OR mif)  
                    AND NOT dmadone;   
        state    <= nextate;            
      end if;
   end if;
end process;

process(state, ftd32, dma0_go, dma1_go, dma0_link, dma1_link, dma0_abrt, dma1_abrt, dma0_flush, dma1_flush,
               cmd_go_i, cmd_flush_i, cmd_abort_i, cmd_reset_i,
               run0, run1, fifo, mif, fif_rdy, fif_empty,
               bcazero, bczero, fczero, daendm2, daendm3, daendm1, daendall, pausok,
               eb_bmx_i, eb_bft_i, eb_dk_i, eb_err_i,
               mx_bg_i, mx_ardy_i, mx_rdy_i, mx_err_i)
begin
   nextate <= state; -- stay in same state
   alsw    <= '0';
   init0   <= '0';
   init1   <= '0';
   ebrq    <= '0';
   ebdat   <= '0';
   ebeof   <= '0';
   bcld    <= '0';
   bcen    <= '0';
   fcld    <= '0';
   fcen    <= '0';
   daclr   <= '0';
   dbld    <= '0';
   daen    <= '0';
   mald    <= '0';
   maen    <= '0';
   irq     <= '0';
   irqend  <= '0';
   dmadone <= '0';
   errdone <= '0';
   adrerr  <= '0';
   daterr  <= '0';
   ovlerr  <= '0';
   pausen  <= '0';
   mx_brq_o  <= '0';
   mx_bwr_o  <= '0';
   mx_clr_o  <= '0';
   mx_rst_o  <= '0';
   mx_read_o <= '0';
   mx_aend_o <= '0';
   mx_end_o  <= '0';
   mx_abrt_o <= '0';

   eb_ft_as_o  <= '0';
   eb_ft_aef_o <= '0';
   eb_ft_eof_o <= '0';

   case state is 
      when iddle =>                -- sleeping
         if cmd_reset_i = '1' then 
            nextate <= rst1;
         elsif dma0_go  = '1' OR 
               cmd_go_i = '1' then
            nextate <= wait0;
         end if;

      when wait0 =>                -- waiting for descriptor #0
         if dma0_abrt   = '1' OR
            cmd_abort_i = '1' then
            nextate <= abrt1;
         elsif dma0_go  = '1' OR 
               cmd_go_i = '1' then
            init0   <= '1';
            nextate <= wait2;
         end if;

      when wait1 =>                -- waiting for descriptor #1
         if dma1_abrt = '1' then
            nextate <= abrt1;
         elsif dma1_go  = '1' then
            init1   <= '1';
            nextate <= wait2;
         end if;

      when wait2 =>                -- start new DMA descriptor 
         fcld    <= '1';           -- reload FIFO burst size
         daclr   <= '1';           -- clear moved word count
         mald    <= '1';           -- store source address
         if mif = '1' then
            nextate <= wait3;
         elsif fifo = '1' then
            nextate <= wait9;
         else
            nextate <= brq1;
         end if;

      when wait3 =>                -- MIF address depends on macnt
         fcld    <= '1';           -- reload it (now macnt is ok)
         nextate <= wait4;

      when wait4 =>                -- MIF initialization request
         mx_bwr_o  <= '1';         -- for writing
         if mx_err_i = '1' then
            adrerr  <= '1';
            nextate <= abrt1;
         elsif mx_rdy_i = '1' then
            nextate <= wait9;
         end if;

      when wait9 =>                -- waiting for FIFO ready
         if dma0_abrt = '1' OR 
            dma1_abrt = '1' OR
            cmd_abort_i = '1' then
            nextate <= abrt1;
         elsif fif_rdy = '1' OR
            dma0_flush = '1' OR
            dma1_flush = '1' OR
            cmd_flush_i = '1' then
            nextate <= brq1;
         end if;

      when brq1 =>                 -- start new payload burst 
         bcld    <= '1';
         nextate <= brq2;

      when brq2 =>                 -- wait for dest. E-bone NOT busy
         dbld    <= '1';           -- load dest. adrs for this burst
         if eb_bmx_i = '0' then   
            ebrq <= '1';           -- dest. E-bone request
            mx_brq_o  <= '1';      -- source burst request starts
            nextate <= brq3;
         end if;

      when brq3 =>                 -- check for both E-bones granted
         mx_brq_o   <= '1';        -- source burst request continues
         if eb_bft_i = '1' AND     -- granted 
            mx_bg_i = '1' then   
            eb_ft_as_o <= '1';     -- FT addressing phase starts
            nextate <= adr1;
         else
            ebeof   <= '1';
            nextate <= brq9;       -- not granted, give up for now
         end if;

      when brq9 =>                 -- delay a while
         mx_abrt_o <= '1';
         pausen  <= '1';
         if pausok = '1' then
            nextate  <= brq1;
         end if;

      when adr1 =>                 -- check for FT slave ready
         eb_ft_as_o <= '1';        -- FT addressing phase 2nd clock
         if eb_err_i = '1' then 
            if eb_dk_i = '1' then 
               ebeof   <= '1';
               nextate <= brq9;    -- retry
            else
               adrerr  <= '1';
               nextate <= abrt1;   -- fatal error
            end if;

         elsif eb_dk_i = '1' then  -- dest. ready
            mx_read_o <= '1';      -- ask for data
            nextate <= adr2; 
         end if;

      when adr2 =>                 -- wait for source ready
         eb_ft_as_o <= '1';        -- extend addressing phase
         mx_read_o  <= '1';        -- ask for data

         if mx_ardy_i = '1' AND    -- source soon OK
            daendm1   = '1' then   -- remaining single data
            mx_aend_o    <= '1';
         end if;

         if eb_err_i = '1' OR
            mx_err_i = '1' then 
            adrerr  <= '1';
            nextate <= abrt1;      -- fatal error

         elsif ftd32 = '1' then
            if mx_ardy_i = '1' then-- source soon OK 
               ebdat   <= '1';     -- switch to data phase
               nextate <= adr3; 
            end if;

         elsif mx_rdy_i = '1' then  -- source OK
            ebdat   <= '1';
            bcen    <= '1';
            fcen    <= '1'; 
            daen    <= '1';
            maen    <= '1';  
            if daendm1 = '1' then   -- remaining single data        
               mx_end_o    <= '1';
               eb_ft_aef_o <= '1';  -- FT almost end of frame
               nextate <= dat01;
            elsif daendm2 = '1' then -- remaining 2 data        
               mx_aend_o   <= '1';
               nextate <= dat1;
            else 
               nextate <= dat1;      -- more data follow
            end if;
         end if;

      when adr3 =>  
         alsw    <= '1'; -- 32bit: put dest addrs. LSW as 1st data
         ebdat   <= '1';
         bcen    <= '1';
         fcen    <= '1'; 
         daen    <= '1';
         maen    <= '1';            
         if daendm1 = '1' then     -- remaining single data        
            mx_end_o    <= '1';
            eb_ft_aef_o <= '1';    -- FT almost end of frame
            nextate <= dat01;
         elsif daendm2 = '1' then  -- remaining 2 data        
            mx_aend_o   <= '1';
         end if;
         nextate <= dat1; 

      when dat01 =>                -- single data 
         bcen    <= '1';
         fcen    <= '1'; 
         daen    <= '1';
         maen    <= '1';            
         eb_ft_eof_o <= '1';       -- FT end of frame
         ebeof   <= '1';           -- FT bus release
         nextate <= end2; 

      when dat1 =>                 -- data phase
         bcen    <= '1';
         fcen    <= '1'; 
         daen    <= '1';
         maen    <= '1';            
         if eb_err_i = '1' OR      -- abort on any error
            eb_dk_i  = '0' OR 
            mx_err_i = '1' then 
            daterr  <= '1';
            nextate <= abrt1;
         elsif bczero  = '1' OR    -- payload burst done
               daendm2 = '1' then  -- short burst done
            mx_end_o  <= '1';
            eb_ft_aef_o <= '1';    -- FT almost end of frame
            nextate <= dat2; 
         elsif (fifo = '1' AND fif_empty = '1') then 
            if dma0_flush = '1' OR dma1_flush = '1' OR cmd_flush_i = '1' then -- flushing out 
               mx_end_o  <= '1';
               eb_ft_aef_o <= '1'; -- FT almost end of frame
               nextate <= dat2; 
            else                   -- overlapping error?
               mx_end_o  <= '1';
               eb_ft_aef_o <= '1'; -- FT almost end of frame
               nextate <= dat11;
            end if;
         elsif bcazero = '1' OR 
               daendm3 = '1' then  -- payload burst almost done
            mx_aend_o  <= '1';  
         end if;

      when dat11 =>                -- overlapping error pipeline flushing out
         eb_ft_eof_o <= '1';       -- FT end of frame
         ovlerr  <= '1';
         nextate <= abrt1;   

      when dat2 =>                 -- pipeline flushing out
         eb_ft_eof_o <= '1';       -- FT end of frame
         ebeof   <= '1';           -- FT bus release
         nextate <= end1;          -- note: daendall not yet valid   

      when end1 =>                 -- E-bone burst end
         if daendall = '1' then    -- DMAC descriptor done
            nextate <= end2;      
         elsif fifo = '1' AND fczero = '1' then -- FIFO composite burst done
            fcld    <= '1';        -- relaoad FIFO burst size
            if mif = '1' then
               nextate <= wait3;   -- loop back to MIF request
            else
               nextate <= wait9;   -- loop back waiting for FIFO ready
            end if;
         elsif fifo = '1' AND 
               (dma0_flush = '1' OR dma1_flush = '1' OR cmd_flush_i = '1') then -- flushing out 
            nextate <= end2;      
         else   
            bcld    <= '1';
            nextate <= brq2;       -- loop back to next payload burst
         end if;

      when end2 =>                 -- Descriptor end
         irq      <= '1';          -- prepare for broadcasting
         if mif = '1' then
            mx_bwr_o <= '1';       -- for writing
            mx_clr_o <= '1';       -- end of message
            if mx_err_i = '1' then
               adrerr  <= '1';
               nextate <= abrt1;
            elsif mx_rdy_i = '1' then
               nextate <= bc1;
            end if;
         else
            nextate  <= bc1;      
         end if;

      when bc1 =>                  -- wait for E-bone NOT busy
         if eb_bmx_i = '0' then   
            ebrq <= '1';           -- E-bone request
            nextate <= bc2;
         end if;

      when bc2 =>                  -- wait for E-bone granted
         if eb_bft_i = '1' then   
            eb_ft_as_o <= '1';     -- broad-cast 1st clock
            eb_ft_eof_o <= '1';
            nextate <= bc4;        -- granted 
         else
            ebeof   <= '1';
            nextate <= bc3;        -- not granted
         end if;

      when bc3 =>                  -- give up for now
         nextate <= bc1;

      when bc4 =>                  -- broad-cast 2nd clock
         eb_ft_as_o  <= '1'; 
         eb_ft_eof_o <= '1';
         irqend  <= '1';
         ebeof   <= '1';
         dmadone <= '1';           -- clear the GO bit
         if    run0 = '1' AND
               dma0_link = '1'then
            nextate <= wait1;      -- switch to descriptor #1    
         elsif run1 = '1' AND
               dma1_link = '1'then
            nextate <= wait0;      -- switch to descriptor #0    
         else  
            nextate <= bc5;        -- all done     
         end if;

      when bc5 =>                  -- delay until GO bit cleared
         nextate <= bc6;

      when bc6 =>                  -- delay until GO bit cleared
         nextate <= iddle;

      when abrt1 =>                -- quit on error
         ebeof   <= '1';
         dmadone <= '1';
         errdone <= '1';
         mx_abrt_o <= '1';
         nextate <= abrt2;

      when abrt2 =>                -- make sure 2nd E-bone gives up
         mx_abrt_o <= '1';
         if dma0_abrt = '1' OR dma1_abrt = '1' then 
            nextate <= abrt3;      -- software abort, do NOT broad-cast
         else
            nextate <= bc1;
         end if;

      when abrt3 =>                -- wait until descriptor updated
         if mif = '1' then         -- close message channel
            mx_bwr_o <= '1';       -- for writing
            mx_clr_o <= '1';       -- end of message
            if mx_err_i = '1' OR mx_rdy_i = '1' then
               nextate <= iddle;
            end if;
         else
            nextate <= iddle;
         end if;

      when rst1 =>                 -- MIF reset command
         if dma0_mif = '1' then 
            init0 <= '1';          -- select descriptor #0
            nextate <= rst2;
         else
            nextate <= iddle;      -- NOT MIF, so ignore it
         end if;

      when rst2 =>                 -- MIF reset command
         mx_bwr_o <= '1';          -- for writing
         mx_rst_o <= '1';          -- reset request
         if mx_err_i = '1' OR mx_rdy_i = '1' then
            dmadone <= '1';        -- clear running status
            nextate <= rst3;
         end if;

      when rst3 =>    
         nextate <= iddle; 

   end case;

end process;

-- Pause generator (before retrying)
------------------------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if bcld = '1' then
         pauscnt <= (others => '0');
      elsif pausen = '1' then
         pauscnt <= pauscnt + 1;
      end if;
   end if;
end process;

-- E-bone FT burst counter
--------------------------
process	(eb_clk_i, dma_regs_i)
variable pldft : std_logic_vector(7 downto 0);
begin
-- Payload size in bytes is tranlated to FT words
   pldft  := dma_regs_i(12)(EBFT_DWLOG+1+7 downto EBFT_DWLOG+1); 
   if rising_edge(eb_clk_i) then
      if bcld = '1' then 
         bcnt <= unsigned(pldft); -- payload size
      elsif bcen = '1' then
         bcnt <= bcnt - 1; 
      end if;
   end if;
end process;
bcazero <= '1' when bcnt = "00000010" else '0'; -- almost end flag
bczero  <= '1' when bcnt = "00000001" else '0'; -- end flag

-- FIFO burst counter
---------------------
process	(eb_clk_i)
variable tmp0 : std_logic_vector(23 downto 0);
variable tmp1 : std_logic_vector(23 downto 0);
begin
   if rising_edge(eb_clk_i) then
      tmp0 := "000000000000" & dma_regs_i(0)(27 downto 16);
      tmp1 := "000000000000" & dma_regs_i(0+6)(27 downto 16);

      remsmall <= '0'; 
      if run0 = '1' then 
         if remcnt < unsigned(tmp0) then 
            remsmall <= '1'; -- last burst is smaller than FIFO size
         end if;
      else
         if remcnt < unsigned(tmp1) then 
            remsmall <= '1'; -- last burst is smaller than FIFO size
         end if;
      end if;

      if fcld = '1' then     -- load fifo readout depth (MSbits are MIF fifo management tag)
         if run0 = '1' then 
            if remsmall = '1' then -- last burst is smaller than FIFO size
               fcnt        <= remcnt(11 downto 0); 
               mif_count_o <= dma_regs_i(0)(31 downto 28) & std_logic_vector(remcnt(11 downto 0));
            else
               fcnt        <= unsigned(dma_regs_i(0)(27 downto 16));
               mif_count_o <= dma_regs_i(0)(31 downto 16); 
            end if;

         else
            if remsmall = '1' then -- last burst is smaller than FIFO size
               fcnt        <= remcnt(11 downto 0); 
               mif_count_o <= dma_regs_i(0+6)(31 downto 28) & std_logic_vector(remcnt(11 downto 0));
            else
               fcnt        <= unsigned(dma_regs_i(0+6)(27 downto 16));
               mif_count_o <= dma_regs_i(0+6)(31 downto 16); 
            end if;
         end if;

      elsif fcen = '1' then
         fcnt <= fcnt - 1; -- running
      end if;

      if fcnt = "000000000000" then
         fczero <= '1';
      else
         fczero <= '0';
      end if;

   end if;
end process;

-- Initialize static parameters from new descriptor
---------------------------------------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if mald = '1' then
         if fifo = '1' then 
            maseg <= "0001"; -- force segment #1
            if run0 = '1' then 
               mafif <= "000000000000" & dma_regs_i(0)(15 downto 0);
            else
               mafif <= "000000000000" & dma_regs_i(0+6)(15 downto 0);
            end if;
         else
            if run0 = '1' then 
               maseg <= "00" & dma_regs_i(0)(29 downto 28);   -- memory segment 
            else
               maseg <= "00" & dma_regs_i(0+6)(29 downto 28); -- memory segment 
            end if;
         end if;
      end if;
   end if;
end process;

-- Source address counter
-------------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if mald = '1' then     -- load source offset

         if run0 = '1' then 
            if mif = '1' then
               macnt <= unsigned(dma_regs_i(1)(27 downto 0));
            else
               macnt <= unsigned(dma_regs_i(0)(27 downto 0));
            end if;
         else
            if mif = '1' then
               macnt <= unsigned(dma_regs_i(1+6)(27 downto 0));
             else
               macnt <= unsigned(dma_regs_i(0+6)(27 downto 0));
            end if;
         end if;

      elsif maen = '1' then
         macnt <= macnt + 1; -- running
      end if;

      if fcld = '1' then     -- load MIF offset
         mif_adrs_o <= "0000" & std_logic_vector(macnt); 
      end if;

   end if;
end process;

mx_adrs_o <= maseg & mafif when fifo = '1'  else 
             maseg & std_logic_vector(macnt);

-- Destination (and actual move) counter
-- and current burst dest. address
------------------------------------------------
dabase <=      unsigned(dma_regs_i(3)) when run0 = '1' 
          else unsigned(dma_regs_i(3+6)); -- address origin

dactop <=      unsigned(dma_regs_i(5)(dacnt'RANGE)) when run0 = '1' 
          else unsigned(dma_regs_i(5+6)(dacnt'RANGE)); -- address max. count

remcnt <= dactop - dacnt; -- remaining count still to be moved


process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if daclr = '1' then
         dacnt  <= (others => '0'); -- zero transmitted for now
      elsif daen = '1' then
         dacnt <= dacnt + 1;        -- running
      end if;
         
      if dbld = '1' then
         daburst <= dabase + RESIZE(dacnt * (4*EBFT_DW32), 32) ; -- dest. adrs. current burst
      end if;

      if run0 = '1' then
         dma0_sts <= std_logic_vector(dacnt); 
      end if;
       if run1 = '1' then
         dma1_sts <= std_logic_vector(dacnt); 
      end if;
  end if;
end process;

-- End of full block move detector
----------------------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if dacnt < (dactop - 3)  then
         daendm3 <= '0';
      else
         daendm3 <= '1';
      end if;

      if dacnt < (dactop - 2)  then
         daendm2 <= '0';
      else
         daendm2 <= '1';
      end if;

      if dacnt < (dactop - 1)  then
         daendm1 <= '0';
      else
         daendm1 <= '1';
      end if;

      if dacnt < dactop  then
         daendall <= '0';
      else
         daendall <= '1';
      end if;
  end if;
end process;

-- Status outputs
-----------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      fif_rdy   <= fif_ready_i;
      fif_empty <= fif_empty_i;
      dma_eot_o <= irqend;
      dma_err_o <= errdone;
   end if;
end process;

dma0_stat_o <= run0 & err0 & ovlerr0 & daterr0 & adrerr0 & "000" & dma0_sts; 
dma1_stat_o <= run1 & err1 & ovlerr1 & daterr1 & adrerr1 & "000" & dma1_sts;
dma_stat_o  <= std_logic_vector(ftw_stat) & fif_empty & fif_rdy & "00";

end rtl;
