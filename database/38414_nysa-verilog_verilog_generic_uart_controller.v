// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//UART Controller
/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
  07/08/2012
    -Initial Commit

  07/30/2012
    -Attached Flow control for CTS RTS
    -Removed DTR DSR for this initial version
*/
`timescale 1ns/1ps

//Status Flag Defines
`define STATUS_RX_AVAILABLE     0
`define STATUS_TX_READY         1
`define STATUS_RX_FULL          2
`define STATUS_RX_ERROR         3
`define STATUS_FC_ERROR         4

`define PRESCALER_DIV           8

module uart_controller #(
    parameter DEFAULT_BAUDRATE  = 115200
  )(
  input               clk,
  input               rst,

  input               rx,
  output              tx,

  //I need to verify flow control is correct
  output  reg         cts,
  input               rts,

  input               control_reset,
  input               cts_rts_flowcontrol,

  output      [31:0]  prescaler,
  input               set_clock_div,
  input       [31:0]  clock_div,
  output      [31:0]  default_clock_div,

  input               write_strobe,
  input       [7:0]   write_data,

  output              write_full,
  output      [31:0]  write_available,
  output      [31:0]  write_size,
  output              write_overflow,
              
  output      [7:0]   read_data,
  input               read_strobe,
  output              read_empty,
  output      [31:0]  read_count,
  output      [31:0]  read_size,
  output              read_overflow
);



//FIFO Registers

wire        [31:0]  tx_read_count;
reg                 tx_read_strobe;
wire        [7:0]   tx_fifo_read_data;
wire                tx_underflow;
wire                tx_full;
wire                tx_empty;

wire        [31:0]  rx_write_available;
wire                rx_underflow;
wire                rx_full;


//UART Core
reg                 transmit;
reg   [7:0]         tx_byte;
wire                received;
wire  [7:0]         rx_byte;

wire                is_receiving;
wire                is_transmitting;

wire                rx_error;

reg                 local_read;
wire                cts_rts_flowcontrol;
reg [3:0]           state;
reg                 test;


//CONTROL Flags
//STATUS FLAGs



uart_fifo uf_tx    (
  .clk             (clk                  ),
  .rst             (rst || control_reset ),

  .size            (write_size           ),

  .write_strobe    (write_strobe         ),
  .write_available (write_available      ),
  .write_data      (write_data           ),

  .read_strobe     (tx_read_strobe       ),
  .read_count      (tx_read_count        ),
  .read_data       (tx_fifo_read_data    ),
  .overflow        (write_overflow       ),
  .underflow       (tx_underflow         ),
  .full            (tx_full              ),
  .empty           (tx_empty             )
);

uart_fifo uf_rx (
  .clk             (clk                  ),
  .rst             (rst || control_reset ),

  .size            (read_size            ),

  .write_strobe    (received             ),
  .write_available (rx_write_available   ),
  .write_data      (rx_byte              ),

  .read_strobe     (read_strobe          ),
  .read_count      (read_count           ),
  .read_data       (read_data            ),
  .overflow        (read_overflow        ),
  .underflow       (rx_underflow         ),
  .full            (rx_full              ),
  .empty           (read_empty           )
);

//Low Level UART
uart #(
  .DEFAULT_BAUDRATE   (DEFAULT_BAUDRATE     )
) u(
  .clk                (clk                  ),
  .rst                (rst || control_reset ),
  .rx                 (rx                   ),
  .tx                 (tx                   ),
  .transmit           (transmit             ),
  .tx_byte            (tx_byte              ),
  .received           (received             ),
  .rx_byte            (rx_byte              ),
  .is_receiving       (is_receiving         ),
  .is_transmitting    (is_transmitting      ),
  .rx_error           (rx_error             ),
  .set_clock_div      (set_clock_div        ),
  .user_clock_div     (clock_div            ),
  .default_clock_div  (default_clock_div    ),
  .prescaler          (prescaler            )
);


parameter     IDLE  = 3'h0;
parameter     SEND  = 3'h1;
parameter     READ  = 3'h2;


//asynchronous logic
assign  write_full  = tx_full;


//synchronous logic

//main control state machine
always @ (posedge clk) begin
  if (rst) begin
    cts                           <=  0;
    state                         <=  IDLE;
    local_read                    <=  0;
    test                          <=  0;
    tx_read_strobe                <=  0;
    tx_byte                       <=  0;

  end
  else begin
    transmit                      <=  0;
    tx_read_strobe                <=  0;
    local_read                    <=  0;
    cts                           <=  0;


    if (tx_read_strobe) begin
      //$display ("UART_CONTROLLER: Setting tx_byte to %h", tx_fifo_read_data);
      tx_byte                     <=  tx_fifo_read_data;
      transmit                    <=  1;
    end

    //transmitting
//XXX: The write strobe is here to work around the condition when the user is writing and the UART is reading
//XXX: at the same time, this can be fixed with more logic
    if (!tx_empty && !is_transmitting && !transmit && !tx_read_strobe && !write_strobe) begin
      if (cts_rts_flowcontrol) begin
        if (~rts) begin
          $display ("WB_UC (%g): RTS is low", $time);
          //device is ready to receive data
          tx_read_strobe    <=  1;
        end
      end
//XXX: here is where DTR DSR can be put in
      else begin
        tx_read_strobe        <=  1;
      end
    end

    if (rx_full && cts_rts_flowcontrol) begin
      //deassert hardware flow control
      $display ("WB_UC (%g): CTS high", $time);
      cts                   <=  1;
    end
  end
end

endmodule
