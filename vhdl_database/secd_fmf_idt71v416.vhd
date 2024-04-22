--------------------------------------------------------------------------------
--  File Name: idt71v416.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2006 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     P. Dicorato 06 MAR 27   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     RAM
--  Technology:  not ECL
--  Part:        idt71v416
-- 
--  Description: 256K X 16 SRAM
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY idt71v416 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_OENeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_WENeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CENeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_BHENeg         : VitalDelayType01 := VitalZeroDelay01;
        tipd_BLENeg         : VitalDelayType01 := VitalZeroDelay01;
        tipd_D0             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D1             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D2             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D3             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D4             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D5             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D6             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D7             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D8             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D9             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D10            : VitalDelayType01 := VitalZeroDelay01;
        tipd_D11            : VitalDelayType01 := VitalZeroDelay01;
        tipd_D12            : VitalDelayType01 := VitalZeroDelay01;
        tipd_D13            : VitalDelayType01 := VitalZeroDelay01;
        tipd_D14            : VitalDelayType01 := VitalZeroDelay01;
        tipd_D15            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A0             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A4             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A5             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A6             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A7             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A8             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A9             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A10            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A11            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A12            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A13            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A14            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A15            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A16            : VitalDelayType01 := VitalZeroDelay01;
        tipd_A17            : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_BLENeg_D0                   : VitalDelayType01Z := UnitDelay01Z;
        tpd_OENeg_D0                    : VitalDelayType01Z := UnitDelay01Z;
        tpd_CENeg_D0                    : VitalDelayType01Z := UnitDelay01Z;
        tpd_A0_D0                       : VitalDelayType01  := UnitDelay01;
        -- tpw values: pulse widths
        tpw_WENeg_negedge               : VitalDelayType    := UnitDelay;
        -- tsetup values: setup times
        tsetup_BLENeg_WENeg             : VitalDelayType    := UnitDelay;
        tsetup_D0_WENeg                 : VitalDelayType    := UnitDelay;
        tsetup_D0_CENeg                 : VitalDelayType    := UnitDelay;
        -- thold values: hold times
        thold_D0_WENeg                  : VitalDelayType    := UnitDelay;
        thold_D0_CENeg                  : VitalDelayType    := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXOn;
        SeverityMode        : SEVERITY_LEVEL := WARNING;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        A0              : IN    std_ulogic := 'U';
        A1              : IN    std_ulogic := 'U';
        A2              : IN    std_ulogic := 'U';
        A3              : IN    std_ulogic := 'U';
        A4              : IN    std_ulogic := 'U';
        A5              : IN    std_ulogic := 'U';
        A6              : IN    std_ulogic := 'U';
        A7              : IN    std_ulogic := 'U';
        A8              : IN    std_ulogic := 'U';
        A9              : IN    std_ulogic := 'U';
        A10             : IN    std_ulogic := 'U';
        A11             : IN    std_ulogic := 'U';
        A12             : IN    std_ulogic := 'U';
        A13             : IN    std_ulogic := 'U';
        A14             : IN    std_ulogic := 'U';
        A15             : IN    std_ulogic := 'U';
        A16             : IN    std_ulogic := 'U';
        A17             : IN    std_ulogic := 'U';
        D0              : INOUT std_ulogic := 'U';
        D1              : INOUT std_ulogic := 'U';
        D2              : INOUT std_ulogic := 'U';
        D3              : INOUT std_ulogic := 'U';
        D4              : INOUT std_ulogic := 'U';
        D5              : INOUT std_ulogic := 'U';
        D6              : INOUT std_ulogic := 'U';
        D7              : INOUT std_ulogic := 'U';
        D8              : INOUT std_ulogic := 'U';
        D9              : INOUT std_ulogic := 'U';
        D10             : INOUT std_ulogic := 'U';
        D11             : INOUT std_ulogic := 'U';
        D12             : INOUT std_ulogic := 'U';
        D13             : INOUT std_ulogic := 'U';
        D14             : INOUT std_ulogic := 'U';
        D15             : INOUT std_ulogic := 'U';
        BHENeg          : IN    std_ulogic := 'U';
        BLENeg          : IN    std_ulogic := 'U';
        OENeg           : IN    std_ulogic := 'U';
        WENeg           : IN    std_ulogic := 'U';
        CENeg           : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of idt71v416 : ENTITY IS TRUE;
