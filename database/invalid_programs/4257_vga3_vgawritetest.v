// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps
`include "vga.v"

module vgawritetest;

    // Inputs
    reg MainClk;
    reg Sclk;
    reg Mosi;
    reg CSel;

    // Outputs
    wire [18:0] MemAddr;
    wire MemWE;
    wire MemOE;
    wire [5:0] ColorOut;
    wire HSyncOut;
    wire VSyncOut;
    
    reg [9:0] Cnt = 1'b0;

    // Bidirs
    wire [7:0] MemData;
    assign MemData = MemWE ? Cnt[2 +: 8] : 8'bzzzz_zzzz;

    // Instantiate the Unit Under Test (UUT)
    vga UUT (
        .MainClk(MainClk), 
        .MemAddr(MemAddr), 
        .MemData(MemData), 
        .MemWE(MemWE), 
        .MemOE(MemOE), 
        .ColorOut(ColorOut), 
        .HSyncOut(HSyncOut), 
        .VSyncOut(VSyncOut), 
        .Sclk(Sclk), 
        .Mosi(Mosi), 
        .CSel(CSel)
    );
    
    task send_byte(input time PulseTime, input [7:0] Byte);
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
    
    initial begin
        // Initialize Clock
        MainClk = 0;
        forever #5 MainClk = ~MainClk;
    end

    initial begin
        // Initialize Inputs
        Sclk = 0;
        Mosi = 0;
        CSel = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        // Very fast SPI clock (100MHz)
        send_byte(10, 8'b11000000);
        send_byte(10, 8'b11000000);
        send_byte(10, 8'b11000000);
        
        // Small delay between next pixel write
        #160;
        
        // Another byte at next location
        send_byte(10, 8'b00000011);
        send_byte(10, 8'b00000011);
        send_byte(10, 8'b00000011);
    end
    
    always @(posedge MainClk) Cnt = Cnt + 1'b1;
      
endmodule

