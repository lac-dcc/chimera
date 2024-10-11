// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

/*
1 bit and for (branch & zero)
*/
module andm (
    input Branch, Zero,
    output PCsel
    );
    
    assign PCsel=Branch&Zero;

endmodule

