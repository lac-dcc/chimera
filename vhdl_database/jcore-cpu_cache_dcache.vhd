library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cache_pack.all;
use work.cpu2j0_pack.all;
use work.data_bus_pack.all;

entity dcache is port (
   clk125 : in  std_logic;
   clk200 : in  std_logic;
   rst :    in  std_logic;
   -- --------  dcache on/off mode  -----
   ctrl :   in  cache_ctrl_t;
   -- --------  Cache RAM port ----------
   ra :     in  dcache_ram_o_t;
   ry :     out dcache_ram_i_t;
   -- --------  CPU port ----------------
   a :      in  cpu_data_o_t;
   lock :   in  std_logic; -- attribute TAS access
   y :      out cpu_data_i_t;
   -- --------  snoop port --------------
   sa :     in  dcache_snoop_io_t;
   sy :     out dcache_snoop_io_t;
   -- --------  DDR memory port ---------
   ma :     in  mem_i_t;
   my :     out mem_o_t);
end dcache;

architecture beh of dcache is

  signal ry_ccl : dcache_ramccl_i_t; -- distribute ry sig, cpu clock domain
  signal ry_mcl : dcache_rammcl_i_t; -- distribute ry sig, mem clock domain
  signal ctom1   : ctom_dc_t;        -- clock domain crossing, cpu -> mem
  signal ctom2   : ctom_dc_t;        -- clock domain crossing, cpu -> mem
  signal mtoc1   : mtoc_dc_t;        -- clock domain crossing, mem -> cpu
  signal mtoc2   : mtoc_dc_t;        -- clock domain crossing, mem -> cpu
  signal en0mcl_en   : std_logic;    -- clock dom. cross., enable in bi-direc
  signal en0mcl_data : std_logic;    -- clock dom. cross., enable in bi-direc
  signal d0_mcl   : std_logic_vector(31 downto 0); -- cache off read data
  signal en0ccl   : std_logic;        -- clock dom. cross., enable in bi-direc
  signal d0_ccl   : std_logic_vector(64 downto 0); -- data
  signal en2mcl   : std_logic;        -- clock dom. cross., enable in bi-direc
  signal d2_mcl   : std_logic_vector(31 downto 0); -- data
  signal en2ccl   : std_logic;        -- clock dom. cross., enable in bi-direc
  signal en3mcl   : std_logic_vector( 1 downto 0); -- cross., en in bi-direc
  signal en3ccl   : std_logic_vector( 1 downto 0); -- ross., en in bi-direc
  signal bcen_value_halfcb0 : std_logic; -- 0.5 cycle delay 
  signal bmen_value_halfcb2 : std_logic; -- 0.5 cycle delay 

  -- synchnonizing flip flops -------------------------------------------------
  signal thisbm_c : dcache_fsync_mc_reg_t;
  signal thisbm_r : dcache_fsync_mc_reg_t := DCACHE_FSYNC_MC_REG_RESET;
  signal thisbc_c : dcache_fsync_cc_reg_t;
  signal thisbc_r : dcache_fsync_cc_reg_t := DCACHE_FSYNC_CC_REG_RESET;
  -- note ---------------------------------------------------------------------
  -- thisbm <-> bi- directional (mclk = 200MHz clock)
  -- thisbc <-> bi- directional (cclk = 125MHz clock)
  -- --------------------------------------------------------------------------
