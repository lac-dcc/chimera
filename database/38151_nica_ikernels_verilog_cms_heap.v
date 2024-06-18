// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// CMS Heap
// Gabi Malka, Technion, TCE
// May-2017

module cms_heap #(
    parameter HEAP_DEPTH	= 32,
    parameter VALUE_WIDTH	= 32,
    parameter KEY_WIDTH 	= 32
) (
    input wire 			   ap_clk,
    input wire 			   ap_reset,

   // A new {key,value} from CMS:
    input wire [KEY_WIDTH - 1:0]   key_in, // input key from cms
    input wire [VALUE_WIDTH - 1:0] value_in, // input value from cms
    input wire 			   kv_in_valid, // input {key, value} pair is valid

   // heap reading interface:
    input wire 			   kv_out_ready, // CMS reads the heap Value part
    output wire [KEY_WIDTH-1:0]    key_out,    // Output bottom key
    output wire [VALUE_WIDTH-1:0]  value_out,  // Output bottom value
    output wire 		   kv_out_valid       // Output bottom key and value are valid
);


// Heap stages deployment:
// First and last stages are separately instanciated, due to its different wiring
  wire [KEY_WIDTH-1:0] 	key_test_outH[HEAP_DEPTH-1:0];
  wire 			kv_out_validH[HEAP_DEPTH-1:0];
  wire [KEY_WIDTH-1:0] 	key_outH[HEAP_DEPTH-1:0];
  wire [VALUE_WIDTH:0] 	value_outH[HEAP_DEPTH-1:0];
  wire [KEY_WIDTH-1:0]	key_in_stage0;
  wire [VALUE_WIDTH-1:0] value_in_stage0;
  reg 			kv_out_readyQ;
  reg 			bubble_heap;
  reg 			bubble_inflight;
  reg 			kv_valid;
  reg 			kv_validQ;
  reg [15:0] 		heap_settle_window;  

// input key & value to top (first) heap stage
  assign key_in_stage0 = (bubble_inflight) ? {KEY_WIDTH{1'b0}} : key_in;
  assign value_in_stage0 = (bubble_inflight) ? {VALUE_WIDTH{1'b0}} : value_in;

// Output bottom key & value to cms
  assign key_out = key_outH[HEAP_DEPTH-1];
  assign value_out = value_outH[HEAP_DEPTH-1];

  // kv_out_valid is masked for 2*HEAP_DEPTH clocks following latter cms-to-heap write
  // This delay is necessary to allow the heap stages to setttle, during which to
  // kv_out_valid is masked, to prevent reading the heap (by cms) while the heap stages not settled
  assign kv_out_valid = kv_valid & (heap_settle_window == 0);

  always @(posedge ap_clk) begin

    if (ap_reset) begin
      kv_out_readyQ <= 0;
      bubble_heap <= 1'b0;
      bubble_inflight <= 1'b0;
      
// kv out from heap (last stage) is always valid. It is dropped to two clocks only when heap is bubbled
      kv_valid <= 1'b1;
      kv_validQ <= 1'b0;
      heap_settle_window <= 16'h0000;  
    end
    
    // Assert bubble_heap one clock after kv_out_ready was asserted, and keep bubble_heap asserted for 1 clock only
    else begin
      kv_out_readyQ <= kv_out_ready;


      // Bubble-down the heap, following a read by cms
      // The heap valid is dropped during this bubble
      if (kv_out_ready & ~kv_out_readyQ) begin
	bubble_heap <= 1'b1;
	kv_valid <= 1'b0;
	bubble_inflight <= 1'b1;
      end

      if (bubble_heap) begin
	bubble_heap <= 1'b0;
	kv_validQ <= 1'b1;
      end 

      if (kv_validQ) begin
	kv_validQ <= 1'b0;
	kv_valid <= 1'b1;
	bubble_inflight <= 1'b0;
      end

      // Heap settle window: Count down from latter write-to-heap
      // heap settle window is initialized to 2*HEAP_DEPTH, folowing every write-to-heap:
      // The heap will be valid for read (by cms) only after the settle window has elapsed (heap being settled)
      if (kv_in_valid)
	heap_settle_window <= {HEAP_DEPTH, 1'b0};  
      else if (heap_settle_window > 0)
	heap_settle_window <= heap_settle_window -1;

    end

  end // always @ (posedge ap_clk)
  
  
  heap_stage # (    
	.VALUE_WIDTH(32),
	.KEY_WIDTH(32)
) heap_top (
	 .ap_clk(ap_clk),
	 .ap_reset(ap_reset),
	 .key_test_in(key_in_stage0),
	 .key_in(key_in_stage0),
	 .value_in(value_in_stage0),
	 .kv_in_valid(kv_in_valid),
	 .heap_read(bubble_heap),
	 .key_test_out(key_test_outH[0]),
	 .key_out(key_outH[0]),
	 .value_out(value_outH[0]),
	 .kv_out_valid(kv_out_validH[0])
 );

generate
genvar j;
for (j = 1; j < HEAP_DEPTH-1 ; j = j + 1) begin: HeapID

  heap_stage # (    
	.VALUE_WIDTH(32),
	.KEY_WIDTH(32)
) heap (
	 .ap_clk(ap_clk),
	 .ap_reset(ap_reset),
	 .key_test_in(key_test_outH[j-1]),
	 .key_in(key_outH[j-1]),
	 .value_in(value_outH[j-1]),
	 .kv_in_valid(kv_out_validH[j-1]),
	 .heap_read(bubble_heap),
	 .key_test_out(key_test_outH[j]),
	 .key_out(key_outH[j]),
	 .value_out(value_outH[j]),
	 .kv_out_valid(kv_out_validH[j])
);

end
endgenerate	

// This module is a duplicate of the above but with the distinction:
// The output ket_test_out is not not needed, thus dropped.
  last_heap_stage # (    
	.VALUE_WIDTH(32),
	.KEY_WIDTH(32)
) heap_last (
	 .ap_clk(ap_clk),
	 .ap_reset(ap_reset),
	 .key_test_in(key_test_outH[HEAP_DEPTH-2]),
	 .key_in(key_outH[HEAP_DEPTH-2]),
	 .value_in(value_outH[HEAP_DEPTH-2]),
	 .kv_in_valid(kv_out_validH[HEAP_DEPTH-2]),
	 .heap_read(bubble_heap),
//	 .key_test_out(key_test_outH[HEAP_DEPTH-1]),
	 .key_out(key_outH[HEAP_DEPTH-1]),
	 .value_out(value_outH[HEAP_DEPTH-1]),
	 .kv_out_valid(kv_out_validH[HEAP_DEPTH-1])
);

//-------------------------------------------------
// End of heap stages instatiation
//-------------------------------------------------


endmodule        

