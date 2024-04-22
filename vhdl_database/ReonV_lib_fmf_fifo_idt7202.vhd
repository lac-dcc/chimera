--pragma translate_off
--------------------------------------------------------------------------------
--  File Name: idt7202.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    01 Feb 10   Initial release
--    V1.1    D. Rambaud   01 OCT 24   fixed problem with RDPoint
--    V1.2    S. Habinc    06 Apr 18   fixed problem with RDPoint
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    FIFO
--  Technology: CMOS
--  Part:       IDT7202
--
--  Description: Async FIFO 1,024 x 9
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY idt7202 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D8                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_FLNeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_RNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_RSNeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_WNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_XINeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_FLNeg_EFNeg          : VitalDelayType01 := UnitDelay01;
        tpd_RNeg_Q0              : VitalDelayType01Z := UnitDelay01Z;
        tpd_RNeg_EFNeg           : VitalDelayType01 := UnitDelay01;
        tpd_RNeg_FFNeg           : VitalDelayType01 := UnitDelay01;
        tpd_RNeg_XONeg           : VitalDelayType01 := UnitDelay01;
        tpd_RSNeg_EFNeg          : VitalDelayType01 := UnitDelay01;
        tpd_RSNeg_FFNeg          : VitalDelayType01 := UnitDelay01;
        tpd_RSNeg_XONeg          : VitalDelayType01 := UnitDelay01;
        tpd_WNeg_Q0              : VitalDelayType01Z := UnitDelay01Z;
        tpd_WNeg_EFNeg           : VitalDelayType01 := UnitDelay01;
        tpd_WNeg_FFNeg           : VitalDelayType01 := UnitDelay01;
        tpd_WNeg_XONeg           : VitalDelayType01 := UnitDelay01;
        -- tpw values: pulse widths
        tpw_RNeg_negedge         : VitalDelayType   := UnitDelay;
        tpw_RNeg_posedge         : VitalDelayType   := UnitDelay;
        tpw_WNeg_negedge         : VitalDelayType   := UnitDelay;
        tpw_WNeg_posedge         : VitalDelayType   := UnitDelay;
        tpw_RSNeg_negedge        : VitalDelayType   := UnitDelay;
        tpw_FLNeg_negedge        : VitalDelayType   := UnitDelay;
        tpw_FLNeg_posedge        : VitalDelayType   := UnitDelay;
        tpw_XINeg_negedge        : VitalDelayType   := UnitDelay;
        tpw_XINeg_posedge        : VitalDelayType   := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_RNeg             : VitalDelayType   := UnitDelay;
        tperiod_WNeg             : VitalDelayType   := UnitDelay;
        -- tsetup values: setup times
        tsetup_D0_WNeg           : VitalDelayType   := UnitDelay;
        tsetup_RNeg_RSNeg        : VitalDelayType   := UnitDelay;
        tsetup_RNeg_FLNeg        : VitalDelayType   := UnitDelay;
        tsetup_XINeg_RNeg        : VitalDelayType   := UnitDelay;
        -- thold values: hold times
        thold_D0_WNeg            : VitalDelayType   := UnitDelay;
        thold_RNeg_RSNeg         : VitalDelayType   := UnitDelay;
        thold_RNeg_FLNeg         : VitalDelayType   := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        D0              : IN    std_ulogic := 'U';
        D1              : IN    std_ulogic := 'U';
        D2              : IN    std_ulogic := 'U';
        D3              : IN    std_ulogic := 'U';
        D4              : IN    std_ulogic := 'U';
        D5              : IN    std_ulogic := 'U';
        D6              : IN    std_ulogic := 'U';
        D7              : IN    std_ulogic := 'U';
        D8              : IN    std_ulogic := 'U';
        Q0              : OUT   std_ulogic := 'U';
        Q1              : OUT   std_ulogic := 'U';
        Q2              : OUT   std_ulogic := 'U';
        Q3              : OUT   std_ulogic := 'U';
        Q4              : OUT   std_ulogic := 'U';
        Q5              : OUT   std_ulogic := 'U';
        Q6              : OUT   std_ulogic := 'U';
        Q7              : OUT   std_ulogic := 'U';
        Q8              : OUT   std_ulogic := 'U';
        EFNeg           : OUT   std_ulogic := 'U';
        FFNeg           : OUT   std_ulogic := 'U';
        FLNeg           : IN    std_ulogic := 'U';
        RNeg            : IN    std_ulogic := 'U';
        RSNeg           : IN    std_ulogic := 'U';
        WNeg            : IN    std_ulogic := 'U';
        XINeg           : IN    std_ulogic := 'U';
        XONeg           : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of idt7202 : ENTITY IS TRUE;
