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
// - Version 1.1 20/03/19: Add Specific Description;
// - Version 1.2 20/03/20: Fix some errors;
// - Version 1.3 20/04/12: Edit.
//
// Notes:
// - <Problems>;
// - <Optimization Method>;
// - <Other Useful Info>.
//**********************************************************

module template(

  input wire clk,  // <Specific Description> 
  input wire rst_n,  // <Specific Description> 
  input wire input_variable_a,  // <Specific Description> 
  input wire input_variable_b,  // <Specific Description> 
  output reg output_variable_a  // <Specific Description> 

  );

  parameter IDLE <= 1'b0;  // <Specific Description> 

  wire input_variable_a;  // <Specific Description> 
  wire input_variable_b;  // <Specific Description> 

//
// This always part controls the signal output_variable_a, which is ...
//
  always @ ( posedge clk ) begin // One always part only controls one output signal
    if ( rst_n ) begin  // Both spaces are two <space>, and there is one <space> between "if" and the brackets. Don't use <Tab>.
      output_variable_a <= IDLE;
    end
    else begin
      case ( input_variable_a )  // Don't use casex, x and z
        1'b0: output_variable_a <= 1'b0;  // <Reason>
        1'b1: output_variable_a <= 1'b1;  // <Reason>
        default: output_variable_a <= IDLE;  // Don't forget default
      endcase
    end
  end

//  assign

endmodule