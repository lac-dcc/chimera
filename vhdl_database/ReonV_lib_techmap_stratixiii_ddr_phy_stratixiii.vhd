library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
-- pragma translate_off
-- pragma translate_on

library techmap;
use techmap.gencomp.all;
------------------------------------------------------------------
-- STRATIXIII DDR2 PHY ----------------------------------------------
------------------------------------------------------------------

entity stratixiii_ddr2_phy is
  generic (MHz : integer := 100; rstdelay : integer := 200;
           dbits : integer := 16; clk_mul : integer := 2; clk_div : integer := 2;
           ddelayb0 : integer := 0; ddelayb1 : integer := 0; ddelayb2 : integer := 0;
           ddelayb3 : integer := 0; ddelayb4 : integer := 0; ddelayb5 : integer := 0;
           ddelayb6 : integer := 0; ddelayb7 : integer := 0; 
           numidelctrl : integer := 4; norefclk : integer := 0; 
           tech : integer := stratix3; odten : integer := 0; rskew : integer := 0;
           eightbanks : integer range 0 to 1 := 0);

  port (
    rst        : in  std_ulogic;
    clk        : in  std_logic;        -- input clock
    clkref200  : in  std_logic;        -- input 200MHz clock
    clkout     : out std_ulogic;       -- system clock
    lock       : out std_ulogic;       -- DCM locked

    ddr_clk    : out std_logic_vector(2 downto 0);
    ddr_clkb   : out std_logic_vector(2 downto 0);
    ddr_cke    : out std_logic_vector(1 downto 0);
    ddr_csb    : out std_logic_vector(1 downto 0);
    ddr_web    : out std_ulogic;                               -- ddr write enable
    ddr_rasb   : out std_ulogic;                               -- ddr ras
    ddr_casb   : out std_ulogic;                               -- ddr cas
    ddr_dm     : out std_logic_vector (dbits/8-1 downto 0);    -- ddr dm
    ddr_dqs    : inout std_logic_vector (dbits/8-1 downto 0);  -- ddr dqs
    ddr_dqsn   : inout std_logic_vector (dbits/8-1 downto 0);  -- ddr dqsn
    ddr_ad     : out std_logic_vector (13 downto 0);           -- ddr address
    ddr_ba     : out std_logic_vector (1+eightbanks downto 0); -- ddr bank address
    ddr_dq     : inout  std_logic_vector (dbits-1 downto 0);   -- ddr data
    ddr_odt    : out std_logic_vector(1 downto 0);

    addr       : in  std_logic_vector (13 downto 0);           -- ddr address
    ba         : in  std_logic_vector ( 2 downto 0);           -- ddr bank address
    dqin       : out std_logic_vector (dbits*2-1 downto 0);    -- ddr input data
    dqout      : in  std_logic_vector (dbits*2-1 downto 0);    -- ddr input data
    dm         : in  std_logic_vector (dbits/4-1 downto 0);    -- data mask
    oen        : in  std_ulogic;
    dqs        : in  std_ulogic;
    dqsoen     : in  std_ulogic;
    rasn       : in  std_ulogic;
    casn       : in  std_ulogic;
    wen        : in  std_ulogic;
    csn        : in  std_logic_vector(1 downto 0);
    cke        : in  std_logic_vector(1 downto 0);
    cal_en     : in  std_logic_vector(dbits/8-1 downto 0);
    cal_inc    : in  std_logic_vector(dbits/8-1 downto 0);
    cal_pll    : in  std_logic_vector(1 downto 0);
    cal_rst    : in  std_logic;
    odt        : in  std_logic_vector(1 downto 0);
    oct        : in  std_logic
  );

end;

