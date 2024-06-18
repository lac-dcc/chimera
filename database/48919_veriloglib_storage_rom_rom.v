// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module rom
#(
    parameter WIDTH = 8,
    parameter DEPTH = 2**4
)
(
    input clk, 
    input rst_n,
    input en,
    input [$clog2(DEPTH)-1:0] addr,
    output reg [WIDTH-1:0] data_out
);

    reg [WIDTH-1:0] mem [DEPTH];

    initial
        $readmemb("rom.dat", mem);

    always @(posedge clk or negedge rst_n)
        begin: rom_memory
            if(!rst_n)
                $readmemb("rom.dat", mem);  // Initialize memory with provided content
            else
                data_out <= mem[addr];
        end

    // The following async read would work but would not be implemented in FPGA block RAM
    // assign data_out <= mem[addr];

endmodule
