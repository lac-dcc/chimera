--------------------------------------------------------------------------
--
-- DMA controller - Source E-bone master
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  18/10/10    herve  Preliminary release
--     1.0  11/04/11    herve  Updated to E-bone rev. 1.2
--     1.1  08/06/11    herve  FIFO(MIF) retry bug fixed
--     1.6  21/12/12    herve  Added messages, E-bone V1.3
--                             Added reset MIF command
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- DACQ E-bone master 
-- Mostly reading out data from E-bone
-- But when writing in a MIF descriptor
-------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebftm_mx is
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
   mx_brq_i     : in  std_logic;  -- burst read request command
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
end ebftm_mx;

--------------------------------------
architecture rtl of ebftm_mx is
--------------------------------------
constant GND8 : std8  := (others => '0');
constant GND16: std16 := (others => '0');
constant GNDup: std_logic_vector(EBS_DWIDTH-32-1 downto 0) := (others => '0');
constant MIF_CMD_RST : std16 := GND8 & "00001111";

type state_typ is (iddle, brq1, adr1, adr2, rd1, wr1, wr2, abrt1);
signal state, nextate : state_typ;

signal ebread  : std_logic; -- E-bone address bit 31 set = read
signal ebrq    : std_logic; -- E-bone request
signal ebmx    : std_logic; -- E-bone busy
signal ebadrs  : std_logic; -- E-bone addressing phase
signal ebdat1  : std_logic; -- E-bone 1st data write
signal ebdat2  : std_logic; -- E-bone 2nd data write (32 bit case)
signal ebeof   : std_logic; -- E-bone end of frame
signal eb_dat  : std32; 
signal mif_dat : std16; 
signal mif_cmd : std_logic; 

------------------------------------------------------------------------
begin
------------------------------------------------------------------------
-- E-bone drivers
-----------------
d64: if EBS_DWIDTH > 32 generate
   eb2_mx_dat_o <= GNDup & eb_dat;
end generate;

d32: if EBS_DWIDTH = 32 generate
   eb2_mx_dat_o <= eb_dat;
end generate;

-- BRAM read @Offset++
-- FIFO read @offset
-- MIF request write @offset 3
--------------------------------------
ebread  <= NOT mx_bwr_i; -- '1' when reading
mif_cmd <= mx_clr_i OR mx_rst_i; -- MIF command @offset 3
mif_dat <=      GND16       when mx_clr_i = '1' 
           else MIF_CMD_RST when mx_rst_i = '1' 
           else mif_count_i;

eb_dat <=      ebread & mx_adrs_i(30 downto 2) & 
               mif_cmd & mif_cmd  when ebadrs = '1'
          else mif_adrs_i         when ebdat1 = '1'
          else GND16 & mif_dat    when ebdat2 = '1'
          else (others => '0');

eb2_mx_brq_o <= ebmx;
eb2_mx_as_o  <= ebadrs;


-- E-bone master FSM
--------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if eb_rst_i = '1' then
         ebmx   <= '0';       
         state  <= iddle;
      else
         ebmx   <= (ebrq OR ebmx)     -- burst on 
                   AND NOT ebeof;   
         state  <= nextate;            
      end if;
   end if;
end process;

process(state, eb2_bmx_i, eb2_bft_i, eb2_mx_bg_i, eb2_dk_i, eb2_err_i,
               mx_brq_i, mx_bwr_i, mx_clr_i, mx_rst_i,
               mx_read_i, mx_aend_i, mx_end_i, mx_abrt_i)
