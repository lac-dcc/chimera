// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module rom_fetcher #(parameter ADDR_WIDTH = 5, parameter DATA_WIDTH = 8)(
    
    /* Clocking signal */
    input wire clk,

    /* Iterate to next address */
    input wire next,

    /* Current data address */
    output reg [ADDR_WIDTH - 1:0]addr = 0
);

always @(posedge clk) begin
    
    /* Increment data address till the end of address space */
    if (next && addr != 2**ADDR_WIDTH - 1)
        addr <= addr + 1;
end

endmodule
