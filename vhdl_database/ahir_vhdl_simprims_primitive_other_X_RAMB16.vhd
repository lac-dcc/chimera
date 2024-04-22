-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16K-Bit Data and 2K-Bit Parity Single Port Block RAM
-- /___/   /\     Filename : X_RAMB16.vhd
-- \   \  /  \    Timestamp : Thu Mar 17 16:56:02 PST 2005
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    03/17/05 - Added EN_ECC_READ/WRITE -- affects tim sim model only  -- CR 204627 --FP
--    05/24/05 - Fixed CR 200506 --FP
--    08/25/05 - Fixed CR 215294 --FP -- Added Message for unequal WEs in WF mode
--    11/15/05 - Fixed CR 219497 --FP -- made collision functions inout -- ncsim issue
--    01/05/06 - Fixed CR 223161 --FP -- propagated INIT values.
--    02/06/06 - Fixed CR 223097 --FP -- CASCADE/NO_CHANGE message.
--    05/19/06 - Fixed CR 231750 --FP -- Added timing arcs for Cascadein to output.
--    06/30/06 - Fixed CR 231750 --FP -- Added timing checks for CLK to Cascadein.
--    07/10/06 - Added 2 dimensional memory array feature.
--    01/24/07 - Added support of memory file to initialize memory and parity (CR 431584).  
--    02/13/07 - Fixed register output in cascaded mode (CR 433819).
--    03/05/07 - Fixed inverted clock (CR 434198).
--    03/13/07 - Removed attribute INITP_FILE (CR 436003).
--    04/03/07 - Changed INIT_FILE = "NONE" as default (CR 436812). 
--    04/01/08 - Fixed delta delay problem on inputs (CR470144).
--    28/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_RAMB16 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_RAMB16 is

  generic (
    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";


--- VITAL input wire delays

    tipd_ADDRA   : VitalDelayArrayType01(14 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKA    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIA     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPA    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENA     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCEA  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRA    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEA     : VitalDelayArrayType01 (3 downto 0) := (others => (0 ps, 0 ps));
    tipd_CASCADEINA  : VitalDelayType01               := ( 0 ps, 0 ps);

    tipd_ADDRB   : VitalDelayArrayType01(14 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKB    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIB     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPB    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENB     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCEB  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRB    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEB     : VitalDelayArrayType01 (3 downto 0) := (others => (0 ps, 0 ps));
    tipd_CASCADEINB  : VitalDelayType01               := ( 0 ps, 0 ps);


--- VITAL pin-to-pin propagation delays



    tpd_CASCADEINA_DOA  : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tpd_CLKA_DOA  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKA_DOPA : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_CLKA_CASCADEOUTA : VitalDelayType01            := (100 ps, 100 ps);

    tpd_CASCADEINB_DOB  : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tpd_CLKB_DOB  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKB_DOPB : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_CLKB_CASCADEOUTB : VitalDelayType01            := (100 ps, 100 ps);

--- VITAL recovery time 


--- VITAL setup time 

    tsetup_CASCADEINA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_CASCADEINA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;

    thold_CASCADEINA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_CASCADEINA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;

    tsetup_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    tsetup_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIPA_CLKA_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIPA_CLKA_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_WEA_CLKA_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

    tsetup_CASCADEINB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_CASCADEINB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;

    thold_CASCADEINB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_CASCADEINB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;

    tsetup_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    tsetup_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_WEB_CLKB_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

--- VITAL hold time 

    thold_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    thold_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIPA_CLKA_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIPA_CLKA_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_WEA_CLKA_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

    thold_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    thold_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_WEB_CLKB_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);


    ticd_CLKA          : VitalDelayType                     := 0 ps;
    tisd_ADDRA_CLKA    : VitalDelayArrayType(14 downto 0)   := (others => 0 ps);
    tisd_CASCADEINA_CLKA      : VitalDelayType                     := 0 ps;
    tisd_DIA_CLKA      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIPA_CLKA     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_ENA_CLKA      : VitalDelayType                     := 0 ps;
    tisd_REGCEA_CLKA   : VitalDelayType                     := 0 ps;
    tisd_SSRA_CLKA     : VitalDelayType                     := 0 ps;
    tisd_WEA_CLKA      : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);


    ticd_CLKB          : VitalDelayType                     := 0 ps;
    tisd_ADDRB_CLKB    : VitalDelayArrayType(14 downto 0)   := (others => 0 ps);
    tisd_CASCADEINB_CLKB     : VitalDelayType               := 0 ps;
    tisd_DIB_CLKB      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIPB_CLKB     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_ENB_CLKB      : VitalDelayType                     := 0 ps;
    tisd_REGCEB_CLKB   : VitalDelayType                     := 0 ps;
    tisd_SSRB_CLKB     : VitalDelayType                     := 0 ps;
    tisd_WEB_CLKB      : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);

    tperiod_clka_posedge : VitalDelayType := 0 ps;
    tperiod_clkb_posedge : VitalDelayType := 0 ps;

    tpw_CLKA_negedge : VitalDelayType := 0 ps;
    tpw_CLKA_posedge : VitalDelayType := 0 ps;
    tpw_CLKB_negedge : VitalDelayType := 0 ps;
    tpw_CLKB_posedge : VitalDelayType := 0 ps;

    DOA_REG : integer := 0 ;
    DOB_REG : integer := 0 ;

    INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

    INIT_A : bit_vector := X"000000000";
    INIT_B : bit_vector := X"000000000";
    INIT_FILE : string := "NONE";
    
    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    
    INVERT_CLK_DOA_REG : boolean := FALSE;
    INVERT_CLK_DOB_REG : boolean := FALSE;

    RAM_EXTENSION_A : string := "NONE";
    RAM_EXTENSION_B : string := "NONE";

    READ_WIDTH_A : integer := 0;
    READ_WIDTH_B : integer := 0;

    EN_ECC_READ    : boolean := FALSE;
    EN_ECC_WRITE   : boolean := FALSE;

    SETUP_ALL : time := 1000 ps;
    SETUP_READ_FIRST : time := 3000 ps;

    SIM_COLLISION_CHECK : string := "ALL";

    SRVAL_A : bit_vector := X"000000000";
    SRVAL_B : bit_vector := X"000000000";

    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST";

    WRITE_WIDTH_A : integer := 0;
    WRITE_WIDTH_B : integer := 0
    );

  port(
    CASCADEOUTA  : out  std_ulogic;
    CASCADEOUTB  : out  std_ulogic;
    DOA          : out std_logic_vector (31 downto 0);
    DOB          : out std_logic_vector (31 downto 0);
    DOPA         : out std_logic_vector (3 downto 0);
    DOPB         : out std_logic_vector (3 downto 0);

    ADDRA        : in  std_logic_vector (14 downto 0);
    ADDRB        : in  std_logic_vector (14 downto 0);
    CASCADEINA   : in  std_ulogic;
    CASCADEINB   : in  std_ulogic;
    CLKA         : in  std_ulogic;
    CLKB         : in  std_ulogic;
    DIA          : in  std_logic_vector (31 downto 0);
    DIB          : in  std_logic_vector (31 downto 0);
    DIPA         : in  std_logic_vector (3 downto 0);
    DIPB         : in  std_logic_vector (3 downto 0);
    ENA          : in  std_ulogic;
    ENB          : in  std_ulogic;
    REGCEA       : in  std_ulogic;
    REGCEB       : in  std_ulogic;
    SSRA         : in  std_ulogic;
    SSRB         : in  std_ulogic;
    WEA          : in  std_logic_vector (3 downto 0);
    WEB          : in  std_logic_vector (3 downto 0)
    );

  attribute VITAL_LEVEL0 of
    X_RAMB16 : entity is true;

