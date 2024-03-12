`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:12 11/06/2016 
// Design Name: 
// Module Name:    ps2_communication 
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
module ps2_communication(
    input           reset,
    input           clk,
    input           ps2clk,
    input           ps2dat,
    
    input           FIFOClock,
    input           FIFOReadAck,
    output [7:0]    FIFORead,
    output          FIFOFull,
    output          FIFOEmpty
    );

    
    reg             Done;
    reg             receiving;
    reg  [3:0]      bitNumber;
    reg  [7:0]      buffer;
    
    reg  [10:0]     constantCount=11'H000;
    reg             latchedClk=1'b0;
    reg             filteredClk=1'b0;
    
    reg     FIFOWrite;
    reg     LastDone;
    
    
    // MOVE DATA INTO FIFO
    
    // I'll admit that I'm using a crappy/lazy clock-domain crossing here for brevity.  
    // I know that the FIFOClock is much faster than the PS2 Clock & I'm going to get 
    // away with it & this is intended to demo the CPU only.  :)
    // Good lord, don't try to leverage this code for something else.  If you're 
    // desperate, ask me.
    always @(negedge FIFOClock)
    begin
        if (reset)
        begin
            FIFOWrite <= 1'b0;
            LastDone <= 1'b0;
        end
        else
        begin
            FIFOWrite <= 1'b0;
            if (Done != LastDone)
            begin
                if (~FIFOFull)
                begin
                    if (Done)
                        FIFOWrite <= 1'b1;
                end
                LastDone <= Done;
            end
        end        
    end
    
    // FILTER THE NOISY PS2 CLOCK TO SOMETHING WE CAN USE
    always @(negedge clk)
    begin
        if (ps2clk != latchedClk)
        begin
            latchedClk <= ps2clk;
            constantCount <= 11'H000;
        end
        else
        begin
            if (constantCount != 11'H01F)
            begin
                constantCount <= constantCount + 1'b1;
            end
            else
                filteredClk <= latchedClk;
        end
    end

    // ACTUALLY READ BYTES IN (NOT BOTHERING TO CHECK PARITY, SORRY)

    always @(negedge filteredClk)
    begin
        if (Done)
            Done <= 1'b0;
        if (reset)
        begin
            receiving <= 1'b0;
            Done <= 1'b0;
            bitNumber <= 4'H0;
        end
        else
        begin
            if (receiving)
            begin
                if (bitNumber == 4'HF)
                begin
                    receiving <= 0;
                    Done <= 1'b1;
                end
                else
                begin
                    buffer[~(bitNumber[2:0])] <= ps2dat;
                    bitNumber <= bitNumber-1'b1;
                end
            end
            else
            begin
                if (ps2dat == 1'b0) // start bit
                begin
                    receiving <= 1'b1;
                    bitNumber <= 4'H7;
                end
            end
        end
    end

simplefifo keyfifo(
                    .clk(FIFOClock),
                    .reset(reset),
                    .DataWrite(buffer),
                    .WriteEnable(FIFOWrite),
                    .DataRead(FIFORead),
                    .ReadEnable(FIFOReadAck),
                    .Full(FIFOFull),
                    .Empty(FIFOEmpty)
                    );

endmodule
