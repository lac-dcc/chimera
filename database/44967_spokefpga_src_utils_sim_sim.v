// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/* Simulation Help defines

   Add by

       `include "[path to lib/sim]/sim.v"

  UPDATE  local_param for this...

  Define Verbose in your file

      `define Output `[OutputLevel]

  For example (Don't forget the ` mark)

      `define Output `OutputInfo

  Somewhere in the module (outside always / initial, etc.) invoke `assertSetup`
  to define the test and error counters

      `AssertSetup

  Make assertions with 'assert'

      `Assert( condition_must_be_true, message_explaining_failure )

  Print progress / info output, which will only display in Info mode

      `Info( ... )

  Print warning output, which will only display in Info or Warning modes

      `Warn( ... )

  Print error output, which will only display in Info or Warning or Error modes

      `Error( ... )

  Running mode complex statements can be achieved with

      `[Level]Do $display( ... )
 */

`define Realtime \
 integer realtime_ns; \
 initial begin \
     realtime_ns = 0; \
     forever begin \
         realtime_ns = realtime_ns + 1; \
         #1; \
     end \
 end

 `define Clock10MHz \
 reg  clock; \
 initial begin \
      forever begin \
        clock = 1; \
        #500 \
        clock = 0; \
        #500 \
        ; \
      end \
 end

 `define Clock50MHz \
 reg  clock_50; \
 initial begin \
      forever begin \
        clock_50 = 1; \
        #50 \
        clock_50 = 0; \
        #50 \
        ; \
      end \
 end

 `define Clock100MHz \
 reg  clock_100; \
 initial begin \
      forever begin \
        clock_100 = 1; \
        #10 \
        clock_100 = 0; \
        #10 \
        ; \
      end \
 end

 `define Clock100kHz \
 reg  clock; \
 initial begin \
      forever begin \
        clock = 1; \
        #5000 \
        clock = 0; \
        #5000 \
        ; \
      end \
 end

`define AssertSetup integer AssertErrorCount = 0; integer AssertTestCount = 0;
`define AssertClear AssertErrorCount = 0; AssertTestCount = 0;
`define Assert(condition, message) begin if(!(condition)) begin AssertErrorCount = AssertErrorCount + 1; $display(`"    Assertion 'condition' Failed. %0s (%s:%0d)`", message, `__FILE__, `__LINE__ );  end AssertTestCount = AssertTestCount + 1; end
`define AssertEqual(val1, val2, message) begin if(val1!=val2) begin AssertErrorCount = AssertErrorCount + 1; $display(`"    Assertion 'val1' %0x == 'val2' %0x Failed. %0s (%s:%0d)`", val1, val2, message, `__FILE__, `__LINE__ );  end AssertTestCount = AssertTestCount + 1; end
`define AssertSummary $display( "    Tests %0d/%0d", AssertTestCount - AssertErrorCount, AssertTestCount );

`define OutputDebug   0
`define OutputInfo    1
`define OutputWarning 2
`define OutputError   3
`define OutputNone    4

`define Debug( m ) if ( Output <= `OutputDebug ) $display( m )
`define Info( m ) if ( Output <= `OutputInfo ) $display( m )
`define Warn( m ) if ( Output <= `OutputWarning ) $display( m )
`define Error( m ) if ( Output <= `OutputError ) $display( m )

`define DebugDo if ( Output <= `OutputDebug )
`define InfoDo if ( Output <= `OutputInfo )
`define WarnDo if ( Output <= `OutputWarning )
`define ErrorDo if ( Output <= `OutputError )