end X_RAMB16;

architecture X_RAMB16_V of X_RAMB16 is

  attribute VITAL_LEVEL0 of
    X_RAMB16_V : architecture is true;

  component X_ARAMB36_INTERNAL
	generic
	(
          BRAM_MODE : string := "TRUE_DUAL_PORT";
          BRAM_SIZE : integer := 36;
          DOA_REG : integer := 0;
          DOB_REG : integer := 0;
          INIT_A : bit_vector := X"000000000000000000";
          INIT_B : bit_vector := X"000000000000000000";
          RAM_EXTENSION_A : string := "NONE";
          RAM_EXTENSION_B : string := "NONE";
          READ_WIDTH_A : integer := 0;
          READ_WIDTH_B : integer := 0;
          SIM_COLLISION_CHECK : string := "ALL";
          SRVAL_A : bit_vector := X"000000000000000000";
          SRVAL_B : bit_vector := X"000000000000000000";
          WRITE_MODE_A : string := "WRITE_FIRST";
          WRITE_MODE_B : string := "WRITE_FIRST";
          WRITE_WIDTH_A : integer := 0;
          WRITE_WIDTH_B : integer := 0;
          SETUP_ALL : time := 1000 ps;
          SETUP_READ_FIRST : time := 3000 ps;
          EN_ECC_READ : boolean := FALSE;
          EN_ECC_SCRUB : boolean := FALSE;
          EN_ECC_WRITE : boolean := FALSE;
          INIT_FILE : string := "NONE";
          
          INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_40 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_41 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_42 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_43 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_44 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_45 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_46 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_47 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_48 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_49 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_50 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_51 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_52 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_53 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_54 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_55 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_56 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_57 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_58 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_59 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_60 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_61 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_62 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_63 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_64 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_65 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_66 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_67 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_68 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_69 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_70 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_71 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_72 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_73 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_74 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_75 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_76 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_77 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_78 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_79 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
           );
	port
	(
          CASCADEOUTLATA : out std_ulogic;
          CASCADEOUTLATB : out std_ulogic;
          CASCADEOUTREGA : out std_ulogic;
          CASCADEOUTREGB : out std_ulogic;
          DBITERR : out std_ulogic;
          DOA : out std_logic_vector(63 downto 0);
          DOB : out std_logic_vector(63 downto 0);
          DOPA : out std_logic_vector(7 downto 0);
          DOPB : out std_logic_vector(7 downto 0);
          ECCPARITY : out std_logic_vector(7 downto 0);
          SBITERR : out std_ulogic;
    
          ADDRA : in std_logic_vector(15 downto 0);
          ADDRB : in std_logic_vector(15 downto 0);
          CASCADEINLATA : in std_ulogic;
          CASCADEINLATB : in std_ulogic;
          CASCADEINREGA : in std_ulogic;
          CASCADEINREGB : in std_ulogic;
          CLKA : in std_ulogic;
          CLKB : in std_ulogic;
          DIA : in std_logic_vector(63 downto 0);
          DIB : in std_logic_vector(63 downto 0);
          DIPA : in std_logic_vector(7 downto 0);
          DIPB : in std_logic_vector(7 downto 0);
          ENA : in std_ulogic;
          ENB : in std_ulogic;
          REGCEA : in std_ulogic;
          REGCEB : in std_ulogic;
          REGCLKA : in std_ulogic;
          REGCLKB : in std_ulogic;
          SSRA : in std_ulogic;
          SSRB : in std_ulogic;
          WEA : in std_logic_vector(7 downto 0);
          WEB : in std_logic_vector(7 downto 0)
 	);
  end component;
  
  constant MAX_ADDR: integer := 13;

  constant MAX_DI:   integer := 31;
  constant MAX_DIP:  integer := 3;
  constant MAX_WE:   integer := 3;

  signal ADDRA_ipd    : std_logic_vector(MAX_ADDR+1 downto 0) := (others => 'X');
  signal CLKA_ipd     : std_ulogic                          := 'X';
  signal DIA_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIPA_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENA_ipd      : std_ulogic                          := 'X';
  signal REGCEA_ipd   : std_ulogic                          := 'X';
  signal SSRA_ipd     : std_ulogic                          := 'X';
  signal WEA_ipd      : std_logic_vector(MAX_WE downto 0)   := (others => 'X');
  signal CASCADEINA_ipd      : std_ulogic                   := 'X';

  signal ADDRB_ipd    : std_logic_vector(MAX_ADDR+1 downto 0) := (others => 'X');
  signal CLKB_ipd     : std_ulogic                          := 'X';
  signal DIB_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIPB_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENB_ipd      : std_ulogic                          := 'X';
  signal REGCEB_ipd   : std_ulogic                          := 'X';
  signal SSRB_ipd     : std_ulogic                          := 'X';
  signal WEB_ipd      : std_logic_vector(MAX_WE downto 0)   := (others => 'X');
  signal CASCADEINB_ipd      : std_ulogic                   := 'X';

  signal GSR_ipd      : std_ulogic                          := 'X';

  signal GSR_dly      : std_ulogic                          := '0';

  signal ADDRA_dly    : std_logic_vector(MAX_ADDR+1 downto 0) := (others => 'X');
  signal CLKA_dly     : std_ulogic                          := 'X';
  signal CLKA_tmp      : std_ulogic                          := 'X';
  signal DIA_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIPA_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENA_dly      : std_ulogic                          := 'X';
  signal GSR_CLKA_dly : std_ulogic                          := '0';
  signal REGCEA_dly   : std_ulogic                          := 'X';
  signal SSRA_dly     : std_ulogic                          := 'X';
  signal WEA_dly      : std_logic_vector(MAX_WE downto 0)   := (others => 'X');
  signal CASCADEINA_dly      : std_ulogic                   := 'X';

  signal ADDRB_dly    : std_logic_vector(MAX_ADDR+1 downto 0) := (others => 'X');
  signal CLKB_dly     : std_ulogic                          := 'X';
  signal CLKB_tmp     : std_ulogic                          := 'X';
  signal DIB_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIPB_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENB_dly      : std_ulogic                          := 'X';
  signal GSR_CLKB_dly : std_ulogic                          := '0';
  signal REGCEB_dly   : std_ulogic                          := 'X';
  signal SSRB_dly     : std_ulogic                          := 'X';
  signal WEB_dly      : std_logic_vector(MAX_WE downto 0)   := (others => 'X');
  signal CASCADEINB_dly      : std_ulogic                   := 'X';

  
  signal GND_4 : std_logic_vector(3 downto 0) := (others => '0');
  signal GND_32 : std_logic_vector(31 downto 0) := (others => '0');
  signal OPEN_4 : std_logic_vector(3 downto 0);
  signal OPEN_32 : std_logic_vector(31 downto 0);
  signal doa_zd : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dob_zd : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dopa_zd : std_logic_vector(3 downto 0) :=  (others => '0');
  signal dopb_zd : std_logic_vector(3 downto 0) :=  (others => '0');
  signal doa_wire : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dob_wire : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dopa_wire : std_logic_vector(3 downto 0) :=  (others => '0');
  signal dopb_wire : std_logic_vector(3 downto 0) :=  (others => '0');
  signal doa_outreg : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dob_outreg : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dopa_outreg : std_logic_vector(3 downto 0) :=  (others => '0');
  signal dopb_outreg : std_logic_vector(3 downto 0) :=  (others => '0');
  signal cascadeouta_zd : std_ulogic := '0';
  signal cascadeoutb_zd : std_ulogic := '0';
  signal cascadeoutlata_out : std_ulogic := '0';
  signal cascadeoutlatb_out : std_ulogic := '0';
  signal cascadeoutrega_out : std_ulogic := '0';
  signal cascadeoutregb_out : std_ulogic := '0';
  signal addra_int : std_logic_vector(15 downto 0) := (others => '0');
  signal addrb_int : std_logic_vector(15 downto 0) := (others => '0');
  signal wea_int : std_logic_vector(7 downto 0) := (others => '0');
  signal web_int : std_logic_vector(7 downto 0) := (others => '0');
  signal regclka_tmp : std_ulogic := '0';
  signal regclkb_tmp : std_ulogic := '0';
  signal dia_tmp : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dib_tmp : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dipa_tmp : std_logic_vector(3 downto 0) :=  (others => '0');
  signal dipb_tmp : std_logic_vector(3 downto 0) :=  (others => '0');
  signal ena_tmp : std_ulogic := '0';
  signal enb_tmp : std_ulogic := '0';
  signal ssra_tmp : std_ulogic := '0';
  signal ssrb_tmp : std_ulogic := '0';
  signal cascadeina_tmp : std_ulogic := '0';
  signal cascadeinb_tmp : std_ulogic := '0';
  signal regcea_tmp : std_ulogic := '0';
  signal regceb_tmp : std_ulogic := '0';
  
  
  function Invert_CLK (
    invert_clk_do_reg : boolean;
    do_reg : integer;
    clk : std_ulogic)
    return std_ulogic is variable out_clk : std_ulogic;
  begin

    if (do_reg = 1 and invert_clk_do_reg = TRUE) then
      out_clk := not clk;
    else
      out_clk := clk;
    end if;

    return out_clk;  
                         
  end;

  
  function Temp_BIT (
    clk : std_ulogic)
    return std_ulogic is variable out_clk : std_ulogic;
  begin

    out_clk := clk;
    return out_clk;  
    
  end;

  
  function Temp_BUS (
    d_in : std_logic_vector)
    return std_logic_vector is variable d_out : std_logic_vector(d_in'length-1 downto 0);
  begin

    d_out := d_in;
    return d_out;  
    
  end;

  
begin

  GSR_CLKA_dly <= GSR;
  GSR_CLKB_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay     : block
  begin

-----  Port A

    ADDRA_DELAY : for i in MAX_ADDR+1 downto 0 generate
      VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
    end generate ADDRA_DELAY;

    DIA_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIPA_ipd(i), DIPA(i), tipd_DIPA(i));
    end generate DIPA_DELAY;

    WEA_DELAY : for i in  MAX_WE downto 0 GENERATE
      VitalWireDelay (WEA_ipd(i) , WEA(i), tipd_WEA(i));
    end generate WEA_DELAY;

    VitalWireDelay (CLKA_ipd, CLKA, tipd_CLKA);
    VitalWireDelay (ENA_ipd, ENA, tipd_ENA);
    VitalWireDelay (REGCEA_ipd, REGCEA, tipd_REGCEA);
    VitalWireDelay (SSRA_ipd, SSRA, tipd_SSRA);
    VitalWireDelay (CASCADEINA_ipd, CASCADEINA, tipd_CASCADEINA);

