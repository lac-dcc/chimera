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
-- /___/   /\     Filename : X_IOBUF_DCIEN.vhd
-- \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
--  \___\/\___\
--
-- Revision:
--    12/08/10 - Initial version.
--    03/28/11 - CR 603466 fix
--    05/05/11 - CR 608892 fix
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- Tristate powergating support
--    09/19/11 - CR 625564 -- Fixed Tristate powergating polarity
-- End Revision


----- CELL X_IOBUF_DCIEN -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_IOBUF_DCIEN is
  generic(
    DIFF_TERM    : string := "FALSE";
    IBUF_LOW_PWR : string := "TRUE";
    IOSTANDARD   : string := "DEFAULT";
    USE_IBUFDISABLE : string := "TRUE";

    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IO_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tipd_DCITERMDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_DCITERMDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_DCITERMDISABLE_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_IBUFDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_T  : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_T_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_T_IO : VitalDelayType01 := (0.000 ns, 0.000 ns);
    PATHPULSE : time := 0 ps
    );

  port(
    O  : out std_ulogic;

    IO  : inout std_ulogic;
    DCITERMDISABLE : in std_ulogic;
    I           : in std_ulogic;
    IBUFDISABLE : in std_ulogic;
    T           : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IOBUF_DCIEN : entity is true;

end X_IOBUF_DCIEN;

architecture X_IOBUF_DCIEN_V of X_IOBUF_DCIEN is

  attribute VITAL_LEVEL0 of
    X_IOBUF_DCIEN_V : architecture is true;

  signal IO_ipd             : std_ulogic := 'X';
  signal DCITERMDISABLE_ipd : std_ulogic := 'X';
  signal I_ipd              : std_ulogic := 'X';
  signal IBUFDISABLE_ipd    : std_ulogic := 'X';
  signal T_ipd              : std_ulogic := 'X';


begin

  WireDelay    : block
  begin
    VitalWireDelay (IO_ipd,             IO,             tipd_IO);
    VitalWireDelay (DCITERMDISABLE_ipd, DCITERMDISABLE, tipd_DCITERMDISABLE);
    VitalWireDelay (I_ipd,              I,              tipd_I);
    VitalWireDelay (IBUFDISABLE_ipd,    IBUFDISABLE,    tipd_IBUFDISABLE);
    VitalWireDelay (T_ipd,              T,              tipd_T);
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
        if((IBUF_LOW_PWR = "TRUE") or
           (IBUF_LOW_PWR = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;

--

    wait;
  end process prcs_init;

  prcs_timing : process
     variable O_zd           : std_ulogic;
     variable O_GlitchData   : VitalGlitchDataType;
     variable IO_zd          : std_ulogic;
     variable IO_GlitchData  : VitalGlitchDataType;
     variable T_OR_IBUFDISABLE   : std_ulogic := '0';
  begin
    if(USE_IBUFDISABLE = "TRUE") then

       T_OR_IBUFDISABLE := IBUFDISABLE_ipd OR (not T_ipd);

       if(T_OR_IBUFDISABLE = '1') then
          O_zd  := '1';
       elsif (T_OR_IBUFDISABLE = '0') then
          O_zd  := TO_X01(IO_zd);
       end if;
    elsif(USE_IBUFDISABLE = "FALSE") then
          O_zd  := TO_X01(IO_zd);
    end if;

    if ((T_ipd = '1') or (T_ipd = 'H')) then
      IO_zd := 'Z';
    elsif ((T_ipd = '0') or (T_ipd = 'L')) then
      if ((I_ipd = '1') or (I_ipd = 'H')) then
        IO_zd := '1';
      elsif ((I_ipd = '0') or (I_ipd = 'L')) then
        IO_zd := '0';
      elsif (I_ipd = 'U') then
        IO_zd := 'U';
      else
        IO_zd := 'X';
      end if;
    elsif (T_ipd = 'U') then
      IO_zd := 'U';
    else
      IO_zd := 'X';
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
                         4 => (T_ipd'last_event,              tpd_T_O,              true)),
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
                         3 => (T_ipd'last_event,              tpd_T_IO,              true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);


     wait on DCITERMDISABLE_ipd, I_ipd, IBUFDISABLE_ipd, IO_ipd, T_ipd;
  end process;

end X_IOBUF_DCIEN_V;
