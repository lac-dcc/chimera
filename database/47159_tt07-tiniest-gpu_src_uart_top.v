// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0


//////////////////////////////////////////////////////////////////////////////////
// Reference Book: FPGA Prototyping By Verilog Examples Xilinx Spartan-3 Version
// Authored by: Dr. Pong P. Chu
// Published by: Wiley
//
// Adapted for the Basys 3 Artix-7 FPGA by David J. Marion
//
// Modify for the Tiny Tapeout ASIC by Pongsagon Vichitvejpaisal, 11 May 2024
//
// Top Module for the read only UART System
//
// Comments:
// - Many of the variable names have been changed for clarity
//////////////////////////////////////////////////////////////////////////////////
//`timescale 1ns / 1ps


module uart_top
    #(
        parameter   DBITS = 8,          // number of data bits in a word
                    SB_TICK = 16       // number of stop bit / oversampling ticks
    )
    (
        input clk,               		// clock
        input reset,                    // reset
        input rx,                       // serial data in
        output [DBITS-1:0] rx_data_out, // data to Rx FIFO
		output rx_done_tick
    );
    
    // Connection Signals
    wire tick;                          // sample tick from baud rate generator
    
    // Instantiate Modules for UART Core
    baud_rate_generator 
        BAUD_RATE_GEN   
        (
            .clk(clk), 
            .reset(reset),
            .tick(tick)
         );
    
    uart_receiver
        #(
            .DBITS(DBITS),
            .SB_TICK(SB_TICK)
         )
         UART_RX_UNIT
         (
            .clk(clk),
            .reset(reset),
            .rx(rx),
            .sample_tick(tick),
            .data_ready(rx_done_tick),
            .data_out(rx_data_out)
         );
    
  
endmodule

