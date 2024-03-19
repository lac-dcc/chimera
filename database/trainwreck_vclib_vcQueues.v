//**************************************************************************
// Verilog Components: Queues
//--------------------------------------------------------------------------
// $Id: vcQueues.v,v 1.1.1.1 2006/02/17 23:57:17 cbatten Exp $
//

`ifndef VC_QUEUES_V
`define VC_QUEUES_V

`define VC_QUEUE_NORMAL   0
`define VC_QUEUE_PIPE     1
`define VC_QUEUE_FLOW     2
`define VC_QUEUE_PIPEFLOW 3

`endif

//--------------------------------------------------------------------------
// Single-Element Queue Control Logic
//--------------------------------------------------------------------------
// This is the control logic for a single-elment queue. It is designed
// to be attached to a storage element with a write enable. Additionally,
// it includes the ability to statically enable pipeline and/or flowthrough
// behavior. Pipeline behavior is when the deq_rdy signal is combinationally
// wired to the enq_rdy signal allowing elements to be dequeued and enqueued
// in the same cycle when the queue is full. Flowthrough behavior is when
// the enq_val signal is cominationally wired to the deq_val signal allowing
// elements to bypass the storage element if the storage element is empty.

module vcQueueCtrl1_simple
(
  input  clk, reset,
  input  enq_val,   // Enqueue data is valid
  output enq_rdy,   // Ready for sender to do an enqueue
  output deq_val,   // Dequeue data is valid
  input  deq_rdy,   // Receiver is ready to do a dequeue
  output wen        // Write enable signal to wire up to storage element
);

  // Status register

  reg  full;
  wire full_next;

  always @(posedge clk)
    if (reset)
      full <= 1'b0;
    else
      full <= full_next;

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.

  wire   empty       = ~full;

  assign wen = do_enq;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full;
  assign deq_val_int = ~empty;

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the full register input

  assign full_next
    = do_deq ? 1'b0
    : do_enq ? 1'b1
    : full;

endmodule

module vcQueueCtrl1_pipe
(
  input  clk, reset,
  input  enq_val,   // Enqueue data is valid
  output enq_rdy,   // Ready for sender to do an enqueue
  output deq_val,   // Dequeue data is valid
  input  deq_rdy,   // Receiver is ready to do a dequeue
  output wen        // Write enable signal to wire up to storage element
);

  // Status register

  reg  full;
  wire full_next;

  always @(posedge clk)
    if (reset)
      full <= 1'b0;
    else
      full <= full_next;

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // set the write enable accordingly.

  wire   empty       = ~full;
  wire   do_pipe     = full  && do_enq && do_deq;

  assign wen = do_enq;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full  || ( full  && deq_rdy );
  assign deq_val_int = ~empty;

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the full register input

  assign full_next
    = do_deq && ~do_pipe ? 1'b0
    : do_enq ? 1'b1
    : full;

endmodule

module vcQueueCtrl1_flow
(
  input  clk, reset,
  input  enq_val,   // Enqueue data is valid
  output enq_rdy,   // Ready for sender to do an enqueue
  output deq_val,   // Dequeue data is valid
  input  deq_rdy,   // Receiver is ready to do a dequeue
  output wen,       // Write enable signal to wire up to storage element
  output flowthru   // Indicates if performing flowthru
);

  // Status register

  reg  full;
  wire full_next;

  always @(posedge clk)
    if (reset)
      full <= 1'b0;
    else
      full <= full_next;

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.

  wire   empty       = ~full;
  wire   do_flowthru = empty && do_enq && do_deq;
  assign flowthru    = do_flowthru;

  assign wen = do_enq && ~do_flowthru;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full;
  assign deq_val_int = ~empty || ( empty && enq_val );

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the full register input

  assign full_next
    = do_deq ? 1'b0
    : do_enq && ~do_flowthru ? 1'b1
    : full;

endmodule

module vcQueueCtrl1_pipeflow
(
  input  clk, reset,
  input  enq_val,   // Enqueue data is valid
  output enq_rdy,   // Ready for sender to do an enqueue
  output deq_val,   // Dequeue data is valid
  input  deq_rdy,   // Receiver is ready to do a dequeue
  output wen,       // Write enable signal to wire up to storage element
  output flowthru   // Indicates if performing flowthru
);

  // Status register

  reg  full;
  wire full_next;

  always @(posedge clk)
    if (reset)
      full <= 1'b0;
    else
      full <= full_next;

  // Determine if pipeline or flowthrough behavior is enabled

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // set the write enable accordingly.

  wire   empty       = ~full;
  wire   do_pipe     = full  && do_enq && do_deq;
  wire   do_flowthru = empty && do_enq && do_deq;
  assign flowthru    = do_flowthru;

  assign wen = do_enq && ~do_flowthru;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full  || ( full  && deq_rdy );
  assign deq_val_int = ~empty || ( empty && enq_val );

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the full register input

  assign full_next
    = do_deq && ~do_pipe ? 1'b0
    : do_enq && ~do_flowthru ? 1'b1
    : full;

endmodule

// module vcQueueCtrl1#( parameter TYPE = 0 )
// (
//   input  clk, reset,
//   input  enq_val,   // Enqueue data is valid
//   output enq_rdy,   // Ready for sender to do an enqueue
//   output deq_val,   // Dequeue data is valid
//   input  deq_rdy,   // Receiver is ready to do a dequeue
//   output wen,       // Write enable signal to wire up to storage element
//   output flowthru   // Indicates if performing flowthru
// );
// 
//   // Status register
// 
//   reg  full;
//   wire full_next;
// 
//   always @(posedge clk)
//     if (reset)
//       full <= 1'b0;
//     else
//       full <= full_next;
// 
//   // Determine if pipeline or flowthrough behavior is enabled
// 
//   wire pipe_en     = ( TYPE == `VC_QUEUE_PIPE ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
//   wire flowthru_en = ( TYPE == `VC_QUEUE_FLOW ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
// 
//   // We enq/deq only when they are both ready and valid
// 
//   wire do_enq = enq_rdy && enq_val;
//   wire do_deq = deq_rdy && deq_val;
// 
//   // Determine if we have pipeline or flowthrough behaviour and
//   // set the write enable accordingly.
// 
//   wire   empty       = ~full;
//   wire   do_pipe     = pipe_en     && full  && do_enq && do_deq;
//   wire   do_flowthru = flowthru_en && empty && do_enq && do_deq;
//   assign flowthru    = do_flowthru;
// 
//   assign wen = do_enq && ~do_flowthru;
// 
//   // Ready signals are calculated from full register. If pipeline
//   // behavior is enabled, then the enq_rdy signal is also calculated
//   // combinationally from the deq_rdy signal. If flowthrough behavior
//   // is enabled then the deq_val signal is also calculated combinationally
//   // from the enq_val signal.
// 
//   assign enq_rdy  = ~full  || ( pipe_en     && full  && deq_rdy );
//   assign deq_val  = ~empty || ( flowthru_en && empty && enq_val );
// 
//   // Control logic for the full register input
// 
//   assign full_next
//     = do_deq && ~do_pipe ? 1'b0
//     : do_enq && ~do_flowthru ? 1'b1
//     : full;
// 
// endmodule

