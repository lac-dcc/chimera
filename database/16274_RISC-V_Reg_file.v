// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module Reg_file (
    input [4:0] address_read_a, address_read_b, Address_write,
    input [31:0] data_write,
    input clk, W_en, rst,
    output [31:0] data_out_a, data_out_b
);
    
reg [31:0] Register_file [31:0];
 
integer i;

always @(posedge clk) begin
    if (~rst)
        for(i = 0 ; i < 32 ; i = i +1)
            Register_file[i] = 0;
    else if (W_en)
        Register_file[Address_write] <= data_write;
end

assign data_out_a = Register_file[address_read_a];
assign data_out_b = Register_file[address_read_b];
endmodule