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
 *  This module generates a CRC16 value from an incomming bitstream
 *  the value is generated from bit that is currently shifting out
 *  The final crc is valid after the last bit is sent, it might be
 *  necessary to send this value one clock cycle before
 *
 *  Last two bytes of the data
 *  CCCCCCCCCCCCCCCC
 *          C = CRC bit
 *
 *  Hold in reset when not using
 *
 *  Online documentation is way to fucking complicated
 *  x^16 + x^12 + x^5 + 1
 *   To find the polynomial remove the top x^16 then add 2^12 + 2^5 + 1 = 0x1021
 *
 *
 * Changes:
 *  2015.08.08: Initial Add
 *
 */

module crc16_2bit #(
  parameter             POLYNOMIAL  =   16'h1021,
  parameter             SEED        =   16'h0000
)(
  input                 clk,
  input                 rst,
  input                 en,
  input                 bit0,
  input                 bit1,
  output  reg   [15:0]  crc
);

//local parameters
//registes/wires
wire         inv0;
wire         inv1;
//submodules
//asynchronous logic
assign inv1 = bit1 ^ crc[15];
assign inv0 = (bit0 ^ crc[14]);

always @ (posedge clk) begin
  if (rst) begin
    crc  <=  0;
  end
  else begin
    //Shift the output value
    if (en) begin
      crc[15] <= crc[13];
      crc[14] <= crc[12];
      crc[13] <= crc[11] ^ inv1;
      crc[12] <= crc[10] ^ inv0;
      crc[11] <= crc[9];
      crc[10] <= crc[8];
      crc[9]  <= crc[7];
      crc[8]  <= crc[6];
      crc[7]  <= crc[5];
      crc[6]  <= crc[4] ^ inv1;
      crc[5]  <= crc[3] ^ inv0;
      crc[4]  <= crc[2];
      crc[3]  <= crc[1];
      crc[2]  <= crc[0];
      crc[1]  <= inv1;
      crc[0]  <= inv0;
    end
  end
end

endmodule