//--------------------------------------------------------------------------
// Multi-Element Queue Control Logic
//--------------------------------------------------------------------------
// This is the control logic for a multi-elment queue. It is designed
// to be attached to a RAM storage element. Additionally,
// it includes the ability to statically enable pipeline and/or flowthrough
// behavior. Pipeline behavior is when the deq_rdy signal is combinationally
// wired to the enq_rdy signal allowing elements to be dequeued and enqueued
// in the same cycle when the queue is full. Flowthrough behavior is when
// the enq_val signal is cominationally wired to the deq_val signal allowing
// elements to bypass the storage element if the storage element is empty.

module vcQueueCtrl_simple#( parameter ENTRIES = 2, parameter ADDR_SZ = 1 )
(
  input                clk, reset,
  input                enq_val,   // Enqueue data is valid
  output               enq_rdy,   // Ready for sender to do an enqueue
  output               deq_val,   // Dequeue data is valid
  input                deq_rdy,   // Receiver is ready to do a dequeue
  output               wen,       // Write enable signal to wire up to RAM
  output [ADDR_SZ-1:0] waddr,     // Write address to wire up to RAM
  output [ADDR_SZ-1:0] raddr      // Read address to wire up to RAM
);

  // Enqueue and dequeue pointers

  reg  [ADDR_SZ-1:0] enq_ptr;
  reg  [ADDR_SZ-1:0] deq_ptr;
  reg  full;

  wire [ADDR_SZ-1:0] enq_ptr_next;
  wire [ADDR_SZ-1:0] deq_ptr_next;
  wire full_next;

  always @(posedge clk)
  begin
    if (reset)
    begin
      enq_ptr <= 0;
      deq_ptr <= 0;
      full <= 1'b0;
    end
    else
    begin
      enq_ptr <= enq_ptr_next;
      deq_ptr <= deq_ptr_next;
      full <= full_next;
    end
  end

  assign waddr = enq_ptr;
  assign raddr = deq_ptr;

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.

  wire   empty       = ~full && (enq_ptr == deq_ptr);

  assign wen = do_enq;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full;
  assign deq_val_int = ~empty;

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the enq/deq pointers and full register

  wire [ADDR_SZ-1:0] deq_ptr_inc = deq_ptr + 1'b1;
  wire [ADDR_SZ-1:0] enq_ptr_inc = enq_ptr + 1'b1;

  assign deq_ptr_next
    = do_deq ? deq_ptr_inc
    : deq_ptr;

  assign enq_ptr_next
    = do_enq ? enq_ptr_inc
    : enq_ptr;

  assign full_next
    = do_enq && ~do_deq && ( enq_ptr_inc == deq_ptr ) ? 1'b1
    : do_deq && full ? 1'b0
    : full;

  // Trace state
  `ifndef SYNTHESIS
  reg [ADDR_SZ:0] entries;
  always @( posedge clk )
   begin
    if ( reset ) entries <= 0;
    else if ( do_enq && ~do_deq ) entries <= entries + 1;
    else if ( do_deq && ~do_enq ) entries <= entries - 1;
   end
  `endif

  // Assertions
  `ifndef SYNTHESIS
  always @( posedge clk )
  begin
    if ( entries > ENTRIES )
      $display( " RTL-ERROR : %m : Actual entries (%d) > ENTRIES (%d)!", entries, ENTRIES );
    if ( (1 << ADDR_SZ) < ENTRIES )
      $display( " RTL-ERROR : %m : ENTRIES (%d) > ADDR_SZ (%d)!", ENTRIES, ADDR_SZ );
  end
  `endif