architecture rtl of stratixiii_ddr2_phy is

  component apll is
  generic (
    freq    : integer := 200;
    mult    : integer := 8;
    div     : integer := 5;
    rskew   : integer := 0
  );
  port(
    areset      : in std_logic  := '0';
    inclk0      : in std_logic  := '0';
    phasestep   : in std_logic  := '0';
    phaseupdown : in std_logic  := '0';
    scanclk     : in std_logic  := '1';
    c0          : out std_logic ;
    c1          : out std_logic ;
    c2          : out std_logic ;
    c3          : out std_logic ;
    c4          : out std_logic ;
    locked      : out std_logic;
    phasedone   : out std_logic
  );
  end component;

  component aclkout is
  port(
    clk     : in  std_logic;
    ddr_clk : out std_logic;
    ddr_clkn: out std_logic
  );
  end component;

  component actrlout is
  generic(
    power_up  : string := "high"
  );
  port(
    clk     : in  std_logic;
    i       : in  std_logic;
    o       : out std_logic
  );
  end component;

  --component adqsout is
  --port(
  --  clk       : in  std_logic; -- clk90
  --  dqs       : in  std_logic;
  --  dqs_oe    : in  std_logic;
  --  dqs_oct   : in  std_logic; -- gnd = disable
  --  dqs_pad   : out std_logic; -- DQS pad
  --  dqsn_pad  : out std_logic  -- DQSN pad
  --);
  --end component;

  --component adqsin is
  --port(
  --  dqs_pad   : in  std_logic; -- DQS pad
  --  dqsn_pad  : in  std_logic; -- DQSN pad
  --  dqs       : out std_logic
  --);
  --end component;

  component admout is
  port(
    clk       : in  std_logic; -- clk0
    dm_h      : in  std_logic;
    dm_l      : in  std_logic;
    dm_pad    : out std_logic  -- DQ pad
  );
  end component;

  --component adqin is
  --port(
  --  clk     : in  std_logic;
  --  dq_pad  : in  std_logic; -- DQ pad
  --  dq_h    : out std_logic;
  --  dq_l    : out std_logic;
  --  config_clk    : in  std_logic;
  --  config_clken  : in  std_logic;
  --  config_datain : in  std_logic;
  --  config_update : in  std_logic
  --);
  --end component;

  --component adqout is
  --port(
  --  clk       : in  std_logic; -- clk0
  --  clk_oct   : in  std_logic; -- clk90
  --  dq_h      : in  std_logic;
  --  dq_l      : in  std_logic;
  --  dq_oe     : in  std_logic;
  --  dq_oct    : in  std_logic; -- gnd = disable
  --  dq_pad    : out std_logic  -- DQ pad
  --);
  --end component;

  component  dq_dqs_inst is
  port(
    bidir_dq_input_data_in        : in  std_logic_vector (7 downto 0);
    bidir_dq_input_data_out_high  : out std_logic_vector (7 downto 0);
    bidir_dq_input_data_out_low   : out std_logic_vector (7 downto 0);
    bidir_dq_io_config_ena        : in  std_logic_vector (7 downto 0);
    bidir_dq_oct_in               : in  std_logic_vector (7 downto 0);
    bidir_dq_oct_out              : out std_logic_vector (7 downto 0);
    bidir_dq_oe_in                : in  std_logic_vector (7 downto 0);
    bidir_dq_oe_out               : out std_logic_vector (7 downto 0);
    bidir_dq_output_data_in_high  : in  std_logic_vector (7 downto 0);
    bidir_dq_output_data_in_low   : in  std_logic_vector (7 downto 0);
    bidir_dq_output_data_out      : out std_logic_vector (7 downto 0);
    bidir_dq_sreset               : in  std_logic_vector (7 downto 0);
    config_clk                    : in  std_logic;
    config_datain                 : in  std_logic;
    config_update                 : in  std_logic;
    dq_input_reg_clk              : in  std_logic;
    dq_output_reg_clk             : in  std_logic;
    dqs_areset                    : in  std_logic;
    dqs_oct_in                    : in  std_logic;
    dqs_oct_out                   : out std_logic;
    dqs_oe_in                     : in  std_logic;
    dqs_oe_out                    : out std_logic;
    dqs_output_data_in_high       : in  std_logic;
    dqs_output_data_in_low        : in  std_logic;
    dqs_output_data_out           : out std_logic;
    dqs_output_reg_clk            : in  std_logic;
    dqsn_oct_in                   : in  std_logic;
    dqsn_oct_out                  : out std_logic;
    dqsn_oe_in                    : in  std_logic;
    dqsn_oe_out                   : out std_logic;
    oct_reg_clk                   : in  std_logic
  );
  end component;

  component bidir_dq_iobuf_inst is
  port(
    datain        : in    std_logic_vector (7 downto 0);
    dyn_term_ctrl : in    std_logic_vector (7 downto 0);
    oe            : in    std_logic_vector (7 downto 0);
    dataio        : inout std_logic_vector (7 downto 0);
    dataout       : out   std_logic_vector (7 downto 0)
  );
  end component;

  component bidir_dqs_iobuf_inst is
  port(
    datain          : in    std_logic_vector (0 downto 0);
    dyn_term_ctrl   : in    std_logic_vector (0 downto 0);
    dyn_term_ctrl_b : in    std_logic_vector (0 downto 0);
    oe              : in    std_logic_vector (0 downto 0);
    oe_b            : in    std_logic_vector (0 downto 0);
    dataio          : inout std_logic_vector (0 downto 0);
    dataio_b        : inout std_logic_vector (0 downto 0);
    dataout         : out   std_logic_vector (0 downto 0)
  );
  end component;

