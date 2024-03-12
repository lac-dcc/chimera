// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef LIB_ASSERTION
`define LIB_ASSERTION


// assertion macro used in tests - is there a built for this??
`ifndef verilator
`define FAIL $finish_and_return(1); 
`else
`define FAIL $finish; 
`endif



`define equals(ACTUAL, EXPECTED, MSG) \
if (ACTUAL !== EXPECTED) \
begin  \
  $display("Line %d: FAILED: actual ACTUAL '%b' is not expected EXPECTED '%b' - %s", `__LINE__, ACTUAL, EXPECTED, MSG); 	\
  `FAIL \
end


/* Format ...
    FAILED Line 82   : expected 'xxxxxxxx'
                     : but got  '00010001'
*/
`define assertEquals(actual, expected_value) \
if (actual !== expected_value) \
begin  \
  $display("%9t ", $time, "FAILED Line %-4d : expected '%b'", `__LINE__, expected_value); 	\
  $display("%9t ", $time, "                 : but got  '%b'", actual); 	\
  `FAIL \
end

/* Format ...
     1122  Line:82    FAILED: actual '00010001' != 'xxxxxxxx' expected,   (d17!=dx)(h11!=hxx)  : rdA_data != B
*/
`ifdef verilator
  `define Equals(ACTUAL, EXPECTED)  $write(""); // noop
`else
`define Equals(ACTUAL, EXPECTED) \
if (ACTUAL !== EXPECTED) begin  \
  $display("%9t ", $time, " Line:%-5d FAILED: actual '%b' != '%b' expected,   (d%1d!=d%1d)(h%2h!=h%2h)  : ACTUAL != EXPECTED", `__LINE__, ACTUAL, EXPECTED, ACTUAL, EXPECTED, ACTUAL, EXPECTED); 	\
  `FAIL \
end
`endif


`ifdef verilator
  `define assertTrue(ACTUAL)  $write(""); // noop
`else
`define assertTrue(ACTUAL) \
if (!(ACTUAL)) begin \
  $display("%9t ", $time, " Line:%-5d FAILED: 'ACTUAL' was not True,   (d%1d)(h%2h) ", `__LINE__, (ACTUAL), (ACTUAL), (ACTUAL)); 	\
  `FAIL \
end
`endif

`ifndef verilator
`define TIMEOUT1(EXPR,TIMEOUT,STR) begin \
   bit timed_out; \
           fork begin \
              fork \
                begin \
                  #(TIMEOUT); \
                  if (!(EXPR)) begin \
                    $display("%9t", $time, " !!! TIMED OUT WAITING FOR EXPR (got %b)", EXPR , "   LINE %1d",  `__LINE__); \
                    timed_out = '1; \
                    $finish_and_return(1); \
                  end \
                end \
             join_none \
             wait(EXPR || timed_out); \
             $display("%9t", $time, "\t EXPR \t\t ", STR); \
             disable fork; \
           end join \
           end

`else
`define TIMEOUT(EXPR,TIMEOUT,STR) $write(""); // noop
`endif



`ifndef verilator
// never returns
`define DOUBLE_CHECK(EXPR,ORIG_TIMOUT, FACTOR, st) begin \
            fork \
              begin \
                  #(ORIG_TIMOUT*FACTOR) \
                  $display("%9t", $time, " !!! TIMED OUT - NEVER MET AFTER HARD TIME OUT %1d FOR EXPR (got %b)", ($time-st), EXPR , "   LINE %1d",  `__LINE__); \
                  $finish_and_return(1); \
              end \
              begin \
                wait(EXPR); \
                if (EXPR) begin \
                  $display("%9t", $time, " !!! TIMED OUT EXPECTING ORIG_TIMOUT (%1d) - BUT CONDITION MET AFTER %1d FOR EXPR (got %b)", (ORIG_TIMOUT), ($time-st), EXPR , "   LINE %1d",  `__LINE__); \
                end \
                $finish_and_return(12); \
              end \
            join_none \
            #(ORIG_TIMOUT*FACTOR) \
            $display("%9t", $time, " !!! TIMED OUT - NEVER MET AFTER HARD TIME OUT %1d FOR EXPR (got %b)", ($time-st), EXPR , "   LINE %1d",  `__LINE__); \
            $finish_and_return(1); \
          end

`else
`define DOUBLE_CHECK(EXPR,TIMEOUT,STR, st) $write(""); // noop
`endif


`ifndef verilator
`define ASSERT_TOOK(EXPR,TIMEOUT) \
        begin \
          bit timed_out; \
          bit ok; \
          time st;\
          time took; \
          st=$time;\
          took=0;\
            begin \
              fork \
                begin \
                  wait(EXPR); \
                  ok = '1; \
                  took = $time-st; \
                  end \
                begin \
                  #(TIMEOUT+1); \
                  timed_out = '1; \
                end \
              join_none \
              wait (timed_out || ok);\
              \
              if (ok && (took < TIMEOUT)) \
              begin \
                $display("%9t", $time, " !!! TOO QUICK FOR EXPR - EXPECTED %1d - BUT TOOK %1d", (TIMEOUT), ($time-st),  "   LINE %1d",  `__LINE__);\
                $finish_and_return(1); \
              end \
              else \
              if (ok && (took == TIMEOUT)) \
              begin \
                $display("%9t", $time, " DELAY OK- TOOK %1d  - EXPR ", ($time-st)); \
              end \
              else \
              if (timed_out == 1) \
              begin \
                `DOUBLE_CHECK(EXPR, TIMEOUT, 10, st) /* HARD LIMIT IIS A MULTIPLE */  \
                $finish_and_return(1); \
              end \
              else \
              begin \
                $display("%9t", $time, " !!! SW ERROR: DIDN'T TIME OUT 'EXPR' BUT DIDN'T SUCCEED EITHER - LINE %1d",  `__LINE__);\
                $finish_and_return(1); \
              end \
              disable fork; \
            end\
        end

`else
`define ASSERT_TOOK(EXPR,TIMEOUT) $write(""); // noop
`endif

`ifndef verilator
`define WAIT(X)  wait(X);
`else
`define WAIT(X)  $write(""); // noop
`endif


`define  ASSERT_LONGER_THAN(ACTUAL, EXPECTED, CHECK) \
  `WAIT(CHECK);\
  if ((ACTUAL) < (EXPECTED)) begin\
    $display("TOO QUICK FOR 'CHECK' - EXPECTED DELAY ns - BUT TOOK %-d     @ line %1d", (ACTUAL), `__LINE__);\
    $finish;\
  end else begin\
    $display("TOOK %-d", (ACTUAL));\
  end


`ifndef verilator
`define FINISH_AND_RETURN(X)  $finish_and_return(X);
`else
`define FINISH_AND_RETURN(X)  $write(""); // noop
`endif

`timescale 1ns/1ns

module dummy;
    initial 
        $write("");
endmodule

`endif 
