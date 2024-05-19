// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module( input a,b,c,output w,x,y,z );
    
    assign w = a; //assign statements are executed in parallel
    assign x = b;
    assign y = b;
    assign z = c;
endmodule