signal reset                : std_logic;
signal vcc, gnd, oe         : std_ulogic;
signal locked, vlockl, lockl  : std_ulogic;
signal clk0r, clk90r, clk180r, clk270r, rclk  : std_ulogic;
signal ckel, ckel2          : std_logic_vector(1 downto 0);
signal odtl                 : std_logic_vector(1 downto 0);
signal dqsin, dqsin_reg     : std_logic_vector (7 downto 0);    -- ddr dqs
signal dqsn                 : std_logic_vector(dbits/8-1 downto 0);
signal dqsoenr              : std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal delayrst             : std_logic_vector(3 downto 0);
signal phasedone            : std_logic;
signal dqinl                : std_logic_vector (dbits-1 downto 0); -- ddr data

-- altdq_dqs
signal bidir_dq_input_data_in   : std_logic_vector (dbits-1 downto 0) := (others => '0');
signal bidir_dq_io_config_ena   : std_logic_vector (dbits-1 downto 0) := (others => '1');
signal bidir_dq_oct_in          : std_logic_vector (dbits-1 downto 0) := (others => '0');
signal bidir_dq_oct_out         : std_logic_vector (dbits-1 downto 0);
signal bidir_dq_oe_in           : std_logic_vector (dbits-1 downto 0) := (others => '0');
signal bidir_dq_oe_out          : std_logic_vector (dbits-1 downto 0);
signal bidir_dq_output_data_out : std_logic_vector (dbits-1 downto 0);
signal bidir_dq_sreset          : std_logic_vector (dbits-1 downto 0) := (others => '0');
signal dqs_areset               : std_logic_vector (dbits/8-1 downto 0);
signal dqs_oct_out              : std_logic_vector (dbits/8-1 downto 0);
signal dqs_oe_out               : std_logic_vector (dbits/8-1 downto 0);
signal dqs_output_data_out      : std_logic_vector (dbits/8-1 downto 0);
signal dqsn_oct_out             : std_logic_vector (dbits/8-1 downto 0);
signal dqsn_oe_out              : std_logic_vector (dbits/8-1 downto 0);

type phy_r_type is record
  delay   : std_logic_vector(3 downto 0);
  count   : std_logic_vector(3 downto 0);
  update  : std_logic; 
  sdata   : std_logic;
  enable  : std_logic;
  update_delay   : std_logic;
end record;
type phy_r_type_arr is array (7 downto 0) of phy_r_type;
signal r,rin : phy_r_type_arr;
signal rp : std_logic_vector(8 downto 0);
signal rlockl : std_logic;

constant DDR_FREQ : integer := (MHz * clk_mul) / clk_div;

attribute keep : boolean;
attribute syn_keep : boolean;
attribute syn_preserve : boolean;
attribute syn_keep of dqsn : signal is true;
attribute syn_preserve of dqsn : signal is true;
attribute syn_keep of dqsoenr : signal is true;
attribute syn_preserve of dqsoenr : signal is true;
attribute syn_keep of dqsin_reg : signal is true;
attribute syn_preserve of dqsin_reg : signal is true;

