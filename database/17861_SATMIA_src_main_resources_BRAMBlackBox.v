// This program was cloned from: https://github.com/KindlyAccept/SATMIA
// License: MIT License

module BRAMLikeMem1 #(
    parameter integer DATA = 36,
    parameter integer ADDR = 16
) (
    input   wire               clock,
    // Port A
    input   wire                io_enable_1,
    input   wire                io_write_1,
    input   wire    [ADDR-1:0]  io_addr_1,
    input   wire    [DATA-1:0]  io_dataIn_1,
    output  reg     [DATA-1:0]  io_dataOut_1,
    // Port B
    input   wire                io_enable_2,
    input   wire                io_write_2,
    input   wire    [ADDR-1:0]  io_addr_2,
    input   wire    [DATA-1:0]  io_dataIn_2,
    output  reg     [DATA-1:0]  io_dataOut_2
);
// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];
// Port A
always @(posedge clock) begin
    io_dataOut_1      <= mem[io_addr_1];
    if(io_write_1 & io_enable_1) begin
        io_dataOut_1   <= io_dataIn_1;
        mem[io_addr_1] <= io_dataIn_1;
    end
end
// Port B
always @(posedge clock) begin
    io_dataOut_2    <= mem[io_addr_2];
    if(io_write_2 & io_enable_2) begin
        io_dataOut_2   <= io_dataIn_2;
        mem[io_addr_2] <= io_dataIn_2;
    end
end
endmodule