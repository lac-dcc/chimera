LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
LIBRARY IEEE;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;

package prim is

CONSTANT DefCombSpikeMsgOn : BOOLEAN := true;
CONSTANT DefCombSpikeXOn   : BOOLEAN := true;
CONSTANT DefSeqMsgOn       : BOOLEAN := true;
CONSTANT DefSeqXOn         : BOOLEAN := true;

CONSTANT DefDummyDelay    : VitalDelayType := 1.00 ns;
CONSTANT DefDummySetup    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyHold     : VitalDelayType := 1.00 ns;
CONSTANT DefDummyWidth    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRecovery : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRemoval  : VitalDelayType := 1.00 ns;
CONSTANT DefDummyIpd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIsd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIcd      : VitalDelayType := 0.00 ns;

CONSTANT udp_dff : VitalStateTableType (1 TO 21, 1 TO 7) := (
--    NOTIFIER   D      CLK     RN       S      Q(t)   Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '/',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '/',    '0',    '-',    '-',    '1'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '\',   '-',    '-',    '-',    'S'  ),
     (  '-',    '*',    'B',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'B',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    'X',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    'B',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    'X',    '*',    '0',    '0',    '0'  ),
     (  '-',    'B',    'r',    '-',    '-',    '-',    'X'  ),
     (  '-',    '/',    'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    'f',    '-',    '-',    '-',    'X'  ),
     (  '-',    '\',   'X',    '0',    '-',    '-',    'X'  ),
     (  '-',    'B',    'X',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ));

CONSTANT udp_tlat : VitalStateTableType (1 TO 20, 1 TO 7) := (
--      NOT      D       G       R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '1',    '1',    '0',    '-',    '-',    '1'  ),
     (  '-',    '0',    '1',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '*',    '0',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    '0',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    '0',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '1',    '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    'B',    'r',    '0',    '0',    '-',    'X'  ),
     (  '-',    'B',    'X',    '0',    '0',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ) );

CONSTANT udp_rslat : VitalStateTableType (1 TO 12, 1 TO 5) := (
--      NOT      R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '-',    '-',    'S'  ),
     (  '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '*',    '-',    'X'  ) );


end prim;

package body prim is

end prim;
LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AND2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0636704 ns, 0.0761281 ns);
             tpd_B_Y : VitalDelayType01 := (0.0652152 ns, 0.0863419 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AND2X1 : entity is TRUE;
end AND2X1;

architecture behavioral of AND2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalAND2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AND2X2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0791513 ns, 0.0939065 ns);
             tpd_B_Y : VitalDelayType01 := (0.0815593 ns, 0.103564 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AND2X2 : entity is TRUE;
end AND2X2;

architecture behavioral of AND2X2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalAND2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AOI21X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.064718 ns, 0.0479146 ns);
             tpd_B_Y : VitalDelayType01 := (0.0550765 ns, 0.0494917 ns);
             tpd_C_Y : VitalDelayType01 := (0.0475288 ns, 0.0409266 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AOI21X1 : entity is TRUE;
end AOI21X1;

architecture behavioral of AOI21X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AOI22X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0770328 ns, 0.0595585 ns);
             tpd_B_Y : VitalDelayType01 := (0.069362 ns, 0.0604989 ns);
             tpd_C_Y : VitalDelayType01 := (0.0635452 ns, 0.0431164 ns);
             tpd_D_Y : VitalDelayType01 := (0.0551325 ns, 0.0427357 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AOI22X1 : entity is TRUE;
end AOI22X1;

architecture behavioral of AOI22X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(C_ipd, D_ipd);
          n2_var := VitalOR2(n0_var, n1_var);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity BUFX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.080192 ns, 0.0899936 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of BUFX2 : entity is TRUE;
end BUFX2;

architecture behavioral of BUFX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity BUFX4 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0944772 ns, 0.0966568 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of BUFX4 : entity is TRUE;
end BUFX4;

architecture behavioral of BUFX4 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUF1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.168143 ns, 0.171898 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUF1 : entity is TRUE;
end CLKBUF1;

architecture behavioral of CLKBUF1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUF2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.231101 ns, 0.237151 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUF2 : entity is TRUE;
end CLKBUF2;

architecture behavioral of CLKBUF2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUF3 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.294709 ns, 0.301525 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUF3 : entity is TRUE;
end CLKBUF3;

architecture behavioral of CLKBUF3 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFNEGX1 is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tsetup_D_CLK_posedge_negedge : VitalDelayType := 0.1875 ns;
             tsetup_D_CLK_negedge_negedge : VitalDelayType := 0.1875 ns;
             thold_D_CLK_posedge_negedge : VitalDelayType := 0.0000000622538 ns;
             thold_D_CLK_negedge_negedge : VitalDelayType := 0.0000000606271 ns;
             tpw_CLK_posedge : VitalDelayType := 0.0939412 ns;
             tpw_CLK_negedge : VitalDelayType := 0.104504 ns;
             tpd_CLK_Q : VitalDelayType01 := (0.127171 ns, 0.12194 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFNEGX1 : entity is TRUE;
end DFFNEGX1;

architecture behavioral of DFFNEGX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CLK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE DS0000 : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_negedge,
                    SetupLow       => tsetup_D_CLK_negedge_negedge,
                    HoldHigh       => thold_D_CLK_negedge_negedge,
                    HoldLow        => thold_D_CLK_posedge_negedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/DFFNEGX1",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => tpw_CLK_negedge,
                    PeriodData     => PeriodCheckInfo_CLK,
                    Violation      => PWviol_CLK,
                    HeaderMsg      => InstancePath & "/DFFNEGX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CLK OR
                        PWviol_CLK );

          intclk := VitalINV(CLK_dly);

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly, intclk, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          DS0000 := n0_vec(1);

          P0002 := VitalINV(DS0000);

          Q_zd := VitalBUF(DS0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFPOSX1 is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tsetup_D_CLK_posedge_posedge : VitalDelayType := 0.1875 ns;
             tsetup_D_CLK_negedge_posedge : VitalDelayType := 0.1875 ns;
             thold_D_CLK_posedge_posedge : VitalDelayType := 0.0000000596047 ns;
             thold_D_CLK_negedge_posedge : VitalDelayType := -0.0937499 ns;
             tpw_CLK_posedge : VitalDelayType := 0.106969 ns;
             tpw_CLK_negedge : VitalDelayType := 0.09927 ns;
             tpd_CLK_Q : VitalDelayType01 := (0.0935262 ns, 0.159821 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFPOSX1 : entity is TRUE;
end DFFPOSX1;

architecture behavioral of DFFPOSX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CLK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE DS0000 : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_posedge,
                    SetupLow       => tsetup_D_CLK_negedge_posedge,
                    HoldHigh       => thold_D_CLK_negedge_posedge,
                    HoldLow        => thold_D_CLK_posedge_posedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFPOSX1",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => tpw_CLK_negedge,
                    PeriodData     => PeriodCheckInfo_CLK,
                    Violation      => PWviol_CLK,
                    HeaderMsg      => InstancePath & "/DFFPOSX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CLK OR
                        PWviol_CLK );

          intclk := VitalBUF(CLK_dly);

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly, intclk, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          DS0000 := n0_vec(1);

          P0002 := VitalINV(DS0000);

          Q_zd := VitalBUF(DS0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFSR is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tipd_R : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_R_CLK : VitalDelayType := DefDummyIsd;
             tipd_S : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_S_CLK : VitalDelayType := DefDummyIsd;
             trecovery_R_CLK_posedge_posedge : VitalDelayType := -0.0937499 ns;
             tremoval_R_CLK_posedge_posedge : VitalDelayType := 0.1875 ns;
             trecovery_R_S_posedge_posedge : VitalDelayType := 0.0000000596047 ns;
             trecovery_S_CLK_posedge_posedge : VitalDelayType := 0 ns;
             tremoval_S_CLK_posedge_posedge : VitalDelayType := 0.0937499 ns;
             trecovery_S_R_posedge_posedge : VitalDelayType := 0.0937499 ns;
             tsetup_D_CLK_posedge_posedge : VitalDelayType := 0.0937499 ns;
             tsetup_D_CLK_negedge_posedge : VitalDelayType := 0.0937499 ns;
             thold_D_CLK_posedge_posedge : VitalDelayType := 0.0000000596047 ns;
             thold_D_CLK_negedge_posedge : VitalDelayType := 0.000000057978 ns;
             tpw_S_negedge : VitalDelayType := 0.199049 ns;
             tpw_R_negedge : VitalDelayType := 0.152176 ns;
             tpw_CLK_posedge : VitalDelayType := 0.283301 ns;
             tpw_CLK_negedge : VitalDelayType := 0.205581 ns;
             tremoval_R_S_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tremoval_S_R_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tpd_CLK_Q : VitalDelayType01 := (0.387715 ns, 0.381095 ns);
             tpd_R_Q : VitalDelayType01 := (0.255245 ns, 0.262875 ns);
             tpd_S_Q : VitalDelayType01 := (0.344773 ns, 0 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         R : in std_ulogic := 'U' ;
         S : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFSR : entity is TRUE;
end DFFSR;

architecture behavioral of DFFSR is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';
   SIGNAL R_dly : std_ulogic := 'X';
   SIGNAL R_ipd : std_ulogic := 'X';
   SIGNAL S_dly : std_ulogic := 'X';
   SIGNAL S_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
   VitalWireDelay( R_ipd, R, tipd_R );
   VitalWireDelay( S_ipd, S, tipd_S );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
   VitalSignalDelay( R_dly, R_ipd, tisd_R_CLK );
   VitalSignalDelay( S_dly, S_ipd, tisd_S_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly, R_dly, S_dly)

      --timing checks section variables
      VARIABLE Tviol_rec_S_R_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_S_R_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CLK_R_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CLK_R_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_R_S_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_R_S_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CLK_S_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CLK_S_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_R_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_R_negedge : VitalPeriodDataType;
      VARIABLE PWviol_S_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_S_negedge : VitalPeriodDataType;
      VARIABLE PWviol_CLK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_CLEAR : std_ulogic;
      VARIABLE n0_SET : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE P0003 : std_ulogic;
      VARIABLE D_dly_t : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE n1_cond : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE n2_cond : std_ulogic;
      VARIABLE n4_cond : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalRecoveryRemovalCheck (
                    TestSignal     => R_dly,
                    TestSignalName => "R",
                    RefSignal      => S_dly,
                    RefSignalName  => "S",
                    Recovery       => trecovery_R_S_posedge_posedge,
                    Removal        => tremoval_R_S_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_S_R_posedge,
                    Violation      => Tviol_rec_S_R_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => R_dly,
                    TestSignalName => "R",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    Recovery       => trecovery_R_CLK_posedge_posedge,
                    Removal        => tremoval_R_CLK_posedge_posedge,
                    CheckEnabled   => To_X01(n1_cond) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_CLK_R_posedge,
                    Violation      => Tviol_rec_CLK_R_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => S_dly,
                    TestSignalName => "S",
                    RefSignal      => R_dly,
                    RefSignalName  => "R",
                    Recovery       => trecovery_S_R_posedge_posedge,
                    Removal        => tremoval_S_R_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_R_S_posedge,
                    Violation      => Tviol_rec_R_S_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => S_dly,
                    TestSignalName => "S",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    Recovery       => trecovery_S_CLK_posedge_posedge,
                    Removal        => tremoval_S_CLK_posedge_posedge,
                    CheckEnabled   => To_X01(n2_cond) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_CLK_S_posedge,
                    Violation      => Tviol_rec_CLK_S_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_posedge,
                    SetupLow       => tsetup_D_CLK_negedge_posedge,
                    HoldHigh       => thold_D_CLK_negedge_posedge,
                    HoldLow        => thold_D_CLK_posedge_posedge,
                    CheckEnabled   => To_X01(n4_cond) /= '0',
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => R_dly,
                    TestSignalName => "R",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_R_negedge,
                    PeriodData     => PeriodCheckInfo_R_negedge,
                    Violation      => PWviol_R_negedge,
                    HeaderMsg      => InstancePath & "/DFFSR",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => S_dly,
                    TestSignalName => "S",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_S_negedge,
                    PeriodData     => PeriodCheckInfo_S_negedge,
                    Violation      => PWviol_S_negedge,
                    HeaderMsg      => InstancePath & "/DFFSR",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => tpw_CLK_negedge,
                    PeriodData     => PeriodCheckInfo_CLK,
                    Violation      => PWviol_CLK,
                    HeaderMsg      => InstancePath & "/DFFSR",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_rec_S_R_posedge OR
                        Tviol_rec_CLK_R_posedge OR
                        Tviol_rec_R_S_posedge OR
                        Tviol_rec_CLK_S_posedge OR
                        Tviol_D_CLK OR
                        PWviol_R_negedge OR
                        PWviol_S_negedge OR
                        PWviol_CLK );

          intclk := VitalBUF(CLK_dly);

          n0_CLEAR := VitalINV(R_dly);

          n0_SET := VitalINV(S_dly);

          D_dly_t := VitalINV(D_dly);

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly_t, intclk, n0_SET, n0_CLEAR),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          P0003 := n0_vec(1);

          P0002 := VitalINV(P0003);

          Q_zd := VitalBUF(P0002);

          n1_cond := VitalAND2(D_dly, S_dly);

          n3_var := VitalINV(D_dly);
          n2_cond := VitalAND2(n3_var, R_dly);

          n4_cond := VitalAND2(S_dly, R_dly);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE),
                      1 => ( R_dly'LAST_EVENT,
                             tpd_R_Q,
                             TRUE),
                      2 => ( S_dly'LAST_EVENT,
                             tpd_S_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity FAX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_YC : VitalDelayType01 := (0.110961 ns, 0.133895 ns);
             tpd_A_YS : VitalDelayType01 := (0.198183 ns, 0.179906 ns);
             tpd_B_YC : VitalDelayType01 := (0.11476 ns, 0.134739 ns);
             tpd_B_YS : VitalDelayType01 := (0.202117 ns, 0.185393 ns);
             tpd_C_YC : VitalDelayType01 := (0.109702 ns, 0.121862 ns);
             tpd_C_YS : VitalDelayType01 := (0.198886 ns, 0.182744 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         YC : out std_ulogic ;
         YS : out std_ulogic);

   attribute VITAL_LEVEL0 of FAX1 : entity is TRUE;
end FAX1;

architecture behavioral of FAX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE YC_zd : std_ulogic;
      VARIABLE n4_var : std_ulogic;
      VARIABLE YS_zd : std_ulogic;

      -- path delay section variables
      VARIABLE YC_GlitchData : VitalGlitchDataType;
      VARIABLE YS_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(B_ipd, C_ipd);
          n2_var := VitalOR2(n0_var, n1_var);
          n3_var := VitalAND2(C_ipd, A_ipd);
          YC_zd := VitalOR2(n2_var, n3_var);

          n4_var := VitalXOR2(A_ipd, B_ipd);
          YS_zd := VitalXOR2(n4_var, C_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => YC,
               OutSignalName => "YC",
               OutTemp => YC_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YC,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YC,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_YC,
                             TRUE)),
               GlitchData => YC_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => YS,
               OutSignalName => "YS",
               OutTemp => YS_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YS,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YS,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_YS,
                             TRUE)),
               GlitchData => YS_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity HAX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_YC : VitalDelayType01 := (0.0853582 ns, 0.108843 ns);
             tpd_A_YS : VitalDelayType01 := (0.149058 ns, 0.152679 ns);
             tpd_B_YC : VitalDelayType01 := (0.0832229 ns, 0.0971359 ns);
             tpd_B_YS : VitalDelayType01 := (0.142672 ns, 0.148831 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         YC : out std_ulogic ;
         YS : out std_ulogic);

   attribute VITAL_LEVEL0 of HAX1 : entity is TRUE;
end HAX1;

architecture behavioral of HAX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE YC_zd : std_ulogic;
      VARIABLE YS_zd : std_ulogic;

      -- path delay section variables
      VARIABLE YC_GlitchData : VitalGlitchDataType;
      VARIABLE YS_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          YC_zd := VitalAND2(A_ipd, B_ipd);

          YS_zd := VitalXOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => YC,
               OutSignalName => "YC",
               OutTemp => YC_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YC,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YC,
                             TRUE)),
               GlitchData => YC_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => YS,
               OutSignalName => "YS",
               OutTemp => YS_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YS,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YS,
                             TRUE)),
               GlitchData => YS_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0376394 ns, 0.0309057 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX1 : entity is TRUE;