endmodule

module vcQueueCtrl_pipe#( parameter ENTRIES = 2, parameter ADDR_SZ = 1 )
(
  input                clk, reset,
  input                enq_val,   // Enqueue data is valid
  output               enq_rdy,   // Ready for sender to do an enqueue
  output               deq_val,   // Dequeue data is valid
  input                deq_rdy,   // Receiver is ready to do a dequeue
  output               wen,       // Write enable signal to wire up to RAM
  output [ADDR_SZ-1:0] waddr,     // Write address to wire up to RAM
  output [ADDR_SZ-1:0] raddr      // Read address to wire up to RAM
);

  // Enqueue and dequeue pointers

  reg  [ADDR_SZ-1:0] enq_ptr;
  reg  [ADDR_SZ-1:0] deq_ptr;
  reg  full;

  wire [ADDR_SZ-1:0] enq_ptr_next;
  wire [ADDR_SZ-1:0] deq_ptr_next;
  wire full_next;

  always @(posedge clk)
  begin
    if (reset)
    begin
      enq_ptr <= 0;
      deq_ptr <= 0;
      full <= 1'b0;
    end
    else
    begin
      enq_ptr <= enq_ptr_next;
      deq_ptr <= deq_ptr_next;
      full <= full_next;
    end
  end

  assign waddr = enq_ptr;
  assign raddr = deq_ptr;

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.

  wire   empty       = ~full && (enq_ptr == deq_ptr);
  wire   do_pipe     = full  && do_enq && do_deq;

  assign wen = do_enq;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full  || ( full  && deq_rdy );
  assign deq_val_int = ~empty;

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the enq/deq pointers and full register

  wire [ADDR_SZ-1:0] deq_ptr_inc = deq_ptr + 1'b1;
  wire [ADDR_SZ-1:0] enq_ptr_inc = enq_ptr + 1'b1;

  assign deq_ptr_next
    = do_deq ? deq_ptr_inc
    : deq_ptr;

  assign enq_ptr_next
    = do_enq ? enq_ptr_inc
    : enq_ptr;

  assign full_next
    = do_enq && ~do_deq && ( enq_ptr_inc == deq_ptr ) ? 1'b1
    : do_deq && full && ~do_pipe ? 1'b0
    : full;

  // Trace state
  `ifndef SYNTHESIS
  reg [ADDR_SZ:0] entries;
  always @( posedge clk )
   begin
    if ( reset ) entries <= 0;
    else if ( do_enq && ~do_deq && ~do_pipe ) entries <= entries + 1;
    else if ( do_deq && ~do_enq && ~do_pipe ) entries <= entries - 1;
   end
  `endif

  // Assertions
  `ifndef SYNTHESIS
  always @( posedge clk )
  begin
    if ( entries > ENTRIES )
      $display( " RTL-ERROR : %m : Actual entries (%d) > ENTRIES (%d)!", entries, ENTRIES );
    if ( (1 << ADDR_SZ) < ENTRIES )
      $display( " RTL-ERROR : %m : ENTRIES (%d) > ADDR_SZ (%d)!", ENTRIES, ADDR_SZ );
  end
  `endif

