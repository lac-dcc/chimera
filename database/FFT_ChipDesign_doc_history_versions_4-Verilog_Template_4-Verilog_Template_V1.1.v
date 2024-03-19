//**********************************************************
// Author: @<Type Your GitHub Account Here>, copyright 2020
// e-mail: <Type Your SJTU e-mail Address Here>
// School: Shanghai Jiao Tong University
//
// File Name: <The Same as module Name>
//
// Type: <Sequential or Combinational, etc.>
//
// Purpose: <Specific Function Description>
// 
//
// Details:
// - Design Logic;
// -Variable setting.
//
// Release History:
// - Version 1.0 20/03/19: Create;
// - Version 1.1 20/03/19: Add Specific Description.
//
// Notes:
// - <Problems>;
// - <Optimization Method>;
// - <Other Useful Info>.
//**********************************************************

module template(input_variable_a, input_variable_b, output_variable_a, clk, rst_n)

  input input_variable_a;  // <Specific Description> 
  input input_variable_b;  // <Specific Description> 

  output output_variable_a;  // <Specific Description>  

  parameter IDLE <= 1'b0;

  wire input_variable_a;
  wire input_variable_b;

  reg temp;  // All the output signals should use reg

  assign output_variable_a = temp;

//
// This always part controls the signal temp, which is ...
//
always @ (posedge clk) begin // One always part only controls one output signal
	if (rst_n) begin  // Both spaces are two <space>, and there is one <space> between "if" and the brackets. Don't use <Tab>.
		temp <= IDLE;
  end
  else
    case (input_variable_a)  // Don't use casex, x and z
      1'b0: temp <= 1'b0;  // <Reason>
      1'b1: temp <= 1'b0;  // <Reason>
      default: temp <= IDLE;  // Don't forget default
    endcase
  end
end

endmodule