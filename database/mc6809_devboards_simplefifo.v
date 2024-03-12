`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:13 11/09/2016 
// Design Name: 
// Module Name:    simplefifo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module simplefifo #(parameter ELEMENTWIDTH=8, ELEMENTDEPTHBITS=4)
(
    input wire  clk,
    input wire  reset,
    input  wire [ELEMENTWIDTH-1:0] DataWrite,
    input  wire WriteEnable,
    output reg  [ELEMENTWIDTH-1:0] DataRead,
    input wire  ReadEnable,
    output reg  Empty,
    output reg  Full
);

localparam ELEMENTDEPTH=2**ELEMENTDEPTHBITS;

reg [ELEMENTWIDTH-1:0] FIFO[ELEMENTDEPTH-1:0];
reg [ELEMENTDEPTHBITS-1:0] WriteIndex;
reg [ELEMENTDEPTHBITS-1:0] ReadIndex;

wire [ELEMENTDEPTHBITS-1:0] NextReadIndex;
assign NextReadIndex = ReadIndex+1'b1;
wire [ELEMENTDEPTHBITS-1:0] NextWriteIndex;
assign NextWriteIndex = WriteIndex+1'b1;


// Index == means empty
// Full is Write+1 == Read

always @(negedge clk)
begin
    if (reset)
    begin
        WriteIndex <= 1'b0;
        ReadIndex <= 1'b0;
        Empty <= 1'b1;
        Full <= 1'b0;
    end
    else
    begin
        // DataRead always reflects the next value to read
        DataRead <= FIFO[ReadIndex];
    
        // 4 cases
        // Not Read, Not Write
        // Read, Not Write
        // Write, not Read
        // Read and Write
        case ({WriteEnable,ReadEnable})
            2'b00: // Neither
            begin
            end
            2'b01: // Read, not write
            begin
                if (~Empty)
                begin
                    ReadIndex <= NextReadIndex;
                    Empty <= (NextReadIndex == WriteIndex);
                    Full <= 1'b0; // We just read a value, we didn't write one, it cannot be full.
                end
//                else
//                begin
//                    Empty <= (ReadIndex == WriteIndex);
//                    Full <= (NextWriteIndex == ReadIndex);
//                end
            end
            2'b10: // Write, not read
            begin
                if (~Full)
                begin
                    FIFO[WriteIndex] <= DataWrite;
                    WriteIndex <= NextWriteIndex;
                    Empty <= 1'b0; // We just wrote a value, it isn't empty
                    Full <= (NextWriteIndex == ReadIndex);
                end
            end
            2'b11: // Write and Read
            begin
                FIFO[WriteIndex] <= DataWrite;
                WriteIndex <= NextWriteIndex;
                ReadIndex <= NextReadIndex;
                // Empty and Full should remain whatever they were before.
            end
            
        endcase
    end
    
end



endmodule
