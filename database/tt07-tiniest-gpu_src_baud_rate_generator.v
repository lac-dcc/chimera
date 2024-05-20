// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0


//////////////////////////////////////////////////////////////////////////////////
// Reference Book: FPGA Prototyping By Verilog Examples Xilinx Spartan-3 Version
// Authored by: Dr. Pong P. Chu
// Published by: Wiley
//
// Adapted for the Basys 3 Artix-7 FPGA by David J. Marion
//
//
// Modify for the Tiny Tapeout ASIC by Pongsagon Vichitvejpaisal, 11 May 2024
//
// Baud Rate Generator for the UART System
//
// Comments:
// - Many of the variable names have been changed for clarity

// For 9600 baud with 100MHz FPGA clock: 
// 9600 * 16 = 153,600
// 100 * 10^6 / 153,600 = ~651      (counter limit M)
// log2(651) = 10                   (counter bits N) 
//
// For 115,200 baud with 100MHz FPGA clock:
// 115,200 * 16 = 1,843,200
// 100 * 10^6 / 1,843,200 = ~54     (counter limit M)
// log2(52) = 6     				(counter bits N)
// For 50MHz
// 50 * 10^6 / 1,843,200 = ~27     (counter limit M)
// log2(27) = 5     				(counter bits N)
//////////////////////////////////////////////////////////////////////////////////

//`timescale 1ns / 1ps


module baud_rate_generator
    #(              // 115,200 baud, clk = 100Mhz
        parameter   N = 6,     // number of counter bits
                    M = 54     // counter limit value
    )
    (
        input clk,       		// clk
        input reset,            // reset
        output tick             // sample tick
    );
    
    // Counter Register
    reg [N-1:0] counter;        // counter value
    wire [N-1:0] next;          // next counter value
    
    // Register Logic
    always @(posedge clk)
        if(reset)
            counter <= 0;
        else
            counter <= next;
            
    // Next Counter Value Logic
    assign next = (counter == (M-1)) ? 0 : counter + 1;
    
    // Output Logic
    assign tick = (counter == (M-1)) ? 1'b1 : 1'b0;
       
endmodule
