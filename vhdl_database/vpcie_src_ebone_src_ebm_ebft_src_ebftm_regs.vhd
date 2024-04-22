--------------------------------------------------------------------------
--
-- DMA controller - slave registers i/f
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  18/10/10    herve  Preliminary release
--     1.0  11/04/11    herve  Updated to E-bone rev. 1.2
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- E-bone slave registers stack for E-bone bridge control
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebftm_regs is
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
end ebftm_regs;

--------------------------------------
architecture rtl of ebftm_regs is
--------------------------------------

constant REGS_RG   : natural := Nlog2(EBS_AD_SIZE); -- offset up range (MSbit is overflow)
constant UPRANGE   : natural := REGS_RG-1; 
subtype dma_regs_typ is std32_a(EBS_RW_SIZE-1 downto 0);
type state_typ is (iddle, adrs, wr1, rd1, bcc1, abort);

signal state, nextate : state_typ;
signal dk        : std_logic := '0'; -- slave addrs & data acknowledge
signal s_dk      : std_logic := '0'; -- acknowledge registered
signal oerr      : std_logic := '0'; -- offset error
signal myself    : std_logic := '0'; -- slave selected
signal eof       : std_logic := '0'; -- slave end of frame
signal load      : std_logic := '0'; -- register stack load
signal ofld      : std_logic := '0'; -- offset counter load
signal ofen      : std_logic := '0'; -- offset counter enable
signal ofst      : unsigned(REGS_RG downto 0); -- offset counter in burst
signal regs      : dma_regs_typ := (others => (others => '0'));
signal rmux      : std32;
signal dma0_done : std_logic; -- DMA done flag
signal dma0_rund : std_logic; -- DMA running delayed
signal dma1_done : std_logic; -- DMA done flag
signal dma1_rund : std_logic; -- DMA running delayed

alias eb_bar  : std_logic_vector(1 downto 0) 
                is eb_dat_i(29 downto 28); 
alias eb_amsb : std_logic_vector(EBS_AD_RNGE-1 downto UPRANGE+1) 
                is eb_dat_i(EBS_AD_RNGE-1 downto UPRANGE+1);
alias dma0_run: std_logic is dma0_stat_i(31);
alias dma1_run: std_logic is dma1_stat_i(31);

------------------------------------------------------------------------
begin
------------------------------------------------------------------------
-- E-bone slave FSM
-------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if eb_rst_i = '1' then
         state  <= iddle;
         myself <= '0';  
      else
         myself <= (ofld OR myself)       -- set and lock
                   AND NOT (eof OR oerr); -- clear
         state  <= nextate;
      end if;
   end if;
end process;

process(state, eb_bmx_i, eb_as_i, eb_eof_i, eb_dat_i, eb_bar, eb_amsb)
variable base   : std_logic_vector(1 downto 0);
variable bofst  : std_logic_vector(EBS_AD_RNGE-1 downto 0);
begin
   base  := std_logic_vector(to_unsigned(EBS_AD_BASE, 2));
   bofst := std_logic_vector(to_unsigned(EBS_AD_OFST, EBS_AD_RNGE));
   nextate <= state; -- stay in same state
   load    <= '0';
   ofld    <= '0';
   ofen    <= '0';
   dk      <= '0';
   eof     <= '0';

   case state is 
      when iddle =>                    -- sleeping
         if    eb_bmx_i = '1'          -- burst start
           AND eb_as_i = '1' then      -- adrs
            if eb_eof_i = '1' then     -- broad-cast/call
               nextate <= bcc1;

            elsif (eb_bar  = base      -- plain adressing
                  AND eb_amsb = bofst(EBS_AD_RNGE-1 downto UPRANGE+1)) then
               ofld    <= '1';         -- store offset
               dk      <= '1';         -- slave addrs ack
               nextate <= adrs;
            end if;
         end if;

      when adrs =>                     -- pipelined slave addrs ack (routing help)
            dk  <= '1';                -- early ack burst
            if eb_dat_i(31) = '1' then -- read or write?
               ofen  <= '1';           -- pipeline early init
               nextate <= rd1;
            else
               nextate <= wr1;
            end if;

      when wr1 =>                     -- burst write
         if eb_bmx_i = '0' then       -- abort
            nextate <= abort;
         else                         -- wait until addressing done
            dk   <= NOT eb_eof_i;     -- ack continues till end of burst

            if  eb_as_i = '0' then    -- store data
               load  <= '1';
               ofen  <= '1';
               if eb_eof_i = '1' then
                  eof <= '1';
                  nextate <= iddle;
               end if;
            end if;
         end if;

      when rd1 =>                     -- burst read
         if eb_bmx_i = '0' then       -- abort
            nextate <= abort;
         else   
            dk   <= NOT eb_eof_i;     -- ack continues till end of burst
            if eb_eof_i = '1' then
               eof <= '1';
               nextate <= iddle;
            else
               ofen  <= '1';
            end if;
         end if;

      when bcc1 =>                    -- wait until bus released
         if eb_bmx_i = '0' then       
            nextate <= abort;
         elsif eb_eof_i = '1' then
            eof <= '1';
            nextate <= iddle;
         end if;

      when abort =>                   -- quit on abort
         eof <= '1';
         nextate <= iddle;

   end case;

end process;

-- Offset counter
-----------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if ofld = '1' then      -- offset load
         ofst <= unsigned(eb_dat_i(REGS_RG downto 0));
      elsif ofen = '1' then
            ofst <= ofst + 1; -- increment
      end if;
   end if;
end process;

oerr <= ofst(REGS_RG) AND ofen; -- count overflow

-- End of run detector
----------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      dma0_rund <= dma0_run;
      dma0_done <= eb_rst_i OR
                   (dma0_rund AND NOT dma0_run); -- running falling edge
      dma1_rund <= dma1_run;
      dma1_done <= eb_rst_i OR
                   (dma1_rund AND NOT dma1_run); -- running falling edge
   end if;
end process;

-- Register stack writing in
----------------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if load = '1' then
         for i in EBS_RW_SIZE-1 downto 0 loop 
            if to_integer(ofst) = i then
               regs(i) <= eb_dat_i;
            end if;
         end loop;
      end if;

      if dma0_done = '1' then -- self clear the go bit
         regs(5)(31) <= '0';
      end if;
      if dma1_done = '1' then -- self clear the go bit
         regs(5+6)(31) <= '0';
      end if;
   end if;
end process;
dma_regs_o <= regs; -- internal to port

-- Registered output multiplexor
--------------------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      for i in EBS_RW_SIZE-2 downto 0 loop       -- R/W reg.
         if to_integer(ofst) = i then
            rmux <= regs(i);
         end if;
      end loop;

      if to_integer(ofst) = EBS_AD_SIZE-3 then   -- MSB=Status/LSW=R/W
         rmux <= dma_stat_i & regs(EBS_AD_SIZE-3)(23 downto 0);
      end if;

      if to_integer(ofst) = EBS_AD_SIZE-2 then   -- #0 Status read only
         rmux <= dma0_stat_i;
      end if;

      if to_integer(ofst) = EBS_AD_SIZE-1 then   -- #1 Status read only
         rmux <= dma1_stat_i;
      end if;

   end if;
end process;

-- E-bone slave drivers
-----------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      s_dk  <= dk AND NOT oerr;
   end if;
end process;

eb_err_o <= '0';
eb_dk_o  <= s_dk  when myself = '1' else '0';
eb_dat_o <= rmux  when myself = '1' else (others =>'0');

end rtl;

