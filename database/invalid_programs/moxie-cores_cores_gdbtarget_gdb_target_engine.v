// gdbte.v - GDB Target Engine
//         - A Hardware Implementation of the GDB Remote Protocol
//
// Copyright (c) 2012, 2023  Anthony Green
//
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

`include "messages.vh"

module gdb_target_engine (/*AUTOARG*/
                          // Outputs
                          debug_o, tx_byte_o, tx_send_o, rx_read_o, gdb_ctrl_o, wb_dat_o,
                          wb_adr_o, wb_we_o, wb_cyc_o, wb_stb_o,
                          // Inputs
                          rst_i, clk_i, rx_byte_i, tx_ready_i, rx_available_i, wb_dat_i,
                          wb_sel_o, wb_ack_i
                          );

  // --- DEBUG ----------------------------------------------------
  output [7:0] debug_o;
  reg          debug_checksum_error = 0;
  reg          debug_ack = 0;

  // --- Clock and Reset ------------------------------------------
  input        rst_i, clk_i;

  // --- GDB Interface --------------------------------------------
  output reg [7:0] tx_byte_o;
  input [7:0]      rx_byte_i;
  input            tx_ready_i;
  output reg       tx_send_o = 1'b0;
  input            rx_available_i;
  output reg       rx_read_o = 1'b0;

  // --- CPU Interface --------------------------------------------
  output reg [1:0] gdb_ctrl_o = 2'b0;

  // --- Wishbone Bus Interconnect ------------------------------------
  input [15:0]     wb_dat_i;
  output [15:0]    wb_dat_o;
  output [31:0]    wb_adr_o;
  input [1:0]      wb_sel_o;
  output           wb_we_o;
  output           wb_cyc_o;
  output           wb_stb_o;
  input            wb_ack_i;

  // --- State machine states -----------------------------------------
  parameter        GDB_IDLE = 6'd0;
  parameter        GDB_READ_PACKET_START = 6'd1;
  parameter        GDB_READ_PACKET = 6'd2;
  parameter        GDB_READ_PACKET_WAIT = 6'd3;
  parameter        GDB_READ_PACKET_CHECKSUM1_WAIT = 6'd4;
  parameter        GDB_READ_PACKET_CHECKSUM1 = 6'd5;
  parameter        GDB_READ_PACKET_CHECKSUM2_WAIT = 6'd6;
  parameter        GDB_READ_PACKET_CHECKSUM2 = 6'd7;
  parameter        GDB_PACKET_PARSE_LEN1 = 6'd8;
  parameter        GDB_PACKET_SEND_NAK = 6'd9;
  parameter        GDB_PACKET_UNKNOWN_ERROR = 6'd10;
  parameter        GDB_SEND_MESSAGE = 6'd11;
  parameter        GDB_COMMAND_g = 6'd12;
  parameter        GDB_DELAY = 6'd13;
  parameter        GDB_SEND_MESSAGE_WAIT = 6'd14;
  parameter        GDB_START = 6'd15;
  parameter        GDB_DELAY1 = 6'd16;
  parameter        GDB_PACKET_SEND_ACK = 6'd17;
  parameter        GDB_PACKET_CHECK = 6'd18;
  parameter        GDB_PACKET_PARSE = 6'd19;
  parameter        GDB_PACKET_SEND_ACK_WAIT = 6'd20;
  parameter        GDB_COMMAND_interrupt = 6'd21;
  parameter        GDB_COMMAND_g_SEND_REGISTERS = 6'd22;
  parameter        GDB_COMMAND_g_FETCH_HIGH = 6'd23;
  parameter        GDB_COMMAND_g_FETCH_LOW = 6'd24;
  parameter        GDB_COMMAND_g_SEND_WORD = 6'd25;
  parameter        GDB_SEND_HEXBYTE = 6'd26;
  parameter        GDB_PACKET_SEND_NAK_WAIT = 6'd27;
  parameter        GDB_COMMAND_g_SEND_HEXBYTE = 6'd28;
  parameter        GDB_COMMAND_g_SEND_HEXBYTE2 = 6'd29;
  parameter        GDB_SEND_HEXBYTE_WAIT = 6'd30;
  parameter        DELETEME = 6'd31;
  parameter        GDB_SEND_HEXBYTE_2 = 6'd32;
  parameter        GDB_SEND_HEXBYTE_2_WAIT = 6'd33;
  parameter        GDB_COMMAND_question = 6'd34;
  parameter        GDB_SEND_PACKET_PAYLOAD = 6'd35;
  parameter        GDB_SEND_PACKET_CHECKSUM = 6'd36;
  parameter        GDB_SEND_PACKET_PAYLOAD_WAIT = 6'd37;
  parameter        GDB_SEND_PACKET_CHECKSUM_WAIT = 6'd38;
  parameter        GDB_SEND_PACKET_CHECKSUM_VALUE = 6'd39;
  parameter        GDB_SEND_PACKET_VALUE = 6'd40;

  parameter        CHAR_hash = 8'd35;
  parameter        CHAR_dollar = 8'd36;
  parameter        CHAR_null = 8'd0;
  parameter        CHAR_g = 8'd103;

  reg [5:0]        state = GDB_START;
  reg [5:0]        delay_state;
  reg [5:0]        state_stack[0:3];
  reg [1:0]        sptr = 0;
  reg [7:0]        rbuf[0:63];
  reg [5:0]        rptr;
  wire             received_hash;
  wire             received_dollar;
  wire             received_interrupt;
  reg [7:0]        packet_checksum;

  reg [7:0]        msgbuf[0:15];
  reg [3:0]        mptr;
  wire [7:0]       msgchar;
  assign msgchar = msgbuf[mptr];

  initial
    begin
      $readmemh("messages.bin", msgbuf);
    end

  assign received_interrupt = (rx_byte_i == 8'd3);
  assign received_hash = (rx_byte_i == CHAR_hash);
  assign received_dollar = (rx_byte_i == CHAR_dollar);

  assign debug_o[7:0] = {debug_checksum_error, debug_ack, state};

  function [3:0] hex2num;
    input [7:0] char;
    case (char)
      8'd48:
	      hex2num = 4'd0;
      8'd49:
	      hex2num = 4'd1;
      8'd50:
	      hex2num = 4'd2;
      8'd51:
	      hex2num = 4'd3;
      8'd52:
	      hex2num = 4'd4;
      8'd53:
	      hex2num = 4'd5;
      8'd54:
	      hex2num = 4'd6;
      8'd55:
	      hex2num = 4'd7;
      8'd56:
	      hex2num = 4'd8;
      8'd57:
	      hex2num = 4'd9;
      8'd65:
	      hex2num = 4'd10;
      8'd66:
	      hex2num = 4'd11;
      8'd67:
	      hex2num = 4'd12;
      8'd68:
	      hex2num = 4'd13;
      8'd69:
	      hex2num = 4'd14;
      8'd70:
	      hex2num = 4'd15;
      8'd97:
	      hex2num = 4'd10;
      8'd98:
	      hex2num = 4'd11;
      8'd99:
	      hex2num = 4'd12;
      8'd100:
	      hex2num = 4'd13;
      8'd101:
	      hex2num = 4'd14;
      8'd102:
	      hex2num = 4'd15;
      default:
	      hex2num = 4'd0; /* FIXME */
    endcase
  endfunction

  function [7:0] byte2ascii; //output is byte wide
    input [3:0] d_i;     //input is nibble wide
    begin
      byte2ascii = { d_i > 4'h9 ? 4'h4 : 4'h3,
                     d_i == 4'h9 ? 1'b1 : 1'b0,
                     d_i[2:0] };
    end
  endfunction

  reg 	       [24:0]		delay;
  reg [31:0]            rval;
  reg [2:0]             fcount;
  reg [7:0]             tbyte;
  reg                   waitflag;

  always @(posedge clk_i) begin
    if (rst_i)
      begin
	      state <= GDB_START;
	      tx_send_o <= 0;
	      gdb_ctrl_o <= 2'b0;
      end
    else
      begin
	      case (state)
	        GDB_START:
	          if (rx_available_i) begin
	            // Put the target core in debug mode.
	            gdb_ctrl_o <= 2'b10;
  	          rx_read_o <= 1;
	            delay_state <= GDB_READ_PACKET_START;
	            state <= GDB_DELAY1;
	          end
	        GDB_IDLE:
	          if (rx_available_i) begin
  	          rx_read_o <= 1;
	            delay_state <= GDB_READ_PACKET_START;
	            state <= GDB_DELAY1;
	          end
	        GDB_READ_PACKET_START:
	          begin
              rx_read_o <= 0;
	            if (received_dollar)
		            begin
		              rptr <= 0;
		              packet_checksum <= 0;
		              state <= GDB_READ_PACKET_WAIT;
		            end
	            else if (received_interrupt)
		            state <= GDB_COMMAND_interrupt;
	            else
		            state <= GDB_IDLE;
	          end
	        GDB_READ_PACKET_WAIT:
	          if (rx_available_i) begin
	            rx_read_o <= 1;
	            state <= GDB_DELAY1;
	            delay_state <= GDB_READ_PACKET;
	          end
	        GDB_READ_PACKET:
	          begin
	            rx_read_o <= 0;
	            if (received_hash)
		            state <= GDB_READ_PACKET_CHECKSUM1_WAIT;
	            else begin
		            rbuf[rptr] <= rx_byte_i;
		            rptr <= rptr+1'b1;
		            packet_checksum <= packet_checksum + rx_byte_i;
		            state <= GDB_READ_PACKET_WAIT;
	            end
	          end
	        GDB_READ_PACKET_CHECKSUM1_WAIT:
	          if (rx_available_i) begin
	            rx_read_o <= 1;
	            state <= GDB_DELAY1;
	            delay_state <= GDB_READ_PACKET_CHECKSUM1;
	          end
	        GDB_READ_PACKET_CHECKSUM1:
	          begin
	            packet_checksum[7:4] <= packet_checksum[7:4] ^ hex2num(rx_byte_i);
	            rx_read_o <= 0;
	            state <= GDB_READ_PACKET_CHECKSUM2_WAIT;
	          end
	        GDB_READ_PACKET_CHECKSUM2_WAIT:
	          if (rx_available_i) begin
	            rx_read_o <= 1;
	            state <= GDB_DELAY1;
	            delay_state <= GDB_READ_PACKET_CHECKSUM2;
	          end
	        GDB_READ_PACKET_CHECKSUM2:
	          begin
	            packet_checksum[3:0] <= packet_checksum[3:0] ^ hex2num(rx_byte_i);
	            rx_read_o <= 0;
	            state <= GDB_PACKET_CHECK;
	          end
	        GDB_PACKET_CHECK:
	          begin
	            if (packet_checksum == 8'd0)
		            state <= GDB_PACKET_SEND_ACK;
	            else
		            state <= GDB_PACKET_SEND_NAK;
	          end
	        GDB_PACKET_SEND_ACK:
	          begin
	            if (tx_ready_i)
		            begin
		              tx_byte_o <= 8'h2B; // +
		              tx_send_o <= 1;
		              state <= GDB_PACKET_SEND_ACK_WAIT;
		            end
	          end
	        GDB_PACKET_SEND_ACK_WAIT:
	          begin
	            tx_send_o <= 0;
	            delay <= 25'b1111111111111111111111111;
	            state_stack[sptr] <= GDB_PACKET_PARSE;
	            state <= GDB_DELAY;
	          end
	        GDB_PACKET_PARSE:
	          begin
	            case (rptr)
		            1:
		              state <= GDB_PACKET_PARSE_LEN1;
		            default:
		              state <= GDB_PACKET_UNKNOWN_ERROR;
	            endcase // case (rptr)
	          end
	        GDB_PACKET_PARSE_LEN1:
	          begin
	            case (rbuf[0])
		            63:  /* ? */
		              state <= GDB_COMMAND_question;
		            103: /* g */
		              state <= GDB_COMMAND_g;
		            default:
		              state <= GDB_PACKET_UNKNOWN_ERROR;
	            endcase
	          end
	        // The '?' command.
	        GDB_COMMAND_question:
	          begin
	            debug_ack <= 1;
	            mptr <= `MSG_OFFSET_STOPPED_TRAP;
	            state <= GDB_SEND_MESSAGE;
	            state_stack[0] <= GDB_IDLE;
	            sptr <= 1;
	          end
	        // The 'g' command.  Send register dumps in hex format over the wire.
	        GDB_COMMAND_g:
	          begin
	            packet_checksum <= 0;
	            state <= GDB_COMMAND_g_SEND_REGISTERS;
	          end
	        GDB_COMMAND_g_SEND_REGISTERS:
	          begin
	            // TODO - if we've sent all regs, send checksum
	            gdb_ctrl_o <= 2'b11;
	            state <= GDB_COMMAND_g_FETCH_HIGH;
	          end
	        GDB_COMMAND_g_FETCH_HIGH:
	          begin
	            gdb_ctrl_o <= 2'b10;
	            rval[31:16] <= wb_dat_i;
	            state <= GDB_COMMAND_g_FETCH_LOW;
	          end
	        GDB_COMMAND_g_FETCH_LOW:
	          begin
	            rval[15:0] <= wb_dat_i;
	            state <= GDB_COMMAND_g_SEND_WORD;
	            fcount <= 3'b100;
	          end
	        GDB_COMMAND_g_SEND_WORD:
	          begin
	            if (fcount != 4'b0)
		            begin
		              tbyte <= rval[31:24];
		              rval[31:8] <= rval[23:0];
		              state <= GDB_SEND_HEXBYTE;
		              fcount <= fcount - 1'b1;
		              state_stack[sptr] <= GDB_COMMAND_g_SEND_WORD;
		            end
	            state <= GDB_COMMAND_g_SEND_REGISTERS;
	          end
	        // Transmit a byte in two character ASCII hex format.
	        // Input: tbyte - byte to send
	        // Save return state in stack_stack[sptr].
	        GDB_SEND_HEXBYTE:
	          if (tx_ready_i)
	            begin
		            tx_byte_o <= byte2ascii (tbyte[7:4]);
		            packet_checksum <= packet_checksum + byte2ascii (tbyte[7:4]);
		            tx_send_o <= 1;
		            state <= GDB_SEND_HEXBYTE_WAIT;
		            waitflag <= 0;
	            end
	        GDB_SEND_HEXBYTE_WAIT:
	          begin
	            waitflag <= ~waitflag;
	            tx_send_o <= 0;
	            if (waitflag)
		            state <= GDB_SEND_HEXBYTE_2;
	          end
	        GDB_SEND_HEXBYTE_2:
	          if (tx_ready_i)
	            begin
		            tx_byte_o <= byte2ascii (tbyte[3:0]);
		            packet_checksum <= packet_checksum + byte2ascii (tbyte[3:0]);
		            tx_send_o <= 1;
		            state <= GDB_SEND_HEXBYTE_2_WAIT;
		            waitflag <= 0;
	            end
	        GDB_SEND_HEXBYTE_2_WAIT:
	          begin
	            waitflag <= ~waitflag;
	            tx_send_o <= 0;
	            if (waitflag)
		            state <= state_stack[sptr];
	          end
	        GDB_COMMAND_interrupt:
	          begin
	            // Put the target core in debug mode.
	            gdb_ctrl_o <= 2'b10;
	            // Send a message.
	            mptr <= `MSG_OFFSET_STOPPED_TRAP;
	            state <= GDB_SEND_MESSAGE;
	            state_stack[0] <= GDB_IDLE;
	            sptr <= 1;
	          end
	        GDB_PACKET_SEND_NAK:
	          begin
	            if (tx_ready_i)
		            begin
		              debug_checksum_error <= 1;
		              tx_byte_o <= 8'h2D; // -
		              tx_send_o <= 1;
		              state <= GDB_PACKET_SEND_NAK_WAIT;
		            end
	          end
	        GDB_PACKET_SEND_NAK_WAIT:
	          begin
	            tx_send_o <= 0;
	            delay <= 25'b1111111111111111111111111;
	            state_stack[sptr] <= GDB_IDLE;
	            state <= GDB_DELAY;
	          end
	        GDB_PACKET_UNKNOWN_ERROR:
	          begin
	            mptr <= `MSG_OFFSET_EMPTY;
	            state <= GDB_SEND_MESSAGE;
	            state_stack[0] <= GDB_IDLE;
	            sptr <= 1;
	          end
	        GDB_SEND_MESSAGE:
	          begin
	            if (tx_ready_i)
		            begin
		              tx_byte_o <= CHAR_dollar;
		              tx_send_o <= 1;
		              tbyte <= 0;
		              state <= GDB_SEND_MESSAGE_WAIT;
		            end
	          end
	        GDB_SEND_MESSAGE_WAIT:
	          begin
	            tx_send_o <= 0;
	            delay <= 25'd10;
	            state_stack[sptr] <= GDB_SEND_PACKET_PAYLOAD;
	            state <= GDB_DELAY;
	          end
	        GDB_SEND_PACKET_PAYLOAD:
	          if (msgchar == CHAR_null) begin
	            state <= GDB_SEND_PACKET_CHECKSUM;
	          end else if (tx_ready_i)
	            begin
		            tx_byte_o <= msgchar;
		            tbyte <= tbyte + msgchar;
		            tx_send_o <= 1;
		            mptr <= mptr + 1'b1;
		            state <= GDB_SEND_PACKET_PAYLOAD_WAIT;
	            end
	        GDB_SEND_PACKET_PAYLOAD_WAIT:
	          begin
	            tx_send_o <= 0;
	            delay <= 25'd10;
	            state_stack[sptr] <= GDB_SEND_PACKET_PAYLOAD;
	            state <= GDB_DELAY;
	          end
	        GDB_SEND_PACKET_CHECKSUM:
	          begin
	            if (tx_ready_i)
		            begin
		              tx_byte_o <= CHAR_hash;
		              tx_send_o <= 1;
		              state <= GDB_SEND_PACKET_CHECKSUM_WAIT;
		            end
	          end
	        GDB_SEND_PACKET_CHECKSUM_WAIT:
	          begin
	            tx_send_o <= 0;
	            delay <= 25'd10;
	            state_stack[sptr] <= GDB_SEND_PACKET_CHECKSUM_VALUE;
	            state <= GDB_DELAY;
	          end
	        GDB_SEND_PACKET_CHECKSUM_VALUE:
	          begin
	            state_stack[sptr] <= GDB_IDLE;
	            state <= GDB_SEND_HEXBYTE;
	          end
	        GDB_DELAY1:
	          begin
	            state <= delay_state;
	          end
	        GDB_DELAY:
	          begin
	            delay <= delay - 1'b1;
	            if (delay == 0)
		            state <= state_stack[sptr];
	          end
	        default:
	          state <= GDB_IDLE;
	      endcase // case (state)
      end
  end // always @ (posedge clk_i)

endmodule // gdb_target_engine
