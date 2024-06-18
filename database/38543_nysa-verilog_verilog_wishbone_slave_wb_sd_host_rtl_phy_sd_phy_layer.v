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
 * Author: David McCoy (dave.mccoy@cospandesign.com)
 * Description: SD Host Phy Layer
 *  This layer performs two sets of tasks
 *    - write commands and listen for response
 *    - read and write data
 *
 * Changes:
 *  2015.08.24: Initial Commit
 *              Only Supporting 4-bit SDIO DDR data at the moment
 */

module sd_phy_layer #(
  parameter                 SD_MODE       = 0,
  parameter                 FOUR_BIT_DATA = 0,
  parameter                 DDR_EN        = 0
)(
//  input                     clk,
  input                     rst,
  output  reg               o_sd_int_detected,

  //Coniguration

  //Command/Response Interface
  input                     i_cmd_en,
  input         [39:0]      i_cmd,
  input         [7:0]       i_cmd_len,

  output  reg               o_rsp_finished_en,
  output  reg   [135:0]     o_rsp,
  input         [7:0]       i_rsp_len,
  output  reg               o_crc_err,

  //Data Interface
  input                     i_data_txrx_activate,
  output  reg               o_data_txrx_finished,
  input         [11:0]      i_data_byte_count,
  input                     i_data_write_flag,
  output                    o_data_crc_read_err,

  //Data From Host to SD Interface
  input                     i_h2s_fifo_ready,
  output  reg               o_h2s_fifo_activate,
  input         [23:0]      i_h2s_fifo_size,
  output  reg               o_h2s_fifo_stb,
  input         [31:0]      i_h2s_fifo_data,

  //Data From SD to Host Interface
  input         [1:0]       i_s2h_fifo_ready,
  output  reg   [1:0]       o_s2h_fifo_activate,
  input         [23:0]      i_s2h_fifo_size,
  output  reg               o_s2h_fifo_stb,
  output  reg   [31:0]      o_s2h_fifo_data,

  input                     i_sd_clk,

  output  reg               o_read_wait,
  output  reg               o_sd_cmd_dir,
  input                     i_sd_cmd,
  output  reg               o_sd_cmd,

  //FPGA Debug Interface
  output      [3:0]         o_state,
  output      [3:0]         o_data_state,
  output  reg [7:0]         o_gen_crc,
  output  reg [7:0]         o_rmt_crc,

  //Debug
  output      [15:0]        o_crc0_data_rmt,
  output      [15:0]        o_crc1_data_rmt,
  output      [15:0]        o_crc2_data_rmt,
  output      [15:0]        o_crc3_data_rmt,

  output      [15:0]        o_crc0_data_gen,
  output      [15:0]        o_crc1_data_gen,
  output      [15:0]        o_crc2_data_gen,
  output      [15:0]        o_crc3_data_gen,



  //Physical Interface
  output                    o_sd_data_dir,
  input       [7:0]         i_sd_data,
  output      [7:0]         o_sd_data
);

initial begin
  o_read_wait                 <=  0;
  cmd_count                   <=  0;
end

//local parameters
localparam  IDLE              = 4'h0;
localparam  SEND_COMMAND      = 4'h1;
localparam  SEND_FIRST_CRC    = 4'h2;
localparam  SEND_CRC          = 4'h3;
localparam  FINISHED_COMMAND  = 4'h4;
localparam  WAIT_TRISTATE     = 4'h5;
localparam  WAIT_FOR_RESPONSE = 4'h6;
localparam  READ_RESPONSE     = 4'h7;
localparam  READ_CRC          = 4'h8;
localparam  CHECK_CRC         = 4'h9;
localparam  END_TRANSACTION   = 4'hA; //This may not be needed
localparam  FINISHED          = 4'hB;

localparam  SETUP_WRITE_FIFO  = 4'h1;
localparam  SETUP_READ_FIFO   = 4'h2;
localparam  WRITE_DATA        = 4'h3;
localparam  READ_DATA         = 4'h4;


//registes/wires
reg     [3:0]               state = IDLE;
reg     [6:0]               cmd_count;
wire    [6:0]               crc7;
reg     [6:0]               r_crc7;

wire                        cmd_bit;
wire    [3:0]               data_value;

reg                         spi_cs_n;
wire                        spi_mosi;

wire                        sd_mode;
reg     [1:0]               byte_index;
reg     [7:0]               data_h2s;
wire    [7:0]               data_s2h;
reg     [11:0]              total_byte_count;

