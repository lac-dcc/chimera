// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//uart_io_handler.v
/*
Distributed under the MIT licesnse.
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
  06/24/2012
    -Added host interface reset to reset the state machine
  12/16/2011
    -fixed a bug in the data output count where it was sending
    5 bits instead of 4
*/

//generalize the uart handler
`include "cbuilder_defines.v"
`define LINE_FEED             8'h0A

module uart_io_handler #(
  parameter BAUDRATE  = 115200
)(
  //input/output signals
  input               clk,
  input               rst,

  //input handler
  output reg          o_ih_ready,
  output              o_ih_reset,
  input               i_master_ready,

  output reg [31:0]   o_in_command,
  output reg [31:0]   o_in_address,
  output reg [31:0]   o_in_data,
  output reg [27:0]   o_in_data_count,


  //output handler
  output  reg         o_oh_ready,
  input               i_oh_en,

  input [31:0]        i_out_status,
  input [31:0]        i_out_address,
  input [31:0]        i_out_data,
  input [27:0]        i_out_data_count,

  output [31:0]       o_ih_debug,

  //these are the only thing that are different between xxx_io_handler
  input               i_phy_uart_in,
  output              o_phy_uart_out
);


//STATES
localparam IDLE             = 4'h0;
localparam READ_DATA_COUNT  = 4'h1;
localparam READ_CONTROL     = 4'h2;
localparam READ_ADDRESS     = 4'h3;
localparam READ_DATA        = 4'h4;
localparam WRITE_TO_MASTER  = 4'h5;

localparam WRITE_DATA_COUNT = 4'h1;
localparam WRITE_STATUS     = 4'h2;
localparam WRITE_ADDRESS    = 4'h3;
localparam WRITE_DATA       = 4'h4;
localparam SEND_DATA_TO_HOST= 4'h5;

localparam CHAR_L           = 8'h4C;

localparam CHAR_0           = 8'h30;
localparam CHAR_HEX_OFFSET  = 8'h37;
localparam CHAR_A           = 8'h41;
localparam CHAR_F           = 8'h46;
localparam CHAR_S           = 8'h53;

//Registers/Wires
reg     [3:0]       in_state;
reg     [3:0]       out_state;

reg     [3:0]       in_nibble_count;
reg     [3:0]       out_nibble_count;
reg     [15:0]      r_count;


wire    [15:0]      user_command;
wire                is_writing;
wire                is_reading;

reg     [7:0]       out_byte;
wire                in_byte_available;
wire    [7:0]       in_byte;
wire                uart_in_busy;
reg     [27:0]      in_data_count;

wire                uart_out_busy;
wire                uart_tx_ready;
reg                 uart_wr_stb;
reg                 oh_finished;

reg     [27:0]      li_out_data_count;
reg     [27:0]      li_out_data_count_buf;
reg     [27:0]      out_data_count;
reg     [27:0]      out_data_pos;
reg     [31:0]      li_out_data;
reg     [31:0]      li_out_status;
reg     [31:0]      li_out_address;

wire    [3:0]       in_nibble;
wire                illegal_value;

wire    [7:0]       gen_data_count;
wire    [7:0]       gen_status;
wire    [7:0]       gen_address;
wire    [7:0]       gen_data;


