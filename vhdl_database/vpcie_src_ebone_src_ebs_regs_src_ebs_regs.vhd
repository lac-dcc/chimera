--------------------------------------------------------------------------
--
-- E-bone - Register stack slave
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
-- Register (32 bits) stack  
-- EBS_AD_SIZE   = Total register number, range 4 to 128
-- REG_RO_SIZE   = read only register number
-- REG_WO_BITS   = reg. 0 self clear bit number
--
-- Mapping from bottom (zero offset) to the top
-- Read & write registers
-- Read only registers
--
-- Example: EBS_AD_SIZE=16 , REG_RO_SIZE=2
-- regs_o type is array(13 downto  0) of std32; -- R/W, 14 of them
-- regs_i  type is array(15 downto 14) of std32; -- Read only, 2 of them
--
-- Self clear feature
-- if regs_sclr is set
-- then register zero least REG_WO_BITS bits self clear (after writing in)
--
-- regs_i external input are NOT resampled
-- regs_irq_i external input (re-sampled) trigs message IRQ
-- regs_iak_o acknowledge request and asserted until IRQ has been served
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ebs_pkg.all;

entity ebs_regs is
generic (
   EBS_AD_RNGE  : natural := 12;  -- short adressing range
   EBS_AD_BASE  : natural := 1;   -- usual IO segment
   EBS_AD_SIZE  : natural := 16;  -- size in segment
   EBS_AD_OFST  : natural := 0;   -- offset in segment
   EBS_MIRQ     : std16   := (1 => '1', others => '0'); -- Message IRQ
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
end ebs_regs;

--------------------------------------
architecture rtl of ebs_regs is
--------------------------------------
subtype rw_typ is std32_a(EBS_AD_SIZE-REG_RO_SIZE-1 downto 0); -- first reg. are R/W
subtype rd_typ is std32_a(EBS_AD_SIZE-1 downto EBS_AD_SIZE-REG_RO_SIZE); -- last reg. are read only
type state_typ is (iddle, adrs, wr1, rd1, bcc1, bcc2, error, abort);

constant GND16   : std16 := (others => '0');
constant UPRANGE : natural := NLog2(EBS_AD_SIZE)-1;
constant OK_SIZE : natural := 2**(UPRANGE+1);

signal state, nextate : state_typ;
signal dk        : std_logic := '0'; -- slave addrs & data acknowledge
signal s_dk      : std_logic := '0'; -- acknowledge registered
signal berr      : std_logic := '0'; -- addressing error
signal myself    : std_logic := '0'; -- slave selected
signal bwrite    : std_logic := '0'; -- burst write
signal irq1, irq2, irq3 : std_logic := '0'; -- IRQ filter
signal irq       : std_logic := '0'; -- pulsed IRQ
signal irq_bcall : std_logic := '0'; -- slave IRQ selected
signal irq_pendg : std_logic := '0'; -- IRQ pending
signal bcall     : std_logic := '0'; -- broad-call flag
signal eof       : std_logic := '0'; -- slave end of frame
signal load      : std_logic := '0'; -- register stack load
signal ofld      : std_logic := '0'; -- offset counter load
signal ofen      : std_logic := '0'; -- offset counter enable
signal ovf_wr    : std_logic := '0'; -- offset write overflow
signal ovf_err   : std_logic := '0'; -- offset overflow error
signal ofst      : unsigned(UPRANGE+1 downto 0); -- offset counter in burst, MSbit is overflow
signal ofstwr    : unsigned(UPRANGE downto 0); -- max. offset when writing in
signal rmux      : std32;
signal rw_regs   : rw_typ := (others => (others => '0'));
signal rirq      : std16; -- message IRQ

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
         myself     <= '0';  
         irq_bcall  <= '0';  
      else
         myself <= (ofld OR myself)           -- set and lock
                   AND NOT (eof OR ovf_err);  -- clear

         irq_bcall  <= (bcall OR irq_bcall) -- broad-call memorized        
                   AND NOT eof;             -- clear

         state  <= nextate;
      end if;
   end if;
end process;

process(state, eb_bmx_i, eb_as_i, eb_eof_i, eb_dat_i, eb_bar, eb_amsb, ovf_wr)
variable base   : std_logic_vector(1 downto 0);
variable bofst  : std_logic_vector(EBS_AD_RNGE-1 downto 0);
begin
   base  := std_logic_vector(to_unsigned(EBS_AD_BASE, 2));
   bofst := std_logic_vector(to_unsigned(EBS_AD_OFST, EBS_AD_RNGE));
   nextate <= state; -- stay in same state
   load    <= '0';
   ofld    <= '0';
   ofen    <= '0';
   bcall   <= '0';   
   dk      <= '0';
   eof     <= '0';
   bwrite  <= '0';
   berr    <= '0';

   case state is 
      when iddle =>                    -- sleeping
         if    eb_bmx_i = '1'          -- burst start
           AND eb_as_i = '1' then      -- adrs
            if eb_eof_i = '1' then     -- broad-cast/call
               nextate <= bcc1;

            elsif (eb_bar  = base      -- plain adressing
                  AND eb_amsb = bofst(EBS_AD_RNGE-1 downto UPRANGE+1)) then
               ofld    <= '1';         -- store offset
               if ovf_wr = '1' then
                  berr    <= '1';
                  nextate <= error;    -- write to read only location
               else 
                  dk      <= '1';      -- slave addrs ack
               nextate <= adrs;
               end if;
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
         bwrite  <= '1';
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
            ofen <= '1';
            if eb_eof_i = '1' then
               eof <= '1';
               nextate <= iddle;
            end if;
         end if;

      when bcc1 =>                    -- broad-cast/call
         if eb_dat_i(31) = '1' then   -- read or write?
            bcall   <= '1';           -- broad-call
         end if;
         nextate <= bcc2;

      when bcc2 =>                    -- wait until bus released
         if eb_bmx_i = '0' then 
            nextate <= abort;
         elsif eb_eof_i = '1' then
            eof <= '1';
            nextate <= iddle;
         end if;

      when error =>                   -- wait until bus released
         if eb_bmx_i = '1' then 
            berr <= '1';
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

      ovf_err <= '0';
      if ofld = '1'  then   -- offset load
         ofst <= unsigned('0' & eb_dat_i(UPRANGE downto 0));
      elsif ofen = '1' then
         if ofst(UPRANGE+1) = '1' then   -- count overflow
            ovf_err <= '1';
         else
            ofst <= ofst + 1; -- increment
         end if;
      end if;

   end if;
end process;

ofstwr <=  to_unsigned(EBS_AD_SIZE-REG_RO_SIZE, UPRANGE+1); 
ovf_wr <= '1' when eb_dat_i(31) = '0' AND unsigned(eb_dat_i(UPRANGE downto 0)) >= ofstwr 
           else '0'; -- write to read only regs.

regs_ofs_o   <= std_logic_vector(ofst(UPRANGE downto 0)); 
regs_ofswr_o <= ofen when bwrite = '1' else '0';
regs_ofsrd_o <= ofen AND NOT eof when bwrite = '0' else '0';

-- Register stack writing in
----------------------------
nowr: if REG_RO_SIZE < EBS_AD_SIZE generate -- some R/W
begin
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then

      if reg0_sclr_i = '1' then
         for i in REG_WO_BITS-1 downto 0 loop
            rw_regs(0)(i) <= '0'; -- self clear
         end loop;
      end if;

      if load = '1' then
         for i in rw_typ'RANGE loop
            if to_integer(ofst) = i then
               rw_regs(i) <= eb_dat_i;
            end if;
         end loop;
      end if;
   end if;
end process;
regs_o <= rw_regs; -- internal to port
end generate nowr;

-- Register read back
-- Registered output multiplexor
--------------------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then

      for i in rw_typ'RANGE loop
         if to_integer(ofst) = i then
            rmux <= rw_regs(i);
         end if;
      end loop;

      for i in rd_typ'RANGE loop
         if to_integer(ofst) = i then
            rmux <= regs_i(i);
         end if;
      end loop;

   end if;
end process;


-- Interrupt request management
-------------------------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      irq1 <= regs_irq_i;
      irq2 <= irq1; -- glitch filter
      irq3 <= irq2; -- glitch filter
      irq  <= (irq1 AND irq2) AND NOT irq3; -- pulsed request
      if eb_rst_i = '1' then
         irq_pendg <= '0';
         rirq <= (others => '0');
      else
         irq_pendg <= (irq OR irq_pendg)            -- memorized
                      AND NOT (irq_bcall AND eof);  -- cleared after bcall

         if irq_pendg = '1' then
            rirq <= EBS_MIRQ;
         else 
            rirq <= (others => '0');
         end if;
      end if;
   end if;
end process;

-- E-bone drivers
-----------------
process(eb_clk_i)
begin
   if rising_edge(eb_clk_i) then
      s_dk       <= dk AND NOT ovf_err;
      regs_iak_o <= irq_pendg; -- IRQ handshake
   end if;
end process;

eb_err_o <= berr  when myself = '1' else '0';
eb_dk_o  <= s_dk  when myself = '1' else '0';
eb_dat_o <= rmux  when myself = '1' else
            GND16 & rirq  when irq_bcall = '1' else (others =>'0');

end rtl;
