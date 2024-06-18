// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module gray2bin
#(
  parameter WIDTH = 4
 )
 (
  input [WIDTH - 1 : 0]  gray,
  output [WIDTH - 1 : 0] bin
 );

  genvar                  i;

  generate
    for(i=0; i<WIDTH; i=i+1)begin:wrap
      assign bin[i] = ^(gray>>i);
    end
  endgenerate
  
  
endmodule // gray2bin

  