endmodule

module vcQueueCtrl_flow#( parameter ENTRIES = 2, parameter ADDR_SZ = 1 )
(
  input                clk, reset,
  input                enq_val,   // Enqueue data is valid
  output               enq_rdy,   // Ready for sender to do an enqueue
  output               deq_val,   // Dequeue data is valid
  input                deq_rdy,   // Receiver is ready to do a dequeue
  output	           wen,       // Write enable signal to wire up to RAM
  output [ADDR_SZ-1:0] waddr,     // Write address to wire up to RAM
  output [ADDR_SZ-1:0] raddr,     // Read address to wire up to RAM
  output               flowthru   // Indicates if performing flowthru
);

  // Enqueue and dequeue pointers

  reg  [ADDR_SZ-1:0] enq_ptr;
  reg  [ADDR_SZ-1:0] deq_ptr;
  reg  full;

  wire [ADDR_SZ-1:0] enq_ptr_next;
  wire [ADDR_SZ-1:0] deq_ptr_next;
  wire full_next;

  always @(posedge clk)
  begin
    if (reset)
    begin
      enq_ptr <= 0;
      deq_ptr <= 0;
      full <= 1'b0;
    end
    else
    begin
      enq_ptr <= enq_ptr_next;
      deq_ptr <= deq_ptr_next;
      full <= full_next;
    end
  end

  assign waddr = enq_ptr;
  assign raddr = deq_ptr;

  // We enq/deq only when they are both ready and valid

  wire enq_rdy_int;
  wire deq_val_int;

  wire do_enq = enq_rdy_int && enq_val;
  wire do_deq = deq_rdy && deq_val_int;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.

  wire   empty       = ~full && (enq_ptr == deq_ptr);
  wire   do_flowthru = empty && do_enq && do_deq;
  assign flowthru    = do_flowthru;

  assign wen = do_enq && ~do_flowthru;

  // Ready signals are calculated from full register. If pipeline
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.

  assign enq_rdy_int = ~full;
  assign deq_val_int = ~empty || ( empty && enq_val );

  assign enq_rdy = enq_rdy_int;
  assign deq_val = deq_val_int;

  // Control logic for the enq/deq pointers and full register

  wire [ADDR_SZ-1:0] deq_ptr_inc = deq_ptr + 1'b1;
  wire [ADDR_SZ-1:0] enq_ptr_inc = enq_ptr + 1'b1;

  assign deq_ptr_next
    = do_deq && ~do_flowthru ? deq_ptr_inc
    : deq_ptr;

  assign enq_ptr_next
    = do_enq && ~do_flowthru ? enq_ptr_inc
    : enq_ptr;

  assign full_next
    = do_enq && ~do_deq && ( enq_ptr_inc == deq_ptr ) ? 1'b1
    : do_deq && full ? 1'b0
    : full;

  // Trace state
  `ifndef SYNTHESIS
  reg [ADDR_SZ:0] entries;
  always @( posedge clk )
   begin
    if ( reset ) entries <= 0;
    else if ( do_enq && ~do_deq && ~do_flowthru ) entries <= entries + 1;
    else if ( do_deq && ~do_enq && ~do_flowthru ) entries <= entries - 1;
   end
  `endif

  // Assertions
  `ifndef SYNTHESIS
  always @( posedge clk )
  begin
    if ( entries > ENTRIES )
      $display( " RTL-ERROR : %m : Actual entries (%d) > ENTRIES (%d)!", entries, ENTRIES );
    if ( (1 << ADDR_SZ) < ENTRIES )
      $display( " RTL-ERROR : %m : ENTRIES (%d) > ADDR_SZ (%d)!", ENTRIES, ADDR_SZ );
  end
  `endif

