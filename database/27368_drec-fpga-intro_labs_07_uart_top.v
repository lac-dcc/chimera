// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output TXD
);

reg [15:0]cnt = 24'b0;
reg [2:0]rom_addr = 3'b111;
reg uart_start = 1'b0;

always @(posedge CLK) begin
    if (cnt == 24'b0) begin
        rom_addr <= rom_addr + 3'b1;
        uart_start <= 1'b1;
    end
    else
        uart_start <= 1'b0;

    cnt <= cnt + 24'b1;
end

wire [7:0]uart_data;

rom rom(rom_addr, CLK, uart_data);

uart_tx uart_tx(CLK, uart_start, uart_data, TXD);

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output TXD
);

reg [15:0]cnt = 24'b0;
reg [2:0]rom_addr = 3'b111;
reg uart_start = 1'b0;

always @(posedge CLK) begin
    if (cnt == 24'b0) begin
        rom_addr <= rom_addr + 3'b1;
        uart_start <= 1'b1;
    end
    else
        uart_start <= 1'b0;

    cnt <= cnt + 24'b1;
end

wire [7:0]uart_data;

rom rom(rom_addr, CLK, uart_data);

uart_tx uart_tx(CLK, uart_start, uart_data, TXD);

endmodule
