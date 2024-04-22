-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_EFUSE_USR.vhd,v 1.5 2010/01/14 19:35:25 fphillip Exp $
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
-- /___/   /\      Filename    : X_EFUSE_USR.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------

----- CELL X_EFUSE_USR -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_EFUSE_USR is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      SIM_EFUSE_VALUE : bit_vector := X"00000000"
    );

    port (
      EFUSEUSR             : out std_logic_vector(31 downto 0)    
);
    attribute VITAL_LEVEL0 of X_EFUSE_USR :     entity is true;
  end X_EFUSE_USR;

  architecture X_EFUSE_USR_V of X_EFUSE_USR is
    constant SIM_EFUSE_VALUE_BINARY : std_logic_vector(31 downto 0) := To_StdLogicVector(SIM_EFUSE_VALUE);
    begin
    
    EFUSEUSR <= SIM_EFUSE_VALUE_BINARY;

  end X_EFUSE_USR_V;