begin

  -----------------------------------------------------------------------------------
  -- Clock generation 
  -----------------------------------------------------------------------------------
  oe <= not oen;
  vcc <= '1'; gnd <= '0';
  reset <= not rst;

  -- Optional DDR clock multiplication

  pll0 : apll 
  generic map(
      freq   => MHz,
      mult   => clk_mul,
      div    => clk_div,
      rskew  => rskew
    )
  port map(
    areset  => reset,
    inclk0  => clk,
    phasestep   => rp(3),--rp(1),
    phaseupdown => rp(8),--rp(3),
    scanclk     => clk0r,
    c0      => clk0r,
    c1      => clk90r,
    c2      => open, --clk180r,
    c3      => open, --clk270r,
    c4      => rclk,
    locked  => lockl,
    phasedone => phasedone
  );

  clk180r <= not clk0r;
  clk270r <= not clk90r;
  clkout <= clk0r;

  -----------------------------------------------------------------------------------
  -- Lock delay
  -----------------------------------------------------------------------------------
  rdel : if rstdelay /= 0 generate
    rcnt : process (clk0r)
    variable cnt : std_logic_vector(15 downto 0);
    variable vlock, co : std_ulogic;
    begin
      if rising_edge(clk0r) then
        co := cnt(15);
        vlockl <= vlock;
        if rlockl = '0' then
          cnt := conv_std_logic_vector(rstdelay*DDR_FREQ, 16); vlock := '0';
          cnt(0) := dqsin_reg(7) or dqsin_reg(6) or dqsin_reg(5) or dqsin_reg(4) or  -- dummy use of dqsin
                    dqsin_reg(3) or dqsin_reg(2) or dqsin_reg(1) or dqsin_reg(0);
-- pragma translate_off
          cnt(0) := '0';
-- pragma translate_on
        else
          if vlock = '0' then
            cnt := cnt -1;  vlock := cnt(15) and not co;
          end if;
        end if;
      end if;
      if rlockl = '0' then
        vlock := '0';
      end if;
    end process;
  end generate;

  locked <= lockl when rstdelay = 0 else vlockl;
  lock <= locked;

  -----------------------------------------------------------------------------------
  -- Generate external DDR clock
  -----------------------------------------------------------------------------------
  ddrclocks : for i in 0 to 2 generate
    ddrclk_pad : aclkout port map(clk => clk90r, ddr_clk => ddr_clk(i), ddr_clkn => ddr_clkb(i));
  end generate;

  -----------------------------------------------------------------------------------
  --  DDR single-edge control signals
  -----------------------------------------------------------------------------------
  -- ODT pads
  odtgen : for i in 0 to 1 generate
    odtl(i) <= locked and odt(i);
    ddr_odt_pad : actrlout generic map(power_up => "low")
      port map(clk =>clk180r , i => odtl(i), o => ddr_odt(i));
  end generate;

  -- CSN and CKE
  ddrbanks : for i in 0 to 1 generate
    ddr_csn_pad : actrlout port map(clk =>clk180r , i => csn(i), o => ddr_csb(i));

    ckel(i) <= cke(i) and locked;
    ddr_cke_pad : actrlout generic map(power_up => "low")
      port map(clk =>clk0r , i => ckel(i), o => ddr_cke(i));
  end generate;

  -- RAS
    ddr_rasn_pad : actrlout port map(clk =>clk180r , i => rasn, o => ddr_rasb);

  -- CAS
    ddr_casn_pad : actrlout port map(clk =>clk180r , i => casn, o => ddr_casb);

  -- WEN
    ddr_wen_pad : actrlout port map(clk =>clk180r , i => wen, o => ddr_web);

  -- BA
  bagen : for i in 0 to 1+eightbanks generate
    ddr_ba_pad : actrlout port map(clk =>clk180r , i => ba(i), o => ddr_ba(i));
  end generate;

  -- ADDRESS
  dagen : for i in 0 to 13 generate
    ddr_ad_pad : actrlout port map(clk =>clk180r , i => addr(i), o => ddr_ad(i));
  end generate;

  -----------------------------------------------------------------------------------
  -- DQM generation
  -----------------------------------------------------------------------------------
  dmgen : for i in 0 to dbits/8-1 generate

    ddr_dm_pad : admout port map(
      clk       => clk0r, -- clk0
      dm_h      => dm(i+dbits/8),
      dm_l      => dm(i),
      dm_pad    => ddr_dm(i)  -- DQ pad
    );
  end generate;

  -----------------------------------------------------------------------------------
  -- DQS generation (and DQ)
  -----------------------------------------------------------------------------------

  dqsgen : for i in 0 to dbits/8-1 generate

    doen : process(clk180r)
    begin 
      if reset = '1' then dqsoenr(i) <= '1'; 
      elsif rising_edge(clk180r) then dqsoenr(i) <= dqsoen; end if; 
    end process;

    dsqreg : process(clk180r)
    begin if rising_edge(clk180r) then dqsn(i) <= oe; end if; end process;

