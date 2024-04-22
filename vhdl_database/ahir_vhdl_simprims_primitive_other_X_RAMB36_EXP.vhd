-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_RAMB36_EXP.vhd,v 1.3 2010/01/14 19:38:17 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2005 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  32K-Bit Data and 4K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : X_RAMB36_EXP.vhd
-- \   \  /  \    Timestamp : Tues October 18 16:43:59 PST 2005
--  \___\/\___\
--
-- Revision:
--    10/18/05 - Initial version.
--    08/21/06 - Fixed vital delay for vcs_mx (CR 419867).  
--    10/02/06 - Added missing path delays for cascadein to do (CR 425602).
--    01/04/07 - Added support of memory file to initialize memory and parity (CR 431584).
--    02/21/07 - Added timing check for SSR to RDRCLK (CR 434555).  
--    03/14/07 - Removed attribute INITP_FILE (CR 436003).
--    04/03/07 - Changed INIT_FILE = "NONE" as default (CR 436812).
--    08/17/07 - Added setup/hold violation message on address w.r.t. clock (CR 436931).
-- End Revision

----- CELL X_RAMB36_EXP -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.STD_LOGIC_TEXTIO.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_RAMB36_EXP is
generic (

    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;

    DOA_REG : integer := 0;
    DOB_REG : integer := 0;
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
    INITP_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
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
    INIT_A : bit_vector := X"000000000";
    INIT_B : bit_vector := X"000000000";
    INIT_FILE : string := "NONE";
    LOC : string := "UNPLACED";
    RAM_EXTENSION_A : string := "NONE";
    RAM_EXTENSION_B : string := "NONE";
    READ_WIDTH_A : integer := 0;
    READ_WIDTH_B : integer := 0;
    SETUP_ALL : time := 1000 ps;
    SETUP_READ_FIRST : time := 3000 ps;
    SIM_COLLISION_CHECK : string := "ALL";
    SRVAL_A : bit_vector := X"000000000";
    SRVAL_B : bit_vector := X"000000000";
    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST";
    WRITE_WIDTH_A : integer := 0;
    WRITE_WIDTH_B : integer := 0;


--- VITAL input wire delays

    tipd_ADDRAL   : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKAL    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCLKAL    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIA     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPA    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENAL     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCEAL  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRAL    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEAL     : VitalDelayArrayType01 (3 downto 0) := (others => (0 ps, 0 ps));
    tipd_CASCADEINLATA  : VitalDelayType01               := ( 0 ps, 0 ps);
    tipd_CASCADEINREGA  : VitalDelayType01               := ( 0 ps, 0 ps);

    tipd_ADDRBL   : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKBL    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCLKBL    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIB     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPB    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENBL     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCEBL  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRBL    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEBL     : VitalDelayArrayType01 (7 downto 0) := (others => (0 ps, 0 ps));
    tipd_CASCADEINLATB  : VitalDelayType01               := ( 0 ps, 0 ps);
    tipd_CASCADEINREGB  : VitalDelayType01               := ( 0 ps, 0 ps);
    

--- VITAL pin-to-pin propagation delays

    tpd_CASCADEINLATA_DOA : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tpd_CASCADEINREGA_DOA : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    
    tpd_CASCADEINLATB_DOB : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tpd_CASCADEINREGB_DOB : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    
    tpd_CLKAL_DOA  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKAL_DOPA : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_CLKAL_CASCADEOUTLATA : VitalDelayType01            := (100 ps, 100 ps);
    tpd_REGCLKAL_DOA  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_REGCLKAL_DOPA : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_REGCLKAL_CASCADEOUTREGA : VitalDelayType01            := (100 ps, 100 ps);
    
    tpd_CLKBL_DOB  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKBL_DOPB : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_CLKBL_CASCADEOUTLATB : VitalDelayType01            := (100 ps, 100 ps);
    tpd_REGCLKBL_DOB  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_REGCLKBL_DOPB : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_REGCLKBL_CASCADEOUTREGB : VitalDelayType01            := (100 ps, 100 ps);

--- VITAL recovery time 


--- VITAL setup time 

    tsetup_ADDRAL_CLKAL_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_ADDRAL_CLKAL_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKAL_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKAL_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIPA_CLKAL_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIPA_CLKAL_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_ENAL_CLKAL_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENAL_CLKAL_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_CLKAL_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_CLKAL_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_CLKAL_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_CLKAL_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_REGCLKAL_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_REGCLKAL_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_REGCLKAL_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEAL_REGCLKAL_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_SSRAL_CLKAL_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRAL_CLKAL_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRAL_REGCLKAL_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRAL_REGCLKAL_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEAL_CLKAL_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_WEAL_CLKAL_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

    tsetup_ADDRBL_CLKBL_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_ADDRBL_CLKBL_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKBL_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKBL_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIPB_CLKBL_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIPB_CLKBL_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_ENBL_CLKBL_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENBL_CLKBL_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_CLKBL_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_CLKBL_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_CLKBL_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_CLKBL_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_REGCLKBL_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_REGCLKBL_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_REGCLKBL_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEBL_REGCLKBL_negedge_negedge : VitalDelayType                   := 0 ps;    
    tsetup_SSRBL_CLKBL_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRBL_CLKBL_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRBL_REGCLKBL_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRBL_REGCLKBL_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEBL_CLKBL_negedge_posedge    : VitalDelayArrayType(7 downto 0)  := (others => 0 ps);
    tsetup_WEBL_CLKBL_posedge_posedge    : VitalDelayArrayType(7 downto 0)  := (others => 0 ps);

--- VITAL hold time 

    thold_ADDRAL_CLKAL_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_ADDRAL_CLKAL_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIA_CLKAL_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIA_CLKAL_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIPA_CLKAL_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIPA_CLKAL_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_ENAL_CLKAL_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENAL_CLKAL_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCEAL_CLKAL_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_CLKAL_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_CLKAL_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_CLKAL_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_REGCLKAL_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_REGCLKAL_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_REGCLKAL_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEAL_REGCLKAL_negedge_negedge : VitalDelayType                   := 0 ps;    
    thold_SSRAL_CLKAL_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRAL_CLKAL_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRAL_REGCLKAL_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRAL_REGCLKAL_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEAL_CLKAL_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_WEAL_CLKAL_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

    thold_ADDRBL_CLKBL_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_ADDRBL_CLKBL_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIB_CLKBL_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIB_CLKBL_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIPB_CLKBL_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIPB_CLKBL_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_ENBL_CLKBL_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENBL_CLKBL_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCEBL_CLKBL_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_CLKBL_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_CLKBL_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_CLKBL_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_REGCLKBL_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_REGCLKBL_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_REGCLKBL_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEBL_REGCLKBL_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_SSRBL_CLKBL_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRBL_CLKBL_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRBL_REGCLKBL_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRBL_REGCLKBL_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEBL_CLKBL_negedge_posedge    : VitalDelayArrayType(7 downto 0)  := (others => 0 ps);
    thold_WEBL_CLKBL_posedge_posedge    : VitalDelayArrayType(7 downto 0)  := (others => 0 ps);


    ticd_CLKAL          : VitalDelayType                     := 0 ps;
    ticd_REGCLKAL          : VitalDelayType                     := 0 ps;
    tisd_ADDRAL_CLKAL    : VitalDelayArrayType(15 downto 0)   := (others => 0 ps);
    tisd_DIA_CLKAL      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIPA_CLKAL     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_ENAL_CLKAL      : VitalDelayType                     := 0 ps;
    tisd_REGCEAL_CLKAL   : VitalDelayType                     := 0 ps;
    tisd_REGCEAL_REGCLKAL   : VitalDelayType                     := 0 ps;
    tisd_SSRAL_CLKAL     : VitalDelayType                     := 0 ps;
    tisd_SSRAL_REGCLKAL     : VitalDelayType                     := 0 ps;
    tisd_CASCADEINLATA_CLKAL     : VitalDelayType               := 0 ps;
    tisd_CASCADEINREGA_CLKAL     : VitalDelayType               := 0 ps;
    tisd_WEAL_CLKAL      : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);


    ticd_CLKBL          : VitalDelayType                     := 0 ps;
    ticd_REGCLKBL          : VitalDelayType                     := 0 ps;
    tisd_ADDRBL_CLKBL    : VitalDelayArrayType(15 downto 0)   := (others => 0 ps);
    tisd_DIB_CLKBL      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIPB_CLKBL     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_ENBL_CLKBL      : VitalDelayType                     := 0 ps;
    tisd_REGCEBL_CLKBL   : VitalDelayType                     := 0 ps;
    tisd_SSRBL_CLKBL     : VitalDelayType                     := 0 ps;
    tisd_SSRBL_REGCLKBL     : VitalDelayType                     := 0 ps;
    tisd_CASCADEINLATB_CLKBL     : VitalDelayType               := 0 ps;
    tisd_CASCADEINREGB_CLKBL     : VitalDelayType               := 0 ps;
    tisd_WEBL_CLKBL      : VitalDelayArrayType(7 downto 0)    := (others => 0 ps);

    tperiod_clkal_posedge : VitalDelayType := 0 ps;
    tperiod_clkbl_posedge : VitalDelayType := 0 ps;
    tperiod_regclkal_posedge : VitalDelayType := 0 ps;
    tperiod_regclkbl_posedge : VitalDelayType := 0 ps;
    
    tpw_CLKAL_negedge : VitalDelayType := 0 ps;
    tpw_CLKAL_posedge : VitalDelayType := 0 ps;
    tpw_CLKBL_negedge : VitalDelayType := 0 ps;
    tpw_CLKBL_posedge : VitalDelayType := 0 ps;
    tpw_REGCLKAL_negedge : VitalDelayType := 0 ps;
    tpw_REGCLKAL_posedge : VitalDelayType := 0 ps;
    tpw_REGCLKBL_negedge : VitalDelayType := 0 ps;
    tpw_REGCLKBL_posedge : VitalDelayType := 0 ps
    
  );

port (
  
    CASCADEOUTLATA : out std_ulogic;
    CASCADEOUTLATB : out std_ulogic;
    CASCADEOUTREGA : out std_ulogic;
    CASCADEOUTREGB : out std_ulogic;
    DOA : out std_logic_vector(31 downto 0);
    DOB : out std_logic_vector(31 downto 0);
    DOPA : out std_logic_vector(3 downto 0);
    DOPB : out std_logic_vector(3 downto 0);
    
    ADDRAL : in std_logic_vector(15 downto 0);
    ADDRAU : in std_logic_vector(14 downto 0);
    ADDRBL : in std_logic_vector(15 downto 0);
    ADDRBU : in std_logic_vector(14 downto 0);
    CASCADEINLATA : in std_ulogic;
    CASCADEINLATB : in std_ulogic;
    CASCADEINREGA : in std_ulogic;
    CASCADEINREGB : in std_ulogic;
    CLKAL : in std_ulogic;
    CLKAU : in std_ulogic;
    CLKBL : in std_ulogic;
    CLKBU : in std_ulogic;
    DIA : in std_logic_vector(31 downto 0);
    DIB : in std_logic_vector(31 downto 0);
    DIPA : in std_logic_vector(3 downto 0);
    DIPB : in std_logic_vector(3 downto 0);
    ENAL : in std_ulogic;
    ENAU : in std_ulogic;
    ENBL : in std_ulogic;
    ENBU : in std_ulogic;
    REGCEAL : in std_ulogic;
    REGCEAU : in std_ulogic;
    REGCEBL : in std_ulogic;
    REGCEBU : in std_ulogic;
    REGCLKAL : in std_ulogic;
    REGCLKAU : in std_ulogic;
    REGCLKBL : in std_ulogic;
    REGCLKBU : in std_ulogic;
    SSRAL : in std_ulogic;
    SSRAU : in std_ulogic;
    SSRBL : in std_ulogic;
    SSRBU : in std_ulogic;
    WEAL : in std_logic_vector(3 downto 0);
    WEAU : in std_logic_vector(3 downto 0);
    WEBL : in std_logic_vector(7 downto 0);
    WEBU : in std_logic_vector(7 downto 0)

  );

  attribute VITAL_LEVEL0 of
     X_RAMB36_EXP : entity is true;

end X_RAMB36_EXP;
                                                                        
