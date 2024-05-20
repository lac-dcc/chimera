// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_EQUAL(
    input[31:0] srca, writedata,
    output equalD);

    assign equalD = (srca==writedata);
    
endmodule