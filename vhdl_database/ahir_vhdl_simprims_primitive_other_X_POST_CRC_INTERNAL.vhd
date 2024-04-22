-------------------------------------------------------
--  Copyright (c) 2008 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : X_POST_CRC_INTERNAL.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------

----- CELL X_POST_CRC_INTERNAL -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;
library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

  entity X_POST_CRC_INTERNAL is
    port (
      CRCERROR             : out std_ulogic := '0'     
    );
  end X_POST_CRC_INTERNAL;

  architecture X_POST_CRC_INTERNAL_V of X_POST_CRC_INTERNAL is
    component B_POST_CRC_INTERNAL
      port (
        CRCERROR             : out std_ulogic        
      );
    end component;
  begin
    
  end X_POST_CRC_INTERNAL_V;