reg     [23:0]              count;
reg                         write_flag;
reg     [3:0]               data_state = IDLE;
reg     [39:0]              cmd;


wire                        sd4_finished;
wire                        sd4_data_dir;
wire    [7:0]               sd4_data;
wire    [7:0]               sd1_data;
wire    [7:0]               spi_data;

//wire    [11:0]              phy_data_count;
reg                         rst_crc;
reg                         data_txrx_en;
wire                        data_byte_req_stb;
reg                         crc_en;

wire                        sd_cmd;

assign  sd_cmd  = o_sd_cmd_dir ? o_sd_cmd : i_sd_cmd;

//submodules
sd_crc_7 crc (
  .clk         (i_sd_clk                  ),
  .rst         (rst_crc                   ),
  .bitval      (sd_cmd                    ),
  .en          (crc_en                    ),
  .crc         (crc7                      )
);

generate
if (SD_MODE && FOUR_BIT_DATA) begin: sd4_gen
sd_sd4_phy sd4 (
  .clk          (i_sd_clk                 ),
  .rst          (rst                      ),

  .i_en         (data_txrx_en             ),
  //.o_finished   (sd4_finished             ),
  .i_write_flag (write_flag               ),

  .o_crc_err    (data_read_crc_err        ),      //Detected a CRC error during read

  .o_data_stb   (data_byte_req_stb        ),
  .i_data_count (i_data_byte_count        ),
  .i_data_h2s   (data_h2s                 ),
  .o_data_s2h   (data_s2h                 ),

  .o_crc0_rmt   (o_crc0_data_rmt          ),
  .o_crc1_rmt   (o_crc1_data_rmt          ),
  .o_crc2_rmt   (o_crc2_data_rmt          ),
  .o_crc3_rmt   (o_crc3_data_rmt          ),

  .o_crc0_gen   (o_crc0_data_gen          ),
  .o_crc1_gen   (o_crc1_data_gen          ),
  .o_crc2_gen   (o_crc2_data_gen          ),
  .o_crc3_gen   (o_crc3_data_gen          ),

  .o_sd_data_dir(sd4_data_dir             ),
  .i_sd_data    (i_sd_data                ),
  .o_sd_data    (sd4_data                 )
);
end
endgenerate

//asynchronous logic
/*
assign  phy_data_count= (write_flag)   ?  i_h2s_fifo_size << 2  :
                                          i_s2h_fifo_size << 2;
*/
assign  sd_mode       = SD_MODE;


assign  o_sd_data     = (SD_MODE) ?
                            FOUR_BIT_DATA ? sd4_data            :
                            sd1_data                            :
                          spi_data;
assign  o_sd_data_dir = (SD_MODE) ?
                            FOUR_BIT_DATA ? sd4_data_dir        :
                            sd1_data                            :
                          spi_data;


assign  spi_data[3]   = spi_cs_n;
assign  spi_data[7]   = spi_cs_n;
assign  spi_data[0]   = spi_mosi;
assign  spi_data[4]   = spi_mosi;
assign  spi_miso      = i_sd_cmd;
/*
assign  o_sd_cmd_dir  = ((state == IDLE)             ||
                         (state == SEND_COMMAND)     ||
                         (state == SEND_CRC));

*/

always @ (*) begin
  if (rst) begin
    data_h2s        = 0;
  end
  else begin
    case (byte_index)
      0: data_h2s   = i_h2s_fifo_data[7:0];
      1: data_h2s   = i_h2s_fifo_data[15:8];
      2: data_h2s   = i_h2s_fifo_data[23:16];
      3: data_h2s   = i_h2s_fifo_data[31:24];
    endcase
  end
end

