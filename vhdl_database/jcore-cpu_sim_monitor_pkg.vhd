library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.cpu2j0_pack.all;

package monitor_pkg is

  type timeout_t is record
    cnt : integer range 0 to 10;
  end record;

  type cnt_reg_t is record
  a : std_logic;
  cnt : integer range 0 to 10;
  end record;

constant CNT_REG_RESET : cnt_reg_t := ('0',0);

  component timeout_cnt
    port(
      clk : in std_logic;
      rst : in std_logic;
      enable : in std_logic;
      ack : in std_logic;
      timeout : out timeout_t;
      fault : out std_logic
      );
  end component;

  component bus_monitor
    generic ( memblock : string := "IF"); 
    port (
          clk : in std_logic;
          rst : in std_logic;
          cpu_bus_o : in cpu_data_o_t;
          cpu_bus_i : in cpu_data_i_t
          );
  end component;

end package;
