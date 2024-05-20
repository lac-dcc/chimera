// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module ram_512x32 (
    input wire clk,          // Clock
    input wire [8:0] addr,   // Address bus, 9 bits for 512 locations
    input wire [31:0] data_in,   // 32-bit data input
    input wire write_enable,           // Write enable
    output reg [31:0] data_out  // 32-bit data output
);

    // RAM storage
    reg [31:0] memory [0:511]; // 512 x 32-bit memory

    initial begin
        $readmemh("ram_data.mif", memory);
    end

    // Write operation
    always @(posedge clk) begin
        if (write_enable) begin
            memory[addr] <= data_in;  // Write data into memory at addr
        end
    end

    // Read operation
    always @(posedge clk) begin
        data_out <= memory[addr]; // Read data from memory at addr
    end

endmodule
