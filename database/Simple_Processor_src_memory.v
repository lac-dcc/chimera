// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

/*
    Module for Memory
*/

module data_memory(rw,location,out,data,clk);
input rw;
input clk;
input [31:0] data;
input [31:0] location;
output [31:0] out;
reg [31:0] output_buffer;
reg [31:0] memory [1023:0];
always @(*) begin
    if (rw==1'b0) begin
        output_buffer = memory[location];
    end    
    else if (rw==1'b1) begin
        memory[location] = data;
    end
end
assign out = output_buffer;
endmodule

module instruction_memory(read_address,out,clk);
input [31:0] read_address;
input clk;
reg [31:0] output_buffer;
reg [31:0] memory [1023:0];
output [31:0] out;

initial begin
    /*
    add x1 x2 x3
    sub x1 x2 x4
    and x4 x1 x5
    sll x6 x1 x2
    slt x9 x0 x1
    sw x6 1(x0)
    lw x15 1(x0)
    or x8 x1 x15
    */
    memory[0] <= 32'b00000000001100010000000010110011;
    memory[1] <= 32'b01000000010000010000000010110011;
    memory[2] <= 32'b00000000010100001000001000110011;
    memory[3] <= 32'b00000000001000001001001100110011;
    memory[4] <= 32'b00000000000100000010010010110011;
    memory[5] <= 32'b00000000011000000010000010100011;
    memory[6] <= 32'b00000000000100000010011110000011;
    memory[7] <= 32'b00000000111100001110010000110011;

    //smemory[3] = 32'b10000000001100010000000010110011;
end

always @(*) begin
    output_buffer <= memory[read_address];
    $display("instruction_fetched = %b",output_buffer);
end
assign out = output_buffer;
endmodule

