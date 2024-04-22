-------------------------------------------------------
--  Copyright (c) 2010 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : X_STARTUP_VIRTEX6_SELF_TIMING.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
-- Revision:
--    04/21/10 - CR 556563
-- End Revision

----- CELL X_STARTUP_VIRTEX6_SELF_TIMING -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_STARTUP_VIRTEX6_SELF_TIMING is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      PROG_USR : boolean := FALSE;
      tipd_CLK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_GSR : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_GTS : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_KEYCLEARB : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_PACK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRCCLKO : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRCCLKTS : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRDONEO : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRDONETS : VitalDelayType01 :=  (0 ps, 0 ps)
    );

    port (
      CFGCLK               : out std_ulogic;
      CFGMCLK              : out std_ulogic;
      DINSPI               : out std_ulogic;
      EOS                  : out std_ulogic;
      PREQ                 : out std_ulogic;
      TCKSPI               : out std_ulogic;
      CLK                  : in std_ulogic := 'L';
      GSR                  : in std_ulogic := 'L';
      GTS                  : in std_ulogic := 'L';
      KEYCLEARB            : in std_ulogic := 'H';
      PACK                 : in std_ulogic := 'L';
      USRCCLKO             : in std_ulogic := 'L';
      USRCCLKTS            : in std_ulogic := 'H';
      USRDONEO             : in std_ulogic := 'L';
      USRDONETS            : in std_ulogic := 'H'      
    );
    attribute VITAL_LEVEL0 of X_STARTUP_VIRTEX6_SELF_TIMING :     entity is true;
  end X_STARTUP_VIRTEX6_SELF_TIMING;

  architecture X_STARTUP_VIRTEX6_SELF_TIMING_V of X_STARTUP_VIRTEX6_SELF_TIMING is
    constant   CFGMCLK_PERIOD : time       := 20000 ps;
    signal     CFGMCLK_zd     : std_ulogic := '0';

    begin
       CFGMCLK_zd <= not CFGMCLK_zd after CFGMCLK_PERIOD/2.0;
       CFGMCLK <= CFGMCLK_zd;
    end X_STARTUP_VIRTEX6_SELF_TIMING_V;