//Submodules
uart #(
  .DEFAULT_BAUDRATE   (BAUDRATE           ),
  .STOP_BITS          (2                  )
)uart(
  .clk                (clk                ),
  .rst                (rst                ),

  .tx                 (o_phy_uart_out     ),
  .transmit           (uart_wr_stb        ),
  .tx_byte            (out_byte           ),
  .is_transmitting    (uart_out_busy      ),

  .rx                 (i_phy_uart_in      ),
  .rx_error           (                   ),
  .rx_byte            (in_byte            ),
  .received           (in_byte_available  ),
  .is_receiving       (uart_in_busy       ),

  .set_clock_div      (1'b0               )
);

//Asynchronous Logic
assign user_command   =  o_in_command[15:0];
assign is_writing     =  (user_command == `COMMAND_WRITE);
assign is_reading     =  (user_command == `COMMAND_READ);
assign o_ih_reset     =  1'b0;
assign in_nibble      =  (in_byte >= CHAR_A) ? (in_byte - CHAR_HEX_OFFSET) :
                                               (in_byte - CHAR_0);
assign illegal_value  =   (in_byte < CHAR_0)                              ||
                         ((in_byte > CHAR_0 + 10) && (in_byte < CHAR_A))  ||
                          (in_byte > CHAR_F);

assign gen_data_count = (li_out_data_count_buf[27:24] < 8'hA) ? li_out_data_count_buf[27:24] + CHAR_0 :
                                                                li_out_data_count_buf[27:24] + CHAR_HEX_OFFSET;
assign gen_status     = (li_out_status[31:28] < 8'hA)         ? li_out_status[31:28]         + CHAR_0 :
                                                                li_out_status[31:28]         + CHAR_HEX_OFFSET;
assign gen_address    = (li_out_address[31:28] < 8'hA)        ? li_out_address[31:28]        + CHAR_0 :
                                                                li_out_address[31:28]        + CHAR_HEX_OFFSET;
assign gen_data       = (li_out_data[31:28] < 8'hA)           ? li_out_data[31:28]           + CHAR_0 :
                                                                li_out_data[31:28]           + CHAR_HEX_OFFSET;


assign  o_ih_debug[3:0]   = in_state;
assign  o_ih_debug[7:4]   = out_state;
assign  o_ih_debug[31:8]  = 24'h0;

//Synchronous Logic
//input handler
always @ (posedge clk) begin

  o_ih_ready                <= 0;

  if (rst) begin
    o_in_command            <= 32'h0000;
    o_in_address            <= 32'h0000;
    o_in_data               <= 32'h0000;
    in_state                <= IDLE;
    in_nibble_count         <= 4'h0;
    o_in_data_count         <= 27'h0;
    in_data_count           <= 0;
  end
  else begin
    //main state machine goes here
    case (in_state)
      IDLE: begin
        //putting this here lets master hold onto the data for
        //a longer time
        if (in_byte_available) begin
          if (in_byte == CHAR_L) begin
            //read the first of in_byte
            in_state            <= READ_DATA_COUNT;
            o_in_command        <= 32'h0000;
            o_in_address        <= 32'h0000;
            o_in_data           <= 32'h0000;
            o_in_data_count     <= 27'h000;
            in_data_count       <= 0;
            in_nibble_count     <= 4'h0;
          end
        end
      end
      READ_DATA_COUNT: begin
        if (in_byte_available) begin
          if (illegal_value) begin
            //invalid character go back to IDLE
            in_state            <= IDLE;
          end
          else begin
            //valid character
            o_in_data_count     <=  {o_in_data_count[23:0], in_nibble};
            in_nibble_count     <=  in_nibble_count + 1;
          end
        end
        if (in_nibble_count > 6) begin
          in_nibble_count       <= 4'h0;
          in_state              <= READ_CONTROL;
        end
      end
      READ_CONTROL: begin
        if (in_byte_available) begin
          if (illegal_value) begin
            in_state            <=  IDLE;
          end
          else begin
            o_in_command        <= {o_in_command[27:0], in_nibble};
            in_nibble_count     <=  in_nibble_count + 1;
          end
        end
        if (in_nibble_count > 7) begin
          in_state              <= READ_ADDRESS;
          in_nibble_count       <= 4'h0;
        end
      end
      READ_ADDRESS: begin
        //read the size
        if (in_byte_available) begin
          if (illegal_value) begin
            in_state            <= IDLE;
          end
          else begin
            o_in_address        <= {o_in_address[27:0], in_nibble};
            in_nibble_count     <= in_nibble_count + 1;
          end
        end
        if (in_nibble_count > 7) begin
          in_state              <= READ_DATA;
          in_nibble_count       <= 4'h0;
        end
      end
      READ_DATA : begin
        if (in_byte_available) begin
          if (illegal_value) begin
            in_state            <= IDLE;
          end
          else begin
            o_in_data           <= {o_in_data[27:0], in_nibble};
            in_nibble_count     <= in_nibble_count + 1;
          end
        end //if in byte available
        if (in_nibble_count > 7) begin
          in_state              <= WRITE_TO_MASTER;
          in_nibble_count       <= 4'h0;
          in_data_count         <= in_data_count + 1;
        end
      end
      WRITE_TO_MASTER: begin
        if (i_master_ready) begin
          o_ih_ready            <= 1;
          if (is_writing && (in_data_count < o_in_data_count)) begin
            in_state            <= READ_DATA;
          end
          else begin
            in_state            <= IDLE;
          end
        end
      end
      default: begin
          o_in_command          <= 8'h0;
          in_state              <= IDLE;
      end
     endcase
  end
end


//output handler
always @ (posedge clk) begin

  oh_finished               <= 0;
  uart_wr_stb               <= 0;
  o_oh_ready                <= 0;

  if (rst) begin
    out_state               <= IDLE;
    out_nibble_count        <= 4'h0;
    out_byte                <= 8'h0;
    li_out_data_count       <= 27'h0;
    li_out_data_count_buf   <= 27'h0;
    li_out_data             <= 32'h0;
    li_out_status           <= 32'h0;
    li_out_address          <= 32'h0;
    o_oh_ready              <= 0;
    out_data_count          <= 0;
    out_data_pos            <= 0;
  end

  else begin
    //don't do anything until the UART is ready
    if (!uart_wr_stb && !uart_out_busy) begin
      case (out_state)
        IDLE: begin
          out_byte            <= 8'h0;
          out_nibble_count    <= 4'h0;
          o_oh_ready          <= 1'h1;
          out_data_pos        <= 0;
          if (i_oh_en) begin
            //moved this outside because by the time it reaches this part, the out data_count is
            //changed
            li_out_status     <= i_out_status;
            li_out_address    <= i_out_address;
            li_out_data       <= i_out_data;

            out_byte          <= CHAR_S;
            out_state         <= WRITE_DATA_COUNT;
            o_oh_ready        <= 0;
            uart_wr_stb       <= 1;
          end
          else begin
            li_out_data_count     <= 0;
            li_out_data_count_buf <= i_out_data_count;
            out_data_count        <= i_out_data_count;
          end
        end
        WRITE_DATA_COUNT: begin
          out_byte                <=  gen_data_count;
          li_out_data_count_buf   <= li_out_data_count_buf[27:0] << 4;
          uart_wr_stb             <= 1;
          if (out_nibble_count >= 6) begin
            out_state             <= WRITE_STATUS;
            out_nibble_count      <= 4'h0;
          end
          else begin
            out_nibble_count    <= out_nibble_count + 1;
          end
        end
        WRITE_STATUS: begin
          out_byte            <=  gen_status;
          li_out_status       <= (li_out_status[31:0] << 4);
          uart_wr_stb         <= 1;
          if (out_nibble_count >= 7) begin
            out_state     <= WRITE_ADDRESS;
            out_nibble_count  <= 4'h0;
          end
          else begin
            out_nibble_count    <= out_nibble_count + 1;
          end

        end
        WRITE_ADDRESS: begin
          out_byte            <=  gen_address;
          li_out_address      <= (li_out_address[31:0] << 4);
          uart_wr_stb         <= 1;

          if (out_nibble_count >= 7) begin
            out_state     <= WRITE_DATA;
            out_nibble_count  <= 4'h0;
          end
          else begin
            out_nibble_count    <= out_nibble_count + 1;
          end

        end
        WRITE_DATA: begin
          out_byte              <=  gen_data;

          li_out_data           <= (li_out_data[28:0] << 4);
          uart_wr_stb           <= 1;
          out_nibble_count      <= out_nibble_count + 1;

          if (out_nibble_count >= 7) begin
            out_state           <= SEND_DATA_TO_HOST;
            out_data_pos        <= out_data_pos + 1;
            out_nibble_count    <= 4'h0;
          end
        end
        SEND_DATA_TO_HOST: begin
          if (out_data_pos < out_data_count) begin
            o_oh_ready            <=  1;
            if (i_oh_en && o_oh_ready) begin
              li_out_data         <= i_out_data;
              out_state           <= WRITE_DATA;
            end
          end
          else begin
            oh_finished           <= 1;
            out_state             <= IDLE;
          end
        end
        default: begin
            out_state <=  IDLE;
        end
      endcase
    end
  end
end


endmodule
