// The lfsr example
// Using polynomials with max-len lfsr value 
// f(x)=x^8+x^6+x^5+x^4=1

module lfsr
(
 input            clk,
 input            rst_n,
 output reg [7:0] prg_out 
 );

   wire           linear_feedback;
   
   assign linear_feedback = {((prg_out[7]^prg_out[5])^prg_out[4])^prg_out[3]};
   
   always@(posedge clk or negedge rst_n)
     begin
        if(!rst_n)
	        prg_out <= 8'hFC;
        else
          prg_out <= {prg_out[6:0],linear_feedback};
     end
   
endmodule     