END idt71v416 ;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of idt71V416 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID         : STRING := "IDT71V416";
    CONSTANT MaxData        : NATURAL := 255;
    CONSTANT TotalLOC       : NATURAL := 262143;
    CONSTANT HiAbit         : NATURAL := 17;
    CONSTANT HiDbit         : NATURAL := 7;
    CONSTANT DataWidth      : NATURAL := 8;

    SIGNAL D0_ipd           : std_ulogic := 'U';
    SIGNAL D1_ipd           : std_ulogic := 'U';
    SIGNAL D2_ipd           : std_ulogic := 'U';
    SIGNAL D3_ipd           : std_ulogic := 'U';
    SIGNAL D4_ipd           : std_ulogic := 'U';
    SIGNAL D5_ipd           : std_ulogic := 'U';
    SIGNAL D6_ipd           : std_ulogic := 'U';
    SIGNAL D7_ipd           : std_ulogic := 'U';
    SIGNAL D8_ipd           : std_ulogic := 'U';
    SIGNAL D9_ipd           : std_ulogic := 'U';
    SIGNAL D10_ipd          : std_ulogic := 'U';
    SIGNAL D11_ipd          : std_ulogic := 'U';
    SIGNAL D12_ipd          : std_ulogic := 'U';
    SIGNAL D13_ipd          : std_ulogic := 'U';
    SIGNAL D14_ipd          : std_ulogic := 'U';
    SIGNAL D15_ipd          : std_ulogic := 'U';

    SIGNAL A0_ipd           : std_ulogic := 'U';
    SIGNAL A1_ipd           : std_ulogic := 'U';
    SIGNAL A2_ipd           : std_ulogic := 'U';
    SIGNAL A3_ipd           : std_ulogic := 'U';
    SIGNAL A4_ipd           : std_ulogic := 'U';
    SIGNAL A5_ipd           : std_ulogic := 'U';
    SIGNAL A6_ipd           : std_ulogic := 'U';
    SIGNAL A7_ipd           : std_ulogic := 'U';
    SIGNAL A8_ipd           : std_ulogic := 'U';
    SIGNAL A9_ipd           : std_ulogic := 'U';
    SIGNAL A10_ipd          : std_ulogic := 'U';
    SIGNAL A11_ipd          : std_ulogic := 'U';
    SIGNAL A12_ipd          : std_ulogic := 'U';
    SIGNAL A13_ipd          : std_ulogic := 'U';
    SIGNAL A14_ipd          : std_ulogic := 'U';
    SIGNAL A15_ipd          : std_ulogic := 'U';
    SIGNAL A16_ipd          : std_ulogic := 'U';
    SIGNAL A17_ipd          : std_ulogic := 'U';

    SIGNAL BHENeg_ipd       : std_ulogic := 'U';
    SIGNAL BLENeg_ipd       : std_ulogic := 'U';
    SIGNAL OENeg_ipd        : std_ulogic := 'U';
    SIGNAL WENeg_ipd        : std_ulogic := 'U';
    SIGNAL CENeg_ipd        : std_ulogic := 'U';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (BHENeg_ipd, BHENeg, tipd_BHENeg);
        w_2: VitalWireDelay (BLENeg_ipd, BLENeg, tipd_BLENeg);
        w_3: VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_4: VitalWireDelay (WENeg_ipd, WENeg, tipd_WENeg);
        w_5: VitalWireDelay (CENeg_ipd, CENeg, tipd_CENeg);
        w_6: VitalWireDelay (D0_ipd, D0, tipd_D0);
        w_7: VitalWireDelay (D1_ipd, D1, tipd_D1);
        w_8: VitalWireDelay (D2_ipd, D2, tipd_D2);
        w_9: VitalWireDelay (D3_ipd, D3, tipd_D3);
        w_10: VitalWireDelay (D4_ipd, D4, tipd_D4);
        w_11: VitalWireDelay (D5_ipd, D5, tipd_D5);
        w_12: VitalWireDelay (D6_ipd, D6, tipd_D6);
        w_13: VitalWireDelay (D7_ipd, D7, tipd_D7);
        w_14: VitalWireDelay (D8_ipd, D8, tipd_D8);
        w_15: VitalWireDelay (D9_ipd, D9, tipd_D9);
        w_16: VitalWireDelay (D10_ipd, D10, tipd_D10);
        w_17: VitalWireDelay (D11_ipd, D11, tipd_D11);
        w_18: VitalWireDelay (D12_ipd, D12, tipd_D12);
        w_19: VitalWireDelay (D13_ipd, D13, tipd_D13);
        w_20: VitalWireDelay (D14_ipd, D14, tipd_D14);
        w_21: VitalWireDelay (D15_ipd, D15, tipd_D15);
        w_22: VitalWireDelay (A0_ipd, A0, tipd_A0);
        w_23: VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_24: VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_25: VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_26: VitalWireDelay (A4_ipd, A4, tipd_A4);
        w_27: VitalWireDelay (A5_ipd, A5, tipd_A5);
        w_28: VitalWireDelay (A6_ipd, A6, tipd_A6);
        w_29: VitalWireDelay (A7_ipd, A7, tipd_A7);
        w_30: VitalWireDelay (A8_ipd, A8, tipd_A8);
        w_32: VitalWireDelay (A9_ipd, A9, tipd_A9);
        w_33: VitalWireDelay (A10_ipd, A10, tipd_A10);
        w_34: VitalWireDelay (A11_ipd, A11, tipd_A11);
        w_35: VitalWireDelay (A12_ipd, A12, tipd_A12);
        w_36: VitalWireDelay (A13_ipd, A13, tipd_A13);
        w_37: VitalWireDelay (A14_ipd, A14, tipd_A14);
        w_38: VitalWireDelay (A15_ipd, A15, tipd_A15);
        w_39: VitalWireDelay (A16_ipd, A16, tipd_A16);
        w_40: VitalWireDelay (A17_ipd, A17, tipd_A17);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Block
    ----------------------------------------------------------------------------
    Behavior: BLOCK

        PORT (
            AddressIn       : IN    std_logic_vector(HiAbit downto 0);
            DataHIn         : IN    std_logic_vector(HiDbit downto 0);
            DataLIn         : IN    std_logic_vector(HiDbit downto 0);
            DataHOut        : OUT   std_logic_vector(HiDbit downto 0);
            DataLOut        : OUT   std_logic_vector(HiDbit downto 0);
            BHENegIn        : IN    std_ulogic := 'U';
            BLENegIn        : IN    std_ulogic := 'U';
            OENegIn         : IN    std_ulogic := 'U';
            WENegIn         : IN    std_ulogic := 'U';
            CENegIn         : IN    std_ulogic := 'U'
        );
        PORT MAP (
            DataLOut(0) =>  D0,
            DataLOut(1) =>  D1,
            DataLOut(2) =>  D2,
            DataLOut(3) =>  D3,
            DataLOut(4) =>  D4,
            DataLOut(5) =>  D5,
            DataLOut(6) =>  D6,
            DataLOut(7) =>  D7,
            DataHOut(0) =>  D8,
            DataHOut(1) =>  D9,
            DataHOut(2) =>  D10,
            DataHOut(3) =>  D11,
            DataHOut(4) =>  D12,
            DataHOut(5) =>  D13,
            DataHOut(6) =>  D14,
            DataHOut(7) =>  D15,
            DataLIn(0) =>  D0_ipd,
            DataLIn(1) =>  D1_ipd,
            DataLIn(2) =>  D2_ipd,
            DataLIn(3) =>  D3_ipd,
            DataLIn(4) =>  D4_ipd,
            DataLIn(5) =>  D5_ipd,
            DataLIn(6) =>  D6_ipd,
            DataLIn(7) =>  D7_ipd,
            DataHIn(0) =>  D8_ipd,
            DataHIn(1) =>  D9_ipd,
            DataHIn(2) =>  D10_ipd,
            DataHIn(3) =>  D11_ipd,
            DataHIn(4) =>  D12_ipd,
            DataHIn(5) =>  D13_ipd,
            DataHIn(6) =>  D14_ipd,
            DataHIn(7) =>  D15_ipd,
            AddressIn(0) => A0_ipd,
            AddressIn(1) => A1_ipd,
            AddressIn(2) => A2_ipd,
            AddressIn(3) => A3_ipd,
            AddressIn(4) => A4_ipd,
            AddressIn(5) => A5_ipd,
            AddressIn(6) => A6_ipd,
            AddressIn(7) => A7_ipd,
            AddressIn(8) => A8_ipd,
            AddressIn(9) => A9_ipd,
            AddressIn(10) => A10_ipd,
            AddressIn(11) => A11_ipd,
            AddressIn(12) => A12_ipd,
            AddressIn(13) => A13_ipd,
            AddressIn(14) => A14_ipd,
            AddressIn(15) => A15_ipd,
            AddressIn(16) => A16_ipd,
            AddressIn(17) => A17_ipd,
            BHENegIn => BHENeg_ipd,
            BLENegIn => BLENeg_ipd,
            OENegIn => OENeg_ipd,
            WENegIn => WENeg_ipd,
            CENegIn => CENeg_ipd
        );

        SIGNAL DH_zd    : std_logic_vector(HiDbit DOWNTO 0) := (OTHERS => 'Z');
        SIGNAL DL_zd    : std_logic_vector(HiDbit DOWNTO 0) := (OTHERS => 'Z');
        SIGNAL DH_int   : std_logic_vector(HiDbit DOWNTO 0) := (OTHERS => 'Z');
        SIGNAL DL_int   : std_logic_vector(HiDbit DOWNTO 0) := (OTHERS => 'Z');
        SIGNAL DH_buf   : std_logic_vector(HiDbit DOWNTO 0) := (OTHERS => 'Z');
        SIGNAL DL_buf   : std_logic_vector(HiDbit DOWNTO 0) := (OTHERS => 'Z');
        SIGNAL CENeg_nwv : UX01 := 'U';
        SIGNAL OENeg_nwv : UX01 := 'U';

    BEGIN 

        CENeg_nwv   <= To_UX01 (s => CENegIn);
        OENeg_nwv   <= To_UX01 (s => OENegIn);

        ------------------------------------------------------------------------
        -- Tristate Process
        ------------------------------------------------------------------------
        Tristate : PROCESS (OENeg_nwv, DH_int, DL_int)

        BEGIN 
            IF OENeg_nwv = '0' THEN
                DH_buf <= DH_int;
                DL_buf <= DL_int;
            ELSE
                DH_buf <= (OTHERS => 'Z');
                DL_buf <= (OTHERS => 'Z');
            END IF;

        END PROCESS;                           

        ------------------------------------------------------------------------
        -- Behavior Process
        ------------------------------------------------------------------------
        Behavior : PROCESS (OENeg_nwv, WENegIn, CENeg_nwv, AddressIn, DataHIn, 
                            DataLIn, BHENegIn, BLENegIn)
                         
            -- Timing Check Variables
            VARIABLE Tviol_D0_WENeg: X01 := '0';
            VARIABLE TD_D0_WENeg   : VitalTimingDataType;

            VARIABLE Tviol_D8_WENeg: X01 := '0';
            VARIABLE TD_D8_WENeg   : VitalTimingDataType;

            VARIABLE Tviol_BHENeg_WENeg: X01 := '0';
            VARIABLE TD_BHENeg_WENeg   : VitalTimingDataType;

            VARIABLE Tviol_BLENeg_WENeg: X01 := '0';
            VARIABLE TD_BLENeg_WENeg   : VitalTimingDataType;

            VARIABLE Tviol_D8_CENeg: X01 := '0';
            VARIABLE TD_D8_CENeg   : VitalTimingDataType;

            VARIABLE Tviol_D0_CENeg: X01 := '0';
            VARIABLE TD_D0_CENeg   : VitalTimingDataType;

            VARIABLE Pviol_WENeg   : X01 := '0';
            VARIABLE PD_WENeg      : VitalPeriodDataType := VitalPeriodDataInit;

            -- Memory array declaration
            TYPE MemStore IS ARRAY (0 to TotalLOC) OF INTEGER 
                             RANGE  -2 TO MaxData;

            -- Functionality Results Variables
            VARIABLE Violation  : X01 := '0';
            VARIABLE DataHDrive : std_logic_vector(HiDbit DOWNTO 0)
                                   := (OTHERS => 'X');
            VARIABLE DataLDrive : std_logic_vector(HiDbit DOWNTO 0)
                                   := (OTHERS => 'X');
            VARIABLE DataTempH  : INTEGER RANGE -2 TO MaxData  := -2;
            VARIABLE DataTempL  : INTEGER RANGE -2 TO MaxData  := -2;
            VARIABLE Location   : NATURAL RANGE 0 TO TotalLOC := 0;
            VARIABLE MemDataH   : MemStore;
            VARIABLE MemDataL   : MemStore;

            -- No Weak Values Variables
            VARIABLE BHENeg_nwv  : UX01 := 'X';
            VARIABLE BLENeg_nwv  : UX01 := 'X';
            VARIABLE WENeg_nwv   : UX01 := 'X';

        BEGIN 
            BHENeg_nwv  := To_UX01 (s => BHENegIn);
            BLENeg_nwv  := To_UX01 (s => BLENegIn);
            WENeg_nwv   := To_UX01 (s => WENegIn);

            --------------------------------------------------------------------
            -- Timing Check Section
            --------------------------------------------------------------------
            IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal      => DataHIn,
                    TestSignalName  => "DataH",
                    RefSignal       => WENegIn,
                    RefSignalName   => "WENeg",
                    SetupHigh       => tsetup_D0_WENeg,
                    SetupLow        => tsetup_D0_WENeg,
                    HoldHigh        => thold_D0_WENeg,
                    HoldLow         => thold_D0_WENeg,
                    CheckEnabled    => (CENeg_nwv ='0' and OENeg_nwv ='1' and 
                                        BHENeg_nwv = '0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_D8_WENeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_D8_WENeg );

                VitalSetupHoldCheck (
                    TestSignal      => DataLIn,
                    TestSignalName  => "DataL",
                    RefSignal       => WENegIn,
                    RefSignalName   => "WENeg",
                    SetupHigh       => tsetup_D0_WENeg,
                    SetupLow        => tsetup_D0_WENeg,
                    HoldHigh        => thold_D0_WENeg,
                    HoldLow         => thold_D0_WENeg,
                    CheckEnabled    => (CENeg_nwv ='0' and OENeg_nwv ='1' and 
                                        BLENeg_nwv = '0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_D0_WENeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_D0_WENeg );

                VitalSetupHoldCheck (
                    TestSignal      => BHENegIn,
                    TestSignalName  => "BHENeg",
                    RefSignal       => WENegIn,
                    RefSignalName   => "WENeg",
                    SetupHigh       => tsetup_BLENeg_WENeg,
                    SetupLow        => tsetup_BLENeg_WENeg,
                    CheckEnabled    => (CENeg_nwv ='0' and OENeg_nwv ='1'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_BHENeg_WENeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_BHENeg_WENeg );

                VitalSetupHoldCheck (
                    TestSignal      => DataHIn,
                    TestSignalName  => "DataH",
                    RefSignal       => CENegIn,
                    RefSignalName   => "CENeg",
                    SetupHigh       => tsetup_D0_CENeg,
                    SetupLow        => tsetup_D0_CENeg,
                    HoldHigh        => thold_D0_CENeg,
                    HoldLow         => thold_D0_CENeg,
                    CheckEnabled    => (WENeg_nwv ='0' and OENeg_nwv ='1' and
                                        BHENeg_nwv = '0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_D8_CENeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_D8_CENeg );

                VitalSetupHoldCheck (
                    TestSignal      => DataLIn,
                    TestSignalName  => "DataL",
                    RefSignal       => CENegIn,
                    RefSignalName   => "CENeg",
                    SetupHigh       => tsetup_D0_CENeg,
                    SetupLow        => tsetup_D0_CENeg,
                    HoldHigh        => thold_D0_CENeg,
                    HoldLow         => thold_D0_CENeg,
                    CheckEnabled    => (WENeg_nwv ='0' and OENeg_nwv ='1' and
                                        BLENeg_nwv = '0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_D0_CENeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_D0_CENeg );

                VitalPeriodPulseCheck (
                    TestSignal      =>  WENegIn,
                    TestSignalName  =>  "WENeg",
                    PulseWidthLow   =>  tpw_WENeg_negedge,
                    PeriodData      =>  PD_WENeg,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    Violation       =>  Pviol_WENeg,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  TRUE );

                Violation := Pviol_WENeg OR Tviol_D0_WENeg OR Tviol_D0_CENeg
                             OR Tviol_D8_WENeg OR Tviol_D8_CENeg OR
                             Tviol_BHENeg_WENeg OR Tviol_BLENeg_WENeg;

                ASSERT Violation = '0'
                    REPORT InstancePath & partID & ": simulation may be" &
                           " inaccurate due to timing violations"
                    SEVERITY SeverityMode;

            END IF; -- Timing Check Section

            --------------------------------------------------------------------
            -- Functional Section
            --------------------------------------------------------------------

            IF (CENeg_nwv = '0') THEN

                Location := To_Nat(AddressIn);

                IF (WENeg_nwv = '1') THEN
                    IF BHENeg_nwv = '0' THEN
                        DataTempH := MemDataH(Location);
                        IF DataTempH >= 0 THEN
                            DataHDrive := To_slv(DataTempH, DataWidth);
                        ELSIF DataTempH = -2 THEN
                            DataHDrive := (OTHERS => 'U');
                        ELSE
                            DataHDrive := (OTHERS => 'X');
                        END IF;
                    ELSE
                        DataHDrive := (OTHERS => 'Z');
                    END IF;
                    IF BLENeg_nwv = '0' THEN
                        DataTempL  := MemDataL(Location);
                        IF DataTempL >= 0 THEN
                            DataLDrive := To_slv(DataTempL, DataWidth);
                        ELSIF DataTempL = -2 THEN
                            DataLDrive := (OTHERS => 'U');
                        ELSE
                            DataLDrive := (OTHERS => 'X');
                        END IF;
                    ELSE
                        DataLDrive := (OTHERS => 'Z');
                    END IF;
                ELSIF (WENeg_nwv = '0') THEN
                    IF Violation = '0' THEN
                        IF BHENeg_nwv = '0' THEN
                            DataTempH := To_Nat(DataHIn);
                        ELSE
                            DataTempH := MemDataH(Location);
                        END IF;
                        IF BLENeg_nwv = '0' THEN
                            DataTempL := To_Nat(DataLIn);
                        ELSE
                            DataTempL := MemDataL(Location);
                        END IF;
                    END IF;
                    MemDataH(Location) := DataTempH;
                    MemDataL(Location) := DataTempL;
                END IF;
            ELSE
                DataHDrive := (OTHERS => 'Z');
                DataLDrive := (OTHERS => 'Z');
            END IF;

            --------------------------------------------------------------------
            -- Output Section
            --------------------------------------------------------------------
            DH_zd <= DataHDrive;
            DL_zd <= DataLDrive;

        END PROCESS;                           

        ------------------------------------------------------------------------
        -- Path Delay Processes generated as a function of data width
        ------------------------------------------------------------------------
        DataOut_Width : FOR i IN HiDbit DOWNTO 0 GENERATE
            DataOut_Delay : PROCESS (DH_zd(i), DL_zd(i), DL_buf(i), DH_buf(i)) 
            VARIABLE DH_GlitchData:VitalGlitchDataArrayType(HiDbit Downto 0);
            VARIABLE DL_GlitchData:VitalGlitchDataArrayType(HiDbit Downto 0);
            VARIABLE DHbuf_GlitchData:VitalGlitchDataArrayType(HiDbit Downto 0);
            VARIABLE DLbuf_GlitchData:VitalGlitchDataArrayType(HiDbit Downto 0);
            BEGIN
                VitalPathDelay01Z (
                    OutSignal       => DH_int(i),
                    OutSignalName   => "DataHaddr",
                    OutTemp         => DH_zd(i),
                    Mode            => OnEvent, 
                    GlitchData      => DH_GlitchData(i),
                    Paths           => (     
                        0 => (InputChangeTime => CENeg_ipd'LAST_EVENT,
                              PathDelay       => tpd_CENeg_D0,
                              PathCondition   => TRUE),   
                        1 => (InputChangeTime => AddressIn'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_A0_D0),
                              PathCondition   => TRUE),
                        2 => (InputChangeTime => BHENeg_ipd'LAST_EVENT,
                              PathDelay       => tpd_BLENeg_D0,
                              PathCondition   => TRUE)   
                    )
                );

                VitalPathDelay01Z (
                    OutSignal       => DL_int(i),
                    OutSignalName   => "DataLaddr",
                    OutTemp         => DL_zd(i),
                    Mode            => OnEvent, 
                    GlitchData      => DL_GlitchData(i),
                    Paths           => (     
                        0 => (InputChangeTime => CENeg_ipd'LAST_EVENT,
                              PathDelay       => tpd_CENeg_D0,
                              PathCondition   => TRUE),   
                        1 => (InputChangeTime => AddressIn'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_A0_D0),
                              PathCondition   => TRUE),
                        2 => (InputChangeTime => BLENeg_ipd'LAST_EVENT,
                              PathDelay       => tpd_BLENeg_D0,
                              PathCondition   => TRUE)   
                    )
                );

                VitalPathDelay01Z (
                    OutSignal       => DataHOut(i),
                    OutSignalName   => "DataH",
                    OutTemp         => DH_buf(i),
                    Mode            => OnEvent, 
                    GlitchData      => DHbuf_GlitchData(i),
                    Paths           => (     
                        0 => (InputChangeTime => OENeg_ipd'LAST_EVENT,
                              PathDelay       => tpd_OENeg_D0,
                              PathCondition   => CENeg_nwv = '0'),
                        1 => (InputChangeTime => DH_int'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(0 ns),
                              PathCondition   => OENeg_nwv = '0')
                    )
                );

                VitalPathDelay01Z (
                    OutSignal       => DataLOut(i),
                    OutSignalName   => "DataL",
                    OutTemp         => DL_buf(i),
                    Mode            => OnEvent, 
                    GlitchData      => DLbuf_GlitchData(i),
                    Paths           => (     
                        0 => (InputChangeTime => OENeg_ipd'LAST_EVENT,
                              PathDelay       => tpd_OENeg_D0,
                              PathCondition   => CENeg_nwv = '0'),
                        1 => (InputChangeTime => DL_int'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(0 ns),
                              PathCondition   => OENeg_nwv = '0')
                    )
                );

            END PROCESS;                           
        END GENERATE;

    END BLOCK;
END vhdl_behavioral;
