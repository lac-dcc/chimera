// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module DATA_MEMORY
#(parameter DATA_WIDTH = 32,
  parameter ADD_WIDTH = 32,
  parameter DEPTH = 128
) (
    input clk, reset_n, write_enable,
    input [ADD_WIDTH - 1 : 0] address,
    input [DATA_WIDTH - 1 : 0] write_data,
    output reg[DATA_WIDTH - 1 : 0] read_data,
    output reg[DATA_WIDTH - 1 : 0] test_value
);

    integer i;
    reg [DATA_WIDTH - 1 : 0] data_mem [0 : DEPTH - 1];

    always @(posedge clk or negedge reset_n) begin

        if(!reset_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                data_mem[i] <= 32'b0;
            end
        end
        else if(write_enable) begin
            data_mem[address] <= write_data;
        end
    end

    always @(*) begin
        read_data = data_mem[address];
        test_value = data_mem[0];
    end

endmodule