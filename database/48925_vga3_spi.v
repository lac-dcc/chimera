// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// SPI sampling receiver module

module spi (
    input wire Clk,
    input wire Sclk,
    input wire Mosi,
    input wire CSel,
    output reg ByteRecv,
    output reg[7:0] ByteOut
);

reg[2:0] SclkSample;
reg[2:0] CSelSample;
reg[1:0] MosiSample;

wire SclkRise = SclkSample[2:1] == 2'b01;
wire SclkFall = SclkSample[2:1] == 2'b10;

wire CSelActive = ~CSelSample[1];
wire CSelRise = CSelSample[2:1] == 2'b01;
wire CSelFall = CSelSample[2:1] == 2'b10;

wire MosiBit = MosiSample[1];

reg[2:0] BitCnt = 3'b000;

reg[7:0] Shift = 8'b00000000;

always @(posedge Clk) begin
    SclkSample <= { SclkSample[1:0], Sclk };
    CSelSample <= { CSelSample[1:0], CSel };
    MosiSample <= { MosiSample[0], Mosi };

    if (CSelFall) BitCnt <= 3'b000;
    else if (SclkRise) begin
        BitCnt <= BitCnt + 3'b001;
        Shift <= { Shift[6:0], MosiBit };
    end

    if (~CSelActive && (BitCnt == 3'b000)) begin
        ByteRecv <= 1'b1;
        ByteOut <= Shift;
    end else ByteRecv <= 1'b0;
end

endmodule
