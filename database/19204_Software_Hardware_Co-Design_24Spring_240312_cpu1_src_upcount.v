// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

//File:   upcount.v
//Function:   a counter for the instructions
//Author: Caojian
module upcount(Clear,Clock,Q);
    input Clear,Clock;
    output [1:0] Q;
    reg [1:0] Q;

    always @(posedge Clock)
          if (Clear)
               Q <= 2'b0;
          else
               Q <= Q+1'b1;
endmodule
