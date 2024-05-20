// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

/* Register Unit
General purpose registers R0, R1, R2 and R3
*/

module Register_Unit #(
    parameter word_size = 8
) (
    // Ri_out
    output reg [word_size-1: 0] data_out,
    // data_in := Bus_2
    input [word_size-1: 0] data_in,
    // load := load_Ri
    input load,
    input clk, rst
);
    always @ (posedge clk or negedge rst)
        if (rst == 0) 
            data_out <= 0; 
        else if (load) 
            data_out <= data_in;
endmodule

