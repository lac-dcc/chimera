--------------------------------------------------------------------------
--
-- E-bone - BRAM interface
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
-- BRAM COREGEN option: registered output
-- IRQ : none
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebs_bram is
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
end ebs_bram;

--------------------------------------
architecture rtl of ebs_bram is
--------------------------------------
constant UPRANGE : natural := NLog2(EBS_AD_SIZE)-1;
constant OK_SIZE : natural := 2**(UPRANGE+1);
constant GNDUPA  : std_logic_vector(30 downto UPRANGE+1) := (others => '0');

type state_typ is (iddle, wr1, rd0, rd1, bcc1, abort, error);
signal state, nextate : state_typ;
signal adk       : std_logic := '0'; -- slave addrs & data acknowledge
signal s_dk      : std_logic := '0'; -- slave data acknowledge
signal ovf_err   : std_logic := '0'; -- offset overflow error
signal rw_err    : std_logic := '0'; -- read (empty) or write(full) error
signal fif_err   : std_logic := '0'; -- early fifo error 
signal myself    : std_logic := '0'; -- slave selected
signal eof       : std_logic := '0'; -- slave end of frame
signal ofld      : std_logic := '0'; -- offset counter load
signal ofen      : std_logic := '0'; -- offset counter enable
signal ovfl      : std_logic := '0'; -- offset overflow
signal ofst      : unsigned(UPRANGE+1 downto 0); -- offset counter in burst
signal emti1     : std_logic ; -- empty status delayed
signal emti2     : std_logic ; -- empty status delayed
signal mem_rd_j  : std_logic ; -- internal
alias eb_bar  : std_logic_vector(1 downto 0) 
                is eb_dat_i(29 downto 28); 
alias eb_amsb : std_logic_vector(EBS_AD_RNGE-1 downto UPRANGE+1) 
                is eb_dat_i(EBS_AD_RNGE-1 downto UPRANGE+1);
------------------------------------------------------------------------
begin
------------------------------------------------------------------------

assert EBS_AD_SIZE mod 4 = 0 
       report "EBS_AD_SIZE must be multiple of 4!" severity failure;
assert EBS_AD_SIZE = OK_SIZE
       report "EBS_AD_SIZE must be power of 2" severity failure;
assert EBS_AD_OFST mod OK_SIZE = 0 
       report "EBS_AD_OFST invalid boundary!" severity failure;

-- E-bone slave FSM
-------------------
process	(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      if eb_rst_i = '1' then
         state  <= iddle;
         myself <= '0';  
      else
         myself <= (ofld OR myself)                      -- set and lock
                   AND NOT (eof OR (ovf_err OR rw_err)); -- clear
         state  <= nextate;
      end if;
   end if;
end process;

process(state, eb_bmx_i, eb_as_i, eb_aef_i, eb_eof_i, eb_dat_i, eb_bar, eb_amsb,
               emti2, mem_full_i)
variable base   : std_logic_vector(1 downto 0);
variable bofst  : std_logic_vector(EBS_AD_RNGE-1 downto 0);
begin
   base  := std_logic_vector(to_unsigned(EBS_AD_BASE, 2));
   bofst := std_logic_vector(to_unsigned(EBS_AD_OFST, EBS_AD_RNGE));
   nextate <= state; -- stay in same state
   ofld    <= '0';
   ofen    <= '0';
   adk     <= '0';
   eof     <= '0';
   mem_wr_o <= '0';   
   mem_rd_j <= '0';
   rw_err   <= '0'; 
   fif_err  <= '0'; 

   case state is 
      when iddle =>                    -- sleeping
         if    eb_bmx_i = '1'          -- burst start
           AND eb_as_i = '1' then      -- adrs
            if eb_eof_i = '1' then     -- broad-cast/call
               nextate <= bcc1;

            elsif (eb_bar  = base      -- plain adressing
                  AND eb_amsb = bofst(EBS_AD_RNGE-1 downto UPRANGE+1)) then
               ofld    <= '1';         -- store offset
               if eb_dat_i(31) = '1' then -- read or write?
                  nextate  <= rd0;
               else
                  if mem_full_i = '1' then
                     fif_err <= '1';   -- early error, don't ack
                     nextate <= error;
                  else
                     adk     <= '1';   -- write early addrs ack
                     nextate <= wr1;
                  end if;
               end if;
            end if;
         end if;

      when wr1 =>                    -- burst write
         if eb_bmx_i = '0' then      -- abort
            nextate <= abort;

         else                        -- wait until addressing done
            adk  <= NOT eb_eof_i;    -- ack continues till end of burst

            if  eb_as_i = '0' then   -- store data
               mem_wr_o <= '1';
               ofen  <= '1';
               if eb_eof_i = '1' then
                  eof <= '1';
                  nextate <= iddle;
               elsif mem_full_i = '1' then -- full FIFO
                  rw_err <= '1';     -- stop acknowledge
               end if;
            end if;
         end if;

      when rd0 =>                    -- 1st read 
         if emti2 = '1' then
            fif_err <= '1';          -- early error, don't ack
            nextate <= error;
         else
            ofen  <= '1';            -- pipeline start
            adk   <= '1';            -- addrs ack
            mem_rd_j <= '1';
            nextate  <= rd1;
         end if;

      when rd1 =>                    -- burst read 
         if eb_bmx_i = '0' then      -- abort
            nextate <= abort;
         else                        -- read data
            ofen  <= '1';
            if eb_eof_i = '1' then
               eof <= '1';
               nextate <= iddle;
            elsif emti2 = '1' then   -- empty FIFO
               rw_err <= '1';        -- stop acknowledge
            else
               adk <= '1';           -- data ack
               if eb_aef_i = '0' then-- check when 2-stage pipeline stops
                  mem_rd_j <= '1';
               end if;
            end if;
         end if;

     when bcc1 =>                    -- broad-cast/call
         if eb_bmx_i = '0' then       
            nextate <= abort;
         elsif eb_eof_i = '1' then
            eof <= '1';
            nextate <= iddle;
         end if;

      when error =>                  -- early FIFO error in addressing phase
         if eb_bmx_i = '1' then      -- wait for end of burst 
            fif_err <= '1';          -- asking for retry
         else
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
      emti1 <= mem_empty_i;   -- empty status delayed
      emti2 <= emti1;         -- empty status delayed

      ovf_err <= '0';
      if ofld = '1' then      -- offset load
         ofst <= unsigned('0' & eb_dat_i(UPRANGE downto 0));
      elsif ofen = '1' then
         if ovfl = '1' then   -- count overflow
            ovf_err <= '1';
         else
            ofst <= ofst + 1; -- increment
         end if;
      end if;
   end if;
end process;

ovfl <= ofst(UPRANGE+1); -- maximum count

mem_addr_o <= GNDUPA & std_logic_vector(ofst);

-- E-bone drivers
-----------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then -- routing help
      s_dk  <= adk AND NOT (ovf_err OR rw_err);
   end if;
end process;

mem_din_o <= eb_dat_i;

mem_rd_o  <= mem_rd_j when eb_as_i = '1'     -- single data burst
             else mem_rd_j AND NOT eb_aef_i; -- multiple data burst

eb_err_o  <= fif_err when myself = '1' else '0';
eb_dk_o   <= s_dk OR fif_err when myself = '1' else '0';
eb_dat_o  <= mem_dout_i when myself = '1' else (others => '0'); 

end rtl;
