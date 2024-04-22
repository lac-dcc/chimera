library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cache_pack.all;

entity icache is port (
   clk125 : in std_logic;
   clk200 : in std_logic;
   rst : in std_logic;
   -- icache on/off mode
   icccra : in icccr_i_t;
   -- Cache RAM port
   ra : in icache_ram_o_t;
   ry : out icache_ram_i_t;
   -- CPU port
   a : in icache_i_t;
   y : out icache_o_t;
   -- DDR memory port
   ma : in mem_i_t;
   my : out mem_o_t);
end icache;

architecture beh of icache is

  signal ry_ccl : icache_ramccl_i_t; -- distribute ry sig, cpu clock domain
  signal ry_mcl : icache_rammcl_i_t; -- distribute ry sig, mem clock domain
  signal ctom1 : ctom_t; -- clock domain crossing, cpu -> mem
  signal ctom2 : ctom_t; -- clock domain crossing, cpu -> mem
  signal mtoc1 : mtoc_t; -- clock domain crossing, mem -> cpu
  signal mtoc2 : mtoc_t; -- clock domain crossing, mem -> cpu
  signal enmcl : std_logic; -- clock dom. cross., enable in bi-direc
  signal enmcl_for_d : std_logic; -- clock dom. cross., enable in bi-direc
  signal d_mcl : std_logic_vector(28 downto 0); -- data
  signal enccl : std_logic; -- clock dom. cross., enable in bi-direc
  signal d_ccl : std_logic_vector(28 downto 0); -- data
  signal bcen_value_halfcb0 : std_logic; -- 0.5 cycle delay

  -- synchnonizing flip flops -------------------------------------------------
  signal thisbm_c : cache_fsync_reg_t ;
  signal thisbm_r : cache_fsync_reg_t ;
  signal thisbc_c : cache_fsync_reg_t ;
  signal thisbc_r : cache_fsync_reg_t ;
  signal thisuc_c : cache_fsync_2_reg_t;
  signal thisuc_r : cache_fsync_2_reg_t;
  -- note ---------------------------------------------------------------------
  -- thisbm <-> bi- directional (mclk = 200MHz clock)
  -- thisbc <-> bi- directional (cclk = 125MHz clock)
  -- thisuc <-> uni-directional (cclk = 125MHz clock)
  -- --------------------------------------------------------------------------
