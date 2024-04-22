-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  3-State Diffential Signaling I/O Buffer
-- /___/   /\     Filename : X_IOBUFDS_DIFF_OUT_DCIEN.vhd
-- \   \  /  \    Timestamp :  Thu Apr 29 15:33:49 PDT 2010
--  \___\/\___\
--
-- Revision:
--    04/29/10 - Initial version.
--    03/28/11 - CR 603466 fix
--    05/05/11 - CR 608892 fix
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- Tristate powergating support
--    09/19/11 - CR 625564 -- Fixed Tristate powergating polarity
-- End Revision


----- CELL X_IOBUFDS_DIFF_OUT_DCIEN -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_IOBUFDS_DIFF_OUT_DCIEN is
  generic(
    DIFF_TERM       : string := "FALSE";
    IBUF_LOW_PWR    : string := "TRUE";
    IOSTANDARD      : string := "DEFAULT";
    USE_IBUFDISABLE : string := "TRUE";

    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IO_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IO_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_IOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IOB_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IOB_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tipd_DCITERMDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_DCITERMDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_DCITERMDISABLE_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_DCITERMDISABLE_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_DCITERMDISABLE_IOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_IOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_IBUFDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_IOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_TM : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TM_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TM_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TM_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TM_IOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_TS : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TS_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TS_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TS_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_TS_IOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    PATHPULSE : time := 0 ps
    );

  port(
    O  : out std_ulogic;
    OB : out std_ulogic;

    IO  : inout std_ulogic;
    IOB : inout std_ulogic;

    DCITERMDISABLE : in std_ulogic;
    I           : in std_ulogic;
    IBUFDISABLE : in std_ulogic;
    TM          : in std_ulogic;
    TS          : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IOBUFDS_DIFF_OUT_DCIEN : entity is true;

end X_IOBUFDS_DIFF_OUT_DCIEN;

architecture X_IOBUFDS_DIFF_OUT_DCIEN_V of X_IOBUFDS_DIFF_OUT_DCIEN is

  attribute VITAL_LEVEL0 of
    X_IOBUFDS_DIFF_OUT_DCIEN_V : architecture is true;

  signal IO_ipd             : std_ulogic := 'X';
  signal IOB_ipd            : std_ulogic := 'X';
  signal DCITERMDISABLE_ipd : std_ulogic := 'X';
  signal I_ipd              : std_ulogic := 'X';
  signal IBUFDISABLE_ipd    : std_ulogic := 'X';
  signal TM_ipd             : std_ulogic := 'X';
  signal TS_ipd             : std_ulogic := 'X';




begin

  WireDelay    : block
  begin
    VitalWireDelay (IO_ipd,             IO,             tipd_IO);
    VitalWireDelay (IOB_ipd,            IOB,            tipd_IOB);
    VitalWireDelay (DCITERMDISABLE_ipd, DCITERMDISABLE, tipd_DCITERMDISABLE);
    VitalWireDelay (I_ipd,              I,              tipd_I);
    VitalWireDelay (IBUFDISABLE_ipd,    IBUFDISABLE,    tipd_IBUFDISABLE);
    VitalWireDelay (TM_ipd,             TM,             tipd_TM);
    VitalWireDelay (TS_ipd,             TS,             tipd_TS);
  end block;

  prcs_init             : process
    variable FIRST_TIME : boolean := true;
  begin
     If(FIRST_TIME = true) then

        if((DIFF_TERM = "TRUE") or
           (DIFF_TERM = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
        end if;
     end if;

--
        if((IBUF_LOW_PWR = "TRUE") or
           (IBUF_LOW_PWR = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;

--

        if((USE_IBUFDISABLE = "TRUE") or
           (USE_IBUFDISABLE = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for USE_IBUFDISABLE are TRUE or FALSE"
           severity Failure;
        end if;

--

    wait;
  end process prcs_init;

  prcs_timing : process
     variable O_zd           : std_ulogic;
     variable O_GlitchData   : VitalGlitchDataType;
     variable OB_zd          : std_ulogic;
     variable OB_GlitchData  : VitalGlitchDataType;
     variable IO_zd          : std_ulogic;
     variable IO_GlitchData  : VitalGlitchDataType;
     variable IOB_zd         : std_ulogic;
     variable IOB_GlitchData : VitalGlitchDataType;
     variable T_OR_IBUFDISABLE_1 : std_ulogic := '0';
     variable T_OR_IBUFDISABLE_2 : std_ulogic := '0';
  begin
     if(USE_IBUFDISABLE = "TRUE") then

        T_OR_IBUFDISABLE_1 := IBUFDISABLE_ipd OR (not TM_ipd);
        T_OR_IBUFDISABLE_2 := IBUFDISABLE_ipd OR (not TS_ipd);
-- O
        if(T_OR_IBUFDISABLE_1 = '1') then
            O_zd  := '1';
        elsif(T_OR_IBUFDISABLE_1 = '0') then
           if (IO_zd = 'X' or IOB_zd = 'X' ) then
              O_zd  := 'X';
           elsif (IO_zd /= IOB_zd ) then
             O_zd := TO_X01(IO_zd);
           else
             O_zd  := 'X';
           end if;
        end if;
-- OB
        if(T_OR_IBUFDISABLE_2 = '1') then
            OB_zd := '1';
        elsif(T_OR_IBUFDISABLE_2 = '0') then
           if (IO_zd = 'X' or IOB_zd = 'X' ) then
              OB_zd := 'X';
           elsif (IO_zd /= IOB_zd ) then
             OB_zd := NOT (TO_X01(IO_zd));
           else
             OB_zd := 'X';
           end if;
        end if;
     elsif(USE_IBUFDISABLE = "FALSE") then
        if (IO_zd = 'X' or IOB_zd = 'X' ) then
           O_zd  := 'X';
           OB_zd := 'X';
        elsif (IO_zd /= IOB_zd ) then
          O_zd := TO_X01(IO_zd);
          OB_zd := NOT (TO_X01(IO_zd));
        else
          O_zd  := 'X';
          OB_zd := 'X';
        end if;
     end if;

     if ((TM_ipd = '1') or (TM_ipd= 'H')) then
       IO_zd := 'Z';
     elsif ((TM_ipd = '0') or (TM_ipd = 'L')) then
       if ((I_ipd = '1') or (I_ipd = 'H')) then
         IO_zd := '1';
       elsif ((I_ipd = '0') or (I_ipd = 'L')) then
         IO_zd := '0';
       elsif (I_ipd = 'U') then
         IO_zd := 'U';
       else
         IO_zd := 'X';
       end if;
     elsif (TM_ipd = 'U') then
       IO_zd := 'U';
     else
       IO_zd := 'X';
     end if;

     if ((TS_ipd = '1') or (TS_ipd = 'H')) then
       IOB_zd := 'Z';
     elsif ((TS_ipd = '0') or (TS_ipd = 'L')) then
       if (((not I_ipd) = '1') or ((not I_ipd) = 'H')) then
         IOB_zd := '1';
       elsif (((not I_ipd) = '0') or ((not I_ipd) = 'L')) then
         IOB_zd := '0';
       elsif ((not I_ipd) = 'U') then
         IOB_zd := 'U';
       else
         IOB_zd := 'X';
       end if;
     elsif (TS_ipd = 'U') then
       IOB_zd := 'U';
     else
       IOB_zd := 'X';
     end if;

     VitalPathDelay01 (
       OutSignal     => O,
       GlitchData    => O_GlitchData,
       OutSignalName => "O",
       OutTemp       => O_zd,
       Paths         => (0 => (DCITERMDISABLE_ipd'last_event, tpd_DCITERMDISABLE_O, true),
                         1 => (I_ipd'last_event,              tpd_I_O,              true),
                         2 => (IBUFDISABLE_ipd'last_event,    tpd_IBUFDISABLE_O,    true),
                         3 => (IO_ipd'last_event,             tpd_IO_O,             true),
                         4 => (IOB_ipd'last_event,            tpd_IOB_O,            true),
                         5 => (TM_ipd'last_event,             tpd_TM_O,             true),
                         6 => (TS_ipd'last_event,             tpd_TS_O,             true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);

     VitalPathDelay01 (
       OutSignal     => OB,
       GlitchData    => OB_GlitchData,
       OutSignalName => "OB",
       OutTemp       => OB_zd,
       Paths         => (0 => (DCITERMDISABLE_ipd'last_event, tpd_DCITERMDISABLE_OB, true),
                         1 => (I_ipd'last_event,              tpd_I_OB,              true),
                         2 => (IBUFDISABLE_ipd'last_event,    tpd_IBUFDISABLE_OB,    true),
                         3 => (IO_ipd'last_event,             tpd_IO_OB,             true),
                         4 => (IOB_ipd'last_event,            tpd_IOB_OB,            true),
                         5 => (TM_ipd'last_event,             tpd_TM_OB,             true),
                         6 => (TS_ipd'last_event,             tpd_TS_OB,             true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);

     VitalPathDelay01 (
       OutSignal     => IO,
       GlitchData    => IO_GlitchData,
       OutSignalName => "IO",
       OutTemp       => IO_zd,
       Paths         => (0 => (DCITERMDISABLE_ipd'last_event, tpd_DCITERMDISABLE_IO, true),
                         1 => (I_ipd'last_event,              tpd_I_IO,              true),
                         2 => (IBUFDISABLE_ipd'last_event,    tpd_IBUFDISABLE_IO,    true),
                         3 => (TM_ipd'last_event,             tpd_TM_IO,             true),
                         4 => (TS_ipd'last_event,             tpd_TS_IO,             true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);

     VitalPathDelay01 (
       OutSignal     => IOB,
       GlitchData    => IOB_GlitchData,
       OutSignalName => "IOB",
       OutTemp       => IOB_zd,
       Paths         => (0 => (DCITERMDISABLE_ipd'last_event, tpd_DCITERMDISABLE_IOB, true),
                         1 => (I_ipd'last_event,              tpd_I_IOB,              true),
                         2 => (IBUFDISABLE_ipd'last_event,    tpd_IBUFDISABLE_IOB,    true),
                         3 => (TM_ipd'last_event,             tpd_TM_IOB,             true),
                         4 => (TS_ipd'last_event,             tpd_TS_IOB,             true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);


     wait on DCITERMDISABLE_ipd, I_ipd, IBUFDISABLE_ipd, IO_ipd, IOB_ipd, TM_ipd, TS_ipd;
  end process;

end X_IOBUFDS_DIFF_OUT_DCIEN_V;
