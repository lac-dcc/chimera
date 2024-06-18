// This program was cloned from: https://github.com/ccattuto/tt07-serial-charmatrix
// License: Apache License 2.0

module char_rom #(
    parameter DATA_WIDTH = 35,     // Width of ROM data (35 bits for each character)
    parameter ADDR_WIDTH = 8,      // Address width
    parameter ADDR_MIN = 32,
    parameter ADDR_MAX = 126
)(
    input wire [ADDR_WIDTH-1:0] address,
    output wire [DATA_WIDTH-1:0] data
);

reg [DATA_WIDTH-1:0] mem [0:ADDR_MAX-ADDR_MIN+1];

initial begin
    $readmemb("font.bin", mem);  // load char bitmaps from file
end

assign data = (address >= ADDR_MIN && address <= ADDR_MAX) ? mem[address-ADDR_MIN] : mem[ADDR_MAX-ADDR_MIN+1];

endmodule
