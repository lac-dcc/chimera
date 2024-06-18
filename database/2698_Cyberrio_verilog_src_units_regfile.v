// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module regfile (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input clk,
    input [4:0] rs1_address,
    input [4:0] rs2_address,
    input [4:0] rd_address,
    input [31:0] rd_data,
    output reg [31:0] rs1_data,
    output reg [31:0] rs2_data
);

    // 32 registers, each 32 bits wide
    reg [31:0] registers [31:0];

    // Read data from the registers continuously
    always @(*) begin
        rs1_data = registers[rs1_address];
        rs2_data = registers[rs2_address];
    end

    // Write data to the registers on the rising edge of the clock
    // Note: Register 0 is hardwired to zero in RISC-V architecture, hence no data can be written into it
    always @(posedge clk) begin
        if(rd_address != 5'b00000) begin
            registers[rd_address] <= rd_data;
        end
    end
endmodule
