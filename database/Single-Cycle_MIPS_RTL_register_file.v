// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module REGISTER_FILE
#(
    parameter DATA_WIDTH = 32,
    parameter REG_DEPTH = 32,
    parameter ADD_WIDTH = 5
) (
    input  wire clk, reset_n, write_enable,
    input  wire [ADD_WIDTH - 1 : 0]  read_address_1,read_address_2, write_address,
    input  wire [DATA_WIDTH - 1 : 0] write_data,
    output reg  [DATA_WIDTH - 1 : 0] read_data_1, read_data_2 
);

    reg [DATA_WIDTH - 1 : 0] reg_mem [0 : REG_DEPTH - 1];

    always @(*) begin
        read_data_1 = reg_mem[read_address_1];
        read_data_2 = reg_mem[read_address_2];
    end

    integer i;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (i = 0; i < REG_DEPTH; i = i + 1) begin
                reg_mem[i] <= 32'b0;
            end
        end
        else if (write_enable) begin
            reg_mem[write_address] <= write_data;
        end
    end

endmodule
