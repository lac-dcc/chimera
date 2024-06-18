// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module data_memory (
    input [31:0] data_in,
    input [31:0] address,
    input Write_en, clk, rst,
    output [31:0] data_out
);

reg [31:0] data_mem [1023 : 0];

integer i;

always @(posedge clk) begin
    if (~rst)
        for(i = 0 ; i < 1024 ; i = i + 1)
            data_mem[i] = 0;
    else if(Write_en)
        data_mem[address[31:2]] <= data_in;
    end

assign data_out = data_mem[address[31:2]];

endmodule