-----  Port B

    ADDRB_DELAY : for i in MAX_ADDR+1 downto 0 generate
      VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
    end generate ADDRB_DELAY;

    DIB_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIPB_ipd(i), DIPB(i), tipd_DIPB(i));
    end generate DIPB_DELAY;

    WEB_DELAY : for i in  MAX_WE downto 0 GENERATE
      VitalWireDelay (WEB_ipd(i) , WEB(i), tipd_WEB(i));
    end generate WEB_DELAY;

    VitalWireDelay (CLKB_ipd, CLKB, tipd_CLKB);
    VitalWireDelay (ENB_ipd, ENB, tipd_ENB);
    VitalWireDelay (REGCEB_ipd, REGCEB, tipd_REGCEB);
    VitalWireDelay (SSRB_ipd, SSRB, tipd_SSRB);
    VitalWireDelay (CASCADEINB_ipd, CASCADEINB, tipd_CASCADEINB);

----- GSR


  end block;

  SignalDelay   : block
  begin

-----  Port A

    ADDRA_DELAY : for i in MAX_ADDR+1 downto 0 generate
      VitalSignalDelay (ADDRA_dly(i), ADDRA_ipd(i), tisd_ADDRA_CLKA(i));
    end generate ADDRA_DELAY;

    DIA_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DIA_dly(i), DIA_ipd(i), tisd_DIA_CLKA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIPA_dly(i), DIPA_ipd(i), tisd_DIPA_CLKA(i));
    end generate DIPA_DELAY;

    WEA_DELAY   : for i in MAX_WE downto 0 generate
      VitalSignalDelay (WEA_dly(i), WEA_ipd(i), tisd_WEA_CLKA(i));
    end generate WEA_DELAY;

    VitalSignalDelay (CLKA_dly, CLKA_ipd, ticd_CLKA);
    VitalSignalDelay (ENA_dly, ENA_ipd, tisd_ENA_CLKA);
    VitalSignalDelay (REGCEA_dly, REGCEA_ipd, tisd_REGCEA_CLKA);
    VitalSignalDelay (SSRA_dly, SSRA_ipd, tisd_SSRA_CLKA);
    VitalSignalDelay (CASCADEINA_dly, CASCADEINA_ipd, tisd_CASCADEINA_CLKA);

