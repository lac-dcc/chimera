// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

`timescale 1ns / 1ps
// Documented Verilog UART
// Copyright (C) 2010 Timothy Goddard (tim@goddard.net.nz)
// Distributed under the MIT licence.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// Updated by Mohamed Shalan
//
//


`define VERIFY
module UART_SF (
    input [7:0]     tx_byte,           // The byte to send to PC.  Loaded into FIFO first
    input           clk,               // 
    input           rst,               // Synchronous active high reset logic
    input           rx,                // Serial RX signal from PC
    input           transmit,          // Signal to send a byte to the PC
    input           rx_fifo_pop,       // Pop the value out of RX FIFO
    input [10:0]    clock_divider,

    output [7:0]    rx_byte,          // First byte in FIFO that we have received
    output          tx,               // Signal from FPGA to PC for serial transmission
    output          busy,             // actively receiving or transmitting when this is high
    output          tx_fifo_full,     // The TX FIFO is full when asserted no more data can be transmitted.
    output          rx_fifo_empty,    // Asserted when the RX FIFO is not holding data
    output          rx_fifo_full,    
    output          tx_fifo_empty
);    

   reg              tx_fifo_pop;      // If there is byte to send and not sending pop a value from TX FIFO

   wire             is_receiving;           // From uart_inst of uart.v
   wire             is_transmitting;        // From uart_inst of uart.v
   wire             received;               // From uart_inst of uart.v
   wire             recv_error;             // From uart_inst of uart.v

   wire             rx_fifo_full;           // Asserted when RX FIFO is full
   wire [7:0]       rx_fifo_data_in;        // Byte from UART to RX FIFO
   wire             rx_fifo_pop;            // Pop a value from the RX FIFO
   wire             rx_fifo_empty;          // Asserted when the RX FIFO is empty

   wire [7:0]       tx_fifo_data_out;       // Byte from TX FIFO to UART
   wire             tx_fifo_full;           // Asserted when the TX FIFO is FULL
   wire             tx_fifo_empty;          // Asserted when the TX FIFO is EMPTY


   //assign irq = received || recv_error || rx_fifo_full || tx_fifo_empty;
   assign busy = is_receiving || is_transmitting;

   uart uart_inst(
                  // Outputs
                  .tx                   (tx),
                  .received             (received),
                  .rx_byte              (rx_fifo_data_in),
                  .is_receiving         (is_receiving),
                  .is_transmitting      (is_transmitting),
                  .recv_error           (recv_error),

                  // Inputs
                  .clk                  (clk),
                  .rst                  (rst),
                  .rx                   (rx),
                  .transmit             (tx_fifo_pop),
                  .tx_byte              (tx_fifo_data_out),
                  .clock_divider         (clock_divider)
                  );

   fifo #(.DATA_WIDTH(8))
   rx_fifo(
           // Outputs
           .DATA_OUT               (rx_byte),
           .FULL                   (rx_fifo_full),
           .EMPTY                  (rx_fifo_empty),
           // Inputs
           .CLK                    (clk),
           .RESET                  (rst),
           .ENABLE                 (1'b1),
           .FLUSH                  (1'b0),
           .DATA_IN                (rx_fifo_data_in),
           .PUSH                   (received),
           .POP                    (rx_fifo_pop));


   fifo #(.DATA_WIDTH(8))
   tx_fifo(
           // Outputs
           .DATA_OUT               (tx_fifo_data_out),
           .FULL                   (tx_fifo_full),
           .EMPTY                  (tx_fifo_empty),
           // Inputs
           .CLK                    (clk),
           .RESET                  (rst),
           .ENABLE                 (1'b1),
           .FLUSH                  (1'b0),
           .DATA_IN                (tx_byte),
           .PUSH                   (transmit),
           .POP                    (tx_fifo_pop));

   
    always @(posedge clk)
        if (rst) begin
            tx_fifo_pop <= 1'b0;
        end else begin
            tx_fifo_pop <= !is_transmitting & !tx_fifo_empty;
    end

endmodule // uart_fifo

module uart(
	    input 	 clk,               // The master clock for this module
	    input 	 rst,               // Synchronous reset.
	    input 	 rx,                // Incoming serial line
	    output 	 tx,                // Outgoing serial line
	    input 	 transmit,          // Signal to transmit
	    input [7:0]  tx_byte,       // Byte to transmit
	    input [10:0] clock_divider,
        output 	 received,          // Indicated that a byte has been received.
	    output [7:0] rx_byte,       // Byte received
	    output 	 is_receiving,      // Low when receive line is idle.
	    output 	 is_transmitting,   // Low when transmit line is idle.
	    output 	 recv_error         // Indicates error in receiving packet.

	    );

   //   parameter CLOCK_DIVIDE = 1302; // clock rate (50Mhz) / (baud rate (9600) * 4)
 // parameter CLOCK_DIVIDE = 109; // clock rate (50Mhz) / (baud rate (115200) * 4)
  //parameter CLOCK_DIVIDE = 217; // clock rate (100Mhz) / (baud rate (115200) * 4)

   // States for the receiving state machine.
   // These are just constants, not parameters to override.
   parameter RX_IDLE = 0;
   parameter RX_CHECK_START = 1;
   parameter RX_READ_BITS = 2;
   parameter RX_CHECK_STOP = 3;
   parameter RX_DELAY_RESTART = 4;
   parameter RX_ERROR = 5;
   parameter RX_RECEIVED = 6;

   // States for the transmitting state machine.
   // Constants - do not override.
   parameter TX_IDLE = 0;
   parameter TX_SENDING = 1;
   parameter TX_DELAY_RESTART = 2;

   reg [10:0] 		 rx_clk_divider;// = CLOCK_DIVIDE;
   reg [10:0] 		 tx_clk_divider;// = CLOCK_DIVIDE;

   reg [2:0] 		 recv_state = RX_IDLE;
   reg [5:0] 		 rx_countdown;
   reg [3:0] 		 rx_bits_remaining;
   reg [7:0] 		 rx_data;

   reg 			 tx_out = 1'b1;
   reg [1:0] 		 tx_state = TX_IDLE;
   reg [5:0] 		 tx_countdown;
   reg [3:0] 		 tx_bits_remaining;
   reg [7:0] 		 tx_data;

   assign received = recv_state == RX_RECEIVED;
   assign recv_error = recv_state == RX_ERROR;
   assign is_receiving = recv_state != RX_IDLE;
   assign rx_byte = rx_data;

   assign tx = tx_out;
   assign is_transmitting = tx_state != TX_IDLE;

   always @(posedge clk or posedge rst) begin
      if (rst) begin
         recv_state = RX_IDLE;
         tx_state = TX_IDLE;
         rx_clk_divider = clock_divider;
         tx_clk_divider = clock_divider;

      end
      
      // The clk_divider counter counts down from
      // the clock_divider constant. Whenever it
      // reaches 0, 1/16 of the bit period has elapsed.
      // Countdown timers for the receiving and transmitting
      // state machines are decremented.
      rx_clk_divider = rx_clk_divider - 1;
      if (!rx_clk_divider) begin
         rx_clk_divider = clock_divider;
         rx_countdown = rx_countdown - 1;
      end
      tx_clk_divider = tx_clk_divider - 1;
      if (!tx_clk_divider) begin
         tx_clk_divider = clock_divider;
         tx_countdown = tx_countdown - 1;
      end
      
      // Receive state machine
      case (recv_state)
        RX_IDLE: begin
           // A low pulse on the receive line indicates the
           // start of data.
           if (!rx) begin
              // Wait half the period - should resume in the
              // middle of this first pulse.
              rx_clk_divider = clock_divider;
              rx_countdown = 2;
              recv_state = RX_CHECK_START;
           end
        end
        RX_CHECK_START: begin
           if (!rx_countdown) begin
              // Check the pulse is still there
              if (!rx) begin
                 // Pulse still there - good
                 // Wait the bit period to resume half-way
                 // through the first bit.
                 rx_countdown = 4;
                 rx_bits_remaining = 8;
                 recv_state = RX_READ_BITS;
              end else begin
                 // Pulse lasted less than half the period -
                 // not a valid transmission.
                 recv_state = RX_ERROR;
              end
           end
        end
        RX_READ_BITS: begin
           if (!rx_countdown) begin
              // Should be half-way through a bit pulse here.
              // Read this bit in, wait for the next if we
              // have more to get.
              rx_data = {rx, rx_data[7:1]};
              rx_countdown = 4;
              rx_bits_remaining = rx_bits_remaining - 1;
              recv_state = rx_bits_remaining ? RX_READ_BITS : RX_CHECK_STOP;
           end
        end
        RX_CHECK_STOP: begin
           if (!rx_countdown) begin
              // Should resume half-way through the stop bit
              // This should be high - if not, reject the
              // transmission and signal an error.
              recv_state = rx ? RX_RECEIVED : RX_ERROR;
           end
        end
        RX_DELAY_RESTART: begin
           // Waits a set number of cycles before accepting
           // another transmission.
           recv_state = rx_countdown ? RX_DELAY_RESTART : RX_IDLE;
        end
        RX_ERROR: begin
           // There was an error receiving.
           // Raises the recv_error flag for one clock
           // cycle while in this state and then waits
           // 2 bit periods before accepting another
           // transmission.
           rx_countdown = 8;
           recv_state = RX_DELAY_RESTART;
        end
        RX_RECEIVED: begin
           // Successfully received a byte.
           // Raises the received flag for one clock
           // cycle while in this state.
           recv_state = RX_IDLE;
        end
      endcase
      
      // Transmit state machine
      case (tx_state)
        TX_IDLE: begin
           if (transmit) begin
              // If the transmit flag is raised in the idle
              // state, start transmitting the current content
              // of the tx_byte input.
              tx_data = tx_byte;
              // Send the initial, low pulse of 1 bit period
              // to signal the start, followed by the data
              tx_clk_divider = clock_divider;
              tx_countdown = 4;
              tx_out = 0;
              tx_bits_remaining = 8;
              tx_state = TX_SENDING;
           end
        end
        TX_SENDING: begin
           if (!tx_countdown) begin
              if (tx_bits_remaining) begin
                 tx_bits_remaining = tx_bits_remaining - 1;
                 tx_out = tx_data[0];
                 tx_data = {1'b0, tx_data[7:1]};
                 tx_countdown = 4;
                 tx_state = TX_SENDING;
              end else begin
                 // Set delay to send out 2 stop bits.
                 tx_out = 1;
                 tx_countdown = 8;
                 tx_state = TX_DELAY_RESTART;
              end
           end
        end
        TX_DELAY_RESTART: begin
           // Wait until tx_countdown reaches the end before
           // we send another transmission. This covers the
           // "stop bit" delay.
           tx_state = tx_countdown ? TX_DELAY_RESTART : TX_IDLE;
        end
      endcase
   end

endmodule

module fifo (/*AUTOARG*/
	     // Outputs
	     DATA_OUT, FULL, EMPTY,
	     // Inputs
	     CLK, RESET, ENABLE, FLUSH, DATA_IN, PUSH, POP
	     ) ;

   parameter DATA_WIDTH = 32;               // Width of input and output data
   parameter ADDR_EXP   = 3;                // Width of our address, FIFO depth is 2^^ADDR_EXP
   parameter ADDR_DEPTH = 2 ** ADDR_EXP;    // DO NOT DIRECTLY SET THIS ONE!
   
  
   input CLK;                           // Clock for all logic
   input RESET;                         // Synchronous Active High Reset
   input ENABLE;                        // When asserted (1'b1), this block is active
   input FLUSH;                         // When asserted (1'b1), the FIFO is dumped out and reset to all 0
   input [DATA_WIDTH - 1:0] DATA_IN;    // Input data stored when PUSHed
   input                    PUSH;       // When asserted (1'b1), DATA_IN is stored into FIFO
   input                    POP;        // When asserted (1'b1), DATA_OUT is the next value in the FIFO
   
   output [DATA_WIDTH - 1:0] DATA_OUT;  // Output data from FIFO
   output                    FULL;      // Asseted when there is no more space in FIFO
   output                    EMPTY;     // Asserted when there is nothing in the FIFO
   
   
   reg 			     EMPTY;
   reg 			     FULL;


   reg [DATA_WIDTH -1:0]     memory[0:ADDR_DEPTH-1];   // The memory for the FIFO
   reg [ADDR_EXP:0] 	     write_ptr;                // Location to write to
   reg [ADDR_EXP:0] 	     read_ptr;                 // Location to read from 
   
   wire [DATA_WIDTH-1:0]     DATA_OUT;          // Top of the FIFO driven out of the module
   wire [ADDR_EXP:0] 	     next_write_ptr;    // Next location to write to
   wire [ADDR_EXP:0] 	     next_read_ptr;     // Next location to read from
   wire 		     accept_write;      // Asserted when we can accept this write (PUSH)
   wire 		     accept_read;       // Asserted when we can accept this read (POP)
   
   
   assign next_write_ptr = (write_ptr == ADDR_DEPTH-1) ? 0  :write_ptr + 1;
   assign next_read_ptr  = (read_ptr  == ADDR_DEPTH-1) ? 0  :read_ptr  + 1;

   //
   // Only write if enabled, no flushing and not full or at the same time as a pop
   //
   assign accept_write = (PUSH && ENABLE && !FLUSH && !FULL) || (PUSH && POP && ENABLE);

   //
   // Only read if not flushing and not empty or at the same time as a push
   //
   assign accept_read = (POP && ENABLE && !FLUSH && !EMPTY) || (PUSH && POP && ENABLE);

   //
   // We are always driving the data out to be read.  Pop will move to the next location
   // in memory
   //
   assign DATA_OUT = (ENABLE) ? memory[read_ptr]: 'b0;
   
   
   // Write Pointer Logic
   //
   always @(posedge CLK)
     if (RESET) begin
        write_ptr <= 'b0;       
     end else if (ENABLE) begin
        if (FLUSH) begin
           write_ptr <= 'b0;       
        end else begin
           if (accept_write) begin
              write_ptr <= next_write_ptr;            
           end
        end        
     end else begin
        write_ptr <= 'b0;       
     end

   //
   // Read Pointer Logic
   //
   always @(posedge CLK)
     if (RESET) begin
        read_ptr <= 'b0;        
     end else if (ENABLE) begin
        if (FLUSH) begin
           read_ptr <= 'b0;        
        end else begin
           if (accept_read) begin
              read_ptr <= next_read_ptr;              
           end
        end     
     end else begin
        read_ptr <= 'b0;        
     end

   //
   // Empty Logic
   //
   always @(posedge CLK)
     if (RESET) begin
        EMPTY <= 1'b1;  
     end else if (ENABLE) begin
        if (FLUSH) begin
           EMPTY <= 1'b1;          
        end else begin
           if (EMPTY && accept_write) begin
              EMPTY <= 1'b0;          
           end
           if (accept_read && (next_read_ptr == write_ptr)) begin
              EMPTY <= 1'b1;          
           end
        end
     end else begin
        EMPTY <= 1'b1;   
     end

   //
   // Full Logic 
   //
   always @(posedge CLK)
     if (RESET) begin
        FULL <= 1'b0;   
     end else if (ENABLE) begin
        if (FLUSH) begin
           FULL <= 1'b0;        
        end else begin
           if (accept_write && (next_write_ptr == read_ptr)) begin
              FULL <= 1;
           end else if (FULL && accept_read) begin
              FULL <= 0;              
           end
        end
     end else begin
        FULL <= 1'b0;   
     end // else: !if(ENABLE)
   

   //
   // FIFO Write Logic
   //
   
   integer               i;   
   always @(posedge CLK)
     if (RESET) begin
        for (i=0; i< (ADDR_DEPTH); i=i+1) begin
           memory[i] <= 'b0;       
        end
     end else if (ENABLE) begin
        if (FLUSH) begin
           for (i=0; i< (ADDR_DEPTH); i=i+1) begin
              memory[i] <= 'b0;    
           end
        end
        else if (accept_write) begin
           memory[write_ptr] <= DATA_IN;           
        end
     end
   
   
endmodule 


`ifdef VERIFY

module uart_tb;

    reg [7:0] tx_byte;           // The byte to send to PC.  Loaded into FIFO first
   reg       clk;               // 50MHz free running clock
   reg       rst;               // Synchronous active high reset logic
   wire       rx;                // Serial RX signal from PC
   reg       transmit;          // Signal to send a byte to the PC
   reg       rx_fifo_pop;       // Pop the value out of RX FIFO
   reg [10:0] clock_divider = 50;     // clock rate/ (baud rate * 4)


   wire [7:0] rx_byte;          // First byte in FIFO that we have received
   wire       tx;               // Signal from FPGA to PC for serial transmission
   wire       irq;              // Receive or error or RX Full interrupt
   wire       busy;             // actively receiving or transmitting when this is high
   wire       tx_fifo_full;     // The TX FIFO is full when asserted no more data can be transmitted.
   wire       rx_fifo_empty;    // Asserted when the RX FIFO is not holding data

   reg [7:0] received_byte;
UART_SF uut (
   // Outputs
   .rx_byte(rx_byte), .tx(tx),/* .irq(irq),*/ .busy(busy), .tx_fifo_full(tx_fifo_full), .rx_fifo_empty(rx_fifo_empty),
   // Inputs
   .tx_byte(tx_byte), .clk(clk), .rst(rst), .rx(rx), .transmit(transmit), .rx_fifo_pop(rx_fifo_pop), .clock_divider(clock_divider)
   ) ;

assign rx = tx;

always #5 clk =  !clk;
initial begin
$dumpfile("simple_uart.vcd");
$dumpvars(0, uart_tb);
#100_000 $finish;
end

task uart_send (input[7:0] byte);
begin
    tx_byte = byte;
    #7;
    @(posedge clk);
    transmit = 1;
    @(posedge clk);
    transmit = 0;
end
endtask

task reset;
begin
    #100;
    @(posedge clk);
    rst = 1;
    #100;
    @(posedge clk);
    rst = 0;
    #100;
end
endtask

initial begin
    $dumpfile("simple_uart.vcd");
    $dumpvars(0, uart_tb);
end

initial begin
    clk = 0;
    rst = 0;
    transmit = 0;
    rx_fifo_pop = 0;

    reset;
    uart_send(8'h62);
    #100;
    uart_send(8'h55);
    #100;
    uart_send(8'hA5);
    #100;
    uart_send(8'hE7);
end

always @(posedge clk)
    if(irq) begin
        rx_fifo_pop <= 1;
        received_byte <= rx_byte;
    end
    else 
        rx_fifo_pop <= 0;


endmodule

`endif