//synchronous logic
always @ (posedge i_sd_clk) begin
  //De-assert Strobes
  o_h2s_fifo_stb                      <=  0;
  o_s2h_fifo_stb                      <=  0;
  o_read_wait                         <=  0;
  if (rst) begin
    count                             <=  0;
    write_flag                        <=  1;
    data_state                        <=  IDLE;
    o_data_txrx_finished              <=  0;
    byte_index                        <=  2'b11;
    //data_h2s                          <=  8'h00;
    total_byte_count                  <=  12'h000;
    data_txrx_en                      <=  0;
    o_h2s_fifo_activate               <=  0;
    o_s2h_fifo_activate               <=  0;
    o_sd_int_detected                 <=  0;
  end
  else begin

    if (!i_data_txrx_activate) begin
      if (!i_sd_data[1]) begin
        o_sd_int_detected   <=  1;
      end
    end
    else begin
      o_sd_int_detected     <=  0;
    end

    case (data_state)
      IDLE: begin
        o_data_txrx_finished          <=  0;
        data_txrx_en                  <=  0;
        byte_index                    <=  2'b11;
        total_byte_count              <=  0;
        write_flag                    <=  1;
        if (i_data_txrx_activate) begin
          if (i_data_write_flag) begin
            data_state                <=  SETUP_WRITE_FIFO;
          end
          else begin
            data_state                <=  SETUP_READ_FIFO;
          end
        end
      end
      SETUP_WRITE_FIFO: begin
        //Start Writing
        write_flag                <=  1;
        if (i_h2s_fifo_ready && !o_h2s_fifo_activate) begin
          o_h2s_fifo_activate     <=  1;
          count                   <=  0;
        end
        if (o_h2s_fifo_activate) begin
          //got a reference to a FIFO
          data_state              <=  WRITE_DATA;
          //data_h2s                <=  i_h2s_fifo_data[31:24];
          count                   <=  1;  //We already have the fist piece of data
          byte_index              <=  3;
          data_txrx_en            <=  1;
        end
      end
      SETUP_READ_FIFO: begin
        //Start Reading
        write_flag                <=  0;
        if ((i_s2h_fifo_ready > 0) && (o_s2h_fifo_activate == 0)) begin
          count                   <=  0;
          if (i_s2h_fifo_ready[0]) begin
            o_s2h_fifo_activate[0]<=  1;
          end
          else begin
            o_s2h_fifo_activate[1]<=  1;
          end
        end
        if (i_s2h_fifo_ready == 0) begin
          o_read_wait             <=  1;
        end
        if (o_s2h_fifo_activate > 0) begin
          //Got a reference to a FIFO
          data_state              <=  READ_DATA;
          data_txrx_en            <=  1;
        end
      end
      WRITE_DATA: begin
        if (data_byte_req_stb) begin
          total_byte_count            <=  total_byte_count + 1;
          byte_index                  <=  byte_index - 1;
          if (byte_index == 1) begin
              o_h2s_fifo_stb          <=  1;
          end
          if (byte_index == 0) begin
            byte_index                <=  2'h3;
            if (count < i_h2s_fifo_size) begin
              count                   <=  count + 1;
            end
            else begin
              data_state              <=  END_TRANSACTION;
            end
          end
        end
      end
      READ_DATA: begin
        if (count < i_data_byte_count) begin
          if (data_byte_req_stb) begin
            count                       <=  count + 1;
            total_byte_count            <=  total_byte_count + 1;
            byte_index                  <=  byte_index - 1;
            case (byte_index)
              0: begin
                o_s2h_fifo_data[7:0]    <=  data_s2h;
              end
              1: begin
                o_s2h_fifo_data[15:8]   <=  data_s2h;
              end
              2: begin
                o_s2h_fifo_data[23:16]  <=  data_s2h;
              end
              3: begin
                o_s2h_fifo_data[31:24]  <=  data_s2h;
              end
            endcase
            if (byte_index == 0) begin
              byte_index                <=  2'h3;
              o_s2h_fifo_stb            <=  1;
              if (count < i_s2h_fifo_size) begin
                count                   <=  count + 1;
              end
            end
          end
        end
        else begin
          data_state                    <=  END_TRANSACTION;
        end
      end
      END_TRANSACTION: begin
        //Deactivate any FIFOs
        o_s2h_fifo_activate     <=  0;
        o_h2s_fifo_activate     <=  0;
        data_txrx_en            <=  0;
        o_data_txrx_finished    <=  1;
      end
      FINISHED: begin
        o_data_txrx_finished    <=  1;
      end
      default: begin
      end
    endcase

    if (!i_data_txrx_activate) begin
      data_state                <=  IDLE;
    end
  end
end

