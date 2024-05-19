// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License

odule OBUFTDS_DCIEN (O, OB, DCITERMDISABLE, I, T);

    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";
   
    output O;
    output OB;

    input  DCITERMDISABLE;
    input  I;
    input  T;
   
endmodule
