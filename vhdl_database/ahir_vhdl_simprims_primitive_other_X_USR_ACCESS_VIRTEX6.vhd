-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_USR_ACCESS_VIRTEX6.vhd,v 1.5 2010/01/14 19:35:25 fphillip Exp $
-------------------------------------------------------
--  Copyright (c) 2009 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : X_USR_ACCESS_VIRTEX6.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------

----- CELL X_USR_ACCESS_VIRTEX6 -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_USR_ACCESS_VIRTEX6 is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED"
    );

    port (
      CFGCLK               : out std_ulogic;
      DATA                 : out std_logic_vector(31 downto 0);
      DATAVALID            : out std_ulogic
    );
    attribute VITAL_LEVEL0 of X_USR_ACCESS_VIRTEX6 :     entity is true;
  end X_USR_ACCESS_VIRTEX6;

  architecture X_USR_ACCESS_VIRTEX6_V of X_USR_ACCESS_VIRTEX6 is
    
    begin
    
  end X_USR_ACCESS_VIRTEX6_V;
