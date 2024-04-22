library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.all;


package ebs_btd_fifo_pkg is

component ebs_btd_fifo
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
end component;

end package ebs_btd_fifo_pkg;