-----  Port B   

    ADDRB_DELAY : for i in MAX_ADDR+1 downto 0 generate
      VitalSignalDelay (ADDRB_dly(i), ADDRB_ipd(i), tisd_ADDRB_CLKB(i));
    end generate ADDRB_DELAY;


    DIB_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DIB_dly(i), DIB_ipd(i), tisd_DIB_CLKB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIPB_dly(i), DIPB_ipd(i), tisd_DIPB_CLKB(i));
    end generate DIPB_DELAY;

    WEB_DELAY   : for i in MAX_WE downto 0 generate
      VitalSignalDelay (WEB_dly(i), WEB_ipd(i), tisd_WEB_CLKB(i));
    end generate WEB_DELAY;

    VitalSignalDelay (CLKB_dly, CLKB_ipd, ticd_CLKB);
    VitalSignalDelay (ENB_dly, ENB_ipd, tisd_ENB_CLKB);
    VitalSignalDelay (REGCEB_dly, REGCEB_ipd, tisd_REGCEB_CLKB);
    VitalSignalDelay (SSRB_dly, SSRB_ipd, tisd_SSRB_CLKB);
    VitalSignalDelay (CASCADEINB_dly, CASCADEINB_ipd, tisd_CASCADEINB_CLKB);

  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------

  prcs_clk : process (clka_dly, clkb_dly, doa_wire, dob_wire, dopa_wire, dopb_wire)
    
    variable FIRST_TIME : boolean := true;

    begin
      
      if (FIRST_TIME) then

        if((INVERT_CLK_DOA_REG = true) and (DOA_REG /= 1 )) then
          assert false
            report "Attribute Syntax Error:  When INVERT_CLK_DOA_REG is set to TRUE, then DOA_REG has to be set to 1."
          severity Failure;
        end if;

        if((INVERT_CLK_DOB_REG = true) and (DOB_REG /= 1 )) then
          assert false
            report "Attribute Syntax Error:  When INVERT_CLK_DOB_REG is set to TRUE, then DOB_REG has to be set to 1."
          severity Failure;
        end if;

        if((INVERT_CLK_DOA_REG /= TRUE) and (INVERT_CLK_DOA_REG /= FALSE)) then
          assert false
            report "Attribute Syntax Error : The allowed boolean values for INVERT_CLK_DOA_REG are TRUE or FALSE"
          severity Failure;
        end if;
        
        if((INVERT_CLK_DOB_REG /= TRUE) and (INVERT_CLK_DOB_REG /= FALSE)) then
          assert false
            report "Attribute Syntax Error : The allowed boolean values for INVERT_CLK_DOB_REG are TRUE or FALSE"
          severity Failure;
        end if;
        
        FIRST_TIME := false;

      end if;

      
      if (DOA_REG = 1 and INVERT_CLK_DOA_REG = TRUE) then

        if (falling_edge(clka_dly) or doa_wire'event or dopa_wire'event) then

          if (EN_ECC_READ = TRUE) then
	    
            doa_outreg <= doa_wire;
            doa_zd <= doa_outreg;
            dopa_outreg <= dopa_wire;
            dopa_zd <= dopa_outreg;

          else
            doa_zd <= doa_wire;
            dopa_zd <= dopa_wire;
          end if;

        end if;

      elsif (INVERT_CLK_DOA_REG = FALSE) then

        if (rising_edge(clka_dly) or doa_wire'event or dopa_wire'event) then

          if (EN_ECC_READ = TRUE) then
	    
            doa_outreg <= doa_wire;
	    doa_zd <= doa_outreg;
	    dopa_outreg <= dopa_wire;
	    dopa_zd <= dopa_outreg;

          else
	    doa_zd <= doa_wire;
	    dopa_zd <= dopa_wire;
          end if;

        end if;

      end if;

      
      if (DOB_REG = 1 and INVERT_CLK_DOB_REG = TRUE) then

        if (falling_edge(clkb_dly) or dob_wire'event or dopb_wire'event) then

          if (EN_ECC_READ = TRUE) then
	    
            dob_outreg <= dob_wire;
            dob_zd <= dob_outreg;
            dopb_outreg <= dopb_wire;
            dopb_zd <= dopb_outreg;

          else
            dob_zd <= dob_wire;
            dopb_zd <= dopb_wire;
          end if;

        end if;

      elsif (INVERT_CLK_DOB_REG = FALSE) then
          
        if (rising_edge(clkb_dly) or dob_wire'event or dopb_wire'event) then

          if (EN_ECC_READ = TRUE) then
	    
            dob_outreg <= dob_wire;
	    dob_zd <= dob_outreg;
	    dopb_outreg <= dopb_wire;
	    dopb_zd <= dopb_outreg;

          else
	    dob_zd <= dob_wire;
	    dopb_zd <= dopb_wire;
          end if;

        end if;

      end if;

    end process prcs_clk;


    prcs_cascadea: process (cascadeoutrega_out, cascadeoutlata_out)

      begin
        
        if (DOA_REG = 1) then
          CASCADEOUTA_zd <= cascadeoutrega_out;
        else
          CASCADEOUTA_zd <= cascadeoutlata_out;  
        end if;

    end process prcs_cascadea;

    
    prcs_cascadeb: process (cascadeoutregb_out, cascadeoutlatb_out)

      begin
        if (DOB_REG = 1) then
          CASCADEOUTB_zd <= cascadeoutregb_out;
        else
          CASCADEOUTB_zd <= cascadeoutlatb_out;  
        end if;

    end process prcs_cascadeb;
    
        
    addra_int <= ADDRA_dly(14) & '0' & ADDRA_dly(13 downto 0);
    addrb_int <= ADDRB_dly(14) & '0' & ADDRB_dly(13 downto 0);
    wea_int <= WEA_dly & WEA_dly;
    web_int <= WEB_dly & WEB_dly;
    regclka_tmp <= Invert_CLK(INVERT_CLK_DOA_REG, DOA_REG, CLKA_dly);
    regclkb_tmp <= Invert_CLK(INVERT_CLK_DOB_REG, DOB_REG, CLKB_dly);
    clka_tmp <= Temp_BIT(CLKA_dly);
    clkb_tmp <= Temp_BIT(CLKB_dly);
    dia_tmp <= Temp_BUS(DIA_dly);
    dib_tmp <= Temp_BUS(DIB_dly);
    dipa_tmp <= Temp_BUS(DIPA_dly);
    dipb_tmp <= Temp_BUS(DIPB_dly); 
    cascadeina_tmp <= Temp_BIT(CASCADEINA_dly);
    cascadeinb_tmp <= Temp_BIT(CASCADEINB_dly);
    ena_tmp <= Temp_BIT(ENA_dly);
    enb_tmp <= Temp_BIT(ENB_dly);
    ssra_tmp <= Temp_BIT(SSRA_dly);
    ssrb_tmp <= Temp_BIT(SSRB_dly);
    regcea_tmp <= Temp_BIT(REGCEA_dly);
    regceb_tmp <= Temp_BIT(REGCEB_dly);
    
    
