//**************************************************************************
// Macros for unit tests
//--------------------------------------------------------------------------
// $Id: vcTest.v,v 1.1.1.1 2006/02/17 23:57:17 cbatten Exp $
//
// This file contains various macros to help write unit tests for small
// verilog blocks. Here is a simple example of a test harness for a two 
// input mux.
//
// `include "vcTest.v"
//
// module tester;
//
//  reg clk = 1;
//  always #5 clk = ~clk;
//
//  `VC_TEST_SUITE_BEGIN( "vcMuxes" );
//
//  reg  [31:0] mux2_in0, mux2_in1;  
//  reg         mux2_sel;
//  wire [31:0] mux2_out;
//  
//  vcMux2#(32) mux2( mux2_in0, mux2_in1, mux2_sel, mux2_out );
//
//  `VC_TEST_CASE_BEGIN( 0, "vcMux2" )
//  begin 
//
//    mux2_in0 = 32'h0a0a0a0a;
//    mux2_in1 = 32'hb0b0b0b0;
//
//    mux2_sel = 1'd0; #25;
//    `VC_TEST_EQUAL( "sel == 0", mux2_out, 32'h0a0a0a0a )
//    
//   mux2_sel = 1'd1; #25;
//    `VC_TEST_EQUAL( "sel == 1", mux2_out, 32'hb0b0b0b0 )
//  
//  end
//  `VC_TEST_CASE_END
//
//  `VC_TEST_SUITE_END( 1 )
// endmodule
//
// Note that you need a clk even if you are only testing a combinational
// block since the test infrastructure includes a clocked state element.
// Each of the macros are discussed in more detail below.
//
// By default only checks which fail are displayed. The user can specify
// verbose output using the +verbose=1 command line parameter. When
// verbose output is enabled, all checks are displayed regardless of
// whether or not they pass or fail.

`ifndef VC_TEST
`define VC_TEST

//--------------------------------------------------------------------
// VC_TEST_SUITE_BEGIN( suite-name )
//--------------------------------------------------------------------
// You must include this macro after the clock declaration within the
// tester module. The single parameter should be a quoted string
// indicating the name of the test suite.

`define VC_TEST_SUITE_BEGIN( name ) \
  reg          verbose = 0; \
  reg [1023:0] test_case_num = 0; \
  reg [1023:0] next_test_case_num = 0; \
  initial $value$plusargs( "verbose=%d", verbose ); \
  initial $display(" Entering Test Suite: %s", name ); \
  initial $vcdpluson(0); \
  always @( posedge clk ) test_case_num <= next_test_case_num; \

//--------------------------------------------------------------------
// VC_TEST_SUITE_END( total-num-test-cases )
//--------------------------------------------------------------------
// You must include this macro at the end of the tester module right
// before endmodule. The single parameter should be the number of
// test cases in the suite. Note that a very common mistake is to
// not put the right number here - double check!
                                                                 
`define VC_TEST_SUITE_END( finalnum ) \
  always @(*) if ( test_case_num == finalnum ) begin #25; $display(""); $finish; end \

//--------------------------------------------------------------------
// VC_TEST_CASE_BEGIN( test-case-num, test-case-name )
//--------------------------------------------------------------------
// This should directly proceed a begin-end block which contains the
// actual test case code. The test-case-num must be an increasing
// number and it must be unique. It is very easy to accidently reuse
// a test case number and this will cause multiple test cases to run 
// concurrently jumbling the corresponding output.

`define VC_TEST_CASE_BEGIN( num, name ) \
  always @(*) begin \
    if ( test_case_num == num ) begin \
      $display( "  + Running Test Case: %s", name ); \

//--------------------------------------------------------------------
// VC_TEST_CASE_END
//--------------------------------------------------------------------
// This should directly follow the begin-end block for the test case.
        
`define VC_TEST_CASE_END \
      next_test_case_num = test_case_num + 1; \
    end \
  end 

//--------------------------------------------------------------------
// VC_TEST_CHECK( check-name, test )
//--------------------------------------------------------------------
// This macro is used to check that some condition is true. The name
// is used in the test output. It should be unique to help make it
// easier to debug test failures.

`define VC_TEST_CHECK( name, boolean ) \
   if ( boolean ) \
     begin \
       if ( verbose ) \
         $display( "     [ passed ] Test ( %s ) succeeded ", name ); \
     end \
   else \
     $display( "     [ FAILED ] Test ( %s ) failed", name );

//--------------------------------------------------------------------
// VC_TEST_EQUAL( check-name, arg1, arg2 )
//--------------------------------------------------------------------
// This macro is used to check that arg1 == arg2. The name is used
// in the test output. It should be unique to help make it easier to 
// debug test failures.

`define VC_TEST_EQUAL( name, arg1, arg2 ) \
   if ( arg1 === arg2 ) \
     begin \
       if ( verbose ) \
         if ( (|(arg1 ^ arg1)) == 1'b0) \
            $display( "     [ passed ] Test ( %s ) succeeded, [ %x == %x ] (hex)", name, arg1, arg2 ); \
         else \
            $display( "     [ passed ] Test ( %s ) succeeded, [ %b == %b ] (binary)", name, arg1, arg2 ); \
     end \
   else \
     if ( (|(arg1 ^ arg1)) == 1'b0) \
        $display( "     [ FAILED ] Test ( %s ) failed, [ %x != %x ] (hex)", name, arg1, arg2 ); \
     else \
        $display( "     [ FAILED ] Test ( %s ) failed, [ %b != %b ] (binary)", name, arg1, arg2 );

//--------------------------------------------------------------------
// VC_TEST_NOT_EQUAL( check-name, arg1, arg2 )
//--------------------------------------------------------------------
// This macro is used to check that arg1 != arg2. The name is used
// in the test output. It should be unique to help make it easier to 
// debug test failures.
  
`define VC_TEST_NOT_EQUAL( name, arg1, arg2 ) \
   if ( arg1 != arg2 ) \
     begin \
       if ( verbose ) \
         $display( "     [ passed ] Test ( %s ) succeeded, [ %x != %x ]", name, arg1, arg2 ); \
     end \
   else \
     $display( "     [ FAILED ] Test ( %s ) failed, [ %x == %x ]", name, arg1, arg2 );

`endif
  
