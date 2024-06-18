// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps
`include "spi.v"
`include "vcmdv2.v"

module vcmdv2test;

    // SPI 

    // Inputs
    reg Sclk;
    reg Mosi;
    reg CSel;

    // Outputs
    wire DataRecv;
    wire [7:0] DataOut;

    // Instantiate the Unit Under Test (UUT)
    spi SPI (
        .Sclk(Sclk), 
        .Mosi(Mosi), 
        .CSel(CSel), 
        .ByteRecv(DataRecv), 
        .ByteOut(DataOut)
    );
    
    task send_byte(input time PulseTime, input [7:0] Byte);
        begin
            CSel = 1'b0;
            send_pulse(PulseTime, (Byte>>7) & 1);
            send_pulse(PulseTime, (Byte>>6) & 1);
            send_pulse(PulseTime, (Byte>>5) & 1);
            send_pulse(PulseTime, (Byte>>4) & 1);
            send_pulse(PulseTime, (Byte>>3) & 1);
            send_pulse(PulseTime, (Byte>>2) & 1);
            send_pulse(PulseTime, (Byte>>1) & 1);
            send_pulse(PulseTime, (Byte>>0) & 1);
            CSel = 1'b1;
        end
    endtask
    
    task send_pulse(input time PulseTime, input Data);
        begin
            Mosi = Data;
            Sclk = 1'b1;
            #PulseTime;
            Sclk = 1'b0;
            #PulseTime;
        end
    endtask      

    // VCMD

    // Inputs
    reg [1:0] DataIndex;

    // Outputs
    wire DataClkOut;
    wire[17:0] CmdAddr;
    wire CmdDataRdy;

    // Instantiate the Unit Under Test (UUT)
    vcmdv2 #(
        .AWIDTH(18),
        .DWIDTH(8)
    ) UUT (
        .ByteClkIn(DataRecv), 
        .ByteIn(DataOut), 
        .DataModeEnable(1'b1),
        .DataClkOut(DataClkOut),
        .AddrOut(CmdAddr)
    );

    // frequency = 500 / SpiDelay MHz
    localparam SpiDelay = 10; // ns
    
    initial begin
        // Initialize Inputs
        Sclk = 0;
        Mosi = 0;
        CSel = 0;
        DataIndex = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        // Very fast SPI clock (50MHz)
        send_byte(SpiDelay, 8'b01000001);
        send_byte(SpiDelay, 8'b11000000);
        send_byte(SpiDelay, 8'b11000000);
        send_byte(SpiDelay, 8'b11000000);
        
        // Small delay between next pixel write
        #160;
        
        // Another byte at next location
        send_byte(SpiDelay, 8'b01000001);
        send_byte(SpiDelay, 8'b00000011);
        send_byte(SpiDelay, 8'b00000011);
        send_byte(SpiDelay, 8'b00000011);
    end
      
endmodule

