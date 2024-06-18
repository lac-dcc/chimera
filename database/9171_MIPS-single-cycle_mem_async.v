// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

/*
asynchronous memory with 256 32-bit locations
for instruction memory
*/

module mem_async #(
    parameter S = 32, L = 256
) (
    input [$clog2(L) - 1:0] a,
    output [(S-1):0] d
);
    reg[S-1:0] memory[L-1:0];
    assign d = memory[a];

    initial $readmemh("meminstr.dat", memory);
endmodule