begin

  -- ram output signal gather from two clock domains
  -- cpu clock side (cpu clock domain, 125MHz) -------------------------------
  ry.a0 <= ry_ccl.a0 ;   -- +-- cpu side ram, read only
  ry.en0 <= ry_ccl.en0 ; -- +--

  ry.ta <= ry_ccl.ta ;   -- +-- tag ram is fully controlled by cpu side
  ry.ten <= ry_ccl.ten ; -- |
  ry.twr <= ry_ccl.twr ; -- |
  ry.tag <= ry_ccl.tag ; -- +--
  -- mem clock side (mem clock domain, 200MHz) -------------------------------
  ry.a1 <= ry_mcl.a1 ;   -- +-- mem side ram, control side write only
  ry.d1 <= ry_mcl.d1 ;   -- | (but in HDL, read port remains undeleted)
  ry.en1 <= ry_mcl.en1 ; -- |
  ry.wr1 <= ry_mcl.wr1 ; -- +--

  -- cpu clock domain, sub module ---------------------------------------------
  uicache_ccl : icache_ccl port map ( clk => clk125,
                                          -- ------
    rst => rst, ra => ra, ry_ccl => ry_ccl ,
    a => a, y => y, ctom => ctom1,
    mtoc => mtoc2, icccra => icccra );

  -- memory clock domain, sub module ------------------------------------------
  uicache_mcl : icache_mcl port map ( clk => clk200,
                                          -- ------
    rst => rst, ry_mcl => ry_mcl, ma => ma,
    my => my, ctom => ctom2, mtoc => mtoc1 );

  -- bidirectional frequency synchronizer (input) ---
  enmcl <= mtoc1.rfillv;
  enmcl_for_d <= mtoc1.rfillv_advance;
  d_mcl <= mtoc1.rfilld(16) & x"ff" & mtoc1.rfilld(15 downto 0) & x"f";
  enccl <= ctom1.fillv;
  d_ccl <= ctom1.filla;

  -- bidirectional frequency synchronizer ---
  c2 : process(thisbm_r, thisbc_r, thisuc_r, enmcl , enmcl_for_d, d_mcl , enccl , d_ccl , mtoc1, bcen_value_halfcb0 )
    variable thisbm : cache_fsync_reg_t ;
    variable thisbc : cache_fsync_reg_t ;
    variable thisuc : cache_fsync_2_reg_t;

    begin
       thisbm := thisbm_r;
       thisbc := thisbc_r;
       thisuc := thisuc_r;


   -- -------------------------------------------------------------------------
   -- bi-directional frequency synchronizer logic start
   -- -------------------------------------------------------------------------
   -- metastable buffers ------------------------------------------------------
      thisbm.en(STABLE) := thisbm.en(METASTABLE);
      thisbc.en(STABLE) := thisbc.en(METASTABLE);
      thisbm.d (STABLE) := thisbm.d (METASTABLE);
      thisbc.d (STABLE) := thisbc.d (METASTABLE);

   -- enable and data flacters ------------------------------------------------
      thisbm.en(METASTABLE) := thisbm.en(VALUE) xor not bcen_value_halfcb0;
      thisbc.en(METASTABLE) := thisbm.en(VALUE) xor     bcen_value_halfcb0;

      thisbm.d (METASTABLE) := thisbc.d(VALUE);
      thisbc.d (METASTABLE) := thisbm.d(VALUE);

   -- set the enable flops and latch the input data ---------------------------
      if enccl = '1' then
        thisbc.en(VALUE) := not thisbm.en(VALUE);
        thisbc.d (VALUE) := d_ccl ; end if;
      if enmcl = '1' then
        thisbm.en(VALUE) :=     bcen_value_halfcb0; end if;
      if enmcl_for_d = '1' then
        thisbm.d (VALUE) := d_mcl ; end if;
   -- -------------------------------------------------------------------------

   -- -------------------------------------------------------------------------
   -- uni-directional frequency synchronizer logic start
   -- (just 2 stages flip flop re-timing)
   -- -------------------------------------------------------------------------
      thisuc.v(STABLE) := thisuc.v(METASTABLE);
      thisuc.v(METASTABLE) := mtoc1.v;
   -- -------------------------------------------------------------------------


thisbm_c <= thisbm;
thisbc_c <= thisbc;
thisuc_c <= thisuc;
  end process;

  c2_r0 : process(clk200, rst)
  begin
     if rst = '1' then
        thisbm_r <= CACHE_FSYNC_REG_RESET;
     elsif clk200'event and clk200 = '1' then
        thisbm_r <= thisbm_c;
     end if;
  end process;

  c2_r1 : process(clk125, rst)
  begin
     if rst = '1' then
        thisbc_r <= CACHE_FSYNC_REG_RESET;
     elsif clk125'event and clk125 = '1' then
        thisbc_r <= thisbc_c;
     end if;
  end process;

  c2_r2 : process(clk125, rst)
  begin
     if rst = '1' then
        thisuc_r <= CACHE_FSYNC_2_REG_RESET;
     elsif clk125'event and clk125 = '1' then
        thisuc_r <= thisuc_c;
     end if;
  end process;

  c2_r3 : process(clk125, thisbc_r) -- transparent latch 0.5 cycle delay
  begin
    if clk125 = '0' then
      bcen_value_halfcb0 <= thisbc_r.en(VALUE);
    end if;
  end process;

  -- output signal ------------------------------------------------------------
  mtoc2.rfillv <= thisbc_r.en(STABLE);
  mtoc2.rfilld <= '0' & thisbc_r.d(STABLE)(19 downto 4);
  mtoc2.cd     <= mtoc1.cd; -- no sync.

  ctom2.fillv  <= thisbm_r.en(STABLE);
  ctom2.filla  <= thisbm_r.d (STABLE);

  mtoc2.v      <= thisuc_r.v(STABLE);

end beh;
