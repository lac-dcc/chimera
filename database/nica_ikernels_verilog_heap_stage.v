// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// CMS Heap stage
// Gabi Malka, Technion, TCE
// May-2017

module heap_stage #(
    parameter VALUE_WIDTH	= 32,
    parameter KEY_WIDTH 	= 32
) (
    input wire 			    ap_clk,
    input wire 			    ap_reset,

    input wire [KEY_WIDTH - 1:0]    key_test_in,    // input key to be tested
    input wire [KEY_WIDTH - 1:0]    key_in,         // input key from prev. heap stage
    input wire [VALUE_WIDTH - 1:0]  value_in,       // input value from prev. heap stage
    input wire 			    kv_in_valid,    // input key,value pair to be tested is ready
    input wire 			    heap_read,      // heap read request, from AXI-lite mechanism in CMS.

    output wire [KEY_WIDTH - 1:0]   key_test_out,   // key to be tested, out to next heap stage
    output wire [KEY_WIDTH - 1:0]   key_out,        // current stage key, out to next heap stage
    output wire [VALUE_WIDTH - 1:0] value_out,      // current stage value, out to next heap stage
    output wire 		    kv_out_valid    // current key,value pair is valid, out to next heap stage
);

//------------------------heap stage fsm-------------------
localparam
  K_TEST      = 2'd0,
  V_TEST      = 2'd1,
  KV_WRITE    = 2'd2,
  PASSTHRU    = 2'd3;

// heap stage data structures:	  
// Option 1: Using regs:
    reg [KEY_WIDTH - 1:0] 	    key_test;
    reg 		            kv_valid;
    reg 		            stage_valid;
    reg [KEY_WIDTH - 1:0] 	    key;
    reg [VALUE_WIDTH - 1:0] 	    value;
    reg [KEY_WIDTH - 1:0] 	    key_out_r;
    reg [VALUE_WIDTH - 1:0] 	    value_out_r;

  
// heap stage data structures:	  
// Option 2: Using distributed RAM
/* 
  parameter RAM_WIDTH = 256;
  parameter RAM_ADDR_BITS = 0;  // A single entry RAM 
 
 (* RAM_STYLE="{DISTRIBUTED}" *)

  reg [RAM_WIDTH-1:0] 		    kv_stage [(2**RAM_ADDR_BITS)-1:0];
  wire [RAM_WIDTH-1:0] 		    kv_stage_out;
  //wire [RAM_ADDR_BITS-1:0]        <addressA>, <addressB>;
  wire [RAM_WIDTH-1:0]              kv_stage_in;
  wire                              kv_stage_write;
 
     always @(posedge ap_clk) begin
             if (<enableA>) begin
	        if (<kv_stage_write>)
	           kv_stage[0] <= kv_stage_in;
//	       kv_stage_out <= kv_stage[0];
	     end
     end
 */
  

  reg [1:0] 			    hstate;
  wire 				    key_is_tested;
  wire 				    heap_entry_is_bubbled;

  assign kv_out_valid = kv_valid;
  assign key_test_out = key_test;
  assign key_out = key_out_r;
  assign value_out = value_out_r;
			
  always @(posedge ap_clk) begin
    
    if (ap_reset) begin
      key <= 0;
      value <= 0;
      key_out_r <= 0;
      value_out_r <= 0;
      kv_valid <= 0;
      hstate <= K_TEST;
      stage_valid <= 0;
    end
    
    else begin

      // Heap stage State Machine
      if (hstate == K_TEST) begin
	kv_valid <= 1'b0;
	
	if (heap_read) begin
	  hstate = PASSTHRU;
	  
	  // Reading thru AXI-lite: 
	  // heap stages are bubbled, two stages per each read request.
	  // The second bubble in PASSTHRU state   
	  key_out_r <= key;
	  value_out_r <= value;
	  key <= key_in;	
	  value <= value_in;
	end	    
	
	else if (kv_in_valid) begin
	  if (stage_valid & (key_test_in == key) | !stage_valid) begin
	    hstate = KV_WRITE;
	  end
	  else begin
	    hstate = V_TEST;
	  end
	end
      end
    
      else if (hstate == KV_WRITE) begin
	// The incoming KV pair is loaded into current stage if:
	// 1. Curent stage was empty (!stage_valid), or
	// 2. The incoming K matches the existing
	// In both cases, nothing is passed down to next stage
	hstate = K_TEST;
	stage_valid <= 1'b1;
	
	// Replace current kv with the incoming pair. 
	key <= key_in;	
	value <= value_in;
	
	// Prev. kv values are NOT forwarded to next heap stage, but still the output kv registers are also written, just to keep its write_enable signal common to all the registers in a heap stage
	key_out_r <= key;
	value_out_r <= value;
      end
    
      else if (hstate == V_TEST) begin
	hstate = K_TEST;
	kv_valid <= 1'b1;
	key_test <= key_test_in;	
	
	if (value_in > value) begin
	  // The new value is greater than current value.
	  // Replace current kv with the incoming pair and forward prev. kv values to next heap stage 
	  key <= key_in;	
	  value <= value_in;
	  key_out_r <= key;
	  value_out_r <= value;
	end
	else begin
	  // The new value is not greater than current value.
	  // Current kv pair is maintained. Incoming pair is forwarded to next heap stage 
	  key_out_r <= key_in;
	  value_out_r <= value_in;
	end
      end 
      
      else if (hstate == PASSTHRU) begin
	hstate = K_TEST;
	stage_valid <= 0;
	
	// Reading thru AXI-lite: 
	// heap stages are bubbled, two stages per each read request.
	// The first bubble was done in prev. K_TEST state   
	key_out_r <= key;
	value_out_r <= value;
	key <= key_in;	
	value <= value_in;
      end      

      else
	hstate = K_TEST;
      
    end // else (if (ap_reset))
  end //always @(posedge ap_clk)  

endmodule
