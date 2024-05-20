// This program was cloned from: https://github.com/theuppercaseguy/GIKI-Tapeout
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 10:23:01 PM
// Design Name: 
// Module Name: Top
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

module UART (
    input clk_in, rst_n, 
    input Transmit_btn,//push button used to transmit data
    input Tansmit_switch,
    input [7:0] data,//input data for transmitting
        
    input wire uart_rxd, // Receiver line for the receiver module
    
    output wire [7:0] rx_leds,
    output TxD,
    output uart_rx_break, // Did we get a BREAK message?
    output uart_rx_valid // Valid data recieved and available.
);

    wire clk;
//    ClockDivider CD(
//        .rst(rst_n),
//        .clk_100MHz(clk_in),  // Input clock at 100 MHz
//        .clk_50MHz(clk)    // Output clock at 50 MHz
//    );     
    assign clk = clk_in;

    wire Transmit_out;    
      
     debouncer_clock DB(
        .clk(clk ),  
        .PB(Transmit_btn), 
        .PB_state(Transmit_out)
      );

   
    // Store data in the buffer when Transmit_btn is pressed
    Transmitter T1(
          .clk(clk), 
          .rst_n(rst_n), 
          .Transmit( (Transmit_out | Tansmit_switch)),
          .data(data),
          
          .TxD(TxD)
          
          );

     
   ///////////////////////reciver/////////////////////////////////
     
   parameter CLK_HZ = 50000000; //need to be changed to 50mhz
   parameter BIT_RATE =   9600;
   parameter PAYLOAD_BITS = 8;
   
   wire [7:0]  uart_rx_data;
   
   reg  [PAYLOAD_BITS-1:0]  led_reg;
   assign      rx_leds = led_reg;
   
   
   always @(posedge clk) begin
       if(!rst_n) begin
           led_reg <= 8'hF0;
       end else if(uart_rx_valid) begin
           led_reg <= uart_rx_data[7:0];
       end
   end
   
       receiver #(
           .BIT_RATE(BIT_RATE),
           .PAYLOAD_BITS(PAYLOAD_BITS ),
           .CLK_HZ  (CLK_HZ  )
       ) i_uart_rx(
           .clk          (clk        ), // Top level system clock input.
           .resetn       (rst_n         ), // Asynchronous active low reset.
           .uart_rxd     (uart_rxd      ), // UART Recieve pin.
           .uart_rx_en   (1'b1          ), // Recieve enable
           .uart_rx_break(uart_rx_break ), // Did we get a BREAK message?
           .uart_rx_valid(uart_rx_valid ), // Valid data recieved and available.
           .uart_rx_data (uart_rx_data  )  // The recieved data.
   );
endmodule


