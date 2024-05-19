// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2016 Dave McCoy (dave.mccoy@cospandesign.com)

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

`define PKT_SIZE 6
`include "logic_analyzer_defines.v"

module uart_la_interface #(
    parameter DEFAULT_BAUDRATE  = 115200
)(

  input                       rst,
  input                       clk,

  output reg                  o_en_la,
  output reg                  o_la_reset,
  input                       i_finished,
  input       [31:0]          i_start_pos,
  output reg                  o_uart_set_value_stb,
  output reg                  o_force_trigger,

  //logic analyzer control
  output      [31:0]          o_trigger,
  output      [31:0]          o_trigger_mask,
  output      [31:0]          o_trigger_after,
  output      [31:0]          o_trigger_edge,
  output      [31:0]          o_both_edges,
  output      [31:0]          o_repeat_count,

  //data interface
  input       [31:0]          i_la_rd_size,
  output reg  [31:0]          o_la_rd_addr,
  input       [31:0]          i_la_rd_data,

  input                       i_phy_rx,
  output                      o_phy_tx
);

localparam  IDLE                  = 0;
localparam  READ_COMMAND          = 1;
localparam  READ_VALUE            = 2;
localparam  READ_ENABLE_SET       = 3;
localparam  READ_LINE_FEED        = 4;
localparam  SEND_RESPONSE         = 5;

localparam  TRIGGER               = 0;
localparam  TRIGGER_MASK          = 1;
localparam  TRIGGER_AFTER         = 2;
localparam  TRIGGER_EDGE          = 3;
localparam  BOTH_EDGES            = 4;
localparam  REPEAT_COUNT          = 5;

//UART Control
reg                         r_uart_wr_stb;
reg   [7:0]                 r_uart_wr_data;


reg   [3:0]                 r_index;

wire                        w_uart_rd_empty;
wire                        w_uart_rcv_stb;
wire  [7:0]                 w_uart_rd_data;
reg   [31:0]                r_uart_rd_count;


reg   [31:0]                r_packet_data[5:0];
reg   [31:0]                r_wr_pos;

//Register/Wires
reg   [3:0]                 rd_state = IDLE;
reg                         r_lcl_rst = 1;
reg   [3:0]                 wr_state = IDLE;

reg                         r_wr_en;
reg                         r_wr_fin;

reg   [7:0]                 r_cmd_rsps;
reg   [7:0]                 r_rsp_sts;


wire  [3:0]                 nibble;
wire  [7:0]                 hex_value;

reg   [7:0]                 r_command;
reg   [31:0]                r_value;

wire                        w_uart_wr_busy;

