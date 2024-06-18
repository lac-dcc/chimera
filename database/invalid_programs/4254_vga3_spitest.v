// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps
`include "spi.v"

module spitest;

    // Inputs
    reg Clk = 1'b0;
    reg Sclk = 1'b0;
    reg Mosi = 1'b0;
    reg CSel = 1'b1;

    // Outputs
    wire DataRecv;
    wire [7:0] DataOut;
    
    // 250 MHZ clock for sampling
    initial forever #2 Clk <= ~Clk;

    // Instantiate the Unit Under Test (UUT)
    spi UUT (
        .Clk(Clk),
        .Sclk(Sclk), 
        .Mosi(Mosi), 
        .CSel(CSel), 
        .ByteRecv(DataRecv), 
        .ByteOut(DataOut)
    );
    
    task send_byte(input time PulseTime, input[7:0] Byte);
        begin
            CSel = 1'b0;
            // for (j = 0; j < 8; j = j + 1)
            #PulseTime;
            send_pulse(PulseTime, (Byte>>7) & 1);
            send_pulse(PulseTime, (Byte>>6) & 1);
            send_pulse(PulseTime, (Byte>>5) & 1);
            send_pulse(PulseTime, (Byte>>4) & 1);
            send_pulse(PulseTime, (Byte>>3) & 1);
            send_pulse(PulseTime, (Byte>>2) & 1);
            send_pulse(PulseTime, (Byte>>1) & 1);
            send_pulse(PulseTime, (Byte>>0) & 1);
            Sclk = 1'b0;
            #PulseTime;
            CSel = 1'b1;
            #PulseTime;
        end
    endtask
    
    task send_pulse(input time PulseTime, input Data);
        begin
            Mosi = Data;
            Sclk = 1'b0;
            #PulseTime;
            Sclk = 1'b1;
            #PulseTime;
        end
    endtask

    // frequency = 500 / SpiDelay MHz
    localparam SpiDelay = 40; // ns

    initial begin
        // wait 100 ns for global reset to finish
        #100;
        
        send_byte(SpiDelay, 8'b01000001);
        send_byte(SpiDelay, 8'b11000000);
        send_byte(SpiDelay, 8'b11000000);
        send_byte(SpiDelay, 8'b11000000);
    
        // wait 0.5us between transfers
        #500;
        
        send_byte(SpiDelay, 8'b01000001);
        send_byte(SpiDelay, 8'b11000000);
        send_byte(SpiDelay, 8'b11000000);
        send_byte(SpiDelay, 8'b11000000);
    end
      
endmodule