endmodule

// module vcQueueCtrl#( parameter TYPE = 0, parameter ENTRIES = 2, parameter ADDR_SZ = 1 )
// (
//   input                clk, reset,
//   input                enq_val,   // Enqueue data is valid
//   output               enq_rdy,   // Ready for sender to do an enqueue
//   output               deq_val,   // Dequeue data is valid
//   input                deq_rdy,   // Receiver is ready to do a dequeue
//   output	           wen,       // Write enable signal to wire up to RAM
//   output [ADDR_SZ-1:0] waddr,     // Write address to wire up to RAM
//   output [ADDR_SZ-1:0] raddr,     // Read address to wire up to RAM
//   output               flowthru   // Indicates if performing flowthru
// );
// 
//   // Enqueue and dequeue pointers
// 
//   reg  [ADDR_SZ-1:0] enq_ptr;
//   reg  [ADDR_SZ-1:0] deq_ptr;
//   reg  full;
// 
//   wire [ADDR_SZ-1:0] enq_ptr_next;
//   wire [ADDR_SZ-1:0] deq_ptr_next;
//   wire full_next;
// 
//   always @(posedge clk)
//   begin
//     if (reset)
//     begin
//       enq_ptr <= {ADDR_SZ{1'b0}};
//       deq_ptr <= {ADDR_SZ{1'b0}};
//       full <= 1'b0;
//     end
//     else
//     begin
//       enq_ptr <= enq_ptr_next;
//       deq_ptr <= deq_ptr_next;
//       full <= full_next;
//     end
//   end
// 
//   assign waddr = enq_ptr;
//   assign raddr = deq_ptr;
// 
//   // Determine if pipeline or flowthrough behavior is enabled
// 
//   wire pipe_en     = ( TYPE == `VC_QUEUE_PIPE ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
//   wire flowthru_en = ( TYPE == `VC_QUEUE_FLOW ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
// 
//   // We enq/deq only when they are both ready and valid
// 
//   wire do_enq = enq_rdy && enq_val;
//   wire do_deq = deq_rdy && deq_val;
// 
//   // Determine if we have pipeline or flowthrough behaviour and
//   // set the write enable accordingly.
// 
//   wire   empty       = ~full && (enq_ptr == deq_ptr);
//   wire   do_pipe     = pipe_en     && full  && do_enq && do_deq;
//   wire   do_flowthru = flowthru_en && empty && do_enq && do_deq;
//   assign flowthru    = do_flowthru;
// 
//   assign wen = do_enq && ~do_flowthru;
// 
//   // Ready signals are calculated from full register. If pipeline
//   // behavior is enabled, then the enq_rdy signal is also calculated
//   // combinationally from the deq_rdy signal. If flowthrough behavior
//   // is enabled then the deq_val signal is also calculated combinationally
//   // from the enq_val signal.
// 
//   assign enq_rdy  = ~full  || ( pipe_en     && full  && deq_rdy );
//   assign deq_val  = ~empty || ( flowthru_en && empty && enq_val );
// 
//   // Control logic for the enq/deq pointers and full register
// 
//   wire [ADDR_SZ-1:0] deq_ptr_inc = deq_ptr + {{(ADDR_SZ-1){1'b0}}, 1'b1};
//   wire [ADDR_SZ-1:0] enq_ptr_inc = enq_ptr + {{(ADDR_SZ-1){1'b0}}, 1'b1};
// 
//   assign deq_ptr_next
//     = do_deq && ~do_flowthru ? deq_ptr_inc
//     : deq_ptr;
// 
//   assign enq_ptr_next
//     = do_enq && ~do_flowthru ? enq_ptr_inc
//     : enq_ptr;
// 
//   assign full_next
//     = do_enq && ~do_deq && ( enq_ptr_inc == deq_ptr ) ? 1'b1
//     : do_deq && full && ~do_pipe ? 1'b0
//     : full;
// 
//   // Trace state
//   `ifndef SYNTHESIS
//   reg [ADDR_SZ:0] entries;
//   always @( posedge clk )
//    begin
//     if ( reset ) entries <= 0;
//     else if ( do_enq && ~do_deq && ~do_flowthru && ~do_pipe ) entries <= entries + 1;
//     else if ( do_deq && ~do_enq && ~do_flowthru && ~do_pipe ) entries <= entries - 1;
//    end
//   `endif
// 
//   // Assertions
//   `ifndef SYNTHESIS
//   always @( posedge clk )
//   begin
//     if ( entries > ENTRIES )
//       $display( " RTL-ERROR : %m : Actual entries (%d) > ENTRIES (%d)!", entries, ENTRIES );
//     if ( (1 << ADDR_SZ) < ENTRIES )
//       $display( " RTL-ERROR : %m : ENTRIES (%d) > ADDR_SZ (%d)!", ENTRIES, ADDR_SZ );
//   end
//   `endif
// 
// endmodule