end INVX1;

architecture behavioral of INVX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0380511 ns, 0.032632 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX2 : entity is TRUE;
end INVX2;

architecture behavioral of INVX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX4 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0380511 ns, 0.032632 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX4 : entity is TRUE;
end INVX4;

architecture behavioral of INVX4 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX8 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0380511 ns, 0.032632 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX8 : entity is TRUE;
end INVX8;

architecture behavioral of INVX8 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity LATCH is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tsetup_D_CLK_posedge_negedge : VitalDelayType := 0.1875 ns;
             tsetup_D_CLK_negedge_negedge : VitalDelayType := 0.1875 ns;
             thold_D_CLK_posedge_negedge : VitalDelayType := -0.0937499 ns;
             thold_D_CLK_negedge_negedge : VitalDelayType := -0.0937499 ns;
             tpw_CLK_posedge : VitalDelayType := 0.149322 ns;
             tpd_CLK_Q : VitalDelayType01 := (0.18909 ns, 0.246125 ns);
             tpd_D_Q : VitalDelayType01 := (0.210937 ns, 0.244037 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of LATCH : entity is TRUE;
end LATCH;

architecture behavioral of LATCH is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CLK_posedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK_posedge : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE DS0000 : std_ulogic;
      VARIABLE P0000 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_tlat_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_negedge,
                    SetupLow       => tsetup_D_CLK_negedge_negedge,
                    HoldHigh       => thold_D_CLK_negedge_negedge,
                    HoldLow        => thold_D_CLK_posedge_negedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/LATCH",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => 0 ns,
                    PeriodData     => PeriodCheckInfo_CLK_posedge,
                    Violation      => PWviol_CLK_posedge,
                    HeaderMsg      => InstancePath & "/LATCH",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CLK OR
                        PWviol_CLK_posedge );

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_tlat,
                                DataIn => (NOTIFIER, D_dly, CLK_dly, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_tlat_n0 );

          DS0000 := n0_vec(1);

          P0000 := VitalINV(DS0000);

          Q_zd := VitalBUF(DS0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE),
                      1 => ( D_dly'LAST_EVENT,
                             tpd_D_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity MUX2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_S : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0723509 ns, 0.0498406 ns);
             tpd_B_Y : VitalDelayType01 := (0.0660151 ns, 0.0546619 ns);
             tpd_S_Y : VitalDelayType01 := (0.100427 ns, 0.0994576 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         S : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of MUX2X1 : entity is TRUE;
end MUX2X1;

architecture behavioral of MUX2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL S_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( S_ipd, S, tipd_S );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, S_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalMUX2(A_ipd, B_ipd, S_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( S_ipd'LAST_EVENT,
                             tpd_S_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0538273 ns, 0.0328488 ns);
             tpd_B_Y : VitalDelayType01 := (0.0457927 ns, 0.0307216 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND2X1 : entity is TRUE;
end NAND2X1;

architecture behavioral of NAND2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND3X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0769998 ns, 0.0411603 ns);
             tpd_B_Y : VitalDelayType01 := (0.0661183 ns, 0.0388225 ns);
             tpd_C_Y : VitalDelayType01 := (0.0515211 ns, 0.0326033 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND3X1 : entity is TRUE;
end NAND3X1;

architecture behavioral of NAND3X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0487569 ns, 0.0520235 ns);
             tpd_B_Y : VitalDelayType01 := (0.0440514 ns, 0.0384013 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR2X1 : entity is TRUE;
end NOR2X1;

architecture behavioral of NOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR3X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0699091 ns, 0.0768709 ns);
             tpd_B_Y : VitalDelayType01 := (0.0646551 ns, 0.0688493 ns);
             tpd_C_Y : VitalDelayType01 := (0.0480378 ns, 0.0492526 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR3X1 : entity is TRUE;
end NOR3X1;

architecture behavioral of NOR3X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI21X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0663602 ns, 0.0503249 ns);
             tpd_B_Y : VitalDelayType01 := (0.0613772 ns, 0.0403731 ns);
             tpd_C_Y : VitalDelayType01 := (0.0486617 ns, 0.0376244 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI21X1 : entity is TRUE;
end OAI21X1;

architecture behavioral of OAI21X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalAND2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI22X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0777333 ns, 0.0601595 ns);
             tpd_B_Y : VitalDelayType01 := (0.0732466 ns, 0.0515101 ns);
             tpd_C_Y : VitalDelayType01 := (0.0594492 ns, 0.0539796 ns);
             tpd_D_Y : VitalDelayType01 := (0.0554435 ns, 0.04673 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI22X1 : entity is TRUE;
end OAI22X1;

architecture behavioral of OAI22X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(C_ipd, D_ipd);
          n2_var := VitalAND2(n0_var, n1_var);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0740876 ns, 0.0760981 ns);
             tpd_B_Y : VitalDelayType01 := (0.0862337 ns, 0.0805478 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OR2X1 : entity is TRUE;
end OR2X1;

architecture behavioral of OR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OR2X2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0927483 ns, 0.0943953 ns);
             tpd_B_Y : VitalDelayType01 := (0.100325 ns, 0.0991908 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OR2X2 : entity is TRUE;
end OR2X2;

architecture behavioral of OR2X2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_EN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0622706 ns, 0.0431759 ns);
             tpd_EN_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0444167 ns, 0.0643139 ns, 0.0589076 ns, 0.0210639 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         EN : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX1 : entity is TRUE;
end TBUFX1;

architecture behavioral of TBUFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL EN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( EN_ipd, EN, tipd_EN );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, EN_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalINV(A_ipd);
          Y_zd := VitalBUFIF1(n0_var, EN_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( EN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_EN_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_EN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0624696 ns, 0.04457 ns);
             tpd_EN_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0444167 ns, 0.0665881 ns, 0.0597342 ns, 0.0213535 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         EN : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX2 : entity is TRUE;
end TBUFX2;

architecture behavioral of TBUFX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL EN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( EN_ipd, EN, tipd_EN );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, EN_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalINV(A_ipd);
          Y_zd := VitalBUFIF1(n0_var, EN_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( EN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_EN_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity XNOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0845444 ns, 0.0805984 ns);
             tpd_B_Y : VitalDelayType01 := (0.10043 ns, 0.0888509 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of XNOR2X1 : entity is TRUE;
end XNOR2X1;

architecture behavioral of XNOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalXOR2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity XOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0846684 ns, 0.0802167 ns);
             tpd_B_Y : VitalDelayType01 := (0.0958559 ns, 0.0908635 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of XOR2X1 : entity is TRUE;
end XOR2X1;

architecture behavioral of XOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalXOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


