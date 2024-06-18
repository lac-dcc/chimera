// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// vc-Assert
//========================================================================

`ifndef CMN_ASSERT_V
`define CMN_ASSERT_V

//------------------------------------------------------------------------
// CMN_PROPAGATE_X
//------------------------------------------------------------------------

`define CMN_PROPAGATE_X(i_, o_)                                        \
  if ((|(i_ ^ i_)) == 1'b0);                                            \
  else                                                                  \
    o_ = o_ + 1'bx

//------------------------------------------------------------------------
// CMN_ASSERT
//------------------------------------------------------------------------

`define CMN_ASSERT(expr_)                                              \
  if ( expr_ );                                                         \
  else begin                                                            \
    $display( "\n CMN_ASSERT FAILED\n  - assertion       :%s\n  - module instance : %m\n  - time            : %0d\n", \
              "expr_", $time );                                         \
    $finish;                                                            \
  end                                                                   \
  if (1)

//------------------------------------------------------------------------
// CMN_ASSERT_FAIL
//------------------------------------------------------------------------

`define CMN_ASSERT_FAIL(msg_)                                         \
  $display( "\n CMN_ASSERT FAILED\n  - assertion       :%s\n  - module instance : %m\n  - time            : %0d\n", \
            msg_, $time );                                             \
  $finish;                                                             \
  if (1)

//------------------------------------------------------------------------
// CMN_ASSERT_NOT_X
//------------------------------------------------------------------------

`define CMN_ASSERT_NOT_X(net_)                                         \
  if ((|(net_ ^ net_)) == 1'b0);                                        \
  else begin                                                            \
    $display( "\n CMN_ASSERT FAILED\n  - assertion that net not contain X's failed\n  - module instance : %m\n  - net             :%s\n  - time            : %0d\n", \
              "net_", $time );                                          \
    $finish;                                                            \
  end                                                                   \
  if (1)

`endif  /* CMN_ASSERT_V */