//submodules
uart #(
  .DEFAULT_BAUDRATE   (DEFAULT_BAUDRATE )
) uart (
  .clk               (clk               ),
  .rst               (rst               ),

  .tx                (o_phy_tx          ),
  .transmit          (r_uart_wr_stb     ),
  .tx_byte           (r_uart_wr_data    ),
  .is_transmitting   (w_uart_wr_busy    ),

  .rx                (i_phy_rx          ),
  .rx_byte           (w_uart_rd_data    ),
  .received          (w_uart_rcv_stb    ),

  .set_clock_div     (1'h0              )
);

//asynchronous logic
assign  hex_value               = (r_value[31:28]   >= 8'hA)  ? (r_value[31:28]   + 8'h37) : (r_value[31:28]    + 8'h30);
assign  nibble                  = (w_uart_rd_data >= 8'h41) ? (w_uart_rd_data - 8'h37) : (w_uart_rd_data  - 8'h30);
assign  valid_hex               = ((8'h41 <= w_uart_rd_data) && (w_uart_rd_data <= 8'h46)) ||
                                  ((8'h30 <= w_uart_rd_data) && (w_uart_rd_data <= 8'h39));

assign  o_trigger               = r_packet_data[TRIGGER];
assign  o_trigger_mask          = r_packet_data[TRIGGER_MASK];
assign  o_trigger_after         = r_packet_data[TRIGGER_AFTER];
assign  o_trigger_edge          = r_packet_data[TRIGGER_EDGE];
assign  o_both_edges            = r_packet_data[BOTH_EDGES];
assign  o_repeat_count          = r_packet_data[REPEAT_COUNT];


//UART Interface Controller
integer i;
always @ (posedge clk) begin
  //De-assert strobes
  r_wr_en                     <= 0;
  o_uart_set_value_stb        <= 0;
  o_la_reset                  <= 0;
  o_force_trigger             <= 0;

  if (rst || r_lcl_rst) begin
    o_en_la                   <= 0;
    r_index                   <= 0;

    rd_state                  <= IDLE;
    r_cmd_rsps                <= 0;
    r_command                 <= 0;
    r_rsp_sts                 <= 0;
    r_uart_rd_count           <= 0;
    for (i = 0; i < `PKT_SIZE; i = i + 1) begin
      r_packet_data[i]        <=  0;
    end
  end
  else begin
    //check if incomming UART is not empty
    case (rd_state)
      IDLE: begin
        r_uart_rd_count       <= 0;
        r_rsp_sts             <= 0;
        if (w_uart_rcv_stb && (w_uart_rd_data == `START_ID)) begin
          rd_state            <=  READ_COMMAND;
        end
      end
      READ_COMMAND: begin
        if (w_uart_rcv_stb) begin
          r_command             <=  w_uart_rd_data;
          case (w_uart_rd_data)
            `LA_PING: begin
              r_cmd_rsps      <=  `RESPONSE_SUCCESS;
              rd_state        <=  READ_LINE_FEED;
            end
            `LA_RESET: begin
              o_la_reset      <=  1;
              r_cmd_rsps      <=  `RESPONSE_SUCCESS;
              rd_state        <=  READ_LINE_FEED;
            end
            `LA_FORCE_TRIGGER: begin
              o_force_trigger <=  1;
              r_cmd_rsps      <=  `RESPONSE_SUCCESS;
              rd_state        <=  READ_LINE_FEED;
            end
            `LA_WRITE_TRIGGER: begin
              //disable the LA when updating settings
              o_en_la         <=  0;
              rd_state        <=  READ_VALUE;
              r_index         <=  TRIGGER;
            end
            `LA_WRITE_MASK: begin
              //disable the LA when updating settings
              o_en_la         <=  0;
              rd_state        <=  READ_VALUE;
              r_index         <=  TRIGGER_MASK;
            end
             `LA_WRITE_TRIGGER_AFTER: begin
              //disable the LA when updating settings
              o_en_la         <=  0;
              rd_state        <=  READ_VALUE;
              r_index         <=  TRIGGER_AFTER;
            end
             `LA_WRITE_TRIGGER_EDGE: begin
              //disable the LA when updating settings
              o_en_la         <=  0;
              rd_state        <=  READ_VALUE;
              r_index         <=  TRIGGER_EDGE;
            end
             `LA_WRITE_BOTH_EDGES: begin
              //disable the LA when updating settings
              o_en_la         <=  0;
              rd_state        <=  READ_VALUE;
              r_index         <=  BOTH_EDGES;
            end
             `LA_WRITE_REPEAT_COUNT: begin
              //disable the LA when updating settings
              o_en_la         <=  0;
              rd_state        <=  READ_VALUE;
              r_index         <=  REPEAT_COUNT;
            end
            `LA_SET_ENABLE: begin
              rd_state        <=  READ_ENABLE_SET;
            end
            `LA_GET_ENABLE: begin
              r_cmd_rsps      <=  `RESPONSE_SUCCESS;
              rd_state        <=  READ_LINE_FEED;
              r_rsp_sts <=  o_en_la + `HEX_0;
            end
            `LA_GET_START_POS: begin
              rd_state        <=  READ_LINE_FEED;
            end
            `LA_GET_SIZE: begin
              rd_state        <=  READ_LINE_FEED;
            end
            default: begin
              //unrecognized r_command
              r_cmd_rsps      <=  `RESPONSE_FAIL;
              rd_state        <=  READ_LINE_FEED;
            end
          endcase
        end
      end
      READ_VALUE: begin
        if (w_uart_rcv_stb) begin
          r_packet_data[r_index]    <= {r_packet_data[r_index][27:0], nibble};
          r_uart_rd_count           <= r_uart_rd_count +  1;
          if (r_uart_rd_count >= 7) begin
            o_uart_set_value_stb    <= 1;
            r_cmd_rsps              <= `RESPONSE_SUCCESS;
            rd_state                <= READ_LINE_FEED;
          end
          else if (!valid_hex) begin
            r_cmd_rsps              <= `RESPONSE_FAIL;
            rd_state                <= READ_LINE_FEED;
          end
        end
      end
      READ_ENABLE_SET: begin
        if (w_uart_rcv_stb) begin
          if (w_uart_rd_data == (0 + `HEX_0)) begin
            o_en_la                  <= 0;
            r_cmd_rsps               <= `RESPONSE_SUCCESS;
          end
          else if (w_uart_rd_data == (1 + `HEX_0)) begin
            o_en_la                  <= 1;
            r_cmd_rsps               <= `RESPONSE_SUCCESS;
          end
          else begin
            r_cmd_rsps               <= `RESPONSE_FAIL;
          end
          rd_state                   <= READ_LINE_FEED;
        end
      end
      READ_LINE_FEED: begin
        if (w_uart_rcv_stb) begin
          if (w_uart_rd_data == (`LINE_FEED)) begin
            rd_state                  <= SEND_RESPONSE;
          end
        end
      end
      SEND_RESPONSE: begin
        r_wr_en                       <= 1;
        if (r_wr_fin) begin
          r_wr_en                     <= 0;
          rd_state                    <= IDLE;
        end
      end
     default: begin
        rd_state                      <= IDLE;
      end
    endcase
    //write data back to the host
    if (wr_state == SEND_DATA_PACKET) begin
      o_en_la                         <= 0;
    end
  end
end

localparam  RESPONSE_WRITE_ID     = 1;
localparam  RESPONSE_WRITE_STATUS = 2;
localparam  RESPONSE_WRITE_ARG    = 3;
localparam  RESPONSE_WRITE_VALUE  = 4;
localparam  SEND_START_POS        = 5;
localparam  GET_DATA_PACKET       = 6;
localparam  SEND_DATA_PACKET      = 7;
localparam  SEND_CARRIAGE_RETURN  = 8;
localparam  SEND_LINE_FEED        = 9;
localparam  FINISHED              = 10;


//write data state machine
always @ (posedge clk) begin

  //Deassert Strobes
  r_uart_wr_stb                   <= 0;
  r_wr_fin                        <= 0;

  if (rst || r_lcl_rst) begin
    r_uart_wr_data                <= `CARRIAGE_RETURN;
    wr_state                      <= IDLE;
    o_la_rd_addr                  <= 0;
    r_wr_pos                      <= 0;
    r_lcl_rst                     <= 0;
  end
  else begin
    case (wr_state)
      IDLE: begin

        r_wr_pos                  <= 0;
        o_la_rd_addr              <= 0;
        if (r_wr_en) begin
          wr_state                <= RESPONSE_WRITE_ID;
        end

        else if ((rd_state == IDLE) && i_finished) begin
          wr_state                <= SEND_START_POS;
          r_value                 <= i_start_pos;
        end

      end
      RESPONSE_WRITE_ID: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_uart_wr_data          <= `RESPONSE_ID;
          r_uart_wr_stb           <= 1;
          wr_state                <= RESPONSE_WRITE_STATUS;
        end
      end
      RESPONSE_WRITE_STATUS: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_uart_wr_data          <= r_cmd_rsps;
          r_uart_wr_stb           <= 1;
          if (r_command       == `LA_GET_ENABLE) begin
            wr_state              <= RESPONSE_WRITE_ARG;
          end
          else if (r_command  == `LA_GET_SIZE) begin
            wr_state              <= RESPONSE_WRITE_VALUE;
            r_value               <= i_la_rd_size;
          end
          else if (r_command  == `LA_GET_START_POS) begin
            wr_state              <= RESPONSE_WRITE_VALUE;
            r_value               <= i_start_pos;
          end
          else begin
            wr_state              <= SEND_CARRIAGE_RETURN;
          end
        end
      end
      RESPONSE_WRITE_ARG: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_uart_wr_data          <= r_rsp_sts;
          r_uart_wr_stb           <= 1;
          wr_state                <= SEND_CARRIAGE_RETURN;
        end
      end
      RESPONSE_WRITE_VALUE: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_value                 <= {r_value[27:0], 4'h0};
          r_uart_wr_stb           <= 1;
          r_uart_wr_data          <= hex_value;
          r_wr_pos                <=  r_wr_pos + 1;
          if (r_wr_pos >= 7) begin
            wr_state              <=  SEND_CARRIAGE_RETURN;
          end
        end
      end
      //Write Data
      SEND_START_POS: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_value                 <= {r_value[27:0], 4'h0};
          r_uart_wr_stb           <= 1;
          r_uart_wr_data          <= hex_value;
          r_wr_pos                <= r_wr_pos + 1;
          if (r_wr_pos >= 7) begin
            wr_state              <= GET_DATA_PACKET;
          end
        end
      end
      GET_DATA_PACKET: begin
        r_value                   <= i_la_rd_data;
        r_wr_pos                  <= 0;
        o_la_rd_addr              <= o_la_rd_addr + 1;
        wr_state                  <= SEND_DATA_PACKET;
      end
      SEND_DATA_PACKET: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_value                 <= {r_value[27:0], 4'h0};
          r_uart_wr_stb           <= 1;
          r_uart_wr_data          <= hex_value;
          r_wr_pos                <= r_wr_pos + 1;
          if (r_wr_pos >= 7) begin
            if (o_la_rd_addr < i_la_rd_size) begin
              wr_state            <= GET_DATA_PACKET;
            end
            else begin
              wr_state            <= SEND_CARRIAGE_RETURN;
            end
          end
        end
      end
      SEND_CARRIAGE_RETURN: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_uart_wr_stb           <= 1;
          r_uart_wr_data          <= `CARRIAGE_RETURN;
          wr_state                <= SEND_LINE_FEED;
        end
      end
      SEND_LINE_FEED: begin
        if (!w_uart_wr_busy && !r_uart_wr_stb) begin
          r_uart_wr_stb           <= 1;
          r_uart_wr_data          <= `LINE_FEED;
          wr_state                <= FINISHED;
          r_wr_fin                <= 1;
        end
      end
      FINISHED: begin
        r_wr_fin                  <= 1;
        if (!r_wr_en) begin
          r_wr_fin                <= 0;
          wr_state                <= IDLE;
        end
      end
      default begin
        wr_state                  <= IDLE;
      end
    endcase
  end
end

endmodule
