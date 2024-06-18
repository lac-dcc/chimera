// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// Video Command receiver, write address generator - version 2
// C/D - command = 0, data = 1  on DataModeEnable

module vcmdv2 #(
    parameter AWIDTH = 18,
    parameter DWIDTH = 8
) (
    input wire ByteClkIn,
    input wire DataModeEnable,
    input wire[DWIDTH-1:0] ByteIn,

    output wire DataClkOut,
    output wire[AWIDTH-1:0] AddrOut
);

localparam SWIDTH = 3;
localparam PGPARTSIZE = AWIDTH - 16;

// TODO finish vcmd data

localparam Noop = 8'h00;
localparam SetAddr = 8'h01;

localparam ReadCmdId = 4'h0;
localparam SetAddrPage = 4'h5;
localparam SetAddrHigh = 4'h6;
localparam SetAddrLow = 4'h7;

reg[AWIDTH-1:0] NextAddr = 1'b0;
reg[AWIDTH-1:0] ReadAddr = 1'b0;

reg[SWIDTH-1:0] State = 1'b0;

assign DataClkOut = ByteClkIn & DataModeEnable;
assign AddrOut = NextAddr;

always @(posedge ByteClkIn) begin
    if (DataModeEnable) NextAddr <= NextAddr + 1'b1;
    else begin
        case (State)
            ReadCmdId: begin
                    case (ByteIn)
                    Noop: State <= ReadCmdId;
                    SetAddr: State <= SetAddrPage;
                endcase
                end
            SetAddrPage: begin
                ReadAddr[AWIDTH-1:16] <= ByteIn[PGPARTSIZE-1:0];
                State <= SetAddrHigh;
            end
            SetAddrHigh: begin
                ReadAddr[15:8] <= ByteIn;
                State <= SetAddrLow;
            end
            SetAddrLow: begin
                ReadAddr[7:0] <= ByteIn;
                NextAddr <= ReadAddr;		  
                State <= ReadCmdId;
            end
            default: State <= ReadCmdId;
        endcase
    end
end

endmodule
