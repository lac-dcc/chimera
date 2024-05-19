// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : Adder                                                        **
 **                                                                          **
 *****************************************************************************/

module Adder( carryIn, carryOut, dataA, dataB, result );

   // Parameters are declared here
   parameter extendedBits = 1;
   parameter nrOfBits = 1;

   // Validate parameters
   initial begin
      if (nrOfBits <= 0) begin
         $display("Error: nrOfBits must be greater than 0.");
         $finish;
      end
      if (extendedBits <= 0) begin
         $display("Error: extendedBits must be greater than 0.");
         $finish;
      end
   end

   // Inputs using the parameters in their declarations
   input carryIn;
   input [nrOfBits-1:0] dataA;
   input [nrOfBits-1:0] dataB;

   // Outputs using the parameters in their declarations
   output reg carryOut;
   output reg [nrOfBits-1:0] result;

   // Combinational logic for addition
   always @* begin
      {carryOut, result} = dataA + dataB + carryIn;
   end

endmodule
