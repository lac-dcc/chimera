//**************************************************************************
// Test Sink
//--------------------------------------------------------------------------
// $Id: vcTestSink.v,v 1.1.1.1 2006/02/17 23:57:17 cbatten Exp $
//

`include "vcTest.v"

module vcTestSink 
#( 
  parameter BIT_WIDTH        = 1, 
  parameter RANDOM_DELAY     = 0,
  parameter ENTRIES          = 1024
)
(
  input clk, reset,

  // Input interface
  input [BIT_WIDTH-1:0] bits,
  input  				val,
  output 				rdy,

  // Goes high once all expected inputs have been received
  output done
 
);  

  //========================================================================
  // State
  //========================================================================

  reg [BIT_WIDTH-1:0] m[ENTRIES-1:0];

  // Index register
  
  wire [9:0] index;
  reg  [9:0] index_next;
  reg        index_en;

  vcERDFF_pf#(10) index_pf
  ( 
    .clk     (clk),
    .reset_p (reset),
    .en_p    (index_en),
    .d_p     (index_next), 
    .q_np    (index) 
  );

  // Random delay register
  
  wire [31:0] rand_delay;
  reg  [31:0] rand_delay_next;
  reg         rand_delay_en;
  
  vcERDFF_pf#(32) rand_delay_pf
  ( 
    .clk     (clk),
    .reset_p (reset),
    .en_p    (rand_delay_en),
    .d_p     (rand_delay_next), 
    .q_np    (rand_delay) 
  );

  // Input queue

  wire [BIT_WIDTH-1:0] inputQ_deq_bits;
  wire                 inputQ_deq_val;
  reg                  inputQ_deq_rdy;
 
  vcQueue_pipe1_pf#(BIT_WIDTH) inputQ
  (
    .clk       (clk),
    .reset     (reset),
    .enq_bits  (bits),
    .enq_val   (val),
    .enq_rdy   (rdy),
    .deq_bits  (inputQ_deq_bits),
    .deq_val   (inputQ_deq_val),
    .deq_rdy   (inputQ_deq_rdy)
  );

  //========================================================================
  // Actions
  //========================================================================

  wire [BIT_WIDTH-1:0] correct_bits = m[index];
  assign done = ( m[index] === {BIT_WIDTH{1'bx}} );
  
  reg  decrand_fire;
  reg  verify_fire;

  always @(*) if ( ~reset )
  begin

    // Default control signals
    rand_delay_en  = 1'b0;
    index_en       = 1'b0;
    inputQ_deq_rdy = 1'b0;
    
    // Fire signals
    decrand_fire  = 1'b0;
    verify_fire   = 1'b0;

    //----------------------------------------------------------------
    // decrand action

    if ( rand_delay > 0 )
     begin
      decrand_fire    = 1'b1;
      rand_delay_en   = 1'b1;
      rand_delay_next = rand_delay - 1;
     end

    //----------------------------------------------------------------
    // verify action    

    if ( inputQ_deq_val && ~done && (rand_delay == 0) )
    begin
      verify_fire = 1'b1;

      // Get the value from the queue
      inputQ_deq_rdy = 1'b1;
      
      // Increment the index
      index_en   = 1'b1;
      index_next = index + 1;

      // Reset random delay if needed
      if ( RANDOM_DELAY > 0 )
       begin
        rand_delay_en   = 1'b1;
        rand_delay_next = {$random} % RANDOM_DELAY;
       end

    end
    
  end

  // We have to use this hack to do displays inside our transactions
  // since transactions can happen several times (they are
  // combinational blocks) but we only want the display to happen once 
  // based on the final values.

  reg verbose = 0;
  initial $value$plusargs( "verbose=%d", verbose );
  always @( posedge clk )
    if ( verify_fire )
     `VC_TEST_EQUAL( "vcTestSink", correct_bits, inputQ_deq_bits )      
  
endmodule