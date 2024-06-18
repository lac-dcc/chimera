// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module IM (
    input wire [31:0] PC,
    output wire [31:0] Instruction
);
    /*
        Instruction Memory
        Address space: 0x00003000-0x00006FFF
    */
    reg [31:0] Mem [0:4095];
    wire [31:0] Addr;
    assign Addr = PC - 32'h00003000;
    initial begin
        $readmemh("code.txt", Mem);
    end
    assign Instruction = Mem[Addr[14:2]];
endmodule