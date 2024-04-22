
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
-- pragma translate_off
library unisim;
use unisim.ODDR;
use unisim.IBUFDS_GTXE1;
-- pragma translate_on

library techmap;
use techmap.gencomp.all;

entity gtxclk is
  port ( clk_p       : in  std_logic;        -- input clock
         clk_n       : in  std_logic;        -- input clock
         clkint      : out std_ulogic;        -- internal gtx clock
         clkout      : out std_ulogic        -- external DDR clock
  );
end;
architecture rtl of gtxclk is

component IBUFDS_GTXE1
  generic (
     CLKCM_CFG : boolean := TRUE;
     CLKRCV_TRST : boolean := TRUE;
     REFCLKOUT_DLY : bit_vector := b"0000000000"
  );
  port (
     O : out std_ulogic;
     ODIV2 : out std_ulogic;
     CEB : in std_ulogic;
     I : in std_ulogic;
     IB : in std_ulogic
  );
end component;

  component BUFG port (O : out std_logic; I : in std_logic); end component;

  component ODDR
    generic
      ( DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
--        INIT : bit := '0';
        SRTYPE : string := "SYNC");
    port
      (
        Q : out std_ulogic;
        C : in std_ulogic;
        CE : in std_ulogic;
        D1 : in std_ulogic;
        D2 : in std_ulogic;
        R : in std_ulogic;
        S : in std_ulogic
      );
  end component;

signal vcc, gnd, clkl, clkin : std_ulogic;

begin

  vcc <= '1'; gnd <= '0';

  x0 : ODDR port map ( Q => clkout, C => clkin, CE => vcc,
		D1 => gnd, D2 => vcc, R => gnd, S => gnd);

   x1 : IBUFDS_GTXE1
   port map ( O => clkl, ODIV2 => open, CEB => gnd,
        I => clk_p, IB => clk_n);

   x2 : BUFG port map (I => clkl, O => clkin);

  clkint <= clkin;

end;
           


