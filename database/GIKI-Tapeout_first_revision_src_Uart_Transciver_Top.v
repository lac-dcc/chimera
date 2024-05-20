// This program was cloned from: https://github.com/theuppercaseguy/GIKI-Tapeout
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 11:25:54 PM
// Design Name: 
// Module Name: Uart_Transciver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tt_um_Uart_Transciver(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    assign uio_oe = 8'b11111000;

    /*
        ui_in[7:0]  = inputdata;
        uo_out[7:0]  = output data for lights;

        uio_in[0] =  Transmit_btn;
        uio_in[1] =  Transmit_switch;
        uio_in[2] =  uart_rxd;

        uio_out[3] =  TxD;
        uio_out[4] =  uart_rx_break;
        uio_out[5] =  uart_rx_valid;
        uio_out[6] =  high;
        uio_out[7] =  high;
    */
    
    UART RX_TX(
        .clk_in(clk), 
        .rst_n(rst_n), 
        .data(ui_in),            //input data for transmitting
         
        .Transmit_btn(uio_in[0]),    //push button used to transmit data
        .Tansmit_switch(uio_in[1]),   //,
           
        .uart_rxd(uio_in[2]),        // Receiver line for the receiver module
        
        .rx_leds(uo_out),            //output lights to displau the recived data
        
        .TxD(uio_out[3]),            // transmit data pin, used to transmit data
        .uart_rx_break(uio_out[4]),   // Did we get a BREAK message?
        .uart_rx_valid(uio_out[5])    // Valid data recieved and available.
    );
    assign uio_out[0] = 1'b0;
    assign uio_out[1] = 1'b0;
    assign uio_out[2] = 1'b0;

    assign uio_out[6] = 1'b0;
    assign uio_out[7] = 1'b0;

endmodule
