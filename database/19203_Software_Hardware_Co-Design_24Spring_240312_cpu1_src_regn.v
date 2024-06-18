// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

//File name:regn.v
//Function:Register,posedge clock active.
//Author:Eric Liu
module regn(R,Rin,Clock,Q);
    parameter n = 6;
    input[n-1:0] R;
    input Rin,Clock;
    output[n-1:0] Q;
    reg [n-1:0] Q;

always @(posedge Clock)
    if(Rin) 
  Q <= R;
endmodule

