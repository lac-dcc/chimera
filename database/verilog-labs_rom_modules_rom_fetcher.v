// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module rom_fetcher #(parameter ADDR_WIDTH = 8, parameter DATA_WIDTH = 32)(
    
    /* Clocking signal */
    input wire clk,
    
    /* Output data lines */
    output wire [DATA_WIDTH - 1:0]q
);

/* Current data address */
reg [ADDR_WIDTH - 1:0]addr = 0;

/* Read-Only memory */
rom #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) rom(.clk(clk), .addr(addr), .q(q));

always @(posedge clk) begin
    
    /* Increment data address till the end of address space */
    if (addr != 2**ADDR_WIDTH - 1)
        addr <= addr + 1;

end

endmodule