--    dqs_out_pad : adqsout port map(
--      clk       => clk90r,     -- clk90
--      dqs       => dqsn(i),
--      dqs_oe    => dqsoenr(i),
--      dqs_oct   => odt(0), --oct_reg(i),--gnd,        -- gnd = disable
--      dqs_pad   => ddr_dqs(i), -- DQS pad
--      dqsn_pad  => ddr_dqsn(i) -- DQSN pad
--    );
--
--    dqs_in_pad : adqsin port map(
--      dqs_pad   => ddr_dqs(i),
--      dqsn_pad  => ddr_dqsn(i),
--      dqs       => dqsin(i)
--    );
--    -- Dummy procces to sample dqsin
--    process(clk0r) 
--    begin 
--      if rising_edge(clk0r) then 
--          dqsin_reg(i) <= dqsin(i); 
--      end if; 
--    end process;

  -- altdq_dqs
  bidir_dq_io_config_ena((i)*8+7 downto 0+(i)*8) <= (others => r(i).enable);
  bidir_dq_oct_in((i)*8+7 downto 0+(i)*8) <= (others => oct); 
  bidir_dq_oe_in((i)*8+7 downto 0+(i)*8) <= (others => oen);
  bidir_dq_sreset((i)*8+7 downto 0+(i)*8) <= (others => reset);
  dqs_areset(i) <= reset;

  dq_dqs : dq_dqs_inst port map(
    bidir_dq_input_data_in        => bidir_dq_input_data_in((i)*8+7 downto 0+(i)*8),
    bidir_dq_input_data_out_high  => dqin((i)*8+7 downto 0+(i)*8),
    bidir_dq_input_data_out_low   => dqin((i)*8+7+dbits downto 0+(i)*8+dbits),
    bidir_dq_io_config_ena        => bidir_dq_io_config_ena((i)*8+7 downto 0+(i)*8),
    bidir_dq_oct_in               => bidir_dq_oct_in((i)*8+7 downto 0+(i)*8),
    bidir_dq_oct_out              => bidir_dq_oct_out((i)*8+7 downto 0+(i)*8),
    bidir_dq_oe_in                => bidir_dq_oe_in((i)*8+7 downto 0+(i)*8),
    bidir_dq_oe_out               => bidir_dq_oe_out((i)*8+7 downto 0+(i)*8),
    bidir_dq_output_data_in_high  => dqout((i)*8+7+dbits downto 0+(i)*8+dbits),
    bidir_dq_output_data_in_low   => dqout((i)*8+7 downto 0+(i)*8),
    bidir_dq_output_data_out      => bidir_dq_output_data_out((i)*8+7 downto 0+(i)*8),
    bidir_dq_sreset               => bidir_dq_sreset((i)*8+7 downto 0+(i)*8),
    config_clk                    => clk0r,
    config_datain                 => r(i).sdata,
    config_update                 => r(i).update_delay,
    dq_input_reg_clk              => rclk,
    dq_output_reg_clk             => clk0r,
    dqs_areset                    => dqs_areset(i),
    dqs_oct_in                    => oct,
    dqs_oct_out                   => dqs_oct_out(i),
    dqs_oe_in                     => dqsoenr(i),
    dqs_oe_out                    => dqs_oe_out(i),
    dqs_output_data_in_high       => dqsn(i),
    dqs_output_data_in_low        => gnd,
    dqs_output_data_out           => dqs_output_data_out(i),
    dqs_output_reg_clk            => clk90r,
    dqsn_oct_in                   => oct,
    dqsn_oct_out                  => dqsn_oct_out(i),
    dqsn_oe_in                    => dqsoenr(i),
    dqsn_oe_out                   => dqsn_oe_out(i),
    oct_reg_clk                   => clk90r
  );
  dq_pad : bidir_dq_iobuf_inst PORT map(
    datain        => bidir_dq_output_data_out((i)*8+7 downto 0+(i)*8),
    dyn_term_ctrl => bidir_dq_oct_out((i)*8+7 downto 0+(i)*8),
    oe            => bidir_dq_oe_out((i)*8+7 downto 0+(i)*8),
    dataio        => ddr_dq((i)*8+7 downto (i)*8+0),
    dataout       => bidir_dq_input_data_in((i)*8+7 downto 0+(i)*8)
  );
  dqs_pad : bidir_dqs_iobuf_inst PORT map(
    datain(0)          => dqs_output_data_out(i),
    dyn_term_ctrl(0)   => dqs_oct_out(i),
    dyn_term_ctrl_b(0) => dqsn_oct_out(i),
    oe(0)              => dqs_oe_out(i),
    oe_b(0)            => dqsn_oe_out(i),
    dataio(0)          => ddr_dqs(i),
    dataio_b(0)        => ddr_dqsn(i),
    dataout(0)         => dqsin(i)
  );

    -- Dummy procces to sample dqsin
    process(clk0r)
    begin
      if rising_edge(clk0r) then
          dqsin_reg(i) <= dqsin(i);
      end if;
    end process;

  end generate;
  -----------------------------------------------------------------------------------
  -- Data bus
  -----------------------------------------------------------------------------------
