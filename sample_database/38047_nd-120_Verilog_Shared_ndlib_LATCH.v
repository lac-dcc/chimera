// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : LATCH                                                        **
 **                                                                          **
 *****************************************************************************/

module LATCH(
      input wire D,
      input wire ENABLE,
      output reg Q,
      output reg QN );


  // Initialize Q and QN with opposite values
    initial begin
        Q = 1'b0;
        QN = 1'b1;
    end
 
   // LATCH
   always @* begin 
      if (ENABLE) begin
         Q = D; // When ENABLE is high, Q takes the value of the input
      end
      // When ENABLE is low, Q retains its value
      
      QN = ~Q; // Negate Q to get QN
   end

   

endmodule

