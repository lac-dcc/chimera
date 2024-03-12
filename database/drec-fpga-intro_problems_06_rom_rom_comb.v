module rom_comb #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32)(
    input [2**ADDR_WIDTH - 1:0]addr,
    output [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin
    $readmemh("program.txt", mem);
end

assign q = mem[addr];

endmodule

