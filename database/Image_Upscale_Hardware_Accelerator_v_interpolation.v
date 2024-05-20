// This program was cloned from: https://github.com/srburner222/Image_Upscale_Hardware_Accelerator
// License: Apache License 2.0

// Takes in 4x2 window of pixels, performs 4 linear interpolations then 1 cubic interpolation
// to create intended pixel.
// For more information refer to https://ieeexplore.ieee.org/document/9257189
module interpolation #(parameter bit_depth = 8, parameter v_res = 4, parameter h_res = 4)
(
  input logic 		       clk, reset,
  input logic                  valid_in,		       
  input logic  [bit_depth-1:0] data_in,
  output logic 		       valid_out, ready_out, // NEED TO DRIVE READY_OUT
  output logic [bit_depth-1:0] data_out 
);

   localparam NEW_H_RES = 2 * h_res;
   localparam NEW_V_RES = 2 * v_res;
   localparam REG_SIZE  = bit_depth * (NEW_H_RES * 2 + 1);
      
   reg [REG_SIZE-1:0] 	         shift_reg;   // Long shift reg for data processing
   reg [$clog2(NEW_V_RES + 3):0] v_count;     // Number of rows processed
   reg [$clog2(NEW_H_RES):0]     h_count;     // Number of data processed in current row
   reg [$clog2(2*NEW_H_RES+1):0] valid_count; // Tracks how many data have passed until valid   
   reg [$clog2(h_res-1):0]       cubic_count; // Tracks the number of passed cubic computations 

   reg [bit_depth-1:0] 	         linear_data; // Linear interpolated data
   reg [bit_depth-1:0] 	         cubic_data;  // Cubic  interpolated data
   
   /*****CONTROLLER*****/

   typedef enum logic [1:0] {Wait, Run, Idle} state;
   state ps, ns;

   logic rst_count, allow_shift, cubic_upcount;
   
   always @(posedge clk) begin
      if (reset) ps <= Wait;
      else       ps <= ns;
   end

   always @(*) begin
      ns = ps;
      rst_count = 0;
      allow_shift = 0;
      valid_out = 0;
      cubic_upcount = 0;
            
      case(ps)
	Wait: begin	   	   
	   if (valid_in) begin
	      ns = Run;
	      allow_shift = 1;
	   end 
	   else
	     rst_count = 1;
	end

	Run: begin
	   allow_shift = 1;
	   cubic_upcount = 1;
	   
	   if (valid_count ==  (2 * NEW_H_RES + 1))
	      valid_out = 1;
	   	   
	   if (~valid_in && ~v_count[0] && ~h_count[0] && (v_count < NEW_V_RES)) begin
	      allow_shift = 0;
	      cubic_upcount = 0;
	      ns = Idle;
	   end 
	   else if (v_count == (NEW_V_RES + 2))
	      ns = Wait; // last output data
	end
	
	Idle: begin	   	   
	   if (valid_in) begin
	      ns = Run;
	      allow_shift = 1;
	   end
	end
      endcase
   end
   
   /******DATAPATH******/
   
   always @(posedge clk) begin
      if (reset || rst_count) begin
	 shift_reg    <= 0;
	 v_count      <= 0;
  	 h_count      <= 0;
	 valid_count  <= 0;
	 cubic_count  <= 0;
      end
      else begin
	 if ((valid_count < (2 * NEW_H_RES + 1)) && allow_shift)
	   valid_count <= valid_count + 1;
	 
	 // Track location in row
	 if ((h_count < NEW_H_RES - 1) && allow_shift)
	   h_count <= h_count + 1;
	 else if (allow_shift) begin
	   h_count <= 0;
	   v_count <= v_count + 1;
	 end
	 
	 if ((cubic_count == h_res - 1) && cubic_upcount && h_count[0])
	   cubic_count <= 0;
	 else if ((valid_count > NEW_H_RES+5) && h_count[0] && cubic_upcount)
	   cubic_count <= cubic_count + 1;
	 
	 if (allow_shift) begin
	    // Get rid of MSB
	    shift_reg [REG_SIZE-1-bit_depth:0] <= shift_reg [(REG_SIZE-1):bit_depth];
	    
	    // Shift in new data or zeros
	    if (~h_count[0] && ~v_count[0]) // If in an odd row and column, add data
	      shift_reg [REG_SIZE-1:REG_SIZE-bit_depth] <= data_in;
	    else
	      shift_reg [REG_SIZE-1:REG_SIZE-bit_depth] <= {bit_depth{1'b0}};

	    // Load Linear data (vertical count is even, horizontal count is odd)
	    if (~v_count[0] && h_count[0])
	      shift_reg [(bit_depth*(NEW_H_RES)-1):(bit_depth*(NEW_H_RES-1))] <= linear_data;
	    
	    // Load Cubic data (horizontal count is odd)
	    if (h_count[0])
	      shift_reg [(bit_depth*(NEW_H_RES-5)-1):(bit_depth*(NEW_H_RES-6))] <= cubic_data;
	 end // if (allow_shift)
      end
   end // always @ (posedge clk)
   
   logic [bit_depth-1:0] cubic_edge_left, cubic_edge_near_right, cubic_edge_far_right, linear_edge;
   
   // Check for left edge of frame
   assign cubic_edge_left       = (cubic_count == 0)                                           ? {bit_depth{1'b0}} : shift_reg [(bit_depth*(NEW_H_RES-7)-1):(bit_depth*(NEW_H_RES-8))];
   
   // Check for near right edge of frame
   assign cubic_edge_near_right = (cubic_count == (h_res - 1))                                 ? {bit_depth{1'b0}} : shift_reg [(bit_depth*(NEW_H_RES-3)-1):(bit_depth*(NEW_H_RES-4))];
      
   // Check for far right edge of frame
   assign cubic_edge_far_right  = (cubic_count == (h_res - 1)) || (cubic_count == (h_res - 2)) ? {bit_depth{1'b0}} : shift_reg [(bit_depth*(NEW_H_RES-1)-1):(bit_depth*(NEW_H_RES-2))];

   // Check for bottom edge of frame
   assign linear_edge           = (v_count == (NEW_V_RES))                                     ? {bit_depth{1'b0}} : shift_reg [REG_SIZE-1:(REG_SIZE-bit_depth)];

   linear_scale #(.bit_depth(bit_depth)) linear_scale (.a0(linear_edge), 
						       .a1(shift_reg [bit_depth-1:0]), 
						       .data_out(linear_data));

   cubic_scale  #(.bit_depth(bit_depth)) cubic_scale  (.a0(cubic_edge_left), 
						       .a1(shift_reg [(bit_depth*(NEW_H_RES-5)-1):(bit_depth*(NEW_H_RES-6))]),
						       .a2(cubic_edge_near_right),
						       .a3(cubic_edge_far_right),
						       .data_out(cubic_data));
   
   assign data_out = shift_reg [bit_depth-1:0];

   assign ready_out = ~v_count[0] && ~h_count[0];
      
endmodule
