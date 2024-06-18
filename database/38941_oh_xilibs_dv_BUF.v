// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License


module BUF (O, I);


`ifdef XIL_TIMING

    parameter LOC = "UNPLACED";

`endif

    output O;
    input I;
    
    buf B1 (O, I);

endmodule

