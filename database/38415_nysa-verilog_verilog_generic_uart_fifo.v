// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//UART FIFO
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


`timescale 1ns/1ps
/*
A custom FIFO that can take multiple bytes in at a time
*/

module uart_fifo (
  clk,
  rst,

  size,

  write_strobe,
  write_available,
  write_data,

  read_strobe,
  read_count,
  read_data,

  overflow,
  underflow,

  full,
  empty
);

//parameters
parameter           FIFO_SIZE       = 10;


input                           clk;
input                           rst;

output  wire  [31:0]            size;

input                           write_strobe;
output  wire  [31:0]            write_available;
input         [7:0]             write_data;

input                           read_strobe;
output  reg   [31:0]            read_count;
output  wire  [7:0]             read_data;

output  reg                     overflow;
output  reg                     underflow;

output                          full;
output                          empty;


//Wires, Registers
reg         [FIFO_SIZE - 1: 0]  in_pointer;
reg         [FIFO_SIZE - 1: 0]  out_pointer;


dual_port_bram #(
  .DATA_WIDTH(8),
  .ADDR_WIDTH(FIFO_SIZE),
//`ifdef SIMULATION
//  .MEM_FILE("mem_file.txt"),
//  .MEM_FILE_LENGTH(8)
//`else
  .MEM_FILE("NOTHING"),
  .MEM_FILE_LENGTH(0)
//`endif
) mem (
  .a_clk(clk),
  .a_wr(write_strobe),
  .a_addr(in_pointer),
  .a_din(write_data),
  //.a_dout(),

  .b_clk(clk),
  .b_wr(1'b0),
  .b_addr(out_pointer),
  .b_din(8'h0),
  .b_dout(read_data)
);

//synthesis attribute ram_style of mem is block
wire        [FIFO_SIZE - 1: 0]  last;

//Asynchronous Logic
assign                          size            =  1 << FIFO_SIZE;
assign                          last            = (out_pointer - 1);
assign                          full            = (in_pointer == last);
assign                          empty           = (read_count == 0);
assign                          write_available = size - read_count;

integer                         i;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    read_count        <=  0;
    in_pointer        <=  0;
    out_pointer       <=  0;
//`ifdef SIMULATION
//    read_count        <=  8;
//    in_pointer        <=  8;
//`endif

    overflow          <=  0;
    underflow         <=  0;

  end
  else begin
    overflow          <=  0;
    underflow         <=  0;

    if (write_strobe) begin
      if (full && !read_strobe) begin
        //overflow
        $display ("UART CONTROLLER: Overflow condition");
        out_pointer         <=  out_pointer + 1;
        overflow            <=  1;
      end
      else begin
        //not overflow
        if (!read_strobe) begin
          read_count          <=  read_count + 1;
        end
      end
      in_pointer            <=  in_pointer + 1;
    end

    if (read_strobe) begin
      if (empty) begin
        //empty
        underflow           <=  1;
      end
      else begin
        if (full && write_strobe) begin
          //check for that very rare condition where the write strobe and the read strobe is begin used at the same time
          //and the FIFO is full
          overflow          <=  0;
        end
        else begin
          if (!write_strobe) begin
            read_count        <=  read_count - 1;
          end
          out_pointer       <=  out_pointer + 1;
        end
      end
    end
  end
end

endmodule
