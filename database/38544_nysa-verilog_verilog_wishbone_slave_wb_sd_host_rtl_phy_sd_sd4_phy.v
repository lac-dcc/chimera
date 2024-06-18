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
 *    clk           : sdio_clk
 *    rst           : reset core
 *    i_en          : Enable a data transaction
 *    i_write_flag  : 1 = Write, 0 = Read
 *    i_data_h2s    : Data from host to SD card
 *    o_data_h2s    : Data from SD card to host
 *    i_data_count  : Number of bytes to read/write
 *    o_data_stb    : request or strobe in a byte
 *    o_crc_err     : CRC error occured during read
 *    o_sd_data_dir : Direction of the data
 *    i_sd_data     : raw data in
 *    o_sd_data     : raw data out
 *
 * Changes:
 *  2015.08.24: Initial commit
 */


//RIGHT NOW WE ARE ALWAYS ENABLED!

`define CRC_COUNT 8

module sd_sd4_phy (
  input                     clk,
  input                     rst,

//  input                     ddr_en, //ALWAYS ENABLED FOR NOW!
  input                     i_en,
  input                     i_write_flag,

  output  reg               o_crc_err,      //Detected a CRC error during read

  //Debug
  output  reg [15:0]        o_crc0_rmt,
  output  reg [15:0]        o_crc1_rmt,
  output  reg [15:0]        o_crc2_rmt,
  output  reg [15:0]        o_crc3_rmt,

  output  reg [15:0]        o_crc0_gen,
  output  reg [15:0]        o_crc1_gen,
  output  reg [15:0]        o_crc2_gen,
  output  reg [15:0]        o_crc3_gen,

  output  reg               o_data_stb,
  input       [11:0]        i_data_count,
  input       [7:0]         i_data_h2s,
  output  reg [7:0]         o_data_s2h,

  output                    o_sd_data_dir,
  input       [7:0]         i_sd_data,
  output      [7:0]         o_sd_data

);
//local parameters
localparam  IDLE          = 4'h0;
localparam  WRITE         = 4'h2;
localparam  WRITE_CRC     = 4'h3;
localparam  WRITE_FINISHED= 4'h4;
localparam  READ_START    = 4'h5;
localparam  READ          = 4'h6;
localparam  READ_CRC      = 4'h7;
localparam  FINISHED      = 4'h8;

//registes/wires
reg       [3:0]             state = IDLE;
reg       [7:0]             sd_data;
wire                        sd_data_bit;
wire      [15:0]            gen_crc[0:3];
reg       [15:0]            crc[0:3];
reg       [15:0]            prev_crc[0:3];
wire      [15:0]            crc0;
wire      [15:0]            crc1;
wire      [15:0]            crc2;
wire      [15:0]            crc3;
wire      [15:0]            prev_crc0;
wire      [15:0]            prev_crc1;
wire      [15:0]            prev_crc2;
wire      [15:0]            prev_crc3;

wire      [15:0]            gen_crc0;
wire      [15:0]            gen_crc1;
wire      [15:0]            gen_crc2;
wire      [15:0]            gen_crc3;

reg                         crc_rst;
reg                         crc_en;
wire                        sd_clk;
reg                         posedge_clk;

wire      [3:0]             crc_bit0;
wire      [3:0]             crc_bit1;
wire      [3:0]             crc_bit2;
wire      [3:0]             crc_bit3;
//wire      [7:0]             in_remap;
reg       [11:0]            data_count;
wire                        writing_active;
reg                         local_rst;

wire      [7:0]             crc_data;
initial begin
  local_rst                   <=  1;
end

integer                     i = 0;

//submodules

//Generate 4 Copies of the CRC, data will be read in and out in parallel
genvar gv;
generate
for (gv = 0; gv < 4; gv = gv + 1) begin: gv_crc
crc16_2bit crc_module(
  .clk                (clk                    ),
  .rst                (crc_rst                ),
  .en                 (crc_en                 ),
  .bit1               (crc_data[7 - gv]       ),
  .bit0               (crc_data[7 - gv - 4]   ),
  .crc                (gen_crc[gv]            )
);

end
endgenerate
assign  crc_data    = i_write_flag ? i_data_h2s : i_sd_data;

//asynchronous logic
assign  prev_crc0  = prev_crc[0];
assign  prev_crc1  = prev_crc[1];
assign  prev_crc2  = prev_crc[2];
assign  prev_crc3  = prev_crc[3];

assign  crc0  = crc[0];
assign  crc1  = crc[1];
assign  crc2  = crc[2];
assign  crc3  = crc[3];

assign  gen_crc0  = gen_crc[0];
assign  gen_crc1  = gen_crc[1];
assign  gen_crc2  = gen_crc[2];
assign  gen_crc3  = gen_crc[3];

assign  o_sd_data       = sd_data;

assign  writing_active  = ((state == WRITE) || (state == WRITE_CRC));
assign  o_sd_data_dir   = writing_active;

//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes
  o_data_stb              <=  0;

  if (rst | local_rst) begin
    sd_data               <=  0;
    state                 <=  IDLE;
    crc_rst               <=  1;
    crc_en                <=  0;
    data_count            <=  0;
    o_crc_err             <=  0;
    o_data_s2h            <=  0;
    local_rst             <=  0;

    o_crc0_rmt            <=  0;
    o_crc1_rmt            <=  0;
    o_crc2_rmt            <=  0;
    o_crc3_rmt            <=  0;

    o_crc0_gen            <=  0;
    o_crc1_gen            <=  0;
    o_crc2_gen            <=  0;
    o_crc3_gen            <=  0;

    for (i = 0; i < 4; i = i + 1) begin
      crc[i]              <=  16'h0000;
    end
  end
  else begin
    case (state)
      IDLE: begin
        crc_en            <=  0;
        crc_rst           <=  1;
        data_count        <=  0;
        o_crc_err         <=  0;
        sd_data           <=  8'hFF;
        if (i_en) begin
          crc_rst         <=  0;
          if(i_write_flag) begin
            state         <=  WRITE;
            sd_data       <=  8'h00;  //Is this only on the positive edge we need this start bit to be set?
            o_data_stb    <=  1;
            crc_en        <=  1;
          end
          else begin
            state         <=  READ_START;
          end
        end
      end
      WRITE: begin
        if (data_count < i_data_count - 1) begin
          crc_en          <=  1;
          sd_data         <=  i_data_h2s;
          data_count      <=  data_count + 1;
          o_data_stb      <=  1;
        end
        else begin
          sd_data         <=  i_data_h2s;
          data_count      <=  0;
          state           <=  WRITE_CRC;
          crc_en          <=  0;
        end
      end
      WRITE_CRC: begin
        if (data_count == 0) begin
          o_crc0_gen        <=  gen_crc[0];
          o_crc1_gen        <=  gen_crc[1];
          o_crc2_gen        <=  gen_crc[2];
          o_crc3_gen        <=  gen_crc[3];

          sd_data         <=  {gen_crc0[15], gen_crc1[15], gen_crc2[15], gen_crc3[15],
                               gen_crc0[14], gen_crc1[14], gen_crc2[14], gen_crc3[14]};
          for (i = 0; i < 4; i = i + 1) begin
            crc[i]        <=  {gen_crc[i][13:0], 2'b0};
          end

          data_count      <=  data_count + 1;
          //$display("CRC: %X %X %X %X", gen_crc0, gen_crc1, gen_crc2, gen_crc3);
          //$display("Bus Value: %X", {gen_crc0[15], gen_crc1[15], gen_crc2[15], gen_crc3[15],
          //                           gen_crc0[14], gen_crc1[14], gen_crc2[14], gen_crc3[14]});

        end
        else if (data_count <= 8) begin
          //$display("SD Data: %X", sd_data);
          sd_data         <=  {crc0[15], crc1[15], crc2[15], crc3[15],
                               crc0[14], crc1[14], crc2[14], crc3[14]};
          for (i = 0; i < 4; i = i + 1) begin
            crc[i]        <=  {crc[i][13:0], 2'b0};
          end
          data_count      <=  data_count + 1;
        end
        else begin
          sd_data         <=  8'hFF;
          state           <=  WRITE_FINISHED;
        end
      end
      WRITE_FINISHED: begin
        //Pass through, assign statement will set the value to 1
        state             <=  FINISHED;
      end
      READ_START: begin
        //Wait for data bit to go low
        if (!i_sd_data[0]) begin
          state           <=  READ;
        end
      end
      READ: begin
        //Shift the bits in
        o_data_s2h        <=  i_sd_data;
        o_data_stb        <=  1;
        crc_en            <=  1;
        if (data_count < i_data_count - 1) begin
          data_count      <=  data_count + 1;
        end
        else begin
          //Finished reading all bytes
          state           <=  READ_CRC;
          data_count      <=  0;
        end
      end
      READ_CRC: begin
        crc_en            <=  0;
        if  (data_count < (`CRC_COUNT)) begin
          data_count      <=  data_count  + 1;
          crc[0]          <=  {crc[0][13:0], i_sd_data[7], i_sd_data[3]};
          crc[1]          <=  {crc[1][13:0], i_sd_data[6], i_sd_data[2]};
          crc[2]          <=  {crc[2][13:0], i_sd_data[5], i_sd_data[1]};
          crc[3]          <=  {crc[3][13:0], i_sd_data[4], i_sd_data[0]};
        end
        else begin

          state           <=  FINISHED;
        end
      end
      FINISHED: begin
        o_crc0_rmt        <=  crc[0];
        o_crc1_rmt        <=  crc[1];
        o_crc2_rmt        <=  crc[2];
        o_crc3_rmt        <=  crc[3];

        o_crc_err         <= !( (crc[0] == gen_crc[0]) &&
                                (crc[1] == gen_crc[1]) &&
                                (crc[2] == gen_crc[2]) &&
                                (crc[3] == gen_crc[3]));
        if (!i_en) begin
          state           <=  IDLE;
        end
      end
      default: begin
        local_rst         <=  1;
      end
    endcase
  end
end



endmodule
