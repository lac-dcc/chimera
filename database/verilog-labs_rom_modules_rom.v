// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module rom #(parameter ADDR_WIDTH = 8, parameter DATA_WIDTH = 32)(
    
    /* Clocking signal */
    input wire clk,

    /* Input address lines */
    input wire [ADDR_WIDTH - 1:0]addr,
    
    /* Output data lines */
    output reg [DATA_WIDTH - 1:0]q
);

/* 2**ADDR_WIDTH memory cells DATA_WIDTH bites wide each */
reg [DATA_WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin

    /* Initialize memory with file contents */
    $readmemh("misc/rom_contents.txt", mem);

end

always @(posedge clk) begin

    /* Assign output data lines with data from requested addr each clk */
    q <= mem[addr];

end

endmodule

