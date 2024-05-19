// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2015 Dave McCoy (dave.mccoy@cospandesign.com)

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
 * Author:
 * Description:
 *
 * Changes:
 */

`timescale 1ns/1ps

`include "cbuilder_defines.v"

`define ID_DWORD          32'hCD15DBE5
`define ID_RESP           (~`ID_DWORD)

module adapter_cocotb_2_ppfifo #(
  parameter                 IN_FIFO_DEPTH = 8,
  parameter                 OUT_FIFO_DEPTH = 8
)(
  input                     clk,
  input                     rst,

  //Cocotb Interface
  output  reg             o_ctb_master_ready,

  input                   i_ctb_in_ready,
  input         [31:0]    i_ctb_in_command,
  input         [31:0]    i_ctb_in_address,
  input         [31:0]    i_ctb_in_data,
  input         [27:0]    i_ctb_in_data_count,

  input                   i_ctb_out_ready,
  output  reg             o_ctb_out_en,
  output  reg   [31:0]    o_ctb_out_status,
  output  reg   [31:0]    o_ctb_out_address,
  output  reg   [31:0]    o_ctb_out_data,
  output  reg   [27:0]    o_ctb_out_data_count,


  output                  o_in_rdy,
  input                   i_in_act,
  output        [23:0]    o_in_size,
  output                  i_in_stb,
  output        [31:0]    o_in_data,

  output        [1:0]     o_out_rdy,
  input         [1:0]     i_out_act,
  output        [23:0]    o_out_size,
  input                   i_out_stb,
  input         [31:0]    i_out_data
);


//local parameters
localparam    IN_PACKET_CMD_SIZE    = 4;
localparam    OUT_PACKET_RESP_SIZE  = 5;
localparam    OUT_PACKET_PING_SIZE  = 2;

//States
localparam    IDLE                = 0;
localparam    HOST_SEND_COMMAND   = 1;
localparam    HOST_SEND_DATA      = 2;
localparam    WAIT_FOR_RESPONSE   = 3;
localparam    WRITE_DATA_TO_HOST  = 4;
localparam    FLUSH               = 5;
//registes/wires
reg       [3:0]     state;

reg       [31:0]    in_packet[0:IN_PACKET_CMD_SIZE];
reg       [23:0]    in_packet_pos;

wire      [1:0]     hst_in_rdy;
reg       [1:0]     hst_in_act;
reg                 hst_in_stb;
wire      [23:0]    hst_in_size;
reg       [31:0]    hst_in_data;

reg       [23:0]    in_count;
reg       [23:0]    in_data_count;

wire                hst_out_rdy;
reg                 hst_out_act;
reg                 hst_out_stb;
wire      [23:0]    hst_out_size;
wire      [31:0]    hst_out_data;

reg       [23:0]    out_count;
reg       [23:0]    resp_count;
reg       [23:0]    out_data_count;

wire      [23:0]    response_length;

//submodules
ppfifo #(
  .DATA_WIDTH       (32                   ),
  .ADDRESS_WIDTH    (IN_FIFO_DEPTH        )
) ingress (
  .reset            (rst                  ),

  //write side
  .write_clock     (clk                   ),
  .write_data      (hst_in_data           ),
  .write_ready     (hst_in_rdy            ),
  .write_activate  (hst_in_act            ),
  .write_fifo_size (hst_in_size           ),
  .write_strobe    (hst_in_stb            ),
  .starved         (                      ),

  //read side
  .read_clock      (clk                   ),
  .read_strobe     (i_in_stb              ),
  .read_ready      (o_in_rdy              ),
  .read_activate   (i_in_act              ),
  .read_count      (o_in_size             ),
  .read_data       (o_in_data             ),
  .inactive        (                      )
);

ppfifo #(
  .DATA_WIDTH       (32                   ),
  .ADDRESS_WIDTH    (OUT_FIFO_DEPTH       )
) egress (
  .reset            (rst                  ),

  //write side
  .write_clock     (clk                   ),
  .write_data      (i_out_data            ),
  .write_ready     (o_out_rdy             ),
  .write_activate  (i_out_act             ),
  .write_fifo_size (o_out_size            ),
  .write_strobe    (i_out_stb             ),
  .starved         (                      ),

  //read side
  .read_clock      (clk                   ),
  .read_strobe     (hst_out_stb           ),
  .read_ready      (hst_out_rdy           ),
  .read_activate   (hst_out_act           ),
  .read_count      (hst_out_size          ),
  .read_data       (hst_out_data          ),
  .inactive        (                      )
);

//asynchronous logic
assign  response_length = (i_ctb_in_command[3:0] == `COMMAND_PING) ?  OUT_PACKET_PING_SIZE : OUT_PACKET_RESP_SIZE;

