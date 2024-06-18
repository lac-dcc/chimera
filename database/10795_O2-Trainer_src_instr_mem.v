// This program was cloned from: https://github.com/skerr92/O2-Trainer
// License: MIT License

`default_nettype none
module i_mem(input wire clk,
             input wire we, 
             input wire [5:0] addr, 
             input wire [7:0] d_in, 
             output reg [7:0] d_out);

    reg [7:0] instr_mem [63:0];

    initial begin
        instr_mem[0] = 8'b01000001;
        instr_mem[1] = 8'b01000110;
        instr_mem[2] = 8'b01001011;
        instr_mem[3] = 8'b01001101;
        instr_mem[4] = 8'b00000111;
        instr_mem[5] = 8'b00000001;
        instr_mem[6] = 8'b00001001;
        instr_mem[7] = 8'b00001011;
        instr_mem[8] = 8'b10_0000_11;
        instr_mem[9] = 8'b10_0001_01;
        instr_mem[10] = 8'b10_1011_11;
        instr_mem[11] = 8'b10_1100_11;
        instr_mem[12] = 8'b10_0111_11;
        instr_mem[13] = 8'b11_00_1000;
        instr_mem[14] = 8'b11_01_1011;
        instr_mem[15] = 8'b11_10_0111;

    end

    always @(posedge clk) begin 
        if (we) begin 
            instr_mem[addr] <= d_in;
        end
        d_out <= instr_mem[addr];
    end

endmodule