always @ (posedge i_sd_clk) begin
  if (rst) begin
    state                 <=  IDLE;
    cmd_count             <=  0;
    spi_cs_n              <=  1;
    r_crc7                <=  0;
    rst_crc               <=  1;
    o_crc_err             <=  0;
    o_rsp_finished_en     <=  0;
    o_rsp                 <=  0;
    o_sd_cmd              <=  1;
    crc_en                <=  0;
    o_sd_cmd_dir          <=  1;
    o_gen_crc             <=  0;
    o_rmt_crc             <=  0;

  end
  else begin
    case (state)
      IDLE: begin
        o_sd_cmd_dir      <=  1;
        crc_en            <=  0;
        spi_cs_n          <=  1'b1;        //Disable SPI
        rst_crc           <=  1;
        o_crc_err         <=  0;
        o_rsp_finished_en <=  0;
        o_sd_cmd          <=  1;
        if (i_cmd_en) begin
          o_rsp           <=  0;
          rst_crc         <=  0;
          cmd_count       <=  0;
          cmd             <=  i_cmd;
          o_rmt_crc       <=  0;
          //$display("Command: %h", i_cmd);
          if (SD_MODE) begin
            //SD Mode
            state         <=  SEND_COMMAND;
          end
          else begin
            //SPI Mode
            state         <=  SEND_COMMAND;
            spi_cs_n      <=  0;
          end
        end
      end
      SEND_COMMAND: begin
        crc_en            <=  1;
        o_sd_cmd          <=  cmd[39];
        cmd               <=  {cmd[38:0], 1'b0};
        if (cmd_count < i_cmd_len) begin
          cmd_count       <=  cmd_count + 1;
        end
        else begin
          cmd_count       <=  0;
          state           <=  SEND_FIRST_CRC;
          cmd_count       <=  cmd_count + 1;


          r_crc7          <=  crc7;
          crc_en          <=  0;
        end
      end
      SEND_FIRST_CRC: begin
        state             <=  SEND_CRC;
        o_gen_crc         <=  {1'b0, crc7};
        cmd_count         <=  1;
        o_sd_cmd          <=  crc7[6];

        r_crc7            <=  {crc7[5:0], 1'b0};
        crc_en            <=  0;
      end
      SEND_CRC: begin
        o_sd_cmd          <=  r_crc7[6];
        r_crc7            <=  {r_crc7[5:0], 1'b0};
        if (cmd_count < 6) begin  //XXX: Should this be 5?
          cmd_count       <=  cmd_count + 1;
        end
        else begin
          rst_crc         <=  1;
          state           <=  FINISHED_COMMAND;
        end
      end
      FINISHED_COMMAND: begin
        o_sd_cmd_dir      <=  0;
        rst_crc           <=  0;
        o_sd_cmd          <=  1'b1;
        state             <=  WAIT_TRISTATE;
      end
      WAIT_TRISTATE: begin
        o_sd_cmd_dir      <=  0;
        rst_crc           <=  0;
        o_sd_cmd          <=  1'b1;
        state             <=  WAIT_FOR_RESPONSE;
      end
      WAIT_FOR_RESPONSE: begin
        if (i_sd_cmd    ==  1'b0) begin
          //Got a start of command
          cmd_count       <=  1;
          state           <=  READ_RESPONSE;
          crc_en          <=  1;
        end
      end
      READ_RESPONSE: begin
        o_rsp             <=  {o_rsp[134:0], i_sd_cmd};
        if (cmd_count < i_rsp_len) begin
          cmd_count       <=  cmd_count + 1;
        end
        else begin
          state           <=  READ_CRC;
          cmd_count       <=  0;
          crc_en          <=  0;
        end
      end
      READ_CRC: begin
        r_crc7            <=  {r_crc7[5:0], i_sd_cmd};
        if (cmd_count < 7) begin
          cmd_count       <=  cmd_count + 1;
        end
        else begin
          state           <=  CHECK_CRC;
        end
      end
      CHECK_CRC: begin
        o_gen_crc         <=  {1'b0, crc7};
        o_rmt_crc         <=  {1'b0, r_crc7};
        if (r_crc7 != crc7) begin
          o_crc_err       <=  1;
        end
        o_sd_cmd_dir      <=  1;
        o_sd_cmd          <=  1'b1;
        state             <=  FINISHED;
      end
      FINISHED: begin
        o_rsp_finished_en <=  1;
      end
      default: begin
        state             <=  IDLE;
      end
    endcase
    //Out of band break of command enable
    //This is done this way se we won't get stuck in a frozen state machine
    if (!i_cmd_en) begin
      state               <=  IDLE;
    end
  end
end

//Debug Stuff
assign      o_state       = state;
assign      o_data_state  = data_state;

endmodule
