// This program was cloned from: https://github.com/ccattuto/tt07-serial-charmatrix
// License: Apache License 2.0

module color_rom #(
    parameter DATA_WIDTH = 24,     // Width of ROM data
    parameter ADDR_WIDTH = 4       // Address width
)(
    input wire [ADDR_WIDTH-1:0] address,
    input wire [1:0] dimmer,
    output wire [DATA_WIDTH-1:0] data
);

reg [DATA_WIDTH-1:0] mem [0:2**ADDR_WIDTH-1];

wire [2:0] dimshift;
assign dimshift[0] = 0;
assign dimshift[2:1] = dimmer;

assign data =   (mem[address][23:16] >> dimshift) << 16 |
                (mem[address][15:8]  >> dimshift) << 8  |
                (mem[address][7:0]   >> dimshift);

initial begin
    mem[0] = 24'b000000001100110000000000;
    mem[1] = 24'b010011001100110000000000;
    mem[2] = 24'b100110011100110000000000;
    mem[3] = 24'b110011001011001000000000;
    mem[4] = 24'b110011000110011000000000;
    mem[5] = 24'b110011000001100100000000;
    mem[6] = 24'b110011000000000000110011;
    mem[7] = 24'b110011000000000001111111;
    mem[8] = 24'b110011000000000011001100;
    mem[9] = 24'b011111110000000011001100;
    mem[10] = 24'b001100110000000011001100;
    mem[11] = 24'b000000000001100111001100;
    mem[12] = 24'b000000000110011011001100;
    mem[13] = 24'b000000001011001011001100;
    mem[14] = 24'b000000001100110010011001;
    mem[15] = 24'b000000001100110001001100;
end

endmodule
