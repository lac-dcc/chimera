// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

/* D flip-flop 
Reg_Z to store the Zflag
*/

module D_flop (
    // data_in := Zflag
    output reg  data_out,
    // data_out := all_zero_flag
    input   data_in, load, clk, rst
);
    always @ (posedge clk or negedge rst)
        if (rst == 0) 
            data_out <= 0; 
        else if (load == 1)
            data_out <= data_in;
endmodule