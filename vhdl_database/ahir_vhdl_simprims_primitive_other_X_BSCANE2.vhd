-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Boundary Scan Logic Control Circuit for VIRTEX7
-- /___/   /\     Filename : X_BSCANE2.v
-- \   \  /  \    Timestamp : Mon Feb  8 22:06:39 PST 2010
--  \___\/\___\
--
-- Revision:
--    02/08/10 - Initial version.
-- End Revision


----- CELL X_BSCANE2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.vcomponents.all;

entity X_BSCANE2 is
  generic(
        DISABLE_JTAG : string := "FALSE";
        JTAG_CHAIN : integer := 1;
        LOC : string  := "UNPLACED";

--  VITAL input Pin path delay variables
        tipd_TDO           : VitalDelayType01 := (0 ps, 0 ps)
        );

  port(
    CAPTURE : out std_ulogic := 'H';
    DRCK    : out std_ulogic := 'H';
    RESET   : out std_ulogic := 'H';
    RUNTEST : out std_ulogic := 'L';
    SEL     : out std_ulogic := 'L';
    SHIFT   : out std_ulogic := 'L';
    TCK     : out std_ulogic := 'L';
    TDI     : out std_ulogic := 'L';
    TMS     : out std_ulogic := 'L';
    UPDATE  : out std_ulogic := 'L';

    TDO     : in std_ulogic := '0'
    );

end X_BSCANE2;

architecture X_BSCANE2_V of X_BSCANE2 is

  signal SEL_zd    : std_ulogic := '0';
  signal UPDATE_zd : std_ulogic := '0';
  signal TDO_ipd   : std_ulogic := '0';


begin

  WireDelay : block
  begin
    VitalWireDelay (TDO_ipd,              TDO,              tipd_TDO);
  end block;


--####################################################################
--#####                        Initialization                      ###
--####################################################################
  prcs_init:process
  begin

     if((DISABLE_JTAG /= "FALSE") and (DISABLE_JTAG /= "false") and (DISABLE_JTAG /= "TRUE") and  (DISABLE_JTAG /= "true")) then
        assert FALSE 
        report "Attribute Syntax Error : The allowed values for DISABLE_JTAG are  TRUE or false." 
        severity Failure;
     end if;

     if((JTAG_CHAIN /= 1) and (JTAG_CHAIN /= 2)  and (JTAG_CHAIN /= 3)
                                           and (JTAG_CHAIN /= 4)) then
        assert false
        report "Attribute Syntax Error: The allowed values for JTAG_CHAIN are 1, 2, 3 or 4"
        severity Failure;
     end if;

     wait;
  end process prcs_init;

-- synopsys translate_off

--####################################################################
--#####                        jtag_select                         ###
--####################################################################
  prcs_jtag_select:process (JTAG_SEL1_GLBL, JTAG_SEL2_GLBL, JTAG_SEL3_GLBL, JTAG_SEL4_GLBL)
  begin
      if(JTAG_CHAIN = 1) then
        SEL_zd <= JTAG_SEL1_GLBL;
      elsif(JTAG_CHAIN = 2) then
        SEL_zd <= JTAG_SEL2_GLBL;
      elsif(JTAG_CHAIN = 3) then
        SEL_zd <= JTAG_SEL3_GLBL;
      elsif(JTAG_CHAIN = 4) then
        SEL_zd <= JTAG_SEL4_GLBL;
     end if;

  end process prcs_jtag_select;

--####################################################################
--#####                        USER_TDO                            ###
--####################################################################
  prcs_jtag_UserTDO:process (TDO_ipd)
  begin
      if(JTAG_CHAIN = 1) then
        JTAG_USER_TDO1_GLBL <= TDO_ipd;
      elsif(JTAG_CHAIN = 2) then
        JTAG_USER_TDO2_GLBL <= TDO_ipd;
      elsif(JTAG_CHAIN = 3) then
        JTAG_USER_TDO3_GLBL <= TDO_ipd;
      elsif(JTAG_CHAIN = 4) then
        JTAG_USER_TDO4_GLBL <= TDO_ipd;
     end if;

  end process prcs_jtag_UserTDO;
--####################################################################

  CAPTURE <= JTAG_CAPTURE_GLBL;
  DRCK  <= ((SEL_zd and not JTAG_SHIFT_GLBL and not JTAG_CAPTURE_GLBL) or
            (SEL_zd and JTAG_SHIFT_GLBL and JTAG_TCK_GLBL) or
            (SEL_zd and JTAG_CAPTURE_GLBL and JTAG_TCK_GLBL));

  RESET   <= JTAG_RESET_GLBL;
  RUNTEST <= JTAG_RUNTEST_GLBL;
  SEL     <= SEL_zd;
  SHIFT   <= JTAG_SHIFT_GLBL;
  TDI     <= JTAG_TDI_GLBL;
  TCK     <= JTAG_TCK_GLBL;
  TMS     <= JTAG_TMS_GLBL;
  UPDATE  <= JTAG_UPDATE_GLBL;

-- synopsys translate_on

end X_BSCANE2_V;
