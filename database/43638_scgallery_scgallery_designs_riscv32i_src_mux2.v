// This program was cloned from: https://github.com/siliconcompiler/scgallery
// License: Apache License 2.0

module mux2 #(parameter WIDTH = 8)
   (input wire  [WIDTH-1:0] d0, d1, 
    input wire              s, 
    output wire [WIDTH-1:0] y);

   assign y = s ? d1 : d0;
   
endmodule // mux2
