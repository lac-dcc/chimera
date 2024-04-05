//**************************************************************************
// Test Source
//--------------------------------------------------------------------------
// $Id: vcTestSource.v,v 1.1.1.1 2006/02/17 23:57:17 cbatten Exp $
//

`include "vcTest.v"

module vcTestSource 
#( 
  parameter BIT_WIDTH        = 1, 
  parameter RANDOM_DELAY     = 0,
  parameter ENTRIES          = 1024
)
(
  input clk, reset,

  output [BIT_WIDTH-1:0] bits,
  output val,
  input  rdy,

  // Goes high once all source data has been issued
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
  
  // Output queue

  reg  [BIT_WIDTH-1:0] outputQ_enq_bits;
  reg                  outputQ_enq_val;
  wire                 outputQ_enq_rdy;
  
  vcQueue_pipe1_pf#(BIT_WIDTH) outputQ
  (
    .clk       (clk),
    .reset     (reset),
    .enq_bits  (outputQ_enq_bits),
    .enq_val   (outputQ_enq_val),
    .enq_rdy   (outputQ_enq_rdy),
    .deq_bits  (bits),
    .deq_val   (val),
    .deq_rdy   (rdy)
  );

  //========================================================================
  // Actions
  //========================================================================

  assign done = ( m[index] === {BIT_WIDTH{1'bx}} );
  reg    decrand_fire;
  reg    send_fire;
  
  always @(*) if ( ~reset )
  begin
    
    // Default control signals
    rand_delay_en   = 1'b0;
    index_en        = 1'b0;
    outputQ_enq_val = 1'b0;
    
    // Fire signals
    decrand_fire  = 1'b0;
    send_fire 	  = 1'b0;

    //----------------------------------------------------------------
    // decrand action

    if ( rand_delay > 0 )
     begin
      decrand_fire    = 1'b1;
      rand_delay_en   = 1'b1;
      rand_delay_next = rand_delay - 1;
     end

    //----------------------------------------------------------------
    // send action

    if ( outputQ_enq_rdy && ~done && (rand_delay == 0) )
     begin
      send_fire = 1'b1;
       
      // Send the bits 
      outputQ_enq_val  = 1'b1;
      outputQ_enq_bits = m[index];

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
  
endmodule
