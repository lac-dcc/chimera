// This program was cloned from: https://github.com/srburner222/Image_Upscale_Hardware_Accelerator
// License: Apache License 2.0

module cubic_coefficients #(parameter bit_depth = 8)
(
 input  logic [bit_depth-1:0] a0, a1, a2, a3,
 output logic [bit_depth+3:0] t0, t1, t2, t3
);

   reg [bit_depth+3:0] a1_mult_15, a1_mult_25, a2_mult_15, a2_mult_2;
      
   always @(*) begin
      // Create intermediary coefficients
      a1_mult_15 = {4'b0, a1} + {5'b0, a1[bit_depth-1:1]};
      a1_mult_25 = {3'b0, a1, 1'b0} + {5'b0, a1[bit_depth-1:1]};
      a2_mult_15 = {4'b0, a2} + {5'b0, a2[bit_depth-1:1]};
      a2_mult_2  = {3'b0, a2, 1'b0};

      // Create output coefficients
      t0 = {4'b0, a1};
      t1 = {5'b0, a2[bit_depth-1:1]} - {5'b0, a0[bit_depth-1:1]};
      t2 = ({4'b0, a0} - a1_mult_25) + (a2_mult_2 - {5'b0, a3[bit_depth-1:1]});
      t3 = (a1_mult_15 - {5'b0, a0[bit_depth-1:1]}) + ({5'b0, a3[bit_depth-1:1]} - a2_mult_15);
   end

endmodule
