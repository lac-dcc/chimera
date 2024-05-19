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
 * Author: Dave McCoy (dave.mccoy@cospandesign.com)
 * Description: Phy layer SD host controller for 1 bit SD mode
 *    When the i_data_en signal goes high the core will read in the
 *    i_write_flag.
 *    Writing:
 *      If high then it will read in the i_data_h2s data until
 *      it reads i_data_count bytes from the host, each i_data_stb will tell
 *      the above phy to present a new byte to on the i_data_h2s register.
 *
 *    Reading:
 *      read the number of bytes on i_data_count. when a new byte is finished
 *      the new byte will be on o_data_s2h.
 *
 *    To activate a transaction set i_en along with i_write_flag to 1 for write
 *    or 0 for read, the core will strobe in/out data on it's own, it's
 *    up to the above layer to make sure there is enough data or space
 *    available, the maximum space should be 2048 bytes. when a transaction is
 *    finished the o_finished flag will go high, the controlling core must
 *    de-assert i_en in order to reset the core to get ready for new
 *    transactions. This signal will go high for one clock cycle if the host
 *    de-asserts i_en before a transaction is finished.
 *
 *    clk: sdio_clk
 *    rst: reset core
 *    i_en: Enable a data transaction
 *    o_finished: transaction is finished (de-assert i_en to reset)
 *    i_write_flag: 1 = Write, 0 = Read
 *    i_data_h2s: Data from host to SD card
 *    o_data_h2s: Data from SD card to host
 *    i_data_count: Number of bytes to read/write
 *    o_data_stb: request or strobe in a byte
 *    o_crc_err: CRC error occured during read
 *    io_sd_data: raw sdio data bits
 *
 * Changes:
 *  2015.08.24: Initial commit
 */

module sd_sd1_phy (
  input                     clk,
  input                     rst,

  input                     i_en,
  output  reg               o_finished,
  input                     i_write_flag,

  output  reg               o_crc_err,      //Detected a CRC error during read

  output  reg               o_data_stb,
  input       [11:0]        i_data_count,
  input       [7:0]         i_data_h2s,
  output  reg [7:0]         o_data_s2h,

  inout       [7:0]         io_sd_data

);
//local parameters
localparam  IDLE          = 4'h0;
localparam  WRITE_START   = 4'h1;
localparam  WRITE         = 4'h2;
localparam  WRITE_CRC     = 4'h3;
localparam  WRITE_FINISHED= 4'h4;
localparam  READ_START    = 4'h5;
localparam  READ          = 4'h6;
localparam  READ_CRC      = 4'h7;
localparam  FINISHED      = 4'h8;

//registes/wires
reg       [3:0]             state;
reg       [7:0]             sd_data;
wire                        sd_data_bit;
wire      [15:0]            gen_crc;
reg       [15:0]            crc;
reg                         crc_rst;
reg       [3:0]             bit_count;  //Need 4 bits to cound the CRC value
wire                        sd_bit;
reg                         r_sd_bit;

//submodules
sd_crc_16 (
  .clk          (clk          ),
  .rst          (crc_rst      ),
  .en           (crc_en       ),
  //.bitval       (r_sd_bit     ),  //Shoud this be registered?
  .bitval       (sd_bit       ),
  .crc          (gen_crc      )
);

//asynchronous logic
assign  sd_data_bit = (state == WRITE_START)    ? 1'b0    :
                      (state == WRITE_CRC)      ? crc[15] :
                      (state == WRITE_FINISHED) ? 1'b1    :
                      sd_data[7];
assign  io_sd_data  = (i_write_flag) ? {7'b0, sd_data_bit}, 8'hZZ;
assign  sd_bit      = io_sd_data[0];

//synchronous logic
always @ (posedge clk) begin

  //De-assert Strobes
  o_data_stb        <=  0;

  if (rst) begin
    sd_data         <=  0;
    state           <=  IDLE;
    crc_rst         <=  1;
    crc_en          <=  0;
    o_finished      <=  0;
    bit_count       <=  0;
    data_count      <=  0;
    o_crc_err       <=  0;
  end
  else begin
    case (state)
      IDLE: begin
        crc_en      <=  0;
        crc_rst     <=  1;
        o_finished  <=  0;
        bit_count   <=  0;
        data_count  <=  0;
        o_crc_err   <=  0;
        if (i_en) begin
          crc_rst   <=  0;
          if(i_write_flag) begin
            state   <=  WRITE_START;
          end
          else begin
            state   <=  READ_START;
          end
        end
      end
      WRITE_START: begin
        //Set the data bit low to initiate a transaction
        //The assignment statement above will take care of setting data bit to 0
        state             <=  WRITE;
        crc_en            <=  1;
        sd_data           <=  i_data_h2s;
      end
      WRITE: begin
        sd_data           <=  {sd_data[6:0], 0};
        bit_count         <=  bit_count + 1;
        if (bit_count >= 7) begin
          if (data_count < i_data_count) begin
            o_data_stb    <=  1;
            bit_count     <=  0;
            data_count    <=  data_count + 1;
            sd_data       <=  i_data_h2s;
          end
          else begin
            state         <=  WRITE_CRC;
            crc_en        <=  0;
            crc           <=  gen_crc;
          end
        end
      end
      WRITE_CRC: begin
        crc               <=  {crc[14:0], sd_bit};
        bit_count         <=  bit_count + 1;
        if (bit_count >= 15) begin
          state           <=  WRITE_FINISHED;
        end
      end
      WRITE_FINISHED: begin
        //Pass through, assign statement will set the value to 1
        state             <=  FINISHED;
      end
      READ_START: begin
        //Wait for data bit to go low
        if (!sd_bit) begin
          crc_en          <=  1;
          state           <=  READ;
        end
      end
      READ: begin
        //Shift the bits in
        o_data_s2h        <=  {o_data_sh[6:0], sd_bit};
        bit_count         <=  bit_count + bit_count + 8'h1;

        if (bit_count >= 7) begin
          //Finished reading a byte
          o_data_stb      <=  1;  //Will this give me enough time for the new data to get clocked in?
          bit_count       <=  0;
          if (data_count < i_data_count) begin
            data_count    <=  data_count + 1;
          end
          else begin
            //Finished reading all bytes
            state         <=  READ_CRC;
          end
        end
      end
      READ_CRC: begin
        crc_en            <=  0;    //XXX: should this be in the previous state??
        crc               <=  {crc[14:0], sd_bit};
        if (bit_count >= 15) begin
          state           <=  FINISHED;
        end
      end
      FINISHED: begin
        o_finished        <=  1;
        if (crc != gen_crc) begin
          o_crc_err       <=  1;
        end
        if (!i_en) begin
          o_finished      <=  0;
          state           <=  IDLE;
        end
      end
      default: begin
      end
    endcase
    r_sd_bt               <=  sd_bit;
  end
end

endmodule