begin

  -- ram output signal gather from two clock domains
  -- cpu clock side  (cpu clock domain, 125MHz) -------------------------------
  ry.a0   <= ry_ccl.a0   ;  -- +-- cpu side ram, 
  ry.d0   <= ry_ccl.d0   ;  -- | 
  ry.en0  <= ry_ccl.en0  ;  -- |
  ry.wr0  <= ry_ccl.wr0  ;  -- |
  ry.we0  <= ry_ccl.we0  ;  -- +--

  ry.ta0  <= ry_ccl.ta0  ;  -- +-- tag ram is fully controlled by cpu side
  ry.ten0 <= ry_ccl.ten0 ;  -- |
  ry.twr0 <= ry_ccl.twr0 ;  -- |
  ry.tag0 <= ry_ccl.tag0 ;  -- +--
  ry.ta1  <= ry_ccl.ta1  ;  -- +-- tag ram (snoop port)
  -- mem clock side  (mem clock domain, 200MHz) -------------------------------
  ry.a1   <= ry_mcl.a1   ;  -- +-- mem side ram, control side write only
  ry.d1   <= ry_mcl.d1   ;  -- |    (but in HDL, read port remains undeleted)
  ry.en1  <= ry_mcl.en1  ;  -- |
  ry.wr1  <= ry_mcl.wr1  ;  -- |
  ry.we1  <= ry_mcl.we1  ;  -- +--

  -- cpu clock domain, sub module ---------------------------------------------
  udcache_ccl : dcache_ccl port map (     clk    => clk125,
                                                 -- ------
    rst     => rst,     ra     => ra,     ry_ccl => ry_ccl ,
    a       => a,       a_lock => lock,
                        y      => y,      sa     => sa,
    sy      => sy,      ctom    => ctom1, mtoc   => mtoc2,
    ctrl   => ctrl );

  -- memory clock domain, sub module ------------------------------------------
  udcache_mcl : dcache_mcl port map (     clk   => clk200,
                                                -- ------
    rst     => rst,     ry_mcl => ry_mcl, ma     => ma,
    my      => my,      ctom   => ctom2,  mtoc   => mtoc1 );

  -- bidirectional frequency synchronizer (input) ---
  en0mcl_en    <= mtoc1.b0enr;
  en0mcl_data  <= mtoc1.b0enr_mcdata;
  d0_mcl  <= mtoc1.b0d_unc;
  en0ccl  <= ctom1.b0en;
  d0_ccl  <= ctom1.b0d;
  --
  en2mcl  <= mtoc1.b2enr;
  d2_mcl  <= mtoc1.b2d_cfil;
  en2ccl  <= ctom1.b2en;
  --
  en3mcl <= mtoc1.b31enr & mtoc1.b30enr;
  en3ccl <= ctom1.b31en  & ctom1.b30en ;

  -- bidirectional frequency synchronizer ---
  c2 : process( thisbm_r,    thisbc_r,    en0mcl_en,   en0mcl_data, en0ccl,
   d0_ccl,      d0_mcl,      en2mcl,      d2_mcl,      en2ccl,      en3mcl,
   en3ccl,      bcen_value_halfcb0,       bmen_value_halfcb2 )
    variable thisbm : dcache_fsync_mc_reg_t;
    variable thisbc : dcache_fsync_cc_reg_t;

    begin
       thisbm := thisbm_r;
       thisbc := thisbc_r;

   -- -------------------------------------------------------------------------
   -- bi-directional frequency synchronizer logic start
   -- -------------------------------------------------------------------------
   -- part 0 (cpu -> mem all address & write data)
   --        (mem -> cpu cache off read data)
   -- metastable buffers ------------------------------------------------------
      thisbm.en0(STABLE) := thisbm.en0(METASTABLE);
      thisbc.en0(STABLE) := thisbc.en0(METASTABLE);
      thisbm.d0b(STABLE) := thisbm.d0b(METASTABLE);
      thisbc.d0s(STABLE) := thisbc.d0s(METASTABLE);

   -- enable and data flacters ------------------------------------------------
      thisbm.en0(METASTABLE) := thisbm_r.en0(VALUE) xor not bcen_value_halfcb0;
      thisbc.en0(METASTABLE) := thisbm_r.en0(VALUE) xor     bcen_value_halfcb0;

      thisbm.d0b(METASTABLE) := thisbc.d0v      ;
      thisbc.d0s(METASTABLE) := thisbm.d0v;

   -- set the enable flops and latch the input data ---------------------------
      if en0ccl  = '1' then
        thisbc.en0(VALUE) := not thisbm_r.en0(VALUE);
        thisbc.d0v        := d0_ccl               ; end if;
      if en0mcl_en  = '1' then
        thisbm.en0(VALUE) :=     bcen_value_halfcb0; end if;
      if en0mcl_data  = '1' then
        thisbm.d0v        := d0_mcl; end if;
   -- -------------------------------------------------------------------------

   -- part 2 (mem -> cpu cache on read data (critical word of miss line)
   -- metastable buffers ------------------------------------------------------
      thisbm.en2(STABLE) := thisbm.en2(METASTABLE);
      thisbc.en2(STABLE) := thisbc.en2(METASTABLE);
      thisbc.d2s(STABLE) := thisbc.d2s(METASTABLE);

   -- enable and data flacters ------------------------------------------------
      thisbm.en2(METASTABLE) := bmen_value_halfcb2 xor not thisbc.en2(VALUE);
      thisbc.en2(METASTABLE) := bmen_value_halfcb2 xor     thisbc.en2(VALUE);

      if   thisbc.en2(METASTABLE) = '1' then
           thisbc.d2s(METASTABLE) := (others => '0');
      else thisbc.d2s(METASTABLE) := thisbm.d2v      ; end if;

   -- set the enable flops and latch the input data ---------------------------
      if en2mcl  = '1' then
        thisbm.en2(VALUE) :=     thisbc.en2(VALUE);
        thisbm.d2v        := d2_mcl; end if;
      if en2ccl  = '1' then
        thisbc.en2(VALUE) := not bmen_value_halfcb2;
                                          end if;
   -- -------------------------------------------------------------------------

   -- -------------------------------------------------------------------------
   -- part 3-0 (cpu -> mem en0 equivalent send using b30, b31.  b30 part)
   --          (snoop communication)
   -- metastable buffers ------------------------------------------------------
      thisbm.en30(STABLE) := thisbm.en30(METASTABLE);
      thisbc.en30(STABLE) := thisbc.en30(METASTABLE);
   -- enable and data flacters ------------------------------------------------
      thisbm.en30(METASTABLE) := 
                             thisbm_r.en30(VALUE) xor not thisbc_r.en30(VALUE);
      thisbc.en30(METASTABLE) :=
                             thisbm_r.en30(VALUE) xor     thisbc_r.en30(VALUE);
   -- set the enable flops and latch the input data ---------------------------
      if en3mcl(0)  = '1' then
        thisbm.en30(VALUE) :=     thisbc_r.en30(VALUE); end if;
      if en3ccl(0)  = '1' then
        thisbc.en30(VALUE) := not thisbm_r.en30(VALUE); end if;
   -- -------------------------------------------------------------------------

   -- -------------------------------------------------------------------------
   -- part 3-1 (cpu -> mem en0 equivalent send using b30, b31.  b31 part)
   --          (snoop communication)
   -- metastable buffers ------------------------------------------------------
      thisbm.en31(STABLE) := thisbm.en31(METASTABLE);
      thisbc.en31(STABLE) := thisbc.en31(METASTABLE);
   -- enable and data flacters ------------------------------------------------
      thisbm.en31(METASTABLE) := 
                             thisbm_r.en31(VALUE) xor not thisbc_r.en31(VALUE);
      thisbc.en31(METASTABLE) :=
                             thisbm_r.en31(VALUE) xor     thisbc_r.en31(VALUE);
   -- set the enable flops and latch the input data ---------------------------
      if en3mcl(1)  = '1' then
        thisbm.en31(VALUE) :=     thisbc_r.en31(VALUE); end if;
      if en3ccl(1)  = '1' then
        thisbc.en31(VALUE) := not thisbm_r.en31(VALUE); end if;
   -- -------------------------------------------------------------------------

thisbm_c <= thisbm;
thisbc_c <= thisbc;
  end process;

  c2_r0 : process(clk200, rst)
  begin
     if rst = '1' then
        thisbm_r <= DCACHE_FSYNC_MC_REG_RESET;
     elsif clk200'event and clk200 = '1' then
        thisbm_r <= thisbm_c;
     end if;
  end process;

  c2_r1 : process(clk125, rst)
  begin
     if rst = '1' then
        thisbc_r <= DCACHE_FSYNC_CC_REG_RESET;
     elsif clk125'event and clk125 = '1' then
        thisbc_r <= thisbc_c;
     end if;
  end process;

  c2_r2 : process(clk200, thisbm_r) -- transparent latch 0.5 cycle delay
  begin
    if clk200 = '0' then
      bmen_value_halfcb2 <= thisbm_r.en2(VALUE);
    end if;
  end process;

  c2_r3 : process(clk125, thisbc_r) -- transparent latch 0.5 cycle delay
  begin
    if clk125 = '0' then
      bcen_value_halfcb0 <= thisbc_r.en0(VALUE);
    end if;
  end process;

  -- output signal ------------------------------------------------------------
  mtoc2.b0enr    <= thisbc_r.en0(STABLE);
  mtoc2.b0d_unc  <= thisbc_r.d0s(STABLE);
  mtoc2.b2enr    <= thisbc_r.en2(STABLE);
  mtoc2.b2d_cfil <= thisbc_r.d2s(STABLE);
  mtoc2.b30enr   <= thisbc_r.en30(STABLE);
  mtoc2.b31enr   <= thisbc_r.en31(STABLE);

  ctom2.b0en  <= thisbm_r.en0(STABLE);
  ctom2.b0d   <= thisbm_r.d0b(STABLE);
  ctom2.b2en  <= thisbm_r.en2(STABLE);
  ctom2.b30en <= thisbm_r.en30(STABLE);
  ctom2.b31en <= thisbm_r.en31(STABLE);
  
end beh;