//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes
  o_ctb_master_ready    <=  0;
  o_ctb_out_en          <=  0;

  hst_in_stb            <=  0;
  hst_out_stb           <=  0;

  if (rst) begin
    state               <=  IDLE;

    in_count            <=  0;
    in_packet_pos       <=  0;
    in_data_count       <=  0;

    out_count           <=  0;

    o_ctb_out_status    <=  0;
    o_ctb_out_address   <=  0;
    o_ctb_out_data      <=  0;
    o_ctb_out_data_count<=  0;


    hst_in_act          <=  0;
    hst_in_data         <=  0;

    hst_out_act         <=  0;
    resp_count          <=  0;
  end
  else begin
    //Get an incomming FIFO to work with
    if ((hst_in_rdy > 0) && hst_in_act == 0) begin
      in_count          <=  0;
      if (hst_in_rdy[0]) begin
        hst_in_act[0]   <=  1;
      end
      else begin
        hst_in_act[1]   <=  1;
      end
    end

    //If there are any outgoing FIFOs get one
    if (hst_out_rdy && !hst_out_act) begin
      out_count         <=  0;
      hst_out_act       <=  1;
    end


    case (state)
      IDLE: begin
        o_ctb_master_ready  <=  1;
        resp_count          <=  0;
        in_data_count       <=  1;
        out_data_count      <=  1;
        in_packet_pos       <=  0;
        if (i_ctb_in_ready && hst_in_act) begin //There shouldn't be any data in the FIFO
          o_ctb_master_ready<=  0;
          in_packet[0]      <=  `ID_DWORD;
          in_packet[1]      <=  {i_ctb_in_command[7:0], i_ctb_in_data_count[23:0]};
          in_packet[2]      <=  i_ctb_in_address;
          in_packet[3]      <=  i_ctb_in_data;
          state             <=  HOST_SEND_COMMAND;
        end
        if (hst_out_act) begin
          $display ("Interrupt Detected!");
          state             <=  WAIT_FOR_RESPONSE;
        end
      end
      HOST_SEND_COMMAND: begin
        if (in_packet_pos < IN_PACKET_CMD_SIZE) begin
          if (in_count < hst_in_size) begin
            hst_in_data     <=  in_packet[in_packet_pos];
            in_packet_pos   <=  in_packet_pos + 1;
            in_count        <=  in_count + 1;
            hst_in_stb      <=  1;
          end
          else begin
            hst_in_act      <=  0;
          end
        end
        else begin
          //Done inserting the command inside the PPFIFO
          if ((i_ctb_in_command[3:0] == `COMMAND_WRITE) && (i_ctb_in_data_count > 1)) begin
            //There is more than one piece of data to send
            state         <=  HOST_SEND_DATA;
          end
          else begin
            //No more data to send to the host
            //Release the fifo and wait for a response
            state         <=  WAIT_FOR_RESPONSE;
            hst_in_act    <=  0;
          end
        end
      end
      HOST_SEND_DATA: begin
        if (in_data_count < i_ctb_in_data_count) begin
          if (hst_in_act) begin
            if (in_count < hst_in_size) begin
              o_ctb_master_ready    <=  1;
              if (i_ctb_in_ready && o_ctb_master_ready) begin //There shouldn't be any data in the FIFO
                $display ("Wait for master");
                o_ctb_master_ready  <=  0;
                in_count            <=  in_count + 1;
                in_data_count       <=  in_data_count + 1;
                hst_in_data         <=  i_ctb_in_data;
                hst_in_stb          <=  1;
              end
            end
            else begin
              hst_in_act            <=  0;
            end
          end
        end
        else begin
          state                     <=  WAIT_FOR_RESPONSE;
          hst_in_act                <=  0;
        end
      end
      WAIT_FOR_RESPONSE: begin
        //Need to wait for a response from the host
        if (i_ctb_out_ready && !o_ctb_out_en) begin
          if (hst_out_act && i_ctb_out_ready) begin
            if (out_count < hst_out_size) begin

              if (resp_count < response_length) begin
                //Unpack the Response
                case (resp_count)
                  0: begin
                    hst_out_stb             <=  1;
                  end
                  1: begin
                    o_ctb_out_status        <=  hst_out_data;
                    hst_out_stb             <=  1;
                  end
                  2: begin
                    o_ctb_out_data_count    <=  hst_out_data;
                    hst_out_stb             <=  1;
                  end
                  3: begin
                    o_ctb_out_address       <=  hst_out_data;
                    hst_out_stb             <=  1;
                  end
                  4: begin
                    o_ctb_out_data          <=  hst_out_data;
                  end
                  default: begin
                  end
                endcase
                
                if (hst_out_stb) begin
                  out_count                 <=  out_count + 1;
                  resp_count                <=  resp_count + 1;
                end
              end
              else begin
                o_ctb_out_en                <=  1;
                if (o_ctb_out_data_count > 1) begin
                  state                     <=  WRITE_DATA_TO_HOST;
                end
                else begin
                  state                     <=  FLUSH;
                end
              end
            end
            else begin
              if (resp_count >= (response_length - 1)) begin
                o_ctb_out_en                <=  1;
                $display("Reponse Count: %X" % resp_count);
                state                       <=  FLUSH;
              end
            end
          end
        end
      end
      WRITE_DATA_TO_HOST: begin
        if (out_data_count < o_ctb_out_data_count) begin
          if (hst_out_act) begin
            if (out_count < hst_out_size) begin
              if (i_ctb_out_ready && !o_ctb_out_en) begin  
                o_ctb_out_en      <=  1;
                hst_out_stb       <=  1;
                o_ctb_out_data    <=  hst_out_data;
                out_data_count    <=  out_data_count + 1;
                out_count         <=  out_count + 1;
              end
            end
            else begin
              hst_out_act         <=  0;
            end
          end
        end
        else begin
          state                 <= FLUSH;
        end
      end
      FLUSH: begin
        if (hst_out_act) begin
          if (out_count < hst_out_size) begin
            hst_out_stb                     <=  1;
            out_count                       <=  out_count + 1;
          end
          else begin
            hst_out_act                     <=  0;
          end
        end
        else begin
          state                             <=  IDLE;
        end
      end
      default: begin
      end
    endcase
  end
end



endmodule