END idt7202;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of idt7202 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID         : STRING := "IDT7202";
    CONSTANT MaxData        : NATURAL := 511;
    CONSTANT TotalLOC       : NATURAL := 1023;
    CONSTANT Half           : NATURAL := TotalLOC/2;
    CONSTANT DataWidth      : NATURAL := 9;
    CONSTANT HiDbit         : NATURAL := 8;

    SIGNAL D0_ipd              : std_ulogic := 'U';
    SIGNAL D1_ipd              : std_ulogic := 'U';
    SIGNAL D2_ipd              : std_ulogic := 'U';
    SIGNAL D3_ipd              : std_ulogic := 'U';
    SIGNAL D4_ipd              : std_ulogic := 'U';
    SIGNAL D5_ipd              : std_ulogic := 'U';
    SIGNAL D6_ipd              : std_ulogic := 'U';
    SIGNAL D7_ipd              : std_ulogic := 'U';
    SIGNAL D8_ipd              : std_ulogic := 'U';
    SIGNAL FLNeg_ipd           : std_ulogic := 'U';
    SIGNAL RNeg_ipd            : std_ulogic := 'U';
    SIGNAL RSNeg_ipd           : std_ulogic := 'U';
    SIGNAL WNeg_ipd            : std_ulogic := 'U';
    SIGNAL XINeg_ipd           : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (D0_ipd, D0, tipd_D0);
        w_2 : VitalWireDelay (D1_ipd, D1, tipd_D1);
        w_3 : VitalWireDelay (D2_ipd, D2, tipd_D2);
        w_4 : VitalWireDelay (D3_ipd, D3, tipd_D3);
        w_5 : VitalWireDelay (D4_ipd, D4, tipd_D4);
        w_6 : VitalWireDelay (D5_ipd, D5, tipd_D5);
        w_7 : VitalWireDelay (D6_ipd, D6, tipd_D6);
        w_8 : VitalWireDelay (D7_ipd, D7, tipd_D7);
        w_9 : VitalWireDelay (D8_ipd, D8, tipd_D8);
        w_21 : VitalWireDelay (FLNeg_ipd, FLNeg, tipd_FLNeg);
        w_22 : VitalWireDelay (RNeg_ipd, RNeg, tipd_RNeg);
        w_23 : VitalWireDelay (RSNeg_ipd, RSNeg, tipd_RSNeg);
        w_24 : VitalWireDelay (WNeg_ipd, WNeg, tipd_WNeg);
        w_25 : VitalWireDelay (XINeg_ipd, XINeg, tipd_XINeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Block
    ----------------------------------------------------------------------------
    Behavior: BLOCK

        PORT (
            DIn      : IN    std_logic_vector(HiDbit downto 0);
            QOut     : OUT   std_logic_vector(HiDbit downto 0);
            FLNegIn  : IN    std_Ulogic := 'U';
            RNegIn   : IN    std_Ulogic := 'U';
            RSNegIn  : IN    std_Ulogic := 'U';
            WNegIn   : IN    std_Ulogic := 'U';
            XINegIn  : IN    std_Ulogic := 'U';
            EFNegOut : OUT   std_Ulogic := 'U';
            FFNegOut : OUT   std_Ulogic := 'U';
            XONegOut : OUT   std_Ulogic := 'U'
        );
        PORT MAP (
            DIn(0) => D0_ipd,
            DIn(1) => D1_ipd,
            DIn(2) => D2_ipd,
            DIn(3) => D3_ipd,
            DIn(4) => D4_ipd,
            DIn(5) => D5_ipd,
            DIn(6) => D6_ipd,
            DIn(7) => D7_ipd,
            DIn(8) => D8_ipd,
            QOut(0) => Q0,
            QOut(1) => Q1,
            QOut(2) => Q2,
            QOut(3) => Q3,
            QOut(4) => Q4,
            QOut(5) => Q5,
            QOut(6) => Q6,
            QOut(7) => Q7,
            QOut(8) => Q8,
            FLNegIn => FLNeg_ipd,
            RSNegIn => RSNeg_ipd,
            XINegIn => XINeg_ipd,
            RNegIn => RNeg_ipd,
            WNegIn => WNeg_ipd,
            EFNegOut => EFNeg,
            FFNegOut => FFNeg,
            XONegOut => XONeg
        );

    SIGNAL Q_zd : std_logic_vector(HiDbit downto 0) := (others => 'Z');
    SIGNAL EF_pulse : std_ulogic := '0';
    SIGNAL FF_pulse : std_ulogic := '0';

    BEGIN
        ------------------------------------------------------------------------
        -- Behavior Process
        ------------------------------------------------------------------------
        Fifo : PROCESS (DIn, FLNegIn, RSNegIn, XINegIn, RNegIn, WNegIn,
                        EF_pulse, FF_pulse)

            -- Timing Check Variables
            VARIABLE Tviol_D0_WNeg         : X01 := '0';
            VARIABLE TD_D0_WNeg            : VitalTimingDataType;

            VARIABLE Tviol_RNeg_RSNeg      : X01 := '0';
            VARIABLE TD_RNeg_RSNeg         : VitalTimingDataType;

            VARIABLE Tviol_RNeg_FLNeg      : X01 := '0';
            VARIABLE TD_RNeg_FLNeg         : VitalTimingDataType;

            VARIABLE Tviol_XINeg_RNeg      : X01 := '0';
            VARIABLE TD_XINeg_RNeg         : VitalTimingDataType;

            VARIABLE Tviol_XINeg_WNeg      : X01 := '0';
            VARIABLE TD_XINeg_WNeg         : VitalTimingDataType;

            VARIABLE Pviol_RNeg            :  X01 := '0';
            VARIABLE TD_RNeg      : VitalPeriodDataType := VitalPeriodDataInit;

            VARIABLE Pviol_WNeg            :  X01 := '0';
            VARIABLE TD_WNeg      : VitalPeriodDataType := VitalPeriodDataInit;

            VARIABLE Pviol_RSNeg           :  X01 := '0';
            VARIABLE TD_RSNeg     : VitalPeriodDataType := VitalPeriodDataInit;

            VARIABLE Pviol_FLNeg           :  X01 := '0';
            VARIABLE TD_FLNeg     : VitalPeriodDataType := VitalPeriodDataInit;

            VARIABLE Pviol_XINeg           :  X01 := '0';
            VARIABLE TD_XINeg     : VitalPeriodDataType := VitalPeriodDataInit;

            -- Memory array declaration
            TYPE MemStore IS ARRAY (0 to TotalLOC) OF INTEGER
                             RANGE  -2 TO MaxData;

            -- Functionality Results Variables
            VARIABLE Violation  : X01 := '0';

            TYPE mode_type IS (unk, single, first_exp, other_exp);
            TYPE stat_type IS (inact, act);
            VARIABLE mode       : mode_type;
            VARIABLE rd_stat    : stat_type;
            VARIABLE wr_stat    : stat_type;
            VARIABLE EFNeg_zd   : std_ulogic;
            VARIABLE FFNeg_zd   : std_ulogic;
            VARIABLE XONeg_zd   : std_ulogic;
            VARIABLE EF_pzd     : std_ulogic;
            VARIABLE FF_pzd     : std_ulogic;

            VARIABLE RDPoint    : INTEGER RANGE 0 TO TotalLoc := 0;
            VARIABLE WRPoint    : INTEGER RANGE 0 TO TotalLoc := 0;
            VARIABLE Count      : INTEGER RANGE 0 TO TotalLoc := 0;
            VARIABLE MemData    : MemStore;

            VARIABLE DataDrive : std_logic_vector(HiDbit DOWNTO 0)
                                   := (OTHERS => 'Z');

            -- Output Glitch Detection Variables
            VARIABLE FFNeg_GlitchData : VitalGlitchDataType;
            VARIABLE EFNeg_GlitchData : VitalGlitchDataType;
            VARIABLE XONeg_GlitchData : VitalGlitchDataType;
            VARIABLE EFp_GlitchData   : VitalGlitchDataType;
            VARIABLE FFp_GlitchData   : VitalGlitchDataType;

            -- No Weak Values Variables
            VARIABLE FLNeg_nwv       : UX01 := 'U';
            VARIABLE WNeg_nwv        : UX01 := 'U';
            VARIABLE RNeg_nwv        : UX01 := 'U';
            VARIABLE RSNeg_nwv       : UX01 := 'U';
            VARIABLE XINeg_nwv       : UX01 := 'U';

        BEGIN
            FLNeg_nwv    := To_UX01 (s => FLNegIn);
            WNeg_nwv     := To_UX01 (s => WNegIn);
            RNeg_nwv     := To_UX01 (s => RNegIn);
            RSNeg_nwv    := To_UX01 (s => RSNegIn);
            XINeg_nwv    := To_UX01 (s => XINegIn);

            --------------------------------------------------------------------
            -- Timing Check Section
            --------------------------------------------------------------------
            IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal      => DIn,
                    TestSignalName  => "D",
                    RefSignal       => WNegIn,
                    RefSignalName   => "WNeg",
                    SetupHigh       => tsetup_D0_WNeg,
                    SetupLow        => tsetup_D0_WNeg,
                    HoldHigh        => thold_D0_WNeg,
                    HoldLow         => thold_D0_WNeg,
                    CheckEnabled    => (WNeg_nwv ='0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_D0_WNeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_D0_WNeg );

                VitalSetupHoldCheck (
                    TestSignal      => RNegIn,
                    TestSignalName  => "RNeg",
                    RefSignal       => RSNegIn,
                    RefSignalName   => "RSNeg",
                    SetupHigh       => tsetup_RNeg_RSNeg,
                    SetupLow        => tsetup_RNeg_RSNeg,
                    HoldHigh        => thold_RNeg_RSNeg,
                    HoldLow         => thold_RNeg_RSNeg,
                    CheckEnabled    => (RSNeg_nwv ='0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_RNeg_RSNeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_RNeg_RSNeg );

                VitalSetupHoldCheck (
                    TestSignal      => RNegIn,
                    TestSignalName  => "RNeg",
                    RefSignal       => FLNegIn,
                    RefSignalName   => "FLNeg",
                    SetupHigh       => tsetup_RNeg_FLNeg,
                    SetupLow        => tsetup_RNeg_FLNeg,
                    HoldHigh        => thold_RNeg_FLNeg,
                    HoldLow         => thold_RNeg_FLNeg,
                    CheckEnabled    => (FLNeg_nwv ='0'),
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_RNeg_FLNeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_RNeg_FLNeg );

                VitalSetupHoldCheck (
                    TestSignal      => XINegIn,
                    TestSignalName  => "XINeg",
                    RefSignal       => RNegIn,
                    RefSignalName   => "RNeg",
                    SetupHigh       => tsetup_XINeg_RNeg,
                    SetupLow        => tsetup_XINeg_RNeg,
                    CheckEnabled    => true,
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_XINeg_RNeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_XINeg_RNeg );

                VitalSetupHoldCheck (
                    TestSignal      => XINegIn,
                    TestSignalName  => "XINeg",
                    RefSignal       => WNegIn,
                    RefSignalName   => "WNeg",
                    SetupHigh       => tsetup_XINeg_RNeg,
                    SetupLow        => tsetup_XINeg_RNeg,
                    CheckEnabled    => true,
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_XINeg_WNeg,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_XINeg_WNeg );

                VitalPeriodPulseCheck (
                    TestSignal      =>  RNegIn,
                    TestSignalName  =>  "RNeg",
                    Period          =>  tperiod_RNeg,
                    PulseWidthLow   =>  tpw_RNeg_negedge,
                    PulseWidthHigh  =>  tpw_RNeg_posedge,
                    PeriodData      =>  TD_RNeg,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  TRUE,
                    Violation       =>  Pviol_RNeg );

                VitalPeriodPulseCheck (
                    TestSignal      =>  WNegIn,
                    TestSignalName  =>  "WNeg",
                    Period          =>  tperiod_WNeg,
                    PulseWidthLow   =>  tpw_WNeg_negedge,
                    PulseWidthHigh  =>  tpw_WNeg_posedge,
                    PeriodData      =>  TD_WNeg,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  TRUE,
                    Violation       =>  Pviol_WNeg );

                VitalPeriodPulseCheck (
                    TestSignal      =>  XINegIn,
                    TestSignalName  =>  "XINeg",
                    PulseWidthLow   =>  tpw_XINeg_negedge,
                    PeriodData      =>  TD_XINeg,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  TRUE,
                    Violation       =>  Pviol_XINeg );

                VitalPeriodPulseCheck (
                    TestSignal      =>  FLNegIn,
                    TestSignalName  =>  "FLNeg",
                    PulseWidthLow   =>  tpw_FLNeg_negedge,
                    PulseWidthHigh  =>  tpw_FLNeg_posedge,
                    PeriodData      =>  TD_FLNeg,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  TRUE,
                    Violation       =>  Pviol_FLNeg );

            END IF; -- Timing Check Section

        --------------------------------------------------------------------
        -- Functional Section
        --------------------------------------------------------------------
        Violation := Tviol_D0_WNeg OR Tviol_RNeg_RSNeg OR Tviol_RNeg_FLNeg
                     OR Tviol_XINeg_RNeg OR Tviol_XINeg_WNeg OR Pviol_RNeg
                     OR Pviol_WNeg OR Pviol_RSNeg OR Pviol_FLNeg OR
                     Pviol_XINeg;

        IF (Violation = 'X')  THEN
            DataDrive := (OTHERS => 'X');
            FFNeg_zd := 'X';
            EFNeg_zd := 'X';
            XONeg_zd := 'X';
        ELSIF falling_edge(RSNegIn) THEN
            RDPoint := 0;
            WRPoint := 0;
            Count   := 0;
        ELSIF rising_edge(RSNegIn) THEN
            FFNeg_zd := '1';
            XONeg_zd := '1';
            EFNeg_zd := '0';
            IF XINeg_nwv = '0' THEN
                mode := single;
                rd_stat := act;
                wr_stat := act;
            ELSIF FLNeg_nwv = '0' THEN
                mode := first_exp;
                rd_stat := act;
                wr_stat := act;
            ELSE
                mode := other_exp;
                rd_stat := inact;
                wr_stat := inact;
            END IF;
        END IF;

        IF rising_edge(WNegIn) THEN
            IF wr_stat = act AND FFNeg_zd = '1' THEN
                IF Violation = '0' THEN
                    MemData(WRPoint) := To_Nat(DIn);
                ELSE
                    MemData(WRPoint) := -1;
                END IF;
                Count := Count + 1;
                IF WRPoint = TotalLoc THEN
                    WRPoint := 0;
                ELSE
                    WRPoint := WRPoint + 1;
                END IF;
                IF Count > Half AND mode = single THEN
                    XONeg_zd := '0';
                ELSE
                    XONeg_zd := '1';
                END IF;
                IF Count = TotalLoc THEN
                    FFNeg_zd := '0';
                ELSE
                    FFNeg_zd := '1';
                END IF;
                IF EFNeg_zd = '0' AND RNeg_nwv = '0' THEN
                    DataDrive := To_X01(DIn);
                    EF_pzd := '1';
                    Count := Count - 1;
                    RDPoint := RDPoint + 1;
                END IF;
                EFNeg_zd := '1';
            ELSE
                IF mode /= single THEN
                    XONeg_zd := '1';
                END IF;
            END IF;
        ELSIF falling_edge(WNegIn) AND mode /= single AND Count = TotalLoc THEN
            XONeg_zd := '0';
            wr_stat := inact;
        END IF;

        IF falling_edge(RNegIn) AND EFNeg_zd = '1' AND rd_stat = act THEN
            IF Violation = '0' THEN
                IF MemData(RDPoint) >= 0 THEN
                    DataDrive := To_slv(MemData(RDPoint), DataWidth);
                ELSE
                    DataDrive := (OTHERS => 'X');
                END IF;
            ELSE
                MemData(WRPoint) := -1;
            END IF;
            Count := Count - 1;
            IF Count > Half AND mode = single THEN
                XONeg_zd := '0';
            ELSE
                XONeg_zd := '1';
            END IF;
            IF Count = 0 THEN
                EFNeg_zd := '0';
                IF mode = other_exp THEN
                    XONeg_zd := '0';
                END IF;
            ELSE
                EFNeg_zd := '1';
            END IF;
            if (RDPoint = WRPoint-1) or                  -- We must increment RDPoint if it
               (WRPoint=0 and RDPoint=TotalLoc) then     -- is the last element because...
                 IF RDPoint = TotalLoc THEN
                     RDPoint := 0;
                 ELSE
                     RDPoint := RDPoint + 1;
                 END IF;
             end if;

        ELSIF rising_edge(RNegIn) THEN
            IF EFNeg_zd = '1' AND rd_stat = act THEN
                IF FFNeg_zd = '0' AND WNeg_nwv = '0' THEN
                    FF_pzd := '1';
                END IF;
                FFNeg_zd := '1';
                IF RDPoint = TotalLoc THEN
                    RDPoint := 0;
                ELSE
                    RDPoint := RDPoint + 1;
                END if;
            END IF;
                IF mode = other_exp AND Count = 0 THEN
            XONeg_zd := '1';
                rd_stat := inact;
            END IF;
        END IF;

        IF falling_edge(FLNegIn) AND XINeg_nwv = '0' THEN
            RDPoint := 0;
            Count := WRPoint;
            IF Count > Half THEN
                XONeg_zd := '0';
            ELSE
                XONeg_zd := '1';
            END IF;
            IF Count = 0 THEN
                EFNeg_zd := '0';
            ELSE
                EFNeg_zd := '1';
            END IF;
            IF Count = TotalLoc THEN
                FFNeg_zd := '0';
            ELSE
                FFNeg_zd := '1';
            END IF;
        ELSIF falling_edge(XINegIn) AND mode = other_exp THEN
            IF wr_stat = inact THEN
                wr_stat := act;
            ELSE
                rd_stat := act;
            END IF;
        END IF;

        IF rising_edge(EF_pulse) THEN
            EFNeg_zd := '0';
            EF_pulse <= '0';
        ELSIF rising_edge(FF_pulse) THEN
            FFNeg_zd := '0';
            FF_pulse <= '0';
        END IF;

        IF rising_edge(RNegIn) THEN
            DataDrive := (others => 'Z');
        END IF;

        Q_zd <= DataDrive;

        --------------------------------------------------------------------
        -- Path Delay Section
        --------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => EF_pulse,
            OutSignalName   => "EF_pulse",
            OutTemp         => EF_pzd,
            GlitchData      => EFp_GlitchData,
            XOn             => false,
            MsgOn           => false,
            Paths           => (
            0 => (InputChangeTime   => WNeg'LAST_EVENT,
                  PathDelay         => tpd_RNeg_EFNeg,
                  PathCondition     => true)
            )
        );

        VitalPathDelay01 (
            OutSignal       => FF_pulse,
            OutSignalName   => "FF_pulse",
            OutTemp         => FF_pzd,
            GlitchData      => FFp_GlitchData,
            XOn             => false,
            MsgOn           => false,
            Paths           => (
            0 => (InputChangeTime   => RNeg'LAST_EVENT,
                  PathDelay         => tpd_WNeg_FFNeg,
                  PathCondition     => true)
            )
        );

        VitalPathDelay01 (
            OutSignal       => EFNegOut,
            OutSignalName   => "EFNeg",
            OutTemp         => EFNeg_zd,
            GlitchData      => EFNeg_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
            0 => (InputChangeTime   => FLNeg'LAST_EVENT,
                  PathDelay         => tpd_FLNeg_EFNeg,
                  PathCondition     => FLNeg_nwv = '0'),
            1 => (InputChangeTime   => RNeg'LAST_EVENT,
                  PathDelay         => tpd_RNeg_EFNeg,
                  PathCondition     => true),
            2 => (InputChangeTime   => WNeg'LAST_EVENT,
                  PathDelay         => tpd_WNeg_EFNeg,
                  PathCondition     => true),
            3 => (InputChangeTime   => RSNeg'LAST_EVENT,
                  PathDelay         => tpd_RSNeg_EFNeg,
                  PathCondition     => true),
            4 => (InputChangeTime   => EF_pulse'LAST_EVENT,
                  PathDelay         => tpd_RNeg_EFNeg,
                  PathCondition     => true)
            )
        );

        VitalPathDelay01 (
            OutSignal       => FFNegOut,
            OutSignalName   => "FFNeg",
            OutTemp         => FFNeg_zd,
            GlitchData      => FFNeg_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
            0 => (InputChangeTime   => FLNeg'LAST_EVENT,
                  PathDelay         => tpd_FLNeg_EFNeg,
                  PathCondition     => FLNeg_nwv = '0'),
            1 => (InputChangeTime   => RNeg'LAST_EVENT,
                  PathDelay         => tpd_RNeg_FFNeg,
                  PathCondition     => true),
            2 => (InputChangeTime   => WNeg'LAST_EVENT,
                  PathDelay         => tpd_WNeg_FFNeg,
                  PathCondition     => true),
            3 => (InputChangeTime   => RSNeg'LAST_EVENT,
                  PathDelay         => tpd_RSNeg_FFNeg,
                  PathCondition     => true),
            4 => (InputChangeTime   => FF_pulse'LAST_EVENT,
                  PathDelay         => tpd_WNeg_EFNeg,
                  PathCondition     => true)
            )
        );

        VitalPathDelay01 (
            OutSignal       => XONegOut,
            OutSignalName   => "XONeg",
            OutTemp         => XONeg_zd,
            GlitchData      => XONeg_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
            0 => (InputChangeTime   => FLNeg'LAST_EVENT,
                  PathDelay         => tpd_FLNeg_EFNeg,
                  PathCondition     => FLNeg_nwv = '0'),
            1 => (InputChangeTime   => RNeg'LAST_EVENT,
                  PathDelay         => tpd_RNeg_XONeg,
                  PathCondition     => true),
            2 => (InputChangeTime   => WNeg'LAST_EVENT,
                  PathDelay         => tpd_WNeg_XONeg,
                  PathCondition     => true),
            3 => (InputChangeTime   => RSNeg'LAST_EVENT,
                  PathDelay         => tpd_RSNeg_XONeg,
                  PathCondition     => true)
            )
        );

        END PROCESS Fifo;

        ------------------------------------------------------------------------
        -- Path Delay Processes generated as a function of data width
        ------------------------------------------------------------------------
        DataOut_Width : FOR i IN HiDbit DOWNTO 0 GENERATE
            DataOut_Delay : PROCESS (Q_zd(i))
              VARIABLE Q_GlitchData:VitalGlitchDataArrayType(HiDbit Downto 0);
            BEGIN
                VitalPathDelay01Z (
                    OutSignal       => QOut(i),
                    OutSignalName   => "Q",
                    OutTemp         => Q_zd(i),
                    Mode            => VitalTransport,
                    GlitchData      => Q_GlitchData(i),
                    Paths           => (
                        0 => (InputChangeTime => RNegIn'LAST_EVENT,
                              PathDelay       => tpd_RNeg_Q0,
                              PathCondition   => TRUE),
                        1 => (InputChangeTime => WNegIn'LAST_EVENT,
                              PathDelay       => tpd_WNeg_Q0,
                              PathCondition   => TRUE)
                   )
               );
            END PROCESS;
        END GENERATE;

    END BLOCK;
END vhdl_behavioral;
--pragma translate_on

