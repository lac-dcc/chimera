// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//========================================================================
// Line Tracing
//========================================================================

`ifndef CMN_TRACE_V
`define CMN_TRACE_V

// NOTE: This macro is declared outside of the module to allow some cmn
// modules to see it and use it in their own params. Verilog does not
// allow other modules to hierarchically reference the nbits localparam
// inside this module in constant expressions (e.g., localparams).

`define CMN_TRACE_NCHARS 512
`define CMN_TRACE_NBITS 512*8

module cmn_Trace (
  input logic clk,
  input logic reset
);

  integer len0;
  integer len1;
  integer idx0;
  integer idx1;

  // NOTE: If you change these, then you also need to change the
  // hard-coded constant in the declaration of the trace function at the
  // bottom of this file.
  // NOTE: You would also need to change the CMN_TRACE_NBITS and
  // CMN_TRACE_NCHARS macro at the top of this file.

  localparam nchars = 512;
  localparam nbits = 512 * 8;

  // This is the actual trace storage used when displaying a trace

  logic   [nbits-1:0] storage;

  // Meant to be accesible from outside module

  integer             cycles_next = 0;
  integer             cycles = 0;

  // Get trace level from command line

  logic   [      3:0] level;

`ifndef VERILATOR
  initial begin
    if (!$value$plusargs("trace=%d", level)) begin
      level = 0;
    end
  end
`else
  initial begin
    level = 1;
  end
`endif  // !`ifndef VERILATOR

  // Track cycle count

  always_ff @(posedge clk) begin
    cycles <= (reset) ? 0 : cycles_next;
  end

  //----------------------------------------------------------------------
  // append_str
  //----------------------------------------------------------------------
  // Appends a string to the trace.

  task append_str(inout logic [nbits-1:0] trace, input logic [nbits-1:0] str);
    begin

      len0 = 1;
      while (str[len0*8+:8] != 0) begin
        len0 = len0 + 1;
      end

      idx0 = trace[31:0];

      for (idx1 = len0 - 1; idx1 >= 0; idx1 = idx1 - 1) begin
        trace[idx0*8+:8] = str[idx1*8+:8];
        idx0 = idx0 - 1;
      end

      trace[31:0] = idx0;

    end
  endtask

  //----------------------------------------------------------------------
  // append_str_ljust
  //----------------------------------------------------------------------
  // Appends a left-justified string to the trace.

  task append_str_ljust(inout logic [nbits-1:0] trace, input logic [nbits-1:0] str);
    begin

      idx0 = trace[31:0];
      idx1 = nchars;

      while (str[idx1*8-1-:8] != 0) begin
        trace[idx0*8+:8] = str[idx1*8-1-:8];
        idx0 = idx0 - 1;
        idx1 = idx1 - 1;
      end

      trace[31:0] = idx0;

    end
  endtask

  //----------------------------------------------------------------------
  // append_chars
  //----------------------------------------------------------------------
  // Appends the given number of characters to the trace.

  task append_chars(inout logic [nbits-1:0] trace, input logic [7:0] char, input integer num);
    begin

      idx0 = trace[31:0];

      for (idx1 = 0; idx1 < num; idx1 = idx1 + 1) begin
        trace[idx0*8+:8] = char;
        idx0 = idx0 - 1;
      end

      trace[31:0] = idx0;

    end
  endtask

  //----------------------------------------------------------------------
  // append_val_str
  //----------------------------------------------------------------------
  // Append a string modified by val signal.

  task append_val_str(inout logic [nbits-1:0] trace, input logic val, input logic [nbits-1:0] str);
    begin

      len1 = 0;
      while (str[len1*8+:8] != 0) begin
        len1 = len1 + 1;
      end

      if (val) append_str(trace, str);
      else if (!val) append_chars(trace, " ", len1);
      else begin
        append_str(trace, "x");
        append_chars(trace, " ", len1 - 1);
      end

    end
  endtask

  //----------------------------------------------------------------------
  // val_rdy_str
  //----------------------------------------------------------------------
  // Append a string modified by val/rdy signals.

  task append_val_rdy_str(inout logic [nbits-1:0] trace, input logic val, input logic rdy,
                          input logic [nbits-1:0] str);
    begin

      len1 = 0;
      while (str[len1*8+:8] != 0) begin
        len1 = len1 + 1;
      end

      if (rdy && val) begin
        append_str(trace, str);
      end else if (rdy && !val) begin
        append_chars(trace, " ", len1);
      end else if (!rdy && val) begin
        append_str(trace, "#");
        append_chars(trace, " ", len1 - 1);
      end else if (!rdy && !val) begin
        append_str(trace, ".");
        append_chars(trace, " ", len1 - 1);
      end else begin
        append_str(trace, "x");
        append_chars(trace, " ", len1 - 1);
      end

    end
  endtask

endmodule

//------------------------------------------------------------------------
// CMN_TRACE_NBITS_TO_NCHARS
//------------------------------------------------------------------------
// Macro to determine number of characters for a net

`define CMN_TRACE_NBITS_TO_NCHARS(nbits_) ((nbits_+3)/4)

//------------------------------------------------------------------------
// CMN_TRACE_BEGIN
//------------------------------------------------------------------------

//`define CMN_TRACE_BEGIN                                                  \
//  export "DPI-C" task line_trace;                                       \
//  cmn_Trace cmn_trace(clk,reset);                                         \
//  task line_trace( inout bit [(512*8)-1:0] trace_str );

`ifndef VERILATOR
`define CMN_TRACE_BEGIN                                                  \
  cmn_Trace cmn_trace(clk,reset);                                         \
                                                                        \
  task display_trace;                                                   \
  begin                                                                 \
                                                                        \
    if ( cmn_trace.level > 0 ) begin                                     \
      cmn_trace.storage[15:0] = cmn_trace.nchars-1;                       \
                                                                        \
      line_trace( cmn_trace.storage );                                   \
                                                                        \
      $write( "%4d: ", cmn_trace.cycles );                               \
                                                                        \
      cmn_trace.idx0 = cmn_trace.storage[15:0];                           \
      for ( cmn_trace.idx1 = cmn_trace.nchars-1;                          \
            cmn_trace.idx1 > cmn_trace.idx0;                              \
            cmn_trace.idx1 = cmn_trace.idx1 - 1 )                         \
      begin                                                             \
        $write( "%s", cmn_trace.storage[cmn_trace.idx1*8+:8] );           \
      end                                                               \
      $write("\n");                                                     \
                                                                        \
    end                                                                 \
                                                                        \
    cmn_trace.cycles_next = cmn_trace.cycles + 1;                         \
                                                                        \
  end                                                                   \
  endtask                                                               \
                                                                        \
  task line_trace( inout bit [(512*8)-1:0] trace_str );
`else
`define CMN_TRACE_BEGIN                                                  \
  export "DPI-C" task line_trace;                                       \
  cmn_Trace cmn_trace(clk,reset);                                         \
  task line_trace( inout bit [(512*8)-1:0] trace_str );
`endif

//------------------------------------------------------------------------
// CMN_TRACE_END
//------------------------------------------------------------------------

`define CMN_TRACE_END \
  endtask

`endif  /* CMN_TRACE_V */