X_RAMB16_inst : X_ARAMB36_INTERNAL
	generic map (

                DOA_REG => DOA_REG,
                DOB_REG => DOB_REG,
		INIT_A  => INIT_A,
		INIT_B  => INIT_B,
                INIT_FILE => INIT_FILE,
                
		INIT_00 => INIT_00,
		INIT_01 => INIT_01,
		INIT_02 => INIT_02,
		INIT_03 => INIT_03,
		INIT_04 => INIT_04,
		INIT_05 => INIT_05,
		INIT_06 => INIT_06,
		INIT_07 => INIT_07,
		INIT_08 => INIT_08,
		INIT_09 => INIT_09,
		INIT_0A => INIT_0A,
		INIT_0B => INIT_0B,
		INIT_0C => INIT_0C,
		INIT_0D => INIT_0D,
		INIT_0E => INIT_0E,
		INIT_0F => INIT_0F,
		INIT_10 => INIT_10,
		INIT_11 => INIT_11,
		INIT_12 => INIT_12,
		INIT_13 => INIT_13,
		INIT_14 => INIT_14,
		INIT_15 => INIT_15,
		INIT_16 => INIT_16,
		INIT_17 => INIT_17,
		INIT_18 => INIT_18,
		INIT_19 => INIT_19,
		INIT_1A => INIT_1A,
		INIT_1B => INIT_1B,
		INIT_1C => INIT_1C,
		INIT_1D => INIT_1D,
		INIT_1E => INIT_1E,
		INIT_1F => INIT_1F,
		INIT_20 => INIT_20,
		INIT_21 => INIT_21,
		INIT_22 => INIT_22,
		INIT_23 => INIT_23,
		INIT_24 => INIT_24,
		INIT_25 => INIT_25,
		INIT_26 => INIT_26,
		INIT_27 => INIT_27,
		INIT_28 => INIT_28,
		INIT_29 => INIT_29,
		INIT_2A => INIT_2A,
		INIT_2B => INIT_2B,
		INIT_2C => INIT_2C,
		INIT_2D => INIT_2D,
		INIT_2E => INIT_2E,
		INIT_2F => INIT_2F,
		INIT_30 => INIT_30,
		INIT_31 => INIT_31,
		INIT_32 => INIT_32,
		INIT_33 => INIT_33,
		INIT_34 => INIT_34,
		INIT_35 => INIT_35,
		INIT_36 => INIT_36,
		INIT_37 => INIT_37,
		INIT_38 => INIT_38,
		INIT_39 => INIT_39,
		INIT_3A => INIT_3A,
		INIT_3B => INIT_3B,
		INIT_3C => INIT_3C,
		INIT_3D => INIT_3D,
		INIT_3E => INIT_3E,
		INIT_3F => INIT_3F,
                
		INITP_00 => INITP_00,
		INITP_01 => INITP_01,
		INITP_02 => INITP_02,
		INITP_03 => INITP_03,
		INITP_04 => INITP_04,
		INITP_05 => INITP_05,
		INITP_06 => INITP_06,
		INITP_07 => INITP_07,

                EN_ECC_READ => EN_ECC_READ,
                EN_ECC_WRITE => EN_ECC_WRITE,
		SIM_COLLISION_CHECK => SIM_COLLISION_CHECK,
		SRVAL_A => SRVAL_A,
		SRVAL_B => SRVAL_B,
		WRITE_MODE_A => WRITE_MODE_A,
		WRITE_MODE_B => WRITE_MODE_B,                
                BRAM_MODE => "TRUE_DUAL_PORT",
                BRAM_SIZE => 16,
                RAM_EXTENSION_A => RAM_EXTENSION_A,
                RAM_EXTENSION_B => RAM_EXTENSION_B,                
                READ_WIDTH_A => READ_WIDTH_A,
                READ_WIDTH_B => READ_WIDTH_B,
                SETUP_ALL => SETUP_ALL,
                SETUP_READ_FIRST => SETUP_READ_FIRST,
                WRITE_WIDTH_A => WRITE_WIDTH_A,
                WRITE_WIDTH_B => WRITE_WIDTH_B
          
                )
        port map (
                ADDRA => addra_int,
                ADDRB => addrb_int,
                CLKA => clka_tmp,
                CLKB => clkb_tmp,
                DIA(31 downto 0)  => DIA_tmp,
                DIA(63 downto 32) => GND_32,
                DIB(31 downto 0) => DIB_tmp,
                DIB(63 downto 32) => GND_32,
                DIPA(3 downto 0) => DIPA_tmp,
                DIPA(7 downto 4) => GND_4,
                DIPB(3 downto 0) => DIPB_tmp,
                DIPB(7 downto 4) => GND_4,
                ENA => ENA_tmp,
                ENB => ENB_tmp,
                SSRA => SSRA_tmp,
                SSRB => SSRB_tmp,
                WEA => wea_int,
                WEB => web_int,
                DOA(31  downto 0) => doa_wire,
                DOA(63 downto 32) => OPEN_32,
                DOB(31 downto 0) => dob_wire,
                DOB(63 downto 32) => OPEN_32,
                DOPA(3 downto 0) => dopa_wire,
                DOPA(7 downto 4) => OPEN_4,
                DOPB(3 downto 0) => dopb_wire,
                DOPB(7 downto 4) => OPEN_4,
                CASCADEOUTLATA => cascadeoutlata_out,
                CASCADEOUTLATB => cascadeoutlatb_out,
                CASCADEOUTREGA => cascadeoutrega_out,
                CASCADEOUTREGB => cascadeoutregb_out,
                CASCADEINLATA => CASCADEINA_tmp,
                CASCADEINLATB => CASCADEINB_tmp,
                CASCADEINREGA => CASCADEINA_tmp,
                CASCADEINREGB => CASCADEINB_tmp,
                REGCLKA => regclka_tmp,
                REGCLKB => regclkb_tmp,
                REGCEA => REGCEA_tmp,
                REGCEB => REGCEB_tmp
        );


  
   prcs_output:process (CASCADEOUTA_zd, CASCADEOUTB_zd, DOA_zd, DOPA_zd, DOB_zd, DOPB_zd)

    variable ENA_dly_sampled   : std_ulogic                      := 'X';
    variable ENB_dly_sampled   : std_ulogic                      := 'X';


    variable DOA_GlitchData0  : VitalGlitchDataType;
    variable DOA_GlitchData1  : VitalGlitchDataType;
    variable DOA_GlitchData2  : VitalGlitchDataType;
    variable DOA_GlitchData3  : VitalGlitchDataType;
    variable DOA_GlitchData4  : VitalGlitchDataType;
    variable DOA_GlitchData5  : VitalGlitchDataType;
    variable DOA_GlitchData6  : VitalGlitchDataType;
    variable DOA_GlitchData7  : VitalGlitchDataType;
    variable DOA_GlitchData8  : VitalGlitchDataType;
    variable DOA_GlitchData9  : VitalGlitchDataType;
    variable DOA_GlitchData10  : VitalGlitchDataType;
    variable DOA_GlitchData11  : VitalGlitchDataType;
    variable DOA_GlitchData12  : VitalGlitchDataType;
    variable DOA_GlitchData13  : VitalGlitchDataType;
    variable DOA_GlitchData14  : VitalGlitchDataType;
    variable DOA_GlitchData15  : VitalGlitchDataType;
    variable DOA_GlitchData16  : VitalGlitchDataType;
    variable DOA_GlitchData17  : VitalGlitchDataType;
    variable DOA_GlitchData18  : VitalGlitchDataType;
    variable DOA_GlitchData19  : VitalGlitchDataType;
    variable DOA_GlitchData20  : VitalGlitchDataType;
    variable DOA_GlitchData21  : VitalGlitchDataType;
    variable DOA_GlitchData22  : VitalGlitchDataType;
    variable DOA_GlitchData23  : VitalGlitchDataType;
    variable DOA_GlitchData24  : VitalGlitchDataType;
    variable DOA_GlitchData25  : VitalGlitchDataType;
    variable DOA_GlitchData26  : VitalGlitchDataType;
    variable DOA_GlitchData27  : VitalGlitchDataType;
    variable DOA_GlitchData28  : VitalGlitchDataType;
    variable DOA_GlitchData29  : VitalGlitchDataType;
    variable DOA_GlitchData30  : VitalGlitchDataType;
    variable DOA_GlitchData31  : VitalGlitchDataType;
    variable DOPA_GlitchData0 : VitalGlitchDataType;
    variable DOPA_GlitchData1 : VitalGlitchDataType;
    variable DOPA_GlitchData2 : VitalGlitchDataType;
    variable DOPA_GlitchData3 : VitalGlitchDataType;
    variable CASCADEOUTA_GlitchData : VitalGlitchDataType;

    variable DOB_GlitchData0  : VitalGlitchDataType;
    variable DOB_GlitchData1  : VitalGlitchDataType;
    variable DOB_GlitchData2  : VitalGlitchDataType;
    variable DOB_GlitchData3  : VitalGlitchDataType;
    variable DOB_GlitchData4  : VitalGlitchDataType;
    variable DOB_GlitchData5  : VitalGlitchDataType;
    variable DOB_GlitchData6  : VitalGlitchDataType;
    variable DOB_GlitchData7  : VitalGlitchDataType;
    variable DOB_GlitchData8  : VitalGlitchDataType;
    variable DOB_GlitchData9  : VitalGlitchDataType;
    variable DOB_GlitchData10  : VitalGlitchDataType;
    variable DOB_GlitchData11  : VitalGlitchDataType;
    variable DOB_GlitchData12  : VitalGlitchDataType;
    variable DOB_GlitchData13  : VitalGlitchDataType;
    variable DOB_GlitchData14  : VitalGlitchDataType;
    variable DOB_GlitchData15  : VitalGlitchDataType;
    variable DOB_GlitchData16  : VitalGlitchDataType;
    variable DOB_GlitchData17  : VitalGlitchDataType;
    variable DOB_GlitchData18  : VitalGlitchDataType;
    variable DOB_GlitchData19  : VitalGlitchDataType;
    variable DOB_GlitchData20  : VitalGlitchDataType;
    variable DOB_GlitchData21  : VitalGlitchDataType;
    variable DOB_GlitchData22  : VitalGlitchDataType;
    variable DOB_GlitchData23  : VitalGlitchDataType;
    variable DOB_GlitchData24  : VitalGlitchDataType;
    variable DOB_GlitchData25  : VitalGlitchDataType;
    variable DOB_GlitchData26  : VitalGlitchDataType;
    variable DOB_GlitchData27  : VitalGlitchDataType;
    variable DOB_GlitchData28  : VitalGlitchDataType;
    variable DOB_GlitchData29  : VitalGlitchDataType;
    variable DOB_GlitchData30  : VitalGlitchDataType;
    variable DOB_GlitchData31  : VitalGlitchDataType;
    variable DOPB_GlitchData0 : VitalGlitchDataType;
    variable DOPB_GlitchData1 : VitalGlitchDataType;
    variable DOPB_GlitchData2 : VitalGlitchDataType;
    variable DOPB_GlitchData3 : VitalGlitchDataType;
    variable CASCADEOUTB_GlitchData : VitalGlitchDataType;

   begin

    ENA_dly_sampled   := ENA_dly;
    ENB_dly_sampled   := ENB_dly;

    VitalPathDelay01 (
      OutSignal     => CASCADEOUTA,
      GlitchData    => CASCADEOUTA_GlitchData,
      OutSignalName => "CASCADEOUTA",
      OutTemp       => CASCADEOUTA_zd,
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_CASCADEOUTA, (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => DOA_GlitchData0,
      OutSignalName => "DOA(0)",
      OutTemp       => DOA_zd(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(0), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(1),
      GlitchData    => DOA_GlitchData1,
      OutSignalName => "DOA(1)",
      OutTemp       => DOA_zd(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(1), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(2),
      GlitchData    => DOA_GlitchData2,
      OutSignalName => "DOA(2)",
      OutTemp       => DOA_zd(2),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(2), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(3),
      GlitchData    => DOA_GlitchData3,
      OutSignalName => "DOA(3)",
      OutTemp       => DOA_zd(3),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(3), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(4),
      GlitchData    => DOA_GlitchData4,
      OutSignalName => "DOA(4)",
      OutTemp       => DOA_zd(4),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(4), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(5),
      GlitchData    => DOA_GlitchData5,
      OutSignalName => "DOA(5)",
      OutTemp       => DOA_zd(5),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(5), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(6),
      GlitchData    => DOA_GlitchData6,
      OutSignalName => "DOA(6)",
      OutTemp       => DOA_zd(6),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(6), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(7),
      GlitchData    => DOA_GlitchData7,
      OutSignalName => "DOA(7)",
      OutTemp       => DOA_zd(7),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(7), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(8),
      GlitchData    => DOA_GlitchData8,
      OutSignalName => "DOA(8)",
      OutTemp       => DOA_zd(8),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(8), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(9),
      GlitchData    => DOA_GlitchData9,
      OutSignalName => "DOA(9)",
      OutTemp       => DOA_zd(9),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(9), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(10),
      GlitchData    => DOA_GlitchData10,
      OutSignalName => "DOA(10)",
      OutTemp       => DOA_zd(10),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(10), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(11),
      GlitchData    => DOA_GlitchData11,
      OutSignalName => "DOA(11)",
      OutTemp       => DOA_zd(11),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(11), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(12),
      GlitchData    => DOA_GlitchData12,
      OutSignalName => "DOA(12)",
      OutTemp       => DOA_zd(12),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(12), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(13),
      GlitchData    => DOA_GlitchData13,
      OutSignalName => "DOA(13)",
      OutTemp       => DOA_zd(13),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(13), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(14),
      GlitchData    => DOA_GlitchData14,
      OutSignalName => "DOA(14)",
      OutTemp       => DOA_zd(14),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(14), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(15),
      GlitchData    => DOA_GlitchData15,
      OutSignalName => "DOA(15)",
      OutTemp       => DOA_zd(15),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(15), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(16),
      GlitchData    => DOA_GlitchData16,
      OutSignalName => "DOA(16)",
      OutTemp       => DOA_zd(16),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(16), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(17),
      GlitchData    => DOA_GlitchData17,
      OutSignalName => "DOA(17)",
      OutTemp       => DOA_zd(17),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(17), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(18),
      GlitchData    => DOA_GlitchData18,
      OutSignalName => "DOA(18)",
      OutTemp       => DOA_zd(18),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(18), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(19),
      GlitchData    => DOA_GlitchData19,
      OutSignalName => "DOA(19)",
      OutTemp       => DOA_zd(19),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(19), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(20),
      GlitchData    => DOA_GlitchData20,
      OutSignalName => "DOA(20)",
      OutTemp       => DOA_zd(20),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(20), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(21),
      GlitchData    => DOA_GlitchData21,
      OutSignalName => "DOA(21)",
      OutTemp       => DOA_zd(21),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(21), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(22),
      GlitchData    => DOA_GlitchData22,
      OutSignalName => "DOA(22)",
      OutTemp       => DOA_zd(22),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(22), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(23),
      GlitchData    => DOA_GlitchData23,
      OutSignalName => "DOA(23)",
      OutTemp       => DOA_zd(23),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(23), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(24),
      GlitchData    => DOA_GlitchData24,
      OutSignalName => "DOA(24)",
      OutTemp       => DOA_zd(24),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(24), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(25),
      GlitchData    => DOA_GlitchData25,
      OutSignalName => "DOA(25)",
      OutTemp       => DOA_zd(25),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(25), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(26),
      GlitchData    => DOA_GlitchData26,
      OutSignalName => "DOA(26)",
      OutTemp       => DOA_zd(26),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(26), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(27),
      GlitchData    => DOA_GlitchData27,
      OutSignalName => "DOA(27)",
      OutTemp       => DOA_zd(27),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(27), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(28),
      GlitchData    => DOA_GlitchData28,
      OutSignalName => "DOA(28)",
      OutTemp       => DOA_zd(28),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(28), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(29),
      GlitchData    => DOA_GlitchData29,
      OutSignalName => "DOA(29)",
      OutTemp       => DOA_zd(29),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(29), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(30),
      GlitchData    => DOA_GlitchData30,
      OutSignalName => "DOA(30)",
      OutTemp       => DOA_zd(30),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(30), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(31),
      GlitchData    => DOA_GlitchData31,
      OutSignalName => "DOA(31)",
      OutTemp       => DOA_zd(31),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(31), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(0),
      GlitchData    => DOPA_GlitchData0,
      OutSignalName => "DOPA(0)",
      OutTemp       => DOPA_zd(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(0), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(1),
      GlitchData    => DOPA_GlitchData1,
      OutSignalName => "DOPA(1)",
      OutTemp       => DOPA_zd(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(1), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(2),
      GlitchData    => DOPA_GlitchData2,
      OutSignalName => "DOPA(2)",
      OutTemp       => DOPA_zd(2),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(2), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(3),
      GlitchData    => DOPA_GlitchData3,
      OutSignalName => "DOPA(3)",
      OutTemp       => DOPA_zd(3),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(3), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

----- Port B
    VitalPathDelay01 (
      OutSignal     => CASCADEOUTB,
      GlitchData    => CASCADEOUTB_GlitchData,
      OutSignalName => "CASCADEOUTB",
      OutTemp       => CASCADEOUTB_zd,
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_CASCADEOUTB, (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => DOB_GlitchData0,
      OutSignalName => "DOB(0)",
      OutTemp       => DOB_zd(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(0), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => DOB_GlitchData1,
      OutSignalName => "DOB(1)",
      OutTemp       => DOB_zd(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(1), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(2),
      GlitchData    => DOB_GlitchData2,
      OutSignalName => "DOB(2)",
      OutTemp       => DOB_zd(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(2), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(3),
      GlitchData    => DOB_GlitchData3,
      OutSignalName => "DOB(3)",
      OutTemp       => DOB_zd(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(3), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(4),
      GlitchData    => DOB_GlitchData4,
      OutSignalName => "DOB(4)",
      OutTemp       => DOB_zd(4),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(4), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(5),
      GlitchData    => DOB_GlitchData5,
      OutSignalName => "DOB(5)",
      OutTemp       => DOB_zd(5),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(5), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(6),
      GlitchData    => DOB_GlitchData6,
      OutSignalName => "DOB(6)",
      OutTemp       => DOB_zd(6),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(6), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(7),
      GlitchData    => DOB_GlitchData7,
      OutSignalName => "DOB(7)",
      OutTemp       => DOB_zd(7),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(7), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(8),
      GlitchData    => DOB_GlitchData8,
      OutSignalName => "DOB(8)",
      OutTemp       => DOB_zd(8),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(8), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(9),
      GlitchData    => DOB_GlitchData9,
      OutSignalName => "DOB(9)",
      OutTemp       => DOB_zd(9),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(9), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(10),
      GlitchData    => DOB_GlitchData10,
      OutSignalName => "DOB(10)",
      OutTemp       => DOB_zd(10),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(10), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(11),
      GlitchData    => DOB_GlitchData11,
      OutSignalName => "DOB(11)",
      OutTemp       => DOB_zd(11),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(11), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(12),
      GlitchData    => DOB_GlitchData12,
      OutSignalName => "DOB(12)",
      OutTemp       => DOB_zd(12),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(12), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(13),
      GlitchData    => DOB_GlitchData13,
      OutSignalName => "DOB(13)",
      OutTemp       => DOB_zd(13),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(13), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(14),
      GlitchData    => DOB_GlitchData14,
      OutSignalName => "DOB(14)",
      OutTemp       => DOB_zd(14),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(14), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(15),
      GlitchData    => DOB_GlitchData15,
      OutSignalName => "DOB(15)",
      OutTemp       => DOB_zd(15),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(15), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(16),
      GlitchData    => DOB_GlitchData16,
      OutSignalName => "DOB(16)",
      OutTemp       => DOB_zd(16),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(16), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(17),
      GlitchData    => DOB_GlitchData17,
      OutSignalName => "DOB(17)",
      OutTemp       => DOB_zd(17),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(17), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(18),
      GlitchData    => DOB_GlitchData18,
      OutSignalName => "DOB(18)",
      OutTemp       => DOB_zd(18),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(18), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(19),
      GlitchData    => DOB_GlitchData19,
      OutSignalName => "DOB(19)",
      OutTemp       => DOB_zd(19),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(19), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(20),
      GlitchData    => DOB_GlitchData20,
      OutSignalName => "DOB(20)",
      OutTemp       => DOB_zd(20),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(20), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(21),
      GlitchData    => DOB_GlitchData21,
      OutSignalName => "DOB(21)",
      OutTemp       => DOB_zd(21),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(21), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(22),
      GlitchData    => DOB_GlitchData22,
      OutSignalName => "DOB(22)",
      OutTemp       => DOB_zd(22),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(22), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(23),
      GlitchData    => DOB_GlitchData23,
      OutSignalName => "DOB(23)",
      OutTemp       => DOB_zd(23),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(23), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(24),
      GlitchData    => DOB_GlitchData24,
      OutSignalName => "DOB(24)",
      OutTemp       => DOB_zd(24),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(24), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(25),
      GlitchData    => DOB_GlitchData25,
      OutSignalName => "DOB(25)",
      OutTemp       => DOB_zd(25),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(25), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(26),
      GlitchData    => DOB_GlitchData26,
      OutSignalName => "DOB(26)",
      OutTemp       => DOB_zd(26),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(26), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(27),
      GlitchData    => DOB_GlitchData27,
      OutSignalName => "DOB(27)",
      OutTemp       => DOB_zd(27),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(27), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(28),
      GlitchData    => DOB_GlitchData28,
      OutSignalName => "DOB(28)",
      OutTemp       => DOB_zd(28),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(28), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(29),
      GlitchData    => DOB_GlitchData29,
      OutSignalName => "DOB(29)",
      OutTemp       => DOB_zd(29),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(29), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(30),
      GlitchData    => DOB_GlitchData30,
      OutSignalName => "DOB(30)",
      OutTemp       => DOB_zd(30),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(30), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(31),
      GlitchData    => DOB_GlitchData31,
      OutSignalName => "DOB(31)",
      OutTemp       => DOB_zd(31),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(31), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(0),
      GlitchData    => DOPB_GlitchData0,
      OutSignalName => "DOPB(0)",
      OutTemp       => DOPB_zd(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(0), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(1),
      GlitchData    => DOPB_GlitchData1,
      OutSignalName => "DOPB(1)",
      OutTemp       => DOPB_zd(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(1), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(2),
      GlitchData    => DOPB_GlitchData2,
      OutSignalName => "DOPB(2)",
      OutTemp       => DOPB_zd(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(2), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(3),
      GlitchData    => DOPB_GlitchData3,
      OutSignalName => "DOPB(3)",
      OutTemp       => DOPB_zd(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(3), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
   end process prcs_output;

end X_RAMB16_V;