architecture X_RAMB36_EXP_V of X_RAMB36_EXP is

  attribute VITAL_LEVEL0 of
    X_RAMB36_EXP_V : architecture is true;
  
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

  constant MAX_ADDR: integer := 15;
  constant MAX_DI:   integer := 31;
  constant MAX_DIP:  integer := 3;
  constant MAX_WEA:   integer := 3;
  constant MAX_WEB:   integer := 7;

  signal GND_4 : std_logic_vector(3 downto 0) := (others => '0');
  signal GND_32 : std_logic_vector(31 downto 0) := (others => '0');
  signal OPEN_4 : std_logic_vector(3 downto 0);
  signal OPEN_32 : std_logic_vector(31 downto 0);

  signal ADDRAL_ipd    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKAL_ipd     : std_ulogic                          := 'X';
  signal REGCLKAL_ipd     : std_ulogic                          := 'X';
  signal DIA_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIPA_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENAL_ipd      : std_ulogic                          := 'X';
  signal REGCEAL_ipd   : std_ulogic                          := 'X';
  signal SSRAL_ipd     : std_ulogic                          := 'X';
  signal WEAL_ipd      : std_logic_vector(MAX_WEA downto 0)   := (others => 'X');
  signal CASCADEINLATA_ipd      : std_ulogic                   := 'X';
  signal CASCADEINREGA_ipd      : std_ulogic                   := 'X';

  signal ADDRBL_ipd    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKBL_ipd     : std_ulogic                          := 'X';
  signal REGCLKBL_ipd     : std_ulogic                          := 'X';
  signal DIB_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIPB_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENBL_ipd      : std_ulogic                          := 'X';
  signal REGCEBL_ipd   : std_ulogic                          := 'X';
  signal SSRBL_ipd     : std_ulogic                          := 'X';
  signal WEBL_ipd      : std_logic_vector(MAX_WEB downto 0)   := (others => 'X');
  signal CASCADEINLATB_ipd      : std_ulogic                   := 'X';
  signal CASCADEINREGB_ipd      : std_ulogic                   := 'X';

  signal GSR_ipd      : std_ulogic                          := 'X';

  signal GSR_dly      : std_ulogic                          := 'X';

  signal ADDRAL_dly    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKAL_dly     : std_ulogic                          := 'X';
  signal REGCLKAL_dly     : std_ulogic                          := 'X';
  signal DIA_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIPA_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENAL_dly      : std_ulogic                          := 'X';
  signal GSR_CLKAL_dly : std_ulogic                          := 'X';
  signal GSR_REGCLKAL_dly : std_ulogic                          := 'X';
  signal REGCEAL_dly   : std_ulogic                          := 'X';
  signal SSRAL_dly     : std_ulogic                          := 'X';
  signal WEAL_dly      : std_logic_vector(MAX_WEA downto 0)   := (others => 'X');
  signal CASCADEINLATA_dly      : std_ulogic                   := 'X';
  signal CASCADEINREGA_dly      : std_ulogic                   := 'X';
    
  signal ADDRBL_dly    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKBL_dly     : std_ulogic                          := 'X';
  signal REGCLKBL_dly     : std_ulogic                          := 'X';
  signal DIB_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIPB_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENBL_dly      : std_ulogic                          := 'X';
  signal GSR_CLKBL_dly : std_ulogic                          := 'X';
  signal GSR_REGCLKBL_dly : std_ulogic                          := 'X';
  signal REGCEBL_dly   : std_ulogic                          := 'X';
  signal SSRBL_dly     : std_ulogic                          := 'X';
  signal WEBL_dly      : std_logic_vector(MAX_WEB downto 0)   := (others => 'X');
  signal CASCADEINLATB_dly      : std_ulogic                   := 'X';
  signal CASCADEINREGB_dly      : std_ulogic                   := 'X';
    
  signal DOA_zd            : std_logic_vector(MAX_DI downto 0);
  signal DOB_zd            : std_logic_vector(MAX_DI downto 0);
  signal DOPA_zd           : std_logic_vector(MAX_DIP downto 0);
  signal DOPB_zd           : std_logic_vector(MAX_DIP downto 0);
    
  signal CASCADEOUTLATA_zd      : std_ulogic                   := 'X';
  signal CASCADEOUTLATB_zd      : std_ulogic                   := 'X';
  signal CASCADEOUTREGA_zd      : std_ulogic                   := 'X';
  signal CASCADEOUTREGB_zd      : std_ulogic                   := 'X';
  signal ViolationA        : std_ulogic                     := '0';
  signal ViolationB        : std_ulogic                     := '0';

  
  procedure prcd_warn_msg (
    constant addr_str : in string;
    constant clk_str : in string
    ) is

    variable message : LINE;
    constant MsgSeverity : severity_level := Warning;

  begin
        Write ( message, STRING'(" Setup/Hold Violation on "));
        Write ( message, STRING'(addr_str));
        Write ( message, STRING'(" with respect to "));
        Write ( message, STRING'(clk_str));
        Write ( message, STRING'(" when memory has been enabled. The memory contents at "));
        Write ( message, STRING'(addr_str));
        Write ( message, STRING'(" of the RAM can be corrupted. "));
        Write ( message, STRING'("This corruption is not modeled in this simulation model. Please take the necessary steps to recover from this data corruption in hardware."));
        ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
        DEALLOCATE (message);

  end prcd_warn_msg;
  
  
begin
  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay     : block
  begin

-----  Port A

    ADDRAL_DELAY : for i in MAX_ADDR downto 0 generate
      VitalWireDelay (ADDRAL_ipd(i), ADDRAL(i), tipd_ADDRAL(i));
    end generate ADDRAL_DELAY;

    DIA_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIPA_ipd(i), DIPA(i), tipd_DIPA(i));
    end generate DIPA_DELAY;

    WEAL_DELAY : for i in  MAX_WEA downto 0 GENERATE
      VitalWireDelay (WEAL_ipd(i) , WEAL(i), tipd_WEAL(i));
    end generate WEAL_DELAY;

    VitalWireDelay (CLKAL_ipd, CLKAL, tipd_CLKAL);
    VitalWireDelay (REGCLKAL_ipd, REGCLKAL, tipd_REGCLKAL);
    VitalWireDelay (ENAL_ipd, ENAL, tipd_ENAL);
    VitalWireDelay (REGCEAL_ipd, REGCEAL, tipd_REGCEAL);
    VitalWireDelay (SSRAL_ipd, SSRAL, tipd_SSRAL);
    VitalWireDelay (CASCADEINLATA_ipd, CASCADEINLATA, tipd_CASCADEINLATA);
    VitalWireDelay (CASCADEINREGA_ipd, CASCADEINREGA, tipd_CASCADEINREGA);

-----  Port B

    ADDRBL_DELAY : for i in MAX_ADDR downto 0 generate
      VitalWireDelay (ADDRBL_ipd(i), ADDRBL(i), tipd_ADDRBL(i));
    end generate ADDRBL_DELAY;

    DIB_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIPB_ipd(i), DIPB(i), tipd_DIPB(i));
    end generate DIPB_DELAY;

    WEBL_DELAY : for i in  MAX_WEB downto 0 GENERATE
      VitalWireDelay (WEBL_ipd(i) , WEBL(i), tipd_WEBL(i));
    end generate WEBL_DELAY;

    VitalWireDelay (CLKBL_ipd, CLKBL, tipd_CLKBL);
    VitalWireDelay (ENBL_ipd, ENBL, tipd_ENBL);
    VitalWireDelay (REGCLKBL_ipd, REGCLKBL, tipd_REGCLKBL);
    VitalWireDelay (REGCEBL_ipd, REGCEBL, tipd_REGCEBL);
    VitalWireDelay (SSRBL_ipd, SSRBL, tipd_SSRBL);
    VitalWireDelay (CASCADEINLATB_ipd, CASCADEINLATB, tipd_CASCADEINLATB);
    VitalWireDelay (CASCADEINREGB_ipd, CASCADEINREGB, tipd_CASCADEINREGB);

----- GSR


  end block;

  SignalDelay   : block
  begin

-----  Port A

    ADDRAL_DELAY : for i in MAX_ADDR downto 0 generate
      VitalSignalDelay (ADDRAL_dly(i), ADDRAL_ipd(i), tisd_ADDRAL_CLKAL(i));
    end generate ADDRAL_DELAY;

    DIA_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DIA_dly(i), DIA_ipd(i), tisd_DIA_CLKAL(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIPA_dly(i), DIPA_ipd(i), tisd_DIPA_CLKAL(i));
    end generate DIPA_DELAY;

    WEAL_DELAY   : for i in MAX_WEA downto 0 generate
      VitalSignalDelay (WEAL_dly(i), WEAL_ipd(i), tisd_WEAL_CLKAL(i));
    end generate WEAL_DELAY;

    VitalSignalDelay (CLKAL_dly, CLKAL_ipd, ticd_CLKAL);
    VitalSignalDelay (REGCLKAL_dly, REGCLKAL_ipd, ticd_REGCLKAL);
    VitalSignalDelay (ENAL_dly, ENAL_ipd, tisd_ENAL_CLKAL);
    VitalSignalDelay (REGCEAL_dly, REGCEAL_ipd, tisd_REGCEAL_CLKAL);
    VitalSignalDelay (SSRAL_dly, SSRAL_ipd, tisd_SSRAL_CLKAL);
    VitalSignalDelay (CASCADEINLATA_dly, CASCADEINLATA_ipd, tisd_CASCADEINLATA_CLKAL);
    VitalSignalDelay (CASCADEINREGA_dly, CASCADEINREGA_ipd, tisd_CASCADEINREGA_CLKAL);

-----  Port B   

    ADDRBL_DELAY : for i in MAX_ADDR downto 0 generate
      VitalSignalDelay (ADDRBL_dly(i), ADDRBL_ipd(i), tisd_ADDRBL_CLKBL(i));
    end generate ADDRBL_DELAY;


    DIB_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DIB_dly(i), DIB_ipd(i), tisd_DIB_CLKBL(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIPB_dly(i), DIPB_ipd(i), tisd_DIPB_CLKBL(i));
    end generate DIPB_DELAY;

    WEBL_DELAY   : for i in MAX_WEB downto 0 generate
      VitalSignalDelay (WEBL_dly(i), WEBL_ipd(i), tisd_WEBL_CLKBL(i));
    end generate WEBL_DELAY;

    VitalSignalDelay (CLKBL_dly, CLKBL_ipd, ticd_CLKBL);
    VitalSignalDelay (REGCLKBL_dly, REGCLKBL_ipd, ticd_REGCLKBL);
    VitalSignalDelay (ENBL_dly, ENBL_ipd, tisd_ENBL_CLKBL);
    VitalSignalDelay (REGCEBL_dly, REGCEBL_ipd, tisd_REGCEBL_CLKBL);
    VitalSignalDelay (SSRBL_dly, SSRBL_ipd, tisd_SSRBL_CLKBL);
    VitalSignalDelay (CASCADEINLATB_dly, CASCADEINLATB_ipd, tisd_CASCADEINLATB_CLKBL);
    VitalSignalDelay (CASCADEINREGB_dly, CASCADEINREGB_ipd, tisd_CASCADEINREGB_CLKBL);

  end block;

  
X_RAMB36_EXP_inst : X_ARAMB36_INTERNAL
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
		INIT_40 => INIT_40,
		INIT_41 => INIT_41,
		INIT_42 => INIT_42,
		INIT_43 => INIT_43,
		INIT_44 => INIT_44,
		INIT_45 => INIT_45,
		INIT_46 => INIT_46,
		INIT_47 => INIT_47,
		INIT_48 => INIT_48,
		INIT_49 => INIT_49,
		INIT_4A => INIT_4A,
		INIT_4B => INIT_4B,
		INIT_4C => INIT_4C,
		INIT_4D => INIT_4D,
		INIT_4E => INIT_4E,
		INIT_4F => INIT_4F,
		INIT_50 => INIT_50,
		INIT_51 => INIT_51,
		INIT_52 => INIT_52,
		INIT_53 => INIT_53,
		INIT_54 => INIT_54,
		INIT_55 => INIT_55,
		INIT_56 => INIT_56,
		INIT_57 => INIT_57,
		INIT_58 => INIT_58,
		INIT_59 => INIT_59,
		INIT_5A => INIT_5A,
		INIT_5B => INIT_5B,
		INIT_5C => INIT_5C,
		INIT_5D => INIT_5D,
		INIT_5E => INIT_5E,
		INIT_5F => INIT_5F,
		INIT_60 => INIT_60,
		INIT_61 => INIT_61,
		INIT_62 => INIT_62,
		INIT_63 => INIT_63,
		INIT_64 => INIT_64,
		INIT_65 => INIT_65,
		INIT_66 => INIT_66,
		INIT_67 => INIT_67,
		INIT_68 => INIT_68,
		INIT_69 => INIT_69,
		INIT_6A => INIT_6A,
		INIT_6B => INIT_6B,
		INIT_6C => INIT_6C,
		INIT_6D => INIT_6D,
		INIT_6E => INIT_6E,
		INIT_6F => INIT_6F,
		INIT_70 => INIT_70,
		INIT_71 => INIT_71,
		INIT_72 => INIT_72,
		INIT_73 => INIT_73,
		INIT_74 => INIT_74,
		INIT_75 => INIT_75,
		INIT_76 => INIT_76,
		INIT_77 => INIT_77,
		INIT_78 => INIT_78,
		INIT_79 => INIT_79,
		INIT_7A => INIT_7A,
		INIT_7B => INIT_7B,
		INIT_7C => INIT_7C,
		INIT_7D => INIT_7D,
		INIT_7E => INIT_7E,
		INIT_7F => INIT_7F,
                
		INITP_00 => INITP_00,
		INITP_01 => INITP_01,
		INITP_02 => INITP_02,
		INITP_03 => INITP_03,
		INITP_04 => INITP_04,
		INITP_05 => INITP_05,
		INITP_06 => INITP_06,
		INITP_07 => INITP_07,
		INITP_08 => INITP_08,
		INITP_09 => INITP_09,
		INITP_0A => INITP_0A,
		INITP_0B => INITP_0B,
		INITP_0C => INITP_0C,
		INITP_0D => INITP_0D,
		INITP_0E => INITP_0E,
		INITP_0F => INITP_0F,
                
		SIM_COLLISION_CHECK => SIM_COLLISION_CHECK,
		SRVAL_A => SRVAL_A,
		SRVAL_B => SRVAL_B,
		WRITE_MODE_A => WRITE_MODE_A,
		WRITE_MODE_B => WRITE_MODE_B,                
                BRAM_MODE => "TRUE_DUAL_PORT",
                BRAM_SIZE => 36,
                RAM_EXTENSION_A => RAM_EXTENSION_A,
                RAM_EXTENSION_B => RAM_EXTENSION_B,
                SETUP_ALL => SETUP_ALL,
                SETUP_READ_FIRST => SETUP_READ_FIRST,
                READ_WIDTH_A => READ_WIDTH_A,
                READ_WIDTH_B => READ_WIDTH_B,                
                WRITE_WIDTH_A => WRITE_WIDTH_A,
                WRITE_WIDTH_B => WRITE_WIDTH_B          
                )
  
        port map (
                ADDRA => ADDRAL_dly,
                ADDRB => ADDRBL_dly,
                CLKA => CLKAL_dly,
                CLKB => CLKBL_dly,
                DIA(31 downto 0)  => DIA_dly,
                DIA(63 downto 32) => GND_32,
                DIB(31 downto 0) => DIB_dly,
                DIB(63 downto 32) => GND_32,
                DIPA(3 downto 0) => DIPA_dly,
                DIPA(7 downto 4) => GND_4,
                DIPB(3 downto 0) => DIPB_dly,
                DIPB(7 downto 4) => GND_4,
                ENA => ENAL_dly,
                ENB => ENBL_dly,
                SSRA => SSRAL_dly,
                SSRB => SSRBL_dly,
                WEA(3 downto 0) => WEAL_dly,
                WEA(7 downto 4) => GND_4,
                WEB => WEBL_dly,
                DOA(31  downto 0) => DOA_zd,
                DOA(63 downto 32) => OPEN_32,
                DOB(31 downto 0) => DOB_zd,
                DOB(63 downto 32) => OPEN_32,
                DOPA(3 downto 0) => DOPA_zd,
                DOPA(7 downto 4) => OPEN_4,
                DOPB(3 downto 0) => DOPB_zd,
                DOPB(7 downto 4) => OPEN_4,
                CASCADEOUTLATA => CASCADEOUTLATA_zd,
                CASCADEOUTLATB => CASCADEOUTLATB_zd,
                CASCADEOUTREGA => CASCADEOUTREGA_zd,
                CASCADEOUTREGB => CASCADEOUTREGB_zd,
                CASCADEINLATA => CASCADEINLATA_dly,
                CASCADEINLATB => CASCADEINLATB_dly,
                CASCADEINREGA => CASCADEINREGA_dly,
                CASCADEINREGB => CASCADEINREGB_dly,
                REGCLKA => REGCLKAL_dly,
                REGCLKB => REGCLKBL_dly,
                REGCEA => REGCEAL_dly,
                REGCEB => REGCEBL_dly
        );


-------------------------------------------------------------------------------
-- Timing check
-------------------------------------------------------------------------------
  process

    variable Tviol_ADDRAL0_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL1_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL2_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL3_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL4_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL5_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL6_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL7_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL8_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL9_CLKAL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAL10_CLKAL_posedge : std_ulogic := '0';
    variable Tviol_ADDRAL11_CLKAL_posedge : std_ulogic := '0';
    variable Tviol_ADDRAL12_CLKAL_posedge : std_ulogic := '0';
    variable Tviol_ADDRAL13_CLKAL_posedge : std_ulogic := '0';
    variable Tviol_ADDRAL14_CLKAL_posedge : std_ulogic := '0';
    variable Tviol_ADDRAL15_CLKAL_posedge : std_ulogic := '0';
    variable Tviol_DIA0_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA1_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA2_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA3_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA4_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA5_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA6_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA7_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA8_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA9_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_DIA10_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA11_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA12_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA13_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA14_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA15_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA16_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA17_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA18_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA19_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA20_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA21_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA22_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA23_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA24_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA25_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA26_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA27_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA28_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA29_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA30_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIA31_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIPA0_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIPA1_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIPA2_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_DIPA3_CLKAL_posedge   : std_ulogic := '0';
    variable Tviol_ENAL_CLKAL_posedge     : std_ulogic := '0';
    variable Tviol_SSRAL_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_SSRAL_REGCLKAL_posedge    : std_ulogic := '0';
    variable Tviol_REGCEAL_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_REGCEAL_REGCLKAL_posedge    : std_ulogic := '0';
    variable Tviol_WEAL0_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_WEAL1_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_WEAL2_CLKAL_posedge    : std_ulogic := '0';
    variable Tviol_WEAL3_CLKAL_posedge    : std_ulogic := '0';

    variable Tviol_ADDRBL0_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL1_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL2_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL3_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL4_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL5_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL6_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL7_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL8_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL9_CLKBL_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBL10_CLKBL_posedge : std_ulogic := '0';
    variable Tviol_ADDRBL11_CLKBL_posedge : std_ulogic := '0';
    variable Tviol_ADDRBL12_CLKBL_posedge : std_ulogic := '0';
    variable Tviol_ADDRBL13_CLKBL_posedge : std_ulogic := '0';
    variable Tviol_ADDRBL14_CLKBL_posedge : std_ulogic := '0';
    variable Tviol_ADDRBL15_CLKBL_posedge : std_ulogic := '0';
    variable Tviol_DIB0_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB1_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB2_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB3_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB4_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB5_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB6_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB7_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB8_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB9_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_DIB10_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB11_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB12_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB13_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB14_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB15_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB16_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB17_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB18_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB19_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB20_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB21_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB22_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB23_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB24_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB25_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB26_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB27_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB28_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB29_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB30_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIB31_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIPB0_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIPB1_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIPB2_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_DIPB3_CLKBL_posedge   : std_ulogic := '0';
    variable Tviol_ENBL_CLKBL_posedge     : std_ulogic := '0';
    variable Tviol_SSRBL_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_SSRBL_REGCLKBL_posedge    : std_ulogic := '0';
    variable Tviol_WEBL0_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_WEBL1_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_WEBL2_CLKBL_posedge    : std_ulogic := '0';
    variable Tviol_WEBL3_CLKBL_posedge    : std_ulogic := '0';

    variable Tviol_CLKAL_CLKBL_all        : std_ulogic := '0';
    variable Tviol_CLKAL_CLKBL_read_first : std_ulogic := '0';
    variable Tviol_CLKBL_CLKAL_all        : std_ulogic := '0';
    variable Tviol_CLKBL_CLKAL_read_first : std_ulogic := '0';

    variable Tmkr_ADDRAL0_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL1_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL2_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL3_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL4_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL5_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL6_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL7_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL8_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL9_CLKAL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL10_CLKAL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL11_CLKAL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL12_CLKAL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL13_CLKAL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL14_CLKAL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAL15_CLKAL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA0_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA1_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA2_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA3_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA4_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA5_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA6_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA7_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA8_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA9_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA10_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA11_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA12_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA13_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA14_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA15_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA16_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA17_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA18_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA19_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA20_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA21_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA22_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA23_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA24_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA25_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA26_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA27_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA28_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA29_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA30_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA31_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA0_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA1_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA2_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA3_CLKAL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENAL_CLKAL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRAL_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRAL_REGCLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_REGCEAL_CLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_REGCEAL_REGCLKAL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEAL0_CLKAL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEAL1_CLKAL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEAL2_CLKAL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEAL3_CLKAL_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_ADDRBL0_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL1_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL2_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL3_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL4_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL5_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL6_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL7_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL8_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL9_CLKBL_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL10_CLKBL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL11_CLKBL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL12_CLKBL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL13_CLKBL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL14_CLKBL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBL15_CLKBL_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB0_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB1_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB2_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB3_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB4_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB5_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB6_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB7_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB8_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB9_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB10_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB11_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB12_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB13_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB14_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB15_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB16_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB17_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB18_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB19_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB20_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB21_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB22_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB23_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB24_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB25_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB26_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB27_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB28_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB29_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB30_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB31_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB0_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB1_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB2_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB3_CLKBL_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENBL_CLKBL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRBL_CLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRBL_REGCLKBL_posedge     : VitalTimingDataType := VitalTimingDataInit; 
    variable Tmkr_WEBL0_CLKBL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBL1_CLKBL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBL2_CLKBL_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBL3_CLKBL_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_CLKAL_CLKBL_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKAL_CLKBL_read_first : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKBL_CLKAL_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKBL_CLKAL_read_first : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_CLKAL, PViol_CLKBL : std_ulogic          := '0';
    variable PInfo_CLKAL, PInfo_CLKBL : VitalPeriodDataType := VitalPeriodDataInit;
    variable PViol_REGCLKAL, PViol_REGCLKBL : std_ulogic          := '0';
    variable PInfo_REGCLKAL, PInfo_REGCLKBL : VitalPeriodDataType := VitalPeriodDataInit;
    
  begin  -- process
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_ENAL_CLKAL_posedge,
        TimingData     => Tmkr_ENAL_CLKAL_posedge,
        TestSignal     => ENAL_dly,
        TestSignalName => "ENAL",
        TestDelay      => tisd_ENAL_CLKAL,
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ENAL_CLKAL_posedge_posedge,
        SetupLow       => tsetup_ENAL_CLKAL_negedge_posedge,
        HoldLow        => thold_ENAL_CLKAL_negedge_posedge,
        HoldHigh       => thold_ENAL_CLKAL_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSRAL_CLKAL_posedge,
        TimingData     => Tmkr_SSRAL_CLKAL_posedge,
        TestSignal     => SSRAL_dly,
        TestSignalName => "SSRAL",
        TestDelay      => tisd_SSRAL_CLKAL,
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_SSRAL_CLKAL_posedge_posedge,
        SetupLow       => tsetup_SSRAL_CLKAL_negedge_posedge,
        HoldLow        => thold_SSRAL_CLKAL_negedge_posedge,
        HoldHigh       => thold_SSRAL_CLKAL_posedge_posedge,
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSRAL_REGCLKAL_posedge,
        TimingData     => Tmkr_SSRAL_REGCLKAL_posedge,
        TestSignal     => SSRAL_dly,
        TestSignalName => "SSRAL",
        TestDelay      => tisd_SSRAL_REGCLKAL,
        RefSignal      => REGCLKAL_dly,
        RefSignalName  => "REGCLKAL",
        RefDelay       => ticd_REGCLKAL,
        SetupHigh      => tsetup_SSRAL_REGCLKAL_posedge_posedge,
        SetupLow       => tsetup_SSRAL_REGCLKAL_negedge_posedge,
        HoldLow        => thold_SSRAL_REGCLKAL_negedge_posedge,
        HoldHigh       => thold_SSRAL_REGCLKAL_posedge_posedge,
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_REGCEAL_CLKAL_posedge,
        TimingData     => Tmkr_REGCEAL_CLKAL_posedge,
        TestSignal     => REGCEAL_dly,
        TestSignalName => "REGCEAL",
        TestDelay      => tisd_REGCEAL_CLKAL,
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_REGCEAL_CLKAL_posedge_posedge,
        SetupLow       => tsetup_REGCEAL_CLKAL_negedge_posedge,
        HoldLow        => thold_REGCEAL_CLKAL_negedge_posedge,
        HoldHigh       => thold_REGCEAL_CLKAL_posedge_posedge,
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_REGCEAL_REGCLKAL_posedge,
        TimingData     => Tmkr_REGCEAL_REGCLKAL_posedge,
        TestSignal     => REGCEAL_dly,
        TestSignalName => "REGCEAL",
        TestDelay      => tisd_REGCEAL_REGCLKAL,
        RefSignal      => REGCLKAL_dly,
        RefSignalName  => "REGCLKAL",
        RefDelay       => ticd_REGCLKAL,
        SetupHigh      => tsetup_REGCEAL_REGCLKAL_posedge_posedge,
        SetupLow       => tsetup_REGCEAL_REGCLKAL_negedge_posedge,
        HoldLow        => thold_REGCEAL_REGCLKAL_negedge_posedge,
        HoldHigh       => thold_REGCEAL_REGCLKAL_posedge_posedge,
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);  
 -- FP
      VitalSetupHoldCheck (
        Violation      => Tviol_WEAL0_CLKAL_posedge,
        TimingData     => Tmkr_WEAL0_CLKAL_posedge,
        TestSignal     => WEAL_dly(0),
        TestSignalName => "WEAL(0)",
        TestDelay      => tisd_WEAL_CLKAL(0),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_WEAL_CLKAL_posedge_posedge(0),
        SetupLow       => tsetup_WEAL_CLKAL_negedge_posedge(0),
        HoldLow        => thold_WEAL_CLKAL_negedge_posedge(0),
        HoldHigh       => thold_WEAL_CLKAL_posedge_posedge(0),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEAL1_CLKAL_posedge,
        TimingData     => Tmkr_WEAL1_CLKAL_posedge,
        TestSignal     => WEAL_dly(1),
        TestSignalName => "WEAL(1)",
        TestDelay      => tisd_WEAL_CLKAL(1),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_WEAL_CLKAL_posedge_posedge(1),
        SetupLow       => tsetup_WEAL_CLKAL_negedge_posedge(1),
        HoldLow        => thold_WEAL_CLKAL_negedge_posedge(1),
        HoldHigh       => thold_WEAL_CLKAL_posedge_posedge(1),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEAL2_CLKAL_posedge,
        TimingData     => Tmkr_WEAL2_CLKAL_posedge,
        TestSignal     => WEAL_dly(2),
        TestSignalName => "WEAL(2)",
        TestDelay      => tisd_WEAL_CLKAL(2),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_WEAL_CLKAL_posedge_posedge(2),
        SetupLow       => tsetup_WEAL_CLKAL_negedge_posedge(2),
        HoldLow        => thold_WEAL_CLKAL_negedge_posedge(2),
        HoldHigh       => thold_WEAL_CLKAL_posedge_posedge(2),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEAL3_CLKAL_posedge,
        TimingData     => Tmkr_WEAL3_CLKAL_posedge,
        TestSignal     => WEAL_dly(3),
        TestSignalName => "WEAL(3)",
        TestDelay      => tisd_WEAL_CLKAL(3),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_WEAL_CLKAL_posedge_posedge(3),
        SetupLow       => tsetup_WEAL_CLKAL_negedge_posedge(3),
        HoldLow        => thold_WEAL_CLKAL_negedge_posedge(3),
        HoldHigh       => thold_WEAL_CLKAL_posedge_posedge(3),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL0_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL0_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(0),
        TestSignalName => "ADDRAL(0)",
        TestDelay      => tisd_ADDRAL_CLKAL(0),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(0),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(0),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(0),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(0),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL1_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL1_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(1),
        TestSignalName => "ADDRAL(1)",
        TestDelay      => tisd_ADDRAL_CLKAL(1),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(1),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(1),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(1),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(1),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL2_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL2_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(2),
        TestSignalName => "ADDRAL(2)",
        TestDelay      => tisd_ADDRAL_CLKAL(2),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(2),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(2),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(2),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(2),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL3_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL3_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(3),
        TestSignalName => "ADDRAL(3)",
        TestDelay      => tisd_ADDRAL_CLKAL(3),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(3),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(3),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(3),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(3),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL4_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL4_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(4),
        TestSignalName => "ADDRAL(4)",
        TestDelay      => tisd_ADDRAL_CLKAL(4),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(4),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(4),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(4),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(4),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL5_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL5_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(5),
        TestSignalName => "ADDRAL(5)",
        TestDelay      => tisd_ADDRAL_CLKAL(5),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(5),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(5),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(5),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(5),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL6_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL6_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(6),
        TestSignalName => "ADDRAL(6)",
        TestDelay      => tisd_ADDRAL_CLKAL(6),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(6),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(6),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(6),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(6),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL7_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL7_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(7),
        TestSignalName => "ADDRAL(7)",
        TestDelay      => tisd_ADDRAL_CLKAL(7),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(7),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(7),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(7),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(7),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL8_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL8_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(8),
        TestSignalName => "ADDRAL(8)",
        TestDelay      => tisd_ADDRAL_CLKAL(8),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(8),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(8),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(8),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(8),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL9_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL9_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(9),
        TestSignalName => "ADDRAL(9)",
        TestDelay      => tisd_ADDRAL_CLKAL(9),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(9),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(9),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(9),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(9),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL10_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL10_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(10),
        TestSignalName => "ADDRAL(10)",
        TestDelay      => tisd_ADDRAL_CLKAL(10),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(10),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(10),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(10),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(10),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL11_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL11_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(11),
        TestSignalName => "ADDRAL(11)",
        TestDelay      => tisd_ADDRAL_CLKAL(11),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(11),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(11),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(11),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(11),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL12_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL12_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(12),
        TestSignalName => "ADDRAL(12)",
        TestDelay      => tisd_ADDRAL_CLKAL(12),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(12),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(12),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(12),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(12),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL13_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL13_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(13),
        TestSignalName => "ADDRAL(13)",
        TestDelay      => tisd_ADDRAL_CLKAL(13),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(13),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(13),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(13),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(13),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL14_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL14_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(14),
        TestSignalName => "ADDRAL(14)",
        TestDelay      => tisd_ADDRAL_CLKAL(14),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(14),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(14),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(14),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(14),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAL15_CLKAL_posedge,
        TimingData     => Tmkr_ADDRAL15_CLKAL_posedge,
        TestSignal     => ADDRAL_dly(15),
        TestSignalName => "ADDRAL(15)",
        TestDelay      => tisd_ADDRAL_CLKAL(15),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_ADDRAL_CLKAL_posedge_posedge(15),
        SetupLow       => tsetup_ADDRAL_CLKAL_negedge_posedge(15),
        HoldLow        => thold_ADDRAL_CLKAL_negedge_posedge(15),
        HoldHigh       => thold_ADDRAL_CLKAL_posedge_posedge(15),
        CheckEnabled   => TO_X01(enal_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA0_CLKAL_posedge,
        TimingData     => Tmkr_DIPA0_CLKAL_posedge,
        TestSignal     => DIPA_dly(0),
        TestSignalName => "DIPA(0)",
        TestDelay      => tisd_DIPA_CLKAL(0),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIPA_CLKAL_posedge_posedge(0),
        SetupLow       => tsetup_DIPA_CLKAL_negedge_posedge(0),
        HoldLow        => thold_DIPA_CLKAL_negedge_posedge(0),
        HoldHigh       => thold_DIPA_CLKAL_posedge_posedge(0),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA1_CLKAL_posedge,
        TimingData     => Tmkr_DIPA1_CLKAL_posedge,
        TestSignal     => DIPA_dly(1),
        TestSignalName => "DIPA(1)",
        TestDelay      => tisd_DIPA_CLKAL(1),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIPA_CLKAL_posedge_posedge(1),
        SetupLow       => tsetup_DIPA_CLKAL_negedge_posedge(1),
        HoldLow        => thold_DIPA_CLKAL_negedge_posedge(1),
        HoldHigh       => thold_DIPA_CLKAL_posedge_posedge(1),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA2_CLKAL_posedge,
        TimingData     => Tmkr_DIPA2_CLKAL_posedge,
        TestSignal     => DIPA_dly(2),
        TestSignalName => "DIPA(2)",
        TestDelay      => tisd_DIPA_CLKAL(2),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIPA_CLKAL_posedge_posedge(2),
        SetupLow       => tsetup_DIPA_CLKAL_negedge_posedge(2),
        HoldLow        => thold_DIPA_CLKAL_negedge_posedge(2),
        HoldHigh       => thold_DIPA_CLKAL_posedge_posedge(2),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA3_CLKAL_posedge,
        TimingData     => Tmkr_DIPA3_CLKAL_posedge,
        TestSignal     => DIPA_dly(3),
        TestSignalName => "DIPA(3)",
        TestDelay      => tisd_DIPA_CLKAL(3),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIPA_CLKAL_posedge_posedge(3),
        SetupLow       => tsetup_DIPA_CLKAL_negedge_posedge(3),
        HoldLow        => thold_DIPA_CLKAL_negedge_posedge(3),
        HoldHigh       => thold_DIPA_CLKAL_posedge_posedge(3),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA0_CLKAL_posedge,
        TimingData     => Tmkr_DIA0_CLKAL_posedge,
        TestSignal     => DIA_dly(0),
        TestSignalName => "DIA(0)",
        TestDelay      => tisd_DIA_CLKAL(0),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(0),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(0),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(0),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(0),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA1_CLKAL_posedge,
        TimingData     => Tmkr_DIA1_CLKAL_posedge,
        TestSignal     => DIA_dly(1),
        TestSignalName => "DIA(1)",
        TestDelay      => tisd_DIA_CLKAL(1),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(1),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(1),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(1),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(1),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA2_CLKAL_posedge,
        TimingData     => Tmkr_DIA2_CLKAL_posedge,
        TestSignal     => DIA_dly(2),
        TestSignalName => "DIA(2)",
        TestDelay      => tisd_DIA_CLKAL(2),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(2),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(2),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(2),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(2),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA3_CLKAL_posedge,
        TimingData     => Tmkr_DIA3_CLKAL_posedge,
        TestSignal     => DIA_dly(3),
        TestSignalName => "DIA(3)",
        TestDelay      => tisd_DIA_CLKAL(3),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(3),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(3),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(3),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(3),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA4_CLKAL_posedge,
        TimingData     => Tmkr_DIA4_CLKAL_posedge,
        TestSignal     => DIA_dly(4),
        TestSignalName => "DIA(4)",
        TestDelay      => tisd_DIA_CLKAL(4),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(4),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(4),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(4),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(4),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA5_CLKAL_posedge,
        TimingData     => Tmkr_DIA5_CLKAL_posedge,
        TestSignal     => DIA_dly(5),
        TestSignalName => "DIA(5)",
        TestDelay      => tisd_DIA_CLKAL(5),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(5),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(5),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(5),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(5),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA6_CLKAL_posedge,
        TimingData     => Tmkr_DIA6_CLKAL_posedge,
        TestSignal     => DIA_dly(6),
        TestSignalName => "DIA(6)",
        TestDelay      => tisd_DIA_CLKAL(6),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(6),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(6),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(6),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(6),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA7_CLKAL_posedge,
        TimingData     => Tmkr_DIA7_CLKAL_posedge,
        TestSignal     => DIA_dly(7),
        TestSignalName => "DIA(7)",
        TestDelay      => tisd_DIA_CLKAL(7),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(7),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(7),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(7),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(7),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA8_CLKAL_posedge,
        TimingData     => Tmkr_DIA8_CLKAL_posedge,
        TestSignal     => DIA_dly(8),
        TestSignalName => "DIA(8)",
        TestDelay      => tisd_DIA_CLKAL(8),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(8),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(8),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(8),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(8),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA9_CLKAL_posedge,
        TimingData     => Tmkr_DIA9_CLKAL_posedge,
        TestSignal     => DIA_dly(9),
        TestSignalName => "DIA(9)",
        TestDelay      => tisd_DIA_CLKAL(9),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(9),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(9),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(9),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(9),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA10_CLKAL_posedge,
        TimingData     => Tmkr_DIA10_CLKAL_posedge,
        TestSignal     => DIA_dly(10),
        TestSignalName => "DIA(10)",
        TestDelay      => tisd_DIA_CLKAL(10),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(10),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(10),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(10),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(10),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA11_CLKAL_posedge,
        TimingData     => Tmkr_DIA11_CLKAL_posedge,
        TestSignal     => DIA_dly(11),
        TestSignalName => "DIA(11)",
        TestDelay      => tisd_DIA_CLKAL(11),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(11),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(11),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(11),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(11),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA12_CLKAL_posedge,
        TimingData     => Tmkr_DIA12_CLKAL_posedge,
        TestSignal     => DIA_dly(12),
        TestSignalName => "DIA(12)",
        TestDelay      => tisd_DIA_CLKAL(12),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(12),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(12),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(12),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(12),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA13_CLKAL_posedge,
        TimingData     => Tmkr_DIA13_CLKAL_posedge,
        TestSignal     => DIA_dly(13),
        TestSignalName => "DIA(13)",
        TestDelay      => tisd_DIA_CLKAL(13),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(13),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(13),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(13),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(13),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA14_CLKAL_posedge,
        TimingData     => Tmkr_DIA14_CLKAL_posedge,
        TestSignal     => DIA_dly(14),
        TestSignalName => "DIA(14)",
        TestDelay      => tisd_DIA_CLKAL(14),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(14),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(14),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(14),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(14),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA15_CLKAL_posedge,
        TimingData     => Tmkr_DIA15_CLKAL_posedge,
        TestSignal     => DIA_dly(15),
        TestSignalName => "DIA(15)",
        TestDelay      => tisd_DIA_CLKAL(15),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(15),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(15),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(15),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(15),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA16_CLKAL_posedge,
        TimingData     => Tmkr_DIA16_CLKAL_posedge,
        TestSignal     => DIA_dly(16),
        TestSignalName => "DIA(16)",
        TestDelay      => tisd_DIA_CLKAL(16),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(16),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(16),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(16),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(16),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA17_CLKAL_posedge,
        TimingData     => Tmkr_DIA17_CLKAL_posedge,
        TestSignal     => DIA_dly(17),
        TestSignalName => "DIA(17)",
        TestDelay      => tisd_DIA_CLKAL(17),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(17),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(17),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(17),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(17),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA18_CLKAL_posedge,
        TimingData     => Tmkr_DIA18_CLKAL_posedge,
        TestSignal     => DIA_dly(18),
        TestSignalName => "DIA(18)",
        TestDelay      => tisd_DIA_CLKAL(18),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(18),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(18),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(18),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(18),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA19_CLKAL_posedge,
        TimingData     => Tmkr_DIA19_CLKAL_posedge,
        TestSignal     => DIA_dly(19),
        TestSignalName => "DIA(19)",
        TestDelay      => tisd_DIA_CLKAL(19),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(19),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(19),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(19),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(19),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA20_CLKAL_posedge,
        TimingData     => Tmkr_DIA20_CLKAL_posedge,
        TestSignal     => DIA_dly(20),
        TestSignalName => "DIA(20)",
        TestDelay      => tisd_DIA_CLKAL(20),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(20),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(20),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(20),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(20),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA21_CLKAL_posedge,
        TimingData     => Tmkr_DIA21_CLKAL_posedge,
        TestSignal     => DIA_dly(21),
        TestSignalName => "DIA(21)",
        TestDelay      => tisd_DIA_CLKAL(21),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(21),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(21),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(21),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(21),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA22_CLKAL_posedge,
        TimingData     => Tmkr_DIA22_CLKAL_posedge,
        TestSignal     => DIA_dly(22),
        TestSignalName => "DIA(22)",
        TestDelay      => tisd_DIA_CLKAL(22),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(22),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(22),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(22),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(22),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA23_CLKAL_posedge,
        TimingData     => Tmkr_DIA23_CLKAL_posedge,
        TestSignal     => DIA_dly(23),
        TestSignalName => "DIA(23)",
        TestDelay      => tisd_DIA_CLKAL(23),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(23),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(23),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(23),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(23),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA24_CLKAL_posedge,
        TimingData     => Tmkr_DIA24_CLKAL_posedge,
        TestSignal     => DIA_dly(24),
        TestSignalName => "DIA(24)",
        TestDelay      => tisd_DIA_CLKAL(24),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(24),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(24),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(24),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(24),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA25_CLKAL_posedge,
        TimingData     => Tmkr_DIA25_CLKAL_posedge,
        TestSignal     => DIA_dly(25),
        TestSignalName => "DIA(25)",
        TestDelay      => tisd_DIA_CLKAL(25),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(25),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(25),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(25),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(25),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA26_CLKAL_posedge,
        TimingData     => Tmkr_DIA26_CLKAL_posedge,
        TestSignal     => DIA_dly(26),
        TestSignalName => "DIA(26)",
        TestDelay      => tisd_DIA_CLKAL(26),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(26),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(26),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(26),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(26),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA27_CLKAL_posedge,
        TimingData     => Tmkr_DIA27_CLKAL_posedge,
        TestSignal     => DIA_dly(27),
        TestSignalName => "DIA(27)",
        TestDelay      => tisd_DIA_CLKAL(27),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(27),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(27),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(27),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(27),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA28_CLKAL_posedge,
        TimingData     => Tmkr_DIA28_CLKAL_posedge,
        TestSignal     => DIA_dly(28),
        TestSignalName => "DIA(28)",
        TestDelay      => tisd_DIA_CLKAL(28),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(28),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(28),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(28),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(28),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA29_CLKAL_posedge,
        TimingData     => Tmkr_DIA29_CLKAL_posedge,
        TestSignal     => DIA_dly(29),
        TestSignalName => "DIA(29)",
        TestDelay      => tisd_DIA_CLKAL(29),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(29),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(29),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(29),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(29),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA30_CLKAL_posedge,
        TimingData     => Tmkr_DIA30_CLKAL_posedge,
        TestSignal     => DIA_dly(30),
        TestSignalName => "DIA(30)",
        TestDelay      => tisd_DIA_CLKAL(30),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(30),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(30),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(30),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(30),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA31_CLKAL_posedge,
        TimingData     => Tmkr_DIA31_CLKAL_posedge,
        TestSignal     => DIA_dly(31),
        TestSignalName => "DIA(31)",
        TestDelay      => tisd_DIA_CLKAL(31),
        RefSignal      => CLKAL_dly,
        RefSignalName  => "CLKAL",
        RefDelay       => ticd_CLKAL,
        SetupHigh      => tsetup_DIA_CLKAL_posedge_posedge(31),
        SetupLow       => tsetup_DIA_CLKAL_negedge_posedge(31),
        HoldLow        => thold_DIA_CLKAL_negedge_posedge(31),
        HoldHigh       => thold_DIA_CLKAL_posedge_posedge(31),
--        CheckEnabled   => (TO_X01(enal_dly) = '1' and TO_X01(weal_dly) = '1'),
        CheckEnabled   => (TO_X01(enal_dly)    = '1' and
                           TO_X01(weal_dly(0)) = '1' and
                           TO_X01(weal_dly(1)) = '1' and
                           TO_X01(weal_dly(2)) = '1' and
                           TO_X01(weal_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ENBL_CLKBL_posedge,
        TimingData     => Tmkr_ENBL_CLKBL_posedge,
        TestSignal     => ENBL_dly,
        TestSignalName => "ENBL",
        TestDelay      => tisd_ENBL_CLKBL,
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ENBL_CLKBL_posedge_posedge,
        SetupLow       => tsetup_ENBL_CLKBL_negedge_posedge,
        HoldLow        => thold_ENBL_CLKBL_negedge_posedge,
        HoldHigh       => thold_ENBL_CLKBL_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSRBL_CLKBL_posedge,
        TimingData     => Tmkr_SSRBL_CLKBL_posedge,
        TestSignal     => SSRBL_dly,
        TestSignalName => "SSRBL",
        TestDelay      => tisd_SSRBL_CLKBL,
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_SSRBL_CLKBL_posedge_posedge,
        SetupLow       => tsetup_SSRBL_CLKBL_negedge_posedge,
        HoldLow        => thold_SSRBL_CLKBL_negedge_posedge,
        HoldHigh       => thold_SSRBL_CLKBL_posedge_posedge,
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSRBL_REGCLKBL_posedge,
        TimingData     => Tmkr_SSRBL_REGCLKBL_posedge,
        TestSignal     => SSRBL_dly,
        TestSignalName => "SSRBL",
        TestDelay      => tisd_SSRBL_REGCLKBL,
        RefSignal      => REGCLKBL_dly,
        RefSignalName  => "REGCLKBL",
        RefDelay       => ticd_REGCLKBL,
        SetupHigh      => tsetup_SSRBL_REGCLKBL_posedge_posedge,
        SetupLow       => tsetup_SSRBL_REGCLKBL_negedge_posedge,
        HoldLow        => thold_SSRBL_REGCLKBL_negedge_posedge,
        HoldHigh       => thold_SSRBL_REGCLKBL_posedge_posedge,
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBL0_CLKBL_posedge,
        TimingData     => Tmkr_WEBL0_CLKBL_posedge,
        TestSignal     => WEBL_dly(0),
        TestSignalName => "WEBL(0)",
        TestDelay      => tisd_WEBL_CLKBL(0),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_WEBL_CLKBL_posedge_posedge(0),
        SetupLow       => tsetup_WEBL_CLKBL_negedge_posedge(0),
        HoldLow        => thold_WEBL_CLKBL_negedge_posedge(0),
        HoldHigh       => thold_WEBL_CLKBL_posedge_posedge(0),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBL1_CLKBL_posedge,
        TimingData     => Tmkr_WEBL1_CLKBL_posedge,
        TestSignal     => WEBL_dly(1),
        TestSignalName => "WEBL(1)",
        TestDelay      => tisd_WEBL_CLKBL(1),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_WEBL_CLKBL_posedge_posedge(1),
        SetupLow       => tsetup_WEBL_CLKBL_negedge_posedge(1),
        HoldLow        => thold_WEBL_CLKBL_negedge_posedge(1),
        HoldHigh       => thold_WEBL_CLKBL_posedge_posedge(1),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBL2_CLKBL_posedge,
        TimingData     => Tmkr_WEBL2_CLKBL_posedge,
        TestSignal     => WEBL_dly(2),
        TestSignalName => "WEBL(2)",
        TestDelay      => tisd_WEBL_CLKBL(2),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_WEBL_CLKBL_posedge_posedge(2),
        SetupLow       => tsetup_WEBL_CLKBL_negedge_posedge(2),
        HoldLow        => thold_WEBL_CLKBL_negedge_posedge(2),
        HoldHigh       => thold_WEBL_CLKBL_posedge_posedge(2),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBL3_CLKBL_posedge,
        TimingData     => Tmkr_WEBL3_CLKBL_posedge,
        TestSignal     => WEBL_dly(3),
        TestSignalName => "WEBL(3)",
        TestDelay      => tisd_WEBL_CLKBL(3),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_WEBL_CLKBL_posedge_posedge(3),
        SetupLow       => tsetup_WEBL_CLKBL_negedge_posedge(3),
        HoldLow        => thold_WEBL_CLKBL_negedge_posedge(3),
        HoldHigh       => thold_WEBL_CLKBL_posedge_posedge(3),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL0_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL0_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(0),
        TestSignalName => "ADDRBL(0)",
        TestDelay      => tisd_ADDRBL_CLKBL(0),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(0),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(0),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(0),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(0),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL1_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL1_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(1),
        TestSignalName => "ADDRBL(1)",
        TestDelay      => tisd_ADDRBL_CLKBL(1),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(1),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(1),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(1),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(1),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL2_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL2_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(2),
        TestSignalName => "ADDRBL(2)",
        TestDelay      => tisd_ADDRBL_CLKBL(2),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(2),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(2),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(2),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(2),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL3_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL3_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(3),
        TestSignalName => "ADDRBL(3)",
        TestDelay      => tisd_ADDRBL_CLKBL(3),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(3),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(3),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(3),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(3),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL4_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL4_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(4),
        TestSignalName => "ADDRBL(4)",
        TestDelay      => tisd_ADDRBL_CLKBL(4),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(4),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(4),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(4),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(4),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL5_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL5_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(5),
        TestSignalName => "ADDRBL(5)",
        TestDelay      => tisd_ADDRBL_CLKBL(5),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(5),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(5),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(5),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(5),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL6_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL6_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(6),
        TestSignalName => "ADDRBL(6)",
        TestDelay      => tisd_ADDRBL_CLKBL(6),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(6),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(6),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(6),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(6),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL7_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL7_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(7),
        TestSignalName => "ADDRBL(7)",
        TestDelay      => tisd_ADDRBL_CLKBL(7),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(7),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(7),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(7),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(7),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL8_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL8_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(8),
        TestSignalName => "ADDRBL(8)",
        TestDelay      => tisd_ADDRBL_CLKBL(8),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(8),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(8),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(8),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(8),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL9_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL9_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(9),
        TestSignalName => "ADDRBL(9)",
        TestDelay      => tisd_ADDRBL_CLKBL(9),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(9),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(9),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(9),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(9),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL10_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL10_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(10),
        TestSignalName => "ADDRBL(10)",
        TestDelay      => tisd_ADDRBL_CLKBL(10),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(10),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(10),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(10),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(10),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL11_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL11_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(11),
        TestSignalName => "ADDRBL(11)",
        TestDelay      => tisd_ADDRBL_CLKBL(11),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(11),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(11),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(11),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(11),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL12_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL12_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(12),
        TestSignalName => "ADDRBL(12)",
        TestDelay      => tisd_ADDRBL_CLKBL(12),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(12),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(12),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(12),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(12),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL13_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL13_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(13),
        TestSignalName => "ADDRBL(13)",
        TestDelay      => tisd_ADDRBL_CLKBL(13),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(13),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(13),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(13),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(13),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL14_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL14_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(14),
        TestSignalName => "ADDRBL(14)",
        TestDelay      => tisd_ADDRBL_CLKBL(14),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(14),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(14),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(14),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(14),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBL15_CLKBL_posedge,
        TimingData     => Tmkr_ADDRBL15_CLKBL_posedge,
        TestSignal     => ADDRBL_dly(15),
        TestSignalName => "ADDRBL(15)",
        TestDelay      => tisd_ADDRBL_CLKBL(15),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_ADDRBL_CLKBL_posedge_posedge(15),
        SetupLow       => tsetup_ADDRBL_CLKBL_negedge_posedge(15),
        HoldLow        => thold_ADDRBL_CLKBL_negedge_posedge(15),
        HoldHigh       => thold_ADDRBL_CLKBL_posedge_posedge(15),
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB0_CLKBL_posedge,
        TimingData     => Tmkr_DIPB0_CLKBL_posedge,
        TestSignal     => DIPB_dly(0),
        TestSignalName => "DIPB(0)",
        TestDelay      => tisd_DIPB_CLKBL(0),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIPB_CLKBL_posedge_posedge(0),
        SetupLow       => tsetup_DIPB_CLKBL_negedge_posedge(0),
        HoldLow        => thold_DIPB_CLKBL_negedge_posedge(0),
        HoldHigh       => thold_DIPB_CLKBL_posedge_posedge(0),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB1_CLKBL_posedge,
        TimingData     => Tmkr_DIPB1_CLKBL_posedge,
        TestSignal     => DIPB_dly(1),
        TestSignalName => "DIPB(1)",
        TestDelay      => tisd_DIPB_CLKBL(1),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIPB_CLKBL_posedge_posedge(1),
        SetupLow       => tsetup_DIPB_CLKBL_negedge_posedge(1),
        HoldLow        => thold_DIPB_CLKBL_negedge_posedge(1),
        HoldHigh       => thold_DIPB_CLKBL_posedge_posedge(1),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB2_CLKBL_posedge,
        TimingData     => Tmkr_DIPB2_CLKBL_posedge,
        TestSignal     => DIPB_dly(2),
        TestSignalName => "DIPB(2)",
        TestDelay      => tisd_DIPB_CLKBL(2),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIPB_CLKBL_posedge_posedge(2),
        SetupLow       => tsetup_DIPB_CLKBL_negedge_posedge(2),
        HoldLow        => thold_DIPB_CLKBL_negedge_posedge(2),
        HoldHigh       => thold_DIPB_CLKBL_posedge_posedge(2),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB3_CLKBL_posedge,
        TimingData     => Tmkr_DIPB3_CLKBL_posedge,
        TestSignal     => DIPB_dly(3),
        TestSignalName => "DIPB(3)",
        TestDelay      => tisd_DIPB_CLKBL(3),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIPB_CLKBL_posedge_posedge(3),
        SetupLow       => tsetup_DIPB_CLKBL_negedge_posedge(3),
        HoldLow        => thold_DIPB_CLKBL_negedge_posedge(3),
        HoldHigh       => thold_DIPB_CLKBL_posedge_posedge(3),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB0_CLKBL_posedge,
        TimingData     => Tmkr_DIB0_CLKBL_posedge,
        TestSignal     => DIB_dly(0),
        TestSignalName => "DIB(0)",
        TestDelay      => tisd_DIB_CLKBL(0),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(0),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(0),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(0),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(0),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB1_CLKBL_posedge,
        TimingData     => Tmkr_DIB1_CLKBL_posedge,
        TestSignal     => DIB_dly(1),
        TestSignalName => "DIB(1)",
        TestDelay      => tisd_DIB_CLKBL(1),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(1),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(1),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(1),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(1),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB2_CLKBL_posedge,
        TimingData     => Tmkr_DIB2_CLKBL_posedge,
        TestSignal     => DIB_dly(2),
        TestSignalName => "DIB(2)",
        TestDelay      => tisd_DIB_CLKBL(2),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(2),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(2),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(2),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(2),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB3_CLKBL_posedge,
        TimingData     => Tmkr_DIB3_CLKBL_posedge,
        TestSignal     => DIB_dly(3),
        TestSignalName => "DIB(3)",
        TestDelay      => tisd_DIB_CLKBL(3),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(3),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(3),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(3),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(3),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB4_CLKBL_posedge,
        TimingData     => Tmkr_DIB4_CLKBL_posedge,
        TestSignal     => DIB_dly(4),
        TestSignalName => "DIB(4)",
        TestDelay      => tisd_DIB_CLKBL(4),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(4),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(4),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(4),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(4),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB5_CLKBL_posedge,
        TimingData     => Tmkr_DIB5_CLKBL_posedge,
        TestSignal     => DIB_dly(5),
        TestSignalName => "DIB(5)",
        TestDelay      => tisd_DIB_CLKBL(5),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(5),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(5),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(5),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(5),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB6_CLKBL_posedge,
        TimingData     => Tmkr_DIB6_CLKBL_posedge,
        TestSignal     => DIB_dly(6),
        TestSignalName => "DIB(6)",
        TestDelay      => tisd_DIB_CLKBL(6),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(6),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(6),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(6),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(6),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB7_CLKBL_posedge,
        TimingData     => Tmkr_DIB7_CLKBL_posedge,
        TestSignal     => DIB_dly(7),
        TestSignalName => "DIB(7)",
        TestDelay      => tisd_DIB_CLKBL(7),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(7),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(7),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(7),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(7),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB8_CLKBL_posedge,
        TimingData     => Tmkr_DIB8_CLKBL_posedge,
        TestSignal     => DIB_dly(8),
        TestSignalName => "DIB(8)",
        TestDelay      => tisd_DIB_CLKBL(8),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(8),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(8),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(8),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(8),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB9_CLKBL_posedge,
        TimingData     => Tmkr_DIB9_CLKBL_posedge,
        TestSignal     => DIB_dly(9),
        TestSignalName => "DIB(9)",
        TestDelay      => tisd_DIB_CLKBL(9),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(9),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(9),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(9),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(9),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB10_CLKBL_posedge,
        TimingData     => Tmkr_DIB10_CLKBL_posedge,
        TestSignal     => DIB_dly(10),
        TestSignalName => "DIB(10)",
        TestDelay      => tisd_DIB_CLKBL(10),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(10),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(10),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(10),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(10),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB11_CLKBL_posedge,
        TimingData     => Tmkr_DIB11_CLKBL_posedge,
        TestSignal     => DIB_dly(11),
        TestSignalName => "DIB(11)",
        TestDelay      => tisd_DIB_CLKBL(11),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(11),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(11),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(11),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(11),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB12_CLKBL_posedge,
        TimingData     => Tmkr_DIB12_CLKBL_posedge,
        TestSignal     => DIB_dly(12),
        TestSignalName => "DIB(12)",
        TestDelay      => tisd_DIB_CLKBL(12),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(12),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(12),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(12),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(12),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB13_CLKBL_posedge,
        TimingData     => Tmkr_DIB13_CLKBL_posedge,
        TestSignal     => DIB_dly(13),
        TestSignalName => "DIB(13)",
        TestDelay      => tisd_DIB_CLKBL(13),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(13),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(13),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(13),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(13),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB14_CLKBL_posedge,
        TimingData     => Tmkr_DIB14_CLKBL_posedge,
        TestSignal     => DIB_dly(14),
        TestSignalName => "DIB(14)",
        TestDelay      => tisd_DIB_CLKBL(14),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(14),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(14),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(14),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(14),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB15_CLKBL_posedge,
        TimingData     => Tmkr_DIB15_CLKBL_posedge,
        TestSignal     => DIB_dly(15),
        TestSignalName => "DIB(15)",
        TestDelay      => tisd_DIB_CLKBL(15),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(15),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(15),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(15),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(15),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB16_CLKBL_posedge,
        TimingData     => Tmkr_DIB16_CLKBL_posedge,
        TestSignal     => DIB_dly(16),
        TestSignalName => "DIB(16)",
        TestDelay      => tisd_DIB_CLKBL(16),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(16),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(16),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(16),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(16),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB17_CLKBL_posedge,
        TimingData     => Tmkr_DIB17_CLKBL_posedge,
        TestSignal     => DIB_dly(17),
        TestSignalName => "DIB(17)",
        TestDelay      => tisd_DIB_CLKBL(17),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(17),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(17),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(17),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(17),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB18_CLKBL_posedge,
        TimingData     => Tmkr_DIB18_CLKBL_posedge,
        TestSignal     => DIB_dly(18),
        TestSignalName => "DIB(18)",
        TestDelay      => tisd_DIB_CLKBL(18),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(18),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(18),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(18),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(18),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB19_CLKBL_posedge,
        TimingData     => Tmkr_DIB19_CLKBL_posedge,
        TestSignal     => DIB_dly(19),
        TestSignalName => "DIB(19)",
        TestDelay      => tisd_DIB_CLKBL(19),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(19),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(19),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(19),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(19),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB20_CLKBL_posedge,
        TimingData     => Tmkr_DIB20_CLKBL_posedge,
        TestSignal     => DIB_dly(20),
        TestSignalName => "DIB(20)",
        TestDelay      => tisd_DIB_CLKBL(20),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(20),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(20),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(20),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(20),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB21_CLKBL_posedge,
        TimingData     => Tmkr_DIB21_CLKBL_posedge,
        TestSignal     => DIB_dly(21),
        TestSignalName => "DIB(21)",
        TestDelay      => tisd_DIB_CLKBL(21),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(21),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(21),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(21),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(21),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB22_CLKBL_posedge,
        TimingData     => Tmkr_DIB22_CLKBL_posedge,
        TestSignal     => DIB_dly(22),
        TestSignalName => "DIB(22)",
        TestDelay      => tisd_DIB_CLKBL(22),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(22),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(22),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(22),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(22),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB23_CLKBL_posedge,
        TimingData     => Tmkr_DIB23_CLKBL_posedge,
        TestSignal     => DIB_dly(23),
        TestSignalName => "DIB(23)",
        TestDelay      => tisd_DIB_CLKBL(23),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(23),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(23),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(23),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(23),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB24_CLKBL_posedge,
        TimingData     => Tmkr_DIB24_CLKBL_posedge,
        TestSignal     => DIB_dly(24),
        TestSignalName => "DIB(24)",
        TestDelay      => tisd_DIB_CLKBL(24),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(24),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(24),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(24),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(24),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB25_CLKBL_posedge,
        TimingData     => Tmkr_DIB25_CLKBL_posedge,
        TestSignal     => DIB_dly(25),
        TestSignalName => "DIB(25)",
        TestDelay      => tisd_DIB_CLKBL(25),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(25),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(25),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(25),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(25),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB26_CLKBL_posedge,
        TimingData     => Tmkr_DIB26_CLKBL_posedge,
        TestSignal     => DIB_dly(26),
        TestSignalName => "DIB(26)",
        TestDelay      => tisd_DIB_CLKBL(26),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(26),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(26),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(26),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(26),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB27_CLKBL_posedge,
        TimingData     => Tmkr_DIB27_CLKBL_posedge,
        TestSignal     => DIB_dly(27),
        TestSignalName => "DIB(27)",
        TestDelay      => tisd_DIB_CLKBL(27),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(27),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(27),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(27),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(27),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB28_CLKBL_posedge,
        TimingData     => Tmkr_DIB28_CLKBL_posedge,
        TestSignal     => DIB_dly(28),
        TestSignalName => "DIB(28)",
        TestDelay      => tisd_DIB_CLKBL(28),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(28),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(28),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(28),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(28),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB29_CLKBL_posedge,
        TimingData     => Tmkr_DIB29_CLKBL_posedge,
        TestSignal     => DIB_dly(29),
        TestSignalName => "DIB(29)",
        TestDelay      => tisd_DIB_CLKBL(29),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(29),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(29),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(29),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(29),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB30_CLKBL_posedge,
        TimingData     => Tmkr_DIB30_CLKBL_posedge,
        TestSignal     => DIB_dly(30),
        TestSignalName => "DIB(30)",
        TestDelay      => tisd_DIB_CLKBL(30),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(30),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(30),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(30),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(30),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB31_CLKBL_posedge,
        TimingData     => Tmkr_DIB31_CLKBL_posedge,
        TestSignal     => DIB_dly(31),
        TestSignalName => "DIB(31)",
        TestDelay      => tisd_DIB_CLKBL(31),
        RefSignal      => CLKBL_dly,
        RefSignalName  => "CLKBL",
        RefDelay       => ticd_CLKBL,
        SetupHigh      => tsetup_DIB_CLKBL_posedge_posedge(31),
        SetupLow       => tsetup_DIB_CLKBL_negedge_posedge(31),
        HoldLow        => thold_DIB_CLKBL_negedge_posedge(31),
        HoldHigh       => thold_DIB_CLKBL_posedge_posedge(31),
--        CheckEnabled   => (TO_X01(enbl_dly) = '1' and TO_X01(webl_dly) = '1'),
        CheckEnabled   => (TO_X01(enbl_dly)    = '1' and
                           TO_X01(webl_dly(0)) = '1' and
                           TO_X01(webl_dly(1)) = '1' and
                           TO_X01(webl_dly(2)) = '1' and
                           TO_X01(webl_dly(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKAL,
        PeriodData     => PInfo_CLKAL,
        TestSignal     => CLKAL_dly,
        TestSignalName => "CLKAL",
        TestDelay      => 0 ps,
        Period         => tperiod_clkal_posedge,
        PulseWidthHigh => tpw_CLKAL_posedge,
        PulseWidthLow  => tpw_CLKAL_negedge,
        CheckEnabled   => TO_X01(enal_dly) = '1',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKBL,
        PeriodData     => PInfo_CLKBL,
        TestSignal     => CLKBL_dly,
        TestSignalName => "CLKBL",
        TestDelay      => 0 ps,
        Period         => tperiod_clkbl_posedge,
        PulseWidthHigh => tpw_CLKBL_posedge,
        PulseWidthLow  => tpw_CLKBL_negedge,
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_REGCLKAL,
        PeriodData     => PInfo_REGCLKAL,
        TestSignal     => REGCLKAL_dly,
        TestSignalName => "REGCLKAL",
        TestDelay      => 0 ps,
        Period         => tperiod_regclkal_posedge,
        PulseWidthHigh => tpw_REGCLKAL_posedge,
        PulseWidthLow  => tpw_REGCLKAL_negedge,
        CheckEnabled   => TO_X01(enal_dly) = '1',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_REGCLKBL,
        PeriodData     => PInfo_REGCLKBL,
        TestSignal     => REGCLKBL_dly,
        TestSignalName => "REGCLKBL",
        TestDelay      => 0 ps,
        Period         => tperiod_regclkbl_posedge,
        PulseWidthHigh => tpw_REGCLKBL_posedge,
        PulseWidthLow  => tpw_REGCLKBL_negedge,
        CheckEnabled   => TO_X01(enbl_dly) = '1',
        HeaderMsg      => "/X_RAMB36_EXP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
    end if;
    ViolationA          <=
      Tviol_ADDRAL0_CLKAL_posedge or
      Tviol_ADDRAL1_CLKAL_posedge or
      Tviol_ADDRAL2_CLKAL_posedge or
      Tviol_ADDRAL3_CLKAL_posedge or
      Tviol_ADDRAL4_CLKAL_posedge or
      Tviol_ADDRAL5_CLKAL_posedge or
      Tviol_ADDRAL6_CLKAL_posedge or
      Tviol_ADDRAL7_CLKAL_posedge or
      Tviol_ADDRAL8_CLKAL_posedge or
      Tviol_ADDRAL9_CLKAL_posedge or
      Tviol_ADDRAL10_CLKAL_posedge or
      Tviol_ADDRAL11_CLKAL_posedge or
      Tviol_ADDRAL12_CLKAL_posedge or
      Tviol_ADDRAL13_CLKAL_posedge or
      Tviol_ADDRAL14_CLKAL_posedge or
      Tviol_ADDRAL15_CLKAL_posedge or      
      Tviol_DIA0_CLKAL_posedge or
      Tviol_DIA1_CLKAL_posedge or
      Tviol_DIA2_CLKAL_posedge or
      Tviol_DIA3_CLKAL_posedge or
      Tviol_DIA4_CLKAL_posedge or
      Tviol_DIA5_CLKAL_posedge or
      Tviol_DIA6_CLKAL_posedge or
      Tviol_DIA7_CLKAL_posedge or
      Tviol_DIA8_CLKAL_posedge or
      Tviol_DIA9_CLKAL_posedge or
      Tviol_DIA10_CLKAL_posedge or
      Tviol_DIA11_CLKAL_posedge or
      Tviol_DIA12_CLKAL_posedge or
      Tviol_DIA13_CLKAL_posedge or
      Tviol_DIA14_CLKAL_posedge or
      Tviol_DIA15_CLKAL_posedge or
      Tviol_DIA16_CLKAL_posedge or
      Tviol_DIA17_CLKAL_posedge or
      Tviol_DIA18_CLKAL_posedge or
      Tviol_DIA19_CLKAL_posedge or
      Tviol_DIA20_CLKAL_posedge or
      Tviol_DIA21_CLKAL_posedge or
      Tviol_DIA22_CLKAL_posedge or
      Tviol_DIA23_CLKAL_posedge or
      Tviol_DIA24_CLKAL_posedge or
      Tviol_DIA25_CLKAL_posedge or
      Tviol_DIA26_CLKAL_posedge or
      Tviol_DIA27_CLKAL_posedge or
      Tviol_DIA28_CLKAL_posedge or
      Tviol_DIA29_CLKAL_posedge or
      Tviol_DIA30_CLKAL_posedge or
      Tviol_DIA31_CLKAL_posedge or
      Tviol_DIPA0_CLKAL_posedge or
      Tviol_DIPA1_CLKAL_posedge or
      Tviol_DIPA2_CLKAL_posedge or
      Tviol_DIPA3_CLKAL_posedge or
      Tviol_ENAL_CLKAL_posedge or
      Tviol_SSRAL_CLKAL_posedge or
      Tviol_SSRAL_REGCLKAL_posedge or
      Tviol_REGCEAL_CLKAL_posedge or
      Tviol_REGCEAL_REGCLKAL_posedge or
      Tviol_WEAL0_CLKAL_posedge or
      Tviol_WEAL1_CLKAL_posedge or
      Tviol_WEAL2_CLKAL_posedge or
      Tviol_WEAL3_CLKAL_posedge or
      Pviol_CLKAL or Pviol_REGCLKAL;
    ViolationB          <=
      Tviol_ADDRBL0_CLKBL_posedge or
      Tviol_ADDRBL1_CLKBL_posedge or
      Tviol_ADDRBL2_CLKBL_posedge or
      Tviol_ADDRBL3_CLKBL_posedge or
      Tviol_ADDRBL4_CLKBL_posedge or
      Tviol_ADDRBL5_CLKBL_posedge or
      Tviol_ADDRBL6_CLKBL_posedge or
      Tviol_ADDRBL7_CLKBL_posedge or
      Tviol_ADDRBL8_CLKBL_posedge or
      Tviol_ADDRBL9_CLKBL_posedge or
      Tviol_ADDRBL10_CLKBL_posedge or
      Tviol_ADDRBL11_CLKBL_posedge or
      Tviol_ADDRBL12_CLKBL_posedge or
      Tviol_ADDRBL13_CLKBL_posedge or
      Tviol_ADDRBL14_CLKBL_posedge or
      Tviol_ADDRBL15_CLKBL_posedge or  
      Tviol_DIB0_CLKBL_posedge or
      Tviol_DIB1_CLKBL_posedge or
      Tviol_DIB2_CLKBL_posedge or
      Tviol_DIB3_CLKBL_posedge or
      Tviol_DIB4_CLKBL_posedge or
      Tviol_DIB5_CLKBL_posedge or
      Tviol_DIB6_CLKBL_posedge or
      Tviol_DIB7_CLKBL_posedge or
      Tviol_DIB8_CLKBL_posedge or
      Tviol_DIB9_CLKBL_posedge or
      Tviol_DIB10_CLKBL_posedge or
      Tviol_DIB11_CLKBL_posedge or
      Tviol_DIB12_CLKBL_posedge or
      Tviol_DIB13_CLKBL_posedge or
      Tviol_DIB14_CLKBL_posedge or
      Tviol_DIB15_CLKBL_posedge or
      Tviol_DIB16_CLKBL_posedge or
      Tviol_DIB17_CLKBL_posedge or
      Tviol_DIB18_CLKBL_posedge or
      Tviol_DIB19_CLKBL_posedge or
      Tviol_DIB20_CLKBL_posedge or
      Tviol_DIB21_CLKBL_posedge or
      Tviol_DIB22_CLKBL_posedge or
      Tviol_DIB23_CLKBL_posedge or
      Tviol_DIB24_CLKBL_posedge or
      Tviol_DIB25_CLKBL_posedge or
      Tviol_DIB26_CLKBL_posedge or
      Tviol_DIB27_CLKBL_posedge or
      Tviol_DIB28_CLKBL_posedge or
      Tviol_DIB29_CLKBL_posedge or
      Tviol_DIB30_CLKBL_posedge or
      Tviol_DIB31_CLKBL_posedge or
      Tviol_DIPB0_CLKBL_posedge or
      Tviol_DIPB1_CLKBL_posedge or
      Tviol_DIPB2_CLKBL_posedge or
      Tviol_DIPB3_CLKBL_posedge or
      Tviol_ENBL_CLKBL_posedge or
      Tviol_SSRBL_CLKBL_posedge or
      Tviol_SSRBL_REGCLKBL_posedge or
      Tviol_WEBL0_CLKBL_posedge or
      Tviol_WEBL1_CLKBL_posedge or
      Tviol_WEBL2_CLKBL_posedge or
      Tviol_WEBL3_CLKBL_posedge or
      Pviol_CLKBL or Pviol_REGCLKBL;

    if (Tviol_ADDRAL0_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(0)", "CLKAL");
    end if;

    if (Tviol_ADDRAL1_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(1)", "CLKAL");
    end if;

    if (Tviol_ADDRAL2_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(2)", "CLKAL");
    end if;

    if (Tviol_ADDRAL3_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(3)", "CLKAL");
    end if;

    if (Tviol_ADDRAL4_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(4)", "CLKAL");
    end if;

    if (Tviol_ADDRAL5_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(5)", "CLKAL");
    end if;

    if (Tviol_ADDRAL6_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(6)", "CLKAL");
    end if;

    if (Tviol_ADDRAL7_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(7)", "CLKAL");
    end if;

    if (Tviol_ADDRAL8_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(8)", "CLKAL");
    end if;

    if (Tviol_ADDRAL9_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(9)", "CLKAL");
    end if;

    if (Tviol_ADDRAL10_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(10)", "CLKAL");
    end if;

    if (Tviol_ADDRAL11_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(11)", "CLKAL");
    end if;

    if (Tviol_ADDRAL12_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(12)", "CLKAL");
    end if;

    if (Tviol_ADDRAL13_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(13)", "CLKAL");
    end if;

    if (Tviol_ADDRAL14_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(14)", "CLKAL");
    end if;

    if (Tviol_ADDRAL15_CLKAL_posedge = 'X') then
      	prcd_warn_msg ("ADDRAL(15)", "CLKAL");
    end if;


    if (Tviol_ADDRBL0_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(0)", "CLKBL");
    end if;

    if (Tviol_ADDRBL1_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(1)", "CLKBL");
    end if;

    if (Tviol_ADDRBL2_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(2)", "CLKBL");
    end if;

    if (Tviol_ADDRBL3_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(3)", "CLKBL");
    end if;

    if (Tviol_ADDRBL4_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(4)", "CLKBL");
    end if;

    if (Tviol_ADDRBL5_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(5)", "CLKBL");
    end if;

    if (Tviol_ADDRBL6_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(6)", "CLKBL");
    end if;

    if (Tviol_ADDRBL7_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(7)", "CLKBL");
    end if;

    if (Tviol_ADDRBL8_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(8)", "CLKBL");
    end if;

    if (Tviol_ADDRBL9_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(9)", "CLKBL");
    end if;

    if (Tviol_ADDRBL10_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(10)", "CLKBL");
    end if;

    if (Tviol_ADDRBL11_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(11)", "CLKBL");
    end if;

    if (Tviol_ADDRBL12_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(12)", "CLKBL");
    end if;

    if (Tviol_ADDRBL13_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(13)", "CLKBL");
    end if;

    if (Tviol_ADDRBL14_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(14)", "CLKBL");
    end if;

    if (Tviol_ADDRBL15_CLKBL_posedge = 'X') then
      	prcd_warn_msg ("ADDRBL(15)", "CLKBL");
    end if;
    
      wait on ADDRAL_dly, ADDRBL_dly, CLKAL_dly, CLKBL_dly, REGCLKAL_dly, REGCLKBL_dly, DIA_dly, DIB_dly, DIPA_dly, DIPB_dly, ENAL_dly, ENBL_dly, SSRAL_dly, SSRBL_dly, WEAL_dly, WEBL_dly;
      
  end process;

-------------------------------------------------------------------------------
-- End Timing check
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Path delay
-------------------------------------------------------------------------------
   prcs_output:process (CASCADEOUTLATA_zd, CASCADEOUTLATB_zd, CASCADEOUTREGA_zd, CASCADEOUTREGB_zd, DOA_zd, DOPA_zd, DOB_zd, DOPB_zd)

    variable enal_dly   : std_ulogic                      := 'X';
    variable enbl_dly   : std_ulogic                      := 'X';


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
    variable CASCADEOUTLATA_GlitchData : VitalGlitchDataType;
    variable CASCADEOUTREGA_GlitchData : VitalGlitchDataType;

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
    variable CASCADEOUTLATB_GlitchData : VitalGlitchDataType;
    variable CASCADEOUTREGB_GlitchData : VitalGlitchDataType;
    variable DOA_viol     : std_logic_vector(MAX_DI downto 0);
    variable DOPA_viol    : std_logic_vector(MAX_DIP downto 0);
    variable DOB_viol     : std_logic_vector(MAX_DI downto 0);
    variable DOPB_viol    : std_logic_vector(MAX_DIP downto 0);
    variable CASCADEOUTLATA_viol      : std_ulogic                   := 'X';
    variable CASCADEOUTLATB_viol      : std_ulogic                   := 'X';
    variable CASCADEOUTREGA_viol      : std_ulogic                   := 'X';
    variable CASCADEOUTREGB_viol      : std_ulogic                   := 'X';
    

   begin

    CASCADEOUTLATA_viol := CASCADEOUTLATA_zd;
    CASCADEOUTREGA_viol := CASCADEOUTREGA_zd;
    DOA_viol(0)  := ViolationA xor DOA_zd(0);
    DOA_viol(1)  := ViolationA xor DOA_zd(1);
    DOA_viol(2)  := ViolationA xor DOA_zd(2);
    DOA_viol(3)  := ViolationA xor DOA_zd(3);
    DOA_viol(4)  := ViolationA xor DOA_zd(4);
    DOA_viol(5)  := ViolationA xor DOA_zd(5);
    DOA_viol(6)  := ViolationA xor DOA_zd(6);
    DOA_viol(7)  := ViolationA xor DOA_zd(7);
    DOA_viol(8)  := ViolationA xor DOA_zd(8);
    DOA_viol(9)  := ViolationA xor DOA_zd(9);
    DOA_viol(10) := ViolationA xor DOA_zd(10);
    DOA_viol(11) := ViolationA xor DOA_zd(11);
    DOA_viol(12) := ViolationA xor DOA_zd(12);
    DOA_viol(13) := ViolationA xor DOA_zd(13);
    DOA_viol(14) := ViolationA xor DOA_zd(14);
    DOA_viol(15) := ViolationA xor DOA_zd(15);
    DOA_viol(16) := ViolationA xor DOA_zd(16);
    DOA_viol(17) := ViolationA xor DOA_zd(17);
    DOA_viol(18) := ViolationA xor DOA_zd(18);
    DOA_viol(19) := ViolationA xor DOA_zd(19);
    DOA_viol(20) := ViolationA xor DOA_zd(20);
    DOA_viol(21) := ViolationA xor DOA_zd(21);
    DOA_viol(22) := ViolationA xor DOA_zd(22);
    DOA_viol(23) := ViolationA xor DOA_zd(23);
    DOA_viol(24) := ViolationA xor DOA_zd(24);
    DOA_viol(25) := ViolationA xor DOA_zd(25);
    DOA_viol(26) := ViolationA xor DOA_zd(26);
    DOA_viol(27) := ViolationA xor DOA_zd(27);
    DOA_viol(28) := ViolationA xor DOA_zd(28);
    DOA_viol(29) := ViolationA xor DOA_zd(29);
    DOA_viol(30) := ViolationA xor DOA_zd(30);
    DOA_viol(31) := ViolationA xor DOA_zd(31);
    DOPA_viol(0) := ViolationA xor DOPA_zd(0);
    DOPA_viol(1) := ViolationA xor DOPA_zd(1);
    DOPA_viol(2) := ViolationA xor DOPA_zd(2);
    DOPA_viol(3) := ViolationA xor DOPA_zd(3);


    CASCADEOUTLATB_viol := CASCADEOUTLATB_zd;
    CASCADEOUTREGB_viol := CASCADEOUTREGB_zd;
    DOB_viol(0)  := ViolationB xor DOB_zd(0);
    DOB_viol(1)  := ViolationB xor DOB_zd(1);
    DOB_viol(2)  := ViolationB xor DOB_zd(2);
    DOB_viol(3)  := ViolationB xor DOB_zd(3);
    DOB_viol(4)  := ViolationB xor DOB_zd(4);
    DOB_viol(5)  := ViolationB xor DOB_zd(5);
    DOB_viol(6)  := ViolationB xor DOB_zd(6);
    DOB_viol(7)  := ViolationB xor DOB_zd(7);
    DOB_viol(8)  := ViolationB xor DOB_zd(8);
    DOB_viol(9)  := ViolationB xor DOB_zd(9);
    DOB_viol(10) := ViolationB xor DOB_zd(10);
    DOB_viol(11) := ViolationB xor DOB_zd(11);
    DOB_viol(12) := ViolationB xor DOB_zd(12);
    DOB_viol(13) := ViolationB xor DOB_zd(13);
    DOB_viol(14) := ViolationB xor DOB_zd(14);
    DOB_viol(15) := ViolationB xor DOB_zd(15);
    DOB_viol(16) := ViolationB xor DOB_zd(16);
    DOB_viol(17) := ViolationB xor DOB_zd(17);
    DOB_viol(18) := ViolationB xor DOB_zd(18);
    DOB_viol(19) := ViolationB xor DOB_zd(19);
    DOB_viol(20) := ViolationB xor DOB_zd(20);
    DOB_viol(21) := ViolationB xor DOB_zd(21);
    DOB_viol(22) := ViolationB xor DOB_zd(22);
    DOB_viol(23) := ViolationB xor DOB_zd(23);
    DOB_viol(24) := ViolationB xor DOB_zd(24);
    DOB_viol(25) := ViolationB xor DOB_zd(25);
    DOB_viol(26) := ViolationB xor DOB_zd(26);
    DOB_viol(27) := ViolationB xor DOB_zd(27);
    DOB_viol(28) := ViolationB xor DOB_zd(28);
    DOB_viol(29) := ViolationB xor DOB_zd(29);
    DOB_viol(30) := ViolationB xor DOB_zd(30);
    DOB_viol(31) := ViolationB xor DOB_zd(31);
    DOPB_viol(0) := ViolationB xor DOPB_zd(0);
    DOPB_viol(1) := ViolationB xor DOPB_zd(1);
    DOPB_viol(2) := ViolationB xor DOPB_zd(2);
    DOPB_viol(3) := ViolationB xor DOPB_zd(3);
   
    enal_dly   := ENAL_dly;
    enbl_dly   := ENBL_dly;

    VitalPathDelay01 (
      OutSignal     => CASCADEOUTLATA,
      GlitchData    => CASCADEOUTLATA_GlitchData,
      OutSignalName => "CASCADEOUTLATA",
      OutTemp       => CASCADEOUTLATA_viol,
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_CASCADEOUTLATA, (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => CASCADEOUTREGA,
      GlitchData    => CASCADEOUTREGA_GlitchData,
      OutSignalName => "CASCADEOUTREGA",
      OutTemp       => CASCADEOUTREGA_viol,
      Paths         => (0 => (REGCLKAL_dly'last_event, tpd_REGCLKAL_CASCADEOUTREGA, (enal_dly /= '0' and GSR_REGCLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => DOA_GlitchData0,
      OutSignalName => "DOA(0)",
      OutTemp       => DOA_viol(0),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(0), (enal_dly /= '0' and GSR_CLKAL_dly /= '1')),
                        1 => (CASCADEINLATA_dly'last_event, tpd_CASCADEINLATA_DOA(0), (RAM_EXTENSION_A /= "NONE")),
                        2 => (CASCADEINREGA_dly'last_event, tpd_CASCADEINREGA_DOA(0), (RAM_EXTENSION_A /= "NONE"))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(1),
      GlitchData    => DOA_GlitchData1,
      OutSignalName => "DOA(1)",
      OutTemp       => DOA_viol(1),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(1), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(2),
      GlitchData    => DOA_GlitchData2,
      OutSignalName => "DOA(2)",
      OutTemp       => DOA_viol(2),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(2), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(3),
      GlitchData    => DOA_GlitchData3,
      OutSignalName => "DOA(3)",
      OutTemp       => DOA_viol(3),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(3), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(4),
      GlitchData    => DOA_GlitchData4,
      OutSignalName => "DOA(4)",
      OutTemp       => DOA_viol(4),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(4), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(5),
      GlitchData    => DOA_GlitchData5,
      OutSignalName => "DOA(5)",
      OutTemp       => DOA_viol(5),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(5), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(6),
      GlitchData    => DOA_GlitchData6,
      OutSignalName => "DOA(6)",
      OutTemp       => DOA_viol(6),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(6), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(7),
      GlitchData    => DOA_GlitchData7,
      OutSignalName => "DOA(7)",
      OutTemp       => DOA_viol(7),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(7), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(8),
      GlitchData    => DOA_GlitchData8,
      OutSignalName => "DOA(8)",
      OutTemp       => DOA_viol(8),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(8), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(9),
      GlitchData    => DOA_GlitchData9,
      OutSignalName => "DOA(9)",
      OutTemp       => DOA_viol(9),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(9), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(10),
      GlitchData    => DOA_GlitchData10,
      OutSignalName => "DOA(10)",
      OutTemp       => DOA_viol(10),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(10), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(11),
      GlitchData    => DOA_GlitchData11,
      OutSignalName => "DOA(11)",
      OutTemp       => DOA_viol(11),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(11), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(12),
      GlitchData    => DOA_GlitchData12,
      OutSignalName => "DOA(12)",
      OutTemp       => DOA_viol(12),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(12), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(13),
      GlitchData    => DOA_GlitchData13,
      OutSignalName => "DOA(13)",
      OutTemp       => DOA_viol(13),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(13), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(14),
      GlitchData    => DOA_GlitchData14,
      OutSignalName => "DOA(14)",
      OutTemp       => DOA_viol(14),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(14), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(15),
      GlitchData    => DOA_GlitchData15,
      OutSignalName => "DOA(15)",
      OutTemp       => DOA_viol(15),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(15), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(16),
      GlitchData    => DOA_GlitchData16,
      OutSignalName => "DOA(16)",
      OutTemp       => DOA_viol(16),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(16), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(17),
      GlitchData    => DOA_GlitchData17,
      OutSignalName => "DOA(17)",
      OutTemp       => DOA_viol(17),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(17), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(18),
      GlitchData    => DOA_GlitchData18,
      OutSignalName => "DOA(18)",
      OutTemp       => DOA_viol(18),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(18), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(19),
      GlitchData    => DOA_GlitchData19,
      OutSignalName => "DOA(19)",
      OutTemp       => DOA_viol(19),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(19), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(20),
      GlitchData    => DOA_GlitchData20,
      OutSignalName => "DOA(20)",
      OutTemp       => DOA_viol(20),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(20), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(21),
      GlitchData    => DOA_GlitchData21,
      OutSignalName => "DOA(21)",
      OutTemp       => DOA_viol(21),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(21), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(22),
      GlitchData    => DOA_GlitchData22,
      OutSignalName => "DOA(22)",
      OutTemp       => DOA_viol(22),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(22), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(23),
      GlitchData    => DOA_GlitchData23,
      OutSignalName => "DOA(23)",
      OutTemp       => DOA_viol(23),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(23), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(24),
      GlitchData    => DOA_GlitchData24,
      OutSignalName => "DOA(24)",
      OutTemp       => DOA_viol(24),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(24), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(25),
      GlitchData    => DOA_GlitchData25,
      OutSignalName => "DOA(25)",
      OutTemp       => DOA_viol(25),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(25), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(26),
      GlitchData    => DOA_GlitchData26,
      OutSignalName => "DOA(26)",
      OutTemp       => DOA_viol(26),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(26), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(27),
      GlitchData    => DOA_GlitchData27,
      OutSignalName => "DOA(27)",
      OutTemp       => DOA_viol(27),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(27), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(28),
      GlitchData    => DOA_GlitchData28,
      OutSignalName => "DOA(28)",
      OutTemp       => DOA_viol(28),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(28), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(29),
      GlitchData    => DOA_GlitchData29,
      OutSignalName => "DOA(29)",
      OutTemp       => DOA_viol(29),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(29), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(30),
      GlitchData    => DOA_GlitchData30,
      OutSignalName => "DOA(30)",
      OutTemp       => DOA_viol(30),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(30), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(31),
      GlitchData    => DOA_GlitchData31,
      OutSignalName => "DOA(31)",
      OutTemp       => DOA_viol(31),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOA(31), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(0),
      GlitchData    => DOPA_GlitchData0,
      OutSignalName => "DOPA(0)",
      OutTemp       => DOPA_viol(0),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOPA(0), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(1),
      GlitchData    => DOPA_GlitchData1,
      OutSignalName => "DOPA(1)",
      OutTemp       => DOPA_viol(1),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOPA(1), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(2),
      GlitchData    => DOPA_GlitchData2,
      OutSignalName => "DOPA(2)",
      OutTemp       => DOPA_viol(2),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOPA(2), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(3),
      GlitchData    => DOPA_GlitchData3,
      OutSignalName => "DOPA(3)",
      OutTemp       => DOPA_viol(3),
      Paths         => (0 => (CLKAL_dly'last_event, tpd_CLKAL_DOPA(3), (enal_dly /= '0' and GSR_CLKAL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

----- Port B
    VitalPathDelay01 (
      OutSignal     => CASCADEOUTLATB,
      GlitchData    => CASCADEOUTLATB_GlitchData,
      OutSignalName => "CASCADEOUTLATB",
      OutTemp       => CASCADEOUTLATB_viol,
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_CASCADEOUTLATB, (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => CASCADEOUTREGB,
      GlitchData    => CASCADEOUTREGB_GlitchData,
      OutSignalName => "CASCADEOUTREGB",
      OutTemp       => CASCADEOUTREGB_viol,
      Paths         => (0 => (REGCLKBL_dly'last_event, tpd_REGCLKBL_CASCADEOUTREGB, (enbl_dly /= '0' and GSR_REGCLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => DOB_GlitchData0,
      OutSignalName => "DOB(0)",
      OutTemp       => DOB_viol(0),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(0), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1')),
                        1 => (CASCADEINLATB_dly'last_event, tpd_CASCADEINLATB_DOB(0), (RAM_EXTENSION_B /= "NONE")),
                        2 => (CASCADEINREGB_dly'last_event, tpd_CASCADEINREGB_DOB(0), (RAM_EXTENSION_B /= "NONE"))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => DOB_GlitchData1,
      OutSignalName => "DOB(1)",
      OutTemp       => DOB_viol(1),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(1), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(2),
      GlitchData    => DOB_GlitchData2,
      OutSignalName => "DOB(2)",
      OutTemp       => DOB_viol(2),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(2), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(3),
      GlitchData    => DOB_GlitchData3,
      OutSignalName => "DOB(3)",
      OutTemp       => DOB_viol(3),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(3), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(4),
      GlitchData    => DOB_GlitchData4,
      OutSignalName => "DOB(4)",
      OutTemp       => DOB_viol(4),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(4), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(5),
      GlitchData    => DOB_GlitchData5,
      OutSignalName => "DOB(5)",
      OutTemp       => DOB_viol(5),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(5), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(6),
      GlitchData    => DOB_GlitchData6,
      OutSignalName => "DOB(6)",
      OutTemp       => DOB_viol(6),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(6), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(7),
      GlitchData    => DOB_GlitchData7,
      OutSignalName => "DOB(7)",
      OutTemp       => DOB_viol(7),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(7), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(8),
      GlitchData    => DOB_GlitchData8,
      OutSignalName => "DOB(8)",
      OutTemp       => DOB_viol(8),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(8), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(9),
      GlitchData    => DOB_GlitchData9,
      OutSignalName => "DOB(9)",
      OutTemp       => DOB_viol(9),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(9), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(10),
      GlitchData    => DOB_GlitchData10,
      OutSignalName => "DOB(10)",
      OutTemp       => DOB_viol(10),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(10), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(11),
      GlitchData    => DOB_GlitchData11,
      OutSignalName => "DOB(11)",
      OutTemp       => DOB_viol(11),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(11), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(12),
      GlitchData    => DOB_GlitchData12,
      OutSignalName => "DOB(12)",
      OutTemp       => DOB_viol(12),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(12), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(13),
      GlitchData    => DOB_GlitchData13,
      OutSignalName => "DOB(13)",
      OutTemp       => DOB_viol(13),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(13), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(14),
      GlitchData    => DOB_GlitchData14,
      OutSignalName => "DOB(14)",
      OutTemp       => DOB_viol(14),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(14), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(15),
      GlitchData    => DOB_GlitchData15,
      OutSignalName => "DOB(15)",
      OutTemp       => DOB_viol(15),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(15), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(16),
      GlitchData    => DOB_GlitchData16,
      OutSignalName => "DOB(16)",
      OutTemp       => DOB_viol(16),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(16), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(17),
      GlitchData    => DOB_GlitchData17,
      OutSignalName => "DOB(17)",
      OutTemp       => DOB_viol(17),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(17), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(18),
      GlitchData    => DOB_GlitchData18,
      OutSignalName => "DOB(18)",
      OutTemp       => DOB_viol(18),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(18), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(19),
      GlitchData    => DOB_GlitchData19,
      OutSignalName => "DOB(19)",
      OutTemp       => DOB_viol(19),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(19), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(20),
      GlitchData    => DOB_GlitchData20,
      OutSignalName => "DOB(20)",
      OutTemp       => DOB_viol(20),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(20), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(21),
      GlitchData    => DOB_GlitchData21,
      OutSignalName => "DOB(21)",
      OutTemp       => DOB_viol(21),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(21), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(22),
      GlitchData    => DOB_GlitchData22,
      OutSignalName => "DOB(22)",
      OutTemp       => DOB_viol(22),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(22), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(23),
      GlitchData    => DOB_GlitchData23,
      OutSignalName => "DOB(23)",
      OutTemp       => DOB_viol(23),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(23), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(24),
      GlitchData    => DOB_GlitchData24,
      OutSignalName => "DOB(24)",
      OutTemp       => DOB_viol(24),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(24), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(25),
      GlitchData    => DOB_GlitchData25,
      OutSignalName => "DOB(25)",
      OutTemp       => DOB_viol(25),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(25), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(26),
      GlitchData    => DOB_GlitchData26,
      OutSignalName => "DOB(26)",
      OutTemp       => DOB_viol(26),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(26), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(27),
      GlitchData    => DOB_GlitchData27,
      OutSignalName => "DOB(27)",
      OutTemp       => DOB_viol(27),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(27), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(28),
      GlitchData    => DOB_GlitchData28,
      OutSignalName => "DOB(28)",
      OutTemp       => DOB_viol(28),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(28), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(29),
      GlitchData    => DOB_GlitchData29,
      OutSignalName => "DOB(29)",
      OutTemp       => DOB_viol(29),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(29), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(30),
      GlitchData    => DOB_GlitchData30,
      OutSignalName => "DOB(30)",
      OutTemp       => DOB_viol(30),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(30), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(31),
      GlitchData    => DOB_GlitchData31,
      OutSignalName => "DOB(31)",
      OutTemp       => DOB_viol(31),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOB(31), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(0),
      GlitchData    => DOPB_GlitchData0,
      OutSignalName => "DOPB(0)",
      OutTemp       => DOPB_viol(0),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOPB(0), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(1),
      GlitchData    => DOPB_GlitchData1,
      OutSignalName => "DOPB(1)",
      OutTemp       => DOPB_viol(1),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOPB(1), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(2),
      GlitchData    => DOPB_GlitchData2,
      OutSignalName => "DOPB(2)",
      OutTemp       => DOPB_viol(2),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOPB(2), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(3),
      GlitchData    => DOPB_GlitchData3,
      OutSignalName => "DOPB(3)",
      OutTemp       => DOPB_viol(3),
      Paths         => (0 => (CLKBL_dly'last_event, tpd_CLKBL_DOPB(3), (enbl_dly /= '0' and GSR_CLKBL_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
   end process prcs_output;
---------------------------------------------------------------------------
-- End Path delay
---------------------------------------------------------------------------



end X_RAMB36_EXP_V;