//--------------------------------------------------------------------------
// Single-Element Flowthru Queue Datapath (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueueDpath_flow1_pf #( parameter DATA_SZ = 1 )
(
  input clk,
  input wen,
  input flowthru,

  input  [DATA_SZ-1:0] enq_bits,
  output [DATA_SZ-1:0] deq_bits

);

  reg [DATA_SZ-1:0] rout;

  always @(posedge clk)
    if (wen)
      rout <= enq_bits;

  assign deq_bits = flowthru ? enq_bits : rout;

endmodule

//--------------------------------------------------------------------------
// Multi-Element Flowthru Queue Datapath (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueueDpath_flow_pf
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input                clk,
  input                wen,
  input                flowthru,
  input  [ADDR_SZ-1:0] waddr,
  input  [ADDR_SZ-1:0] raddr,
  input  [DATA_SZ-1:0] enq_bits,
  output [DATA_SZ-1:0] deq_bits
);

  wire [DATA_SZ-1:0] rout;

  vcRAM_1w1r_pf#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk     (clk),
    .wen_p   (wen),
    .raddr   (raddr),
    .rdata   (rout),
    .waddr_p (waddr),
    .wdata_p (enq_bits)
  );

  assign deq_bits = flowthru ? enq_bits : rout;

endmodule

