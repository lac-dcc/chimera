// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

/*Program_Counter
*/

module Program_Counter #(
    parameter word_size = 8
) (
    // count := PC_count
    output reg [word_size-1: 0] count,
    // data_in := Bus_2
    input [word_size-1: 0] data_in,
    input Load_PC,
    input Inc_PC,
    input clk, rst
);
    always @ (posedge clk or negedge rst)
        if(rst == 0) 
            count <= 0; 
        else if(Load_PC) 
            count <= data_in; 
        else if(Inc_PC) 
            count <= count +1;
endmodule