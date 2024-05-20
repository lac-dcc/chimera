// This program was cloned from: https://github.com/existential-ai/izhekevich_neuron
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Dmitri Lyalikov
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

  /** 
    | Behavior                    | A   | B    | C   | D   |
    | --------------------------- | --- | ---- | --- | --- |
   0| RS (Regular Spiking)        | .02 | .02  | -65 | 8   |
   1| IB (Intrinsically Bursting) | .02 | .02  | -55 | 4   |
   2| CH (Chattering)             | .02 | .02  | -50 | 2   |
   3| FS (Fast Spiking)           | 0.1 | 0.2  | -65 | 2   |
   4| TC (Thalamo-Cortical)       | .02 | 0.25 | -65 | .05 |
   5| RZ (Resonator)              | 0.1 | 0.25 | -65 | 2   |
   6| LTS (Low Threshold Spiking) | .02 | 0.25 | -65 | 2   |
  */

// Top Level Module
module tt_um_exai_izhikevich_neuron (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  assign uio_out = uio_in;      // We do not use second output pin, assign so Verilator doesn't yell at us
  assign uio_oe  = 0;           // Config uio_in output enable to 0: Input mode
  
  reg         [3:0]  a, b;         
  reg  signed [17:0] v1, u1;
  wire signed [17:0] u1reset, v1new, u1new, du1;
  wire signed [17:0] v1xv1, v1xb;
  wire signed [17:0] p, c14;
  reg  signed [17:0] c, d;
  wire signed [17:0] I;  // uio_in[3:0];

  assign p = 18'sh0_4CCC;   // 30
  assign c14 = 18'sh1_6666; // 1.4

  // 8-bit signed integer precision of input current 
  assign I = {1'b0, ui_in[4:0], 12'h0}; 

  // Update logic 
  always @ (posedge clk)
  begin 
    if (!rst_n)          // Reset state
    begin
      v1 <= 18'sh3_4CCD;     // -0.7v 
      u1 <= 18'sh3_CCCD;     // -0.2
      a <= 1;                // .02
      b <= 1;                // .02             
      c <= 18'sh3_A666;      // -.065
      d <= 18'sh0_147A;      // .08
      // Switch case for different neuron types
      case (uio_in[2:0])
        // RS (Regular Spiking) a = 0.02, b = 0.02, c = -.065, d = .08
        3'b000: begin
          a <= 1;            // .02
          b <= 1;            // .02             
          c <= 18'sh3_A666;  // -.065
          d <= 18'sh0_147A;  // .08
        end 
        // IB (Intrinsically Bursting) a = 0.02, b = 0.02, c = -.055, d = .04
        3'b001: begin
          a <= 1;            // .02
          b <= 1;            // .02             
          c <= 18'sh3_8CCC;  // -.055
          d <= 18'sh0_0A3D;  // .04
        end
        // CH (Chattering) a = 0.02, b = 0.02, c = -.050, d = .02
        3'b010: begin
          a <= 1;            // .02
          b <= 1;            // .02             
          c <= 18'sh3_8000;  // -.050
          d <= 18'sh0_051E;  // .02
        end
        // FS (Fast Spiking) a = 0.1, b = 0.2, c = -.065, d = .02
        3'b011: begin
          a <= 2;            // .1
          b <= 4;            // .2             
          c <= 18'sh3_A666;  // -.065
          d <= 18'sh0_051E;  // .02
        end
        // TC (Thalamo-Cortical) a = 0.02, b = 0.25, c = -.065, d = .05
        3'b100: begin
          a <= 1;            // .02
          b <= 4;            // .25             
          c <= 18'sh3_A666;  // -.065
          d <= 18'sh0_0020;  // .05
        end
        // RZ (Resonator) a = 0.1, b = 0.25, c = -.065, d = .02
        3'b101: begin
          a <= 2;            // .1
          b <= 4;            // .25             
          c <= 18'sh3_A666;  // -.065
          d <= 18'sh0_051E;  // .02
        end
        // LTS (Low Threshold Spiking) a = 0.02, b = 0.25, c = -.065, d = .02
        3'b110: begin
          a <= 1;            // .02
          b <= 4;            // .25             
          c <= 18'sh3_A666;  // -.065
          d <= 18'sh0_051E;  // .02
        end
        3'b111: begin
          a <= {uio_in[3], ui_in[7:5]};
          b <= uio_in[7:4];
        end
        default: begin
          a <= 1;           // .02
          b <= 1;           // .02             
          c <= 18'sh3_A666; // -.065
          d <= 18'sh0_147A; // .08
        end
    endcase
    end
    else
    if (ena)
    begin
      if ((v1 > p))      // This is a spike above threshold (30mv)
      begin
        v1 <= c;
        u1 <= u1reset;
      end
      else
      begin             
        v1 <= v1new;
        u1 <= u1new;
      end
    end
  end
  // Push out signed 8-bit integer to output pin (membrane voltage)
  assign uo_out = v1[17:10]; 

	// v1(n+1) = v1(n) + (v1(n)^2) + 5/4*v1(n) +1.40/4 - u1(n)/4 + I/4)/4
	signed_mult v1sq(v1xv1, v1, v1);
	assign v1new = v1 + ((v1xv1 + v1+(v1>>>2) + (c14>>>2) - (u1>>>2) + (I>>>2))>>>2);
	
	// u1(n+1) = u1 + dt*a*(b*v1(n) - u1(n))
	assign v1xb = v1>>>b;         //mult (v1xb, v1, b);
	assign du1 = (v1xb-u1)>>>a ;  //mult (du1, (v1xb-u1), a);
	assign u1new = u1 + (du1>>>4) ; 
	assign u1reset = u1 + d ;
  
endmodule


// signed mult of 2.16 format 2'comp
module signed_mult (out, a, b);

	output 		[17:0]	out;
	input 	signed	[17:0] 	a;
	input 	signed	[17:0] 	b;
	
	wire	signed	[17:0]	out;
  /* verilator lint_off UNUSEDSIGNAL */
	wire 	signed	[35:0]	mult_out;

  // Remove linter warning of unused bits
	assign mult_out = a * b;
	//assign out = mult_out[33:17];
	assign out = {mult_out[35], mult_out[32:16]};
endmodule


