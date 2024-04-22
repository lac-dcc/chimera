library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.all;


entity ebs_btd_fifo is

 generic
 (
  EBS_AD_RNGE: natural := 12;
  EBS_AD_BASE: natural := 1;
  EBS_AD_OFST: natural := 0;
  EBS_MIRQ: std16 := ( 0 => '1', others => '0' )
 );
 port
 (
  -- ebone slave interface
  eb_clk_i: in std_logic;
  eb_rst_i: in std_logic;
  eb_bmx_i: in std_logic;
  eb_as_i: in std_logic;
  eb_eof_i: in std_logic;
  eb_dat_i: in std32;
  eb_dk_o: out std_logic;
  eb_err_o: out std_logic;
  eb_dat_o: out std32;

  -- bgu interface
  bgu_wr_en_o: out std_logic;
  bgu_wr_dat_o: out std_logic_vector(work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
  bgu_wr_full_i: in std_logic
 );

end ebs_btd_fifo;


architecture ebs_btd_fifo_arch of ebs_btd_fifo is

 -- ebs btd fifo 32 bits register map
 -- control (first bit wired wr_en_o, self clears)
 -- btd[0]
 -- btd[1]
 -- ...
 -- btd[N]
 -- status

 -- rw control register
 constant CTL_REG_INDEX: natural := 0;
 constant BTD_REG_INDEX: natural := 1;
 constant RW_REG_COUNT: natural :=
  BTD_REG_INDEX + work.rashpa.BTD_FIFO_WIDTH / 32;

 -- ro status register
 constant STA_REG_INDEX: natural := RW_REG_COUNT;
 constant RO_REG_COUNT: natural := 16 - RW_REG_COUNT;

 -- registers
 signal regs_rw_dat: std32_a(RW_REG_COUNT - 1 downto 0);
 signal regs_ro_dat: std32_a(15 downto RW_REG_COUNT);

 signal bgu_wr_dat: std_logic_vector(work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);

begin

 -- registers

 ebs_regs:
 work.ebs_regs_pkg.ebs_regs
 generic map
 (
  EBS_AD_RNGE => EBS_AD_RNGE,
  EBS_AD_BASE => EBS_AD_BASE,
  EBS_AD_SIZE => 16,
  EBS_AD_OFST => EBS_AD_OFST,
  REG_RO_SIZE => RO_REG_COUNT,
  REG_WO_BITS => 1
 )
 port map
 (
  eb_clk_i => eb_clk_i,
  eb_rst_i => eb_rst_i,

  -- ebone slave
  eb_bmx_i => eb_bmx_i,
  eb_as_i => eb_as_i,
  eb_eof_i => eb_eof_i,
  eb_dat_i => eb_dat_i,
  eb_dk_o => eb_dk_o,
  eb_err_o => eb_err_o,
  eb_dat_o => eb_dat_o,

  -- register
  regs_o => regs_rw_dat,
  regs_i => regs_ro_dat,
  regs_irq_i => '0',
  regs_iak_o => open,
  regs_ofsrd_o => open,
  regs_ofswr_o => open,
  regs_ofs_o => open,
  reg0_sclr_i => '1'
 );

 generate_wr_dat: for i in BTD_REG_INDEX to RW_REG_COUNT - 1 generate
  bgu_wr_dat((i + 1 - BTD_REG_INDEX) * 32 - 1 downto (i - BTD_REG_INDEX) * 32)
   <= regs_rw_dat(i);
 end generate;

 process(eb_clk_i, eb_rst_i)
 begin
  if eb_rst_i = '1' then
   regs_ro_dat(STA_REG_INDEX) <= (others => '0');
   bgu_wr_en_o <= '0';
   bgu_wr_dat_o <= (others => '0');
  elsif rising_edge(eb_clk_i) then
   regs_ro_dat(STA_REG_INDEX)(0) <= bgu_wr_full_i;
   bgu_wr_en_o <= regs_rw_dat(CTL_REG_INDEX)(0);
   bgu_wr_dat_o <= bgu_wr_dat;
  end if;
 end process;

end ebs_btd_fifo_arch;