begin
   nextate <= state; -- stay in same state
   ebrq    <= '0';
   ebeof   <= '0';
   ebdat1  <= '0';       
   ebdat2  <= '0';       
   ebadrs  <= '0';
   mx_bg_o   <= '0';
   mx_ardy_o <= '0';
   mx_rdy_o  <= '0';
   mx_err_o  <= '0';
   eb2_mx_eof_o <= '0';
   eb2_mx_aef_o <= '0';

   case state is 
      when iddle =>                  -- sleeping
         if mx_brq_i = '1' OR
            mx_bwr_i = '1' then      -- until burst request
            if eb2_bmx_i = '0' AND
               eb2_bft_i = '0' then  -- wait for E-bone NOT busy
               ebrq <= '1';          -- E-bone request
               nextate <= brq1;
            end if;
         end if;

      when brq1 =>                   -- check bus granted
         if eb2_mx_bg_i = '1' then
            mx_bg_o <= '1';
            nextate <= adr1;
         else                        -- DMAC will manage to retry
            ebeof   <= '1';          -- E-bone bus release
            nextate <= abrt1;        -- abort
         end if;

      when adr1 =>                   -- wait for green light
         mx_bg_o <= '1';
         if mx_abrt_i = '1' then     -- FT error or retry 
            ebeof   <= '1';          -- E-bone bus release
            nextate <= abrt1;        -- abort
         elsif mx_bwr_i  = '1' OR    -- MIF burst write
               mx_read_i = '1' then  -- FT ready for data burst
            ebadrs  <= '1';          -- addressing phase starts  
            nextate <= adr2; 
         end if;

      when adr2 =>                   -- addressing phase 
         ebadrs  <= '1';            
         if eb2_err_i = '1' OR       -- some error, retry not supported
            mx_abrt_i = '1' then     -- FT error or retry 
            ebeof   <= '1';          -- E-bone bus release
            nextate <= abrt1;        -- abort
         elsif eb2_dk_i = '1' then   -- ready for data burst
            if mx_clr_i = '1' OR mx_rst_i = '1' then
               eb2_mx_aef_o <= '1';            
               nextate <= wr2; 
            elsif mx_bwr_i = '1' then
               nextate <= wr1; 
            else
               mx_ardy_o <= '1';     -- almost ready (use for 32 bits)
               nextate <= rd1; 
            end if;
         end if;

      when wr1 =>                    -- data write MIF address
         ebdat1 <= '1'; 
         eb2_mx_aef_o <= '1';            
         nextate <= wr2; 

      when wr2 =>                    -- data write MIF count (or MIF command)
         ebdat2 <= '1'; 
         ebeof  <= '1';              -- E-bone bus release
         if eb2_dk_i  = '0' OR
            mx_abrt_i = '1' then     -- abort on error
            nextate <= abrt1;
         else
            mx_rdy_o  <= '1';
            eb2_mx_eof_o <= '1';            
            nextate <= iddle; 
         end if;

      when rd1 =>                    -- data read phase
         mx_rdy_o  <= '1';
         if eb2_dk_i  = '0' OR
            mx_abrt_i = '1' then     -- abort on error
            ebeof   <= '1';          -- E-bone bus release
            nextate <= abrt1;
         elsif mx_end_i = '1' then   -- end of burst
            eb2_mx_eof_o <= '1';            
            ebeof   <= '1';          -- E-bone bus release
            nextate <= iddle;        -- burst done
         elsif mx_aend_i = '1' then  -- almost end of burst
            eb2_mx_aef_o <= '1';            
         end if;

      when abrt1 =>                  -- quit on error
         mx_err_o  <= '1';
         if mx_brq_i  = '0' AND
            mx_bwr_i  = '0' AND
            mx_read_i = '0' then     -- wait on error acknowledge
            nextate <= iddle;
         end if;

   end case;

end process;

-- Data pipeline for helping P&R
--------------------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      mx_dout_o <= eb2_dat_i;
   end if;
end process;

-- E-bone extension message management
--------------------------------------
ebx2_msg_set_o <= "0000" & std_logic_vector(to_unsigned(EBX_MSG_MID, 4)) 
                  when ebadrs = '1' AND mx_clr_i = '0'
                  else GND8;

end rtl;