--    ddgen : for i in 0 to dbits-1 generate
--      -- DQ Input
--      dq_in_pad : adqin port map(
--        clk     => rclk,--clk0r,
--        dq_pad  => ddr_dq(i), -- DQ pad
--        dq_h    => dqin(i), --dqinl(i),
--        dq_l    => dqin(i+dbits),--dqin(i),
--        config_clk    => clk0r,
--        config_clken  => r(i/8).enable,--io_config_clkena,
--        config_datain => r(i/8).sdata,--io_config_datain,
--        config_update => r(i/8).update_delay--io_config_update
--      );
--      --dinq1 : process (clk0r)
--      --begin if rising_edge(clk0r) then dqin(i+dbits) <= dqinl(i); end if; end process;
--
--      -- DQ Output  
--      dq_out_pad : adqout port map(
--        clk       => clk0r, -- clk0
--        clk_oct   => clk90r, -- clk90
--        dq_h      => dqout(i+dbits),
--        dq_l      => dqout(i),
--        dq_oe     => oen,
--        dq_oct    => odt(0),--gnd, -- gnd = disable
--        dq_pad    => ddr_dq(i)  -- DQ pad
--      );
--    end generate;
  -----------------------------------------------------------------------------------
  -- Delay control
  -----------------------------------------------------------------------------------

    delay_control : for i in 0 to dbits/8-1 generate

      process(r(i),cal_en(i), cal_inc(i), delayrst(3))
      variable v : phy_r_type;
      variable data : std_logic_vector(0 to 3);
      begin
        v := r(i);
        data := r(i).delay;
        v.update_delay := '0';
        if cal_en(i) = '1' then
          if cal_inc(i) = '1' then
            v.delay := r(i).delay + 1; 
          else
            v.delay := r(i).delay - 1; 
          end if;
          v.update := '1';
          v.count := (others => '0');
        end if;

        if r(i).update = '1' then
          v.enable := '1';
          v.sdata := '0';

          if r(i).count <= "1011" then
            v.count := r(i).count + 1;
          end if;

          if r(i).count <= "0011" then
            v.sdata := data(conv_integer(r(i).count));
          end if;

          if r(i).count = "1011" then
            v.update_delay := '1';
            v.enable := '0';
            v.update := '0';
          end if;
        end if;

        if delayrst(3) = '0' then
          v.delay := (others => '0');
          v.count := (others => '0');
          v.update := '0';
          v.enable := '0';
        end if;

        rin(i) <= v;
      end process;

    end generate;

      process(clk0r)
      begin 
        if locked = '0' then
          delayrst <= (others => '0');
        elsif rising_edge(clk0r) then
          delayrst <= delayrst(2 downto 0) & '1';
          r <= rin;
          -- PLL phase config
          -- Active puls is extended to be sampled vith scanclk = (ddr clock / 2)
          --rp(0) <= cal_pll(0); rp(1) <= cal_pll(0) or rp(0); 
          rp(0) <= cal_pll(0); rp(1) <= rp(0); rp(2) <= rp(1); rp(3) <= cal_pll(0) or rp(0) or rp(1) or rp(2); 
          --rp(2) <= cal_pll(1); rp(3) <= cal_pll(1) or rp(2);
          --rp(2) <= cal_pll(1); rp(4) <= cal_pll(1) or rp(2); rp(3) <= rp(4);
          rp(4) <= cal_pll(1); rp(5) <= rp(4); rp(6) <= rp(5); rp(7) <= rp(6); rp(8) <= cal_pll(1) or rp(4) or rp(5) or rp(6) or rp(7); 
        end if; 
      end process;

      process(lockl,clk0r)
      begin
        if lockl = '0' then
          rlockl <= '0';
        elsif rising_edge(clk0r) then
          rlockl <= lockl;
        end if;
      end process;
end;



