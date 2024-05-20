// This program was cloned from: https://github.com/srburner222/Image_Upscale_Hardware_Accelerator
// License: Apache License 2.0

module cubic_scale #(parameter bit_depth = 8)
(
 input  logic [bit_depth-1:0] a0, a1, a2, a3,
 output logic [bit_depth-1:0] data_out
);

   reg [bit_depth+4:0] t32, t321, t3210;
   reg [bit_depth+3:0] t0, t1, t2, t3, shift_t321;
         
   cubic_coefficients #(.bit_depth(bit_depth)) cc (.a0, .a1, .a2, .a3, .t0, .t1, .t2, .t3);
      
   always @(*) begin
      t32 = t2 + (t3 >> 1);
      t321 = t1 + (t32 >> 1);

      shift_t321 = t321 >> 1;
            
      t3210 = t0 + (shift_t321);
      		
      // Some unknown wizardry makes these lines work
      if(t3210 [bit_depth]) begin
	 if(~t0 [bit_depth] && ~shift_t321[bit_depth]) data_out = {bit_depth{1'b1}};
	 else data_out = {bit_depth{1'b0}};
      end
      else data_out = t3210 [bit_depth-1:0];
   end

endmodule
	