module vcQueueDpath_flow_pf_latch
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input                clk,
  input                wen,
  input                flowthru,
  input  [ADDR_SZ-1:0] waddr,
  input  [ADDR_SZ-1:0] raddr,
  input  [DATA_SZ-1:0] enq_bits,
  output [DATA_SZ-1:0] deq_bits
);

  wire [DATA_SZ-1:0] rout;

  vcRAM_1w1r_pf_latch#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk     (clk),
    .wen_p   (wen),
    .raddr   (raddr),
    .rdata   (rout),
    .waddr_p (waddr),
    .wdata_p (enq_bits)
  );

  assign deq_bits = flowthru ? enq_bits : rout;

endmodule

//--------------------------------------------------------------------------
// Single-Element Queues
//--------------------------------------------------------------------------

module vcQueue_1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output reg [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen;

  vcQueueCtrl1_simple ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen)
  );

  always @(posedge clk)
    if (wen)
      deq_bits <= enq_bits;

endmodule

module vcQueue_pipe1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output reg [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen;

  vcQueueCtrl1_pipe ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen)
  );

  always @(posedge clk)
    if (wen)
      deq_bits <= enq_bits;

endmodule

module vcQueue_flow1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;

  vcQueueCtrl1_flow ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .flowthru(flowthru)
  );

  vcQueueDpath_flow1_pf#(DATA_SZ) dpath
  (
    .clk(clk),
    .enq_bits(enq_bits),
    .deq_bits(deq_bits),
    .wen(wen), .flowthru(flowthru)
  );

endmodule

module vcQueue_pipeflow1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;

  vcQueueCtrl1_pipeflow ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .flowthru(flowthru)
  );

  vcQueueDpath_flow1_pf#(DATA_SZ) dpath
  (
    .clk(clk),
    .enq_bits(enq_bits),
    .deq_bits(deq_bits),
    .wen(wen), .flowthru(flowthru)
  );

endmodule

//--------------------------------------------------------------------------
// Multi-Element Queues
//--------------------------------------------------------------------------

module vcQueue_simple_pf
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;

  vcQueueCtrl_simple#(ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr)
  );

  vcRAM_1w1r_pf#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk(clk), .wen_p(wen),
    .raddr(raddr),   .rdata(deq_bits),
    .waddr_p(waddr), .wdata_p(enq_bits)
  );

endmodule

module vcQueue_simple_pf_latch
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;

  vcQueueCtrl_simple#(ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr)
  );

  vcRAM_1w1r_pf_latch#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk(clk), .wen_p(wen),
    .raddr(raddr),   .rdata(deq_bits),
    .waddr_p(waddr), .wdata_p(enq_bits)
  );

endmodule

module vcQueue_pipe_pf
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;

  vcQueueCtrl_pipe#(ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr)
  );

  vcRAM_1w1r_pf#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk(clk), .wen_p(wen),
    .raddr(raddr),   .rdata(deq_bits),
    .waddr_p(waddr), .wdata_p(enq_bits)
  );

endmodule

module vcQueue_pipe_pf_latch
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;

  vcQueueCtrl_pipe#(ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr)
  );

  vcRAM_1w1r_pf_latch#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk(clk), .wen_p(wen),
    .raddr(raddr),   .rdata(deq_bits),
    .waddr_p(waddr), .wdata_p(enq_bits)
  );

endmodule

module vcQueue_flow_pf
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;

  vcQueueCtrl_flow#(ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(flowthru)
  );

  vcQueueDpath_flow_pf#(DATA_SZ,ENTRIES,ADDR_SZ) dpath
  (
     .clk(clk),
     .enq_bits(enq_bits),
     .deq_bits(deq_bits),
     .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(flowthru)
  );

endmodule

module vcQueue_flow_pf_latch
#(
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;

  vcQueueCtrl_flow#(ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(flowthru)
  );

  vcQueueDpath_flow_pf_latch#(DATA_SZ,ENTRIES,ADDR_SZ) dpath
  (
     .clk(clk),
     .enq_bits(enq_bits),
     .deq_bits(deq_bits),
     .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(flowthru)
  );

endmodule
