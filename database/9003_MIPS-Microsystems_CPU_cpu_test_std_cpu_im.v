// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module im(
    input [31:0] addr,
    output [31:0] Instr
);

    reg [31:0] rom[4095:0];
    integer i;
    wire [31:0] im_addr;

    initial begin
        for (i = 0; i<4096; i=i+1) begin
            rom[i] = 32'h0000_0000;
        end
        $readmemh("code.txt", rom);
        $readmemh("code_handler.txt",rom,1120,2047);
    end

    assign im_addr = addr - 32'h0000_3000;
    assign Instr = rom[im_addr[13:2]];

endmodule // im