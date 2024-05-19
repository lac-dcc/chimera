// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License


// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// single read/write clock

module ram_dp_sc
#(parameter DATA_WIDTH=128, parameter ADDR_WIDTH=9)
(
    input [(DATA_WIDTH-1):0] data,
    input [(ADDR_WIDTH-1):0] read_addr, write_addr,
    input we, clk,
    output reg [(DATA_WIDTH-1):0] q
);

    // Declare the RAM variable
    reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

    always @ (posedge clk)
    begin
        // Write
        if (we)
            ram[write_addr] <= data;

        // Read (if read_addr == write_addr, return OLD data).  To return
        // NEW data, use = (blocking write) rather than <= (non-blocking write)
        // in the write assignment.  NOTE: NEW data may require extra bypass
        // logic around the RAM.
        q <= ram[read_addr];
    end

endmodule
