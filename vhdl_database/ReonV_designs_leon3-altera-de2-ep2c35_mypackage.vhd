library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.amba.all;
--use grlib.devices.all;
--use grlib.stdlib.all;
--library techmap;
--use techmap.gencomp.all;
library gaisler;
use gaisler.memctrl.all;

package mypackage is

  type lcd_out_type is record
    rs    : std_ulogic;
    rw    : std_ulogic;
    e     : std_ulogic;
    db    : std_logic_vector(7 downto 0);
    db_oe : std_ulogic;
  end record;

  type lcd_in_type is record
    db : std_logic_vector(7 downto 0);
  end record;

component sdctrl16
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#f00#;
    ioaddr  : integer := 16#000#;
    iomask  : integer := 16#fff#;
    wprot   : integer := 0;
    invclk  : integer := 0;
    fast    : integer := 0;
    pwron   : integer := 0;
    sdbits  : integer := 16;
    oepol   : integer := 0;
    pageburst : integer := 0;
    mobile  : integer := 0
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type;
    sdi     : in  sdctrl_in_type;
    sdo     : out sdctrl_out_type
  );
end component;

component apblcd
  generic (
    pindex  : integer := 0;
    paddr   : integer := 0;
    pmask   : integer := 16#fff#;
    oepol   : integer range 0 to 1 := 0;
    tas     : integer range 0 to 15 := 1;
    epw     : integer range 0 to 127 := 12
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    apbi    : in apb_slv_in_type;
    apbo    : out apb_slv_out_type;
    lcdo    : out lcd_out_type;
    lcdi    : in lcd_in_type
  );
end component;

end;

