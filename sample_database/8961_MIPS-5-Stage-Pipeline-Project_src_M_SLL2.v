// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License


module M_SLL2(input[31:0] a, output[31:0] y);
    // shift left by 2
    assign y = {a[29:0], 2'b00};
endmodule