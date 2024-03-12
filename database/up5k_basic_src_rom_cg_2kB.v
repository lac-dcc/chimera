// rom_cg_2kB.v - 2k byte ROM with video character generator contents
// 03-11-18 E. Brombaugh

module rom_cg_2kB(
    input clk,
    input [10:0] addr,
    output reg [7:0] dout
);
    reg [7:0] memory [0:2047];

    initial
        $readmemh("../src/chargen_2k.hex",memory);
    
    // synchronous read - FPGA can't do it async
    always @(posedge clk)
        dout <= memory[addr];
        
endmodule
