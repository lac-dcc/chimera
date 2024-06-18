// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab7_3

#(parameter DATA_WIDTH=4, parameter ADDR_WIDTH=6)

(
    input [(DATA_WIDTH-1):0] data_in,
    input [(ADDR_WIDTH-1):0] addr,
    input we, clk,
    output [(DATA_WIDTH-1):0] data_out,
    output [(ADDR_WIDTH-1):0] addr_out
);

    // Memory array and address register:
    reg [DATA_WIDTH-1:0] ram[0:2**ADDR_WIDTH-1];
    reg [ADDR_WIDTH-1:0] addr_reg;

    wire w_we = ~ we;
    wire w_clk = ~ clk;

    always @ (posedge w_clk)
    begin
        if (w_we)                      // write enable = 1
            ram[addr] <= data_in;      // write input data to memory

        addr_reg <= addr;              // latch address in internal register
    end

    assign data_out = ram[addr_reg];   // read data at latched address
    assign addr_out = addr_reg;        

endmodule
