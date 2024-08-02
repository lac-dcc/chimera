// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

module alu(DATA1, DATA2, RESULT, SELECT,ZERO);
 //initializing the inputs and outputs
  input [31:0] DATA1, DATA2;
  input [2:0] SELECT;
  output reg [31:0] RESULT;
  output ZERO;  
 
 //creating the always block which runs whenever a input is changed
 always @(DATA1,DATA2,SELECT)
 begin
 //selecting based on the SELECT input using s switch case
 case(SELECT)
 3'b000: RESULT = DATA2; //Forward function
 3'b001: RESULT = DATA1 + DATA2; //Add and Sub function
 3'b010: RESULT = DATA1 & DATA2; //AND and Sub function
 3'b011: RESULT = DATA1 | DATA2; //OR and Sub function
 3'b100: // Doing Jump command to alter PC value, so ALU data is not really used
   RESULT = DATA2; //Send DATA2 out of the ALU when performing a Jump command (extra feature?)
 3'b101: RESULT = 32'h00000000; // Values of 101 and above are currrently unused
 3'b110: RESULT = 32'h00000000; 
 default:RESULT = 32'h00000000; 
 endcase 
 end
 
 // creating the ZERO bit using the alu result
assign ZERO = ~|RESULT;

endmodule
